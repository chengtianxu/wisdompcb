unit MainFrm_Mod474Caller;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan,
  Datasnap.DBClient, Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls, Vcl.ComCtrls,
  MainFrm_Mod474SysuserSet, MainFrm_Mod474ModSet, MainFrm_Mod474UpdateVer;

type
  TfrmMain_Mod474Caller = class(TfrmBaseMain)
    tvJump: TTreeView;
    procedure tvJumpChange(Sender: TObject; Node: TTreeNode);
  private
    { Private declarations }
  public
    { Public declarations }
    FFrmUserSet: TfrmMain_Mod474SysuserSet;
    FFrmModSet: TfrmMain_Mod474ModSet;
    FFrmModUpdate: TfrmMain_Mod474Update;

    procedure AfterGetData;override;
  end;

implementation


{$R *.dfm}

{ TForm1 }

procedure TfrmMain_Mod474Caller.AfterGetData;
begin
  inherited;
  tvJump.Items[0].Expand(True);
  pnlChildMain.Visible := False;
  tvJump.Items[0].Item[0].Selected := True;
end;


procedure TfrmMain_Mod474Caller.tvJumpChange(Sender: TObject; Node: TTreeNode);
begin
  inherited;
  if Node.AbsoluteIndex = 1 then
  begin
    if FFrmModSet <> nil then FFrmModSet.pnlMain.Visible := False;
    if FFrmModUpdate <> nil then FFrmModUpdate.pnlMain.Visible := False;

    if FFrmUserSet = nil then
      FFrmUserSet := TfrmMain_Mod474SysuserSet.Create(pnlDisplayMain,FModID);
    FFrmUserSet.pnlMain.Visible := True;
  end;
  if Node.AbsoluteIndex = 2 then
  begin
    if FFrmUserSet <> nil then FFrmUserSet.pnlMain.Visible := False;
    if FFrmModUpdate <> nil then FFrmModUpdate.pnlMain.Visible := False;

    if FFrmModSet = nil then
      FFrmModSet := TfrmMain_Mod474ModSet.Create(pnlDisplayMain,FModID);
    FFrmModSet.pnlMain.Visible := True;
  end;
  if Node.AbsoluteIndex = 3 then
  begin
    if FFrmUserSet <> nil then FFrmUserSet.pnlMain.Visible := False;
    if FFrmModSet <> nil then FFrmModSet.pnlMain.Visible := False;

    if FFrmModUpdate = nil then
      FFrmModUpdate := TfrmMain_Mod474Update.Create(pnlDisplayMain,FModID);
    FFrmModUpdate.pnlMain.Visible := True;
  end;
end;

end.
