object dm: Tdm
  OldCreateOrder = False
  Left = 536
  Top = 190
  Height = 357
  Width = 427
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 16
  end
  object ds23: TDataSource
    DataSet = ads23
    Left = 56
    Top = 72
  end
  object ads23: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select d23.rkey,d23.code,d23.supplier_name,d23.abbr_name,ADDRESS' +
      '2_FOR_FORM,'#13#10'case d23.status when 0 then '#39#26377#25928#39' when 1 then '#39#26080#25928#39' e' +
      'nd as status,ADDRESS1_FOR_FORM,'#13#10'case d23.brother_flag when 0 th' +
      'en '#39#21542#39' when 1 then '#39#26159#39' end as brother_flag,'#13#10'case d23.ttype when' +
      ' 0 then '#39#26448#26009#20379#24212#21830#39' when 1 then '#39#22806#21457#20379#24212#21830#39' when 2 then '#39#22806#21457#20860#26448#26009#39' end as t' +
      'type,'#13#10'case d23.EDI_OUT_NEW_PO when 0 then '#39#21542#39' when 1 then '#39#26159#39' e' +
      'nd as VMI,'#13#10'd23.suppier_ent_date,d23.contact_name_1 ,d23.cont_ph' +
      'one_1,d23.phone,d23.fax,d23.telex,'#13#10'd01.curr_name,d250.country_n' +
      'ame,d05.employee_name,d23.update_date,'#13#10'd23.billing_address_1,d2' +
      '3.tax_id_number,d23.developer,d23.invalid_explain,'#13#10'd23.po_note_' +
      'pad_ptr,d23.debmem_note_pad_ptr,d23.rfq_note_pad_ptr,d23.common_' +
      'pad_ptr,'#13#10'd23.analysis_code1,d23.EDI_OUT_NEW_PO,d23.EDI_FLAG_FOR' +
      '_PO, Remark, RemarkSpec,d23.flag'#13#10'from Data0023 d23 inner join d' +
      'ata0001 d01 on d23.currency_ptr=d01.rkey'#13#10'left join data0250 d25' +
      '0 on d23.country_ptr=d250.country_rkey'#13#10'left join data0005 d05 o' +
      'n d23.user_ptr=d05.rkey '#13#10'where (1=1)'#13#10
    IndexFieldNames = 'code'
    Parameters = <>
    Left = 16
    Top = 72
    object ads23rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ads23code: TStringField
      FieldName = 'code'
      Size = 10
    end
    object ads23supplier_name: TStringField
      FieldName = 'supplier_name'
      Size = 100
    end
    object ads23abbr_name: TStringField
      FieldName = 'abbr_name'
    end
    object ads23status: TStringField
      FieldName = 'status'
      ReadOnly = True
      Size = 4
    end
    object ads23brother_flag: TStringField
      FieldName = 'brother_flag'
      ReadOnly = True
      Size = 2
    end
    object ads23ttype: TStringField
      FieldName = 'ttype'
      ReadOnly = True
      Size = 10
    end
    object ads23suppier_ent_date: TDateTimeField
      FieldName = 'suppier_ent_date'
    end
    object ads23contact_name_1: TStringField
      FieldName = 'contact_name_1'
    end
    object ads23cont_phone_1: TStringField
      FieldName = 'cont_phone_1'
      FixedChar = True
      Size = 14
    end
    object ads23phone: TStringField
      FieldName = 'phone'
    end
    object ads23fax: TStringField
      FieldName = 'fax'
    end
    object ads23telex: TStringField
      FieldName = 'telex'
      Size = 40
    end
    object ads23curr_name: TStringField
      FieldName = 'curr_name'
    end
    object ads23country_name: TStringField
      FieldName = 'country_name'
      Size = 30
    end
    object ads23employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object ads23update_date: TDateTimeField
      FieldName = 'update_date'
    end
    object ads23billing_address_1: TStringField
      FieldName = 'billing_address_1'
      Size = 100
    end
    object ads23po_note_pad_ptr: TIntegerField
      FieldName = 'po_note_pad_ptr'
    end
    object ads23debmem_note_pad_ptr: TIntegerField
      FieldName = 'debmem_note_pad_ptr'
    end
    object ads23rfq_note_pad_ptr: TIntegerField
      FieldName = 'rfq_note_pad_ptr'
    end
    object ads23common_pad_ptr: TIntegerField
      FieldName = 'common_pad_ptr'
    end
    object ads23tax_id_number: TStringField
      DisplayLabel = #20184#27454#26041#24335
      FieldName = 'tax_id_number'
    end
    object ads23analysis_code1: TStringField
      DisplayLabel = #31080#25454#31181#31867
      FieldName = 'analysis_code1'
    end
    object ads23invalid_explain: TWideStringField
      FieldName = 'invalid_explain'
      Size = 50
    end
    object ads23ADDRESS2_FOR_FORM: TStringField
      DisplayLabel = #20379#24212#21830#24615#36136
      DisplayWidth = 20
      FieldName = 'ADDRESS2_FOR_FORM'
      Size = 30
    end
    object ads23ADDRESS1_FOR_FORM: TStringField
      DisplayLabel = #20379#24212#29289#26009
      DisplayWidth = 20
      FieldName = 'ADDRESS1_FOR_FORM'
      Size = 70
    end
    object ads23EDI_OUT_NEW_PO: TWordField
      FieldName = 'EDI_OUT_NEW_PO'
    end
    object ads23EDI_FLAG_FOR_PO: TSmallintField
      FieldName = 'EDI_FLAG_FOR_PO'
    end
    object ads23VMI: TStringField
      FieldName = 'VMI'
      ReadOnly = True
      Size = 11
    end
    object ads23Remark: TMemoField
      FieldName = 'Remark'
      BlobType = ftMemo
    end
    object ads23RemarkSpec: TMemoField
      FieldName = 'RemarkSpec'
      BlobType = ftMemo
    end
    object ads23flag: TWordField
      FieldName = 'flag'
    end
    object ads23developer: TWideStringField
      FieldName = 'developer'
      Size = 50
    end
  end
  object aqtmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 16
    Top = 224
  end
  object aq23: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ads23rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select rkey,code,supplier_name,abbr_name,billing_address_1,state' +
        ' ,zip,phone,fax,telex,'
      
        'contact_name_1,contact_name_2,contact_name_3,contact_name_4,cont' +
        'act_name_5,contact_name_6,'
      
        'cont_phone_1,cont_phone_2,cont_phone_3,cont_phone_4,cont_phone_5' +
        ',cont_phone_6,'
      
        'email_for_contact1,email_for_contact2,email_for_contact3,email_f' +
        'or_contact4,'
      
        'email_for_contact5,email_for_contact6,LANGUAGE_FLAG,EDI_ID,ADDRE' +
        'SS2_FOR_FORM,'
      
        'payment_terms,discount,discount_days,discount2,discount2_days,pu' +
        't_all_inv_hold,'
      
        'tax_id_number,analysis_code1,analysis_code2,analysis_code3,suppi' +
        'er_ent_date,'
      
        'gen_email_address,ttype,brother_flag,update_date,status,ADDRESS1' +
        '_FOR_FORM,TAX_2,TAX_1,'
      
        'currency_ptr,po_note_pad_ptr,debmem_note_pad_ptr,rfq_note_pad_pt' +
        'r,common_pad_ptr,'
      
        'country_ptr,acc_payable_ptr,user_ptr,edi_out_new_po,developer,in' +
        'valid_explain,'
      'EDI_FLAG_FOR_PO, Remark, RemarkSpec'
      'from Data0023 where rkey=:ads23rkey')
    Left = 16
    Top = 120
    object aq23rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object aq23code: TStringField
      FieldName = 'code'
      Size = 10
    end
    object aq23supplier_name: TStringField
      FieldName = 'supplier_name'
      Size = 100
    end
    object aq23abbr_name: TStringField
      FieldName = 'abbr_name'
      Size = 16
    end
    object aq23billing_address_1: TStringField
      FieldName = 'billing_address_1'
      Size = 100
    end
    object aq23state: TStringField
      FieldName = 'state'
      Size = 10
    end
    object aq23zip: TStringField
      FieldName = 'zip'
      Size = 10
    end
    object aq23phone: TStringField
      FieldName = 'phone'
    end
    object aq23fax: TStringField
      FieldName = 'fax'
    end
    object aq23telex: TStringField
      FieldName = 'telex'
      Size = 40
    end
    object aq23contact_name_1: TStringField
      FieldName = 'contact_name_1'
    end
    object aq23contact_name_2: TStringField
      FieldName = 'contact_name_2'
    end
    object aq23contact_name_3: TStringField
      FieldName = 'contact_name_3'
    end
    object aq23contact_name_4: TStringField
      FieldName = 'contact_name_4'
    end
    object aq23contact_name_5: TStringField
      FieldName = 'contact_name_5'
    end
    object aq23contact_name_6: TStringField
      FieldName = 'contact_name_6'
    end
    object aq23cont_phone_1: TStringField
      FieldName = 'cont_phone_1'
      FixedChar = True
      Size = 14
    end
    object aq23cont_phone_2: TStringField
      FieldName = 'cont_phone_2'
      FixedChar = True
      Size = 14
    end
    object aq23cont_phone_3: TStringField
      FieldName = 'cont_phone_3'
      FixedChar = True
      Size = 14
    end
    object aq23cont_phone_4: TStringField
      FieldName = 'cont_phone_4'
      FixedChar = True
      Size = 14
    end
    object aq23cont_phone_5: TStringField
      FieldName = 'cont_phone_5'
      FixedChar = True
      Size = 14
    end
    object aq23cont_phone_6: TStringField
      FieldName = 'cont_phone_6'
      FixedChar = True
      Size = 14
    end
    object aq23email_for_contact1: TStringField
      FieldName = 'email_for_contact1'
      FixedChar = True
      Size = 50
    end
    object aq23email_for_contact2: TStringField
      FieldName = 'email_for_contact2'
      FixedChar = True
      Size = 50
    end
    object aq23email_for_contact3: TStringField
      FieldName = 'email_for_contact3'
      FixedChar = True
      Size = 50
    end
    object aq23email_for_contact4: TStringField
      FieldName = 'email_for_contact4'
      FixedChar = True
      Size = 50
    end
    object aq23email_for_contact5: TStringField
      FieldName = 'email_for_contact5'
      FixedChar = True
      Size = 50
    end
    object aq23email_for_contact6: TStringField
      FieldName = 'email_for_contact6'
      FixedChar = True
      Size = 50
    end
    object aq23payment_terms: TSmallintField
      FieldName = 'payment_terms'
    end
    object aq23discount: TFloatField
      FieldName = 'discount'
    end
    object aq23discount_days: TSmallintField
      FieldName = 'discount_days'
    end
    object aq23discount2: TFloatField
      FieldName = 'discount2'
    end
    object aq23discount2_days: TSmallintField
      FieldName = 'discount2_days'
    end
    object aq23put_all_inv_hold: TStringField
      FieldName = 'put_all_inv_hold'
      FixedChar = True
      Size = 1
    end
    object aq23tax_id_number: TStringField
      FieldName = 'tax_id_number'
    end
    object aq23analysis_code1: TStringField
      FieldName = 'analysis_code1'
    end
    object aq23analysis_code2: TStringField
      FieldName = 'analysis_code2'
    end
    object aq23analysis_code3: TStringField
      FieldName = 'analysis_code3'
    end
    object aq23suppier_ent_date: TDateTimeField
      FieldName = 'suppier_ent_date'
    end
    object aq23gen_email_address: TStringField
      FieldName = 'gen_email_address'
      FixedChar = True
      Size = 30
    end
    object aq23ttype: TWordField
      FieldName = 'ttype'
    end
    object aq23brother_flag: TBooleanField
      FieldName = 'brother_flag'
    end
    object aq23update_date: TDateTimeField
      FieldName = 'update_date'
    end
    object aq23status: TWordField
      FieldName = 'status'
    end
    object aq23currency_ptr: TIntegerField
      FieldName = 'currency_ptr'
    end
    object aq23po_note_pad_ptr: TIntegerField
      FieldName = 'po_note_pad_ptr'
    end
    object aq23debmem_note_pad_ptr: TIntegerField
      FieldName = 'debmem_note_pad_ptr'
    end
    object aq23rfq_note_pad_ptr: TIntegerField
      FieldName = 'rfq_note_pad_ptr'
    end
    object aq23common_pad_ptr: TIntegerField
      FieldName = 'common_pad_ptr'
    end
    object aq23country_ptr: TIntegerField
      FieldName = 'country_ptr'
    end
    object aq23user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object aq23LANGUAGE_FLAG: TStringField
      FieldName = 'LANGUAGE_FLAG'
      FixedChar = True
      Size = 1
    end
    object aq23edi_out_new_po: TWordField
      FieldName = 'edi_out_new_po'
    end
    object aq23acc_payable_ptr: TIntegerField
      FieldName = 'acc_payable_ptr'
    end
    object aq23developer: TWideStringField
      FieldName = 'developer'
      Size = 50
    end
    object aq23invalid_explain: TWideStringField
      FieldName = 'invalid_explain'
      Size = 50
    end
    object aq23EDI_ID: TStringField
      FieldName = 'EDI_ID'
      FixedChar = True
      Size = 50
    end
    object aq23ADDRESS2_FOR_FORM: TStringField
      DisplayLabel = #20379#24212#21830#24615#36136
      FieldName = 'ADDRESS2_FOR_FORM'
      Size = 30
    end
    object aq23ADDRESS1_FOR_FORM: TStringField
      DisplayLabel = #20379#24212#29289#26009
      FieldName = 'ADDRESS1_FOR_FORM'
      Size = 70
    end
    object aq23EDI_FLAG_FOR_PO: TSmallintField
      FieldName = 'EDI_FLAG_FOR_PO'
    end
    object aq23TAX_2: TFloatField
      DisplayLabel = #22996#22806#21152#24037#20837#24211#25104#26412#25240#29575
      FieldName = 'TAX_2'
    end
    object aq23Remark: TMemoField
      FieldName = 'Remark'
      BlobType = ftMemo
    end
    object aq23RemarkSpec: TMemoField
      FieldName = 'RemarkSpec'
      BlobType = ftMemo
    end
    object aq23TAX_1: TFloatField
      DisplayLabel = #20379#24212#21830#35780#20998
      FieldName = 'TAX_1'
    end
  end
  object dsq23: TDataSource
    DataSet = aq23
    Left = 56
    Top = 120
  end
  object aq24: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'aq23.rkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select RKEY,SUPPLIER_PTR,FACTORY_LOCATION,FACTORY_ADDRESS_1,STAT' +
        'E,ZIP,CONTACT,'
      
        'PHONE,FAX,FOB,CITY_TAX_PTR,SHIPPING_METHOD,SHIPPING_LEAD_TIME,ST' +
        'ATE_SHIP_TAX_FLAG,'
      
        'STATE_MISC_TAX_FLAG,STATE_INVT_TAX_FLAG,LANGUAGE_FLAG,COUNTRY_PT' +
        'R,EMAIL_FOR_CONTACT'
      'from data0024 where supplier_ptr=:aq23.rkey')
    Left = 16
    Top = 168
    object aq24RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aq24SUPPLIER_PTR: TIntegerField
      FieldName = 'SUPPLIER_PTR'
    end
    object aq24FACTORY_LOCATION: TStringField
      FieldName = 'FACTORY_LOCATION'
    end
    object aq24FACTORY_ADDRESS_1: TStringField
      FieldName = 'FACTORY_ADDRESS_1'
      Size = 100
    end
    object aq24STATE: TStringField
      FieldName = 'STATE'
      Size = 10
    end
    object aq24ZIP: TStringField
      FieldName = 'ZIP'
      FixedChar = True
      Size = 10
    end
    object aq24CONTACT: TStringField
      FieldName = 'CONTACT'
    end
    object aq24PHONE: TStringField
      FieldName = 'PHONE'
      FixedChar = True
      Size = 14
    end
    object aq24FAX: TStringField
      FieldName = 'FAX'
      FixedChar = True
      Size = 14
    end
    object aq24FOB: TStringField
      FieldName = 'FOB'
    end
    object aq24CITY_TAX_PTR: TIntegerField
      FieldName = 'CITY_TAX_PTR'
    end
    object aq24SHIPPING_METHOD: TStringField
      FieldName = 'SHIPPING_METHOD'
    end
    object aq24SHIPPING_LEAD_TIME: TSmallintField
      FieldName = 'SHIPPING_LEAD_TIME'
    end
    object aq24STATE_SHIP_TAX_FLAG: TStringField
      FieldName = 'STATE_SHIP_TAX_FLAG'
      FixedChar = True
      Size = 1
    end
    object aq24STATE_MISC_TAX_FLAG: TStringField
      FieldName = 'STATE_MISC_TAX_FLAG'
      FixedChar = True
      Size = 1
    end
    object aq24STATE_INVT_TAX_FLAG: TStringField
      FieldName = 'STATE_INVT_TAX_FLAG'
      FixedChar = True
      Size = 1
    end
    object aq24LANGUAGE_FLAG: TStringField
      FieldName = 'LANGUAGE_FLAG'
      FixedChar = True
      Size = 1
    end
    object aq24COUNTRY_PTR: TIntegerField
      FieldName = 'COUNTRY_PTR'
    end
    object aq24EMAIL_FOR_CONTACT: TStringField
      FieldName = 'EMAIL_FOR_CONTACT'
      FixedChar = True
      Size = 50
    end
  end
  object dsq24: TDataSource
    DataSet = aq24
    Left = 56
    Top = 168
  end
  object aq04: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select seed_flag,seed_value from data0004 where rkey=21')
    Left = 56
    Top = 224
    object aq04seed_flag: TWordField
      FieldName = 'seed_flag'
    end
    object aq04seed_value: TStringField
      FieldName = 'seed_value'
    end
  end
end
