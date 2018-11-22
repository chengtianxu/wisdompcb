unit zaitu_invt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, DB, ADODB;

type
  TForm_zaitu = class(TForm)
    ADODataSet1: TADODataSet;
    DataSource1: TDataSource;
    ADODataSet1zaitu: TFloatField;
    ADODataSet1ABBR_NAME: TStringField;
    ADODataSet1tax_price: TFloatField;
    ADODataSet1TAX_2: TBCDField;
    ADODataSet1REQ_DATE: TDateTimeField;
    ADODataSet1PO_NUMBER: TStringField;
    ADODataSet1reason: TStringField;
    ADODataSet1rohs: TStringField;
    ADODataSet1UNIT_NAME: TStringField;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Button1: TButton;
    ADODataSet1CODE: TStringField;
    ADODataSet1ANALYSIS_CODE_1: TStringField;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_zaitu: TForm_zaitu;

implementation

uses damo;

{$R *.dfm}

procedure TForm_zaitu.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (chr(key)='S') and (ssalt in shift) then
  showmessage(ADODataSet1.CommandText);
end;

end.
