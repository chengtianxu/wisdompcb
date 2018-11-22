unit Mainfrm_Mod086;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Datasnap.Provider, Data.Win.ADODB,
  Data.DB, Vcl.Menus, Vcl.XPMan, Datasnap.DBClient, Vcl.ExtCtrls,
  uBaseMainFrm, DBGridEhGrouping,ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,DBAxisGridsEh, DBGridEh ,uCommFunc,
  Bde.DBTables;
type
  TMainfrm_Mod86 = class(TfrmBaseMain)
    N_Add: TMenuItem;
    N_Edit: TMenuItem;
    N_Delete: TMenuItem;
    cdstemp: TClientDataSet;
    procedure N_AddClick(Sender: TObject);
    procedure N_EditClick(Sender: TObject);
    procedure N_DeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
  FDisplayFrm: TfrmBaseMain;
  procedure OnAfterModPost(Acds : TClientDataSet);
  procedure GetData(); override;
    { Public declarations }
  end;

var
  Mainfrm_Mod86: TMainfrm_Mod86;

implementation
  uses
  Editfrm_Mod86;
{$R *.dfm}
procedure TMainfrm_Mod86.GetData;
begin
 FMainFrmSql := cdsMain.CommandText;
 FOrderby := ' order by CATEGORY desc ';
 inherited;
end;

procedure TMainfrm_Mod86.N_AddClick(Sender: TObject);
begin
  inherited;
//   if not gFunc.CheckUserAuth(1,86) then Exit;
  Editfrm_Mod086 := TEditfrm_Mod086.Create(Self);
  try
  Editfrm_Mod086.Ftag := 1;
  Editfrm_Mod086.getdate('0');
  if Editfrm_Mod086.showmodal=mrok then
   begin
    btnRefreshClick(Sender);
    cdsMain.Last;
   end;
  finally
   Editfrm_Mod086.Free;
  end;
end;

procedure TMainfrm_Mod86.N_DeleteClick(Sender: TObject);
var
Lsql:string;
begin
  inherited;
  if  cdsMain.IsEmpty then Exit;

//  if not gfunc.CheckUserAuth(3, 86) then exit;

  if messagedlg('你确定要删除吗?删除后将不能恢复！',mtconfirmation,[mbyes,mbno],0) = mryes  then
  begin
   Lsql:='select * From data0061  where rkey ='+cdsmain.FieldByName('rkey').AsString;
   gSvrIntf.IntfGetDataBySql(Lsql,cdstemp);

   if not cdstemp.IsEmpty then
   cdstemp.Delete;

   if not gSvrintf.IntfPostDataByTable('data0061', cdstemp.Delta) then
   exit;

   btnRefreshClick(Sender);
  end;
  cdsMain.Delete;
 end;
procedure TMainfrm_Mod86.N_EditClick(Sender: TObject);
begin
  inherited;
//      if not gfunc.CheckUserAuth(2, 86) then exit;
  Editfrm_Mod086 := TEditfrm_Mod086.Create(Self);
 try
      Editfrm_Mod086.Ftag:=2;
     Editfrm_Mod086.getdate(cdsMain.FieldByName('rkey').AsString);
     Editfrm_Mod086.ded_code.Text := Editfrm_Mod086.cds_86.FieldByName('CATEGORY').AsString ;
     if Editfrm_Mod086.cds_86.FieldByName('TAX_FLAG').Value ='Y'  then
          Editfrm_Mod086.dcb_pro.Checked := True
     else
        Editfrm_Mod086.dcb_pro.Checked := False;
      if Editfrm_Mod086.cds_86.FieldByName('COMMISSION_FLAG').Value ='Y'  then
          Editfrm_Mod086.dcb_pur.Checked := True
      else
          Editfrm_Mod086.dcb_pur.Checked := False;
    Editfrm_Mod086.u_code1 :=  ehMain.DataSource.DataSet.FieldByName('CATEGORY').AsString;
//  if cdsMain.FieldValues['ptr_to_gl_acct']<>null then
//  begin
//   with Query1 do
//   begin
//    close;
//    sql.Text:='select rkey,gl_acc_number,GL_DESCRIPTION from data0103 '+
//              'where rkey='+cdsMain.FieldValues['ptr_to_gl_acct'].AsString;
//    open;
//    Editfrm_Mod086.RzButtonEdit1.Text:=Query1.FieldByName('gl_acc_number').AsString;
//    Editfrm_Mod086.RzButtonEdit1.Font.Color:=clwindowtext;
//    Editfrm_Mod086.Label1.Caption:='   '+Query1.FieldByName('GL_DESCRIPTION').AsString;
//   end;
//
//  end;
  if Editfrm_Mod086.showmodal=mrok then
  begin
  btnRefreshClick(Sender);
  cdsMain.Last;
  end;
 finally
  Editfrm_Mod086.Free;

 end;
end;

procedure TMainfrm_Mod86.OnAfterModPost(Acds: TClientDataSet);
begin
    btnRefreshClick(Self);
end;
end.
