unit UMainfrm_Mod38Caller;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ubaseMainfrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Vcl.ComCtrls, Data.DB, Vcl.XPMan,
  Vcl.Menus, Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls,
  uMainfrm_Mod38OutToDept, uMainfrm_Mod38OutToBill, uMainfrm_Mod38OutToCheck,
  uMainfrm_Mod38OutToReq, uMainfrm_Mod38OtherMtlOutToDept, System.DateUtils,
  uMainfrm_Mod38ReBackAndReprt, uMainfrm_Mod38SendInfoForSafeQty, umod38common,
  ucommfunc;

type
  TfrmMain_Mod38Caller = class(TfrmBaseMain)
    tv1: TTreeView;
    procedure tv1Change(Sender: TObject; Node: TTreeNode);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    FDisplayFrm_ToDept1: TFrmMain_Mod38OutToDept;
    FDisplayFrm_ToPBill2: TFrmMain_Mod38OutToBill;
    FDisplayFrm_ToCheck3: TFrmMain_Mod38OutToCheck;
    FDisplayFrm_ToReq4: TFrmMain_Mod38OutToReq;
    FDisplayFrm_ToOtherDept6: TFrmMain_Mod38OtherMtlOutToDept;
    FDisplayFrm_Return8: TFrmMain_Mod38ReBackAndReprt;
    FDisplayFrm_SendMsg9: TFrmMain_Mod38SendInfoForSafeQty;

    procedure AfterGetData; override;

  end;

var
  frmMain_Mod38Caller: TfrmMain_Mod38Caller;

implementation

{$R *.dfm}

procedure TfrmMain_Mod38Caller.AfterGetData;
begin
  inherited;
  tv1.Items[0].Expand(True);
  pnlChildMain.Visible := False;
  tv1.Items[0].Item[0].Selected := True;
end;

procedure TfrmMain_Mod38Caller.FormCreate(Sender: TObject);
begin
  inherited;
tv1.FullExpand ;
end;

