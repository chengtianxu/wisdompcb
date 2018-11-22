unit datamd;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  Tdm = class(TDataModule)
    ACt: TADOConnection;
    Aq107: TADOQuery;
    DataSource1: TDataSource;
    Aq107CODE: TStringField;
    Aq107ABBR_NAME: TStringField;
    Aq107INVOICE_NO: TStringField;
    Aq107CURR_NAME: TStringField;
    Aq107INV_DATE: TDateTimeField;
    Aq107EMPLOYEE_NAME: TStringField;
    Aq107INV_TOTAL: TBCDField;
    Aq107EX_RATE: TFloatField;
    Aq107v_status: TStringField;
    Aq107v_type: TStringField;
    Aq107INV_TP: TWordField;
    Aq107STATUS: TWordField;
    ADOQuery1: TADOQuery;
    ADOSP04: TADOStoredProc;
    ADOSP04CONTROL_NO_LENGTH: TSmallintField;
    ADOSP04SEED_VALUE: TStringField;
    ADOSP04SEED_FLAG: TWordField;
    aq22: TADOQuery;
    aq22INV_NAME: TStringField;
    aq22INV_DESCRIPTION: TStringField;
    aq22QUANTITY: TBCDField;
    aq22UNIT_NAME: TStringField;
    aq22PRICE: TBCDField;
    aq22TAX_2: TBCDField;
    aq22amount: TBCDField;
    aq22tax_amount: TBCDField;
    aq22GRN_PTR: TIntegerField;
    aq22RKEY: TIntegerField;
    aq22SOURCE_PTR: TIntegerField;
    ADO107: TADOQuery;
    ADO107INVOICE_NO: TStringField;
    ADO107SUPP_PTR: TIntegerField;
    ADO107CURRENCY_PTR: TIntegerField;
    ADO107EX_RATE: TBCDField;
    ADO107warehouse_ptr: TIntegerField;
    ADO107EMPL_PTR: TIntegerField;
    ADO107INV_TP: TWordField;
    ADO107STATUS: TWordField;
    ADO107INV_TOTAL: TBCDField;
    ADO107MATL_TOT: TBCDField;
    ADO107FED_TAX: TBCDField;
    ADO107MISC_TOT: TBCDField;
    ADO107INV_DATE: TDateTimeField;
    ADO107ENT_DATE: TDateTimeField;
    ADO107DUE_DATE: TDateTimeField;
    ADO107tax_invoice_amt: TBCDField;
    ADO107tax_invoice_date: TDateTimeField;
    ADO107tax_invoice_ref: TStringField;
    Aq107rkey: TIntegerField;
    ADO107rkey: TAutoIncField;
    Aq107SUPPLIER_NAME: TStringField;
    Aq107WAREHOUSE_CODE: TStringField;
    Aq107WAREHOUSE_NAME: TStringField;
    Aq107MATL_TOT: TBCDField;
    Aq107FED_TAX: TBCDField;
    Aq107MISC_TOT: TBCDField;
    Aq107DUE_DATE: TDateTimeField;
    Aq107supp_ptr: TIntegerField;
    Aq107warehouse_ptr: TIntegerField;
    Aq107currency_ptr: TIntegerField;
    ADOQuery2: TADOQuery;
    ADOupdate70: TADOQuery;
    ADOupmc70: TADOQuery;
    ADOQuery3: TADOQuery;
    Aq107total_bamt: TBCDField;
    procedure Aq107CalcFields(DataSet: TDataSet);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure Aq107AfterOpen(DataSet: TDataSet);
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

procedure Tdm.Aq107CalcFields(DataSet: TDataSet);
begin
case self.Aq107STATUS.Value of
 1:self.Aq107v_status.Value:='有效的';
 2:self.Aq107v_status.Value:='已付款';
 3:self.Aq107v_status.Value:='被暂缓';
end;

case self.Aq107INV_TP.Value of
 1:self.Aq107v_type.Value:='标准PO';
 2:self.Aq107v_type.Value:='杂项PO';
 3:self.Aq107v_type.Value:='直接入仓';
 4:self.Aq107v_type.Value:='其它费用';
end;
end;

procedure Tdm.DataSource1DataChange(Sender: TObject; Field: TField);
//var
// total_amt,total_bamt:double;
// rkey:integer;
begin
// total_amt:=0;
// total_bamt:=0;
// rkey:=self.Aq107rkey.Value;
// self.Aq107.DisableControls;
// datasource1.DataSet:=nil;
{ aq107.First;
 while not aq107.Eof do
  begin
   total_amt:=total_amt+self.Aq107INV_TOTAL.Value;
   total_bamt:=total_bamt+self.Aq107total_bamt.Value;
   aq107.Next;
  end;
}
 //if rkey>0 then self.Aq107.Locate('rkey',rkey,[]);
// datasource1.DataSet:=self.Aq107; 
// self.Aq107.EnableControls;
// form1.Edit2.Text:=format('%2f',[total_amt]);
 //form1.Edit3.Text:=format('%2f',[total_bamt]);
end;

procedure Tdm.Aq107AfterOpen(DataSet: TDataSet);
var
 total_bamt:double;
begin
 total_bamt:=0;
 self.Aq107.DisableControls;
 datasource1.DataSet:=nil;
 aq107.First;
 while not aq107.Eof do
  begin
   total_bamt:=total_bamt+self.Aq107total_bamt.Value;
   aq107.Next;
  end;
 aq107.First; 
 datasource1.DataSet:=self.Aq107;
 self.Aq107.EnableControls;
 form1.Edit3.Text:=format('%2f',[total_bamt]);
end;

end.
