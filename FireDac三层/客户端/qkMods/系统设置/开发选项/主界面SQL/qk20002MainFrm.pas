unit qk20002MainFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,qkBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask, RzEdit, RzButton, RzLabel,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls, RzPanel, Vcl.Menus,
  qkFunc.Commfunc,qkSvrIntf.ClientIntf;

type
  Tfrmqk20002main = class(TfrmqkBaseMain)
    lbl2: TLabel;
    cbxUseFor: TComboBox;
    procedure mniNewClick(Sender: TObject);
    procedure mniEditClick(Sender: TObject);
    procedure mniDeleClick(Sender: TObject);
    procedure cbxUseForChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mniViewClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

uses
  qk20002Edit;

{$R *.dfm}

procedure Tfrmqk20002main.cbxUseForChange(Sender: TObject);
begin
  inherited;
  if FAddWhereLst.ContainsKey('UseFor') then
    FAddWhereLst.Items['UseFor'] := ' AND UseFor = ' + cbxUseFor.ItemIndex.ToString
  else
    FAddWhereLst.Add('UseFor',' AND UseFor = ' + cbxUseFor.ItemIndex.ToString);
  btnRefreshClick(btnRefresh);
end;

procedure Tfrmqk20002main.FormCreate(Sender: TObject);
begin
  inherited;
  FAddWhereLst.Add('UseFor',' AND UseFor = ' + cbxUseFor.ItemIndex.ToString);
end;

procedure Tfrmqk20002main.mniDeleClick(Sender: TObject);
const
  TBNAME = 'UI_MainSql';
begin
  if qkDialog.DeleConfig then
  begin
    qkTmp.ClearAll;
    with qkTmp.Pms.Add do
    begin
      Name := 'p1';
      Value := DataSet.FieldByName('idkey').AsLargeInt;
    end;
    if dmSvrIntf.SqlExec('16',qkTmp.Pms) then
    begin
      DataSet.Delete;
      DataSet.MergeChangeLog;
      qkDialog.DeleSucc;
    end;
  end;
end;

procedure Tfrmqk20002main.mniEditClick(Sender: TObject);
begin
  inherited;
//  if Assigned(FEditFram) then
//    FreeAndNil(FEditFram);
//  FEditFram := Tfrmqk20002EditFram.Create(Self);
//  FEditFram.InitEditFram(DataSet,1);
//
//  FEditFram.Show;
  if not qkDialog.FormExist(frmqk20002Edit) then
    exit;
  //if Assigned(frmqk20002Edit) then
    //FreeAndNil(frmqk20002Edit);
  frmqk20002Edit := Tfrmqk20002Edit.Create(Self);
  frmqk20002Edit.InitEdit(ModID,DataSet.FieldByName('idkey').AsLargeInt);

  frmqk20002Edit.Show;
end;

procedure Tfrmqk20002main.mniNewClick(Sender: TObject);
begin
  inherited;
  if Assigned(frmqk20002Edit) then
    FreeAndNil(frmqk20002Edit);
  frmqk20002Edit := Tfrmqk20002Edit.Create(Self);
  frmqk20002Edit.InitEdit(ModID,0);

  frmqk20002Edit.Show;

end;

procedure Tfrmqk20002main.mniViewClick(Sender: TObject);
begin
  inherited;
  if Assigned(frmqk20002Edit) then
    FreeAndNil(frmqk20002Edit);
  frmqk20002Edit := Tfrmqk20002Edit.Create(Self);
  frmqk20002Edit.InitEdit(ModID,DataSet.FieldByName('idkey').AsLargeInt);

  frmqk20002Edit.SetReadOnly;
  frmqk20002Edit.Show;

end;

end.
