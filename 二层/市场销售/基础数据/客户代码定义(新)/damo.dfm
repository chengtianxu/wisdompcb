object dm: Tdm
  OldCreateOrder = True
  Left = 474
  Top = 286
  Height = 404
  Width = 364
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=wisdompcb1077;Persist Security Info' +
      '=True;User ID=sa;Initial Catalog=demo2;Data Source=192.168.8.37'
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 8
  end
  object ds10: TDataSource
    DataSet = ads10
    Left = 48
    Top = 64
  end
  object aqtmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 8
    Top = 208
  end
  object ads10: TADODataSet
    AutoCalcFields = False
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT D10.rkey,D10.cust_code,D10.customer_name,D10.abbr_name,D0' +
      '5.EMPLOYEE_NAME as sales_rep_name,'#13#10'CASE D10.customer_type WHEN ' +
      '1 THEN '#39#27491#24120#39' WHEN 2 THEN '#39#26032#21512#20316#39' WHEN 3 THEN '#39#25511#21046#39' WHEN 4 THEN '#39#20572#27490#39' ' +
      'END AS status,'#13#10'CASE D10.edi_in_logging WHEN 1 THEN '#39'Y'#39' WHEN 0 T' +
      'HEN '#39'N'#39' END AS edi_in_logging,D10.outgoing_form_addr1,'#13#10'CASE D10' +
      '.credit_rating WHEN 1 THEN '#39#20248#39' WHEN 2 THEN '#39#33391#39' WHEN 3 THEN '#39#24046#39' E' +
      'ND AS credit_rating,'#13#10'D10.house_fixed,D10.cust_ent_date,D10.stat' +
      'e,D10.zip,D10.phone,D10.fax,D10.telex,D10.billing_address_2,D10.' +
      'BALANCE_DUE,'#13#10'D10.gen_email_address,D10.billing_address_3,D10.ed' +
      'i_id,D10.contact_name_1,D10.cont_phone_1,D10.billing_address_1, ' +
      ' --'#21518#21152#13#10'D10.billing_address_4,D10.contact_name_2,D10.contact_name' +
      '_3,D10.contact_name_4,D10.contact_name_5,D10.contact_name_6,'#13#10'D1' +
      '0.cont_phone_2,D10.cont_phone_3,D10.cont_phone_4,D10.cont_phone_' +
      '5,D10.cont_phone_6,D10.smoothing_threshold,'#13#10'D10.month_amount,D1' +
      '0.month_pcbamount,D10.DO_SMOOTHING,d10.ANALYSIS_CODE4,ANALYSIS_C' +
      'ODE5,'#13#10'CASE D10.edi_flag_for_invoice WHEN 1 THEN '#39#26159#39' WHEN 0 THEN' +
      ' '#39#21542#39' END AS edi_flag_for_invoice,'#13#10'CASE D10.edi_flag_for_soack W' +
      'HEN 1 THEN '#39#36716#21378#39' WHEN 0 THEN '#39#20869#38144#39' END AS edi_flag_for_soack,D10.f' +
      'ed_tax_id_no,D10.NET_PAY,'#13#10'D10.outgoing_form_name,D10.rep_eval,D' +
      '10.rep_credit,D10.rep_high,D10.rep_name,D10.rep_date,'#13#10'D10.mak_e' +
      'val,D10.mak_credit,D10.mak_high,D10.mak_name,D10.mak_date,D10.fi' +
      'n_eval,D10.fin_credit,D10.fin_high,'#13#10'D10.fin_name,D10.fin_date,D' +
      '10.marmang_eval,D10.marmang_credit,D10.marmang_high,D10.marmang_' +
      'name,'#13#10'D10.marmang_date,D01.curr_name,D250.country_name,D10.INVO' +
      'ICE_TYPE ,D10.INVOICE_NOTE_PAD_PTR,D10.COD_FLAG, D10.Remark, D10' +
      '.RemarkSpec'#13#10'FROM DATA0100 D100 INNER JOIN DATA0010 D10 ON D100.' +
      'customer_ptr=D10.rkey '#13#10'           INNER JOIN DATA0005 D05 on D1' +
      '0.sales_rep_ptr=D05.rkey'#13#10'           INNER JOIN DATA0001 D01 on ' +
      'D10.currency_ptr=D01.rkey'#13#10'           LEFT JOIN DATA0250 D250 on' +
      ' D10.country_ptr=D250.country_rkey'#13#10'WHERE D100.CSI_PTR=:rkey73'
    IndexFieldNames = 'cust_code'
    Parameters = <
      item
        Name = 'rkey73'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Prepared = True
    Left = 8
    Top = 64
    object ads10rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ads10cust_code: TStringField
      FieldName = 'cust_code'
      Size = 10
    end
    object ads10customer_name: TStringField
      FieldName = 'customer_name'
      Size = 100
    end
    object ads10abbr_name: TStringField
      FieldName = 'abbr_name'
      Size = 10
    end
    object ads10sales_rep_name: TStringField
      DisplayLabel = #19994#21153#21592
      FieldName = 'sales_rep_name'
    end
    object ads10status: TStringField
      DisplayWidth = 6
      FieldName = 'status'
      ReadOnly = True
      Size = 6
    end
    object ads10edi_in_logging: TStringField
      FieldName = 'edi_in_logging'
      ReadOnly = True
      Size = 1
    end
    object ads10outgoing_form_addr1: TStringField
      FieldName = 'outgoing_form_addr1'
      Size = 70
    end
    object ads10credit_rating: TStringField
      FieldName = 'credit_rating'
      ReadOnly = True
      Size = 2
    end
    object ads10house_fixed: TStringField
      FieldName = 'house_fixed'
      Size = 4
    end
    object ads10cust_ent_date: TDateTimeField
      FieldName = 'cust_ent_date'
    end
    object ads10state: TStringField
      FieldName = 'state'
      Size = 10
    end
    object ads10zip: TStringField
      FieldName = 'zip'
      FixedChar = True
      Size = 10
    end
    object ads10phone: TStringField
      FieldName = 'phone'
      FixedChar = True
    end
    object ads10telex: TStringField
      FieldName = 'telex'
      Size = 50
    end
    object ads10billing_address_2: TStringField
      FieldName = 'billing_address_2'
      Size = 50
    end
    object ads10gen_email_address: TStringField
      FieldName = 'gen_email_address'
      FixedChar = True
      Size = 50
    end
    object ads10billing_address_3: TStringField
      FieldName = 'billing_address_3'
      Size = 30
    end
    object ads10edi_id: TStringField
      FieldName = 'edi_id'
      Size = 50
    end
    object ads10contact_name_1: TStringField
      FieldName = 'contact_name_1'
      FixedChar = True
    end
    object ads10cont_phone_1: TStringField
      FieldName = 'cont_phone_1'
      FixedChar = True
      Size = 14
    end
    object ads10billing_address_1: TStringField
      FieldName = 'billing_address_1'
      Size = 100
    end
    object ads10curr_name: TStringField
      FieldName = 'curr_name'
    end
    object ads10country_name: TStringField
      FieldName = 'country_name'
      Size = 30
    end
    object ads10billing_address_4: TStringField
      FieldName = 'billing_address_4'
      Size = 100
    end
    object ads10contact_name_2: TStringField
      FieldName = 'contact_name_2'
      FixedChar = True
    end
    object ads10contact_name_3: TStringField
      FieldName = 'contact_name_3'
      FixedChar = True
    end
    object ads10contact_name_4: TStringField
      FieldName = 'contact_name_4'
      FixedChar = True
    end
    object ads10contact_name_5: TStringField
      FieldName = 'contact_name_5'
      FixedChar = True
    end
    object ads10cont_phone_2: TStringField
      FieldName = 'cont_phone_2'
      FixedChar = True
      Size = 14
    end
    object ads10cont_phone_3: TStringField
      FieldName = 'cont_phone_3'
      FixedChar = True
      Size = 14
    end
    object ads10cont_phone_4: TStringField
      FieldName = 'cont_phone_4'
      FixedChar = True
      Size = 14
    end
    object ads10cont_phone_5: TStringField
      FieldName = 'cont_phone_5'
      FixedChar = True
      Size = 14
    end
    object ads10smoothing_threshold: TIntegerField
      FieldName = 'smoothing_threshold'
    end
    object ads10month_amount: TFloatField
      FieldName = 'month_amount'
    end
    object ads10month_pcbamount: TFloatField
      FieldName = 'month_pcbamount'
    end
    object ads10fed_tax_id_no: TStringField
      DisplayLabel = #20184#27454#26041#24335
      FieldName = 'fed_tax_id_no'
      Size = 50
    end
    object ads10NET_PAY: TSmallintField
      FieldName = 'NET_PAY'
    end
    object ads10outgoing_form_name: TStringField
      FieldName = 'outgoing_form_name'
      Size = 50
    end
    object ads10rep_eval: TStringField
      FieldName = 'rep_eval'
      Size = 70
    end
    object ads10rep_credit: TFloatField
      FieldName = 'rep_credit'
    end
    object ads10rep_high: TFloatField
      FieldName = 'rep_high'
    end
    object ads10rep_name: TStringField
      FieldName = 'rep_name'
      Size = 16
    end
    object ads10rep_date: TDateTimeField
      FieldName = 'rep_date'
    end
    object ads10mak_eval: TStringField
      FieldName = 'mak_eval'
      Size = 70
    end
    object ads10mak_credit: TFloatField
      FieldName = 'mak_credit'
    end
    object ads10mak_high: TFloatField
      FieldName = 'mak_high'
    end
    object ads10mak_name: TStringField
      FieldName = 'mak_name'
      Size = 16
    end
    object ads10mak_date: TDateTimeField
      FieldName = 'mak_date'
    end
    object ads10fin_eval: TStringField
      FieldName = 'fin_eval'
      Size = 70
    end
    object ads10fin_credit: TFloatField
      FieldName = 'fin_credit'
    end
    object ads10fin_high: TFloatField
      FieldName = 'fin_high'
    end
    object ads10fin_name: TStringField
      FieldName = 'fin_name'
      Size = 16
    end
    object ads10fin_date: TDateTimeField
      FieldName = 'fin_date'
    end
    object ads10marmang_eval: TStringField
      FieldName = 'marmang_eval'
      Size = 70
    end
    object ads10marmang_credit: TFloatField
      FieldName = 'marmang_credit'
    end
    object ads10marmang_high: TFloatField
      FieldName = 'marmang_high'
    end
    object ads10marmang_name: TStringField
      FieldName = 'marmang_name'
      Size = 16
    end
    object ads10marmang_date: TDateTimeField
      FieldName = 'marmang_date'
    end
    object ads10fax: TStringField
      FieldName = 'fax'
      FixedChar = True
    end
    object ads10contact_name_6: TStringField
      FieldName = 'contact_name_6'
      FixedChar = True
    end
    object ads10cont_phone_6: TStringField
      FieldName = 'cont_phone_6'
      FixedChar = True
      Size = 14
    end
    object ads10edi_flag_for_invoice: TStringField
      DisplayLabel = #20215#26684#21547#31246
      FieldName = 'edi_flag_for_invoice'
      ReadOnly = True
      Size = 2
    end
    object ads10edi_flag_for_soack: TStringField
      FieldName = 'edi_flag_for_soack'
      ReadOnly = True
      Size = 4
    end
    object ads10DO_SMOOTHING: TWordField
      FieldName = 'DO_SMOOTHING'
    end
    object ads10INVOICE_TYPE: TStringField
      DisplayLabel = #21457#31080#31867#22411
      FieldName = 'INVOICE_TYPE'
    end
    object ads10ANALYSIS_CODE4: TStringField
      DisplayLabel = #24320#21457#21592
      FieldName = 'ANALYSIS_CODE4'
    end
    object ads10ANALYSIS_CODE5: TStringField
      DisplayLabel = #36319#21333#21592
      FieldName = 'ANALYSIS_CODE5'
    end
    object ads10BALANCE_DUE: TFloatField
      FieldName = 'BALANCE_DUE'
    end
    object ads10INVOICE_NOTE_PAD_PTR: TIntegerField
      FieldName = 'INVOICE_NOTE_PAD_PTR'
    end
    object ads10COD_FLAG: TStringField
      FieldName = 'COD_FLAG'
      FixedChar = True
      Size = 1
    end
    object ads10Remark: TMemoField
      FieldName = 'Remark'
      BlobType = ftMemo
    end
    object ads10RemarkSpec: TMemoField
      FieldName = 'RemarkSpec'
      BlobType = ftMemo
    end
  end
  object aq04: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select seed_flag,seed_value from data0004 where rkey=8')
    Left = 48
    Top = 208
    object aq04seed_flag: TWordField
      FieldName = 'seed_flag'
    end
    object aq04seed_value: TStringField
      FieldName = 'seed_value'
    end
  end
  object aq10: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ads10rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select RKEY,CUST_CODE,CUSTOMER_NAME,ABBR_NAME,BILLING_ADDRESS_1,'
      'BILLING_ADDRESS_2,BILLING_ADDRESS_3,STATE,ZIP,PHONE,FAX,TELEX,'
      'SALES_REP_PTR,CURRENCY_PTR,INVOICE_NOTE_PAD_PTR,CONTACT_NAME_1,'
      'CONTACT_NAME_2,CONTACT_NAME_3,CONTACT_NAME_4,CONTACT_NAME_5,'
      
        'CONTACT_NAME_6,CONT_PHONE_1,CONT_PHONE_2,CONT_PHONE_3,CONT_PHONE' +
        '_4,'
      'CONT_PHONE_5,CONT_PHONE_6,FED_TAX_ID_NO,COD_FLAG,DISCOUNT_PCT,'
      
        'CREDIT_LIMIT,CREDIT_RATING,DISCOUNT_DAYS,NET_PAY,LAST_ACTIVE_DAT' +
        'E,'
      
        'BILLING_ADDRESS_4,COUNTRY_PTR,OUTGOING_FORM_NAME,OUTGOING_FORM_A' +
        'DDR1,'
      
        'OUTGOING_FORM_ADDR2,OUTGOING_FORM_ADDR3,ANALYSIS_CODE1,ANALYSIS_' +
        'CODE2,'
      
        'ANALYSIS_CODE3,CUST_ENT_DATE,EDI_ID,EDI_FLAG_FOR_SOACK,LANGUAGE_' +
        'FLAG,'
      'EDI_FLAG_FOR_INVOICE,EDI_FLAG_CREDIT_MEMO,GEN_EMAIL_ADDRESS,'
      
        'EMAIL_FOR_CONTACT1,EMAIL_FOR_CONTACT2,EMAIL_FOR_CONTACT3,REG_TAX' +
        '_FIXED_UNUSED,'
      
        'EMAIL_FOR_CONTACT4,EMAIL_FOR_CONTACT5,EMAIL_FOR_CONTACT6,ACC_REC' +
        '_PTR,'
      
        'DAYS_EARLY_SCHEDULE,CUSTOMER_TYPE,DO_SMOOTHING,SMOOTHING_THRESHO' +
        'LD,ANALYSIS_CODE4,'
      
        'ANALYSIS_CODE5,EDI_IN_LOGGING,quote_factor,QUOTE_FACTOR1,quote_f' +
        'lag ,'
      
        'REP_EVAL,MAK_EVAL,FIN_EVAL,COFC_FILENAME,HIGH_BALANCE,BALANCE_DU' +
        'E,'
      
        'MARMANG_EVAL,REP_CREDIT,MAK_CREDIT,FIN_CREDIT,MARMANG_CREDIT,REP' +
        '_HIGH,'
      
        'MAK_HIGH,FIN_HIGH,MARMANG_HIGH,REP_NAME,MAK_NAME,FIN_NAME,MARMAN' +
        'G_NAME,'
      
        'REP_DATE,MAK_DATE,FIN_DATE,MARMANG_DATE,HOUSE_FIXED,FIXED_SCOPE,' +
        'CONSUME_FORECASTS,'
      
        'SALES_DISCOUNT,MONTH_AMOUNT,MONTH_PCBAMOUNT,CAPITAL , APPLY_IN_T' +
        'RANSIT ,'
      ' INVOICE_TYPE, Remark, RemarkSpec,LAST_UPDT'
      'from Data0010'
      'where rkey= :ads10rkey')
    Left = 8
    Top = 112
    object aq10RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aq10CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object aq10CUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object aq10ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object aq10BILLING_ADDRESS_1: TStringField
      FieldName = 'BILLING_ADDRESS_1'
      Size = 100
    end
    object aq10BILLING_ADDRESS_2: TStringField
      FieldName = 'BILLING_ADDRESS_2'
      Size = 50
    end
    object aq10BILLING_ADDRESS_3: TStringField
      FieldName = 'BILLING_ADDRESS_3'
      Size = 30
    end
    object aq10STATE: TStringField
      FieldName = 'STATE'
      Size = 10
    end
    object aq10ZIP: TStringField
      FieldName = 'ZIP'
      FixedChar = True
      Size = 10
    end
    object aq10PHONE: TStringField
      FieldName = 'PHONE'
      FixedChar = True
    end
    object aq10FAX: TStringField
      FieldName = 'FAX'
      FixedChar = True
    end
    object aq10TELEX: TStringField
      FieldName = 'TELEX'
      Size = 50
    end
    object aq10SALES_REP_PTR: TIntegerField
      FieldName = 'SALES_REP_PTR'
    end
    object aq10CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object aq10INVOICE_NOTE_PAD_PTR: TIntegerField
      FieldName = 'INVOICE_NOTE_PAD_PTR'
    end
    object aq10CONTACT_NAME_1: TStringField
      FieldName = 'CONTACT_NAME_1'
      FixedChar = True
    end
    object aq10CONTACT_NAME_2: TStringField
      FieldName = 'CONTACT_NAME_2'
      FixedChar = True
    end
    object aq10CONTACT_NAME_3: TStringField
      FieldName = 'CONTACT_NAME_3'
      FixedChar = True
    end
    object aq10CONTACT_NAME_4: TStringField
      FieldName = 'CONTACT_NAME_4'
      FixedChar = True
    end
    object aq10CONTACT_NAME_5: TStringField
      FieldName = 'CONTACT_NAME_5'
      FixedChar = True
    end
    object aq10CONTACT_NAME_6: TStringField
      FieldName = 'CONTACT_NAME_6'
      FixedChar = True
    end
    object aq10CONT_PHONE_1: TStringField
      FieldName = 'CONT_PHONE_1'
      FixedChar = True
      Size = 14
    end
    object aq10CONT_PHONE_2: TStringField
      FieldName = 'CONT_PHONE_2'
      FixedChar = True
      Size = 14
    end
    object aq10CONT_PHONE_3: TStringField
      FieldName = 'CONT_PHONE_3'
      FixedChar = True
      Size = 14
    end
    object aq10CONT_PHONE_4: TStringField
      FieldName = 'CONT_PHONE_4'
      FixedChar = True
      Size = 14
    end
    object aq10CONT_PHONE_5: TStringField
      FieldName = 'CONT_PHONE_5'
      FixedChar = True
      Size = 14
    end
    object aq10CONT_PHONE_6: TStringField
      FieldName = 'CONT_PHONE_6'
      FixedChar = True
      Size = 14
    end
    object aq10FED_TAX_ID_NO: TStringField
      FieldName = 'FED_TAX_ID_NO'
      Size = 50
    end
    object aq10COD_FLAG: TStringField
      DisplayLabel = #27454#21040#21457#36135#26631#35782'(Y,N)'
      FieldName = 'COD_FLAG'
      FixedChar = True
      Size = 1
    end
    object aq10REG_TAX_FIXED_UNUSED: TStringField
      FieldName = 'REG_TAX_FIXED_UNUSED'
      FixedChar = True
      Size = 1
    end
    object aq10DISCOUNT_PCT: TBCDField
      FieldName = 'DISCOUNT_PCT'
      Precision = 4
      Size = 2
    end
    object aq10CREDIT_LIMIT: TFloatField
      FieldName = 'CREDIT_LIMIT'
    end
    object aq10CREDIT_RATING: TWordField
      FieldName = 'CREDIT_RATING'
    end
    object aq10DISCOUNT_DAYS: TSmallintField
      FieldName = 'DISCOUNT_DAYS'
    end
    object aq10NET_PAY: TSmallintField
      FieldName = 'NET_PAY'
    end
    object aq10LAST_ACTIVE_DATE: TDateTimeField
      FieldName = 'LAST_ACTIVE_DATE'
    end
    object aq10BILLING_ADDRESS_4: TStringField
      FieldName = 'BILLING_ADDRESS_4'
      Size = 100
    end
    object aq10COUNTRY_PTR: TIntegerField
      FieldName = 'COUNTRY_PTR'
    end
    object aq10OUTGOING_FORM_NAME: TStringField
      FieldName = 'OUTGOING_FORM_NAME'
      Size = 50
    end
    object aq10OUTGOING_FORM_ADDR1: TStringField
      FieldName = 'OUTGOING_FORM_ADDR1'
      Size = 70
    end
    object aq10OUTGOING_FORM_ADDR2: TStringField
      FieldName = 'OUTGOING_FORM_ADDR2'
      Size = 45
    end
    object aq10OUTGOING_FORM_ADDR3: TStringField
      FieldName = 'OUTGOING_FORM_ADDR3'
      Size = 45
    end
    object aq10ANALYSIS_CODE1: TStringField
      FieldName = 'ANALYSIS_CODE1'
    end
    object aq10ANALYSIS_CODE2: TStringField
      FieldName = 'ANALYSIS_CODE2'
    end
    object aq10ANALYSIS_CODE3: TStringField
      FieldName = 'ANALYSIS_CODE3'
    end
    object aq10CUST_ENT_DATE: TDateTimeField
      FieldName = 'CUST_ENT_DATE'
    end
    object aq10EDI_ID: TStringField
      FieldName = 'EDI_ID'
      Size = 50
    end
    object aq10EDI_FLAG_FOR_SOACK: TSmallintField
      FieldName = 'EDI_FLAG_FOR_SOACK'
    end
    object aq10EDI_FLAG_FOR_INVOICE: TSmallintField
      FieldName = 'EDI_FLAG_FOR_INVOICE'
    end
    object aq10EDI_FLAG_CREDIT_MEMO: TSmallintField
      FieldName = 'EDI_FLAG_CREDIT_MEMO'
    end
    object aq10GEN_EMAIL_ADDRESS: TStringField
      FieldName = 'GEN_EMAIL_ADDRESS'
      FixedChar = True
      Size = 50
    end
    object aq10EMAIL_FOR_CONTACT1: TStringField
      FieldName = 'EMAIL_FOR_CONTACT1'
      FixedChar = True
      Size = 50
    end
    object aq10EMAIL_FOR_CONTACT2: TStringField
      FieldName = 'EMAIL_FOR_CONTACT2'
      FixedChar = True
      Size = 50
    end
    object aq10EMAIL_FOR_CONTACT3: TStringField
      FieldName = 'EMAIL_FOR_CONTACT3'
      FixedChar = True
      Size = 50
    end
    object aq10EMAIL_FOR_CONTACT4: TStringField
      FieldName = 'EMAIL_FOR_CONTACT4'
      FixedChar = True
      Size = 50
    end
    object aq10EMAIL_FOR_CONTACT5: TStringField
      FieldName = 'EMAIL_FOR_CONTACT5'
      FixedChar = True
      Size = 50
    end
    object aq10EMAIL_FOR_CONTACT6: TStringField
      FieldName = 'EMAIL_FOR_CONTACT6'
      FixedChar = True
      Size = 50
    end
    object aq10ACC_REC_PTR: TIntegerField
      FieldName = 'ACC_REC_PTR'
    end
    object aq10DAYS_EARLY_SCHEDULE: TIntegerField
      FieldName = 'DAYS_EARLY_SCHEDULE'
    end
    object aq10CUSTOMER_TYPE: TIntegerField
      FieldName = 'CUSTOMER_TYPE'
    end
    object aq10DO_SMOOTHING: TWordField
      FieldName = 'DO_SMOOTHING'
    end
    object aq10SMOOTHING_THRESHOLD: TIntegerField
      FieldName = 'SMOOTHING_THRESHOLD'
    end
    object aq10ANALYSIS_CODE4: TStringField
      FieldName = 'ANALYSIS_CODE4'
    end
    object aq10ANALYSIS_CODE5: TStringField
      FieldName = 'ANALYSIS_CODE5'
    end
    object aq10EDI_IN_LOGGING: TWordField
      FieldName = 'EDI_IN_LOGGING'
    end
    object aq10quote_factor: TFloatField
      FieldName = 'quote_factor'
    end
    object aq10REP_EVAL: TStringField
      FieldName = 'REP_EVAL'
      Size = 70
    end
    object aq10MAK_EVAL: TStringField
      FieldName = 'MAK_EVAL'
      Size = 70
    end
    object aq10FIN_EVAL: TStringField
      FieldName = 'FIN_EVAL'
      Size = 70
    end
    object aq10MARMANG_EVAL: TStringField
      FieldName = 'MARMANG_EVAL'
      Size = 70
    end
    object aq10REP_CREDIT: TFloatField
      FieldName = 'REP_CREDIT'
    end
    object aq10MAK_CREDIT: TFloatField
      FieldName = 'MAK_CREDIT'
    end
    object aq10FIN_CREDIT: TFloatField
      FieldName = 'FIN_CREDIT'
    end
    object aq10MARMANG_CREDIT: TFloatField
      FieldName = 'MARMANG_CREDIT'
    end
    object aq10REP_HIGH: TFloatField
      FieldName = 'REP_HIGH'
    end
    object aq10MAK_HIGH: TFloatField
      FieldName = 'MAK_HIGH'
    end
    object aq10FIN_HIGH: TFloatField
      FieldName = 'FIN_HIGH'
    end
    object aq10MARMANG_HIGH: TFloatField
      FieldName = 'MARMANG_HIGH'
    end
    object aq10REP_NAME: TStringField
      FieldName = 'REP_NAME'
      Size = 16
    end
    object aq10MAK_NAME: TStringField
      FieldName = 'MAK_NAME'
      Size = 16
    end
    object aq10FIN_NAME: TStringField
      FieldName = 'FIN_NAME'
      Size = 16
    end
    object aq10MARMANG_NAME: TStringField
      FieldName = 'MARMANG_NAME'
      Size = 16
    end
    object aq10REP_DATE: TDateTimeField
      FieldName = 'REP_DATE'
      EditMask = '!0000-!90-!90;1;_'
    end
    object aq10MAK_DATE: TDateTimeField
      FieldName = 'MAK_DATE'
      EditMask = '!0000-!90-!90;1;_'
    end
    object aq10FIN_DATE: TDateTimeField
      FieldName = 'FIN_DATE'
      EditMask = '!0000-!90-!90;1;_'
    end
    object aq10MARMANG_DATE: TDateTimeField
      FieldName = 'MARMANG_DATE'
      EditMask = '!0000-!90-!90;1;_'
    end
    object aq10HOUSE_FIXED: TStringField
      FieldName = 'HOUSE_FIXED'
      Size = 4
    end
    object aq10FIXED_SCOPE: TStringField
      FieldName = 'FIXED_SCOPE'
      Size = 30
    end
    object aq10SALES_DISCOUNT: TBCDField
      FieldName = 'SALES_DISCOUNT'
      Precision = 4
      Size = 2
    end
    object aq10MONTH_AMOUNT: TFloatField
      FieldName = 'MONTH_AMOUNT'
    end
    object aq10MONTH_PCBAMOUNT: TFloatField
      FieldName = 'MONTH_PCBAMOUNT'
    end
    object aq10APPLY_IN_TRANSIT: TWordField
      DisplayLabel = #35013#31665#21333#26684#24335
      FieldName = 'APPLY_IN_TRANSIT'
    end
    object aq10CAPITAL: TFloatField
      FieldName = 'CAPITAL'
    end
    object aq10LANGUAGE_FLAG: TStringField
      DisplayLabel = #22791#20221#25968#25454'Y,N'
      FieldName = 'LANGUAGE_FLAG'
      FixedChar = True
      Size = 1
    end
    object aq10CONSUME_FORECASTS: TWordField
      FieldName = 'CONSUME_FORECASTS'
    end
    object aq10COFC_FILENAME: TStringField
      FieldName = 'COFC_FILENAME'
      FixedChar = True
      Size = 1
    end
    object aq10QUOTE_FACTOR1: TFloatField
      DisplayLabel = #27454#21040#21457#36135#36830#32493#19979#21333
      FieldName = 'QUOTE_FACTOR1'
    end
    object aq10INVOICE_TYPE: TStringField
      DisplayLabel = #21457#31080#31867#22411
      FieldName = 'INVOICE_TYPE'
    end
    object aq10HIGH_BALANCE: TFloatField
      DisplayLabel = #30003#35831#20445#38505#37329#39069
      FieldName = 'HIGH_BALANCE'
    end
    object aq10BALANCE_DUE: TFloatField
      DisplayLabel = #25209#20934#20445#38505#37329#39069
      FieldName = 'BALANCE_DUE'
    end
    object aq10quote_flag: TBooleanField
      FieldName = 'quote_flag'
    end
    object aq10Remark: TMemoField
      FieldName = 'Remark'
      BlobType = ftMemo
    end
    object aq10RemarkSpec: TMemoField
      FieldName = 'RemarkSpec'
      BlobType = ftMemo
    end
    object aq10LAST_UPDT: TDateTimeField
      FieldName = 'LAST_UPDT'
    end
  end
  object dsq10: TDataSource
    DataSet = aq10
    Left = 48
    Top = 112
  end
  object aq12: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'cust_ptr'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select RKEY,CUSTOMER_PTR,LOCATION,SHIP_TO_ADDRESS_1,SHIP_TO_ADDR' +
        'ESS_2,'
      
        'SHIP_TO_ADDRESS_3,STATE,ZIP,SHIP_TO_CONTACT,SHIP_TO_PHONE,SHIP_T' +
        'O_FAX,'
      
        'SREP_PTR_1,SREP_PTR_2,SREP_PTR_3,SREP_PTR_4,SREP_PTR_5,SREP_1_CO' +
        'MM,'
      'SREP_2_COMM,SREP_3_COMM,SREP_4_COMM,SREP_5_COMM,SREP_1_ALLOC,'
      
        'SREP_2_ALLOC,SREP_3_ALLOC,SREP_4_ALLOC,SREP_5_ALLOC,SHIP_CTAX_PT' +
        'R,'
      
        'SHIP_SHIPPING_METHOD,SHIP_LEAD_TIME,SHIP_REG_TAX_ID,STATE_SHIP_T' +
        'AX_FLAG,'
      
        'STATE_PROD_TAX_FLAG,STATE_TOOL_TAX_FLAG,LANGUAGE_FLAG,COUNTRY_PT' +
        'R,'
      'LOCNAME_FOR_FORM,SHP_ADDR1_FOR_FORM,SHP_ADDR2_FOR_FORM,'
      'SHP_ADDR3_FOR_FORM,SHP_ANALYSIS_CODE1,SHP_ANALYSIS_CODE2,'
      
        'SHP_ANALYSIS_CODE3,EMAIL_FOR_CONTACT,S4_BARCODE_LABLE,S3_BARCODE' +
        '_LABLE,'
      
        'PACKGE_BARCODE_LABLE,MISC_BARCODE_LABLE,COFC_FORMAT_FILENAME,EXP' +
        'IRED_DATE,'
      'overship_flag'
      'from Data0012 '
      'where customer_ptr=:cust_ptr')
    Left = 8
    Top = 160
    object aq12RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aq12CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object aq12LOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 80
    end
    object aq12SHIP_TO_ADDRESS_1: TStringField
      FieldName = 'SHIP_TO_ADDRESS_1'
      Size = 100
    end
    object aq12SHIP_TO_ADDRESS_2: TStringField
      FieldName = 'SHIP_TO_ADDRESS_2'
      Size = 50
    end
    object aq12SHIP_TO_ADDRESS_3: TStringField
      FieldName = 'SHIP_TO_ADDRESS_3'
      Size = 30
    end
    object aq12STATE: TStringField
      FieldName = 'STATE'
      Size = 10
    end
    object aq12ZIP: TStringField
      FieldName = 'ZIP'
      Size = 10
    end
    object aq12SHIP_TO_CONTACT: TStringField
      FieldName = 'SHIP_TO_CONTACT'
    end
    object aq12SHIP_TO_PHONE: TStringField
      FieldName = 'SHIP_TO_PHONE'
    end
    object aq12SHIP_TO_FAX: TStringField
      FieldName = 'SHIP_TO_FAX'
    end
    object aq12SREP_PTR_1: TIntegerField
      FieldName = 'SREP_PTR_1'
    end
    object aq12SREP_PTR_2: TIntegerField
      FieldName = 'SREP_PTR_2'
    end
    object aq12SREP_PTR_3: TIntegerField
      FieldName = 'SREP_PTR_3'
    end
    object aq12SREP_PTR_4: TIntegerField
      FieldName = 'SREP_PTR_4'
    end
    object aq12SREP_PTR_5: TIntegerField
      FieldName = 'SREP_PTR_5'
    end
    object aq12SREP_1_COMM: TBCDField
      FieldName = 'SREP_1_COMM'
      Precision = 5
      Size = 2
    end
    object aq12SREP_2_COMM: TBCDField
      FieldName = 'SREP_2_COMM'
      Precision = 5
      Size = 2
    end
    object aq12SREP_3_COMM: TBCDField
      FieldName = 'SREP_3_COMM'
      Precision = 5
      Size = 2
    end
    object aq12SREP_4_COMM: TBCDField
      FieldName = 'SREP_4_COMM'
      Precision = 5
      Size = 2
    end
    object aq12SREP_5_COMM: TBCDField
      FieldName = 'SREP_5_COMM'
      Precision = 5
      Size = 2
    end
    object aq12SREP_1_ALLOC: TBCDField
      FieldName = 'SREP_1_ALLOC'
      Precision = 5
      Size = 2
    end
    object aq12SREP_2_ALLOC: TBCDField
      FieldName = 'SREP_2_ALLOC'
      Precision = 5
      Size = 2
    end
    object aq12SREP_3_ALLOC: TBCDField
      FieldName = 'SREP_3_ALLOC'
      Precision = 5
      Size = 2
    end
    object aq12SREP_4_ALLOC: TBCDField
      FieldName = 'SREP_4_ALLOC'
      Precision = 5
      Size = 2
    end
    object aq12SREP_5_ALLOC: TBCDField
      FieldName = 'SREP_5_ALLOC'
      Precision = 5
      Size = 2
    end
    object aq12SHIP_CTAX_PTR: TIntegerField
      FieldName = 'SHIP_CTAX_PTR'
    end
    object aq12SHIP_SHIPPING_METHOD: TStringField
      FieldName = 'SHIP_SHIPPING_METHOD'
    end
    object aq12SHIP_LEAD_TIME: TSmallintField
      FieldName = 'SHIP_LEAD_TIME'
    end
    object aq12SHIP_REG_TAX_ID: TStringField
      FieldName = 'SHIP_REG_TAX_ID'
      Size = 15
    end
    object aq12STATE_SHIP_TAX_FLAG: TStringField
      FieldName = 'STATE_SHIP_TAX_FLAG'
      FixedChar = True
      Size = 1
    end
    object aq12STATE_PROD_TAX_FLAG: TStringField
      FieldName = 'STATE_PROD_TAX_FLAG'
      FixedChar = True
      Size = 1
    end
    object aq12STATE_TOOL_TAX_FLAG: TStringField
      FieldName = 'STATE_TOOL_TAX_FLAG'
      FixedChar = True
      Size = 1
    end
    object aq12LANGUAGE_FLAG: TStringField
      FieldName = 'LANGUAGE_FLAG'
      FixedChar = True
      Size = 1
    end
    object aq12COUNTRY_PTR: TIntegerField
      FieldName = 'COUNTRY_PTR'
    end
    object aq12LOCNAME_FOR_FORM: TStringField
      FieldName = 'LOCNAME_FOR_FORM'
      Size = 100
    end
    object aq12SHP_ADDR1_FOR_FORM: TStringField
      FieldName = 'SHP_ADDR1_FOR_FORM'
      Size = 100
    end
    object aq12SHP_ADDR2_FOR_FORM: TStringField
      FieldName = 'SHP_ADDR2_FOR_FORM'
      Size = 40
    end
    object aq12SHP_ADDR3_FOR_FORM: TStringField
      FieldName = 'SHP_ADDR3_FOR_FORM'
      Size = 40
    end
    object aq12SHP_ANALYSIS_CODE1: TStringField
      FieldName = 'SHP_ANALYSIS_CODE1'
    end
    object aq12SHP_ANALYSIS_CODE2: TStringField
      FieldName = 'SHP_ANALYSIS_CODE2'
    end
    object aq12SHP_ANALYSIS_CODE3: TStringField
      FieldName = 'SHP_ANALYSIS_CODE3'
    end
    object aq12EMAIL_FOR_CONTACT: TStringField
      FieldName = 'EMAIL_FOR_CONTACT'
      Size = 50
    end
    object aq12S4_BARCODE_LABLE: TStringField
      FieldName = 'S4_BARCODE_LABLE'
      Size = 100
    end
    object aq12S3_BARCODE_LABLE: TStringField
      FieldName = 'S3_BARCODE_LABLE'
      Size = 100
    end
    object aq12PACKGE_BARCODE_LABLE: TStringField
      FieldName = 'PACKGE_BARCODE_LABLE'
      Size = 100
    end
    object aq12MISC_BARCODE_LABLE: TStringField
      FieldName = 'MISC_BARCODE_LABLE'
      Size = 100
    end
    object aq12COFC_FORMAT_FILENAME: TStringField
      FieldName = 'COFC_FORMAT_FILENAME'
      Size = 100
    end
    object aq12EXPIRED_DATE: TDateTimeField
      FieldName = 'EXPIRED_DATE'
    end
    object wrdfldaq12overship_flag: TWordField
      FieldName = 'overship_flag'
    end
  end
  object dsq12: TDataSource
    DataSet = aq12
    Left = 48
    Top = 160
  end
  object ppDB10: TppDBPipeline
    DataSource = ds10
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB10'
    Left = 90
    Top = 64
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB10
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'R:\NIERP\Report\customer_info.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 138
    Top = 64
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB10'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 33338
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #23458#25143#21672#20449#35843#26597#34920
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4868
        mmLeft = 76994
        mmTop = 12965
        mmWidth = 29633
        BandType = 1
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 159279
        mmTop = 26458
        mmWidth = 30956
        BandType = 1
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = #25171#21360#26102#38388#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 134144
        mmTop = 26458
        mmWidth = 23019
        BandType = 1
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'company_name'
        DataPipeline = ppDB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 18
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 7324
        mmLeft = 55568
        mmTop = 3175
        mmWidth = 76454
        BandType = 1
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        AutoSize = True
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'company_icon'
        DataPipeline = ppDB493
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDB493'
        mmHeight = 16933
        mmLeft = 2381
        mmTop = 1058
        mmWidth = 31750
        BandType = 1
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'SALES_REP_NAME'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 93927
        mmTop = 26458
        mmWidth = 21696
        BandType = 1
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = #19994#21153#21592#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 69056
        mmTop = 26458
        mmWidth = 21696
        BandType = 1
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'CUST_CODE'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 4064
        mmLeft = 25929
        mmTop = 26458
        mmWidth = 7874
        BandType = 1
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = #23458#25143#32534#21495#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 1852
        mmTop = 26458
        mmWidth = 21696
        BandType = 1
      end
    end
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 203994
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 201613
        mmLeft = 2117
        mmTop = 1323
        mmWidth = 187855
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 2646
        mmTop = 17992
        mmWidth = 187061
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = #23458#25143#21517#31216
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 3969
        mmTop = 7408
        mmWidth = 20108
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 62442
        mmLeft = 25665
        mmTop = 1323
        mmWidth = 794
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 25665
        mmTop = 9790
        mmWidth = 163777
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = #20013#25991#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 27252
        mmTop = 3704
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = #33521#25991#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 27252
        mmTop = 12171
        mmWidth = 10583
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'CUSTOMER_NAME'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 39158
        mmTop = 3704
        mmWidth = 148432
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'billing_address_4'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 39158
        mmTop = 12171
        mmWidth = 148432
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 2381
        mmTop = 63500
        mmWidth = 187325
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 45508
        mmLeft = 96838
        mmTop = 17992
        mmWidth = 1323
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = #20844#21496#22320#22336':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 3969
        mmTop = 19579
        mmWidth = 20108
        BandType = 0
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = True
        DataField = 'BILLING_ADDRESS_1'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 12700
        mmLeft = 26988
        mmTop = 19315
        mmWidth = 68792
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'PHONE'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 26988
        mmTop = 34660
        mmWidth = 68792
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = #30005#35805':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 3969
        mmTop = 34660
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = #20256#30495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 3969
        mmTop = 42598
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'fax'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 26988
        mmTop = 42598
        mmWidth = 68792
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'GEN_EMAIL_ADDRESS'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 26988
        mmTop = 50006
        mmWidth = 68792
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = 'E_mail:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 3969
        mmTop = 50006
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = #32593#22336':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 3969
        mmTop = 57944
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'BILLING_ADDRESS_2'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 26988
        mmTop = 57944
        mmWidth = 68792
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        AutoSize = False
        Caption = #19994#21153#32852#32476#20154':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 98161
        mmTop = 19844
        mmWidth = 22754
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = #24037#31243#32852#31995#20154':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 98161
        mmTop = 27252
        mmWidth = 22754
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        AutoSize = False
        Caption = #21697#31649#32852#31995#20154':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 98161
        mmTop = 34925
        mmWidth = 22754
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        AutoSize = False
        Caption = #36130#21153#32852#31995#20154':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 98161
        mmTop = 42333
        mmWidth = 22754
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        AutoSize = False
        Caption = #25253#20851#32852#31995#20154':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 98161
        mmTop = 50006
        mmWidth = 22754
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        AutoSize = False
        Caption = 'IQC '#32852#31995#20154':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 98161
        mmTop = 57679
        mmWidth = 22754
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'CONTACT_NAME_1'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 121709
        mmTop = 19844
        mmWidth = 24342
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'CONTACT_NAME_2'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 121709
        mmTop = 27252
        mmWidth = 24342
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'CONTACT_NAME_3'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 121709
        mmTop = 34925
        mmWidth = 24342
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'CONTACT_NAME_4'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 121709
        mmTop = 42333
        mmWidth = 24342
        BandType = 0
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'CONTACT_NAME_5'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 121709
        mmTop = 50006
        mmWidth = 24342
        BandType = 0
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'contact_name_6'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 121709
        mmTop = 57679
        mmWidth = 24342
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        AutoSize = False
        Caption = #30005#35805':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 147902
        mmTop = 19844
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        AutoSize = False
        Caption = #30005#35805':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 147902
        mmTop = 27252
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        AutoSize = False
        Caption = #30005#35805':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 147902
        mmTop = 34925
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        AutoSize = False
        Caption = #30005#35805':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 147902
        mmTop = 42333
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        AutoSize = False
        Caption = #30005#35805':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 147902
        mmTop = 50006
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        AutoSize = False
        Caption = #30005#35805':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 147902
        mmTop = 57679
        mmWidth = 10319
        BandType = 0
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'CONT_PHONE_1'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 159279
        mmTop = 19844
        mmWidth = 28575
        BandType = 0
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'CONT_PHONE_2'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 159279
        mmTop = 27252
        mmWidth = 28575
        BandType = 0
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'CONT_PHONE_3'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 159279
        mmTop = 34925
        mmWidth = 28575
        BandType = 0
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'CONT_PHONE_4'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 159279
        mmTop = 42333
        mmWidth = 28575
        BandType = 0
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'CONT_PHONE_5'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 159279
        mmTop = 50006
        mmWidth = 28575
        BandType = 0
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'CONT_PHONE_6'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 159279
        mmTop = 57679
        mmWidth = 28575
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 2117
        mmTop = 135202
        mmWidth = 187590
        BandType = 0
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        DataField = 'edi_flag_for_invoice'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 34396
        mmTop = 118534
        mmWidth = 59267
        BandType = 0
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        DataField = 'edi_flag_for_soack'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 129117
        mmTop = 83608
        mmWidth = 57944
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        AutoSize = False
        Caption = '1'#12289#20027' '#35201' '#20135' '#21697':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 3440
        mmTop = 75142
        mmWidth = 28575
        BandType = 0
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        DataField = 'EDI_ID'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 34396
        mmTop = 75142
        mmWidth = 153723
        BandType = 0
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        DataField = 'SMOOTHING_THRESHOLD'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 34396
        mmTop = 83608
        mmWidth = 59267
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        AutoSize = False
        Caption = '6'#12289#26159' '#21542' '#21547' '#31246':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 3440
        mmTop = 118534
        mmWidth = 28575
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        AutoSize = False
        Caption = '2'#12289#21592' '#24037' '#20154' '#25968':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 3440
        mmTop = 83608
        mmWidth = 28575
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        AutoSize = False
        Caption = '3'#12289#38144'   '#21806'    '#39069':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 3440
        mmTop = 92075
        mmWidth = 28575
        BandType = 0
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        DataField = 'MONTH_AMOUNT'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 34396
        mmTop = 92075
        mmWidth = 48154
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        AutoSize = False
        Caption = '4'#12289#33829' '#19994' '#24615' '#36136':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 3440
        mmTop = 100542
        mmWidth = 28575
        BandType = 0
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        DataField = 'OUTGOING_FORM_ADDR1'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 34396
        mmTop = 100542
        mmWidth = 59267
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        AutoSize = False
        Caption = '5'#12289'PCB'#26376#29992#37327':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 3440
        mmTop = 109009
        mmWidth = 28575
        BandType = 0
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        DataField = 'MONTH_PCBAMOUNT'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 34396
        mmTop = 109009
        mmWidth = 48154
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        AutoSize = False
        Caption = '7'#12289#26159' '#21542' '#36716' '#21378':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 98690
        mmTop = 83608
        mmWidth = 28575
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'Label34'
        AutoSize = False
        Caption = '8'#12289#20184' '#27454' '#26041' '#27861':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 98690
        mmTop = 92075
        mmWidth = 28575
        BandType = 0
      end
      object ppDBText29: TppDBText
        UserName = 'DBText29'
        DataField = 'FED_TAX_ID_NO'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 4233
        mmLeft = 129117
        mmTop = 92075
        mmWidth = 57944
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        Caption = #19975#20803
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 84667
        mmTop = 92075
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        Caption = #19975#20803
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 84667
        mmTop = 109009
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'Label37'
        AutoSize = False
        Caption = '11'#12289#21407#20379#24212#21830' :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 98690
        mmTop = 118534
        mmWidth = 28575
        BandType = 0
      end
      object ppLabel38: TppLabel
        UserName = 'Label38'
        AutoSize = False
        Caption = '9'#12289#20449' '#29992' '#31561' '#32423':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 98690
        mmTop = 100542
        mmWidth = 28575
        BandType = 0
      end
      object ppDBText30: TppDBText
        UserName = 'DBText30'
        DataField = 'OUTGOING_FORM_NAME'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 129117
        mmTop = 118534
        mmWidth = 57944
        BandType = 0
      end
      object ppLabel39: TppLabel
        UserName = 'Label39'
        AutoSize = False
        Caption = '10'#12289#20184#27454#36135#24065' :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 98690
        mmTop = 109009
        mmWidth = 28575
        BandType = 0
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 2117
        mmTop = 151342
        mmWidth = 187590
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 2117
        mmTop = 168805
        mmWidth = 187590
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 2117
        mmTop = 184944
        mmWidth = 187590
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 67733
        mmLeft = 29633
        mmTop = 135202
        mmWidth = 794
        BandType = 0
      end
      object ppLabel40: TppLabel
        UserName = 'Label40'
        AutoSize = False
        Caption = #19994#21153#21592
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 3175
        mmTop = 137848
        mmWidth = 25135
        BandType = 0
      end
      object ppLabel41: TppLabel
        UserName = 'Label41'
        AutoSize = False
        Caption = #35780#23457#24847#35265
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 3175
        mmTop = 145257
        mmWidth = 25135
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'Label42'
        AutoSize = False
        Caption = #24066#22330#37096#32463#29702
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 3175
        mmTop = 154517
        mmWidth = 25135
        BandType = 0
      end
      object ppLabel43: TppLabel
        UserName = 'Label43'
        AutoSize = False
        Caption = #35780#23457#24847#35265
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 3175
        mmTop = 162454
        mmWidth = 25135
        BandType = 0
      end
      object ppLabel44: TppLabel
        UserName = 'Label44'
        AutoSize = False
        Caption = #36130#21153#37096
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 3175
        mmTop = 171715
        mmWidth = 25135
        BandType = 0
      end
      object ppLabel45: TppLabel
        UserName = 'Label45'
        AutoSize = False
        Caption = #23457#26680#24847#35265
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 3175
        mmTop = 178859
        mmWidth = 25135
        BandType = 0
      end
      object ppLabel46: TppLabel
        UserName = 'Label46'
        AutoSize = False
        Caption = #24635#32463#21150
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 3175
        mmTop = 188119
        mmWidth = 25135
        BandType = 0
      end
      object ppLabel47: TppLabel
        UserName = 'Label47'
        AutoSize = False
        Caption = #23457#26680#24847#35265
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 3175
        mmTop = 195263
        mmWidth = 25135
        BandType = 0
      end
      object ppDBText31: TppDBText
        UserName = 'DBText31'
        DataField = 'REP_EVAL'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 43127
        mmTop = 137848
        mmWidth = 143669
        BandType = 0
      end
      object ppLabel48: TppLabel
        UserName = 'Label48'
        AutoSize = False
        Caption = #24314#35758#26376#20449#29992#39069':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 30956
        mmTop = 145257
        mmWidth = 26723
        BandType = 0
      end
      object ppLabel49: TppLabel
        UserName = 'Label49'
        AutoSize = False
        Caption = #24314#35758#26376#20449#29992#39069':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 30956
        mmTop = 162454
        mmWidth = 26723
        BandType = 0
      end
      object ppLabel50: TppLabel
        UserName = 'Label50'
        AutoSize = False
        Caption = #24314#35758#26376#20449#29992#39069':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 30956
        mmTop = 178859
        mmWidth = 26723
        BandType = 0
      end
      object ppLabel51: TppLabel
        UserName = 'Label501'
        AutoSize = False
        Caption = #24314#35758#26376#20449#29992#39069':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 30956
        mmTop = 195527
        mmWidth = 26723
        BandType = 0
      end
      object ppDBText32: TppDBText
        UserName = 'DBText32'
        DataField = 'MAK_EVAL'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 43127
        mmTop = 154517
        mmWidth = 143669
        BandType = 0
      end
      object ppDBText34: TppDBText
        UserName = 'DBText34'
        DataField = 'MARMANG_EVAL'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 43127
        mmTop = 188119
        mmWidth = 143669
        BandType = 0
      end
      object ppDBText33: TppDBText
        UserName = 'DBText33'
        DataField = 'FIN_EVAL'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 43127
        mmTop = 171715
        mmWidth = 143669
        BandType = 0
      end
      object ppDBText35: TppDBText
        UserName = 'DBText35'
        DataField = 'REP_CREDIT'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 59267
        mmTop = 145257
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel52: TppLabel
        UserName = 'Label51'
        AutoSize = False
        Caption = #19975#20803';'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 71173
        mmTop = 145257
        mmWidth = 9790
        BandType = 0
      end
      object ppDBText36: TppDBText
        UserName = 'DBText36'
        DataField = 'MAK_CREDIT'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 59267
        mmTop = 162454
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel53: TppLabel
        UserName = 'Label53'
        AutoSize = False
        Caption = #19975#20803';'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 71173
        mmTop = 162454
        mmWidth = 9790
        BandType = 0
      end
      object ppDBText37: TppDBText
        UserName = 'DBText37'
        DataField = 'FIN_CREDIT'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 59267
        mmTop = 178859
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel54: TppLabel
        UserName = 'Label54'
        AutoSize = False
        Caption = #19975#20803';'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 71173
        mmTop = 178859
        mmWidth = 9790
        BandType = 0
      end
      object ppDBText38: TppDBText
        UserName = 'DBText38'
        DataField = 'MARMANG_CREDIT'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 59267
        mmTop = 195527
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel55: TppLabel
        UserName = 'Label55'
        AutoSize = False
        Caption = #19975#20803';'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 71173
        mmTop = 195527
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel56: TppLabel
        UserName = 'Label52'
        AutoSize = False
        Caption = #26368#39640#27424#27454':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 84402
        mmTop = 145257
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel57: TppLabel
        UserName = 'Label57'
        AutoSize = False
        Caption = #26368#39640#27424#27454':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 84402
        mmTop = 162454
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel58: TppLabel
        UserName = 'Label58'
        AutoSize = False
        Caption = #26368#39640#27424#27454':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 84402
        mmTop = 178859
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel59: TppLabel
        UserName = 'Label59'
        AutoSize = False
        Caption = #26368#39640#27424#27454':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 84402
        mmTop = 195527
        mmWidth = 18521
        BandType = 0
      end
      object ppDBText39: TppDBText
        UserName = 'DBText39'
        DataField = 'REP_HIGH'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 103981
        mmTop = 145257
        mmWidth = 11642
        BandType = 0
      end
      object ppDBText40: TppDBText
        UserName = 'DBText40'
        DataField = 'MAK_HIGH'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 103981
        mmTop = 162454
        mmWidth = 11642
        BandType = 0
      end
      object ppDBText41: TppDBText
        UserName = 'DBText401'
        DataField = 'FIN_HIGH'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 103981
        mmTop = 178859
        mmWidth = 11642
        BandType = 0
      end
      object ppDBText42: TppDBText
        UserName = 'DBText42'
        DataField = 'MARMANG_HIGH'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 103981
        mmTop = 195527
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel60: TppLabel
        UserName = 'Label60'
        AutoSize = False
        Caption = #19975#20803';'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 116152
        mmTop = 145257
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel61: TppLabel
        UserName = 'Label61'
        AutoSize = False
        Caption = #19975#20803';'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 116152
        mmTop = 162454
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel62: TppLabel
        UserName = 'Label62'
        AutoSize = False
        Caption = #19975#20803';'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 116152
        mmTop = 178859
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel63: TppLabel
        UserName = 'Label63'
        AutoSize = False
        Caption = #19975#20803';'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 116152
        mmTop = 195527
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel64: TppLabel
        UserName = 'Label56'
        AutoSize = False
        Caption = #31614#21517':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 130175
        mmTop = 145257
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel65: TppLabel
        UserName = 'Label65'
        AutoSize = False
        Caption = #31614#21517':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 130175
        mmTop = 162454
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel66: TppLabel
        UserName = 'Label66'
        AutoSize = False
        Caption = #31614#21517':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 130175
        mmTop = 178859
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel67: TppLabel
        UserName = 'Label67'
        AutoSize = False
        Caption = #31614#21517':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 130175
        mmTop = 195527
        mmWidth = 10319
        BandType = 0
      end
      object ppDBText43: TppDBText
        UserName = 'DBText41'
        DataField = 'REP_NAME'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 141552
        mmTop = 145257
        mmWidth = 16669
        BandType = 0
      end
      object ppDBText44: TppDBText
        UserName = 'DBText44'
        DataField = 'MAK_NAME'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 141552
        mmTop = 162454
        mmWidth = 16669
        BandType = 0
      end
      object ppDBText45: TppDBText
        UserName = 'DBText45'
        DataField = 'FIN_NAME'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 141552
        mmTop = 178859
        mmWidth = 16669
        BandType = 0
      end
      object ppDBText46: TppDBText
        UserName = 'DBText46'
        DataField = 'MARMANG_NAME'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 141552
        mmTop = 195527
        mmWidth = 16669
        BandType = 0
      end
      object ppDBText47: TppDBText
        UserName = 'DBText43'
        DataField = 'REP_DATE'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 159015
        mmTop = 145257
        mmWidth = 27781
        BandType = 0
      end
      object ppDBText48: TppDBText
        UserName = 'DBText48'
        DataField = 'MAK_DATE'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 159015
        mmTop = 162454
        mmWidth = 27781
        BandType = 0
      end
      object ppDBText49: TppDBText
        UserName = 'DBText49'
        DataField = 'FIN_DATE'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 159015
        mmTop = 178859
        mmWidth = 27781
        BandType = 0
      end
      object ppDBText50: TppDBText
        UserName = 'DBText50'
        DataField = 'MARMANG_DATE'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 159015
        mmTop = 195527
        mmWidth = 27781
        BandType = 0
      end
      object ppDBText51: TppDBText
        UserName = 'DBText47'
        DataField = 'credit_rating'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 4233
        mmLeft = 129117
        mmTop = 100542
        mmWidth = 57944
        BandType = 0
      end
      object ppDBText52: TppDBText
        UserName = 'DBText51'
        DataField = 'CURR_NAME'
        DataPipeline = ppDB10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB10'
        mmHeight = 3969
        mmLeft = 129117
        mmTop = 109009
        mmWidth = 57944
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 2381
        mmTop = 32808
        mmWidth = 94456
        BandType = 0
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 2381
        mmTop = 40481
        mmWidth = 94456
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 2381
        mmTop = 48154
        mmWidth = 94456
        BandType = 0
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 2381
        mmTop = 55827
        mmWidth = 94456
        BandType = 0
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 96838
        mmTop = 25400
        mmWidth = 92604
        BandType = 0
      end
      object ppLine16: TppLine
        UserName = 'Line16'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 96838
        mmTop = 32808
        mmWidth = 92604
        BandType = 0
      end
      object ppLine17: TppLine
        UserName = 'Line17'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 96838
        mmTop = 40481
        mmWidth = 92604
        BandType = 0
      end
      object ppLine18: TppLine
        UserName = 'Line18'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 96838
        mmTop = 48154
        mmWidth = 92604
        BandType = 0
      end
      object ppLine19: TppLine
        UserName = 'Line19'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 96838
        mmTop = 55827
        mmWidth = 92604
        BandType = 0
      end
      object ppLine20: TppLine
        UserName = 'Line20'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 2381
        mmTop = 81492
        mmWidth = 187325
        BandType = 0
      end
      object ppLine21: TppLine
        UserName = 'Line21'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 2381
        mmTop = 89694
        mmWidth = 187325
        BandType = 0
      end
      object ppLine22: TppLine
        UserName = 'Line22'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 2381
        mmTop = 98425
        mmWidth = 187325
        BandType = 0
      end
      object ppLine23: TppLine
        UserName = 'Line23'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 2381
        mmTop = 106627
        mmWidth = 187325
        BandType = 0
      end
      object ppLine24: TppLine
        UserName = 'Line24'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 2381
        mmTop = 115888
        mmWidth = 187325
        BandType = 0
      end
      object ppLine25: TppLine
        UserName = 'Line25'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 2117
        mmTop = 124884
        mmWidth = 187590
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = #35780#35821':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 30956
        mmTop = 137848
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = #35780#35821':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 30956
        mmTop = 154517
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel68: TppLabel
        UserName = 'Label68'
        AutoSize = False
        Caption = #35780#35821':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 30956
        mmTop = 171715
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel69: TppLabel
        UserName = 'Label69'
        AutoSize = False
        Caption = #35780#35821':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 30956
        mmTop = 188119
        mmWidth = 10583
        BandType = 0
      end
      object ppLine26: TppLine
        UserName = 'Line26'
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 2117
        mmTop = 72496
        mmWidth = 187590
        BandType = 0
      end
      object ppLine27: TppLine
        UserName = 'Line27'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 43392
        mmLeft = 96838
        mmTop = 81492
        mmWidth = 1323
        BandType = 0
      end
      object ppLabel70: TppLabel
        UserName = 'Label64'
        AutoSize = False
        Caption = #23458#25143#35814#32454#20449#24687
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6519
        mmLeft = 4233
        mmTop = 64823
        mmWidth = 183886
        BandType = 0
      end
      object ppLabel71: TppLabel
        UserName = 'Label71'
        AutoSize = False
        Caption = #20844#21496#39046#23548#23545#35813#23458#25143#30340#35780#23457#35760#24405
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6615
        mmLeft = 3969
        mmTop = 126736
        mmWidth = 183886
        BandType = 0
      end
      object ppLine28: TppLine
        UserName = 'Line28'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 29633
        mmTop = 143140
        mmWidth = 160073
        BandType = 0
      end
      object ppLine29: TppLine
        UserName = 'Line29'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 29633
        mmTop = 159809
        mmWidth = 160073
        BandType = 0
      end
      object ppLine30: TppLine
        UserName = 'Line30'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 29633
        mmTop = 176742
        mmWidth = 160073
        BandType = 0
      end
      object ppLine31: TppLine
        UserName = 'Line301'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 29633
        mmTop = 193146
        mmWidth = 160073
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppLabel72: TppLabel
        UserName = 'Label70'
        AutoSize = False
        Caption = #28145#22323#24066#21360#26234'PCB'#26377#38480#20844#21496#29256#26435#25152#26377
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #21326#25991#26999#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5503
        mmLeft = 2646
        mmTop = 1323
        mmWidth = 62706
        BandType = 8
      end
    end
  end
  object aq493: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select company_name,company_icon from data0493')
    Left = 8
    Top = 256
    object aq493company_name: TStringField
      FieldName = 'company_name'
      Size = 50
    end
    object aq493company_icon: TBlobField
      FieldName = 'company_icon'
    end
  end
  object dsq493: TDataSource
    DataSet = aq493
    Left = 48
    Top = 256
  end
  object ppDB493: TppDBPipeline
    DataSource = dsq493
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 90
    Top = 256
  end
  object ADO20: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey10'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select  file_name, Indate, remark, RKEY, SOURCE_PTR'
      ' from data0020 where source_ptr=:rkey10')
    Left = 224
    Top = 128
    object ADO20file_name: TStringField
      DisplayLabel = #25991#26723#21517#31216
      FieldName = 'file_name'
      Size = 50
    end
    object ADO20Indate: TDateTimeField
      DisplayLabel = #23384#26723#26085#26399
      FieldName = 'Indate'
    end
    object ADO20remark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 150
    end
    object ADO20RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO20SOURCE_PTR: TIntegerField
      FieldName = 'SOURCE_PTR'
    end
  end
  object DS20: TDataSource
    DataSet = ADO20
    Left = 176
    Top = 128
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 224
    Top = 176
  end
  object ADO248: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.Data0248.RKEY, dbo.Data0248.CUST_PTR, dbo.Data024' +
        '8.sys_ptr, dbo.Data0248.position, dbo.Data0073.USER_FULL_NAME, '
      '                      dbo.Data0073.USER_LOGIN_NAME'
      'FROM         dbo.Data0248 INNER JOIN'
      
        '                      dbo.Data0073 ON dbo.Data0248.sys_ptr = dbo' +
        '.Data0073.RKEY'
      'where  dbo.Data0248.CUST_PTR = :rkey')
    Left = 224
    Top = 232
    object ADO248RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO248CUST_PTR: TIntegerField
      FieldName = 'CUST_PTR'
    end
    object ADO248sys_ptr: TIntegerField
      FieldName = 'sys_ptr'
    end
    object ADO248position: TStringField
      FieldName = 'position'
    end
    object ADO248USER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object ADO248USER_LOGIN_NAME: TStringField
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
  end
  object ADO73: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 224
    Top = 280
    object ADO73RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO73USER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object ADO73TPOSTION: TStringField
      FieldName = 'TPOSTION'
      Size = 30
    end
    object ADO73USER_LOGIN_NAME: TStringField
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
  end
  object ADO248_1: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT    * '
      'FROM data0248'
      'where   dbo.Data0248.CUST_PTR = :rkey')
    Left = 287
    Top = 232
  end
end
