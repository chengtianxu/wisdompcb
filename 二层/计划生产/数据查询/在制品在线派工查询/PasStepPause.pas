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
uses common,PasPublic, pasOnlineQuery, PasDM;

{$R *.dfm}

procedure TfrmStepPause.BitBtn2Click(Sender: TObject);
var tmpAdo:TADOQuery;
begin
  if (Trim(edtHour.Text)='') then
  begin
    ShowMsg('暂停小时数不能为空！',1);
    Exit;
  end;
  if (MessageBox(Handle,PAnsiChar('作业单号【'+Edit1.Text+'】当前【'+Edit4.Text+'】工序将会'+#13+'暂停【'+edtHour.Text+'】小时, 确定暂停?'),'暂停作业单提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO)	then exit;
  try
    tmpAdo:=TADOQuery.Create(Application);
    tmpAdo.Connection:=DM.ADOConnection1;
    tmpAdo.Close;
    tmpAdo.SQL.Clear;
    tmpAdo.SQL.Text:='update dbo.data0056 set FLOW_NO=:FLOW_NO where WO_PTR=:WO_PTR and DEPT_PTR=:DEPT_PTR and STEP=:STEP';
    tmpAdo.Parameters.ParamByName('FLOW_NO').Value:=edtHour.Text;
    tmpAdo.Parameters.ParamByName('WO_PTR').Value:=GetDataRkey('dbo.data0006','WORK_ORDER_NUMBER',Edit1.Text,DM.ADOConnection1,'');
    tmpAdo.Parameters.ParamByName('DEPT_PTR').Value:=d34Rkey.Caption;
    tmpAdo.Parameters.ParamByName('STEP').Value:=Edit5.Text;
    tmpAdo.ExecSQL;
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
  d34Rkey.Caption:=FrmOnlineQuery.DBGridEh1.DataSource.DataSet.FieldValues['DEPT_PTR'];
  Edit1.Text:=FrmOnlineQuery.DBGridEh1.DataSource.DataSet.FieldValues['WORK_ORDER_NUMBER'];
  Edit2.Text:=FrmOnlineQuery.DBGridEh1.DataSource.DataSet.FieldValues['MANU_PART_NUMBER'];
  Edit3.Text:=FrmOnlineQuery.DBGridEh1.DataSource.DataSet.FieldValues['DEPT_CODE'];
  Edit4.Text:=FrmOnlineQuery.DBGridEh1.DataSource.DataSet.FieldValues['DEPT_NAME'];
  Edit5.Text:=FrmOnlineQuery.DBGridEh1.DataSource.DataSet.FieldValues['STEP'];
  edtHour.SetFocus;
end;

procedure TfrmStepPause.edtHourKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'.. '9',#8,#13]) then Key:=#0;
end;

end.
