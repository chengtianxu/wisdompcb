unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADS845: TADODataSet;
    ADS846: TADODataSet;
    tmp: TADOQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ADS845rkey: TIntegerField;
    ADS845FaultDesc: TStringField;
    ADS846rkey: TAutoIncField;
    ADS846D845_ptr: TIntegerField;
    ADS846FaultName: TStringField;
    ADS846stdDate: TBCDField;
    procedure ADS845AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses main;

{$R *.dfm}

procedure TDM.ADS845AfterScroll(DataSet: TDataSet);
begin
  frm_Main.StatusBar1.Panels[0].Text:='当前记录行:'+IntToStr(DM.ADS845.RecNo)+
  '/总记录数:'+ IntToStr(DM.ADS845.RecordCount);
end;

end.
