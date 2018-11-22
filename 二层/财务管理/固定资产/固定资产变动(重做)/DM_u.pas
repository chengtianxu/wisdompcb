unit DM_u;

interface

uses
  SysUtils, Classes, DB, ADODB,Dialogs,math;

type
  TDM = class(TDataModule)
    ADOCon: TADOConnection;
    ADO517: TADOQuery;
    ADO517_1: TADOQuery;
    ADO325: TADOQuery;
    ADO326: TADOQuery;
    ADO327: TADOQuery;
    tmp: TADOQuery;
    ADO517rkey: TAutoIncField;
    ADO517fasset_code: TStringField;
    ADO517fasset_name: TStringField;
    ADO517fasset_desc: TStringField;
    ADO517book_date: TDateTimeField;
    ADO327rkey: TAutoIncField;
    ADO327alter_date: TDateTimeField;
    ADO327alter_type: TWordField;
    ADO327reason: TStringField;
    ADO327alter_type_name: TStringField;
    ADO326DEPT_CODE: TStringField;
    ADO326DEPT_NAME: TStringField;
    ADO326dept_ptr: TIntegerField;
    ADO326FACCU_DEPT_GL_PTR: TIntegerField;
    ADO326GL_ACC_NUMBER: TStringField;
    ADO326GL_DESCRIPTION: TStringField;
    ADO326PERCENTS: TFloatField;
    ADO326fasset_ptr: TIntegerField;
    ADO517_1RKEY: TAutoIncField;
    ADO517_1FASSET_CODE: TStringField;
    ADO517_1FASSET_NAME: TStringField;
    ADO517_1FASSET_DESC: TStringField;
    ADO517_1FASSET_TYPE: TStringField;
    ADO517_1FASSET_TYPE_PTR: TSmallintField;
    ADO517_1ALT_TYPE_PTR: TSmallintField;
    ADO517_1FASSET_ALT_TYPE: TStringField;
    ADO517_1STATUS_PTR: TSmallintField;
    ADO517_1FASSET_STATUS: TStringField;
    ADO517_1ORIGINAL_VALUE: TFloatField;
    ADO517_1SUMMED_DEPRE: TFloatField;
    ADO517_1NET_VALUE: TFloatField;
    ADO517_1LOCATION: TStringField;
    ADO517_1BOOK_DATE: TDateTimeField;
    ADO517_1SURPLUS_RATE: TFloatField;
    ADO517_1SURPLUS: TFloatField;
    ADO517_1DEPRE_MTHD_PTR: TSmallintField;
    ADO517_1EXPECTED_LIFE_MONTHS: TFloatField;
    ADO517_1DEPRED_MONTHS: TFloatField;
    ADO517_1MONTH_DEPRE_RATE: TFloatField;
    ADO517_1MONTH_DEPRE_AMT: TBCDField;
    ADO517_1GL_ACC_NUMBER: TStringField;
    ADO517_1GL_DESCRIPTION: TStringField;
    ADO517_1REMARK: TStringField;
    ADO517_1id_code: TStringField;
    ADO517_1orig_original_value: TFloatField;
    ADO517_1USER_DATE: TDateTimeField;
    ADO517_1WAREHOUSE_CODE: TStringField;
    ADO325rkey: TAutoIncField;
    ADO325fasset_ptr: TIntegerField;
    ADO325curr_ptr: TIntegerField;
    ADO325CURR_CODE: TStringField;
    ADO325ex_rate: TFloatField;
    ADO325orig_curr_orig_value: TBCDField;
    ADO325curr_value: TFloatField;
    ADO327_1: TADOQuery;
    ADO325_1: TADOQuery;
    ADO326_1: TADOQuery;
    ADO517_1Depre_GL_ACC_NUMBER: TStringField;
    ADO517_1depre_GL_DESCRIPTION: TStringField;
    ADO517_1depre_acct_ptr: TIntegerField;
    ADO517_1warehouse_ptr: TIntegerField;
    ADO517_1abbr_NAME: TStringField;
    ADO327_1EXPECTED_LIFE_MONTHS_1: TFloatField;
    ADO327_1SURPLUS_RATE_1: TFloatField;
    ADO327_1rkey: TAutoIncField;
    ADO327_1fasset_ptr: TIntegerField;
    ADO327_1alter_date: TDateTimeField;
    ADO327_1alter_type: TWordField;
    ADO327_1Reason: TStringField;
    ADO327_1increased_orig_value: TFloatField;
    ADO327_1increased_surplus_value: TFloatField;
    ADO327_1ORIGINAL_VALUE: TFloatField;
    ADO327_1SUMMED_DEPRE: TFloatField;
    ADO327_1NET_VALUE: TFloatField;
    ADO327_1LOCATION: TStringField;
    ADO327_1SURPLUS_RATE: TFloatField;
    ADO327_1SURPLUS: TFloatField;
    ADO327_1DEPRE_MTHD_PTR: TSmallintField;
    ADO327_1EXPECTED_LIFE_MONTHS: TFloatField;
    ADO327_1DEPRED_MONTHS: TFloatField;
    ADO327_1LOADING_UNIT: TStringField;
    ADO327_1MONTH_DEPRE_RATE: TFloatField;
    ADO327_1MONTH_DEPRE_AMT: TBCDField;
    ADO327_1DEPRE_ACCT_PTR: TIntegerField;
    ADO327_1depr_rate_method: TWordField;
    ADO327_1alter_by_ptr: TIntegerField;
    ADO327_1voucher_ptr: TIntegerField;
    ADO327_1fasset_type_ptr: TIntegerField;
    ADO327_1status_ptr: TIntegerField;
    ADO327_1DEPT_PTR: TIntegerField;
    ADO327_1dept_ptr_1: TIntegerField;
    ADO327_1fasset_type_ptr_1: TIntegerField;
    ADO327_1status_ptr_1: TIntegerField;
    ADO327_1ORIGINAL_VALUE_1: TFloatField;
    ADO327_1SUMMED_DEPRE_1: TFloatField;
    ADO327_1NET_VALUE_1: TFloatField;
    ADO327_1LOCATION_1: TStringField;
    ADO327_1SURPLUS_1: TFloatField;
    ADO327_1DEPRE_MTHD_PTR_1: TSmallintField;
    ADO327_1DEPRED_MONTHS_1: TFloatField;
    ADO327_1LOADING_UNIT_1: TStringField;
    ADO327_1MONTH_DEPRE_RATE_1: TFloatField;
    ADO327_1MONTH_DEPRE_AMT_1: TBCDField;
    ADO327_1DEPRE_ACCT_PTR_1: TIntegerField;
    ADO327_1depr_rate_method_1: TWordField;
    ADO325_1CURR_CODE: TStringField;
    ADO325_1curr_value: TFloatField;
    ADO326_1DEPT_CODE: TStringField;
    ADO326_1DEPT_NAME: TStringField;
    ADO326_1GL_ACC_NUMBER: TStringField;
    ADO326_1GL_DESCRIPTION: TStringField;
    ADO325_1curr_ptr: TIntegerField;
    ADO325_1orig_curr_orig_value: TBCDField;
    ADO325_1ex_rate: TFloatField;
    ADO326_1rkey: TAutoIncField;
    ADO326_1fasset_ptr: TIntegerField;
    ADO326_1dept_ptr: TIntegerField;
    ADO326_1d327_ptr: TIntegerField;
    ADO326_1PERCENTS: TFloatField;
    ADO326_1FACCU_DEPT_GL_PTR: TIntegerField;
    ADO325_1d327_ptr: TIntegerField;
    ADO325_1chgType: TIntegerField;
    ADO326_1chgType: TIntegerField;
    ADO325_1rkey: TAutoIncField;
    ADO326rkey: TIntegerField;
    ADO325_1fasset_ptr: TIntegerField;
    ADO327_2: TADOQuery;
    ADO325_2: TADOQuery;
    StringField1: TStringField;
    FloatField1: TFloatField;
    BCDField1: TBCDField;
    FloatField2: TFloatField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    AutoIncField1: TAutoIncField;
    ADO326_2: TADOQuery;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    FloatField3: TFloatField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    ADO327employee_name: TStringField;
    ADO327_2RKEY: TIntegerField;
    ADO327_2FASSET_CODE: TStringField;
    ADO327_2FASSET_NAME: TStringField;
    ADO327_2FASSET_DESC: TStringField;
    ADO327_2FASSET_TYPE: TStringField;
    ADO327_2FASSET_ALT_TYPE: TStringField;
    ADO327_2DEPRE_MTHD_PTR: TSmallintField;
    ADO327_2FASSET_STATUS: TStringField;
    ADO327_2ORIGINAL_VALUE: TFloatField;
    ADO327_2SUMMED_DEPRE: TFloatField;
    ADO327_2NET_VALUE: TFloatField;
    ADO327_2LOCATION: TStringField;
    ADO327_2BOOK_DATE: TDateTimeField;
    ADO327_2SURPLUS_RATE: TFloatField;
    ADO327_2SURPLUS: TFloatField;
    ADO327_2EXPECTED_LIFE_MONTHS: TFloatField;
    ADO327_2DEPRED_MONTHS: TFloatField;
    ADO327_2MONTH_DEPRE_RATE: TBCDField;
    ADO327_2MONTH_DEPRE_AMT: TBCDField;
    ADO327_2REMARK: TStringField;
    ADO327_2id_code: TStringField;
    ADO327_2orig_original_value: TFloatField;
    ADO327_2USER_DATE: TDateTimeField;
    ADO327_2WAREHOUSE_CODE: TStringField;
    ADO327_2abbr_NAME: TStringField;
    ADO327_2GL_ACC_NUMBER: TStringField;
    ADO327_2GL_DESCRIPTION: TStringField;
    ADO327_2Depre_GL_ACC_NUMBER: TStringField;
    ADO327_2depre_GL_DESCRIPTION: TStringField;
    ADO327_2depre_acct_ptr: TIntegerField;
    ADO327_2dept_ptr: TIntegerField;
    procedure ADO517AfterScroll(DataSet: TDataSet);
    procedure ADO517_1DEPRE_MTHD_PTRGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure ADO327_1EXPECTED_LIFE_MONTHS_1Validate(Sender: TField);
    procedure ADO325_1CalcFields(DataSet: TDataSet);
    procedure ADO326_1CalcFields(DataSet: TDataSet);
    procedure ADO326_1PERCENTSValidate(Sender: TField);
    procedure ADO325_1AfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.ADO517AfterScroll(DataSet: TDataSet);
