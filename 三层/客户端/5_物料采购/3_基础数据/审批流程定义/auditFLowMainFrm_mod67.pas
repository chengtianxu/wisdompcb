unit auditFLowMainFrm_mod67;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseMainFrm, uCommFunc,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB,
  Vcl.XPMan, Vcl.Menus, Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls, Data.Win.ADODB,editFrm_mod67
;

type
  TfrmMainAuditFLow_mod67 = class(TfrmBaseMain)
    eh275: TDBGridEh;
    ds275: TDataSource;
    cds275: TClientDataSet;
    cdsTemp: TClientDataSet;
    qrytemp: TADOQuery;
    qrytempLOWER_LIMIT: TFloatField;
    qrytempUPPER_LIMIT: TFloatField;
    qrytempUSER_FULL_NAME: TStringField;
    qrytempUSER_LOGIN_NAME: TStringField;
    qrytempACTIVE_FLAG: TStringField;
    mniAdd: TMenuItem;
    mniEdit: TMenuItem;
    mniCopy: TMenuItem;
    mniCheck: TMenuItem;
    mniDel: TMenuItem;
    mniDepOEmp: TMenuItem;
    procedure cdsMainAfterScroll(DataSet: TDataSet);
    procedure mniAddClick(Sender: TObject);
    procedure btnQryClick(Sender: TObject);
    procedure mniEditClick(Sender: TObject);
    procedure mniCheckClick(Sender: TObject);
    procedure mniCopyClick(Sender: TObject);
    procedure mniDelClick(Sender: TObject);
    procedure mniDepOEmpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
     procedure GetData(); override;
  end;

var
  frmMainAuditFLow_mod67: TfrmMainAuditFLow_mod67;

implementation

{$R *.dfm}

procedure TfrmMainAuditFLow_mod67.btnQryClick(Sender: TObject);
begin
 FMainWhereID:=0;
  inherited;

end;

procedure TfrmMainAuditFLow_mod67.cdsMainAfterScroll(DataSet: TDataSet);
begin
  inherited;
    if cdsMain.FieldByName('rkey').AsString = '' then
  begin
    gSvrintf.IntfGetDataBySql(cds275.CommandText +
      ' and dbo.data0275.auth_group_ptr=-1', cds275);
    exit;
  end;
  gSvrintf.IntfGetDataBySql(cds275.CommandText + ' and dbo.data0275.auth_group_ptr=' +
    cdsMain.FieldByName('rkey').AsString, cds275);
end;

procedure TfrmMainAuditFLow_mod67.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    frmMainAuditFLow_mod67:=nil;
end;

procedure TfrmMainAuditFLow_mod67.GetData;
var
Lsql94,Lsql275:string;
begin

  try
    FMainFrmSql :=
      ' SELECT    dbo.Data0094.RKEY, dbo.Data0094.CODE, dbo.Data0094.PURCHASE_APPROV_DESC, '+
      ' dbo.Data0094.dept_ptr, dbo.Data0094.mode,'+
      ' dbo.Data0094.type, dbo.Data0034.DEPT_CODE, dbo.Data0034.DEPT_NAME,'+
      ' case  when Data0094.type=0 then ''请购审批'''+
      '          when Data0094.type=1 then ''外发审批'''+
      '          when Data0094.type=2 then ''领料审批'' end type_c'+
     ' FROM   dbo.Data0094 INNER JOIN  dbo.Data0034 ON dbo.Data0094.dept_ptr = dbo.Data0034.RKEY'+
     ' where 1=1 ';

//     if trim(FMainWhere) = '' then
//     FMainWhere := ' and bud_year= '+inttostr(yearof(gFunc.GetSvrDateTime)) ;

    FOrderby := ' order by  data0094.rkey  ';
    // showmessage(FMainFrmSql+FMainWhere+FOrderby);
    inherited;
    if cdsMain.FieldByName('rkey').AsString = '' then
    begin
      gSvrintf.IntfGetDataBySql(cds275.CommandText +
        ' and dbo.data0363.BUDGET_PTR=-1', cds275);
      exit;
    end;


  except on e:Exception do
  begin
  ShowMessage('错误：'+e.Message);
  exit;
  end;

  end;
end;

procedure TfrmMainAuditFLow_mod67.mniCheckClick(Sender: TObject);
var
Lfrm: Tfrmedit_mod67;
Lrkey:integer;
begin
  inherited;
  Lrkey:=cdsMain.FieldByName('rkey').AsInteger;

  LFrm:=Tfrmedit_mod67.Create(self);
  try

  Lfrm.FEditType:=3;
  Lfrm.getData(cdsMain.FieldByName('rkey').Asstring);
  Lfrm.rg_Type.ItemIndex:=cdsMain.FieldByName('type').AsInteger;
  Lfrm.rg_method.ItemIndex:=cdsMain.FieldByName('mode').AsInteger;

  Lfrm.pnl3.Enabled:=false;
  Lfrm.eh275.Enabled:=false;
  Lfrm.btnsave.enabled:=false;
  Lfrm.btnclose.enabled:=true;

  if  Lfrm.showmodal=mrok then
  begin
   btnRefreshClick(Sender);
  cdsMain.Locate('rkey',Lrkey,[]);
  end;

  finally
   Lfrm.Free;
  end;
