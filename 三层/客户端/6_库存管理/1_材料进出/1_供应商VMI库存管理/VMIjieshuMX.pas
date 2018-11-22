unit VMIjieshuMX;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,ubasemainfrm,ucommfunc, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan, Vcl.Menus,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls;

type
  TfrmVMIjieshuMX = class(TfrmBaseMain)
  private
    { Private declarations }
  public
    Lw3:string;
    { Public declarations }
    procedure GetData();override;
  end;

var
  frmVMIjieshuMX: TfrmVMIjieshuMX;

implementation

{$R *.dfm}

{ TfrmVMIjieshuMX }

procedure TfrmVMIjieshuMX.GetData;
begin
  FWhere3 :=Lw3;
  FMainFrmSql := cdsMain.CommandText;
  FOrderby := ' ORDER BY Data0017.INV_PART_NUMBER';
  inherited;
end;

end.
