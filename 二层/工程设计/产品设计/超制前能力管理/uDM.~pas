unit uDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  Tdm = class(TDataModule)
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOD04: TADODataSet;
    ADOD04CONTROL_NO_LENGTH: TSmallintField;
    ADOD04SEED_VALUE: TStringField;
    ADOD04SEED_FLAG: TWordField;
    ADODel: TADOQuery;
    ADO0738: TADODataSet;
    ADO0738Rkey: TAutoIncField;
    ADO0738FA_NUM: TStringField;
    ADO0738RKEY10: TIntegerField;
    ADO0738RKEY25: TIntegerField;
    ADO0738MANU_PART_NUMBER: TStringField;
    ADO0738CUSTOMER_NAME: TStringField;
    ADO0738chanpinshuxing: TStringField;
    ADO0738ABBR_NAME: TStringField;
    ADO0738BasicTechnology: TStringField;
    ADO0738DifficultPoint: TStringField;
    ADO0738isChange: TIntegerField;
    ADO0738Quality: TIntegerField;
    ADO0738CreateDate: TDateTimeField;
    ADO0738BEIZHU: TStringField;
    ADO0738AUDITED_ptr: TIntegerField;
    ADO0738EMPLOYEE_NAME: TStringField;
    DataSource2: TDataSource;
    ADO0741: TADOQuery;
    ADO0741type_code: TStringField;
    ADO0741name: TWideStringField;
    ADO0741remark: TWideStringField;
    ADO0741rkey: TAutoIncField;
    DataSource3: TDataSource;
    ADO0742: TADOQuery;
    ADO0742dept_name: TStringField;
    ADO0742rkey: TAutoIncField;
    ADO0742d741_ptr: TIntegerField;
    ADO0742d34_index: TIntegerField;
    ADO0742d34_ptr: TIntegerField;
    ADO0742remark: TWideStringField;
    ADOTMP1: TADOQuery;
    ADOFaTest: TADOQuery;
    DataSource4: TDataSource;
    ADOFaTestDEPT_CODE: TStringField;
    ADOFaTestDEPT_NAME: TStringField;
    ADO0743: TADOQuery;
    ADO0743d541_ptr: TIntegerField;
    ADO0743d34_index: TIntegerField;
    ADO0743d34_ptr: TIntegerField;
    ADO0743check_person: TIntegerField;
    ADO0743check_status: TIntegerField;
    ADO0743check_time: TDateTimeField;
    ADO0743check_suggestion: TMemoField;
    ADO0743employee_name: TStringField;
    ADO0743dept_name: TStringField;
    ADO0743DSDesigner: TStringField;
    ADO0743rkey: TAutoIncField;
    DataSource5: TDataSource;
    Queryofbp: TADOQuery;
    ADO0738check_type: TIntegerField;
    ADO0738circle: TIntegerField;
    ADO0738DSDesigner: TMemoField;
    ADO0738check_status: TIntegerField;
    ADOTMP2: TADOQuery;
    ADOTable1: TADOTable;
    ADOQuery2: TADOQuery;
    QRY1: TADOQuery;
    DataSource6: TDataSource;
    DataSource7: TDataSource;
    ADOTable1RKEY: TIntegerField;
    ADOTable1d738_ptr: TIntegerField;
    ADOTable1DEPT_CODE: TStringField;
    ADOTable1DifficultPoint: TMemoField;
    ADOTable1BEIZHU: TMemoField;
    ADOTable1BasicTechnology: TMemoField;
    DataSource8: TDataSource;
    ADOQuery3: TADOQuery;
    ADO0740Edit: TADOQuery;
    ADO0740EditRkey: TAutoIncField;
    ADO0740EditRKEY25: TIntegerField;
    ADO0740EditRKEY10: TIntegerField;
    ADO0740EditRKEY738: TIntegerField;
    ADO0740EditTestDate: TDateTimeField;
    ADO0740EditCreate_ptr: TIntegerField;
    ADO0740EditTStatus: TIntegerField;
    ADO0740EditTestResult: TWideStringField;
    UPdate740: TADOQuery;
    ADOQuery4: TADOQuery;
    ADOTable1varchar_738: TStringField;
    QueryofbpTMP: TADOQuery;
    QueryofbpTMPd741_ptr: TIntegerField;
    QueryofbpTMPtype_code: TStringField;
    QueryofbpTMPname: TWideStringField;
    QueryofbpTMPdept_name: TStringField;
    ADO0738FA: TStringField;
    ADO0738FAStatus: TIntegerField;
    DataSource9: TDataSource;
    ADODataSet_ud2: TADOQuery;
    ADODataSet_ud2employee_id: TIntegerField;
    ADOQuery4Rkey: TAutoIncField;
    ADOFaTestDifficultPoint: TWideStringField;
    ADOFaTestBEIZHU: TWideStringField;
    ADOFaTestTestResult: TWideStringField;
    ADOQuery5: TADOQuery;
    ADO0738DSDesigner2: TStringField;
    DS2: TDataSource;
    ADO0744: TADODataSet;
    ADO0744contract_rkey: TIntegerField;
    ADO0744file_name: TWideStringField;
    ADO0744flag: TIntegerField;
    ADO0744submit_person: TIntegerField;
    ADO0744submit_person_name: TStringField;
    ADO0744submit_date: TDateTimeField;
    ADO0744modify_person: TIntegerField;
    ADO0744modify_date: TDateTimeField;
    ADOFaTestTStatus: TIntegerField;
    ADOFaTestfinished: TStringField;
    ADOFaTestsuggestion: TWideStringField;
    ADO0740EditDEPT_CODE: TStringField;
    ADO0740Editfinished: TStringField;
    ADO0740Editsuggestion: TWideStringField;
    ADO0740: TADOQuery;
    ADO0740Rkey: TAutoIncField;
    ADO0740RKEY25: TIntegerField;
    ADO0740RKEY10: TIntegerField;
    ADO0740RKEY738: TIntegerField;
    ADO0740TestDate: TDateTimeField;
    ADO0740Create_ptr: TIntegerField;
    ADO0740TestResult: TWideStringField;
    ADO0740DEPT_CODE: TStringField;
    ADO0740finished: TStringField;
    ADO0740suggestion: TWideStringField;
    ADO0740TStatus: TIntegerField;
    procedure ADOFA0738AfterOpen(DataSet: TDataSet);
    procedure ADO0738AfterScroll(DataSet: TDataSet);
    procedure ADO0741AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rkey747: Integer;
  dm: Tdm;
  
implementation


{$R *.dfm}

procedure Tdm.ADOFA0738AfterOpen(DataSet: TDataSet);
begin
if not dm.ADO0738.IsEmpty then
    begin
      ADO0738.Active := false;
      ADO0738.Parameters[0].Value := DataSet.FieldValues['rkey'];
      ADO0738.Active := true;
  end;

  //rkey738 :=dm.ADO0738rkey.Value;
end;



procedure Tdm.ADO0738AfterScroll(DataSet: TDataSet);
begin
 with  dm.ADO0743 do
  begin
  close;
  Parameters.ParamByName('rkey738').Value:=dm.ADO0738Rkey.Value;
  Open;
  end;
end;

procedure Tdm.ADO0741AfterScroll(DataSet: TDataSet);
begin
  with  dm.ADO0742 do
  begin
  close;
  Parameters.ParamByName('rkey741').Value:=dm.ADO0741rkey.Value;
  Open;
  end;
end;

end.
