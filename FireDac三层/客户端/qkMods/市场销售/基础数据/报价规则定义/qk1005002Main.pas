unit qk1005002Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,qkBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Vcl.Menus, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, RzButton, Vcl.StdCtrls, Vcl.Mask,
  RzEdit, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls;

type
  Tfrmqk1005002Main = class(TfrmqkBaseMain)
    btn2: TRzBitBtn;
    pm2: TPopupMenu;
    mniN1: TMenuItem;
    mniN2: TMenuItem;
    mniN3: TMenuItem;
    procedure btn2Click(Sender: TObject);
    procedure mniN1Click(Sender: TObject);
    procedure mniN2Click(Sender: TObject);
    procedure mniN3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmqk1005002Main: Tfrmqk1005002Main;

implementation

uses
  qk1005002GridEdit, qkFunc.Commfunc, qkSvrIntf.ClientIntf, TestQkScript, qk1005002ScriptFunc;

{$R *.dfm}

procedure Tfrmqk1005002Main.btn2Click(Sender: TObject);
begin
  inherited;
  pm2.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure Tfrmqk1005002Main.mniN1Click(Sender: TObject);
begin
  inherited;
  if not qkRight.CheckOperatorRight(ModID,(Sender as TMenuItem).Tag) then
    Exit;
  if not qkDialog.FormExist(frmqk1005002GridEdit) then
    Exit;

  frmqk1005002GridEdit := Tfrmqk1005002GridEdit.Create(Self);
  frmqk1005002GridEdit.InitEdit(ModID,0);
  frmqk1005002GridEdit.WindowState := wsMaximized;
  frmqk1005002GridEdit.Show;

end;

procedure Tfrmqk1005002Main.mniN2Click(Sender: TObject);
begin
  inherited;
  frmqkScriptTest := TfrmqkScriptTest.Create(Self);
  frmqkScriptTest.ShowModal;
  frmqkScriptTest.Free;

end;

procedure Tfrmqk1005002Main.mniN3Click(Sender: TObject);
begin
  inherited;
  if not qkDialog.FormExist(frmqk1005002ScriptFunc) then
    Exit;
  frmqk1005002ScriptFunc := Tfrmqk1005002ScriptFunc.Create(Self);
  frmqk1005002ScriptFunc.InitFrm(ModID);
  frmqk1005002ScriptFunc.Show;
end;

end.