end;

procedure TfrmMainAuditFLow_mod67.mniCopyClick(Sender: TObject);
var
Lfrm: Tfrmedit_mod67;
begin
  inherited;

  LFrm:=Tfrmedit_mod67.Create(self);
  try
  Lfrm.rg_Type.ItemIndex:=-1;
  Lfrm.rg_method.ItemIndex:=-1;

  Lfrm.FEditType:=4;
  Lfrm.getData(cdsMain.FieldByName('rkey').Asstring);
  Lfrm.rg_Type.ItemIndex:=cdsMain.FieldByName('type').AsInteger;
  Lfrm.rg_method.ItemIndex:=cdsMain.FieldByName('mode').AsInteger;
  Lfrm.edt_ACode.Text:='';

  Lfrm.pnl3.Enabled:=true;
  Lfrm.eh275.Enabled:=true;

  Lfrm.btnsave.enabled:=true;
  Lfrm.btnclose.enabled:=true;
  if Lfrm.showmodal=mrok then
   begin
   btnRefreshClick(Sender);
   cdsMain.last;
   end;
  finally
   Lfrm.Free;
  end;
end;

procedure TfrmMainAuditFLow_mod67.mniDelClick(Sender: TObject);
var
Lsql:string;

begin
  inherited;
   if not gfunc.CheckUserAuth(2, 25) then exit;

   if cdsMain.IsEmpty then   exit;
    Lsql:='select * from data0094 where rkey='+cdsMain.FieldByName('rkey').AsString;

   gSvrIntf.IntfGetDataBySql(Lsql,cdsTemp);

  if not cdsTemp.IsEmpty then
    cdsTemp.Delete;

  if not gSvrintf.IntfPostDataByTable('data0094', cdsTemp.Delta) then
    exit;

  btnRefreshClick(Sender);
end;

procedure TfrmMainAuditFLow_mod67.mniDepOEmpClick(Sender: TObject);
var
 Lsql:string;
 Lrkey: integer;
 begin
  inherited;
 if not gfunc.CheckUserAuth(2, 25) then exit;

 Lrkey:=cdsMain.FieldByName('rkey').Asinteger;

 Lsql:='select  * from data0275  '+
       ' where  data0275.AUTH_GROUP_PTR='+cdsMain.FieldByName('rkey').AsString+
       ' and exists(select RKEY from Data0073 d73 where d73.RKEY=Data0275.USER_PTR and active_flag=1 ) ';

   gSvrIntf.IntfGetDataBySql(Lsql,cdsTemp);

  if not cdstemp.isempty  then
  begin
  cdsTemp.first;
  while  not cdsTemp.eof do
  cdsTemp.Delete;
  if not gSvrintf.IntfPostDataByTable('data0275', cdstemp.Delta) then  exit;
  btnRefreshClick(Sender);
   cdsmain.Locate('rkey',Lrkey,[]) ;
  end;
end;


procedure TfrmMainAuditFLow_mod67.mniEditClick(Sender: TObject);
var
Lfrm: Tfrmedit_mod67;
 Lrkey:integer;
begin
  inherited;
  Lrkey:=cdsMain.FieldByName('rkey').asinteger;
  LFrm:=Tfrmedit_mod67.Create(self);
  try

  Lfrm.FEditType:=2;
  Lfrm.getData(cdsMain.FieldByName('rkey').Asstring);
  Lfrm.rg_Type.ItemIndex:=cdsMain.FieldByName('type').AsInteger;
  Lfrm.rg_method.ItemIndex:=cdsMain.FieldByName('mode').AsInteger;

  Lfrm.pnl3.Enabled:=true;
  Lfrm.eh275.Enabled:=true;

  Lfrm.btnsave.enabled:=true;
  Lfrm.btnclose.enabled:=true;

  if Lfrm.showmodal=mrok then
  begin
    btnRefreshClick(Sender);
   cdsmain.Locate('rkey',Lrkey,[]) ;
  end;

  finally
   Lfrm.Free;
  end;
end;

procedure TfrmMainAuditFLow_mod67.mniAddClick(Sender: TObject);
var
Lfrm: Tfrmedit_mod67;
begin
  inherited;

  LFrm:=Tfrmedit_mod67.Create(self);
  try
  Lfrm.rg_Type.ItemIndex:=-1;
  Lfrm.rg_method.ItemIndex:=0;

  Lfrm.FEditType:=1;
  Lfrm.getData('-1');

  Lfrm.pnl3.Enabled:=true;
  Lfrm.eh275.Enabled:=true;

  Lfrm.btnsave.enabled:=true;
  Lfrm.btnclose.enabled:=true;

  if Lfrm.showmodal=mrok then
   begin
    btnRefreshClick(Sender);
    cdsMain.Last;
   end;
  finally
   Lfrm.Free;
  end;
end;

end.

