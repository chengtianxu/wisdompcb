unit historypr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, ADODB, Grids, DBGrids;

type
  TFrm_historypr = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ads69: TADODataSet;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    BtnExcel: TBitBtn;
    procedure BtnExcelClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_historypr: TFrm_historypr;

implementation

uses DM_u,common;

{$R *.dfm}

procedure TFrm_historypr.BtnExcelClick(Sender: TObject);
begin
 if not ads69.IsEmpty then
 Export_dbGrid_to_Excel(dbGrid1,'最近历史请购');
end;

procedure TFrm_historypr.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(ads69.CommandText);
end;

end.
