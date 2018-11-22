unit uDM;

interface

uses
  SysUtils, Classes, DB, ADODB,Variants;

type
  TDM = class(TDataModule)
    ADOCnn: TADOConnection;
    ADOQ105: TADOQuery;
    ADODS106: TADODataSet;
    ADOQ105rkey: TAutoIncField;
    ADOQ105voucher: TStringField;
    ADOQ105entered_dt: TDateTimeField;
    ADOQ105employee_name: TStringField;
    ADOQ105vou_type: TSmallintField;
    ADOQ105status: TSmallintField;
    ADOQ105audited_by_empl_ptr: TIntegerField;
    ADOQ105remark: TStringField;
    ADOQ105trans_type: TSmallintField;
    ADOQ105fyear: TIntegerField;
    ADOQ105period: TSmallintField;
    ADOQ105ttype: TStringField;
    ADOQ105ctype: TStringField;
    ADOQ105cstatus: TStringField;
    ADOQ105audited: TStringField;
    ADOQ105casher: TStringField;
    ADOQ105supervisor: TStringField;
    ADOQ105casher_ptr: TIntegerField;
    ADOQ105supervisor_ptr: TIntegerField;
    ADOQ105attached: TSmallintField;
    ADODS106GL_ACC_NUMBER: TStringField;
    ADODS106GL_DESCRIPTION: TStringField;
    ADODS106CURR_NAME: TStringField;
    ADODS106tGL_DESCRIPTION: TStringField;
    ADODS106pGL_DESCRIPTION: TStringField;
    ADODS106GL_HEADER_PTR: TIntegerField;
    ADODS106RKEY: TAutoIncField;
    ADODS106GL_ACCT_NO_PTR: TIntegerField;
    ADODS106REF_NUMBER: TStringField;
    ADODS106DESCRIPTION: TStringField;
    ADODS106SRCE_PTR: TIntegerField;
    ADODS106AMOUNT: TBCDField;
    ADODS106D_C: TStringField;
    ADODS106FYEAR: TIntegerField;
    ADODS106PERIOD: TSmallintField;
    ADODS106INV_PTR: TIntegerField;
    ADODS106UNIT_PTR: TIntegerField;
    ADODS106CURR_PTR: TIntegerField;
    ADODS106PRICE: TFloatField;
    ADODS106EXCH_RATE: TFloatField;
    ADODS106CURR_CODE: TStringField;
    ADODS106Cgl_Acc: TStringField;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ADOQ105BATCH_NUMBER: TStringField;
    tmp: TADOQuery;
    procedure ADOQ105CalcFields(DataSet: TDataSet);
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

procedure TDM.ADOQ105CalcFields(DataSet: TDataSet);
begin
 with ADOQ105 do
  begin
    case FieldByName('vou_type').asinteger of
      0:FieldByName('ctype').asstring:='转账凭证';
      1:FieldByName('ctype').asstring:='付款凭证';
      2:FieldByName('ctype').asstring:='收款凭证';
      3:FieldByName('ctype').asstring:='收/付款凭证';
      4:FieldByName('ctype').asstring:='特殊转账凭证';
    end;
    case FieldByName('STATUS').asinteger of
      0:FieldByName('cstatus').asstring:='未审核';
      1:FieldByName('cstatus').asstring:='会计已审';
      2:FieldByName('cstatus').asstring:='主管已审';
      3:FieldByName('cstatus').asstring:='已登帐';
      4:FieldByName('cstatus').asstring:='出纳已审';
      5:ADOQ105cstatus.Value:='被作废';
    end;
    case FieldByName('trans_type').asinteger of
      1:FieldByName('ttype').asstring:='材料应付入帐';
      2:FieldByName('ttype').asstring:='杂项应付入帐';
      3:FieldByName('ttype').asstring:='应付付款';
      4:FieldByName('ttype').asstring:='借项备忘';
      5:FieldByName('ttype').asstring:='应收入帐';
      6:FieldByName('ttype').asstring:='收款处理';
      7:FieldByName('ttype').asstring:='贷项备忘';
      8:FieldByName('ttype').asstring:='结转原材料';
      9:FieldByName('ttype').asstring:='其它';
      10:FieldByName('ttype').asstring:='银行转账'
    end;
  end;
end;

procedure TDM.ADODS106CalcFields(DataSet: TDataSet);
begin
if dm.ADODS106.FieldByName('pGL_DESCRIPTION').AsVariant<>null  then
  dm.ADODS106Cgl_Acc.AsString :=trim(dm.ADODS106.FieldByName('pGL_DESCRIPTION').AsString) +'-'+
                                trim(dm.ADODS106.FieldByName('GL_DESCRIPTION').AsString)
ELSE
  dm.ADODS106Cgl_Acc.AsString :=trim(dm.ADODS106.FieldByName('GL_DESCRIPTION').AsString);

if (dm.ADODS106.FieldByName('tGL_DESCRIPTION').AsVariant <>null)  then
  dm.ADODS106Cgl_Acc.AsString :=
   trim(dm.ADODS106tGL_DESCRIPTION.Value)+'-'+
   trim(dm.ADODS106Cgl_Acc.AsString);

end;

end.
