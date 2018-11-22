unit ShipFrm_Mod50;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs , uBaseEditFrm, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls,uCommFunc, Data.DB, Datasnap.DBClient, Vcl.Mask,
  RzEdit, RzBtnEdt, uRKeyBtnEdit , uBaseSinglePickListFrm, Vcl.DBCtrls;

type
  TAfterUpdate_Mod50 = procedure (ACds:TClientDataSet) of object;

  TFrmShip_Mod50 = class(TfrmBaseEdit)
    cds96: TClientDataSet;
    ds96: TDataSource;
    cds22: TClientDataSet;
    ds22: TDataSource;
    cds71: TClientDataSet;
    ds71: TDataSource;
    cds210: TClientDataSet;
    ds210: TDataSource;
    cds23: TClientDataSet;
    ds23: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label9: TLabel;
    Label4: TLabel;
    Label10: TLabel;
    Label5: TLabel;
    Label11: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    RKeyRzBtnEdit1: TRKeyRzBtnEdit;
    RKeyRzBtnEdit2: TRKeyRzBtnEdit;
    RKeyRzBtnEdit3: TRKeyRzBtnEdit;
    cds15: TClientDataSet;
    ds15: TDataSource;
    RKeyRzBtnEdit4: TRKeyRzBtnEdit;
    RKeyRzBtnEdit5: TRKeyRzBtnEdit;
    RKeyRzBtnEdit6: TRKeyRzBtnEdit;
    RKeyRzBtnEdit7: TRKeyRzBtnEdit;
    RKeyRzBtnEdit8: TRKeyRzBtnEdit;
    RzButtonEdit1: TRzButtonEdit;
    DBMemo1: TDBMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzButtonEdit1ButtonClick(Sender: TObject);
    procedure RzButtonEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    Ftype456 : string;
    FAfterUpdate : TAfterUpdate_Mod50;
    procedure getdata(ARKey,ARkey22,ARkey23,ASOURCE_PTR,ARkey15:string);
    { Public declarations }
  end;

var
  FrmShip_Mod50: TFrmShip_Mod50;

implementation

{$R *.dfm}

procedure TFrmShip_Mod50.btnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmShip_Mod50.btnSaveClick(Sender: TObject);
var
  LGetTime : TDateTime;
  LPostData : OleVariant;
begin
  inherited;
  if cds96.FieldByName('status').Value = 1 then
  begin
    ShowMessage('已有人进行了操作，状态发生改变，请刷新后再操作');
    Exit;
  end;
  if RzButtonEdit1.Text = '' then
  begin
    ShowMessage('请选择装运方式');
    Exit;
  end;
  LGetTime := gFunc.GetSvrDateTime;
  cds22.Edit;
  cds22.FieldByName('QUAN_RETURNED').Value := cds22.FieldByName('QUAN_RETURNED').Value + cds96.FieldByName('QUAN_REJD').Value ;
  cds22.FieldByName('QUAN_TO_BE_SHIPPED').Value := cds22.FieldByName('QUAN_TO_BE_SHIPPED').Value - cds96.FieldByName('QUAN_REJD').Value ;
  cds22.Post;

  cds96.Edit;
  cds96.FieldByName('USER_PTR').Value := gVar.rkey05;
  cds96.FieldByName('status').Value := 1;
  cds96.FieldByName('TRAN_DATE').Value := LGetTime;
  cds96.FieldByName('REFERENCE_NUMBER').Value := DBMemo1.Lines.Text;
  cds96.FieldByName('SHIPPING_METHOD').Value := RzButtonEdit1.Text;
  cds96.Post;

  if not (cds22.FieldByName('SOURCE_PTR').IsNull) then
  begin
    cds71.Edit;
    if cds71.FieldByName('conversion_factor').Value <> 0 then
    begin
       cds71.FieldByName('quan_retn').Value := cds71.FieldByName('quan_retn').Value +
         cds96.FieldByName('QUAN_REJD').Value/cds71.FieldByName('conversion_factor').Value;
    end
    else
    begin
      cds71.FieldByName('quan_retn').Value := cds71.FieldByName('quan_retn').Value + cds96.FieldByName('QUAN_REJD').Value;
    end;
    cds71.Post;
  end;

  cds210.Append;
  cds210.FieldByName('INVT_PTR').Value := cds22.FieldByName('INVENTORY_PTR').Value;
  if not (cds22.FieldByName('SOURCE_PTR').IsNull) then
  begin
    cds210.FieldByName('PO_LINK_PTR').Value := cds22.FieldByName('SOURCE_PTR').AsString;
  end;
  cds210.FieldByName('D0022_PTR').Value := cds22.FieldByName('rkey').AsString;
  cds210.FieldByName('quantity').Value := cds96.FieldByName('QUAN_REJD').Value ;
  cds210.FieldByName('tdate').Value := LGetTime;
  cds210.FieldByName('empl_ptr').Value := gVar.rkey05;
  cds210.FieldByName('type').Value := 0;
  cds210.post;

  if cds22.State in [dsEdit,dsInsert] then cds22.Post;
  if cds96.State in [dsEdit,dsInsert] then cds96.Post;
  if cds71.State in [dsEdit,dsInsert] then cds71.Post;
  if cds210.State in [dsEdit,dsInsert] then cds210.Post;

  LPostData := VarArrayCreate([0,3],varVariant);
  if cds22.ChangeCount > 0 then
    LPostData[0] := cds22.Delta;
  if cds96.ChangeCount > 0 then
    LPostData[1] := cds96.Delta;
  if cds71.ChangeCount > 0 then
    LPostData[2] := cds71.Delta;
  if cds210.ChangeCount > 0 then
    LPostData[3] := cds210.Delta;
  if gSvrIntf.IntfPostModData('公共基础',50,LPostData) then
  begin
    cds22.MergeChangeLog;
    cds96.MergeChangeLog;
    cds71.MergeChangeLog;
    cds210.MergeChangeLog;
    ShowMessage('保存成功');
    if Assigned(FAfterUpdate) then
      FAfterUpdate(nil);
    Close;
  end;
end;

procedure TFrmShip_Mod50.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  FrmShip_Mod50 := nil;
end;

procedure TFrmShip_Mod50.getdata(ARKey, ARkey22, ARkey23, ASOURCE_PTR , ARkey15: string);
var
  LSql96,LSql22,LSql23,LSql71,LSql210,LSql15 : string;
begin
  LSql96 := ' select * from data0096 where rkey = ' + ARKey;
  LSql22 := ' select * from data0022 where rkey = ' + ARkey22;
  LSql23 := ' select * from data0023 where rkey = ' + ARkey23;
  if ASOURCE_PTR = '' then
    ASOURCE_PTR := '0';
  LSql71 := ' select * from data0071 where rkey = ' + ASOURCE_PTR;
  LSql210 := ' select * from data0210 where 1 = 2 ' ;
  LSql15 := ' select * from data0015 where rkey = ' + ARkey15 ;
  gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql96,LSql22,LSql23,LSql71,LSql210,LSql15]),[cds96,cds22,cds23,cds71,cds210,cds15]) ;
end;

procedure TFrmShip_Mod50.RzButtonEdit1ButtonClick(Sender: TObject);
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
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TFrmShip_Mod50.RzButtonEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  Key := #0;
end;

end.
