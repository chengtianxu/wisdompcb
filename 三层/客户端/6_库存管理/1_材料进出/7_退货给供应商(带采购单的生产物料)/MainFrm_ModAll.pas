unit MainFrm_ModAll;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Vcl.ComCtrls, Data.DB, Vcl.XPMan,
  Vcl.Menus, Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls;

type
  TfrmMain_Mod40Caller = class(TfrmBaseMain)
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
  frmMain_Mod40Caller: TfrmMain_Mod40Caller;

implementation

{$R *.dfm}

uses MainFrm_Mod352, MainFrm_Mod40, MainFrm_Mod41;

procedure TfrmMain_Mod40Caller.AfterGetData;
begin
  inherited;
  tvJump.Items[0].Expand(True);
  pnlChildMain.Visible := False;
  tvJump.Items[0].Item[0].Selected := True;
end;

procedure TfrmMain_Mod40Caller.tvJumpChange(Sender: TObject; Node: TTreeNode);
begin
  inherited;
  if FDisplayFrm <> nil then FreeAndNil(FDisplayFrm);
//  if Node.AbsoluteIndex=0 then
//  begin
//    pnlChildMain.Visible := True;
//  end;
  if Node.AbsoluteIndex=1 then
  begin
//    pnlDisplayMain.Visible := True;
    FDisplayFrm := TFrmMain_Mod40.Create(pnlDisplayMain,FModID);
  end;
  if Node.AbsoluteIndex=2 then
  begin
//    pnlDisplayMain.Visible := False;
    FDisplayFrm := TFrmMain_Mod41.Create(pnlDisplayMain,FModID);
  end;
  if Node.AbsoluteIndex=3 then
  begin
//    pnlDisplayMain.Visible := False;
    FDisplayFrm := TFrmMain_Mod352.Create(pnlDisplayMain,FModID);
  end;
end;

end.
