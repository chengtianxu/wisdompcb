unit qk200002Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Vcl.Menus, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask, RzEdit,
  RzButton, RzLabel, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls,
  RzPanel;

type
  Tfrmqk200002Main = class(TfrmqkBaseMain)
    procedure mniNewClick(Sender: TObject);
    procedure mniEditClick(Sender: TObject);
    procedure mniViewClick(Sender: TObject);
    procedure mniDeleClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

uses
  qk200002Edit, qkSvrIntf.ClientIntf,qkFunc.Commfunc;

{$R *.dfm}

procedure Tfrmqk200002Main.mniDeleClick(Sender: TObject);
begin
  inherited;
  if qkDialog.DeleConfig then
  begin
    DataSet.Delete;
    if dmSvrIntf.PostDataByTable(DataSet,'gsys_seed') then
      qkDialog.DeleSucc;
  end;

end;

procedure Tfrmqk200002Main.mniEditClick(Sender: TObject);
begin
  inherited;
  if not qkDialog.FormExist(frmqk200002Edit) then
    exit;

  frmqk200002Edit := Tfrmqk200002Edit.Create(Self);
  frmqk200002Edit.InitEdit(DataSet.FieldByName('seedname').AsString);
  frmqk200002Edit.Show;
end;

procedure Tfrmqk200002Main.mniNewClick(Sender: TObject);
begin
  inherited;
  if not qkDialog.FormExist(frmqk200002Edit) then
    exit;

  frmqk200002Edit := Tfrmqk200002Edit.Create(Self);
  frmqk200002Edit.InitEdit('-1');
  frmqk200002Edit.Show;
end;

procedure Tfrmqk200002Main.mniViewClick(Sender: TObject);
begin
  inherited;
  if not qkDialog.FormExist(frmqk200002Edit) then
    exit;

  frmqk200002Edit := Tfrmqk200002Edit.Create(Self);
  frmqk200002Edit.InitEdit(DataSet.FieldByName('seedname').AsString);
  frmqk200002Edit.Show;
  frmqk200002Edit.SetReadOnly;
end;

end.
