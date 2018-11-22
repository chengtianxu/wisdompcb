unit PasViewSales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, DB;

type
  TfrmViewSales = class(TForm)
    PanelTOP: TPanel;
    labCutNo: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGridEh1: TDBGridEh;
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmViewSales: TfrmViewSales;

implementation
uses DmUnit1,common;
{$R *.dfm}

procedure TfrmViewSales.FormShow(Sender: TObject);
begin
  dm.AdoViewSales.Close;
  dm.AdoViewSales.Parameters.ParamByName('CUT_NO').Value:=dm.ADOQuery1.FieldByName('CUT_NO').AsString;
//  dm.AdoViewSales.Parameters.ParamByName('SALES_ORDER').Value:=dm.ADOQuery1.FieldByName('SO_NO').AsString;
  dm.AdoViewSales.Open;
end;

procedure TfrmViewSales.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmViewSales.BitBtn2Click(Sender: TObject);
begin
  Export_dbGrideh_to_Excel(DBGrideh1,'查看销售订单') ;
end;

procedure TfrmViewSales.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key) = 'S') and (ssalt in shift) then
      showmessage(DM.AdoViewSales.SQL.Text);
end;

end.
