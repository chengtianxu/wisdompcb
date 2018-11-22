unit uDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    Conn: TADOConnection;
    Qery346: TADOQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    Qery348: TADODataSet;
    Qery348no: TIntegerField;
    Qery348ADDER_NAME: TStringField;
    Qery348DEFT_SELECTED: TBooleanField;
    Qery348RKEY: TIntegerField;
    Qery348D0346_PTR: TIntegerField;
    Qery351: TADOQuery;
    Qery: TADOQuery;
    DataSource3: TDataSource;
    Qery351no: TIntegerField;
    Qery351ADDER_NAME: TStringField;
    Qery351DEFT_SELECTED: TBooleanField;
    Qery351D0346_PTR: TIntegerField;
    Qery351seq_no: TIntegerField;
    Qery351D0348_PTR: TIntegerField;
    ADOQuery1: TADOQuery;
    Qery346no: TIntegerField;
    Qery346ROW_NAME: TStringField;
    Qery346ROW_VALUE: TFloatField;
    Qery346rkey: TAutoIncField;
    Qery346prod_route_ptr: TIntegerField;
    Qery346KLAmount: TBCDField;
    Qery346sampleAmount: TBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