procedure TfrmMain_Mod38Caller.tv1Change(Sender: TObject; Node: TTreeNode);
begin
  inherited;

   FDisplayFrm_ToDept1 := nil  ;
   FDisplayFrm_ToPBill2 :=nil ;
   FDisplayFrm_ToCheck3 :=nil  ;
   FDisplayFrm_ToReq4 :=nil  ;
   FDisplayFrm_ToOtherDept6 :=nil;
   FDisplayFrm_Return8 :=nil   ;
   FDisplayFrm_SendMsg9 :=nil  ;


  if Node.AbsoluteIndex = 1 then
  begin

    if FDisplayFrm_ToDept1 = nil then
    begin
      FDisplayFrm_ToDept1 := TFrmMain_Mod38OutToDept.Create(pnlDisplayMain);
      FDisplayFrm_ToDept1.Init;
    end;

    FDisplayFrm_ToDept1.pnlmain.Visible := True;
    FDisplayFrm_ToDept1.pnlmain.parent := pnlDisplayMain;
    FDisplayFrm_ToDept1.GetData;
    FDisplayFrm_ToDept1.Append457;

  end;

  if Node.AbsoluteIndex = 2 then
  begin

    if FDisplayFrm_ToPBill2 = nil then
    begin
      FDisplayFrm_ToPBill2 := TFrmMain_Mod38OutToBill.Create(pnlDisplayMain);
      FDisplayFrm_ToPBill2.Init;

    end;

    FDisplayFrm_ToPBill2.pnlmain.Visible := True;
    FDisplayFrm_ToPBill2.pnlmain.parent := pnlDisplayMain;

    FDisplayFrm_ToPBill2.GetData('-1');
    FDisplayFrm_ToPBill2.Append457;
  end;

  if Node.AbsoluteIndex = 3 then
  begin
    if FDisplayFrm_ToCheck3 = nil then
    begin
      FDisplayFrm_ToCheck3 := TFrmMain_Mod38OutToCheck.Create(pnlDisplayMain);
      FDisplayFrm_ToCheck3.Init;

    end;
    FDisplayFrm_ToCheck3.pnlmain.Visible := True;
    FDisplayFrm_ToCheck3.pnlmain.parent := pnlDisplayMain;

    FDisplayFrm_ToCheck3.GetData;
  end;

  if Node.AbsoluteIndex = 4 then
  begin
    if FDisplayFrm_ToReq4 = nil then
    begin
      FDisplayFrm_ToReq4 := TFrmMain_Mod38OutToReq.Create(pnlDisplayMain);
      FDisplayFrm_ToReq4.Init;
    end;

    FDisplayFrm_ToReq4.pnlmain.Visible := True;
    FDisplayFrm_ToReq4.pnlmain.parent := pnlDisplayMain;

    FDisplayFrm_ToReq4.GetData('-1');
    FDisplayFrm_ToReq4.Append457;

  end;

  if Node.AbsoluteIndex = 6 then
  begin
    if FDisplayFrm_ToOtherDept6 = nil then
    begin
      FDisplayFrm_ToOtherDept6 := TFrmMain_Mod38OtherMtlOutToDept.Create
        (pnlDisplayMain);
      FDisplayFrm_ToOtherDept6.Init;

    end;
    FDisplayFrm_ToOtherDept6.pnlmain.Visible := True;
    FDisplayFrm_ToOtherDept6.pnlmain.parent := pnlDisplayMain;

    FDisplayFrm_ToOtherDept6.GetData;
    FDisplayFrm_ToOtherDept6.Append457;
  end;

  if Node.AbsoluteIndex = 8 then
  begin
    if FDisplayFrm_Return8 = nil then
    begin
      FDisplayFrm_Return8 := TFrmMain_Mod38ReBackAndReprt.Create
        (pnlDisplayMain, FModID);

    end;
    FDisplayFrm_Return8.pnlDisplayMain.Visible := True;
    FDisplayFrm_Return8.pnlDisplayMain.parent := pnlDisplayMain;

    FDisplayFrm_Return8.GetData;
  end;

  if Node.AbsoluteIndex = 9 then
  begin
    if FDisplayFrm_SendMsg9 = nil then
    begin
      FDisplayFrm_SendMsg9 := TFrmMain_Mod38SendInfoForSafeQty.Create
        (pnlDisplayMain);

    end;
    FDisplayFrm_SendMsg9.pnl1.Visible := True;
    FDisplayFrm_SendMsg9.pnl1.parent := pnlDisplayMain;

    FDisplayFrm_SendMsg9.GetData;
  end;


 /////////////////////////////////////////////////////////////////////////////////


 { if FrmMain_Mod38OutToDept <> nil then
    FrmMain_Mod38OutToDept.pnlmain.Visible := False;
  if FrmMain_Mod38OutToBill <> nil then
    FrmMain_Mod38OutToBill.pnlmain.Visible := False;
  if FrmMain_Mod38OutToCheck <> nil then
    FrmMain_Mod38OutToCheck.pnlmain.Visible := False;
  if FrmMain_Mod38OutToReq <> nil then
    FrmMain_Mod38OutToReq.pnlmain.Visible := False;
  if FrmMain_Mod38OtherMtlOutToDept <> nil then
    FrmMain_Mod38OtherMtlOutToDept.pnlmain.Visible := False;
  if FDisplayFrm_Return8 <> nil then
    FDisplayFrm_Return8.pnlDisplayMain.Visible := False;
  if FDisplayFrm_SendMsg9 <> nil then
    FDisplayFrm_SendMsg9.pnl1.Visible := False;



  if Node.AbsoluteIndex = 1 then
  begin

    if FrmMain_Mod38OutToDept = nil then
    begin
      FrmMain_Mod38OutToDept := TFrmMain_Mod38OutToDept.Create(pnlDisplayMain);
      FrmMain_Mod38OutToDept.Init;
    end;

    FrmMain_Mod38OutToDept.pnlmain.Visible := True;
    FrmMain_Mod38OutToDept.pnlmain.parent := pnlDisplayMain;
    FrmMain_Mod38OutToDept.GetData;
    FrmMain_Mod38OutToDept.Append457;

  end;

  if Node.AbsoluteIndex = 2 then
  begin

    if FrmMain_Mod38OutToBill = nil then
    begin
      FrmMain_Mod38OutToBill := TFrmMain_Mod38OutToBill.Create(pnlDisplayMain);
      FrmMain_Mod38OutToBill.Init;

    end;

    FrmMain_Mod38OutToBill.pnlmain.Visible := True;
    FrmMain_Mod38OutToBill.pnlmain.parent := pnlDisplayMain;

    FrmMain_Mod38OutToBill.GetData('-1');
    FrmMain_Mod38OutToBill.Append457;
  end;

  if Node.AbsoluteIndex = 3 then
  begin
    if FrmMain_Mod38OutToCheck = nil then
    begin
      FrmMain_Mod38OutToCheck := TFrmMain_Mod38OutToCheck.Create(pnlDisplayMain);
      FrmMain_Mod38OutToCheck.Init;

    end;
    FrmMain_Mod38OutToCheck.pnlmain.Visible := True;
    FrmMain_Mod38OutToCheck.pnlmain.parent := pnlDisplayMain;

    FrmMain_Mod38OutToCheck.GetData;
  end;

  if Node.AbsoluteIndex = 4 then
  begin
    if FrmMain_Mod38OutToReq = nil then
    begin
      FrmMain_Mod38OutToReq := TFrmMain_Mod38OutToReq.Create(pnlDisplayMain);
      FrmMain_Mod38OutToReq.Init;
    end;

    FrmMain_Mod38OutToReq.pnlmain.Visible := True;
    FrmMain_Mod38OutToReq.pnlmain.parent := pnlDisplayMain;

    FrmMain_Mod38OutToReq.GetData('-1');
    FrmMain_Mod38OutToReq.Append457;

  end;

  if Node.AbsoluteIndex = 6 then
  begin
    if FrmMain_Mod38OtherMtlOutToDept = nil then
    begin
      FrmMain_Mod38OtherMtlOutToDept := TFrmMain_Mod38OtherMtlOutToDept.Create
        (pnlDisplayMain);
      FrmMain_Mod38OtherMtlOutToDept.Init;

    end;
    FrmMain_Mod38OtherMtlOutToDept.pnlmain.Visible := True;
    FrmMain_Mod38OtherMtlOutToDept.pnlmain.parent := pnlDisplayMain;

    FrmMain_Mod38OtherMtlOutToDept.GetData;
    FrmMain_Mod38OtherMtlOutToDept.Append457;
  end;

  if Node.AbsoluteIndex = 8 then
  begin
    if FDisplayFrm_Return8 = nil then
    begin
      FDisplayFrm_Return8 := TFrmMain_Mod38ReBackAndReprt.Create
        (pnlDisplayMain, FModID);

    end;
    FDisplayFrm_Return8.pnlDisplayMain.Visible := True;
    FDisplayFrm_Return8.pnlDisplayMain.parent := pnlDisplayMain;

    FDisplayFrm_Return8.GetData;
  end;

  if Node.AbsoluteIndex = 9 then
  begin
    if FDisplayFrm_SendMsg9 = nil then
    begin
      FDisplayFrm_SendMsg9 := TFrmMain_Mod38SendInfoForSafeQty.Create
        (pnlDisplayMain);

    end;
    FDisplayFrm_SendMsg9.pnl1.Visible := True;
    FDisplayFrm_SendMsg9.pnl1.parent := pnlDisplayMain;

    FDisplayFrm_SendMsg9.GetData;
  end; }

end;

end.
