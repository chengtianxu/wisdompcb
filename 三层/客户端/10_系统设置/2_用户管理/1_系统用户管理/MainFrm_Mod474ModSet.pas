unit MainFrm_Mod474ModSet;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan,
  Datasnap.DBClient, Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls;

type
  TfrmMain_Mod474ModSet = class(TfrmBaseMain)
    mniEdit: TMenuItem;
    mniUpdateVer: TMenuItem;
    procedure mniEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData();override;
  end;


implementation

uses
  Mod474ModSet_Edit, uCommFunc;

{$R *.dfm}

{ TfrmMainFrm_Mod474ModSet }

procedure TfrmMain_Mod474ModSet.GetData;
begin
  FMainFrmSql := cdsMain.CommandText;
  inherited;
end;

procedure TfrmMain_Mod474ModSet.mniEditClick(Sender: TObject);
begin
  inherited;
  if not gFunc.CheckUserAuth(2,FModID) then Exit;

  if frmMod474ModSet_Edit = nil then
  begin
    frmMod474ModSet_Edit := TfrmMod474ModSet_Edit.Create(Self);
    frmMod474ModSet_Edit.Init;
  end;
  frmMod474ModSet_Edit.GetData(cdsMain.FieldByName('ModID').AsString);
  frmMod474ModSet_Edit.Show;
end;

end.
