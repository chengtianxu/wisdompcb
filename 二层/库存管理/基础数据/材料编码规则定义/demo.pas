unit demo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    con1: TADOConnection;
    qry596: TADOQuery;
    qry596rkey595: TIntegerField;
    qry596rkey593: TIntegerField;
    qry596rec_no: TIntegerField;
    ds596: TDataSource;
    save595: TADOQuery;
    qry596invt_ttyename: TWideStringField;
    save596: TADOQuery;
    save596rkey595: TIntegerField;
    save596rkey593: TIntegerField;
    save596rec_no: TIntegerField;
    save595RKEY: TAutoIncField;
    save595TYPE_CODE: TStringField;
    save595TYPE_NAME: TWideStringField;
    save595LENGTH: TIntegerField;
    ADOQuery1: TADOQuery;
    qry596length: TWordField;
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
