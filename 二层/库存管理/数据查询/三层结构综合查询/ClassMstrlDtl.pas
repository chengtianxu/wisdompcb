unit ClassMstrlDtl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, ExtCtrls, ComCtrls, ToolWin, ImgList;

type
  TfrmClassMstrlDtl = class(TForm)
    cdsMaster: TClientDataSet;
    dsMaster: TDataSource;
    cdsDetail: TClientDataSet;
    dsDetail: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    btnSave: TToolButton;
    btnCancel: TToolButton;
    btnNew: TToolButton;
    ImageList1: TImageList;
    ImageList2: TImageList;
    ToolButton1: TToolButton;
    btnDelete: TToolButton;
    btnExit: TToolButton;
    ToolButton2: TToolButton;
    cdsTmp: TClientDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNewClick(Sender: TObject);
    procedure dsMasterStateChange(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure cdsDetailBeforeEdit(DataSet: TDataSet);
    procedure btnExitClick(Sender: TObject);
    procedure cdsDetailBeforeInsert(DataSet: TDataSet);
    procedure dsDetailDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
    ModId:integer;
    Mstrl_KeyField,Dtl_KeyField:String;
    procedure OpenData(pModId:integer;pBillNO:string;DataId:integer);virtual;
    procedure Enter(pModId:integer;pBillNO:string;M_KeyField,D_KeyField:string);
  end;

var
  frmClassMstrlDtl: TfrmClassMstrlDtl;

implementation
uses PUBFUNC,Client_FUnc;
{$R *.dfm}

procedure TfrmClassMstrlDtl.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := cafree;
  frmClassMstrlDtl := nil;
end;

procedure TfrmClassMstrlDtl.btnNewClick(Sender: TObject);
begin
  cdsMaster.Append;
end;

procedure TfrmClassMstrlDtl.dsMasterStateChange(Sender: TObject);
begin
  btnSave.Enabled := cdsMaster.State in dsEditModes;
  BtnCancel.Enabled := btnSave.Enabled;
  btnExit.Enabled := cdsMaster.State = dsBrowse;
  btnDelete.Enabled := cdsMaster.State = dsBrowse;
end;

procedure TfrmClassMstrlDtl.btnCancelClick(Sender: TObject);
begin
  cdsMaster.Cancel;
  cdsDetail.CancelUpdates;
end;

procedure TfrmClassMstrlDtl.btnDeleteClick(Sender: TObject);
var
  ErrorMsg,pBillNo:Widestring;
  vData:OleVariant;
//  Remark:string;
begin
  if cdsMaster.IsEmpty then exit;
  if Msg_Dlg_Ask('确定删除数据吗？','提示',1) then
  begin
{    if cdsMaster.Fields[0].DataType = ftString	then
      Remark:= QuotedStr(cdsMaster.Fields[0].Asstring)
    else
      Remark:= cdsMaster.Fields[0].Asstring;}
    pBillNo := cdsMaster.FieldbyName(Mstrl_KeyField).Asstring;
    if not coMyQuery.Delete_Mult_Table(ModId,pBillNo,vData,ErrorMsg) then
      ShowMsg(ErrorMsg,1);

    OpenData(ModId,pBillNo,1);
  end;
end;

procedure TfrmClassMstrlDtl.btnSaveClick(Sender: TObject);
var
  ErrorMsg:Widestring;
  vData:OleVariant;
  pBillNo:widestring;
begin
  if cdsDetail.State in dseditModes then
   cdsDetail.Post;

  if cdsMaster.State in dseditModes then
   cdsMaster.Post;

  if not Update_Key_Value(cdsDetail,Mstrl_KeyField,cdsMaster.FieldByName(Mstrl_KeyField).value) then
  begin
    ShowMsg('请输入主表的编号',1);
    abort;
  end;
  pBillNO:=cdsMaster.FieldByName(Mstrl_KeyField).AsString;

  vData := VarArrayCreate([0,1], varVariant);
  if cdsMaster.ChangeCount > 0 then
  vData[0]:= cdsMaster.Delta;
  
  if cdsDetail.ChangeCount > 0 then
  vData[1]:= cdsDetail.Delta;
  if not coMyQuery.Update_Data(ModId,pBillNo,vData,ErrorMsg) then
    ShowMsg(ErrorMsg,1);

  OpenData(ModId,pBillNo,1);
end;

procedure TfrmClassMstrlDtl.Enter(pModId: integer; pBillNO: string;M_KeyField,D_KeyField:string);
begin
  ModId:=pModId;
  Mstrl_KeyField:=M_KeyField;
  Dtl_KeyField:=D_KeyField;

//  BillNo:=pBillNO;
//  Update_Log(ModId,act_Enter,'');
{
  if coMyQuery.Get_Mult_Data(ModId,pBillNo,vData,ErrorMsg) then
  begin
    cdsMaster.Data := vData[0];
    cdsDetail.Data := vData[1];
  end
  else
    ShowMsg(ErrorMsg,'提示',1);}
  OpenData(ModId,pBillNo,1);
  Show;
end;

procedure TfrmClassMstrlDtl.cdsDetailBeforeEdit(DataSet: TDataSet);
begin
  cdsMaster.Edit;
end;

procedure TfrmClassMstrlDtl.btnExitClick(Sender: TObject);
begin
  close;
end;

procedure TfrmClassMstrlDtl.OpenData(pModId: integer; pBillNO: string;DATAId:integer);
var
  vData:OleVariant;
  ErrorMsg:widestring;
begin
  if coMyQuery.Get_MstrlDtl_Data(pModId,pBillNo,vData,ErrorMsg,DataId) then
  begin
    if DataId = 1 then
      cdsMaster.Data := vData
    else
      cdsDetail.Data := vData;
  end
  else
    ShowMsg(ErrorMsg,'提示',1);
end;

procedure TfrmClassMstrlDtl.cdsDetailBeforeInsert(DataSet: TDataSet);
begin
  cdsTmp.Data := cdsDetail.Data;
end;

procedure TfrmClassMstrlDtl.dsDetailDataChange(Sender: TObject;
  Field: TField);
begin
  if dsDetail.State in dsEditModes then
  begin
    If Field = nil then exit; 
    if uppercase(Field.FieldName)=Uppercase(Dtl_KeyField) then
    begin
      if cdsTmp.Locate(Dtl_KeyField,Field.Value,[]) then
      begin
        ShowMsg('数值不能重复，请重新输入',1);
        Field.Value := NULL;
      end;
    end;
  end;
end;

end.