begin
  ADO517_1.Close;
  ADO517_1.Parameters[0].Value:=ADO517rkey.Value;
  ADO517_1.Open;

  ADO325.Close;
  ADO325.Parameters[0].Value:=ADO517rkey.Value;
  ADO325.Open;

  ADO326.Close;
  ADO326.Parameters[0].Value:=ADO517rkey.Value;
  ADO326.Open;

  ADO327.Close;
  ADO327.Parameters[0].Value:=ADO517rkey.Value;
  ADO327.Open;
end;

procedure TDM.ADO517_1DEPRE_MTHD_PTRGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  case Sender.AsInteger of
    0:  Text:='不提折旧';
    1:  Text:='平均年限法';
    2:  Text:='工作量法';
    3:  Text:='双倍余额递减法';
    4:  Text:='工作年限法';
  end;
end;

procedure TDM.ADO327_1EXPECTED_LIFE_MONTHS_1Validate(Sender: TField);
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
  ADO327_1.FieldByName('month_depre_amt_1').Value:=ADO327_1.FieldByName('ORIGINAL_VALUE_1').AsFloat*  //月折旧额
                                                  (1-ADO327_1.FieldByName('SURPLUS_RATE_1').AsFloat/100)/ADO327_1.FieldByName('EXPECTED_LIFE_MONTHS_1').AsInteger;
  ADO327_1.FieldByName('MONTH_DEPRE_RATE_1').Value:=(1-ADO327_1.FieldByName('SURPLUS_RATE_1').AsFloat/100)/ADO327_1.FieldByName('EXPECTED_LIFE_MONTHS_1').AsInteger*100; //月折旧额率
  ADO327_1.FieldByName('SURPLUS_1').Value:=ADO327_1.FieldByName('ORIGINAL_VALUE_1').AsFloat*ADO327_1.FieldByName('SURPLUS_RATE_1').AsFloat/100; //净残值
  ADO327_1.FieldByName('NET_VALUE_1').Value:=ADO327_1.FieldByName('ORIGINAL_VALUE_1').AsFloat-ADO517_1.FieldByName('SUMMED_DEPRE').AsFloat; // 净值
