unit TagOperator_SumPackFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFrm, BaseOperatorFrm_Mod531,
  Bde.DBTables, Vcl.ExtCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, Vcl.Menus, Vcl.StdCtrls, Data.DB, Datasnap.DBClient, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, uBaseMainFrm, Vcl.XPMan, Vcl.Buttons;

type
  TfrmTagOperator_SumPack = class(TfrmBaseMain)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData;override;
  end;

var
  frmTagOperator_SumPack: TfrmTagOperator_SumPack;

implementation

uses
  uCommFunc;

{$R *.dfm}

{ TfrmTagOperator_SumPack }

procedure TfrmTagOperator_SumPack.GetData;
begin
  //inherited;

end;

end.
