unit damo;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms,
  Dialogs, DBTables, DB, ADODB, Provider, DBClient;

type
  Tdm = class(TDataModule)
    ADOConnection1: TADOConnection;
    DS100: TDataSource;
    AQTMP: TADOQuery;
    DS_pickitem: TDataSource;
    ADS_pickitem: TADODataSet;
    ADS100: TADODataSet;
    AQ100: TADOQuery;
    ADS_pickitemisselected: TBooleanField;
    ADS_pickitemrkey: TAutoIncField;
    CDS_pickitem: TClientDataSet;
    DSP_pickitem: TDataSetProvider;
    ADS_pickitemcust_code: TStringField;
    ADS_pickitemcustomer_name: TStringField;
    ADS100csi_ptr: TIntegerField;
    ADS100customer_ptr: TIntegerField;
    ADS100user_login_name: TStringField;
    ADS100user_full_name: TStringField;
    ADS100cust_code: TStringField;
    ADS100customer_name: TStringField;
    ADS100ABBR_NAME: TStringField;
    ADS_pickitemABBR_NAME: TStringField;
    CDS_pickitemisselected: TBooleanField;
    CDS_pickitemrkey: TAutoIncField;
    CDS_pickitemcust_code: TStringField;
    CDS_pickitemcustomer_name: TStringField;
    CDS_pickitemABBR_NAME: TStringField;
    procedure ADS_pickitemAfterOpen(DataSet: TDataSet);
    procedure ADS100AfterOpen(DataSet: TDataSet);
    procedure ADS100AfterClose(DataSet: TDataSet);
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

procedure Tdm.ADS_pickitemAfterOpen(DataSet: TDataSet);
begin
  cds_pickitem.Data:=dsp_pickitem.Data;
end;

procedure Tdm.ADS100AfterOpen(DataSet: TDataSet);
begin
  frm_main.Bar1.Panels[1].Text:=inttostr(ads100.RecordCount);
end;

procedure Tdm.ADS100AfterClose(DataSet: TDataSet);
begin
  frm_main.Bar1.Panels[1].Text:='0';
end;

end.
