unit stockqty_info;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ADODB;

type
  TForm_stockqty = class(TForm)
    AQStockQty: TADOQuery;
    DBGrid1: TDBGrid;
    DsStockQyt: TDataSource;
    AQStockQtyINV_PART_NUMBER: TStringField;
    AQStockQtyINV_NAME: TStringField;
    AQStockQtyINV_DESCRIPTION: TStringField;
    AQStockQtyGROUP_NAME: TStringField;
    AQStockQtyLOCATION: TStringField;
    AQStockQtyquan_total: TBCDField;
    AQStockQtyavl_price: TFloatField;
    AQStockQtyamount: TBCDField;
    AQStockQtyUNIT_CODE: TStringField;
    AQStockQtyreason: TStringField;
    AQStockQtyBARCODE_ID: TStringField;
    AQStockQtyABBR_NAME: TStringField;
    AQStockQtyinv_group_name: TStringField;
    AQStockQtytype: TStringField;
    AQStockQtySUPPLIER2: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_stockqty: TForm_stockqty;

implementation
uses
  DAMO;
{$R *.dfm}

end.
