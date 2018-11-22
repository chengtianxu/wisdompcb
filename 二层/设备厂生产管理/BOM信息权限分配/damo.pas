unit damo;

interface

uses
  SysUtils,Windows, Messages, Classes, Graphics, Controls, Forms,
  Dialogs, DBTables, Provider, DBClient, DB, ADODB;

type
  Tdm = class(TDataModule)
    ADOConnection1: TADOConnection;
    DS100: TDataSource;
    AQTMP: TADOQuery;
    DS_pickitem: TDataSource;
    ADS_pickitem: TADODataSet;
    ADS_pickitemisselected: TBooleanField;
    ADS_pickitemrkey: TAutoIncField;
    ADS_pickitemcust_code: TStringField;
    ADS_pickitemcustomer_name: TStringField;
    ADS100: TADODataSet;
    ADS100csi_ptr: TIntegerField;
    ADS100user_login_name: TStringField;
    ADS100user_full_name: TStringField;
    AQ100: TADOQuery;
    DSP_pickitem: TDataSetProvider;
    ADS100proc_ptr: TIntegerField;
    ADS100PROD_CODE: TStringField;
    ADS100PRODUCT_NAME: TStringField;
    CDS_pickitem: TClientDataSet;
    ADS100PRODUCT_DESC: TStringField;
    procedure ADS100AfterClose(DataSet: TDataSet);
    procedure ADS100AfterOpen(DataSet: TDataSet);
    procedure ADS_pickitemAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

uses main;

{$R *.dfm}

procedure Tdm.ADS100AfterClose(DataSet: TDataSet);
begin
    Form1.Bar1.Panels[1].Text := '0';
end;

procedure Tdm.ADS100AfterOpen(DataSet: TDataSet);
begin
    Form1.Bar1.Panels[1].Text := IntToStr(ADS100.RecordCount);
end;

procedure Tdm.ADS_pickitemAfterOpen(DataSet: TDataSet);
begin
    //  cds_pickitem.Data:=dsp_pickitem.Data;
    CDS_pickitem.Data := DSP_pickitem.Data;
end;

end.
