unit damo;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms,
  Dialogs, DBTables, DB, ADODB;

type
  Tdm = class(TDataModule)
    ADOConnection1: TADOConnection;
    ds23: TDataSource;
    ads23: TADODataSet;
    aqtmp: TADOQuery;
    aq23: TADOQuery;
    dsq23: TDataSource;
    aq24: TADOQuery;
    dsq24: TDataSource;
    aq23rkey: TAutoIncField;
    aq23code: TStringField;
    aq23supplier_name: TStringField;
    aq23abbr_name: TStringField;
    aq23billing_address_1: TStringField;
    aq23state: TStringField;
    aq23zip: TStringField;
    aq23phone: TStringField;
    aq23fax: TStringField;
    aq23telex: TStringField;
    aq23contact_name_1: TStringField;
    aq23contact_name_2: TStringField;
    aq23contact_name_3: TStringField;
    aq23contact_name_4: TStringField;
    aq23contact_name_5: TStringField;
    aq23contact_name_6: TStringField;
    aq23cont_phone_1: TStringField;
    aq23cont_phone_2: TStringField;
    aq23cont_phone_3: TStringField;
    aq23cont_phone_4: TStringField;
    aq23cont_phone_5: TStringField;
    aq23cont_phone_6: TStringField;
    aq23email_for_contact1: TStringField;
    aq23email_for_contact2: TStringField;
    aq23email_for_contact3: TStringField;
    aq23email_for_contact4: TStringField;
    aq23email_for_contact5: TStringField;
    aq23email_for_contact6: TStringField;
    aq23payment_terms: TSmallintField;
    aq23discount: TFloatField;
    aq23discount_days: TSmallintField;
    aq23discount2: TFloatField;
    aq23discount2_days: TSmallintField;
    aq23put_all_inv_hold: TStringField;
    aq23tax_id_number: TStringField;
    aq23analysis_code1: TStringField;
    aq23analysis_code2: TStringField;
    aq23analysis_code3: TStringField;
    aq23suppier_ent_date: TDateTimeField;
    aq23gen_email_address: TStringField;
    aq23ttype: TWordField;
    aq23brother_flag: TBooleanField;
    aq23update_date: TDateTimeField;
    aq23status: TWordField;
    aq23currency_ptr: TIntegerField;
    aq23po_note_pad_ptr: TIntegerField;
    aq23debmem_note_pad_ptr: TIntegerField;
    aq23rfq_note_pad_ptr: TIntegerField;
    aq23common_pad_ptr: TIntegerField;
    aq23country_ptr: TIntegerField;
    aq23acc_payable_ptr: TIntegerField;
    aq23user_ptr: TIntegerField;
    aq24RKEY: TAutoIncField;
    aq24SUPPLIER_PTR: TIntegerField;
    aq24FACTORY_LOCATION: TStringField;
    aq24FACTORY_ADDRESS_1: TStringField;
    aq24STATE: TStringField;
    aq24ZIP: TStringField;
    aq24CONTACT: TStringField;
    aq24PHONE: TStringField;
    aq24FAX: TStringField;
    aq24FOB: TStringField;
    aq24CITY_TAX_PTR: TIntegerField;
    aq24SHIPPING_METHOD: TStringField;
    aq24SHIPPING_LEAD_TIME: TSmallintField;
    aq24STATE_SHIP_TAX_FLAG: TStringField;
    aq24STATE_MISC_TAX_FLAG: TStringField;
    aq24STATE_INVT_TAX_FLAG: TStringField;
    aq24LANGUAGE_FLAG: TStringField;
    aq24COUNTRY_PTR: TIntegerField;
    aq24EMAIL_FOR_CONTACT: TStringField;
    aq04: TADOQuery;
    aq04seed_flag: TWordField;
    aq04seed_value: TStringField;
    ads23rkey: TAutoIncField;
    ads23code: TStringField;
    ads23supplier_name: TStringField;
    ads23abbr_name: TStringField;
    ads23status: TStringField;
    ads23brother_flag: TStringField;
    ads23ttype: TStringField;
    ads23suppier_ent_date: TDateTimeField;
    ads23contact_name_1: TStringField;
    ads23cont_phone_1: TStringField;
    ads23phone: TStringField;
    ads23fax: TStringField;
    ads23telex: TStringField;
    ads23curr_name: TStringField;
    ads23country_name: TStringField;
    ads23employee_name: TStringField;
    ads23update_date: TDateTimeField;
    ads23billing_address_1: TStringField;
    ads23po_note_pad_ptr: TIntegerField;
    ads23debmem_note_pad_ptr: TIntegerField;
    ads23rfq_note_pad_ptr: TIntegerField;
    ads23common_pad_ptr: TIntegerField;
    aq23LANGUAGE_FLAG: TStringField;
    ads23tax_id_number: TStringField;
    aq23edi_out_new_po: TWordField;
    ads23analysis_code1: TStringField;
    aq23developer: TWideStringField;
    aq23invalid_explain: TWideStringField;
    ads23developer: TWideStringField;
    ads23invalid_explain: TWideStringField;
    aq23EDI_ID: TStringField;
    aq23ADDRESS2_FOR_FORM: TStringField;
    aq23ADDRESS1_FOR_FORM: TStringField;
    ads23ADDRESS2_FOR_FORM: TStringField;
    ads23ADDRESS1_FOR_FORM: TStringField;
    ads23EDI_OUT_NEW_PO: TWordField;
    aq23EDI_FLAG_FOR_PO: TSmallintField;
    ads23EDI_FLAG_FOR_PO: TSmallintField;
    aq23TAX_2: TFloatField;
    ads23VMI: TStringField;
    aq23TAX_1: TFloatField;
    ads23Remark: TMemoField;
    ads23RemarkSpec: TMemoField;
    aq23Remark: TMemoField;
    aq23RemarkSpec: TMemoField;
    ads23flag: TWordField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{$R *.dfm}

end.
