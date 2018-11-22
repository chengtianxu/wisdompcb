unit PoSearchFrm_Mod664;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Data.DB, Datasnap.DBClient,uBaseMainFrm,
  Vcl.XPMan, Vcl.Menus;

type
  TfrmPoSearch_Mod664 = class(TfrmBaseMain)
    btnS: TBitBtn;
    procedure ehMainDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData;override;
  end;

var
  frmPoSearch_Mod664: TfrmPoSearch_Mod664;

implementation

uses  uCommFunc;

{$R *.dfm}

{ TfrmPoSearch_Mod664 }

procedure TfrmPoSearch_Mod664.ehMainDblClick(Sender: TObject);
begin
  inherited;
  ModalResult:=mrOk;
end;

procedure TfrmPoSearch_Mod664.GetData;
begin
  FMainFrmSql:= cdsMain.CommandText;
  inherited;
end;

end.
