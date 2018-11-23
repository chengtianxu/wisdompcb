unit qk1604001PeopList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkSvrIntf.ClientIntf,qkBaseGridFrm,qkFunc.Commfunc,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls, RzPanel, qkBaseMainFrm,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask, RzEdit,
  RzButton, RzLabel, Vcl.Menus, qk1604001PeopEdit;

type
  Tfrmqk1604001PeopList = class(TfrmqkBaseMain)
    cbxOffDuty: TCheckBox;
    cbxOnDuty: TCheckBox;
    mniN1: TMenuItem;
    mniN2: TMenuItem;
    procedure cbxOnDutyClick(Sender: TObject);
    procedure mniEditClick(Sender: TObject);
    procedure mniN2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure Tfrmqk1604001PeopList.cbxOnDutyClick(Sender: TObject);
begin
  inherited;
  FAddWhereLst.Clear;
  if cbxOnDuty.Checked and cbxOffDuty.Checked then
    FAddWhereLst.Add('1',' AND Local_Status in (0,1) ');
  if cbxOnDuty.Checked and not cbxOffDuty.Checked then
    FAddWhereLst.Add('2',' AND Local_Status in (1) ');
  if not cbxOnDuty.Checked and cbxOffDuty.Checked then
    FAddWhereLst.Add('3',' AND Local_Status in (0) ');
  if not cbxOnDuty.Checked and not cbxOffDuty.Checked then
    FAddWhereLst.Add('4',' AND Local_Status in (-1) ');
  btnRefreshClick(btnRefresh);
end;

procedure Tfrmqk1604001PeopList.mniEditClick(Sender: TObject);
var
  LFrm: Tfrmqk1604001PeopEdit;
begin
  //inherited;
  if not qkRight.CheckOperatorRight(ModID,(Sender as TMenuItem).Tag) then exit;
  LFrm := Tfrmqk1604001PeopEdit.Create(Self);
  try
    LFrm.FEditType := 1;//编辑

    qkTmp.ClearAll;
    with qkTmp.Pms.Add do
    begin
      Name := 'p1';
      Value := DataSet.FieldByName('IDKey').AsLargeInt;
    end;
    qkTmp.Dslst := dmSvrIntf.SqlOpen('1',qkTmp.Pms);
    if qkTmp.Dslst = nil then
      Exit;

    if not qkTmp.CopyDsLstToMT([LFrm.FDsGPeop,LFrm.mtPhoto,LFrm.mtgSysUser,LFrm.mtSysUserMod]) then
      Exit;

    qkTmp.ClearAll;
    //--查看设置只读
    if (Sender as TMenuItem).Tag = 111 then
    begin
      lfrm.FDsGPeop.ReadOnly := True;
      LFrm.mtPhoto.ReadOnly := true;
      LFrm.mtgSysUser.ReadOnly := True;
      LFrm.mtSysUserMod.ReadOnly := True;
      LFrm.btnSave.Enabled := False;
    end;
    //--

    if LFrm.ShowModal = mrOk then
    begin

    end else
    begin

    end;
  finally
    LFrm.Free;
  end;
end;

procedure Tfrmqk1604001PeopList.mniN2Click(Sender: TObject);
begin
  inherited;
  if not qkRight.CheckOperatorRight(ModID,(Sender as TMenuItem).Tag) then exit;
  if not qkDialog.OperConfig then Exit;

  qkTmp.ClearAll;
  with qkTmp.Pms.Add do
  begin
    Name := 'p1';
    Value := DataSet.FieldByName('IDKey').AsLargeInt;
  end;
  if dmSvrIntf.SqlExec('11',qkTmp.Pms) then
    qkDialog.OperSucc;
end;

end.
