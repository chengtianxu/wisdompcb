unit Tree_Mod564;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseMainFrm, Vcl.ComCtrls,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB,
  Vcl.XPMan, Vcl.Menus, Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls,
  VMIchuku_Mod564,VMIchukushen_Mod564,VMIruku_Mod564,VMIQuery_Mod564,VMIrukuMX,VMIrukuSummary,
  VMIchukuSummary,VMIchukuMX,MVIkucunMX,VMIkucunSummary,VMIStopNum_Mod564;

type
  TfrmTree_Mod564 = class(TfrmBaseMain)
    tv1: TTreeView;
    procedure tv1Change(Sender: TObject; Node: TTreeNode);
  private
    { Private declarations }
  public
    { Public declarations }
//    FDisplayFrm6: TfrmVMIQuery_Mod564;
    FDisplayFrm1: TfrmVMIruku_Mod564;
    FDisplayFrm3: TfrmVMIchuku_Mod564;
    FDisplayFrm4: TfrmVMIchukushen_Mod564;
    FDisplayFrm6: TfrmVMIrukuMX;
    FDisplayFrm7: TfrmVMIrukuSummary;
    FDisplayFrm8: TfrmVMIchukuMX;
    FDisplayFrm9: TfrmVMIchukuSummary;
    FDisplayFrm10: TfrmMVIkucunMX;
    FDisplayFrm11: TfrmVMIkucunSummary;
    FDisplayFrm12: TfrmVMIStopNum_Mod564;
    procedure AfterGetData;override;
  end;

var
  frmTree_Mod564: TfrmTree_Mod564;

implementation

{$R *.dfm}


{ TfrmTree_Mod564 }

procedure TfrmTree_Mod564.AfterGetData;
begin
  inherited;
  tv1.Items[0].Expand(True);
  pnlChildMain.Visible := False;
  tv1.Items[0].Item[0].Selected := True;
end;

procedure TfrmTree_Mod564.tv1Change(Sender: TObject; Node: TTreeNode);
begin
  inherited;
  if FDisplayFrm1 <> nil then FDisplayFrm1.pnlMain.Visible := False;
  if FDisplayFrm3 <> nil then FDisplayFrm3.pnlMain.Visible := False;
  if FDisplayFrm4 <> nil then FDisplayFrm4.pnlMain.Visible := False;
  if FDisplayFrm6 <> nil then FDisplayFrm6.pnlMain.Visible := False;
  if FDisplayFrm7 <> nil then FDisplayFrm7.pnlMain.Visible := False;
  if FDisplayFrm8 <> nil then FDisplayFrm8.pnlMain.Visible := False;
  if FDisplayFrm9 <> nil then FDisplayFrm9.pnlMain.Visible := False;
  if FDisplayFrm10 <> nil then FDisplayFrm10.pnlMain.Visible := False;
  if FDisplayFrm11 <> nil then FDisplayFrm11.pnlMain.Visible := False;
  if FDisplayFrm12 <> nil then FDisplayFrm12.pnlMain.Visible:=False;

  if Node.AbsoluteIndex = 1 then
  begin
    if FDisplayFrm1 = nil then
      FDisplayFrm1 := TfrmVMIruku_Mod564.Create(pnlDisplayMain,FModID);
    FDisplayFrm1.pnlMain.Visible := True;
  end;
  if Node.AbsoluteIndex = 3 then
  begin
    if FDisplayFrm3 = nil then
      FDisplayFrm3 := TfrmVMIchuku_Mod564.Create(pnlDisplayMain,FModID);
    FDisplayFrm3.pnlMain.Visible := True;
  end;
  if Node.AbsoluteIndex = 4 then
  begin
    if FDisplayFrm4 = nil then
      FDisplayFrm4 := TfrmVMIchukushen_Mod564.Create(pnlDisplayMain,FModID);
    FDisplayFrm4.pnlMain.Visible := True;
  end;
  if Node.AbsoluteIndex = 6 then
  begin
//先显示查询窗品的写法
//    if FDisplayFrm6 = nil then
//      FDisplayFrm6 := TfrmVMIQuery_Mod564.Create(pnlDisplayMain);
//    FDisplayFrm6.pnl2.Parent := pnlDisplayMain;
//    FDisplayFrm6.pnl2.Visible := True;
//    FDisplayFrm6.RadioGroup1.ItemIndex:=0;
    if FDisplayFrm6 = nil then
      FDisplayFrm6 := TfrmVMIrukuMX.Create(pnlDisplayMain,FModID);
    FDisplayFrm6.pnlMain.Visible := True;
    frmVMIQuery_Mod564 := TfrmVMIQuery_Mod564.Create(Self);
  end;
  if Node.AbsoluteIndex = 7 then
  begin
    if FDisplayFrm7 = nil then
      FDisplayFrm7 := TfrmVMIrukuSummary.Create(pnlDisplayMain,FModID);
    FDisplayFrm7.pnlMain.Visible := True;
    frmVMIQuery_Mod564 := TfrmVMIQuery_Mod564.Create(Self);
  end;
  if Node.AbsoluteIndex = 8 then
  begin
    if FDisplayFrm8 = nil then
      FDisplayFrm8 := TfrmVMIchukuMX.Create(pnlDisplayMain,FModID);
    FDisplayFrm8.pnlMain.Visible := True;
    frmVMIQuery_Mod564 := TfrmVMIQuery_Mod564.Create(Self);
  end;
  if Node.AbsoluteIndex = 9 then
  begin
    if FDisplayFrm9 = nil then
    begin
      FDisplayFrm9 := TfrmVMIchukuSummary.Create(pnlDisplayMain,FModID);
    end;
    FDisplayFrm9.pnlMain.Visible := True;
    frmVMIQuery_Mod564 := TfrmVMIQuery_Mod564.Create(Self);
  end;
  if Node.AbsoluteIndex = 10 then
  begin
    if FDisplayFrm10 = nil then
      FDisplayFrm10 := TfrmMVIkucunMX.Create(pnlDisplayMain,FModID);
    FDisplayFrm10.pnlMain.Visible := True;
    frmVMIQuery_Mod564 := TfrmVMIQuery_Mod564.Create(Self);
  end;
  if Node.AbsoluteIndex = 11 then
  begin
    if FDisplayFrm11 = nil then
      FDisplayFrm11 := TfrmVMIkucunSummary.Create(pnlDisplayMain,FModID);
    FDisplayFrm11.pnlMain.Visible := True;
    frmVMIQuery_Mod564 := TfrmVMIQuery_Mod564.Create(Self);
  end;
  if Node.AbsoluteIndex = 12 then
  begin
    if FDisplayFrm12 = nil then
      FDisplayFrm12 := TfrmVMIStopNum_Mod564.Create(pnlDisplayMain,FModID);
    FDisplayFrm12.pnlMain.Visible := True;
    frmVMIQuery_Mod564 := TfrmVMIQuery_Mod564.Create(Self);
  end;
  tv1.FullExpand;
end;

end.
