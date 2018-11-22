object dm: Tdm
  OldCreateOrder = False
  Left = 926
  Top = 204
  Height = 330
  Width = 333
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=wisdompcb1077;Persist Security Info' +
      '=True;User ID=sa;Initial Catalog=sj_v20_live;Data Source=172.16.' +
      '68.8;Use Procedure for Prepare=1;Auto Translate=True;Packet Size' +
      '=4096;Workstation ID=PC-20150130VGBU;Use Encryption for Data=Fal' +
      'se;Tag with column collation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 18
  end
  object DataSource1: TDataSource
    DataSet = Aqwz456
    OnDataChange = DataSource1DataChange
    Left = 48
    Top = 71
  end
  object DataSource2: TDataSource
    DataSet = Aqwz22
    Left = 48
    Top = 127
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    LockType = ltPessimistic
    Parameters = <>
    Left = 152
    Top = 16
  end
  object Aqwz22: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, '
      '      dbo.Data0017.INV_DESCRIPTION, dbo.Data0016.LOCATION, '
      '      dbo.Data0022.QUANTITY, dbo.Data0022.LOCATION_PTR_FROM, '
      '      dbo.Data0002.UNIT_NAME, dbo.Data0022.LOCATION_PTR, '
      
        '      dbo.Data0022.BARCODE_ID, dbo.Data0022.EXPIRE_DATE, dbo.dat' +
        'a0022.spec_place,'
      '      Data0022.INVENTORY_PTR, Data0022.tax_PRICE as price,'
      '      Data0017.SHELF_LIFE, Data0022.rohs, Data0022.SUPPLIER2,'
      '      Data0071.CONVERSION_FACTOR, Data0071.RKEY,Data0022.TAX_2,'
      
        '      data0022.STOCK_BASE,data0022.cust_decl, dbo.Data0017.SHELF' +
        '_LIFE,data0022.tdate'
      ''
      'FROM dbo.Data0022 INNER JOIN'
      
        '      dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR = dbo.Data0017.' +
        'RKEY INNER JOIN'
      '      dbo.Data0002 ON '
      
        '      dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0002.RKEY INNER J' +
        'OIN'
      '      dbo.Data0016 ON '
      
        '      dbo.Data0022.LOCATION_PTR = dbo.Data0016.RKEY LEFT OUTER J' +
        'OIN'
      
        '      dbo.Data0071 ON dbo.Data0022.SOURCE_PTR = dbo.Data0071.RKE' +
        'Y'
      'where Data0022.grn_ptr=:rkey')
    Left = 112
    Top = 127
    object Aqwz22INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object Aqwz22INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object Aqwz22INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object Aqwz22LOCATION: TStringField
      DisplayLabel = #23384#20179#20301#32622
      FieldName = 'LOCATION'
      Size = 10
    end
    object Aqwz22QUANTITY: TBCDField
      DisplayLabel = #25509#25910#25968#37327
      FieldName = 'QUANTITY'
      Precision = 9
      Size = 3
    end
    object Aqwz22UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object Aqwz22BARCODE_ID: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'BARCODE_ID'
      Size = 50
    end
    object Aqwz22EXPIRE_DATE: TDateTimeField
      DisplayLabel = #26377#25928#26399
      FieldName = 'EXPIRE_DATE'
    end
    object Aqwz22LOCATION_PTR_FROM: TIntegerField
      FieldName = 'LOCATION_PTR_FROM'
    end
    object Aqwz22LOCATION_PTR: TIntegerField
      FieldName = 'LOCATION_PTR'
    end
    object Aqwz22INVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object Aqwz22PRICE: TBCDField
      DisplayLabel = #21547#31246#20215
      FieldName = 'PRICE'
      Precision = 9
      Size = 3
    end
    object Aqwz22TAX_2: TBCDField
      DisplayLabel = #31246#29575'%'
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object Aqwz22SHELF_LIFE: TSmallintField
      FieldName = 'SHELF_LIFE'
    end
    object Aqwz22rohs: TStringField
      DisplayLabel = #29615#20445#26631#35782
      FieldName = 'rohs'
      Size = 10
    end
    object Aqwz22SUPPLIER2: TStringField
      FieldName = 'SUPPLIER2'
      Size = 10
    end
    object Aqwz22CONVERSION_FACTOR: TFloatField
      FieldName = 'CONVERSION_FACTOR'
    end
    object Aqwz22rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object Aqwz22cust_decl: TStringField
      FieldName = 'cust_decl'
      Size = 50
    end
    object Aqwz22STOCK_BASE: TBCDField
      FieldName = 'STOCK_BASE'
      Precision = 8
    end
    object Aqwz22SHELF_LIFE_1: TSmallintField
      FieldName = 'SHELF_LIFE_1'
    end
    object Aqwz22spec_place: TStringField
      FieldName = 'spec_place'
    end
    object Aqwz22tdate: TDateTimeField
      FieldName = 'tdate'
    end
  end
  object ADO456: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0456'
      'where rkey=:rkey')
    Left = 174
    Top = 70
    object ADO456RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO456GRN_NUMBER: TStringField
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object ADO456DELIVER_NUMBER: TStringField
      FieldName = 'DELIVER_NUMBER'
      Size = 15
    end
    object ADO456SUPP_PTR: TIntegerField
      FieldName = 'SUPP_PTR'
    end
    object ADO456PO_PTR: TIntegerField
      FieldName = 'PO_PTR'
    end
    object ADO456TTYPE: TWordField
      FieldName = 'TTYPE'
    end
    object ADO456STATUS: TWordField
      FieldName = 'STATUS'
    end
    object ADO456CREATE_DATE: TDateTimeField
      FieldName = 'CREATE_DATE'
    end
    object ADO456CREATE_BY: TIntegerField
      FieldName = 'CREATE_BY'
    end
    object ADO456ship_DATE: TDateTimeField
      FieldName = 'ship_DATE'
    end
    object ADO456ship_BY: TStringField
      FieldName = 'ship_BY'
    end
    object ADO456AUDITED_BY: TIntegerField
      FieldName = 'AUDITED_BY'
    end
    object ADO456AUDITED_DATE: TDateTimeField
      FieldName = 'AUDITED_DATE'
    end
    object ADO456REF_NUMBER: TStringField
      FieldName = 'REF_NUMBER'
      Size = 100
    end
    object ADO456PRINTED: TStringField
      FieldName = 'PRINTED'
      FixedChar = True
      Size = 1
    end
    object ADO456warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    LockType = ltPessimistic
    Parameters = <>
    Left = 224
    Top = 16
  end
  object ado04: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select SEED_VALUE,SEED_FLAG from data0004'
      'where rkey=57')
    Left = 173
    Top = 128
    object ado04SEED_VALUE: TStringField
      FieldName = 'SEED_VALUE'
    end
    object ado04SEED_FLAG: TWordField
      FieldName = 'SEED_FLAG'
    end
  end
  object aq16: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey15'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select rkey,LOCATION '
      'from data0016'
      'where whouse_ptr=:rkey15'
      'order by rkey')
    Left = 171
    Top = 180
    object aq16rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object aq16LOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 10
    end
  end
  object DataSource3: TDataSource
    DataSet = Aqwz235
    Left = 48
    Top = 178
  end
  object Aqwz235: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT dbo.Data0072.DESCRIPTION, dbo.Data0072.GUI_GE, '
      '      dbo.Data0072.DESCRIPTION2, dbo.Data0002.UNIT_NAME, '
      '      dbo.Data0235.QUAN_RECD, dbo.Data0016.LOCATION, '
      '      dbo.Data0235.REF_NUMBER,data0072.QUAN_ORD,'
      'Data0235.unit_price,Data0235.state_tax,Data0235.rohs'
      'FROM dbo.Data0235 INNER JOIN'
      
        '      dbo.Data0072 ON dbo.Data0235.D0072_PTR = dbo.Data0072.RKEY' +
        ' INNER JOIN'
      
        '      dbo.Data0002 ON dbo.Data0235.unit_ptr = dbo.Data0002.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0016 ON dbo.Data0235.location_ptr = dbo.Data0016.R' +
        'KEY'
      'where data0235.grn_ptr=:rkey')
    Left = 111
    Top = 178
    object Aqwz235DESCRIPTION: TStringField
      DisplayLabel = #29289#21697#21517#31216
      FieldName = 'DESCRIPTION'
      Size = 60
    end
    object Aqwz235GUI_GE: TStringField
      DisplayLabel = #35268#26684
      FieldName = 'GUI_GE'
      Size = 200
    end
    object Aqwz235DESCRIPTION2: TStringField
      DisplayLabel = #29289#21697#31867#21035
      FieldName = 'DESCRIPTION2'
      FixedChar = True
    end
    object Aqwz235UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object Aqwz235QUAN_RECD: TBCDField
      DisplayLabel = #25509#25910#25968#37327
      FieldName = 'QUAN_RECD'
      Precision = 10
      Size = 3
    end
    object Aqwz235LOCATION: TStringField
      DisplayLabel = #23384#36135#20301#32622
      FieldName = 'LOCATION'
      Size = 10
    end
    object Aqwz235REF_NUMBER: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REF_NUMBER'
      Size = 15
    end
    object Aqwz235unit_price: TBCDField
      DisplayLabel = #21547#31246#20215
      FieldName = 'unit_price'
      Precision = 10
      Size = 3
    end
    object Aqwz235state_tax: TBCDField
      DisplayLabel = #31246#29575'%'
      FieldName = 'state_tax'
      Precision = 4
      Size = 2
    end
    object Aqwz235rohs: TStringField
      DisplayLabel = #29615#20445#26631#35782
      FieldName = 'rohs'
      Size = 10
    end
    object Aqwz235QUAN_ORD: TFloatField
      FieldName = 'QUAN_ORD'
    end
  end
  object Aqwz456: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    AfterOpen = Aqwz456AfterOpen
    AfterClose = Aqwz456AfterClose
    BeforeDelete = Aqwz456BeforeDelete
    CommandText = 
      'declare @TempTable table(selected bit)      '#13#10'insert @TempTable ' +
      ' values (0)'#13#10'SELECT selected,dbo.Data0456.RKEY, dbo.Data0456.GRN' +
      '_NUMBER, '#13#10'      dbo.Data0456.DELIVER_NUMBER, dbo.Data0023.CODE,' +
      ' '#13#10'      dbo.Data0023.SUPPLIER_NAME, dbo.Data0023.ABBR_NAME, '#13#10' ' +
      '     dbo.Data0456.ship_DATE, dbo.Data0456.STATUS, dbo.Data0456.T' +
      'TYPE, '#13#10'      dbo.Data0456.REF_NUMBER, dbo.Data0070.PO_NUMBER, d' +
      'bo.Data0456.PO_PTR, '#13#10'      d5a.EMPLOYEE_NAME, d5a.EMPL_CODE,d5b' +
      '.EMPLOYEE_NAME as EMPLOYEE_NAME2, d5b.EMPL_CODE as EMPL_CODE2,db' +
      'o.data0456.AUDITED_DATE, '#13#10'      dbo.Data0015.WAREHOUSE_CODE, db' +
      'o.Data0015.ABBR_NAME AS ABBR_NAME1, '#13#10'      dbo.Data0456.ship_BY' +
      ', dbo.Data0001.CURR_CODE, dbo.Data0001.CURR_NAME, '#13#10'      dbo.Da' +
      'ta0456.warehouse_ptr, dbo.Data0034.DEPT_NAME, dbo.Data0456.SUPP_' +
      'PTR, '#13#10'      dbo.Data0456.PRINTED, dbo.Data0456.currency_ptr, db' +
      'o.Data0456.exch_rate,data0724.gon_number,data0724.rkey as rkey14' +
      '8,'#13#10'case data0456.ttype'#13#10'when 1 then '#39#32534#30721#20837#24211#39' when  2 then '#39#26434#39033#20837#24211#39#13 +
      #10'when 3 then '#39#30452#25509#20837#24211#39' when  5 then '#39'VMI'#20837#24211' '#39' end as v_type,'#13#10'case d' +
      'ata0456.status'#13#10'when 1 then  '#39#26410#25552#20132#39' when 2 then '#39#24453#23457#26680#39' when 3 then' +
      ' '#39#24050#23457#26680#39' '#13#10'when 4 then  '#39#24050#35760#24080#39' when 5 then '#39#24050#20184#27454#39' when 6 then '#39#34987#36864#22238#39' ' +
      'end as v_status'#13#10'FROM dbo.Data0456 INNER JOIN'#13#10'      dbo.Data002' +
      '3 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY INNER JOIN'#13#10'     ' +
      ' dbo.Data0005 d5a ON dbo.Data0456.CREATE_BY = d5a.RKEY INNER JOI' +
      'N'#13#10'      dbo.Data0015 ON dbo.Data0456.warehouse_ptr = dbo.Data00' +
      '15.RKEY INNER JOIN'#13#10'      dbo.Data0001 ON '#13#10'      dbo.Data0456.c' +
      'urrency_ptr = dbo.Data0001.RKEY LEFT OUTER JOIN'#13#10'      dbo.Data0' +
      '070 ON dbo.Data0456.PO_PTR = dbo.Data0070.RKEY LEFT OUTER JOIN'#13#10 +
      '      dbo.Data0034 ON dbo.Data0070.PO_REV_NO = dbo.Data0034.DEPT' +
      '_CODE LEFT OUTER JOIN'#13#10'      dbo.data0724 on  dbo.data0456.VMIOU' +
      'T_PTR=dbo.data0724.rkey LEFT OUTER JOIN'#13#10'      dbo.Data0005 d5b ' +
      'ON dbo.Data0456.AUDITED_BY = d5b.RKEY'#13#10'      INNER join @TempTab' +
      'le on 1=1'#13#10'where'#13#10'      Data0456.status <> :v1 and'#13#10'      Data04' +
      '56.status <> :v2 and'#13#10'      Data0456.status <> :v3 and'#13#10'      Da' +
      'ta0456.status <> :v4 and'#13#10'      Data0456.status <> :v5 and'#13#10'    ' +
      '  Data0456.status <> :v6 and'#13#10'      Data0456.SHIP_DATE >= :dtpk1' +
      ' and'#13#10'      Data0456.SHIP_DATE <= :dtpk2 and'#13#10'     data0456.ttyp' +
      'e <> 4'
    Parameters = <
      item
        Name = 'v1'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 1
      end
      item
        Name = 'v2'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 0
      end
      item
        Name = 'v3'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 0
      end
      item
        Name = 'v4'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 4
      end
      item
        Name = 'v5'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 5
      end
      item
        Name = 'v6'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 6
      end
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = 38666d
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = 38686d
      end>
    Left = 112
    Top = 72
    object Aqwz456RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object Aqwz456GRN_NUMBER: TStringField
      DisplayLabel = #20837#20179#21333#21495
      FieldName = 'GRN_NUMBER'
      ReadOnly = True
      Size = 10
    end
    object Aqwz456DELIVER_NUMBER: TStringField
      DisplayLabel = #36865#36135#21333#21495
      FieldName = 'DELIVER_NUMBER'
      ReadOnly = True
      Size = 15
    end
    object Aqwz456CODE: TStringField
      FieldName = 'CODE'
      ReadOnly = True
      Size = 10
    end
    object Aqwz456SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      ReadOnly = True
      Size = 100
    end
    object Aqwz456ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      FieldName = 'ABBR_NAME'
      ReadOnly = True
      Size = 10
    end
    object Aqwz456ship_DATE: TDateTimeField
      DisplayLabel = #36865#36135#26085#26399
      FieldName = 'ship_DATE'
      ReadOnly = True
    end
    object Aqwz456STATUS: TSmallintField
      FieldName = 'STATUS'
      ReadOnly = True
    end
    object Aqwz456TTYPE: TSmallintField
      FieldName = 'TTYPE'
      ReadOnly = True
    end
    object Aqwz456REF_NUMBER: TStringField
      FieldName = 'REF_NUMBER'
      ReadOnly = True
      Size = 100
    end
    object Aqwz456PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#35746#21333#21495
      FieldName = 'PO_NUMBER'
      ReadOnly = True
      Size = 15
    end
    object Aqwz456PO_PTR: TIntegerField
      FieldName = 'PO_PTR'
      ReadOnly = True
    end
    object Aqwz456EMPLOYEE_NAME: TStringField
      DisplayLabel = #25910#36135#38599#21592
      FieldName = 'EMPLOYEE_NAME'
      ReadOnly = True
      Size = 16
    end
    object Aqwz456EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      ReadOnly = True
      Size = 10
    end
    object Aqwz456WAREHOUSE_CODE: TStringField
      DisplayLabel = #24037#21378#20195#30721
      FieldName = 'WAREHOUSE_CODE'
      ReadOnly = True
      Size = 5
    end
    object Aqwz456WAREHOUSE_NAME: TStringField
      DisplayLabel = #24037#21378#21517#31216
      FieldName = 'ABBR_NAME1'
      ReadOnly = True
      Size = 70
    end
    object Aqwz456ship_BY: TStringField
      FieldName = 'ship_BY'
      ReadOnly = True
    end
    object Aqwz456CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      ReadOnly = True
      Size = 5
    end
    object Aqwz456CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object Aqwz456warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object Aqwz456DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object Aqwz456SUPP_PTR: TIntegerField
      FieldName = 'SUPP_PTR'
    end
    object Aqwz456PRINTED: TStringField
      FieldName = 'PRINTED'
      FixedChar = True
      Size = 1
    end
    object Aqwz456currency_ptr: TIntegerField
      FieldName = 'currency_ptr'
    end
    object Aqwz456exch_rate: TBCDField
      FieldName = 'exch_rate'
      Precision = 12
      Size = 8
    end
    object Aqwz456v_type: TStringField
      DisplayLabel = #20837#20179#31867#22411
      FieldName = 'v_type'
      ReadOnly = True
      Size = 8
    end
    object Aqwz456v_status: TStringField
      DisplayLabel = #29366#24577
      DisplayWidth = 6
      FieldName = 'v_status'
    end
    object Aqwz456gon_number: TStringField
      FieldName = 'gon_number'
      Size = 10
    end
    object Aqwz456rkey148: TIntegerField
      FieldName = 'rkey148'
      ReadOnly = True
    end
    object Aqwz456EMPLOYEE_NAME2: TStringField
      FieldName = 'EMPLOYEE_NAME2'
      Size = 16
    end
    object Aqwz456EMPL_CODE2: TStringField
      FieldName = 'EMPL_CODE2'
      Size = 10
    end
    object Aqwz456AUDITED_DATE: TDateTimeField
      FieldName = 'AUDITED_DATE'
    end
    object Aqwz456selected: TBooleanField
      FieldName = 'selected'
      OnChange = Aqwz456selectedChange
    end
  end
end
