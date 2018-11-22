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
    ado571PARA_PTR_2: TIntegerField;
    ado571PARA_PTR_3: TIntegerField;
    ado571PARA_VALUE_0: TStringField;
    ado571PARA_VALUE_1: TStringField;
    ado571PARA_VALUE_2: TStringField;
    ado571PARA_VALUE_3: TStringField;
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
    cds571PARA_PTR_2: TIntegerField;
    cds571PARA_PTR_3: TIntegerField;
    cds571PARA_VALUE_0: TStringField;
    cds571PARA_VALUE_1: TStringField;
    cds571PARA_VALUE_2: TStringField;
    cds571PARA_VALUE_3: TStringField;
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
    ado571PARA_PTR_4: TIntegerField;
    ado571PARA_PTR_5: TIntegerField;
    ado571PARA_PTR_6: TIntegerField;
    ado571PARA_PTR_7: TIntegerField;
    ado571PARA_PTR_8: TIntegerField;
    ado571PARA_PTR_9: TIntegerField;
    ado571PARA_VALUE_4: TStringField;
    ado571PARA_VALUE_5: TStringField;
    ado571PARA_VALUE_6: TStringField;
    ado571PARA_VALUE_7: TStringField;
    ado571PARA_VALUE_8: TStringField;
    ado571PARA_VALUE_9: TStringField;
    cds571PARA_PTR_4: TIntegerField;
    cds571PARA_PTR_5: TIntegerField;
    cds571PARA_PTR_6: TIntegerField;
    cds571PARA_PTR_7: TIntegerField;
    cds571PARA_PTR_8: TIntegerField;
    cds571PARA_PTR_9: TIntegerField;
    cds571PARA_VALUE_4: TStringField;
    cds571PARA_VALUE_5: TStringField;
    cds571PARA_VALUE_6: TStringField;
    cds571PARA_VALUE_7: TStringField;
    cds571PARA_VALUE_8: TStringField;
    cds571PARA_VALUE_9: TStringField;
    ads571: TADODataSet;
    DataSource3: TDataSource;
    ads571recno_number: TIntegerField;
    ads571ttype: TWordField;
    ads571PANEL_A_B: TStringField;
    ads571MANU_PART_NUMBER: TStringField;
    ads571MANU_PART_DESC: TStringField;
    ads571pan_qty: TIntegerField;
    ads571pcs_qty: TIntegerField;
    ads571pan_size: TStringField;
    ads571layers: TWordField;
    ads571pcs_size: TStringField;
    ads571pan_sqrt: TBCDField;
    ads571pcs_sqrt: TBCDField;
    ads571total_sqrt: TBCDField;
    ads571theory_result: TBCDField;
    ads571PARA_VALUE_0: TStringField;
    ads571PARA_VALUE_1: TStringField;
    ads571PARA_VALUE_2: TStringField;
    ads571PARA_VALUE_3: TStringField;
    ads571PARA_VALUE_4: TStringField;
    ads571PARA_VALUE_5: TStringField;
    ads571PARA_VALUE_6: TStringField;
    ads571PARA_VALUE_7: TStringField;
    ads571PARA_VALUE_8: TStringField;
    ads571PARA_VALUE_9: TStringField;
    ads571REMARK: TStringField;
    adoMainformula_number: TStringField;
    ads571start_date: TStringField;
    adoMainexpend_QUANTITY: TBCDField;
    ado571DEPT_PTR: TIntegerField;
    cds571DEPT_PTR: TIntegerField;
    cds571dept_name: TStringField;
    ads571DEPT_CODE: TStringField;
    adoMainABBR_NAME: TStringField;
    adoMainwarehouse_ptr: TIntegerField;
    ads571abbr_name: TStringField;
    ads571FORMULA_NUMBER: TStringField;
    adoMainpnl_totalsqrt: TBCDField;
    procedure cds571PARA_VALUE_0Change(Sender: TField);
    procedure cds571AfterPost(DataSet: TDataSet);
    procedure cds571CalcFields(DataSet: TDataSet);
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

procedure TDM.cds571PARA_VALUE_0Change(Sender: TField);
begin  
  cds571theory_result.AsString:='0';
end;

procedure TDM.cds571AfterPost(DataSet: TDataSet);
begin
    frmModify.edtSum.Text:=frmModify.DB571.GetFooterValue(0,frmModify.DB571.FieldColumns['theory_result']);
end;

procedure TDM.cds571CalcFields(DataSet: TDataSet);
function getdeptcode(rkey:integer):string;
begin
    Result:='';
    with TADOQuery.Create(nil) do
    begin
      Connection:=DM.ADOConnection1;
      sql.Text:='select dept_code from data0034 where rkey= ' + IntToStr(rkey);
      try
         Open;
         Result:=FieldValues['dept_code'];
      except
         Result:='';
      end;
      Free;
    end;
end;
begin
  if cds571pan_qty.AsInteger> 0 then
    cds571perpanel_result.AsCurrency:=cds571theory_result.AsCurrency / cds571pan_qty.AsCurrency
  else
    cds571perpanel_result.AsCurrency:=0;

  if cds571DEPT_PTR.AsString<>'' then
    cds571dept_name.Value:=getdeptcode(cds571DEPT_PTR.AsInteger);
end;

end.
