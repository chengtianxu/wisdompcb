unit DAMO;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    adoMain: TADODataSet;
    adoTmp: TADOQuery;
    DataSource1: TDataSource;
    adoMainrkey: TIntegerField;
    adoMainfasset_code: TStringField;
    adoMainfasset_name: TStringField;
    adoMainfasset_desc: TStringField;
    adoMainbook_date: TDateTimeField;
    adoMainalter_date: TDateTimeField;
    adoMainalter_type: TWordField;
    adoMainReason: TStringField;
    adoMaintypename: TStringField;
    adoMainid_code: TStringField;
    ado325: TADOQuery;
    adoMainFASSET_TYPE: TStringField;
    adoMainFASSET_TYPE_PTR: TSmallintField;
    adoMainALT_TYPE_PTR: TIntegerField;
    adoMainFASSET_ALT_TYPE: TStringField;
    adoMainSTATUS_PTR: TSmallintField;
    adoMainFASSET_STATUS: TStringField;
    adoMainORIGINAL_VALUE: TBCDField;
    adoMainSUMMED_DEPRE: TBCDField;
    adoMainNET_VALUE: TBCDField;
    adoMainLOCATION: TStringField;
    adoMainBOOK_DATE_1: TDateTimeField;
    adoMainSURPLUS_RATE: TFloatField;
    adoMainSURPLUS: TFloatField;
    adoMainDEPRE_MTHD_PTR: TSmallintField;
    adoMainEXPECTED_LIFE_MONTHS: TFloatField;
    adoMainDEPRED_MONTHS: TFloatField;
    adoMainMONTH_DEPRE_RATE: TFloatField;
    adoMainMONTH_DEPRE_AMT: TBCDField;
    adoMainREMARK: TStringField;
    adoMainorig_original_value: TFloatField;
    adoMainUSER_DATE: TDateTimeField;
    adoMainWAREHOUSE_CODE: TStringField;
    adoMainGL_ACC_NUMBER: TStringField;
    adoMainGL_DESCRIPTION: TStringField;
    adoMainDepre_GL_ACC_NUMBER: TStringField;
    adoMaindepre_GL_DESCRIPTION: TStringField;
    adoMaindepre_acct_ptr: TIntegerField;
    adoMainMONTH: TStringField;
    adoMainemployee_name: TStringField;
    adoMainabbr_NAME: TStringField;
    DataSource2: TDataSource;
    ado326: TADOQuery;
    DataSource3: TDataSource;
    ado325rkey: TAutoIncField;
    ado325fasset_ptr: TIntegerField;
    ado325curr_ptr: TIntegerField;
    ado325CURR_CODE: TStringField;
    ado325ex_rate: TFloatField;
    ado325orig_curr_orig_value: TBCDField;
    ado325curr_value: TFloatField;
    ado326DEPT_CODE: TStringField;
    ado326DEPT_NAME: TStringField;
    ado326dept_ptr: TIntegerField;
    ado326FACCU_DEPT_GL_PTR: TIntegerField;
    ado326GL_ACC_NUMBER: TStringField;
    ado326GL_DESCRIPTION: TStringField;
    ado326PERCENTS: TFloatField;
    ado326fasset_ptr: TIntegerField;
    ado326rkey: TAutoIncField;
    ado327: TADOQuery;
    DataSource4: TDataSource;
    adoMainwarehouse_ptr: TIntegerField;
    ado325_1: TADOQuery;
    DataSource5: TDataSource;
    ado326_1: TADOQuery;
    ado325_1rkey: TAutoIncField;
    ado325_1fasset_ptr: TIntegerField;
    ado325_1curr_ptr: TIntegerField;
    ado325_1d327_ptr: TIntegerField;
    ado325_1ex_rate: TFloatField;
    ado325_1orig_curr_orig_value: TBCDField;
    ado325_1chgType: TIntegerField;
    ado326_1rkey: TAutoIncField;
    ado326_1fasset_ptr: TIntegerField;
    ado326_1dept_ptr: TIntegerField;
    ado326_1FACCU_DEPT_GL_PTR: TIntegerField;
    ado326_1d327_ptr: TIntegerField;
    ado326_1PERCENTS: TFloatField;
    ado326_1chgType: TIntegerField;
    ado325_1CURR_CODE: TStringField;
    ado325_1CURR_VALUE: TBCDField;
    ado326_1DEPT_CODE: TStringField;
    ado326_1DEPT_NAME: TStringField;
    ado326_1GL_ACC_NUMBER: TStringField;
    ado326_1GL_DESCRIPTION: TStringField;
    adoMainrkey327: TIntegerField;
    ado327rkey: TAutoIncField;
    ado327id_code: TStringField;
    ado327fasset_code: TStringField;
    ado327fasset_name: TStringField;
    ado327fasset_desc: TStringField;
    ado327book_date: TDateTimeField;
    ado327FASSET_TYPE: TStringField;
    ado327FASSET_TYPE_PTR: TSmallintField;
    ado327ALT_TYPE_PTR: TIntegerField;
    ado327FASSET_ALT_TYPE: TStringField;
    ado327STATUS_PTR: TSmallintField;
    ado327FASSET_STATUS: TStringField;
    ado327ORIGINAL_VALUE: TBCDField;
    ado327SUMMED_DEPRE: TBCDField;
    ado327NET_VALUE: TBCDField;
    ado327LOCATION: TStringField;
    ado327BOOK_DATE_1: TDateTimeField;
    ado327SURPLUS_RATE: TFloatField;
    ado327SURPLUS: TFloatField;
    ado327DEPRE_MTHD_PTR: TSmallintField;
    ado327EXPECTED_LIFE_MONTHS: TFloatField;
    ado327DEPRED_MONTHS: TFloatField;
    ado327MONTH_DEPRE_RATE: TFloatField;
    ado327MONTH_DEPRE_AMT: TBCDField;
    ado327REMARK: TStringField;
    ado327id_code_1: TStringField;
    ado327orig_original_value: TFloatField;
    ado327warehouse_ptr: TIntegerField;
    ado327USER_DATE: TDateTimeField;
    ado327WAREHOUSE_CODE: TStringField;
    ado327GL_ACC_NUMBER: TStringField;
    ado327GL_DESCRIPTION: TStringField;
    ado327Depre_GL_ACC_NUMBER: TStringField;
    ado327depre_GL_DESCRIPTION: TStringField;
    ado327depre_acct_ptr: TIntegerField;
    ado327MONTH: TStringField;
    DataSource6: TDataSource;
    ado327_1: TADOQuery;
    ado327_1rkey: TAutoIncField;
    ado327_1fasset_ptr: TIntegerField;
    ado327_1alter_date: TDateTimeField;
    ado327_1alter_type: TWordField;
    ado327_1Reason: TStringField;
    ado327_1increased_orig_value: TFloatField;
    ado327_1increased_surplus_value: TFloatField;
    ado327_1ORIGINAL_VALUE: TFloatField;
    ado327_1SUMMED_DEPRE: TFloatField;
    ado327_1NET_VALUE: TFloatField;
    ado327_1LOCATION: TStringField;
    ado327_1SURPLUS_RATE: TFloatField;
    ado327_1SURPLUS: TFloatField;
    ado327_1DEPRE_MTHD_PTR: TSmallintField;
    ado327_1EXPECTED_LIFE_MONTHS: TFloatField;
    ado327_1DEPRED_MONTHS: TFloatField;
    ado327_1LOADING_UNIT: TStringField;
    ado327_1MONTH_DEPRE_RATE: TFloatField;
    ado327_1MONTH_DEPRE_AMT: TBCDField;
    ado327_1DEPRE_ACCT_PTR: TIntegerField;
    ado327_1YEAR_ORGI_VALUE_OPEN: TFloatField;
    ado327_1YEAR_ORGI_VALUE_INCREASE: TFloatField;
    ado327_1YEAR_ORGI_VALUE_DECREASE: TFloatField;
    ado327_1YEAR_DEPRE_SUMMED_OPEN: TFloatField;
    ado327_1YEAR_DEPRE_SUMMED_INCREASE: TFloatField;
    ado327_1YEAR_DEPRE_SUMMED_DECREASE: TFloatField;
    ado327_1depr_rate_method: TWordField;
    ado327_1alter_by_ptr: TIntegerField;
    ado327_1voucher_ptr: TIntegerField;
    ado327_1fasset_type_ptr: TIntegerField;
    ado327_1status_ptr: TIntegerField;
    ado327_1DEPT_PTR: TIntegerField;
    ado327_1dept_ptr_1: TIntegerField;
    ado327_1fasset_type_ptr_1: TIntegerField;
    ado327_1status_ptr_1: TIntegerField;
    ado327_1ORIGINAL_VALUE_1: TFloatField;
    ado327_1SUMMED_DEPRE_1: TFloatField;
    ado327_1NET_VALUE_1: TFloatField;
    ado327_1LOCATION_1: TStringField;
    ado327_1SURPLUS_RATE_1: TFloatField;
    ado327_1SURPLUS_1: TFloatField;
    ado327_1DEPRE_MTHD_PTR_1: TSmallintField;
    ado327_1EXPECTED_LIFE_MONTHS_1: TFloatField;
    ado327_1DEPRED_MONTHS_1: TFloatField;
    ado327_1LOADING_UNIT_1: TStringField;
    ado327_1MONTH_DEPRE_RATE_1: TFloatField;
    ado327_1MONTH_DEPRE_AMT_1: TBCDField;
    ado327_1DEPRE_ACCT_PTR_1: TIntegerField;
    ado327_1YEAR_ORGI_VALUE_OPEN_1: TFloatField;
    ado327_1YEAR_ORGI_VALUE_INCREASE_1: TFloatField;
    ado327_1YEAR_ORGI_VALUE_DECREASE_1: TFloatField;
    ado327_1YEAR_DEPRE_SUMMED_OPEN_1: TFloatField;
    ado327_1YEAR_DEPRE_SUMMED_INCREASE_1: TFloatField;
    ado327_1YEAR_DEPRE_SUMMED_DECREASE_1: TFloatField;
    ado327_1depr_rate_method_1: TWordField;
    DataSource7: TDataSource;
    ado325_2: TADOQuery;
    ado326_2: TADOQuery;
    DataSource8: TDataSource;
    ado325_2rkey: TAutoIncField;
    ado325_2fasset_ptr: TIntegerField;
    ado325_2curr_ptr: TIntegerField;
    ado325_2CURR_CODE: TStringField;
    ado325_2ex_rate: TFloatField;
    ado325_2orig_curr_orig_value: TBCDField;
    ado325_2curr_value: TFloatField;
    ado326_2DEPT_CODE: TStringField;
    ado326_2DEPT_NAME: TStringField;
    ado326_2dept_ptr: TIntegerField;
    ado326_2FACCU_DEPT_GL_PTR: TIntegerField;
    ado326_2GL_ACC_NUMBER: TStringField;
    ado326_2GL_DESCRIPTION: TStringField;
    ado326_2PERCENTS: TFloatField;
    ado326_2fasset_ptr: TIntegerField;
    ado326_2rkey: TAutoIncField;
    ado327abbr_NAME: TStringField;
    adoMainf_value: TFloatField;
    adoMainb_value: TFloatField;
    adoMainF_DEPT_VALUE: TStringField;
    adoMainB_DEPT_VALUE: TStringField;
    procedure adoMainAfterScroll(DataSet: TDataSet);
    procedure ado325_1CalcFields(DataSet: TDataSet);
    procedure ado326_1CalcFields(DataSet: TDataSet);
    procedure ado325_1AfterPost(DataSet: TDataSet);
    procedure adoMainCalcFields(DataSet: TDataSet);
    procedure ado327_1EXPECTED_LIFE_MONTHS_1Validate(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses Dialogs;
{$R *.dfm}

procedure TDM.adoMainAfterScroll(DataSet: TDataSet);
begin
  if adoMainrkey.Value=0 then
  begin
   ado325.Close;
   ado326.Close;
  end;
  with DM.ado325 do
  begin
    Close;
    Parameters[0].Value:= adoMainrkey.Value;
    Open;
  end;
  with DM.ado326 do
  begin
    Close;
    Parameters[0].Value:= adoMainrkey.Value;
    Open;
  end;
end;

procedure TDM.ado325_1CalcFields(DataSet: TDataSet);
begin
  IF ado325_1curr_ptr.AsString<>'' then
  begin
    with adoTmp do
    begin
      Close;
      SQL.Text:= 'select RKEY,CURR_CODE from data0001 where rkey = ' + ado325_1curr_ptr.AsString;
      Open;
      ado325_1CURR_CODE.Value:= Fields[1].Value;
    end;
  end;
  if ado325_1ex_rate.Value>0 then
    ado325_1CURR_VALUE.Value:=(ado325_1orig_curr_orig_value.Value*100*ado325_1ex_rate.Value)/100;
end;

procedure TDM.ado326_1CalcFields(DataSet: TDataSet);
begin
  if ADO326_1dept_ptr.AsString<>'' then
  begin
    with adoTmp do
    begin
      Close;
      SQL.Text:='select DEPT_CODE,DEPT_NAME from data0034 where rkey=' + ADO326_1dept_ptr.AsString;
      Open;
      ADO326_1DEPT_CODE.Value:=Fields[0].AsString;
      ADO326_1DEPT_NAME.Value:=Fields[1].AsString;
    end;
  end;
  if ADO326_1FACCU_DEPT_GL_PTR.AsString<>''then
  begin
    with adoTmp do
    begin
      Close;
      SQL.Text:='select GL_ACC_NUMBER,GL_DESCRIPTION from data0103 where rkey='+ ADO326_1FACCU_DEPT_GL_PTR.AsString;
      Open;
      ADO326_1GL_ACC_NUMBER.Value:=Fields[0].AsString;
      ADO326_1GL_DESCRIPTION.Value:=Fields[1].AsString;
    end;
  end;
end;

procedure TDM.ado325_1AfterPost(DataSet: TDataSet);
var i:double;
begin
  i:=0;
  ADO325_1.First;
  while not ADO325_1.Eof do
  begin
    i:=i+ADO325_1curr_value.Value;
    ADO325_1.Next;
  end;
  ADO327_1.Edit;
  ADO327_1ORIGINAL_VALUE_1.Value:=i;
  ADO327_1.FieldByName('month_depre_amt_1').Value:=
  (ADO327_1.FieldByName('ORIGINAL_VALUE_1').AsFloat*(1-ADO327_1.FieldByName('SURPLUS_RATE_1').AsFloat/100)- ADO327_1.FieldByName('SUMMED_DEPRE').AsFloat)
  /(ADO327_1.FieldByName('EXPECTED_LIFE_MONTHS_1').AsInteger - ADO327_1.FieldByName('DEPRED_MONTHS_1').AsInteger);
  ADO327_1.FieldByName('SURPLUS_1').Value:=ADO327_1.FieldByName('ORIGINAL_VALUE_1').AsFloat*ADO327_1.FieldByName('SURPLUS_RATE_1').AsFloat/100;
  ADO327_1.FieldByName('NET_VALUE_1').Value:=ADO327_1.FieldByName('ORIGINAL_VALUE_1').AsFloat-ADO327.FieldByName('SUMMED_DEPRE').AsFloat;
  ADO327_1.Post;
end;

procedure TDM.adoMainCalcFields(DataSet: TDataSet);
begin
  IF adoMainalter_type.Value=2 then
  begin
    with adoTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='select data0327.rkey,data0034.dept_name as f_name,d34.dept_name as b_name from data0327 left join '+#13+
                '    data0326 d326_1 on data0327.rkey=d326_1.d327_ptr and d326_1.chgtype=1 left join  '+#13+
                '    data0326 d326_2 on data0327.rkey=d326_2.d327_ptr and d326_2.chgtype=2 left join  '+#13+
                '    data0034 on data0034.rkey=d326_1.dept_ptr left join  '+#13+
                '    data0034 d34 on d34.rkey=d326_2.dept_ptr '+#13+
                'where data0327.alter_type=2 and data0327.rkey=' + adoMainrkey327.AsString;
      Open;
      IF not IsEmpty then
      begin
        adoMainF_DEPT_VALUE.Value:=FieldByName('f_name').Value;
        adoMainB_DEPT_VALUE.Value:=FieldByName('b_name').Value;
      end;
    end;
  end
  else  if adoMainalter_type.Value=1 then
  begin
    adoMainF_DEPT_VALUE.Value:=adoMainf_value.AsString;
    adoMainB_DEPT_VALUE.Value:=adoMainb_value.AsString;
  end;
end;

procedure TDM.ado327_1EXPECTED_LIFE_MONTHS_1Validate(Sender: TField);
begin
  if Sender.Tag=0 then
  begin
    if (Sender.AsInteger<1) or (Sender.AsInteger>840) then
    begin
      showmessage('预计使用月份不正确...');
      abort;
    end;
  end else begin
    if (Sender.AsInteger<=0) or (Sender.AsInteger>=100) then
    begin
      showmessage('输入残值率不正确...');
      abort;
    end;
  end;
  ADO327_1.Edit;
  ADO327_1.FieldByName('month_depre_amt_1').Value:=
  (ADO327_1.FieldByName('ORIGINAL_VALUE_1').AsFloat*(1-ADO327_1.FieldByName('SURPLUS_RATE_1').AsFloat/100)- ADO327_1.FieldByName('SUMMED_DEPRE').AsFloat)
  /(ADO327_1.FieldByName('EXPECTED_LIFE_MONTHS_1').AsInteger - ADO327_1.FieldByName('DEPRED_MONTHS_1').AsInteger);
  ADO327_1.FieldByName('MONTH_DEPRE_RATE_1').Value:=(1-ADO327_1.FieldByName('SURPLUS_RATE_1').AsFloat/100)/ADO327_1.FieldByName('EXPECTED_LIFE_MONTHS_1').AsInteger*100; //月折旧额率
  ADO327_1.FieldByName('SURPLUS_1').Value:=ADO327_1.FieldByName('ORIGINAL_VALUE_1').AsFloat * ADO327_1.FieldByName('SURPLUS_RATE_1').AsFloat/100; //净残值
  ADO327_1.FieldByName('NET_VALUE_1').Value:=ADO327_1.FieldByName('ORIGINAL_VALUE_1').AsFloat - ADO327_1.FieldByName('SUMMED_DEPRE').AsFloat; // 净值
//  ADO327_1.Post;
end;

end.
