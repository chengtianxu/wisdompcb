unit Udemo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADO597: TADODataSet;
    DS597: TDataSource;
    ADO609: TADODataSet;
    DS609: TDataSource;
    ADO607: TADOQuery;
    ADO607v_ttype: TWideStringField;
    ADO607Explain: TWideStringField;
    ado608: TADOQuery;
    DS607: TDataSource;
    DS608: TDataSource;
    ADOQuery1: TADOQuery;
    ado608USER_LOGIN_NAME: TStringField;
    ado608USER_FULL_NAME: TStringField;
    ado608RKEY: TAutoIncField;
    ado608seq_no: TIntegerField;
    ado608v_ttype: TWideStringField;
    ado608rkey73: TIntegerField;
    aq607: TADOQuery;
    aq607v_ttype: TWideStringField;
    aq607Explain: TWideStringField;
    qryFtp2: TADOQuery;
    qryFileList2: TADOQuery;
    ADS598: TADODataSet;
    ADS598rec_no: TIntegerField;
    ADS598FileName: TStringField;
    ADS598EMPL_CODE: TStringField;
    ADS598EMPLOYEE_NAME: TStringField;
    ADS598remark: TStringField;
    ADS598UploadTime: TDateTimeField;
    ADS598Ftp_fileName: TStringField;
    ADS598IDKey: TStringField;
    ADS598Ftp_Ptr: TIntegerField;
    DS598: TDataSource;
    qryFileList2FtpIDKey: TWideStringField;
    qryFileList2remark: TStringField;
    qryFileList2rkey597: TIntegerField;
    qryFileList2rec_no: TIntegerField;
    ADOl598: TADODataSet;
    ADODl599: TADODataSet;
    DSl598: TDataSource;
    DSl599: TDataSource;
    ADOpv597: TADOQuery;
    ADOpv597spNumber: TStringField;
    ADOpv597rkey10: TAutoIncField;
    ADOpv597rkey73: TIntegerField;
    ADOpv597EntryTime: TDateTimeField;
    ADOpv597rkey01: TIntegerField;
    ADOpv597Debit: TBooleanField;
    ADOpv597Remarks: TWideStringField;
    ADOpv597status: TWordField;
    ADOpv597submit_date: TDateTimeField;
    ADOpv597Salesman: TIntegerField;
    ADOpv597ywexplain: TWideStringField;
    ADOpv597rkey15: TIntegerField;
    ADOpv597rkey: TIntegerField;
    tmp: TADOQuery;
    ADO597rkey: TAutoIncField;
    ADO597spNumber: TStringField;
    ADO597ABBR_NAME: TStringField;
    ADO597CURR_NAME: TStringField;
    ADO597yw05: TStringField;
    ADO597EntryTime: TDateTimeField;
    ADO597debita: TStringField;
    ADO597Remarks: TWideStringField;
    ADO597v_status: TStringField;
    ADO597submit_date: TDateTimeField;
    ADO597ywexplain: TWideStringField;
    ADO597USER_FULL_NAME: TStringField;
    ADOl598rec_no: TIntegerField;
    ADOl598Expr1: TStringField;
    ADOl598EMPLOYEE_NAME: TStringField;
    ADOl598rkey597: TIntegerField;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    ADODl599rkey597: TIntegerField;
    ADODl599PUTH_INFO: TWideStringField;
    ADODl599seq_no: TIntegerField;
    ADODl599auth_date: TDateTimeField;
    ADODl599USER_FULL_NAME: TStringField;
    edit609: TADOQuery;
    ADO609MANU_PART_DESC: TStringField;
    ADO609rkey: TAutoIncField;
    ADO609rkey597: TIntegerField;
    ADO609Number25: TStringField;
    ADO609condate: TDateTimeField;
    ADO609remark: TWideStringField;
    ADO609rec_no: TWideStringField;
    ADO609xingtai: TStringField;
    ADO609explain: TWideStringField;
    ADO609company: TStringField;
    ADO609Number: TIntegerField;
    ADO609spUnitPrice: TBCDField;
    ADO609spliable: TWideStringField;
    ADO609spmonth: TDateTimeField;
    ADO597yy: TFloatField;
    edit597: TADOQuery;
    edit597rkey: TAutoIncField;
    edit597spNumber: TStringField;
    edit597name10: TStringField;
    edit597USER_FULL_NAME: TStringField;
    edit597CURR_NAME: TStringField;
    edit597WAREHOUSE_NAME: TStringField;
    edit597yw05: TStringField;
    edit597Debit: TBooleanField;
    edit597status: TWordField;
    edit597ywexplain: TWideStringField;
    edit597CUST_CODE: TStringField;
    edit597DEPT_NAME: TStringField;
    edit597v_ttype: TWideStringField;
    edit597Remarks: TWideStringField;
    edit597name15: TStringField;
    edit609rkey597: TIntegerField;
    edit609Number25: TStringField;
    edit609condate: TDateTimeField;
    edit609remark: TWideStringField;
    edit609rec_no: TWideStringField;
    edit609xingtai: TStringField;
    edit609explain: TWideStringField;
    edit609company: TStringField;
    edit609Number: TIntegerField;
    edit609spUnitPrice: TBCDField;
    edit609spliable: TWideStringField;
    edit609spmonth: TDateTimeField;
    edit597Salesman: TIntegerField;
    edit597rkey73: TIntegerField;
    edit597rkey15: TIntegerField;
    edit597rkey10: TIntegerField;
    edit597rkey01: TIntegerField;
    ADODl599status1: TStringField;
    ADO597v_ttype: TWideStringField;
    ADO597ststusr: TWordField;
    ADO597Number: TIntegerField;
    ADO597spmoney: TBCDField;
    ADO609MANU_PART_NUMBER: TStringField;
    ADO597ABBR_NAME_1: TStringField;
    ADO597rkey73: TIntegerField;
    aq607rkey73: TIntegerField;
    ADO607rkey73: TIntegerField;
    ADO607USER_FULL_NAME: TStringField;
    ADOhz: TADOQuery;
    DataSource1: TDataSource;
    ADODl599v_ttype: TWideStringField;
    edit597spmoney: TBCDField;
    edit597Number: TIntegerField;
    edit597EMPL_CODE: TStringField;
    edit597WAREHOUSE_CODE: TStringField;
    edit597tax: TBooleanField;
    ADODSmx: TADODataSet;
    DataSource2: TDataSource;
    ADODSmxCUST_CODE: TStringField;
    ADODSmxABBR_NAME: TStringField;
    ADODSmxspmonth: TDateTimeField;
    ADODSmxspliable: TWideStringField;
    ADODSmxspUnitPrice: TBCDField;
    ADODSmxNumber: TIntegerField;
    ADODSmxcompany: TStringField;
    ADODSmxexplain: TWideStringField;
    ADODSmxxingtai: TStringField;
    ADODSmxrec_no: TWideStringField;
    ADODSmxMANU_PART_DESC: TStringField;
    ADODSmxMANU_PART_NUMBER: TStringField;
    ADODSmxremark: TWideStringField;
    ADODSmxcondate: TDateTimeField;
    ADODSmxrkey597: TIntegerField;
    ADODSmxCURR_NAME: TStringField;
    ADO618pres: TADOQuery;
    ADO618pressel_n: TIntegerField;
    ADO618presemp_ptr: TIntegerField;
    ADO618presdep_ptr: TIntegerField;
    ADO618pressp_money: TBCDField;
    ADO618presrkey597: TIntegerField;
    Data618: TDataSource;
    tmp2: TADOQuery;
    ADO618presemp: TStringField;
    ADO618presdept: TStringField;
    ADOQuery4: TADOQuery;
    ADOQuery5: TADOQuery;
    ADOft: TADOQuery;
    ADOftchinesename: TWideStringField;
    ADOftsel_n: TIntegerField;
    ADOftsp_money: TBCDField;
    ADOftrkey597: TIntegerField;
    ADOftDEPT_NAME: TStringField;
    DSft: TDataSource;
    ADODl599rkey73: TIntegerField;
    ADO597USER_FULL_NAME_1: TStringField;
    procedure ADO607AfterScroll(DataSet: TDataSet);
    procedure ADO597AfterScroll(DataSet: TDataSet);
    procedure ADO618presCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.ADO607AfterScroll(DataSet: TDataSet);
