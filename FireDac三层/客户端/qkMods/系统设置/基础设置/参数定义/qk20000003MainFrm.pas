unit qk20000003MainFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Vcl.Menus, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, RzButton, Vcl.StdCtrls, Vcl.Mask,
  RzEdit, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls;

type
  Tfrmqk20000003Main = class(TfrmqkBaseMain)
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
  qkSvrIntf.ClientIntf,qkFunc.Commfunc, qk20000003Edit;

{$R *.dfm}

procedure Tfrmqk20000003Main.mniDeleClick(Sender: TObject);
begin
  inherited;
  if qkDialog.DeleConfig then
  begin
    DataSet.Delete;
    if dmSvrIntf.PostDataByTable(DataSet,'gBase_Param') then
    begin
      qkDialog.DeleSucc;
      DataSet.MergeChangeLog;
    end;
  end;
end;

procedure Tfrmqk20000003Main.mniEditClick(Sender: TObject);
begin
  inherited;
  if not qkDialog.FormExist(frmqk20000003Edit) then
    exit;
  frmqk20000003Edit := Tfrmqk20000003Edit.Create(Self);
  frmqk20000003Edit.InitEdit(ModID,DataSet.FieldByName('idkey').AsLargeInt);
  frmqk20000003Edit.Show;
end;

procedure Tfrmqk20000003Main.mniNewClick(Sender: TObject);
begin
  inherited;
  if not qkDialog.FormExist(frmqk20000003Edit) then
    exit;
  frmqk20000003Edit := Tfrmqk20000003Edit.Create(Self);
  frmqk20000003Edit.InitEdit(ModID,0);
  frmqk20000003Edit.Show;
end;

procedure Tfrmqk20000003Main.mniViewClick(Sender: TObject);
begin
  inherited;
  if not qkDialog.FormExist(frmqk20000003Edit) then
    exit;
  frmqk20000003Edit := Tfrmqk20000003Edit.Create(Self);
  frmqk20000003Edit.InitEdit(ModID,DataSet.FieldByName('idkey').AsLargeInt);
  frmqk20000003Edit.SetReadOnly;
  frmqk20000003Edit.Show;
end;

end.
