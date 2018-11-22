unit UMainfrm_Mod38SendInfoForSafeQty;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseFrm, Vcl.ExtCtrls, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,
  DBGridEh, Data.DB, Datasnap.DBClient, Data.Win.ADODB,uCommFunc, Vcl.Menus;

type
  TfrmMain_Mod38SendInfoForSafeQty = class(TfrmBase)
    pnl1: TPanel;
    eh21: TDBGridEh;
    ds21: TDataSource;
    cds21: TClientDataSet;
    qry1: TADOQuery;
    strngfldqry1材料组别代码: TStringField;
    strngfldqry1用户代码: TStringField;
    strngfldqry1用户名称: TStringField;
    qry1inv_group_desc: TStringField;
    pmDel: TPopupMenu;
    cdsSave21: TClientDataSet;
    mniDel: TMenuItem;
    mniN1: TMenuItem;
    procedure eh21Columns0EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure eh21Columns1EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure mniDelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }

     procedure RefreshData;

  public
    { Public declarations }
    procedure GetData;
  end;

var
  frmMain_Mod38SendInfoForSafeQty: TfrmMain_Mod38SendInfoForSafeQty;

implementation
      uses uBaseSinglePickListFrm;
{$R *.dfm}

{ TfrmMain_Mod38SendInfoForSafeQty }

procedure TfrmMain_Mod38SendInfoForSafeQty.eh21Columns0EditButtons0Click(
  Sender: TObject; var Handled: Boolean);
var
lFrm: TfrmSinglePickList;

begin
  inherited;

    if (cds21.FieldByName('用户代码').Value<>null)  and (cds21.FieldByName('材料组别代码').Value<>null)then
     begin
      showmessage('不能修改，请删掉重新增加。');
      exit;
     end;


   lFrm:=TfrmSinglePickList.Create(self);
  try
   lFrm.InitWithPickID(38,5);
   if lFrm.ShowModal=mrok then
   begin
   cds21.edit;
   cds21.FieldByName('材料组别代码').Value:=lfrm.cdsPick.FieldByName('inv_group_name').Value;
   cds21.Post;
   end;



  finally
   lFrm.Free;
  end;




end;

procedure TfrmMain_Mod38SendInfoForSafeQty.eh21Columns1EditButtons0Click(
  Sender: TObject; var Handled: Boolean);
var
lFrm: TfrmSinglePickList;
begin
  inherited;
   if (cds21.FieldByName('材料组别代码').Value='') then
     begin
       ShowMessage('请先选择材料组别！' );
       Exit;
     end;

     if (cds21.FieldByName('用户代码').Value<>null)  and (cds21.FieldByName('材料组别代码').Value<>null)then
     begin
      showmessage('不能修改，请删掉重新增加。');
      exit;
     end;

 lFrm:=TfrmSinglePickList.Create(self);
  try

   lFrm.InitWithPickID(38,6);
   if lFrm.ShowModal=mrok then
   begin
   cds21.FieldByName('用户名称').ReadOnly:=false;
   cds21.edit;
   cds21.FieldByName('用户代码').Value:=lfrm.cdsPick.FieldByName('USER_LOGIN_NAME').Value;
   cds21.FieldByName('用户名称').Value:=lfrm.cdsPick.FieldByName('USER_FULL_NAME').Value;
   cds21.Post;
   cds21.FieldByName('用户名称').ReadOnly:=true;



   gSvrIntf.IntfGetDataBySql('select * from data0021 where 1=0 ',cdsSave21);

   cdsSave21.Append;
   cdsSave21.FieldByName('USER_LOGIN_NAME').Value:=cds21.FieldByName('用户代码').Value;
   cdsSave21.FieldByName('GROUP_NAME').Value:= cds21.FieldByName('材料组别代码').Value;
   cdsSave21.Post;

   if  gSvrIntf.IntfPostDataByTable('data0021',cdsSave21.Delta)  then
     self.RefreshData;

   end;

  finally
   lFrm.Free;
  end;
end;

procedure TfrmMain_Mod38SendInfoForSafeQty.FormActivate(Sender: TObject);
begin
  inherited;

  GetData;

end;

procedure TfrmMain_Mod38SendInfoForSafeQty.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
 //  pnl1.Visible := False;
Action:= caFree;
frmMain_Mod38SendInfoForSafeQty:=nil;

end;

procedure TfrmMain_Mod38SendInfoForSafeQty.GetData;
var
Lsql: string;
begin
//
  Lsql:='select data0021.GROUP_NAME as 材料组别代码, data0021.USER_LOGIN_NAME as 用户代码 , '+
' data0073.USER_FULL_NAME as 用户名称,data0019.inv_group_desc                    '+
' from data0021                                                               '+
' inner join data0073 on data0021.USER_LOGIN_NAME=data0073.USER_LOGIN_NAME '+
' inner join data0019 on data0021.GROUP_NAME=data0019.inv_group_name '+
' order by data0021.GROUP_NAME ';

    gSvrIntf.IntfGetDataBySql(Lsql,cds21);

end;

procedure TfrmMain_Mod38SendInfoForSafeQty.mniDelClick(Sender: TObject);
var
cdstemp : TClientDataSet;
Lsql: string;
begin
  inherited;
  if cds21.IsEmpty then exit;
  
  cdstemp := TClientDataSet.Create(nil);
 try
  Lsql:='select * from data0021  where USER_LOGIN_NAME='''+cds21.FieldByName('用户代码').Value+''' '+
     ' and  GROUP_NAME='''+cds21.FieldByName('材料组别代码').Value+''' ';
  //showmessage(Lsql);
   gSvrintf.IntfGetDataBySql(Lsql,cdsTemp);

  if not cdsTemp.IsEmpty  then
   cdstemp.Delete;

   gSvrintf.IntfPostDataByTable('data0021',cdstemp.Delta);
    GetData
  finally
    cdstemp.Free;
  end;

end;

procedure TfrmMain_Mod38SendInfoForSafeQty.RefreshData;
begin
  if cds21.Active  then
  begin
  cds21.Close;
  cds21.Open;
  end;

end;

end.
