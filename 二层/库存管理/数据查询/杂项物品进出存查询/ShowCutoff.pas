unit ShowCutoff;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, DB, Grids, DBGridEh,
  Menus;

type
  TfrmShowCutoff = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    DBGridEh1: TDBGridEh;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N3Click(Sender: TObject);
    procedure dtpk1Change(Sender: TObject);
    procedure dtpk2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmShowCutoff: TfrmShowCutoff;

implementation

uses damo,common, PasQueryCutoff;

{$R *.dfm}

procedure TfrmShowCutoff.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmShowCutoff.FormShow(Sender: TObject);
begin
  dtpk1.DateTime:=StrToDateTime(DateToStr(getsystem_date(dm.ADOQuery1,1)-30)+' 0:00:00');
  dtpk2.DateTime:=StrToDateTime(DateToStr(getsystem_date(dm.ADOQuery1,1))+' 0:00:00');
  DM.AdoQry255.Close;
  dm.AdoQry255.Parameters.ParamByName('CutoffDate1').Value:=StrToDateTime(FormatDateTime('yyyy-MM-dd',dtpk1.DateTime)+' 0:00:00');
  dm.AdoQry255.Parameters.ParamByName('CutoffDate2').Value:=StrToDateTime(FormatDateTime('yyyy-MM-dd',dtpk2.DateTime)+' 23:59:59');
  DM.AdoQry255.Open;
end;

procedure TfrmShowCutoff.N1Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    exit;
  end
  else
  begin
    if Application.MessageBox('确认要删除截数吗?', PChar('操作提示'),MB_YESNO)=6 then
    begin
      if dm.AdoQry255Operator05.AsString<>user_ptr then
      begin
        MessageDlg('必须由截数人进行删除操作!',mtInformation,[mbok],1);
        Exit;
      end;
      with dm.ADOQuery1 do
      begin
        Close;
        SQL.Clear;
        sql.Add('select * from data0255 where CutoffDate>'+QuotedStr(dm.AdoQry255CutoffDate.AsString));
        Open;
      end;
      if not dm.ADOQuery1.IsEmpty then
      begin
        MessageDlg('有相关截数时间大于此截数,不能进行删除操作!',mtInformation,[mbok],1);
        Exit;
      end;
      dm.ADOConnection1.BeginTrans;
      try
        with dm.ADOQuery1 do
        begin
          close;
          sql.Text:='delete from data0255 where CutoffDate='''+dm.AdoQry255CutoffDate.AsString+'''';
          ExecSQL;
        end;
        dm.ADOConnection1.CommitTrans;
        dm.AdoQry255.Close;
        dm.AdoQry255.Parameters.ParamByName('CutoffDate1').Value:=StrToDateTime(FormatDateTime('yyyy-MM-dd',dtpk1.DateTime)+' 0:00:00');
        dm.AdoQry255.Parameters.ParamByName('CutoffDate2').Value:=StrToDateTime(FormatDateTime('yyyy-MM-dd',dtpk2.DateTime)+' 23:59:59');
        dm.AdoQry255.Open;
        showmsg('成功删除截数!',1);
      except
        on E:Exception do
        begin
          dm.ADOConnection1.RollbackTrans;
          messagedlg(E.Message,mterror,[mbcancel],0);
        end;
      end;
    end;
  end;
end;

procedure TfrmShowCutoff.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='S') and (ssalt in shift) then
    showmessage(DM.AdoQry255.SQL.Text);
end;

procedure TfrmShowCutoff.N3Click(Sender: TObject);
begin
  frmQueryCutoff:=TfrmQueryCutoff.Create(nil);
  frmQueryCutoff.ShowModal;
  frmQueryCutoff.Free ;
{  dm.AdoQry255.Close;
  dm.AdoQry255.Parameters.ParamByName('CutoffDate1').Value:=StrToDateTime(FormatDateTime('yyyy-MM-dd',dtpk1.DateTime)+' 0:00:00');
  dm.AdoQry255.Parameters.ParamByName('CutoffDate2').Value:=StrToDateTime(FormatDateTime('yyyy-MM-dd',dtpk2.DateTime)+' 23:59:59');
  dm.AdoQry255.Open;
}
end;

procedure TfrmShowCutoff.dtpk1Change(Sender: TObject);
begin
  dm.AdoQry255.Close;
  dm.AdoQry255.Parameters.ParamByName('CutoffDate1').Value:=StrToDateTime(FormatDateTime('yyyy-MM-dd',dtpk1.DateTime)+' 0:00:00');
  dm.AdoQry255.Parameters.ParamByName('CutoffDate2').Value:=StrToDateTime(FormatDateTime('yyyy-MM-dd',dtpk2.DateTime)+' 23:59:59');
  dm.AdoQry255.Open;
end;

procedure TfrmShowCutoff.dtpk2Change(Sender: TObject);
begin
  dm.AdoQry255.Close;
  dm.AdoQry255.Parameters.ParamByName('CutoffDate1').Value:=StrToDateTime(FormatDateTime('yyyy-MM-dd',dtpk1.DateTime)+' 0:00:00');
  dm.AdoQry255.Parameters.ParamByName('CutoffDate2').Value:=StrToDateTime(FormatDateTime('yyyy-MM-dd',dtpk2.DateTime)+' 23:59:59');
  dm.AdoQry255.Open;
end;

end.
