unit Dm;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TFrmDm = class(TDataModule)
    ADOAccData: TADODataSet;
    ADOConnection1: TADOConnection;
    ADOConnection2: TADOConnection;
    ADOSqlData: TADODataSet;
    ADOQData: TADOQuery;
    ADOY1410: TADODataSet;
    DSSqlData: TDataSource;
    ADOY1407: TADODataSet;
    ADOSqlDataRkey: TLargeintField;
    ADOSqlDatapanel_id: TStringField;
    ADOSqlDataccd_code: TStringField;
    ADOSqlDataY1417_RKEY: TIntegerField;
    ADOSqlDataY1406_RKEY: TIntegerField;
    ADOSqlDataCOMPUTER_IP: TStringField;
    ADOSqlDataT_DATE: TDateTimeField;
    ADOY1406: TADODataSet;
    ADOSqlDataWORK_ORDER_NUMBER: TStringField;
    ADOY1417: TADODataSet;
    ADOSqlDataFASSET_Name: TStringField;
    ADOQuery1: TADOQuery;
    ADOData0849: TADODataSet;
    ADOQAcc: TADOQuery;
    ADOAccDataNumber: TAutoIncField;
    ADOAccDataDecode1: TMemoField;
    ADOAccDataDataTime: TDateTimeField;
    ADOAccDataCameraID: TMemoField;
    ADOAccDataSaveDBFlag: TBooleanField;
    procedure DSSqlDataDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDm: TFrmDm;

implementation

uses Main;

{$R *.dfm}

procedure TFrmDm.DSSqlDataDataChange(Sender: TObject; Field: TField);
var CurRecord:integer;
begin
if Assigned(frmMain) then
begin
CurRecord:=FrmDM.ADOSqlData.RecNo;
if FrmDM.ADOSqlData.RecNo<0 then
CurRecord:=0;
frmMain.StatusBar1.Panels[0].Text:='当前记录'+IntToStr(CurRecord)+'/'+ '总记录数:'+ IntToStr(FrmDM.ADOSqlData.RecordCount);
end;
end;

end.
