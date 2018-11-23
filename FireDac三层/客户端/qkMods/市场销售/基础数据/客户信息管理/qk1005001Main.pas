unit qk1005001Main;

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
  Tfrmqk1005001Main = class(TfrmqkBaseMain)
    procedure mniEditClick(Sender: TObject);
    procedure mniViewClick(Sender: TObject);
    procedure mniDeleClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mniNewClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

uses
  qkFunc.Commfunc,qkSvrIntf.ClientIntf, qk1005001Edit;

{$R *.dfm}

procedure Tfrmqk1005001Main.FormCreate(Sender: TObject);
begin
  FWhere := ' gSales_Customer_Rights.UserIDKey = ' + qkVar.LoginIDKey.ToString;
  inherited;
end;

procedure Tfrmqk1005001Main.mniDeleClick(Sender: TObject);
begin
  inherited;
  if qkDialog.DeleConfig then
  begin
    qkTmp.ClearAll;
    with qkTmp.Pms.Add do
    begin
      Name := 'p1';
      Value := DataSet.FieldByName('IDKey').AsLargeInt;
    end;
    if dmSvrIntf.SqlExec('13',qkTmp.Pms) then
      qkDialog.DeleSucc;
  end;
end;

procedure Tfrmqk1005001Main.mniEditClick(Sender: TObject);
begin
  inherited;
  if not qkRight.CheckOperatorRight(ModID,(Sender as TMenuItem).Tag) then Exit;

  if Assigned(frmqk1005001Edit) then
    FreeAndNil(frmqk1005001Edit);
  frmqk1005001Edit := Tfrmqk1005001Edit.Create(Self);
  frmqk1005001Edit.InitEdit(DataSet.FieldByName('IDKey').AsLargeInt);
  frmqk1005001Edit.Show;

end;

procedure Tfrmqk1005001Main.mniNewClick(Sender: TObject);
begin
  inherited;
  if not qkRight.CheckOperatorRight(ModID,(Sender as TMenuItem).Tag) then Exit;

  if Assigned(frmqk1005001Edit) then
    FreeAndNil(frmqk1005001Edit);
  frmqk1005001Edit := Tfrmqk1005001Edit.Create(Self);
  frmqk1005001Edit.InitEdit(-1);
  frmqk1005001Edit.ReadNew;
  frmqk1005001Edit.Show;
end;

procedure Tfrmqk1005001Main.mniViewClick(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  if Assigned(frmqk1005001Edit) then
    FreeAndNil(frmqk1005001Edit);
  frmqk1005001Edit := Tfrmqk1005001Edit.Create(Self);
  frmqk1005001Edit.InitEdit(DataSet.FieldByName('IDKey').AsLargeInt);
  frmqk1005001Edit.btnSave.Enabled := False;
  for I := 0 to frmqk1005001Edit.PostDsList.Count - 1 do
    frmqk1005001Edit.PostDsList[I].ReadOnly := True;
  frmqk1005001Edit.Show;

end;

end.
