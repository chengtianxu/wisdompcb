unit Datamodule;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOCnn: TADOConnection;
    tmp: TADOQuery;
    DataSource1: TDataSource;
    ADODS106: TADOQuery;
    ADODS106RKEY: TIntegerField;
    ADODS106VOUCHER: TStringField;
    ADODS106ENTERED_DT: TDateTimeField;
    ADODS106ATTACHED: TSmallintField;
    ADODS106VOU_TYPE: TStringField;
    ADODS106sSTATUS: TStringField;
    ADODS106AUDITED_BY_EMPL_PTR: TIntegerField;
    ADODS106TRANS_TYPE: TStringField;
    ADODS106FYEAR: TIntegerField;
    ADODS106PERIOD: TSmallintField;
    ADODS106casher_ptr: TIntegerField;
    ADODS106supervisor_ptr: TIntegerField;
    ADODS106entered: TStringField;
    ADODS106audited: TStringField;
    ADODS106supervisor: TStringField;
    ADODS106casher: TStringField;
    ADODS106BATCH_NUMBER: TStringField;
    ADODS106code: TStringField;
    ADODS106abbr_name23: TStringField;
    ADODS106cust_code: TStringField;
    ADODS106abbr_name10: TStringField;
    ADODS106GL_ACC_NUMBER: TStringField;
    ADODS106GL_DESCRIPTION: TStringField;
    ADODS106father_desc: TStringField;
    ADODS106grandfather_desc: TStringField;
    ADODS106CURR_CODE: TStringField;
    ADODS106exch_rate: TBCDField;
    ADODS106GL_HEADER_PTR: TIntegerField;
    ADODS106Expr1: TIntegerField;
    ADODS106GL_ACCT_NO_PTR: TIntegerField;
    ADODS106REF_NUMBER: TStringField;
    ADODS106DESCRIPTION: TStringField;
    ADODS106SRCE_PTR: TIntegerField;
    ADODS106AMOUNT: TBCDField;
    ADODS106D_C: TStringField;
    ADODS106Expr2: TIntegerField;
    ADODS106Expr3: TSmallintField;
    ADODS106INV_PTR: TIntegerField;
    ADODS106UNIT_PTR: TIntegerField;
    ADODS106CURR_PTR: TIntegerField;
    ADODS106PRICE: TBCDField;
    ADODS106self_desc: TStringField;
    procedure ADODS106CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.ADODS106CalcFields(DataSet: TDataSet);
begin
  self.ADODS106self_desc.Value:=trim(self.ADODS106GL_DESCRIPTION.Value);
  if self.ADODS106father_desc.Value<>'' then
  begin
   self.ADODS106self_desc.Value:=trim(self.ADODS106father_desc.Value)+'-'+
                                         self.ADODS106self_desc.Value;
  if self.ADODS106grandfather_desc.Value<>'' then
   self.ADODS106self_desc.Value:=trim(self.ADODS106grandfather_desc.Value)+'-'+
                                         self.ADODS106self_desc.Value;
  end;
end;

end.
