unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    AQ71: TADOQuery;
    DataSource1: TDataSource;
    AQ71rkey: TAutoIncField;
    AQ71quan_ord: TFloatField;
    AQ71quan_recd: TFloatField;
    AQ71inv_part_number: TStringField;
    AQ71s_b_n: TStringField;
    AQ71REQ_DATE: TDateTimeField;
    AQ71unit_code: TStringField;
    AQ71save_meth: TStringField;
    AQ71QUAN_RETN: TFloatField;
    AQ22: TADOQuery;
    DataSource2: TDataSource;
    AQ22inv_part_number: TStringField;
    AQ22BARCODE_ID: TStringField;
    AQ22quantity: TFloatField;
    AQ22quan_stocked: TFloatField;
    AQ22quan_to_be_shipped: TFloatField;
    AQ22QUAN_RETURNED: TFloatField;
    AQ22tdate: TDateTimeField;
    AQ22quan_on_hand: TFloatField;
    AQ22rkey: TAutoIncField;
    AQ22unit_code: TStringField;
    ado95: TADOQuery;
    ado9511: TADOQuery;
    AQ22inventory_ptr: TIntegerField;
    ADOQuery1: TADOQuery;
    aq96: TADOQuery;
    DataSource3: TDataSource;
    aq96tdate: TDateTimeField;
    aq96quan_rejd: TFloatField;
    aq96REJECT_DESCRIPTION: TStringField;
    aq96employee_name: TStringField;
    aq96rkey: TIntegerField;
    AQ22INV_NAME: TStringField;
    AQ22INV_DESCRIPTION: TStringField;
    procedure AQ71CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.AQ71CalcFields(DataSet: TDataSet);
begin
 if dm.AQ71s_b_n.Value='S' then
  dm.AQ71save_meth.Value := 'ÐòºÅ'
 else
  if dm.AQ71s_b_n.Value='B' then
   dm.AQ71save_meth.Value := 'Åú´Î'
  else
   dm.AQ71save_meth.Value := 'ÎÞ';
end;

end.
