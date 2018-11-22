unit PasCutoff;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TfrmCutoff = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    Edit1: TEdit;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
   function getUserName(Rkey:string):string;
  public
    { Public declarations }
  end;

var
  frmCutoff: TfrmCutoff;

implementation
uses common, damo;
{$R *.dfm}
function TfrmCutoff.getUserName(Rkey:string):string;
begin
  dm.ADOQuery1.close;
  dm.ADOQuery1.sql.clear;
  dm.ADOQuery1.SQL.Text:='select * from dbo.data0005 where RKey='+Rkey;
  dm.ADOQuery1.Open;
  if not dm.ADOQuery1.IsEmpty then Result:=dm.ADOQuery1.FieldValues['EMPLOYEE_NAME'] else Result:='-1';
end;

procedure TfrmCutoff.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmCutoff.FormShow(Sender: TObject);
begin
  DateTimePicker1.DateTime:=StrToDateTime(DateToStr(getsystem_date(dm.ADOQuery1,1))+' 0:00:00');
  DateTimePicker1.Enabled:=False;
  Edit1.Text:=getUserName(user_ptr);
end;

procedure TfrmCutoff.BitBtn1Click(Sender: TObject);
begin
  if MessageBox(Handle,'确定要添加该时间段的截数记录吗?','操作提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
  dm.AdoCutoff.Close;
  dm.AdoCutoff.Open;
  if Not dm.AdoCutoff.IsEmpty then
  begin
    dm.ADOQuery1.Close;
    dm.ADOQuery1.SQL.Clear;
    dm.ADOQuery1.SQL.Text:='select * from dbo.data0255 where CutoffDate=:CutoffDate';
    dm.ADOQuery1.Parameters.ParamByName('CutoffDate').Value:=StrToDate(formatdatetime('yyyy-MM-dd',DateTimePicker1.DateTime));
    dm.ADOQuery1.Open;
    if not dm.ADOQuery1.IsEmpty then
    begin
      if MessageBox(Handle,'该时间段已存在截数记录是否重新保存截数库存?','操作提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
      dm.ADOQuery1.Close;
      dm.ADOQuery1.SQL.Clear;
      dm.ADOQuery1.SQL.Text:='delete dbo.data0255 where CutoffDate=:CutoffDate';
      dm.ADOQuery1.Parameters.ParamByName('CutoffDate').Value:=StrToDate(formatdatetime('yyyy-MM-dd',DateTimePicker1.DateTime));
      dm.ADOQuery1.ExecSQL;
    end;
    dm.Ado255.Close;
    dm.Ado255.Open;
    dm.Ado255.Append;
    dm.Ado255CutoffDate.Value:=StrToDate(formatdatetime('yyyy-MM-dd',DateTimePicker1.DateTime));
    dm.Ado255Operator05.Value:=StrToInt(user_ptr);
    dm.Ado255OperatorDate.Value:=Now;
    dm.Ado255.Post;
    dm.ADOConnection1.BeginTrans;
    try
      dm.ADOQuery1.Close;//再增加子表(明细)
      dm.ADOQuery1.SQL.Clear;
      dm.ADOQuery1.SQL.Text:='insert into data0256(CutoffDate,Rkey235,Stock) SELECT '''+formatdatetime('yyyy-MM-dd',DateTimePicker1.DateTime)+''',dbo.Data0235.RKey,dbo.Data0235.QUAN_ON_HAND'
                    +' FROM dbo.Data0002 INNER JOIN'
                    +'  dbo.Data0235 ON dbo.Data0002.RKEY = dbo.Data0235.unit_ptr INNER JOIN'
                    +'  dbo.Data0456 ON dbo.Data0235.GRN_PTR = dbo.Data0456.RKEY INNER JOIN'
                    +'  dbo.Data0015 ON dbo.Data0456.warehouse_ptr = dbo.Data0015.RKEY INNER JOIN'
                    +'  dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY INNER JOIN'
                    +'  dbo.Data0001 ON dbo.Data0001.RKEY = dbo.Data0456.currency_ptr INNER JOIN'
                    +'  dbo.Data0016 ON dbo.Data0235.location_ptr = dbo.Data0016.RKEY LEFT  JOIN'
                    +'  dbo.Data0070 ON dbo.Data0456.PO_PTR = dbo.Data0070.RKEY'
                    +' WHERE (dbo.Data0235.QUAN_ON_HAND > 0)';

      dm.ADOQuery1.ExecSQL;
      dm.ADOConnection1.CommitTrans;
      showmsg('截数成功!',1);
      dm.Ado255.Close;
      dm.Ado255.Open;
    except
    on E:Exception do
    begin
      dm.ADOConnection1.RollbackTrans;
      messagedlg(E.Message,mterror,[mbcancel],0);
    end;
    end;
  end else
  begin
    ShowMessage('该时间段没有杂项库存记录！');
  end;
end;

end.
