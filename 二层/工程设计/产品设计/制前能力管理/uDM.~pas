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
    ADO0738isChange: TIntegerField;
    ADO0738CreateDate: TDateTimeField;
    ADO0738AUDITED_ptr: TIntegerField;
    ADO0738EMPLOYEE_NAME: TStringField;
    DataSource2: TDataSource;
    ADO0741: TADOQuery;
    DataSource3: TDataSource;
    ADO0742: TADOQuery;
    ADO0742dept_name: TStringField;
    ADO0742rkey: TAutoIncField;
    ADO0742d741_ptr: TIntegerField;
    ADO0742d34_index: TIntegerField;
    ADO0742d34_ptr: TIntegerField;
    ADOTMP1: TADOQuery;
    DataSource4: TDataSource;
    ADO0743: TADOQuery;
    ADO0743d541_ptr: TIntegerField;
    ADO0743d34_index: TIntegerField;
    ADO0743d34_ptr: TIntegerField;
    ADO0743check_person: TIntegerField;
    ADO0743check_status: TIntegerField;
    ADO0743check_time: TDateTimeField;
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
    DataSource8: TDataSource;
    ADOQuery3: TADOQuery;
    ADOQuery4: TADOQuery;
    ADOTable1varchar_738: TStringField;
    QueryofbpTMP: TADOQuery;
    QueryofbpTMPd741_ptr: TIntegerField;
    QueryofbpTMPtype_code: TStringField;
    QueryofbpTMPname: TWideStringField;
    QueryofbpTMPdept_name: TStringField;
    DataSource9: TDataSource;
    ADODataSet_ud2: TADOQuery;
    ADODataSet_ud2employee_id: TIntegerField;
    ADOQuery4Rkey: TAutoIncField;
    ADOQuery5: TADOQuery;
    ADO0738DSDesigner2: TStringField;
    DS2: TDataSource;
    ADOFTP: TADODataSet;
    qryFtp2: TADOQuery;
    qryFileList2: TADOQuery;
    qryFtp2IDKey: TStringField;
    qryFtp2FileName: TStringField;
    qryFtp2Ftp_Ptr: TIntegerField;
    qryFtp2FtpDir: TStringField;
    qryFtp2Ftp_fileName: TStringField;
    qryFtp2UploadTime: TDateTimeField;
    qryFtp2UploadUser_d05ptr: TIntegerField;
    qryFtp2GroupIDKey: TStringField;
    qryFtp2BEnable: TBooleanField;
    qryFileList2FtpIDKey: TWideStringField;
    qryFileList2remark: TWideStringField;
    qryFileList2contract_rkey: TIntegerField;
    qryFileList2rkey: TIntegerField;
    ADOFTPFileName: TStringField;
    ADOFTPEMPLOYEE_NAME: TStringField;
    ADOFTPremark: TWideStringField;
    ADOFTPUploadTime: TDateTimeField;
    ADOFTPFtp_fileName: TStringField;
    ADOFTPIDKey: TStringField;
    ADOFTPFtp_Ptr: TIntegerField;
    ADOFTPUploadUser_d05ptr: TIntegerField;
    ADOFTPGroupIDKey: TStringField;
    ADOFTPcontract_rkey: TIntegerField;
    ADOFTPFtpIDKey: TWideStringField;
    Queryofbpd741_ptr: TIntegerField;
    Queryofbptype_code: TStringField;
    Queryofbpname: TWideStringField;
    Queryofbpdept_name: TStringField;
    ADODelFpt: TADOQuery;
    ADOQuery6: TADOQuery;
    ADOFTPrkey: TIntegerField;
    ADO0742rkey742: TAutoIncField;
    ADODel742: TADOQuery;
    ADOUPdate749: TADOQuery;
    ADOTMP3: TADOQuery;
    ADO0741rkey: TAutoIncField;
    ADO0741type_code: TStringField;
    ADO0741name: TWideStringField;
    ADO0741remark: TWideStringField;
    ADO0741DSDesigner: TStringField;
    ADO0741Type: TIntegerField;
    ADOQuery7: TADOQuery;
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
