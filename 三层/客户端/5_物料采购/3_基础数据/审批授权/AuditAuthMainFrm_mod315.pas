unit AuditAuthMainFrm_mod315;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseMainFrm, uCommFunc,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB,
  Vcl.XPMan, Vcl.Menus, Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls;

type
  TfrmMainAuditAuth_mod315 = class(TfrmBaseMain)
    btn_ReqAudit: TButton;
    btn_NoReqAudit: TButton;
    btn_PurAudit: TButton;
    btn_NoPurAudit: TButton;
    btn_Out: TButton;
    btn_NoOut: TButton;
    btn_DMtrl: TButton;
    btn_NoDMtrl: TButton;
    cdstemp: TClientDataSet;

    procedure btn_NoReqAuditClick(Sender: TObject);
    procedure btn_NoPurAuditClick(Sender: TObject);
    procedure btn_NoOutClick(Sender: TObject);
    procedure btn_NoDMtrlClick(Sender: TObject);

    procedure btn_ReqAuditClick(Sender: TObject);
    procedure btn_PurAuditClick(Sender: TObject);
    procedure btn_OutClick(Sender: TObject);
    procedure btn_DMtrlClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmMainAuditAuth_mod315: TfrmMainAuditAuth_mod315;

implementation
        uses SelUserFrm_mod315;
{$R *.dfm}

procedure TfrmMainAuditAuth_mod315.btn_OutClick(Sender: TObject);
var
  Lfrm: TfrmSelUser_mod315;
  Lsql: string;
begin
  inherited;

  Lsql:= 'SELECT user_full_name FROM Data0073 '+
        ' WHERE epiboly_ptr ='+gvar.rkey73+
        ' AND RKEY <>'+gvar.rkey73 ;

  if not  gSvrintf.IntfGetDataBySql(Lsql, cdsTemp) then exit;

  if not cdstemp.IsEmpty  then
  begin
  ShowMessage('对不起 '+trim(cdsTemp.FieldValues['user_full_name'])+'已经将请购单审批授权给您,您不可以再授权给其他人');
  exit;
  end;

  Lfrm := TfrmSelUser_mod315.Create(self);
  try
    Lsql:=' and rkey=epiboly_ptr  and epiboly_ptr<>'+gvar.rkey73 +' order by   USER_LOGIN_NAME' ;

    Lfrm.InitWithPickID(315,1,Lsql);
    if   Lfrm.showmodal=mrok then
     begin
      Lsql:='select epiboly_ptr  from data0073  where rkey='+gvar.rkey73 ;
        if not  gSvrintf.IntfGetDataBySql(Lsql, cdsTemp) then exit;
        if not cdstemp.IsEmpty then
        begin
         cdstemp.Edit;
         cdstemp.FieldByName('epiboly_ptr').Value:=Lfrm.cdsPick.FieldByName('rkey').AsInteger;
         cdstemp.Post;

        if   gSvrintf.IntfPostDataByTable('data0073', cdstemp.Delta) then
        begin
         ShowMessage('请购单审批授权操作成功');
         btn_Out.Enabled:=False;
         btn_NoOut.Enabled:=true;
        end;
       end;
     end;
  finally
    Lfrm.free;
  end;
end;

procedure TfrmMainAuditAuth_mod315.btn_NoOutClick(Sender: TObject);
var
Lsql:string;
begin
 inherited;

   LsqL:='select * From data0073  where rkey='+ gVar.rkey73;
   gSvrIntf.IntfGetDataBySql(Lsql,cdstemp);

   if not cdstemp.IsEmpty then
   begin
   cdstemp.Edit;
   cdstemp.FieldByName('epiboly_ptr').Value:=StrToInt(gVar.rkey73);
   cdstemp.Post;
   end;

  if gSvrIntf.IntfPostDataByTable('data0073',cdstemp.Delta) then
  begin
   messagedlg('取消成功!',mtinformation,[mbok],0);
   btn_NoOut.Enabled:=false;
   btn_out.Enabled:=true;

  end;
end;

procedure TfrmMainAuditAuth_mod315.btn_NoDMtrlClick(Sender: TObject);
var
Lsql:string;
begin
 inherited;

   LsqL:='select * From data0073  where rkey='+ gVar.rkey73;
   gSvrIntf.IntfGetDataBySql(Lsql,cdstemp);

   if not cdstemp.IsEmpty then
   begin
   cdstemp.Edit;
   cdstemp.FieldByName('draw_materiel_ptr').Value:=StrToInt(gVar.rkey73);
   cdstemp.Post;
   end;

  if gSvrIntf.IntfPostDataByTable('data0073',cdstemp.Delta) then
  begin
   messagedlg('取消成功!',mtinformation,[mbok],0);
   btn_DMtrl.Enabled:=false;
   btn_NoDMtrl.Enabled:=true;

  end;
