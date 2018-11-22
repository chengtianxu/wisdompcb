unit UDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    FactoryCalendar: TADOQuery;
    FactoryCalendar_1: TADOQuery;
    Resttypemsg: TADOQuery;
    Resttypemsgrkey: TAutoIncField;
    Resttypemsgresttype_name: TWideStringField;
    Resttypemsgcolor: TWideStringField;
    Resttypemsgremark: TWideStringField;
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
