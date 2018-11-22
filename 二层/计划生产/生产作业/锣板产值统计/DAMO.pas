unit DAMO;

interface

uses
  SysUtils, Classes, DB, ADODB, Provider, DBClient;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    adoMain: TADODataSet;
    adoTmp: TADOQuery;
    adoTime: TADOQuery;
    adoMainnumber: TStringField;
    adoMainttype: TWordField;
    adoMainDEPT_PTR: TIntegerField;
    adoMainDEPT_CODE: TStringField;
    adoMainDEPT_NAME: TStringField;
    adoMainstart_date: TDateTimeField;
    adoMainstatus: TWordField;
    adoMainstrStatus: TStringField;
    adoMainend_date: TDateTimeField;
    adoMainEMPL_PTR: TIntegerField;
    adoMainStatistic_date: TDateTimeField;
    adoMainauthempl_ptr: TIntegerField;
    adoMainauth_date: TDateTimeField;
    adoMaintheory_result: TBCDField;
    adoMainmeasure_result1: TBCDField;
    adoMainmeasure_result2: TBCDField;
    adoMainmeasure_result3: TBCDField;
    adoMaintheorycalc_meth: TStringField;
    adoMainmeasurecalc_meth1: TStringField;
    adoMainmeasurecalc_meth2: TStringField;
    adoMainmeasurecalc_meth3: TStringField;
    adoMainmaster_remark: TStringField;
    adoMainStatistic_user: TStringField;
    adoMainauth_username: TStringField;
    adoMainrkey: TAutoIncField;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ado571: TADOQuery;
    ado571Statistic_ptr: TIntegerField;
    ado571recno_number: TIntegerField;
    ado571ttype: TWordField;
    ado571WORK_ORDER_number: TStringField;
    ado571PANEL_A_B: TStringField;
    ado571customer_name: TStringField;
    ado571MANU_PART_NUMBER: TStringField;
    ado571MANU_PART_DESC: TStringField;
    ado571pan_qty: TIntegerField;
    ado571pcs_qty: TIntegerField;
    ado571pan_size: TStringField;
    ado571pcs_size: TStringField;
    ado571pan_sqrt: TBCDField;
    ado571pcs_sqrt: TBCDField;
    ado571theory_result: TBCDField;
    ado571PARA_PTR_0: TIntegerField;
    ado571PARA_PTR_1: TIntegerField;
    ado571PARA_VALUE_0: TStringField;
    ado571PARA_VALUE_1: TStringField;
    ado571REMARK: TStringField;
    ado571type: TStringField;
    ado571layers: TWordField;
    dsp571: TDataSetProvider;
    cds571: TClientDataSet;
    cds571type: TStringField;
    cds571WORK_ORDER_number: TStringField;
    cds571PANEL_A_B: TStringField;
    cds571customer_name: TStringField;
    cds571MANU_PART_NUMBER: TStringField;
    cds571MANU_PART_DESC: TStringField;
    cds571pan_qty: TIntegerField;
    cds571pcs_qty: TIntegerField;
    cds571pan_size: TStringField;
    cds571pcs_size: TStringField;
    cds571pan_sqrt: TBCDField;
    cds571pcs_sqrt: TBCDField;
    cds571theory_result: TBCDField;
    cds571PARA_PTR_0: TIntegerField;
    cds571PARA_PTR_1: TIntegerField;
    cds571PARA_VALUE_0: TStringField;
    cds571PARA_VALUE_1: TStringField;
    cds571REMARK: TStringField;
    cds571layers: TSmallintField;
    cds571Statistic_ptr: TIntegerField;
    cds571recno_number: TIntegerField;
    cds571ttype: TSmallintField;
    ado571total_sqrt: TBCDField;
    cds571total_sqrt: TBCDField;
    ado571if_read571: TStringField;
    cds571if_read571: TStringField;
    cds571perpanel_result: TBCDField;
    procedure cds571AfterPost(DataSet: TDataSet);
    procedure cds571CalcFields(DataSet: TDataSet);
    procedure cds571pan_qtyChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses PasModify;

{$R *.dfm}

procedure TDM.cds571AfterPost(DataSet: TDataSet);
begin
    frmModify.edtSum.Text:=frmModify.DB571.GetFooterValue(0,frmModify.DB571.FieldColumns['theory_result']);
end;

procedure TDM.cds571CalcFields(DataSet: TDataSet);
begin
  if cds571pan_qty.AsInteger>0 then
    cds571perpanel_result.AsCurrency:= cds571theory_result.AsCurrency / cds571pan_qty.AsCurrency
  else
    cds571perpanel_result.AsCurrency:=0;
end;

procedure TDM.cds571pan_qtyChange(Sender: TField);
begin
  cds571theory_result.AsString:='0';
end;

end.
