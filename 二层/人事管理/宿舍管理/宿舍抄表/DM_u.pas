unit DM_u;

interface

uses
  SysUtils, Classes, DB, ADODB, DBClient, Provider;

type
  TDM = class(TDataModule)
    ADOCon: TADOConnection;
    ADOBER: TADOQuery;
    DS: TDataSource;
    tmp: TADOQuery;
    ADOBERR_code: TStringField;
    ADOBERrecord_date: TDateTimeField;
    ADOBERrecord_number: TFloatField;
    ADOBERtype: TStringField;
    ADOBERroomid: TIntegerField;
    ADOBERrkey: TAutoIncField;
    ADOBERoperator: TIntegerField;
    ADOBERoper_time: TDateTimeField;
    ADOBERremark: TWideStringField;
    ADOBEREMPLOYEE_NAME: TStringField;
    ADOBERischecked_s: TStringField;
    ADOBERischecked: TBooleanField;
    ADOBERtype_s: TStringField;
    CDS: TClientDataSet;
    DSP: TDataSetProvider;
    CDSSel: TBooleanField;
    CDSR_code: TStringField;
    CDSrecord_date: TDateTimeField;
    CDSrecord_number: TFloatField;
    CDStype: TStringField;
    CDSroomid: TIntegerField;
    CDSrkey: TAutoIncField;
    CDSoperator: TIntegerField;
    CDSoper_time: TDateTimeField;
    CDSremark: TWideStringField;
    CDSEMPLOYEE_NAME: TStringField;
    CDSischecked_s: TStringField;
    CDSischecked: TBooleanField;
    CDStype_s: TStringField;
    DataSource1: TDataSource;
    ADOBERSel: TBooleanField;
    procedure CDSAfterInsert(DataSet: TDataSet);
    procedure CDSBeforeInsert(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.CDSAfterInsert(DataSet: TDataSet);
begin
 abort;
end;

procedure TDM.CDSBeforeInsert(DataSet: TDataSet);
begin
 abort;
end;

end.