end;

procedure TDM.ADO325_1CalcFields(DataSet: TDataSet);
begin
  if ADO325_1curr_ptr.AsString<>'' then
  begin
    tmp.Close;
    tmp.SQL.Text:='select CURR_CODE from data0001 where rkey='+ADO325_1curr_ptr.AsString;
    tmp.Open;
    ADO325_1CURR_CODE.Value:=tmp.Fields[0].AsString;
  end;
  if ADO325_1ex_rate.Value>0 then
    ADO325_1curr_value.Value:=(ADO325_1orig_curr_orig_value.Value*100*ADO325_1ex_rate.Value)/100;
//    ADO325_1curr_value.Value:=ceil(ADO325_1orig_curr_orig_value.Value*100*ADO325_1ex_rate.Value)/100;
end;

procedure TDM.ADO326_1CalcFields(DataSet: TDataSet);
begin
  if ADO326_1dept_ptr.AsString<>'' then
  begin
    tmp.Close;
    tmp.SQL.Text:='select DEPT_CODE,DEPT_NAME from data0034 where rkey='+ADO326_1dept_ptr.AsString;
    tmp.Open;
    ADO326_1DEPT_CODE.Value:=tmp.Fields[0].AsString;
    ADO326_1DEPT_NAME.Value:=tmp.Fields[1].AsString;
  end;
  if ADO326_1FACCU_DEPT_GL_PTR.AsString<>'' then
  begin
    tmp.Close;
    tmp.SQL.Text:='select GL_ACC_NUMBER,GL_DESCRIPTION from data0103 where rkey='+ADO326_1FACCU_DEPT_GL_PTR.AsString;
    tmp.Open;
    ADO326_1GL_ACC_NUMBER.Value:=tmp.Fields[0].AsString;
    ADO326_1GL_DESCRIPTION.Value:=tmp.Fields[1].AsString;
  end;