end;

procedure TfrmMainAuditAuth_mod315.btn_DMtrlClick(Sender: TObject);
var
  Lfrm: TfrmSelUser_mod315;
  Lsql: string;
begin
  inherited;

  Lsql:= 'SELECT user_full_name FROM Data0073 '+
        ' WHERE draw_materiel_ptr ='+gvar.rkey73+
        ' AND RKEY <>'+gvar.rkey73 ;

  if not  gSvrintf.IntfGetDataBySql(Lsql, cdsTemp) then exit;

  if not cdstemp.IsEmpty  then
  begin
  ShowMessage('对不起 '+trim(cdsTemp.FieldValues['user_full_name'])+'已经将请购单审批授权给您,您不可以再授权给其他人');
  exit;
  end;

  Lfrm := TfrmSelUser_mod315.Create(self);
  try
    Lsql:=' and rkey=draw_materiel_ptr  and draw_materiel_ptr<>'+gvar.rkey73 +' order by   USER_LOGIN_NAME' ;

    Lfrm.InitWithPickID(315,1,Lsql);
    if   Lfrm.showmodal=mrok then
     begin
      Lsql:='select draw_materiel_ptr  from data0073  where rkey='+gvar.rkey73 ;
        if not  gSvrintf.IntfGetDataBySql(Lsql, cdsTemp) then exit;
        if not cdstemp.IsEmpty then
        begin
         cdstemp.Edit;
         cdstemp.FieldByName('draw_materiel_ptr').Value:=Lfrm.cdsPick.FieldByName('rkey').AsInteger;
         cdstemp.Post;

        if   gSvrintf.IntfPostDataByTable('data0073', cdstemp.Delta) then
        begin
         ShowMessage('请购单审批授权操作成功');
         btn_DMtrl.Enabled:=False;
         btn_NoDMtrl.Enabled:=true;
        end;
       end;
     end;
  finally
    Lfrm.free;
  end;
end;

procedure TfrmMainAuditAuth_mod315.btn_NoPurAuditClick(Sender: TObject);
var
Lsql:string;
begin
 inherited;
   LsqL:='select * From data0073  where rkey='+ gVar.rkey73;
   gSvrIntf.IntfGetDataBySql(Lsql,cdstemp);

   if not cdstemp.IsEmpty then
   begin
   cdstemp.Edit;
   cdstemp.FieldByName('rpl_po_ptr').Value:=StrToInt(gVar.rkey73);
   cdstemp.Post;
   end;

  if gSvrIntf.IntfPostDataByTable('data0073',cdstemp.Delta) then
  begin
   messagedlg('取消成功!',mtinformation,[mbok],0);
   btn_NoPurAudit.Enabled:=false;
   btn_PurAudit.Enabled:=true;

  end;
end;

procedure TfrmMainAuditAuth_mod315.btn_NoReqAuditClick(Sender: TObject);
var
Lsql:string;
begin
 inherited;

   LsqL:='select * From data0073  where rkey='+ gVar.rkey73;
   gSvrIntf.IntfGetDataBySql(Lsql,cdstemp);

   if not cdstemp.IsEmpty then
   begin
   cdstemp.Edit;
   cdstemp.FieldByName('rpl_pr_ptr').Value:=StrToInt(gVar.rkey73);
   cdstemp.Post;
   end;

  if gSvrIntf.IntfPostDataByTable('data0073',cdstemp.Delta) then
  begin
   messagedlg('取消成功!',mtinformation,[mbok],0);
   btn_NoReqAudit.Enabled:=false;
   btn_ReqAudit.Enabled:=true;

  end;

end;

procedure TfrmMainAuditAuth_mod315.btn_PurAuditClick(Sender: TObject);
var
  Lfrm: TfrmSelUser_mod315;
  Lsql: string;
begin
  inherited;

  Lsql:= 'SELECT user_full_name FROM Data0073 '+
        ' WHERE RPL_PO_PTR ='+gvar.rkey73+
        ' AND RKEY <>'+gvar.rkey73 ;

  if not  gSvrintf.IntfGetDataBySql(Lsql, cdsTemp) then exit;

  if not cdstemp.IsEmpty  then
  begin
  ShowMessage('对不起 '+trim(cdsTemp.FieldValues['user_full_name'])+'已经将请购单审批授权给您,您不可以再授权给其他人');
  exit;
  end;

  Lfrm := TfrmSelUser_mod315.Create(self);
  try
    Lsql:=' and rkey=RPL_PO_PTR  and RPL_PO_PTR<>'+gvar.rkey73 +' order by   USER_LOGIN_NAME' ;

    Lfrm.InitWithPickID(315,1,Lsql);
    if   Lfrm.showmodal=mrok then
     begin
      Lsql:='select RPL_PO_PTR  from data0073  where rkey='+gvar.rkey73 ;
        if not  gSvrintf.IntfGetDataBySql(Lsql, cdsTemp) then exit;
        if not cdstemp.IsEmpty then
        begin
         cdstemp.Edit;
         cdstemp.FieldByName('RPL_PO_PTR').Value:=Lfrm.cdsPick.FieldByName('rkey').AsInteger;
         cdstemp.Post;

        if   gSvrintf.IntfPostDataByTable('data0073', cdstemp.Delta) then
        begin
         ShowMessage('请购单审批授权操作成功');
         btn_PurAudit.Enabled:=False;
         btn_NoPurAudit.Enabled:=true;
        end;
       end;
     end;
  finally
    Lfrm.free;
  end;