begin
 DM.ado608.Close;
 DM.ado608.Parameters[0].Value:=DM.ADO607v_ttype.Value;
 DM.ado608.Open;
end;

procedure TDM.ADO597AfterScroll(DataSet: TDataSet);
begin
 dm.ADO609.Close;
 DM.ADO609.Parameters[0].Value:=DM.ADO597rkey.Value;
 DM.ADO609.Open;
end;

procedure TDM.ADO618presCalcFields(DataSet: TDataSet);
begin
 if (dm.ADO618presdep_ptr.AsInteger<>0) and (dm.ADO618presemp_ptr.AsInteger<>0) then
 begin
  dm.ADOQuery4.Close;
  DM.ADOQuery4.SQL.Text :='SELECT DEPT_NAME FROM Data0034 WHERE RKEY= '+dm.ADO618presdep_ptr.AsString;
  DM.ADOQuery4.Open;

  DM.ADOQuery5.Close;
  DM.ADOQuery5.SQL.Text :='SELECT chinesename FROM employeemsg WHERE RKEY= '+dm.ADO618presemp_ptr.AsString;
  DM.ADOQuery5.Open;

  DM.ADO618presemp.Value:= DM.ADOQuery5.FieldValues['chinesename'];
  DM.ADO618presdept .Value := DM.ADOQuery4.FieldValues['DEPT_NAME'];
 end;
end;

end.
