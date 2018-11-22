object dm: Tdm
  OldCreateOrder = False
  Left = 566
  Top = 288
  Height = 275
  Width = 364
  object ADO022: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, dbo.' +
      'Data0017.INV_DESCRIPTION, dbo.Data0002.UNIT_NAME, '#13#10'            ' +
      '      dbo.Data0015.WAREHOUSE_CODE, dbo.Data0015.WAREHOUSE_NAME, ' +
      'dbo.Data0015.rkey as rkey15, dbo.Data0023.CODE,'#13#10' dbo.Data0023.S' +
      'UPPLIER_NAME, dbo.Data0016.CODE AS '#20179#24211#32534#21495', dbo.Data0016.LOCATION, ' +
      #13#10'                      dbo.Data0022.PRICE, dbo.Data0456.exch_ra' +
      'te, dbo.Data0022.QUAN_IN_INSP, dbo.Data0022.QUAN_TO_BE_SHIPPED, ' +
      'dbo.Data0022.QUAN_SCRAPPED, '#13#10'                      dbo.Data0022' +
      '.LOCATION_PTR, dbo.Data0022.TDATE, dbo.Data0022.EXPIRE_DATE, dbo' +
      '.Data0022.rohs, dbo.Data0022.INVENTORY_PTR, dbo.Data0022.RKEY, d' +
      'bo.Data0022.QUANTITY,'#13#10'                      dbo.Data0022.QUAN_O' +
      'N_HAND, dbo.Data0022.tax_price, dbo.Data0022.TAX_2,dbo.Data0071.' +
      'reason, dbo.Data0022.BARCODE_ID,'#13#10' Data0456.GRN_NUMBER, Data0456' +
      '.ship_DATE'#13#10'FROM         dbo.Data0017 INNER JOIN'#13#10'              ' +
      '        dbo.Data0022 ON dbo.Data0017.RKEY = dbo.Data0022.INVENTO' +
      'RY_PTR INNER JOIN'#13#10'                      dbo.Data0456 ON dbo.Dat' +
      'a0022.GRN_PTR = dbo.Data0456.RKEY INNER JOIN'#13#10'                  ' +
      '    dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY IN' +
      'NER JOIN'#13#10'                      dbo.Data0015 ON dbo.Data0456.war' +
      'ehouse_ptr = dbo.Data0015.RKEY INNER JOIN'#13#10'                     ' +
      ' dbo.Data0016 ON dbo.Data0022.LOCATION_PTR = dbo.Data0016.RKEY I' +
      'NNER JOIN'#13#10'                      dbo.Data0002 ON dbo.Data0022.LO' +
      'CATION_PTR_FROM = dbo.Data0002.RKEY left join'#13#10'                 ' +
      '     dbo.Data0071 ON dbo.Data0022.SOURCE_PTR = dbo.Data0071.RKEY' +
      #13#10'                      '#13#10'WHERE     (dbo.Data0022.QUAN_IN_INSP >' +
      ' 0)'
    CommandTimeout = 25
    IndexFieldNames = 'INV_PART_NUMBER'
    Parameters = <>
    Prepared = True
    Left = 200
    Top = 8
    object ADO022INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#21495
      DisplayWidth = 16
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADO022INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      DisplayWidth = 13
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ADO022INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      DisplayWidth = 22
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ADO022UNIT_NAME: TStringField
      DisplayWidth = 17
      FieldName = 'UNIT_NAME'
    end
    object ADO022WAREHOUSE_CODE: TStringField
      DisplayLabel = #24037#21378#32534#21495
      DisplayWidth = 8
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ADO022WAREHOUSE_NAME: TStringField
      DisplayLabel = #24037#21378#21517#31216
      DisplayWidth = 23
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
    object ADO022CODE: TStringField
      DisplayLabel = #20379#24212#21830#32534#21495
      DisplayWidth = 10
      FieldName = 'CODE'
      Size = 10
    end
    object ADO022SUPPLIER_NAME: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      DisplayWidth = 19
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object ADO022DSDesigner: TStringField
      DisplayWidth = 8
      FieldName = #20179#24211#32534#21495
      FixedChar = True
      Size = 5
    end
    object ADO022LOCATION: TStringField
      DisplayLabel = #20179#24211#21517#31216
      DisplayWidth = 10
      FieldName = 'LOCATION'
      Size = 10
    end
    object ADO022PRICE: TBCDField
      DisplayLabel = #19981#21547#31246#20215#26684
      DisplayWidth = 11
      FieldName = 'PRICE'
      Precision = 10
      Size = 3
    end
    object ADO022EXCHANGE_RATE: TFloatField
      DisplayLabel = #27719#29575
      DisplayWidth = 10
      FieldName = 'EXCH_RATE'
    end
    object ADO022QUAN_IN_INSP: TBCDField
      DisplayLabel = #24453#26816#25968#37327
      DisplayWidth = 19
      FieldName = 'QUAN_IN_INSP'
      Precision = 18
      Size = 6
    end
    object ADO022QUAN_TO_BE_SHIPPED: TBCDField
      DisplayLabel = #36864#36135#25968#37327
      DisplayWidth = 19
      FieldName = 'QUAN_TO_BE_SHIPPED'
      Precision = 18
      Size = 6
    end
    object ADO022QUAN_SCRAPPED: TBCDField
      DisplayLabel = #25253#24223#25968#37327
      DisplayWidth = 19
      FieldName = 'QUAN_SCRAPPED'
      Precision = 18
      Size = 6
    end
    object ADO022QUAN_ON_HAND: TBCDField
      DisplayLabel = #24403#21069#24211#23384
      DisplayWidth = 20
      FieldName = 'QUAN_ON_HAND'
      Precision = 19
    end
    object ADO022TDATE: TDateTimeField
      DisplayLabel = #25910#36135#26085#26399
      DisplayWidth = 18
      FieldName = 'TDATE'
    end
    object ADO022EXPIRE_DATE: TDateTimeField
      DisplayLabel = #26377#25928#26399
      DisplayWidth = 18
      FieldName = 'EXPIRE_DATE'
    end
    object ADO022rohs: TStringField
      DisplayLabel = #29615#20445#26631#35782
      DisplayWidth = 10
      FieldName = 'rohs'
      Size = 10
    end
    object ADO022INVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object ADO022RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO022LOCATION_PTR: TIntegerField
      FieldName = 'LOCATION_PTR'
    end
    object ADO022tax_price: TBCDField
      DisplayLabel = #21547#31246#20215#26684
      FieldName = 'tax_price'
      Precision = 12
      Size = 3
    end
    object ADO022TAX_2: TBCDField
      DisplayLabel = #31246#29575'%'
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object ADO022rkey15: TAutoIncField
      FieldName = 'rkey15'
      ReadOnly = True
    end
    object ADO022reason: TStringField
      DisplayLabel = #35831#36141#21407#22240
      FieldName = 'reason'
      Size = 60
    end
    object ADO022BARCODE_ID: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'BARCODE_ID'
      Size = 50
    end
    object ADO022GRN_NUMBER: TStringField
      DisplayLabel = #20837#24211#21333#21495
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object ADO022ship_DATE: TDateTimeField
      DisplayLabel = #36865#36135#26085#26399
      FieldName = 'ship_DATE'
    end
    object ADO022QUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
  end
  object ADOConnection1: TADOConnection
    CommandTimeout = 25
    ConnectionTimeout = 25
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = ADO022
    Left = 136
    Top = 8
  end
  object ADOData0095: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select TRAN_TP, INVT_PTR, SRCE_PTR, TRAN_BY, TRAN_DATE, QUANTITY' +
      ' ,rkey'#13#10'from Data0095 where 1=2'
    Parameters = <>
    Left = 112
    Top = 88
    object ADOData0095TRAN_TP: TSmallintField
      FieldName = 'TRAN_TP'
    end
    object ADOData0095INVT_PTR: TIntegerField
      FieldName = 'INVT_PTR'
    end
    object ADOData0095SRCE_PTR: TIntegerField
      FieldName = 'SRCE_PTR'
    end
    object ADOData0095TRAN_BY: TIntegerField
      FieldName = 'TRAN_BY'
    end
    object ADOData0095TRAN_DATE: TDateTimeField
      FieldName = 'TRAN_DATE'
    end
    object ADOData0095QUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
    object ADOData0095rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
  end
  object ADOData0096: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select INVT_PTR, REJ_PTR, INV_TRAN_PTR, EMPL_PTR, TDATE, QUAN_RE' +
      'JD, FLAG,rkey'#13#10' from Data0096 where 1=2'
    Parameters = <>
    Left = 200
    Top = 88
    object ADOData0096INVT_PTR: TIntegerField
      FieldName = 'INVT_PTR'
    end
    object ADOData0096REJ_PTR: TIntegerField
      FieldName = 'REJ_PTR'
    end
    object ADOData0096INV_TRAN_PTR: TIntegerField
      FieldName = 'INV_TRAN_PTR'
    end
    object ADOData0096EMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
    end
    object ADOData0096TDATE: TDateTimeField
      FieldName = 'TDATE'
    end
    object ADOData0096QUAN_REJD: TFloatField
      FieldName = 'QUAN_REJD'
    end
    object ADOData0096FLAG: TStringField
      FieldName = 'FLAG'
      FixedChar = True
      Size = 1
    end
    object ADOData0096rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
  end
  object ADOData0017: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'select QUAN_ON_HAND, RKEY  from Data0017'#13#10'where rkey=:v_key'
    Parameters = <
      item
        Name = 'v_key'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    Left = 32
    Top = 88
    object ADOData0017QUAN_ON_HAND: TFloatField
      FieldName = 'QUAN_ON_HAND'
    end
    object ADOData0017RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 32
    Top = 176
  end
end
