unit Damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    qryMain: TADOQuery;
    dsMain: TDataSource;
    qryTemp: TADOQuery;
    con1: TADOConnection;
    qrytemp1: TADOQuery;
    qry_update: TADOQuery;
    qryMaindepartmentname: TWideStringField;
    qryMainemployeecode: TWideStringField;
    qryMainchinesename: TWideStringField;
    qryMainidcard: TWideStringField;
    qryMainsex: TStringField;
    qryMainregdate: TDateTimeField;
    qryMainroomcode: TWideStringField;
    qryMainprovince: TWideStringField;
    qryMainfactoryarea: TWideStringField;
    qryMaincardno: TWideStringField;
    qryMainondutytime: TWideStringField;
    qryMainoutdutytime: TWideStringField;
    qryMainrkey: TIntegerField;
    qryMainposition: TWideStringField;
    qryMainbirthday: TWideStringField;
    qryMainworkage: TBCDField;
    qryMainmarriage: TWideStringField;
    qryMainphone: TWideStringField;
    qryMainothers_contacts: TWideStringField;
    qryMainnation: TWideStringField;
    qryMainoper_person: TStringField;
    qryMainflag: TIntegerField;
  private
    { Private declarations }
    tag: Integer;
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