end;

procedure TfrmMainAuditAuth_mod315.btn_ReqAuditClick(Sender: TObject);
var
  Lfrm: TfrmSelUser_mod315;
  Lsql: string;
begin
  inherited;

  Lsql:= 'SELECT user_full_name FROM Data0073 '+
        ' WHERE RPL_PR_PTR ='+gvar.rkey73+
        ' AND RKEY <>'+gvar.rkey73 ;

  if not  gSvrintf.IntfGetDataBySql(Lsql, cdsTemp) then exit;

  if not cdstemp.IsEmpty  then
  begin
  ShowMessage('对不起 '+trim(cdsTemp.FieldValues['user_full_name'])+'已经将请购单审批授权给您,您不可以再授权给其他人');
  exit;
  end;

  Lfrm := TfrmSelUser_mod315.Create(self);
  try
    Lsql:=' and rkey=rpl_pr_ptr  and RPL_PR_PTR<>'+gvar.rkey73 +' order by   USER_LOGIN_NAME' ;

    Lfrm.InitWithPickID(315,1,Lsql);
    if   Lfrm.showmodal=mrok then
     begin
      Lsql:='select rpl_pr_ptr  from data0073  where rkey='+gvar.rkey73 ;
        if not  gSvrintf.IntfGetDataBySql(Lsql, cdsTemp) then exit;
        if not cdstemp.IsEmpty then
        begin
         cdstemp.Edit;
         cdstemp.FieldByName('rpl_pr_ptr').Value:=Lfrm.cdsPick.FieldByName('rkey').AsInteger;
         cdstemp.Post;

        if   gSvrintf.IntfPostDataByTable('data0073', cdstemp.Delta) then
        begin
         ShowMessage('请购单审批授权操作成功');
         btn_ReqAudit.Enabled:=False;
         btn_NoReqAudit.Enabled:=true;
        end;
       end;
     end;
  finally
    Lfrm.free;
  end;
end;


procedure TfrmMainAuditAuth_mod315.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
     frmMainAuditAuth_mod315:=nil;
end;

procedure TfrmMainAuditAuth_mod315.FormCreate(Sender: TObject);
var
Lsql:string;
begin
  inherited;
   Lsql:='select  rkey,rpl_pr_ptr ,rpl_po_ptr,epiboly_ptr,draw_materiel_ptr  From Data0073 where rkey='+gvar.rkey73;

    if not gSvrintf.IntfGetDataBySql(Lsql, cdsTemp) then    Exit;

  if not cdstemp.IsEmpty then
  begin
   if cdstemp.FieldByName('rpl_pr_ptr').AsString<>gVar.rkey73 then
   begin
   btn_ReqAudit.Enabled:=False;
   btn_NoReqAudit.Enabled:=true;
   end
   else
   begin
    btn_ReqAudit.Enabled:=true;
    btn_NoReqAudit.Enabled:=false;
   end;

   if cdstemp.FieldByName('rpl_po_ptr').AsString<>gVar.rkey73 then
   begin
   btn_PurAudit.Enabled:=False;
   btn_NoPurAudit.Enabled:=true;
   end
   else
   begin
    btn_PurAudit.Enabled:=true;
    btn_NoPurAudit.Enabled:=false;
   end;

   if cdstemp.FieldByName('epiboly_ptr').AsString<>gVar.rkey73 then
   begin
   btn_Out.Enabled:=False;
   btn_NoOut.Enabled:=true;
   end
   else
   begin
   btn_Out.Enabled:=true;
   btn_NoOut.Enabled:=false;
   end;


   if cdstemp.FieldByName('draw_materiel_ptr').AsString<>gVar.rkey73 then
   begin
   btn_DMtrl.Enabled:=False;
   btn_NoDMtrl.Enabled:=true;
   end
   else
   begin
   btn_DMtrl.Enabled:=true;
   btn_NoDMtrl.Enabled:=false;
   end;

  end;
end;

end.
