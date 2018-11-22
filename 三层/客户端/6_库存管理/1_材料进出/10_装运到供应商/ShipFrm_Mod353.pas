unit ShipFrm_Mod353;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs , uBaseEditFrm, uBaseMainFrm,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB,
  Vcl.XPMan, Vcl.Menus, Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls , uCommFunc, Vcl.Mask, RzEdit,
  RzBtnEdt, uRKeyBtnEdit, Vcl.DBCtrls ,uBaseSinglePickListFrm;

type
  TAfterUpdate_Mod353 = procedure (ACds:TClientDataSet) of object;

  TFrmShip_Mod353 = class(TfrmBaseEdit)
    cds209: TClientDataSet;
    cds235: TClientDataSet;
    cds72: TClientDataSet;
    ds209: TDataSource;
    ds235: TDataSource;
    ds72: TDataSource;
    cds210: TClientDataSet;
    ds210: TDataSource;
    Label8: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    RKeyRzBtnEdit1: TRKeyRzBtnEdit;
    RKeyRzBtnEdit2: TRKeyRzBtnEdit;
    RKeyRzBtnEdit3: TRKeyRzBtnEdit;
    RKeyRzBtnEdit4: TRKeyRzBtnEdit;
    ds23: TDataSource;
    cds23: TClientDataSet;
    DBText1: TDBText;
    RKeyRzBtnEdit5: TRKeyRzBtnEdit;
    RKeyRzBtnEdit6: TRKeyRzBtnEdit;
    RzButtonEdit1: TRzButtonEdit;
    DBMemo1: TDBMemo;
    procedure RzButtonEdit1ButtonClick(Sender: TObject);
    procedure RzButtonEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    FAfterUpdate : TAfterUpdate_Mod353;
//    FRkey370 : string;
    procedure getdata(ARKey,ARkey235,ARkey23,AD0072_ptr:string);
    { Public declarations }
  end;

var
  FrmShip_Mod353: TFrmShip_Mod353;

implementation

{$R *.dfm}

{ TFrmShip_Mod353 }

procedure TFrmShip_Mod353.btnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmShip_Mod353.btnSaveClick(Sender: TObject);
var
  LGetTime : TDateTime;
  LPostData : OleVariant;
begin
  inherited;
  if cds209.FieldByName('status').Value = True then
  begin
    ShowMessage('已有人进行了操作，状态发生改变，请刷新后再操作');
    Exit;
  end;
  if RzButtonEdit1.Text = '' then
  begin
    ShowMessage('请选择装运方式');
    Exit;
  end;
  LGetTime := gFunc.GetSvrDateTime ;
  cds235.Edit;
  cds235.FieldByName('quan_returned').Value := cds235.FieldByName('quan_returned').Value + cds209.FieldByName('QUANTITY').Value ;
  cds235.FieldByName('quan_to_ship').Value :=  cds235.FieldByName('quan_to_ship').Value - cds209.FieldByName('QUANTITY').Value ;
  cds235.Post;

  cds209.Edit;
  cds209.FieldByName('status').Value := '1';
  cds209.FieldByName('tran_by_userptr').Value := gVar.rkey05;
  cds209.FieldByName('tran_date').Value := LGetTime;
  cds209.FieldByName('shipping_method').AsString := RzButtonEdit1.Text;
  cds209.FieldByName('remark').AsString := DBMemo1.Lines.Text;
  cds209.Post;

  cds72.Edit;
  cds72.FieldByName('QUAN_RETN').Value := cds72.FieldByName('QUAN_RETN').Value + cds209.FieldByName('QUANTITY').Value ;
  cds72.Post;

  cds210.Append;
  cds210.FieldByName('D0235_PTR').Value := cds235.FieldByName('rkey').Value;
  cds210.FieldByName('po_link_ptr').Value := cds235.FieldByName('D0072_PTR').Value;
  cds210.FieldByName('quantity').Value := cds209.FieldByName('QUANTITY').Value ;
  cds210.FieldByName('tdate').Value := LGetTime;
  cds210.FieldByName('empl_ptr').Value := gVar.rkey05;
  cds210.FieldByName('type').Value := 1;
  cds210.Post;

  if cds235.State in [dsEdit,dsInsert] then cds235.Post;
  if cds209.State in [dsEdit,dsInsert] then cds209.Post;
  if cds72.State in [dsEdit,dsInsert] then cds72.Post;
  if cds210.State in [dsEdit,dsInsert] then cds210.Post;

  LPostData := VarArrayCreate([0,3],varVariant);
  if cds235.ChangeCount > 0 then
    LPostData[0] := cds235.Delta;
  if cds209.ChangeCount > 0 then
    LPostData[1] := cds209.Delta;
  if cds72.ChangeCount > 0 then
    LPostData[2] := cds72.Delta;
  if cds210.ChangeCount > 0 then
    LPostData[3] := cds210.Delta;
  if gSvrIntf.IntfPostModData('公共基础',50,LPostData,1) then
  begin
    cds235.MergeChangeLog;
    cds209.MergeChangeLog;
    cds72.MergeChangeLog;
    cds210.MergeChangeLog;
    ShowMessage('保存成功');
    if Assigned(FAfterUpdate) then
      FAfterUpdate(nil);
    Close;
  end;
end;

procedure TFrmShip_Mod353.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  FrmShip_Mod353 := nil;
end;

procedure TFrmShip_Mod353.getdata(ARKey,ARkey235,ARkey23,AD0072_ptr: string);
var
  LSql209,LSql235,LSql23,LSql72,LSql210 : string;
begin
  LSql209 := ' select * from data0209 where rkey = ' + ARKey;
  LSql235 := ' select * from data0235 where rkey = ' + ARkey235;
  LSql23 := ' select * from data0023 where rkey = ' + ARkey23;
  LSql72 := ' select * from data0072 where rkey = ' + AD0072_ptr;
  LSql210 := ' select * from data0210 where 1 = 2 ' ;
  gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql209,LSql235,LSql23,LSql72,LSql210]),[cds209,cds235,cds23,cds72,cds210]) ;
end;

procedure TFrmShip_Mod353.RzButtonEdit1ButtonClick(Sender: TObject);
var
  LFrm:TfrmSinglePickList;
begin
  inherited;
  LFrm := TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(50,8);
    if LFrm.ShowModal = mrOk then
    begin
      RzButtonEdit1.Text := LFrm.cdsPick.FieldByName('DESCRIPTION').AsString;
//      Frkey370 := LFrm.cdsPick.FieldByName('rkey').AsString;
//      Label9.Caption := LFrm.cdsPick.FieldByName('DESCRIPTION').AsString;
    end;
  finally
    LFrm.Free;
  end;

end;

procedure TFrmShip_Mod353.RzButtonEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  Key := #0;
end;

end.
