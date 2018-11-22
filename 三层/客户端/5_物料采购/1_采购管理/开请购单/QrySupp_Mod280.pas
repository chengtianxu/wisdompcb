unit QrySupp_Mod280;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseDBGridEhListFrm, uBaseFrm,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Vcl.StdCtrls,
  Vcl.Buttons, Data.DB, Datasnap.DBClient, EhLibVCL, GridsEh, DBAxisGridsEh,
  DBGridEh, Vcl.ExtCtrls;

type
  TfrmQrySupp_Mod280 = class(TfrmBaseDBGridEhList)
    BtCan: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData();override;
  end;

var
  frmQrySupp_Mod280: TfrmQrySupp_Mod280;

implementation

{$R *.dfm}
procedure TfrmQrySupp_Mod280.GetData;
begin
inherited;
end;
end.
