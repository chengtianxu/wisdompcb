unit U_DM;

interface

uses
  SysUtils, Classes, DB, ADODB, DBClient, Provider;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    dtRead: TADODataSet;
    AQ_employeemsg_extra: TADOQuery;
    AQ_employeemsg_extrarkey: TAutoIncField;
    AQ_employeemsg_extrachinesename: TWideStringField;
    AQ_employeemsg_extraemployeecode: TWideStringField;
    AQ_employeemsg_extrafactoryarea: TWideStringField;
    AQ_employeemsg_extradepartmentname: TWideStringField;
    AQ_employeemsg_extraposition: TWideStringField;
    AQ_employeemsg_extrasex: TStringField;
    AQ_employeemsg_extraondutytime: TWideStringField;
    qry_temp: TADOQuery;
    AQ_employeemsg_extraProvince: TWideStringField;
    AQ_employeemsg_extrabirthday: TWideStringField;
    AQ_employeemsg_extraphone: TWideStringField;
    qry_Bedroomusemsg: TADOQuery;
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
