unit DAMO;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    con1: TADOConnection;
    adoMain: TADODataSet;
    dsMain: TDataSource;
    adoMainDEPT_CODE: TStringField;
    adoMainDEPT_NAME: TStringField;
    adoMainFASSET_DESC: TStringField;
    adoMainFASSET_NAME: TStringField;
    adoMainabbr_NAME: TStringField;
    adoMainWAREHOUSE_CODE: TStringField;
    adoMainpanel_id: TStringField;
    adoMainccd_code: TStringField;
    adoMainT_DATE: TDateTimeField;
    adoMainCOMPUTER_IP: TStringField;
    adoMainWORK_ORDER_NUMBER: TStringField;
    adoMainRkey: TLargeintField;
    adotmp: TADOQuery;
    adoMainMANU_PART_NUMBER: TStringField;
    adoMainIsDouble: TWordField;
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
