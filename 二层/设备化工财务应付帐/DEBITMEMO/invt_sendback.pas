unit invt_sendback;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TForm_sendback = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    aqwz95: TADOQuery;
    aqwz95RKEY: TIntegerField;
    aqwz95INV_NAME: TStringField;
    aqwz95INV_DESCRIPTION: TStringField;
    aqwz95GRN_NUMBER: TStringField;
    aqwz95DELIVER_NUMBER: TStringField;
    aqwz95PRICE: TBCDField;
    aqwz95TAX_2: TBCDField;
    aqwz95UNIT_NAME: TStringField;
    aqwz95QUANTITY: TFloatField;
    aqwz95TRAN_DATE: TDateTimeField;
    aqwz95EMPLOYEE_NAME: TStringField;
    aqwz95amount: TFloatField;
    aqwz95tax_amount: TFloatField;
    Button1: TButton;
    Button2: TButton;
    Panel1: TPanel;
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_sendback: TForm_sendback;

implementation

uses datamd;

{$R *.dfm}

procedure TForm_sendback.DBGrid1DblClick(Sender: TObject);
begin
self.ModalResult:=mrok;
end;

end.
