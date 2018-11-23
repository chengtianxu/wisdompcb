unit qk200000001MainFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Vcl.Menus, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask, RzEdit,
  RzButton, RzLabel, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls,
  RzPanel, qkFunc.Commfunc, qkSvrIntf.ClientIntf;

type
  Tfrmqk200000001Main = class(TfrmqkBaseMain)
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
  qk200000001Edit;

{$R *.dfm}

procedure Tfrmqk200000001Main.mniDeleClick(Sender: TObject);
begin
  inherited;
  if qkDialog.DeleConfig then
  begin
    mt1.Delete;
    if dmSvrIntf.PostDataByTable(mt1,'gSys_unit') then
    begin
      qkDialog.DeleSucc;
      mt1.MergeChangeLog;
    end;
  end;
end;

procedure Tfrmqk200000001Main.mniEditClick(Sender: TObject);
begin
  inherited;
  if not qkDialog.FormExist(frmqk20000001Edit) then
    exit;
  frmqk20000001Edit := Tfrmqk20000001Edit.Create(Self);
  frmqk20000001Edit.InitEdit(ModID,DataSet.FieldByName('IDKey').AsLargeInt);
  frmqk20000001Edit.Show;
end;

procedure Tfrmqk200000001Main.mniNewClick(Sender: TObject);
begin
  inherited;
  if not qkDialog.FormExist(frmqk20000001Edit) then
    exit;
  frmqk20000001Edit := Tfrmqk20000001Edit.Create(Self);
  frmqk20000001Edit.InitEdit(ModID,0);
  frmqk20000001Edit.Show;
end;

procedure Tfrmqk200000001Main.mniViewClick(Sender: TObject);
begin
  inherited;
  if not qkDialog.FormExist(frmqk20000001Edit) then
    exit;

  frmqk20000001Edit := Tfrmqk20000001Edit.Create(Self);
  frmqk20000001Edit.InitEdit(ModID,DataSet.FieldByName('IDKey').AsLargeInt);
  frmqk20000001Edit.SetReadOnly;
  frmqk20000001Edit.Show;
end;

end.
