unit MainFrm_ModShipped;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs ,uBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan, Vcl.Menus,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfrmMain_Mod50Caller = class(TfrmBaseMain)
    tvJump: TTreeView;
    procedure tvJumpChange(Sender: TObject; Node: TTreeNode);
  private
    { Private declarations }
  public
    FDisplayFrm: TfrmBaseMain;
    procedure AfterGetData;override;
    { Public declarations }
  end;

var
  frmMain_Mod50Caller: TfrmMain_Mod50Caller;

implementation

{$R *.dfm}

uses MainFrm_Mod50, MainFrm_Mod353;

procedure TfrmMain_Mod50Caller.AfterGetData;
begin
  inherited;
  tvJump.Items[0].Expand(True);
  pnlChildMain.Visible := False;
  tvJump.Items[0].Item[0].Selected := True;
end;

procedure TfrmMain_Mod50Caller.tvJumpChange(Sender: TObject; Node: TTreeNode);
begin
  inherited;
//  if FDisplayFrm <> nil then FreeAndNil(FDisplayFrm);
////  if Node.AbsoluteIndex=0 then
////  begin
////    pnlChildMain.Visible := True;
////  end;
//  if Node.AbsoluteIndex=1 then
//  begin
//    FDisplayFrm := TFrmMain_Mod50.Create(pnlDisplayMain,FModID);
////    FDisplayFrm.pnlChildMain.Visible := False;
//  end;
//  if Node.AbsoluteIndex=2 then
//  begin
//    FDisplayFrm := TFrmMain_Mod353.Create(pnlDisplayMain,FModID);
////    FDisplayFrm.pnlChildMain.Visible := False;
//  end;
  if FDisplayFrm <> nil then FreeAndNil(FDisplayFrm);
  if Node.AbsoluteIndex=1 then
  begin
    FDisplayFrm := TFrmMain_Mod50.Create(pnlDisplayMain,FModID);
    FDisplayFrm.pnlChildMain.Visible := true;
  end;
  if Node.AbsoluteIndex=2 then
  begin
    FDisplayFrm := TFrmMain_Mod353.Create(pnlDisplayMain,FModID);
    FDisplayFrm.pnlChildMain.Visible := True;
  end;
end;

end.
