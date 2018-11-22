unit ShowShipNoInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, DB, ADODB, StdCtrls, Buttons, damo;

type
  TfrmShowShipNoInfo = class(TForm)
    eh1: TDBGridEh;
    pnl1: TPanel;
    btn1: TBitBtn;
    ads1: TADODataSet;
    ds1: TDataSource;
    ads1Barcode: TStringField;
    ads1PONumber: TStringField;
    ads1Itemcode: TStringField;
    ads1PCSpercarton: TStringField;
    ads1ItemRevision: TStringField;
    ads1VendorLotNumber: TStringField;
    ads1ourBarID: TStringField;
    ads1cmpret: TIntegerField;
    ads1cmpDate: TDateTimeField;
    ads1cmpUser: TIntegerField;
    ads1EMPLOYEE_NAME: TStringField;
    lbl1: TLabel;
    lbl2: TLabel;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData(AShipNo: string);
  end;


implementation

{$R *.dfm}

procedure TfrmShowShipNoInfo.btn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmShowShipNoInfo.GetData(AShipNo: string);
begin
  lbl2.Caption := AShipNo;
  ads1.Close;
  ads1.Parameters[0].Value := AShipNo;
  ads1.Open;
end;

end.