end;

procedure TDM.ADO326_1PERCENTSValidate(Sender: TField);
begin
  if (Sender.AsFloat<=0) or (Sender.AsFloat>100) then
  begin
    showmessage('占比%不合法...');
    abort;
  end;
end;

procedure TDM.ADO325_1AfterPost(DataSet: TDataSet);
var f:double;
begin
  //调整原值
  f:=0;
  ADO325_1.First;
  while not ADO325_1.Eof do
  begin
    f:=f+ADO325_1curr_value.Value;
    ADO325_1.Next;
  end;
  ADO327_1.Edit;
  ADO327_1ORIGINAL_VALUE_1.Value:=f;  //原值
  ADO327_1.FieldByName('month_depre_amt_1').Value:=ADO327_1.FieldByName('ORIGINAL_VALUE_1').AsFloat*  //月折旧额
                                                  (1-ADO327_1.FieldByName('SURPLUS_RATE_1').AsFloat/100)/ADO327_1.FieldByName('EXPECTED_LIFE_MONTHS_1').AsInteger;
 // ADO327_1.FieldByName('MONTH_DEPRE_RATE_1').Value:=(1-ADO327_1.FieldByName('SURPLUS_RATE_1').AsFloat/100)/ADO327_1.FieldByName('EXPECTED_LIFE_MONTHS_1').AsInteger; //月折旧额率
  ADO327_1.FieldByName('SURPLUS_1').Value:=ADO327_1.FieldByName('ORIGINAL_VALUE_1').AsFloat*ADO327_1.FieldByName('SURPLUS_RATE_1').AsFloat/100; //净残值
  ADO327_1.FieldByName('NET_VALUE_1').Value:=ADO327_1.FieldByName('ORIGINAL_VALUE_1').AsFloat-ADO517_1.FieldByName('SUMMED_DEPRE').AsFloat; // 净值
  ADO327_1.Post;
end;

end.
