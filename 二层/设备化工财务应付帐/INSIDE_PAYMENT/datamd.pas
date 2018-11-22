unit datamd;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  Tdm = class(TDataModule)
    ACt: TADOConnection;
    DataSource1: TDataSource;
    AQ129: TADOQuery;
    AQ129EMPLOYEE_NAME: TStringField;
    AQ129BANK_NAME: TStringField;
    AQ129EX_RATE: TBCDField;
    AQ129CURR_NAME: TStringField;
    AQ129CURR_CODE: TStringField;
    AQ129TTYPE: TSmallintField;
    AQ129STATUS: TSmallintField;
    AQ129TDATE: TDateTimeField;
    AQ129CHECK_NUMBER: TStringField;
    AQ129AMOUNT: TBCDField;
    AQ129v_type: TStringField;
    AQ129v_status: TStringField;
    AQ129rkey: TIntegerField;
    ADOQuery1: TADOQuery;
    ADO128: TADOQuery;
    ADO128bank_current_check: TStringField;
    ADO129: TADOQuery;
    ADO129RKEY: TAutoIncField;
    ADO129CHECK_NUMBER: TStringField;
    ADO129BANK_PTR: TIntegerField;
    ADO129TDATE: TDateTimeField;
    ADO129STATUS: TSmallintField;
    ADO129TTYPE: TSmallintField;
    ADO129SRCE_PTR: TIntegerField;
    ADO129EMPL_PTR: TIntegerField;
    ADO129AMOUNT: TBCDField;
    ADO129PAY_TO: TStringField;
    ADO129CURR_PTR: TIntegerField;
    ADO129EX_RATE: TBCDField;
    ADO129REMARK: TStringField;
    ADO129warehouse_ptr: TIntegerField;
    ADO128bal_amount: TFloatField;
    ADO521: TADOQuery;
    AQ129bal_amount: TFloatField;
    AQ129WAREHOUSE_CODE: TStringField;
    AQ129WAREHOUSE_NAME: TStringField;
    AQ129REMARK: TStringField;
    AQ129EMPL_CODE: TStringField;
    AQ129DSDesigner: TStringField;
    ADO521RKEY: TAutoIncField;
    ADO521TTYPE: TSmallintField;
    ADO521EXPENSE_TP: TStringField;
    ADO521SUMMARIZE: TStringField;
    ADO521SRCE_PTR: TIntegerField;
    ADO521AMOUNT: TBCDField;
    ADO521inex_ptr: TIntegerField;
    AQ129amount_bamt: TBCDField;
    procedure AQ129CalcFields(DataSet: TDataSet);
    procedure AQ129AfterOpen(DataSet: TDataSet);
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

procedure Tdm.AQ129CalcFields(DataSet: TDataSet);
begin
case self.AQ129TTYPE.Value of
 1:self.AQ129v_type.Value:='付款支票';
 2:self.AQ129v_type.Value:='预付支票';
 3:self.AQ129v_type.Value:='费用开支';
 4:self.AQ129v_type.Value:='转帐支票';
end;

case self.AQ129STATUS.Value of
 1:self.AQ129v_status.Value:='未清';
 2:self.AQ129v_status.Value:='已清';
 3:self.AQ129v_status.Value:='取消';
end;

end;

procedure Tdm.AQ129AfterOpen(DataSet: TDataSet);
var
 amount_bamt:currency;
begin
 amount_bamt:=0;
 aq129.DisableControls;
 dm.datasource1.DataSet:=nil;
 aq129.First;
 while not dm.aq129.Eof do
  begin
   amount_bamt:=amount_bamt+aq129amount_bamt.Value;
   aq129.Next;
  end;
 aq129.First;
 datasource1.DataSet:=dm.aq129;
 aq129.EnableControls;
 form1.Edit2.Text:=format('%2f',[amount_bamt]);
end;
end.
