unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB,Dialogs;

type
  TDM = class(TDataModule)
   ADOConnection1: TADOConnection;
   ADOTable1: TADOTable;
   ADOTable1RKEY: TAutoIncField;
   ADOTable1CODE: TStringField;
   ADOTable1SUPPLIER_NAME: TStringField;
   ADOTable1ABBR_NAME: TStringField;
   ADOTable1BILLING_ADDRESS_1: TStringField;
   ADOTable1BILLING_ADDRESS_2: TStringField;
   ADOTable1BILLING_ADDRESS_3: TStringField;
   ADOTable1STATE: TStringField;
   ADOTable1ZIP: TStringField;
   ADOTable1PHONE: TStringField;
   ADOTable1FAX: TStringField;
   ADOTable1TELEX: TStringField;
   ADOTable1CURRENCY_PTR: TIntegerField;
   ADOTable1PO_NOTE_PAD_PTR: TIntegerField;
   ADOTable1DEBMEM_NOTE_PAD_PTR: TIntegerField;
   ADOTable1RFQ_NOTE_PAD_PTR: TIntegerField;
   ADOTable1common_pad_ptr: TIntegerField;
   ADOTable1CONTACT_NAME_1: TStringField;
   ADOTable1CONTACT_NAME_2: TStringField;
   ADOTable1CONTACT_NAME_3: TStringField;
   ADOTable1CONTACT_NAME_4: TStringField;
   ADOTable1CONTACT_NAME_5: TStringField;
   ADOTable1CONTACT_NAME_6: TStringField;
   ADOTable1CONT_PHONE_1: TStringField;
   ADOTable1CONT_PHONE_2: TStringField;
   ADOTable1CONT_PHONE_3: TStringField;
   ADOTable1CONT_PHONE_4: TStringField;
   ADOTable1CONT_PHONE_5: TStringField;
   ADOTable1CONT_PHONE_6: TStringField;
   ADOTable1TAX_1: TFloatField;
   ADOTable1TAX_2: TFloatField;
   ADOTable1CURRENT_BALANCE: TFloatField;
   ADOTable1OUTSTANDING_DEBITS: TFloatField;
   ADOTable1PAYMENT_TERMS: TSmallintField;
   ADOTable1DISCOUNT: TFloatField;
   ADOTable1DISCOUNT_DAYS: TSmallintField;
   ADOTable1PRNT_ONE_INV_PER_CHK: TStringField;
   ADOTable1PUT_ALL_INV_HOLD: TStringField;
   ADOTable1LANGUAGE_FLAG: TStringField;
   ADOTable1TAX_ID_NUMBER: TStringField;
   ADOTable1DISCOUNT2: TFloatField;
   ADOTable1DISCOUNT2_DAYS: TSmallintField;
   ADOTable1COUNTRY_PTR: TIntegerField;
   ADOTable1NAME_FOR_FORM: TStringField;
   ADOTable1ADDRESS1_FOR_FORM: TStringField;
   ADOTable1ADDRESS2_FOR_FORM: TStringField;
   ADOTable1ADDRESS3_FOR_FORM: TStringField;
   ADOTable1ANALYSIS_CODE1: TStringField;
   ADOTable1ANALYSIS_CODE2: TStringField;
   ADOTable1ANALYSIS_CODE3: TStringField;
   ADOTable1SUPPIER_ENT_DATE: TDateTimeField;
   ADOTable1EDI_ID: TStringField;
   ADOTable1EDI_FLAG_FOR_PO: TSmallintField;
    ADOTable1EDI_FLAG_DEBIT_MEMO: TSmallintField;
    ADOTable1GEN_EMAIL_ADDRESS: TStringField;
    ADOTable1EMAIL_FOR_CONTACT1: TStringField;
    ADOTable1EMAIL_FOR_CONTACT2: TStringField;
    ADOTable1EMAIL_FOR_CONTACT3: TStringField;
    ADOTable1EMAIL_FOR_CONTACT4: TStringField;
    ADOTable1EMAIL_FOR_CONTACT5: TStringField;
    ADOTable1EMAIL_FOR_CONTACT6: TStringField;
    ADOTable1ACC_PAYABLE_PTR: TIntegerField;
    ADOTable1EDI_OUT_NEW_PO: TIntegerField;
    ADOTable1EDI_OUT_CHG_PO: TIntegerField;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    ADOQuery3: TADOQuery;
    AQ04: TADOStoredProc;
    AQ04CONTROL_NO_LENGTH: TSmallintField;
    AQ04SEED_VALUE: TStringField;
    AQ04SEED_FLAG: TWordField;
    ADOTable1TTYPE: TWordField;
    procedure ADOTable1PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure ADOTable1AfterDelete(DataSet: TDataSet);
    procedure ADOTable1DeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.ADOTable1PostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
 messagedlg('供应商代码编号重复请重新输入!',mtwarning,[mbok],0);
 abort;
end;

procedure TDM.ADOTable1AfterDelete(DataSet: TDataSet);
begin
 messagedlg('数据被成功删除!',mtinformation,[mbok],0);
end;

procedure TDM.ADOTable1DeleteError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
 messagedlg('无法删除该供应商,已用于其它表项',mtwarning,[mbcancel],0);
 abort;
end;

end.
