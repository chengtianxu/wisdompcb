unit qk20003MainFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask, RzEdit, RzButton, RzLabel,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls, RzPanel, Vcl.Menus, qkFunc.Commfunc,
  qk20003EditFram;

type
  Tfrmqk20003Main = class(TfrmqkBaseMain)
    procedure mniDeleClick(Sender: TObject);
    procedure mniEditClick(Sender: TObject);
    procedure mniNewClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FEditFram: tfrmqk20003EditFram;
  end;


implementation

uses
  qkSvrIntf.ClientIntf;

{$R *.dfm}

procedure Tfrmqk20003Main.mniDeleClick(Sender: TObject);
const
  TBNAME = 'UI_EditGrid_Main';
begin
  if qkDialog.DeleConfig then
  begin
    DataSet.Delete;
    if dmSvrIntf.PostDataByTable(DataSet,TBNAME) then
      qkDialog.DeleSucc;
  end;
end;

procedure Tfrmqk20003Main.mniEditClick(Sender: TObject);
begin
  inherited;
  if Assigned(FEditFram) then
    FreeAndNil(FEditFram);
  FEditFram := Tfrmqk20003EditFram.Create(Self);
  FEditFram.InitEditFram(DataSet,1);

  FEditFram.Show;
end;

procedure Tfrmqk20003Main.mniNewClick(Sender: TObject);
begin
  inherited;
  if Assigned(FEditFram) then
    FreeAndNil(FEditFram);
  FEditFram := Tfrmqk20003EditFram.Create(Self);
  FEditFram.InitEditFram(DataSet,0);

  FEditFram.Show;
end;

end.
