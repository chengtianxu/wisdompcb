unit MainFrm_Mod474SysuserSet;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan,
  Datasnap.DBClient, Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls;

type
  TfrmMain_Mod474SysuserSet = class(TfrmBaseMain)
    N1: TMenuItem;
    btnDispachAuth: TBitBtn;
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData();override;
  end;

implementation

uses
  SysuserEdit_Mod474, uCommFunc;

{$R *.dfm}

{ TfrmMain_Mod474 }

procedure TfrmMain_Mod474SysuserSet.GetData;
begin
  FMainFrmSql := cdsMain.CommandText;
  inherited;
end;

procedure TfrmMain_Mod474SysuserSet.N1Click(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(3,FModID) then Exit;

  if frmSysuserEdit_Mod474 = nil then
  begin
    frmSysuserEdit_Mod474 := TfrmSysuserEdit_Mod474.Create(Self);
    frmSysuserEdit_Mod474.Init;
  end;
  frmSysuserEdit_Mod474.FTargetUser73 := cdsMain.FieldByName('rkey').AsString;
  frmSysuserEdit_Mod474.GetData(IntToStr(FModID));
  frmSysuserEdit_Mod474.show;
end;

end.
