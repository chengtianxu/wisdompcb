unit MainFrm_Mod482;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan, Vcl.Menus,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls,uBaseMainFrm,uCommFunc;

type
  TAfterAppendEvent_Mod482 = procedure of object;
  TfrmMainFrm_Mod482 = class(TfrmBaseMain)
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    cdstemp: TClientDataSet;
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
  procedure GetData(); override;
    { Public declarations }
  end;

var
  frmMainFrm_Mod482: TfrmMainFrm_Mod482;

implementation
uses EditFrm_Mod482;


{$R *.dfm}

procedure TfrmMainFrm_Mod482.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmMainFrm_Mod482:=nil;
end;

procedure TfrmMainFrm_Mod482.N1Click(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(1,482) then Exit;
  frmEdiFrm_Mod482 := TfrmEdiFrm_Mod482.Create(Self);
  try
  frmEdiFrm_Mod482.FEditType:=1;
  frmEdiFrm_Mod482.getData('-1');

  frmEdiFrm_Mod482.pnl2.Enabled:=true;
  frmEdiFrm_Mod482.btnsave.enabled:=true;
  frmEdiFrm_Mod482.btnclose.enabled:=true;
  frmEdiFrm_Mod482.edt_sufchar.Text :='0001';
  if frmEdiFrm_Mod482.showmodal=mrok then
   begin
    btnRefreshClick(Sender);
    cdsMain.Last;
   end;
  finally
   frmEdiFrm_Mod482.Free;
  end;

end;

procedure TfrmMainFrm_Mod482.N2Click(Sender: TObject);
begin
  inherited;
  if not gfunc.CheckUserAuth(2, 482) then exit;
  frmEdiFrm_Mod482 := TfrmEdiFrm_Mod482.Create(Self);
  try

  frmEdiFrm_Mod482.FEditType:=2;
  frmEdiFrm_Mod482.getData(cdsMain.FieldByName('rkey').AsString);

  frmEdiFrm_Mod482.pnl2.Enabled:=true;
  frmEdiFrm_Mod482.btnsave.enabled:=true;
  frmEdiFrm_Mod482.btnclose.enabled:=true;
  frmEdiFrm_Mod482.btnclose.enabled:=true;
  frmEdiFrm_Mod482.edt_layers.Text:=cdsMain.FieldByName('layers').AsString;
  frmEdiFrm_Mod482.edt_sufchar.Text:=cdsMain.FieldByName('sufchar').AsString;

  if frmEdiFrm_Mod482.showmodal=mrok then
  begin
  btnRefreshClick(Sender);
  cdsMain.Last;
  end;
  finally
  frmEdiFrm_Mod482.Free;
end;
end;





procedure TfrmMainFrm_Mod482.N3Click(Sender: TObject);
var
Lsql:string;
begin
  inherited;
  if  cdsMain.IsEmpty then Exit;

  if not gfunc.CheckUserAuth(3, 482) then exit;

  if messagedlg('你确定要删除吗?删除后将不能恢复！',mtconfirmation,[mbyes,mbno],0) = mryes  then
  begin
   Lsql:='select * From data0081  where rkey ='+cdsmain.FieldByName('rkey').AsString;
   gSvrIntf.IntfGetDataBySql(Lsql,cdsTemp);

   if not cdsTemp.IsEmpty then
   cdsTemp.Delete;

   if not gSvrintf.IntfPostDataByTable('data0081', cdsTemp.Delta) then
   exit;

   btnRefreshClick(Sender);
  end;
end;

procedure TfrmMainFrm_Mod482.GetData;
var
Lsql75:string;
begin

  try
    FMainFrmSql :=
      ' select rkey,layers,sufchar from data0081'+
     ' where 1=1 ';

//     if trim(FMainWhere) = '' then
//     FMainWhere := ' and bud_year= '+inttostr(yearof(gFunc.GetSvrDateTime)) ;

    FOrderby := ' order by layers  ';

    inherited;

  except on e:Exception do
  begin
  ShowMessage('错误：'+e.Message);
  exit;
  end;

  end;
end;

end.
