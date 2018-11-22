unit ToolCostEditFrm_mod354.pas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseEditFrm,uCommFunc, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Data.DB,
  Datasnap.DBClient;

type
  TfrmToolCostEdit_mod354 = class(TfrmBaseEdit)
    eh62: TDBGridEh;
    ds62: TDataSource;
    cds62: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmToolCostEdit_mod354: TfrmToolCostEdit_mod354;

implementation

{$R *.dfm}

end.
