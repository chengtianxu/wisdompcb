unit HistoryRq_Mod280;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseFrm, Vcl.StdCtrls, Vcl.Buttons,uCommFunc,
  Vcl.ExtCtrls, Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh;

type
  TfrmHistoryRq_Mod280 = class(TfrmBase)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BtnExcel: TBitBtn;
    cds69: TClientDataSet;
    ds69: TDataSource;
    eh69: TDBGridEh;
    procedure BtnExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHistoryRq_Mod280: TfrmHistoryRq_Mod280;

implementation

{$R *.dfm}

procedure TfrmHistoryRq_Mod280.BtnExcelClick(Sender: TObject);
begin
  inherited;
  if not cds69.IsEmpty then
  begin
    gFunc.Export_dbGridEH_to_Excel(eh69);
  end;
end;

end.
