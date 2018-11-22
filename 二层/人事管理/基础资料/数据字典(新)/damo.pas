unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADODict: TADODataSet;
    DataSource1: TDataSource;
    ADODictrkey: TIntegerField;
    ADODictitem: TWideStringField;
    ADODetail: TADODataSet;
    DataSource2: TDataSource;
    ADODetaildictid: TIntegerField;
    ADODetailitem: TWideStringField;
    ADODetailmemo: TWideStringField;
    ADODetailtrain_flag: TBooleanField;
    ADODetailuser_defined1: TIntegerField;
    ADODetailuser_defined2: TIntegerField;
    ADOQuery1: TADOQuery;
    ADODict_1: TADOQuery;
    DataSource3: TDataSource;
    ADODetailrkey: TIntegerField;

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
