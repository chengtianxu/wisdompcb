unit stdhistory_price;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TForm_stdprice = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    ADOstdprice: TADOQuery;
    DSstdhistory_price: TDataSource;
    DBGrid1: TDBGrid;
    ADOstdpriceABBR_NAME: TStringField;
    ADOstdpriceCURR_NAME: TStringField;
    ADOstdpricePO_DATE: TDateTimeField;
    ADOstdpricetax_price: TFloatField;
    ADOstdpricePRICE: TFloatField;
    ADOstdpriceTAX_2: TBCDField;
    ADOstdpriceQUAN_ORD: TFloatField;
    ADOstdpriceUNIT_NAME: TStringField;
    ADOstdpricePO_NUMBER: TStringField;
    ADOstdpriceSTATE_CHS: TStringField;
    ADOstdpricePRINT_DATE: TDateTimeField;
    ADOstdpriceEXCHANGE_RATE: TFloatField;
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
uses
  damo;
{$R *.dfm}

procedure TForm_stdprice.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=27 then ModalResult := mrok;
end;

end.
