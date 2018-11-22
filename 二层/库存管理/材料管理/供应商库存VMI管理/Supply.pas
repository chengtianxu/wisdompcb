unit Supply;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DB, ADODB, Grids, DBGrids;

type
  TForm_Supply = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    RadioGroup1: TRadioGroup;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1RKEY: TAutoIncField;
    ADOQuery1CODE: TStringField;
    ADOQuery1SUPPLIER_NAME: TStringField;
    ADOQuery1ABBR_NAME: TStringField;
    ADOQuery1BILLING_ADDRESS_1: TStringField;
    ADOQuery1STATE: TStringField;
    ADOQuery1ZIP: TStringField;
    ADOQuery1PHONE: TStringField;
    ADOQuery1FAX: TStringField;
    ADOQuery1TELEX: TStringField;
    ADOQuery1CURRENCY_PTR: TIntegerField;
    ADOQuery1PO_NOTE_PAD_PTR: TIntegerField;
    ADOQuery1DEBMEM_NOTE_PAD_PTR: TIntegerField;
    ADOQuery1RFQ_NOTE_PAD_PTR: TIntegerField;
    ADOQuery1common_pad_ptr: TIntegerField;
    ADOQuery1CONTACT_NAME_1: TStringField;
    ADOQuery1CONTACT_NAME_2: TStringField;
    ADOQuery1CONTACT_NAME_3: TStringField;
    ADOQuery1CONTACT_NAME_4: TStringField;
    ADOQuery1CONTACT_NAME_5: TStringField;
    ADOQuery1CONTACT_NAME_6: TStringField;
    ADOQuery1CONT_PHONE_1: TStringField;
    ADOQuery1CONT_PHONE_2: TStringField;
    ADOQuery1CONT_PHONE_3: TStringField;
    ADOQuery1CONT_PHONE_4: TStringField;
    ADOQuery1CONT_PHONE_5: TStringField;
    ADOQuery1CONT_PHONE_6: TStringField;
    ADOQuery1TAX_1: TFloatField;
    ADOQuery1TAX_2: TFloatField;
    ADOQuery1CURRENT_BALANCE: TFloatField;
    ADOQuery1OUTSTANDING_DEBITS: TFloatField;
    ADOQuery1PAYMENT_TERMS: TSmallintField;
    ADOQuery1DISCOUNT: TFloatField;
    ADOQuery1DISCOUNT_DAYS: TSmallintField;
    ADOQuery1PRNT_ONE_INV_PER_CHK: TStringField;
    ADOQuery1PUT_ALL_INV_HOLD: TStringField;
    ADOQuery1LANGUAGE_FLAG: TStringField;
    ADOQuery1TAX_ID_NUMBER: TStringField;
    ADOQuery1DISCOUNT2: TFloatField;
    ADOQuery1DISCOUNT2_DAYS: TSmallintField;
    ADOQuery1COUNTRY_PTR: TIntegerField;
    ADOQuery1NAME_FOR_FORM: TStringField;
    ADOQuery1ADDRESS1_FOR_FORM: TStringField;
    ADOQuery1ADDRESS2_FOR_FORM: TStringField;
    ADOQuery1ADDRESS3_FOR_FORM: TStringField;
    ADOQuery1ANALYSIS_CODE1: TStringField;
    ADOQuery1ANALYSIS_CODE2: TStringField;
    ADOQuery1ANALYSIS_CODE3: TStringField;
    ADOQuery1SUPPIER_ENT_DATE: TDateTimeField;
    ADOQuery1EDI_ID: TStringField;
    ADOQuery1EDI_FLAG_FOR_PO: TSmallintField;
    ADOQuery1EDI_FLAG_DEBIT_MEMO: TSmallintField;
    ADOQuery1GEN_EMAIL_ADDRESS: TStringField;
    ADOQuery1EMAIL_FOR_CONTACT1: TStringField;
    ADOQuery1EMAIL_FOR_CONTACT2: TStringField;
    ADOQuery1EMAIL_FOR_CONTACT3: TStringField;
    ADOQuery1EMAIL_FOR_CONTACT4: TStringField;
    ADOQuery1EMAIL_FOR_CONTACT5: TStringField;
    ADOQuery1EMAIL_FOR_CONTACT6: TStringField;
    ADOQuery1ACC_PAYABLE_PTR: TIntegerField;
    ADOQuery1EDI_OUT_NEW_PO: TWordField;
    ADOQuery1EDI_OUT_CHG_PO: TWordField;
    ADOQuery1ttype: TWordField;
    ADOQuery1brother_flag: TBooleanField;
    ADOQuery1update_date: TDateTimeField;
    ADOQuery1user_ptr: TIntegerField;
    ADOQuery1status: TWordField;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Supply: TForm_Supply;

implementation

uses demo;

{$R *.dfm}

procedure TForm_Supply.BitBtn1Click(Sender: TObject);
begin
edit1.Text:='';
edit1.SetFocus;
end;

procedure TForm_Supply.Edit1Change(Sender: TObject);
begin
 IF trim(EDIT1.TEXT)<>'' THEN
  if radiogroup1.ItemIndex=0 then
   adoQUERY1.Filter:='code like ''%'+trim(edit1.text)+'%'''
  else
   adoQUERY1.Filter:='supplier_name like ''%'+trim(edit1.text)+'%'''
 ELSE
   adoQUERY1.FILTER:='';

if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TForm_Supply.DBGrid1DblClick(Sender: TObject);
begin
if (not adoquery1.IsEmpty) then
 ModalResult:=mrok;
end;

procedure TForm_Supply.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not adoquery1.IsEmpty) then ModalResult:=mrok;
end;
procedure TForm_Supply.RadioGroup1Click(Sender: TObject);
begin
if radiogroup1.ItemIndex=0 then
 label1.Caption := '供应商代码:'
else
 label1.Caption := '供应商名称:';
edit1.SetFocus;
end;

procedure TForm_Supply.FormCreate(Sender: TObject);
begin
adoquery1.Open;
adoquery1.Filter:='EDI_OUT_NEW_PO=1';
end;

end.
