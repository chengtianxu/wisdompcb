object F_DM: TF_DM
  OldCreateOrder = False
  Left = 599
  Top = 200
  Height = 362
  Width = 381
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 16
  end
  object ADS22: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT     dbo.Data0022.RKEY , dbo.Data0022.SOURCE_PTR ,'#13#10' dbo.D' +
      'ata0022.INVENTORY_PTR, dbo.Data0017.INV_PART_NUMBER,'#13#10' dbo.Data0' +
      '017.INV_PART_DESCRIPTION, '#13#10' dbo.Data0023.CODE, dbo.Data0023.SUP' +
      'PLIER_NAME,'#13#10' dbo.Data0023.CONTACT_NAME_1,'#13#10' dbo.Data0023.BILLIN' +
      'G_ADDRESS_1, dbo.Data0456.ship_DATE, '#13#10' dbo.Data0022.PRICE, dbo.' +
      'Data0015.WAREHOUSE_CODE, dbo.Data0015.WAREHOUSE_NAME,'#13#10' dbo.Data' +
      '0022.QUAN_TO_BE_SHIPPED, dbo.Data0022.QUAN_RETURNED, '#13#10'dbo.Data0' +
      '022.BARCODE_ID, dbo.Data0456.TTYPE, dbo.Data0022.QUANTITY, '#13#10'dbo' +
      '.Data0002.UNIT_NAME, dbo.Data0022.rohs, '#13#10'dbo.Data0022.SUPPLIER2' +
      ', dbo.Data0022.QUAN_ON_HAND,'#13#10'dbo.Data0096.RKEY as rkey96, dbo.D' +
      'ata0096.INVT_PTR, '#13#10'dbo.Data0096.REJ_PTR, dbo.Data0096.INV_TRAN_' +
      'PTR, '#13#10'dbo.Data0096.EMPL_PTR, dbo.Data0096.USER_PTR, '#13#10'dbo.Data0' +
      '096.TDATE, dbo.Data0096.QUAN_REJD, '#13#10'dbo.Data0096.FLAG, dbo.Data' +
      '0096.REFERENCE_NUMBER,'#13#10'case dbo.Data0096.status when '#39'1'#39' then '#39 +
      #24050#35013#36816#39' when '#39'0'#39' then '#39#26410#35013#36816#39' end  as '#39'v_state'#39#13#10' ,d05.rkey as rkey5,' +
      ' d05.EMPL_CODE,data0070.PO_NUMBER,'#13#10' d05.EMPLOYEE_NAME as ename ' +
      ',dbo.Data0076.reject_description,d05_1.rkey as rkey56, d05_1.EMP' +
      'L_CODE,'#13#10' d05_1.EMPLOYEE_NAME as uname,dbo.Data0096.TRAN_DATE,db' +
      'o.Data0096.SHIPPING_METHOD,'#13#10'dbo.Data0017.rkey as key17,dbo.data' +
      '0076.rkey as rkey76,Data0022.tax_price AS t_price,'#13#10'Data0022.tax' +
      '_price*Data0096.QUAN_REJD as tax_amount,Data0022.TAX_2,dbo.Data0' +
      '456.exch_rate,'#13#10'Data0001.RKEY as rkey1,Data0001.CURR_CODE,Data00' +
      '01.CURR_NAME'#13#10'FROM          dbo.Data0005 AS d05 INNER JOIN'#13#10'    ' +
      '                  dbo.Data0096 ON d05.RKEY = dbo.Data0096.EMPL_P' +
      'TR INNER JOIN'#13#10'                      dbo.Data0076 ON dbo.Data009' +
      '6.REJ_PTR = dbo.Data0076.RKEY INNER JOIN'#13#10'                      ' +
      'dbo.Data0022 INNER JOIN'#13#10'                      dbo.Data0456 ON d' +
      'bo.Data0022.GRN_PTR = dbo.Data0456.RKEY INNER JOIN'#13#10'            ' +
      '          dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR = dbo.Data0' +
      '017.RKEY INNER JOIN'#13#10'                      dbo.Data0023 ON dbo.D' +
      'ata0456.SUPP_PTR = dbo.Data0023.RKEY INNER JOIN'#13#10'               ' +
      '       dbo.Data0015 ON dbo.Data0456.warehouse_ptr = dbo.Data0015' +
      '.RKEY INNER JOIN'#13#10'                      dbo.Data0002 ON dbo.Data' +
      '0022.LOCATION_PTR_FROM = dbo.Data0002.RKEY ON dbo.Data0096.INV_T' +
      'RAN_PTR = dbo.Data0022.RKEY inner  JOIN   '#13#10'                    ' +
      '  dbo.Data0001 ON dbo.Data0456.currency_ptr = dbo.Data0001.RKEY ' +
      'LEFT OUTER JOIN'#13#10'                      dbo.Data0005 AS d05_1 ON ' +
      'dbo.Data0096.USER_PTR = d05_1.RKEY  left join'#13#10'                 ' +
      '     dbo.Data0070 ON data0456.PO_PTR=data0070.rkey'#13#10'WHERE    (1=' +
      '1) and (dbo.Data0096.FLAG=2) and dbo.Data0096.TDATE>=:dtpk1 and ' +
      'dbo.Data0096.TDATE<=:dtpk2'
    IndexFieldNames = 'tdate DESC'
    Parameters = <
      item
        Name = 'dtpk1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'dtpk2'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    Left = 64
    Top = 88
    object ADS22RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADS22SOURCE_PTR: TIntegerField
      FieldName = 'SOURCE_PTR'
    end
    object ADS22INVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object ADS22INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADS22INV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object ADS22CODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object ADS22SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object ADS22CONTACT_NAME_1: TStringField
      FieldName = 'CONTACT_NAME_1'
    end
    object ADS22BILLING_ADDRESS_1: TStringField
      FieldName = 'BILLING_ADDRESS_1'
      Size = 100
    end
    object ADS22ship_DATE: TDateTimeField
      FieldName = 'ship_DATE'
    end
    object ADS22PRICE: TBCDField
      FieldName = 'PRICE'
      Precision = 15
      Size = 6
    end
    object ADS22WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ADS22WAREHOUSE_NAME: TStringField
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
    object ADS22QUAN_TO_BE_SHIPPED: TBCDField
      FieldName = 'QUAN_TO_BE_SHIPPED'
      Precision = 18
      Size = 6
    end
    object ADS22QUAN_RETURNED: TBCDField
      FieldName = 'QUAN_RETURNED'
      Precision = 18
      Size = 6
    end
    object ADS22BARCODE_ID: TStringField
      FieldName = 'BARCODE_ID'
      Size = 50
    end
    object ADS22TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object ADS22QUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
    object ADS22UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object ADS22rohs: TStringField
      FieldName = 'rohs'
      Size = 10
    end
    object ADS22SUPPLIER2: TStringField
      FieldName = 'SUPPLIER2'
      Size = 30
    end
    object ADS22QUAN_ON_HAND: TBCDField
      FieldName = 'QUAN_ON_HAND'
      Precision = 19
    end
    object ADS22INVT_PTR: TIntegerField
      FieldName = 'INVT_PTR'
    end
    object ADS22REJ_PTR: TIntegerField
      FieldName = 'REJ_PTR'
    end
    object ADS22INV_TRAN_PTR: TIntegerField
      FieldName = 'INV_TRAN_PTR'
    end
    object ADS22TDATE: TDateTimeField
      FieldName = 'TDATE'
    end
    object ADS22QUAN_REJD: TFloatField
      FieldName = 'QUAN_REJD'
    end
    object ADS22FLAG: TStringField
      FieldName = 'FLAG'
      FixedChar = True
      Size = 1
    end
    object ADS22REFERENCE_NUMBER: TStringField
      FieldName = 'REFERENCE_NUMBER'
      FixedChar = True
    end
    object ADS22v_state: TStringField
      FieldName = 'v_state'
      ReadOnly = True
      Size = 6
    end
    object ADS22EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object ADS22reject_description: TStringField
      FieldName = 'reject_description'
      Size = 30
    end
    object ADS22EMPL_CODE_1: TStringField
      FieldName = 'EMPL_CODE_1'
      Size = 10
    end
    object ADS22EMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
    end
    object ADS22USER_PTR: TIntegerField
      FieldName = 'USER_PTR'
    end
    object ADS22ename: TStringField
      FieldName = 'ename'
      Size = 16
    end
    object ADS22uname: TStringField
      FieldName = 'uname'
      Size = 16
    end
    object ADS22TRAN_DATE: TDateTimeField
      FieldName = 'TRAN_DATE'
    end
    object ADS22SHIPPING_METHOD: TWideStringField
      FieldName = 'SHIPPING_METHOD'
    end
    object ADS22rkey5: TAutoIncField
      FieldName = 'rkey5'
      ReadOnly = True
    end
    object ADS22rkey56: TAutoIncField
      FieldName = 'rkey56'
      ReadOnly = True
    end
    object ADS22key17: TAutoIncField
      FieldName = 'key17'
      ReadOnly = True
    end
    object ADS22rkey76: TAutoIncField
      FieldName = 'rkey76'
      ReadOnly = True
    end
    object ADS22rkey96: TAutoIncField
      FieldName = 'rkey96'
      ReadOnly = True
    end
    object ADS22tax_amount: TFloatField
      FieldName = 'tax_amount'
      ReadOnly = True
    end
    object ADS22TAX_2: TBCDField
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object ADS22exch_rate: TBCDField
      FieldName = 'exch_rate'
      Precision = 12
      Size = 8
    end
    object ADS22rkey1: TAutoIncField
      FieldName = 'rkey1'
      ReadOnly = True
    end
    object ADS22CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADS22CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object ADS22t_price: TBCDField
      FieldName = 't_price'
      Precision = 13
    end
    object ADS22PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#35746#21333#21495
      FieldName = 'PO_NUMBER'
      Size = 15
    end
  end
  object DS22: TDataSource
    DataSet = ADS22
    Left = 24
    Top = 88
  end
  object aqtmp1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 64
    Top = 161
  end
  object AQTmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 24
    Top = 160
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 136
    Top = 81
  end
  object ADO96: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
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
      
        'select d96.*,d76.reject_description,d73.employee_name as user_fu' +
        'll_name from data0096 d96 left join data0076 d76 '
      'on d96.rej_ptr=d76.rkey left join data0005 d73 on '
      'd96.EMPL_PTR=d73.rkey'
      
        ' where inv_tran_ptr=:rkey and isnull(d96.status,0)=0 and  d96.fl' +
        'ag=2')
    Left = 152
    Top = 160
    object ADO96RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO96INVT_PTR: TIntegerField
      FieldName = 'INVT_PTR'
    end
    object ADO96REJ_PTR: TIntegerField
      FieldName = 'REJ_PTR'
    end
    object ADO96INV_TRAN_PTR: TIntegerField
      FieldName = 'INV_TRAN_PTR'
    end
    object ADO96EMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
    end
    object ADO96USER_PTR: TIntegerField
      FieldName = 'USER_PTR'
    end
    object ADO96TDATE: TDateTimeField
      DisplayLabel = #25351#27966#26085#26399
      FieldName = 'TDATE'
    end
    object ADO96QUAN_REJD: TFloatField
      DisplayLabel = #36864#36135#25968#37327
      FieldName = 'QUAN_REJD'
    end
    object ADO96FLAG: TStringField
      FieldName = 'FLAG'
      FixedChar = True
      Size = 1
    end
    object ADO96REFERENCE_NUMBER: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REFERENCE_NUMBER'
      FixedChar = True
    end
    object ADO96status: TWordField
      FieldName = 'status'
    end
    object ADO96reject_description: TStringField
      DisplayLabel = #36864#36135#21407#22240
      FieldName = 'reject_description'
      Size = 30
    end
    object ADO96user_full_name: TStringField
      DisplayLabel = #25351#27966#20154
      FieldName = 'user_full_name'
      Size = 30
    end
  end
  object DS2: TDataSource
    DataSet = ADO96
    Left = 112
    Top = 160
  end
  object ADO210: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from data0210 where rkey is null')
    Left = 208
    Top = 75
    object ADO210RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO210INVT_PTR: TIntegerField
      FieldName = 'INVT_PTR'
    end
    object ADO210PO_LINK_PTR: TIntegerField
      FieldName = 'PO_LINK_PTR'
    end
    object ADO210D0022_PTR: TIntegerField
      FieldName = 'D0022_PTR'
    end
    object ADO210D0235_PTR: TIntegerField
      FieldName = 'D0235_PTR'
    end
    object ADO210QUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
    object ADO210TDATE: TDateTimeField
      FieldName = 'TDATE'
    end
    object ADO210DEBIT_MEMO_PTR: TIntegerField
      FieldName = 'DEBIT_MEMO_PTR'
    end
    object ADO210empl_ptr: TIntegerField
      FieldName = 'empl_ptr'
    end
    object ADO210type: TWordField
      FieldName = 'type'
    end
  end
  object ADO96_1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from data0096'
      'where rkey is null')
    Left = 216
    Top = 147
  end
  object aq0493: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ParamCheck = False
    Parameters = <>
    SQL.Strings = (
      'select * from data0493')
    Left = 120
    Top = 216
    object aq0493Company_Name: TStringField
      FieldName = 'Company_Name'
      Size = 50
    end
    object aq0493Company_Name2: TStringField
      FieldName = 'Company_Name2'
      Size = 50
    end
    object aq0493Company_Name3: TStringField
      FieldName = 'Company_Name3'
      Size = 50
    end
    object aq0493ship_address: TStringField
      FieldName = 'ship_address'
      Size = 50
    end
    object aq0493Company_Icon: TBlobField
      FieldName = 'Company_Icon'
    end
    object aq0493SITE_INFO_ADD_1: TStringField
      FieldName = 'SITE_INFO_ADD_1'
      FixedChar = True
      Size = 50
    end
    object aq0493SITE_INFO_ADD_2: TStringField
      FieldName = 'SITE_INFO_ADD_2'
      FixedChar = True
      Size = 50
    end
    object aq0493SITE_INFO_ADD_3: TStringField
      FieldName = 'SITE_INFO_ADD_3'
      FixedChar = True
      Size = 50
    end
    object aq0493SITE_INFO_PHONE: TStringField
      FieldName = 'SITE_INFO_PHONE'
      FixedChar = True
      Size = 30
    end
  end
  object ADOQ11: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ParamCheck = False
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      ' FROM data0011'
      'where (1=1)')
    Left = 176
    Top = 216
    object ADOQ11NOTE_PAD_LINE_1: TStringField
      FieldName = 'NOTE_PAD_LINE_1'
      Size = 70
    end
    object ADOQ11NOTE_PAD_LINE_2: TStringField
      FieldName = 'NOTE_PAD_LINE_2'
      Size = 70
    end
    object ADOQ11NOTE_PAD_LINE_3: TStringField
      FieldName = 'NOTE_PAD_LINE_3'
      Size = 70
    end
    object ADOQ11NOTE_PAD_LINE_4: TStringField
      FieldName = 'NOTE_PAD_LINE_4'
      Size = 70
    end
  end
  object ADODS1: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT TOP 100 PERCENT dbo.Data0095.QUANTITY, dbo.Data0095.SHIPP' +
      'ING_METHOD, '#13#10'      dbo.Data0022.RKEY, dbo.Data0017.INV_PART_NUM' +
      'BER, '#13#10'      dbo.Data0017.INV_PART_DESCRIPTION, dbo.Data0005.EMP' +
      'LOYEE_NAME, '#13#10'      dbo.Data0095.TRAN_DATE, dbo.Data0095.REFEREN' +
      'CE_NUMBER, '#13#10'      dbo.Data0022.QUANTITY AS rece_quan, dbo.Data0' +
      '022.TDATE,dbo.Data0022.tax_2, '#13#10'      dbo.Data0023.ABBR_NAME, db' +
      'o.Data0023.CONTACT_NAME_1, '#13#10'      dbo.Data0023.BILLING_ADDRESS_' +
      '1, dbo.Data0023.CODE, '#13#10'      dbo.Data0095.RKEY AS rkey95, dbo.D' +
      'ata0071.QUAN_ORD,dbo.Data0022.price as no_tax_price, '#13#10'      dbo' +
      '.Data0022.tax_price AS price, dbo.Data0023.SUPPLIER_NAME,'#13#10'     ' +
      ' dbo.Data0022.tax_price*dbo.Data0095.quantity as tax_amount,'#13#10'  ' +
      '    dbo.Data0022.price*dbo.Data0095.quantity as no_tax_amount, '#13 +
      #10'      dbo.Data0002.UNIT_NAME, dbo.Data0071.CONVERSION_FACTOR, '#13 +
      #10'      dbo.Data0070.PO_NUMBER, dbo.Data0070.PO_DATE, dbo.Data045' +
      '6.TTYPE, '#13#10'      dbo.Data0001.CURR_NAME, dbo.Data0456.exch_rate'#13 +
      #10'FROM         dbo.Data0001 INNER JOIN'#13#10'                      dbo' +
      '.Data0002 INNER JOIN'#13#10'                      dbo.Data0023 INNER J' +
      'OIN'#13#10'                      dbo.Data0095 INNER JOIN'#13#10'            ' +
      '          dbo.Data0017 ON dbo.Data0095.INVT_PTR = dbo.Data0017.R' +
      'KEY INNER JOIN'#13#10'                      dbo.Data0005 ON dbo.Data00' +
      '95.TRAN_BY = dbo.Data0005.RKEY INNER JOIN'#13#10'                     ' +
      ' dbo.Data0022 ON dbo.Data0095.SRCE_PTR = dbo.Data0022.RKEY INNER' +
      ' JOIN'#13#10'                      dbo.Data0456 ON dbo.Data0022.GRN_PT' +
      'R = dbo.Data0456.RKEY ON dbo.Data0023.RKEY = dbo.Data0456.SUPP_P' +
      'TR ON '#13#10'                      dbo.Data0002.RKEY = dbo.Data0022.L' +
      'OCATION_PTR_FROM ON dbo.Data0001.RKEY = dbo.Data0456.currency_pt' +
      'r LEFT OUTER JOIN'#13#10'                      dbo.Data0071 LEFT OUTER' +
      ' JOIN'#13#10'                      dbo.Data0070 ON dbo.Data0071.PO_PTR' +
      ' = dbo.Data0070.RKEY ON dbo.Data0022.SOURCE_PTR = dbo.Data0071.R' +
      'KEY'#13#10'WHERE (dbo.Data0095.TRAN_TP = 21) '#13#10'ORDER BY dbo.Data0095.T' +
      'RAN_DATE'#13#10
    IndexFieldNames = 'tdate DESC'
    Parameters = <>
    Left = 64
    Top = 216
    object ADODS1QUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
    object ADODS1SHIPPING_METHOD: TStringField
      FieldName = 'SHIPPING_METHOD'
    end
    object ADODS1RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADODS1INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADODS1INV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object ADODS1EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADODS1TRAN_DATE: TDateTimeField
      FieldName = 'TRAN_DATE'
    end
    object ADODS1REFERENCE_NUMBER: TStringField
      FieldName = 'REFERENCE_NUMBER'
    end
    object ADODS1rece_quan: TFloatField
      FieldName = 'rece_quan'
    end
    object ADODS1TDATE: TDateTimeField
      FieldName = 'TDATE'
    end
    object ADODS1tax_2: TBCDField
      FieldName = 'tax_2'
      Precision = 4
      Size = 2
    end
    object ADODS1ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object ADODS1CONTACT_NAME_1: TStringField
      FieldName = 'CONTACT_NAME_1'
    end
    object ADODS1BILLING_ADDRESS_1: TStringField
      FieldName = 'BILLING_ADDRESS_1'
      Size = 100
    end
    object ADODS1CODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object ADODS1rkey95: TAutoIncField
      FieldName = 'rkey95'
      ReadOnly = True
    end
    object ADODS1QUAN_ORD: TFloatField
      FieldName = 'QUAN_ORD'
    end
    object ADODS1no_tax_price: TBCDField
      FieldName = 'no_tax_price'
      Precision = 15
      Size = 6
    end
    object ADODS1price: TBCDField
      FieldName = 'price'
      Precision = 13
    end
    object ADODS1SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object ADODS1tax_amount: TFloatField
      FieldName = 'tax_amount'
      ReadOnly = True
    end
    object ADODS1no_tax_amount: TFloatField
      FieldName = 'no_tax_amount'
      ReadOnly = True
    end
    object ADODS1UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object ADODS1CONVERSION_FACTOR: TFloatField
      FieldName = 'CONVERSION_FACTOR'
    end
    object ADODS1PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object ADODS1PO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object ADODS1TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object ADODS1CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object ADODS1exch_rate: TBCDField
      FieldName = 'exch_rate'
      Precision = 12
      Size = 8
    end
  end
end
