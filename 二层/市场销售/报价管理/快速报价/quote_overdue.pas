unit quote_overdue;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ADODB, Grids, DBGrids, StdCtrls;

type
  TForm_overdue = class(TForm)
    Button1: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADS85: TADODataSet;
    ADS85TNUMBER: TStringField;
    ADS85REF_PART_NO: TStringField;
    ADS85CUST_PART_NO: TStringField;
    ADS85CUST_NAME: TStringField;
    ADS85quote_taxprice: TFloatField;
    ADS85curr_code: TStringField;
    ADS85CURR_NAME: TStringField;
    ADS85CURR_RATE: TFloatField;
    ADS85vatax: TBCDField;
    ADS85MARKUP: TFloatField;
    ADS85QTE_DATE: TDateTimeField;
    ADS85EXPIRATION_DATE: TDateTimeField;
    ADS85EMPLOYEE_NAME: TStringField;
    ADS85DSDesigner: TStringField;
    ADS85DSDesigner2: TStringField;
    ADS85REP_CODE: TStringField;
    ADS85SALES_REP_NAME: TStringField;
    ADS85prod_code: TStringField;
    ADS85product_name: TStringField;
    ADS85code: TStringField;
    ADS85QTE_APPROV_DESC: TStringField;
    ADS85ROW_NAME: TStringField;
    ADS85QBY_EMPL_PTR: TIntegerField;
    Panel1: TPanel;
    CheckBox1: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_overdue: TForm_overdue;

implementation

uses damo,common;

{$R *.dfm}

procedure TForm_overdue.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if self.CheckBox1.Checked then
with dm.ADOQuery1 do
begin
 close;
 sql.Clear;
 sql.Add('update data0085');
 sql.Add('set audited_status=2');
 sql.Add('where (data0085.ttype=0) and');
 sql.Add('(data0085.audited_status=3) and');
 sql.Add('(data0085.expiration_date < CONVERT(datetime, CONVERT(varchar, getdate(), 101), 101))');
 execsql;
end;
end;

end.
