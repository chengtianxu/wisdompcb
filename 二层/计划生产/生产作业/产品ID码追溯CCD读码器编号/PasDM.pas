unit PasDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    Ado1410s: TADOQuery;
    Ado1410srkey: TAutoIncField;
    Ado1410sccd_code: TStringField;
    Ado1410sy1417_rkey: TIntegerField;
    Ado1410sccd_sn: TStringField;
    Ado1410ssupplier: TStringField;
    Ado1410sinstall: TDateTimeField;
    Ado1410sremark: TWideStringField;
    tmp: TADOQuery;
    Ado1410sRKEY_1: TAutoIncField;
    Ado1410sFASSET_CODE: TStringField;
    Ado1410sFASSET_NAME: TStringField;
    Ado1410sFASSET_DESC: TStringField;
    Ado1410swarehouse_ptr: TIntegerField;
    Ado1410sDEPT_PTR: TIntegerField;
    Ado1410sLOCATION: TStringField;
    Ado1410sREMARK_1: TStringField;
    Ado1410sactive_flag: TWordField;
    Ado1410sUSER_DATE: TDateTimeField;
    Ado1410sUSER_PTR: TIntegerField;
    Ado1410sequipment_grade: TStringField;
    Ado1410sCapacity: TStringField;
    Ado1410sCapa_UNIT_PTR: TIntegerField;
    Ado1410sRateProd: TBCDField;
    Ado1410sRate_UNIT_PTR: TIntegerField;
    Ado1410sScan_QTY: TIntegerField;
    Ado1410sABBR_NAME: TStringField;
    Ado1410sDEPT_CODE: TStringField;
    Ado1410sDEPT_NAME: TStringField;
    Ado1410: TADOQuery;
    Ado1410rkey: TAutoIncField;
    Ado1410ccd_code: TStringField;
    Ado1410y1417_rkey: TIntegerField;
    Ado1410ccd_sn: TStringField;
    Ado1410supplier: TStringField;
    Ado1410install: TDateTimeField;
    Ado1410remark: TWideStringField;
    Ado1410RKEY_1: TAutoIncField;
    Ado1410FASSET_CODE: TStringField;
    Ado1410FASSET_NAME: TStringField;
    Ado1410FASSET_DESC: TStringField;
    Ado1410warehouse_ptr: TIntegerField;
    Ado1410DEPT_PTR: TIntegerField;
    Ado1410LOCATION: TStringField;
    Ado1410REMARK_1: TStringField;
    Ado1410active_flag: TWordField;
    Ado1410USER_DATE: TDateTimeField;
    Ado1410USER_PTR: TIntegerField;
    Ado1410equipment_grade: TStringField;
    Ado1410Capacity: TStringField;
    Ado1410Capa_UNIT_PTR: TIntegerField;
    Ado1410RateProd: TBCDField;
    Ado1410Rate_UNIT_PTR: TIntegerField;
    Ado1410Scan_QTY: TIntegerField;
    Ado1410ABBR_NAME: TStringField;
    Ado1410DEPT_CODE: TStringField;
    Ado1410DEPT_NAME: TStringField;
    Ado1410sIPaddress: TStringField;
    Ado1410IPaddress: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    strSQLTxt:string;
    StartDate,EndDate:TDatetime;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
