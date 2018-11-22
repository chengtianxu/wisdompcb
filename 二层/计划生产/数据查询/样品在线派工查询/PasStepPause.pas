unit PasStepPause;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB;

type
  TfrmStepPause = class(TForm)
    Panel5: TPanel;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label7: TLabel;
    edtHour: TEdit;
    d34Rkey: TLabel;
    Label8: TLabel;
    Edit6: TEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtHourKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmStepPause: TfrmStepPause;

implementation
uses common,PasDM;

{$R *.dfm}

procedure TfrmStepPause.BitBtn2Click(Sender: TObject);
var tmpAdo:TADOQuery;
    Ddate:TDateTime;
    sName05:string;
begin
  if (Trim(edtHour.Text)='') then
  begin
    ShowMsg('暂停小时数不能为空！',1);
    Exit;
  end;
  if (Trim(Edit6.Text)='') then
  begin
    ShowMsg('暂停原因不能为空！',1);
    Exit;
  end;
  Ddate:=getsystem_date(DM.tmp,0);
  if (MessageBox(Handle,PAnsiChar('作业单号【'+Edit1.Text+'】当前【'+Edit4.Text+'】工序将会'+#13+'暂停【'+edtHour.Text+'】小时, 确定暂停?'),'暂停作业单提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO)	then exit;
  dm.ADOQuery1.Close;
  dm.ADOQuery1.SQL.Text:= ' select data0117.*,data0005.employee_name from data0005,data0117 '+
           ' where data0117.source_type=2 and data0117.source_ptr='+IntToStr(Edit1.Tag)+' and Action=16 and data0117.empl_ptr=data0005.rkey';
  DM.ADOQuery1.Open;
  sName05:=DM.ADOQuery1.FieldByName('employee_name').AsString;

  tmpAdo:=TADOQuery.Create(Application);
  try
    try
      tmpAdo.Connection:=DM.ADOConnection1;
      if not DM.ADOConnection1.InTransaction then
        DM.ADOConnection1.BeginTrans;
      tmpAdo.Close;
      tmpAdo.SQL.Clear;
      tmpAdo.SQL.Text:='update dbo.data0056 set FLOW_NO=:FLOW_NO where WO_PTR=:WO_PTR and DEPT_PTR=:DEPT_PTR and STEP=:STEP';
      tmpAdo.Parameters.ParamByName('FLOW_NO').Value:=dm.Ado587FLOW_NO.AsFloat+strTOFloat(Trim(edtHour.Text));
      tmpAdo.Parameters.ParamByName('WO_PTR').Value:=Edit1.Tag;
      tmpAdo.Parameters.ParamByName('DEPT_PTR').Value:=d34Rkey.Caption;
      tmpAdo.Parameters.ParamByName('STEP').Value:=Edit5.Text;
      tmpAdo.ExecSQL;
      dm.ADOQuery1.Close;
      dm.ADOQuery1.SQL.Text:=' insert into data0117(Source_ptr,Source_Type,NOTEPAD_PTR,Empl_ptr,Tdate,Action,Remark) '+
              ' values ('+IntToStr(Edit1.Tag)+',2,0,'+User_ptr+',getdate(),16,''===手动单个工序暂停于'
              +datetimetostr(Ddate)+' 暂停:'+edtHour.Text+'小时 '+' 经由:'+sName05+'==='+#13+'暂停原因：'+Trim(Edit6.Text)+''')';
      dm.ADOQuery1.ExecSQL;
      DM.ADOConnection1.CommitTrans;
    except
      DM.ADOConnection1.RollbackTrans;
      ShowMsg('作业单暂停操作失败！',1);
      Exit;
    end;
    ShowMsg('作业单暂停成功！',1);
    modalresult:=mrok;
  finally
    tmpAdo.Close;
    tmpAdo.Connection:=nil;
    tmpAdo.Free;
    tmpAdo:=nil;
  end;

end;

procedure TfrmStepPause.FormShow(Sender: TObject);
begin
  edtHour.SetFocus;
end;

procedure TfrmStepPause.edtHourKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'.. '9',#8,#13,'-']) then Key:=#0;
end;

end.
