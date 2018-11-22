unit Report1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppModule, raCodMod, ppBands, ppCtrls, ppVar, ppPrnabl, ppClass,
  ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, DB, ADODB,
  StdCtrls, ppStrtch, ppMemo, ppEndUsr,raide;

type
  TFrmReport1 = class(TForm)
    ADOData0493: TADOQuery;
    DataSource1: TDataSource;
    DataSource4: TDataSource;
    ppReport1: TppReport;
    Data0493: TppDBPipeline;
    Query60: TADOQuery;
    ppDesigner1: TppDesigner;
    ppTitleBand1: TppTitleBand;
    ppLabel1: TppLabel;
    ppDBText22: TppDBText;
    ppLabel19: TppLabel;
    ppLabel21: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel33: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppHeaderBand1: TppHeaderBand;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel11: TppLabel;
    ppLabel13: TppLabel;
    ppLabel15: TppLabel;
    ppLabel17: TppLabel;
    ppLabel20: TppLabel;
    ppLabel22: TppLabel;
    ppLabel30: TppLabel;
    ppLabel14: TppLabel;
    ppLabel16: TppLabel;
    ppLabel18: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText10: TppDBText;
    ppDBText12: TppDBText;
    ppDBText14: TppDBText;
    ppDBText16: TppDBText;
    ppDBText19: TppDBText;
    ppDBText21: TppDBText;
    ppDBText11: TppDBText;
    ppDBText13: TppDBText;
    ppDBText15: TppDBText;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppVariable1: TppVariable;
    ppLine25: TppLine;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppSystemVariable2: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppVariable3: TppVariable;
    ppLabel34: TppLabel;
    ppVariable4: TppVariable;
    ppLabel35: TppLabel;
    ppVariable5: TppVariable;
    ppLabel36: TppLabel;
    ppVariable6: TppVariable;
    ppLabel37: TppLabel;
    ppVariable7: TppVariable;
    ppLabel38: TppLabel;
    ppVariable8: TppVariable;
    ppLabel39: TppLabel;
    ppVariable9: TppVariable;
    ppLabel40: TppLabel;
    ppLine26: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBCalc1: TppDBCalc;
    ppDBText9: TppDBText;
    ppLabel10: TppLabel;
    ppLabel12: TppLabel;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLine22: TppLine;
    raCodeModule1: TraCodeModule;
    Query60cust_code: TStringField;
    Query60customer_name: TStringField;
    Query60ANALYSIS_CODE_2: TStringField;
    Query60MANU_PART_NUMBER: TStringField;
    Query60MANU_PART_DESC: TStringField;
    Query60to_be_planned: TIntegerField;
    Query60product_name: TStringField;
    Query60po_number: TStringField;
    Query60sales_order: TStringField;
    Query60orig_request_date: TDateTimeField;
    Query60layers: TWordField;
    Query60orig_sched_ship_date: TDateTimeField;
    Query60qty_plannned: TIntegerField;
    Query60prod_rel: TStringField;
    Query60rkey: TAutoIncField;
    Query60prod_code: TStringField;
    Query60so_tp: TWordField;
    Query60SALES_REP_NAME: TStringField;
    Query60curr_code: TStringField;
    Query60part_price: TFloatField;
    Query60exch_rate: TFloatField;
    Query60ent_date: TDateTimeField;
    Query60status: TWordField;
    Query60REFERENCE_NUMBER: TStringField;
    Query60parts_ordered: TFloatField;
    Query60parts_shipped: TFloatField;
    Query60parts_returned: TFloatField;
    Query60parts_invoiced: TFloatField;
    Query60ISSUED_QTY: TIntegerField;
    Query60parts_needed: TFloatField;
    Query60free_amount: TFloatField;
    Query60sch_date: TDateTimeField;
    Query60total_add_l_price: TFloatField;
    Query60returned_ship: TIntegerField;
    Query60parameter_value: TFloatField;
    Query60sq_parts: TFloatField;
    Query60sq_needed1: TFloatField;
    Query60sq_needed: TFloatField;
    SO_Info: TppDBPipeline;
    Query60abbr_name: TStringField;
    Query60qty_on_hand: TIntegerField;
    procedure ppReport1PreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmReport1: TFrmReport1;

implementation

uses uDM;

{$R *.dfm}

procedure TFrmReport1.ppReport1PreviewFormCreate(Sender: TObject);
begin
  ppReport1.PreviewForm.WindowState := wsMaximized;
end;

end.
