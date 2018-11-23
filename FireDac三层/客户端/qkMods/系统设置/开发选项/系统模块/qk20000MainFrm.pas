unit qk20000MainFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask, RzEdit, RzButton, RzLabel,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls, RzPanel, Vcl.Menus,
  qk20000Edit, qkFunc.Commfunc, MemTableDataEh, MemTableEh;

type
  Tfrmqk20000MainFrm = class(TfrmqkBaseMain)
    mteh1: TMemTableEh;
    procedure mniNewClick(Sender: TObject);
    procedure mniEditClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure mniViewClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure InitMainFrm(AModID: int64;AMainSqlIDKey: Int64);override;
    procedure AfterInit;
  end;


implementation


{$R *.dfm}

procedure Tfrmqk20000MainFrm.AfterInit;
begin
  mteh1.AfterScroll := nil;
  mteh1.LoadFromDataSet(mt1,mt1.RecordCount,TLoadMode.lmCopy,True);
  mteh1.TreeList.KeyFieldName := 'IDKey';
  mteh1.TreeList.RefParentFieldName := 'ParentIDkey';
  mteh1.TreeList.Active := True;
  mteh1.First;

  ds1.DataSet := mteh1;
  eh1.DataSource := ds1;

end;

procedure Tfrmqk20000MainFrm.btnRefreshClick(Sender: TObject);
begin
  inherited;
  AfterInit;
end;

procedure Tfrmqk20000MainFrm.InitMainFrm(AModID, AMainSqlIDKey: Int64);
begin
  inherited;
  AfterInit;
end;

procedure Tfrmqk20000MainFrm.mniEditClick(Sender: TObject);
begin
  inherited;
  if not qkDialog.FormExist(frmqk20000Edit) then
    exit;
  frmqk20000Edit := Tfrmqk20000Edit.Create(Self);
  frmqk20000Edit.InitEdit(ModID,mteh1.FieldByName('idkey').AsLargeInt);
  frmqk20000Edit.Show;
end;

procedure Tfrmqk20000MainFrm.mniNewClick(Sender: TObject);
begin
  inherited;
  if not qkDialog.FormExist(frmqk20000Edit) then
    exit;
  frmqk20000Edit := Tfrmqk20000Edit.Create(Self);
  frmqk20000Edit.InitEdit(ModID,0);
  frmqk20000Edit.Show;
end;

procedure Tfrmqk20000MainFrm.mniViewClick(Sender: TObject);
begin
  inherited;
  if not qkDialog.FormExist(frmqk20000Edit) then
    exit;
  frmqk20000Edit := Tfrmqk20000Edit.Create(Self);
  frmqk20000Edit.InitEdit(ModID,mteh1.FieldByName('idkey').AsLargeInt);
  frmqk20000Edit.SetReadOnly;
  frmqk20000Edit.Show;
end;

end.
