unit Report13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppModule, raCodMod, ppBands, ppCtrls, ppVar, ppPrnabl, ppClass,
  ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, DB, ADODB,
  StdCtrls, ppEndUsr;

type
  TFrmReport13 = class(TForm)
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    ADOData0493: TADODataSet;
    ADO1: TADOQuery;
    ppDBPipeline1: TppDBPipeline;
    Data0493: TppDBPipeline;
    ADO1grn_number: TStringField;
    ADO1ref_number: TStringField;
    ADO1code: TStringField;
    ADO1supplier_name: TStringField;
    ADO1analysis_code1: TStringField;
    ADO1analysis_code2: TStringField;
    ADO1analysis_code3: TStringField;
    ADO1po_number: TStringField;
    ADO1description: TStringField;
    ADO1description2: TStringField;
    ADO1quan_ord: TFloatField;
    ADO1quantity_received: TFloatField;
    ADO1del_date: TDateTimeField;
    ADO1unit_price: TFloatField;
    ADO1curr_code: TStringField;
    ADO1exchange_rate: TFloatField;
    ADO1fob: TStringField;
    ADO1UNIT_CODE: TStringField;
    ADO1PO_DATE: TDateTimeField;
    ADO1date_recd: TDateTimeField;
    ADO1quan_recd: TFloatField;
    ADO1warehouse_name: TStringField;
    ADO1GUI_GE: TStringField;
    ADO1employee_name: TStringField;
    ADO1amount: TFloatField;
    ADO1analysis_code_1: TStringField;
    ADO1analysis_code_2: TStringField;
    ADO1analysis_code_3: TStringField;
    ADO1analysis_code_4: TStringField;
    ADO1analysis_code_5: TStringField;
    ppReport1: TppReport;
    ppDesigner1: TppDesigner;
    procedure ppReport1PreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmReport13: TFrmReport13;

implementation
uses datamodule;
{$R *.dfm}

procedure TFrmReport13.ppReport1PreviewFormCreate(Sender: TObject);
begin
  ppReport1.PreviewForm.WindowState := wsMaximized;
end;

end.
