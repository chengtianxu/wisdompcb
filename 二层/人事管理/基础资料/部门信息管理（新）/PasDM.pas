unit PasDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADODepart: TADOQuery;
    DataSource1: TDataSource;
    ADOShowChild: TADOQuery;
    ADOAddorEdit: TADOQuery;
    ADOShowChildRKEY: TAutoIncField;
    ADOShowChilddepartmentcode: TWideStringField;
    ADOShowChilddepartmentname: TWideStringField;
    ADOShowChildsuperior: TIntegerField;
    ADOShowChildstates: TStringField;
    ADOShowChilddepartmentration: TIntegerField;
    ADOShowChildoutofrate: TStringField;
    ADOShowChilddepartmentcount: TIntegerField;
    ADOShowChildscarcity: TIntegerField;
    ADOShowChildoverproofcount: TIntegerField;
    ADOShowChildmax_overproof_percent: TIntegerField;
    ADOShowChildpre_outduty: TIntegerField;
    ADOShowChilddept_totalration: TIntegerField;
    ADOShowChilddept_totalcount: TIntegerField;
    ADOShowChilddept_total_outduty: TIntegerField;
    ADOShowChildShoeBox: TStringField;
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
