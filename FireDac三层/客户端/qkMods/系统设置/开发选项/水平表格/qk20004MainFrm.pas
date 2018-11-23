unit qk20004MainFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,qkBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask, RzEdit, RzButton, RzLabel,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls, RzPanel, Vcl.Menus,
  qk20004EditFram, qkFunc.Commfunc, qkSvrIntf.ClientIntf;

type
  Tfrmqk20004Main = class(TfrmqkBaseMain)
    cbxUseFor: TComboBox;
    lbl2: TLabel;
    procedure mniNewClick(Sender: TObject);
    procedure mniEditClick(Sender: TObject);
    procedure mniDeleClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbxUseForChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FEditFram: tfrmqk20004EditFram;
  end;


implementation

{$R *.dfm}


procedure Tfrmqk20004Main.cbxUseForChange(Sender: TObject);
begin
  inherited;
  if FAddWhereLst.ContainsKey('UseFor') then
    FAddWhereLst.Items['UseFor'] := ' AND UseFor = ' + cbxUseFor.ItemIndex.ToString
  else
    FAddWhereLst.Add('UseFor',' AND UseFor = ' + cbxUseFor.ItemIndex.ToString);
  btnRefreshClick(btnRefresh);
end;

procedure Tfrmqk20004Main.FormCreate(Sender: TObject);
begin
  inherited;
  FAddWhereLst.Add('UseFor',' AND UseFor = ' + cbxUseFor.ItemIndex.ToString);
end;

procedure Tfrmqk20004Main.mniDeleClick(Sender: TObject);
const
  TBNAME = 'UI_Grid_ColumMain';
begin
  if qkDialog.DeleConfig then
  begin
    DataSet.Delete;
    if dmSvrIntf.PostDataByTable(DataSet,TBNAME) then
      qkDialog.DeleSucc;
  end;


end;

procedure Tfrmqk20004Main.mniEditClick(Sender: TObject);
begin
  inherited;
  if Assigned(FEditFram) then
    FreeAndNil(FEditFram);
  FEditFram := Tfrmqk20004EditFram.Create(Self);
  FEditFram.InitEditFram(DataSet,1);

  FEditFram.Show;

end;

procedure Tfrmqk20004Main.mniNewClick(Sender: TObject);
begin
  inherited;
  if Assigned(FEditFram) then
    FreeAndNil(FEditFram);
  FEditFram := Tfrmqk20004EditFram.Create(Self);
  FEditFram.InitEditFram(DataSet,0);

  FEditFram.Show;

end;

end.
