unit damo;

interface

uses
  SysUtils, Classes, ADODB, DB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADS834: TADODataSet;
    DataSource1: TDataSource;
    tmp: TADOQuery;
    ADS834USER_LOGIN_NAME: TStringField;
    ADS834USER_FULL_NAME: TStringField;
    ADS834DEPT_NAME: TStringField;
    ADS834WAREHOUSE_CODE: TStringField;
    ADS834ABBR_NAME: TStringField;
    ADS834User_ptr: TIntegerField;
    ADS834DeptCode: TStringField;
    ADS834Phone: TStringField;
    ADS834warehouse_ptr: TIntegerField;
    procedure ADS834AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses Main;

{$R *.dfm}

procedure TDM.ADS834AfterScroll(DataSet: TDataSet);
begin
frm_Main.StatusBar1.Panels[0].Text:='当前记录行:'+IntToStr(DM.ADS834.RecNo)+
  '/总记录数:'+ IntToStr(DM.ADS834.RecordCount);
end;

end.
