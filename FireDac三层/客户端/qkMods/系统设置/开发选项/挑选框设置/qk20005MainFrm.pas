unit qk20005MainFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,qkBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask, RzEdit, RzButton, RzLabel,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls, RzPanel, Vcl.Menus;

type
  Tfrmqk20005Main = class(TfrmqkBaseMain)
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
  qk20005Edit, qkFunc.Commfunc, qkSvrIntf.ClientIntf;

{$R *.dfm}

procedure Tfrmqk20005Main.mniDeleClick(Sender: TObject);
begin
  inherited;
  if qkDialog.DeleConfig then
  begin
    qkTmp.ClearAll;
    with qkTmp.Pms.Add do
    begin
      Name := 'p1';
      Value := DataSet.FieldByName('idkey').AsLargeInt;
    end;
    if dmSvrIntf.SqlExec('18',qkTmp.Pms) then
    begin
      DataSet.Delete;
      DataSet.MergeChangeLog;
      qkDialog.DeleSucc;
    end;
  end;
end;

procedure Tfrmqk20005Main.mniEditClick(Sender: TObject);
begin
  inherited;
  if frmqk20005Edit <> nil then
    FreeAndNil(frmqk20005Edit);
  frmqk20005Edit := Tfrmqk20005Edit.Create(Self);
  frmqk20005Edit.InitEdit(ModID,DataSet.FieldByName('idkey').AsLargeInt);
  frmqk20005Edit.Show;
end;

procedure Tfrmqk20005Main.mniNewClick(Sender: TObject);
begin
  inherited;
  if frmqk20005Edit <> nil then
    FreeAndNil(frmqk20005Edit);
  frmqk20005Edit := Tfrmqk20005Edit.Create(Self);
  frmqk20005Edit.InitEdit(ModID,0);
  frmqk20005Edit.Show;  //
end;

procedure Tfrmqk20005Main.mniViewClick(Sender: TObject);
begin
  inherited;
  if frmqk20005Edit <> nil then
    FreeAndNil(frmqk20005Edit);
  frmqk20005Edit := Tfrmqk20005Edit.Create(Self);
  frmqk20005Edit.InitEdit(ModID,DataSet.FieldByName('idkey').AsLargeInt);
  frmqk20005Edit.SetReadOnly;
  frmqk20005Edit.Show;
end;

end.
