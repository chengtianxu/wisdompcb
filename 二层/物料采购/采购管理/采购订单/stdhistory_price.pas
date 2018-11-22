unit stdhistory_price;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, DB, ADODB;

type
  TForm_stdprice = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    ADOstdprice: TADOQuery;
    ADOstdpriceREQ_DATE: TDateTimeField;
    ADOstdpriceUNIT_NAME: TStringField;
    ADOstdpriceCURR_NAME: TStringField;
    ADOstdpriceABBR_NAME: TStringField;
    ADOstdpricetax_price: TFloatField;
    DataSource1: TDataSource;
    ADOstdpriceQUAN_ORD: TBCDField;
    ADOstdpricePRICE: TBCDField;
    ADOstdpriceDISCOUNT2_DAYS: TSmallintField;
    ADOstdpricetax_2: TBCDField;
    ADOstdpriceQUAN_RECD: TBCDField;
    ADOstdpricereason: TStringField;
    ADOstdpriceextra_req: TStringField;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_stdprice: TForm_stdprice;

implementation

uses damo;

{$R *.dfm}

procedure TForm_stdprice.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=27 then ModalResult := mrok;
end;

end.
