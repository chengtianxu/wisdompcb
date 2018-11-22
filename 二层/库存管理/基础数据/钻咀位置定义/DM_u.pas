unit DM_u;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ACON: TADOConnection;
    AQ160: TADOQuery;
    DS160: TDataSource;
    AQ160RKEY: TAutoIncField;
    AQ160LOCATION_CODE: TStringField;
    AQ160LOCATION_NAME: TStringField;
    AQ160OH_degree: TWordField;
    AQ160CODE: TStringField;
    AQ160ABBR_NAME: TStringField;
    AQ160FASSET_CODE: TStringField;
    AQ160FASSET_NAME: TStringField;
    AQ160REMARK: TStringField;
    ADOQuery1: TADOQuery;
    ADOQuery1RKEY: TAutoIncField;
    ADOQuery1LOCATION_CODE: TStringField;
    ADOQuery1LOCATION_NAME: TStringField;
    ADOQuery1TYPE: TWordField;
    ADOQuery1OH_degree: TWordField;
    ADOQuery1SUPPLIER_PTR: TIntegerField;
    ADOQuery1FASSET_PTR: TIntegerField;
    ADOQuery1REMARK: TStringField;
    AQ160TYPE: TWordField;
    AQ160SUPPLIER_PTR: TIntegerField;
    AQ160FASSET_PTR: TIntegerField;
    AQ160SUPPLIER_NAME: TStringField;
    AQ160FASSET_DESC: TStringField;
    AQ220: TADOQuery;
    procedure AQ160AfterScroll(DataSet: TDataSet);
    procedure AQ160AfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses Mail_u;

{$R *.dfm}

procedure TDM.AQ160AfterScroll(DataSet: TDataSet);
begin
  FrmMain.ShowData;
end;

procedure TDM.AQ160AfterOpen(DataSet: TDataSet);
begin
  FrmMain.ShowData;
end;

end.
