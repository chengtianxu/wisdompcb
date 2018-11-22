unit PasAllPause;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB;

type
  TFrmAllPause = class(TForm)
    Panel5: TPanel;
    d34Rkey: TLabel;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    Panel2: TPanel;
    Label3: TLabel;
    Label7: TLabel;
    edtHour: TEdit;
    Label1: TLabel;
    Edit1: TEdit;
    procedure edtHourKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    SQLTxt:string;
  end;

var
  FrmAllPause: TFrmAllPause;

implementation

uses common,PasDM;

{$R *.dfm}

procedure TFrmAllPause.edtHourKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'.. '9',#8,#13,'-']) then Key:=#0;
  if (Key=#13) then BitBtn2.SetFocus;
end;

procedure TFrmAllPause.BitBtn2Click(Sender: TObject);
var Sqlstr2:string;
    tmpAdo:TADOQuery;
    i,iSum:Integer;
    dDate:TDateTime;
    sName05:string;
begin
  if (Trim(edtHour.Text)='') then
  begin
    ShowMsg('请确定暂停小时数！',1);
    Exit;
  end;
  if (Trim(Edit1.Text)='') then
  begin
    ShowMsg('暂停原因不能为空！',1);
    Exit;
  end;
  if (MessageBox(Handle,PAnsiChar('所有当前在线工序将会暂停【'+edtHour.Text+'】小时数,'+#13+' 确定全部工序暂停吗?'),'暂停全部工序提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO)	then exit;
  dDate:=getsystem_date(DM.tmp,0);
  dm.ADOQuery1.Close;
  dm.ADOQuery1.SQL.Text:= ' select data0117.*,data0005.employee_name from data0005,data0117 '+
           ' where data0117.source_type=2 and data0117.source_ptr='+DM.Ado587.FieldByName('RKey06').AsString+' and Action=16 and data0117.empl_ptr=data0005.rkey';
  DM.ADOQuery1.Open;
  sName05:=DM.ADOQuery1.FieldByName('employee_name').AsString;

  DM.Ado587.DisableControls;
  try
    screen.Cursor:=crHourGlass;
    Sqlstr2:='';
    if (not DM.Ado587.IsEmpty) then
    begin
        tmpAdo:=TADOQuery.Create(Application);
      try
        try
          tmpAdo.Connection:=DM.ADOConnection1;
          if not DM.ADOConnection1.InTransaction then
          DM.ADOConnection1.BeginTrans;
          iSum:=0;
          DM.Ado587.First;
          for i :=0  to DM.Ado587.RecordCount-1 do
          begin
            tmpAdo.Close;
            tmpAdo.SQL.Clear;
            tmpAdo.SQL.Text:='update dbo.data0056 set FLOW_NO=:FLOW_NO where WO_PTR=:WO_PTR';
            tmpAdo.Parameters.ParamByName('FLOW_NO').Value:=DM.Ado587.FieldByName('FLOW_NO').AsFloat+StrToFloat(edtHour.Text);
            tmpAdo.Parameters.ParamByName('WO_PTR').Value:=DM.Ado587.FieldByName('RKey06').AsString;
            tmpAdo.ExecSQL;
            dm.ADOQuery1.Close;
            dm.ADOQuery1.SQL.Text:=' insert into data0117(Source_ptr,Source_Type,NOTEPAD_PTR,Empl_ptr,Tdate,Action,Remark) '+
                    ' values ('+DM.Ado587.FieldByName('RKey06').AsString+',2,0,'+User_ptr+',getdate(),16,''===手动全部工序暂停于'
                    +datetimetostr(Ddate)+' 暂停:'+edtHour.Text+'小时 '+' 经由:'+sName05+'==='+#13+'暂停原因：'+Trim(Edit1.Text)+''')';
            dm.ADOQuery1.ExecSQL;
            iSum:=iSum+1;
            DM.Ado587.Next;
          end;
          DM.ADOConnection1.CommitTrans;
        except
          DM.ADOConnection1.RollbackTrans;
          ShowMsg('作业单暂停操作失败！',1);
          Exit;
        end;
        DM.Ado587.First;
      finally
        tmpAdo.Close;
        tmpAdo.Connection:=nil;
        tmpAdo.Free;
        tmpAdo:=nil;
      end;
    end;
  finally
    DM.Ado587.EnableControls;
  end;
  try
    Sqlstr2:='';
    DM.Ado587.DisableControls;
    DM.Ado587.Close;
    DM.Ado587.SQL.Text:=SQLTxt;
    DM.Ado587.Prepared;
    DM.Ado587.Open;
  finally
    DM.Ado587.EnableControls;
  end;
  screen.Cursor:=crDefault;
  if (iSum>0) then
  begin
    ShowMsg('工序批量暂停成功！',1);
  end;
  modalresult:=mrok;
end;

end.
