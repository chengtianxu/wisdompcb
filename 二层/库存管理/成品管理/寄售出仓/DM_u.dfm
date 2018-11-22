object DM: TDM
  OldCreateOrder = False
  Left = 583
  Top = 242
  Height = 375
  Width = 336
  object ADOCon: TADOConnection
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 32
  end
  object tmp: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 240
    Top = 120
  end
  object AQ157: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterOpen = AQ157AfterScroll
    AfterScroll = AQ157AfterScroll
    Parameters = <>
    SQL.Strings = (
      
        'SELECT    dbo.DATA0157.*, dbo.Data0001.CURR_CODE, dbo.Data0005.E' +
        'MPLOYEE_NAME, '
      
        '                      dbo.Data0010.CUST_CODE, dbo.Data0010.ABBR_' +
        'NAME'
      'FROM         dbo.DATA0157 INNER JOIN'
      
        '                      dbo.Data0001 ON dbo.DATA0157.CURRENCY_PTR ' +
        '= dbo.Data0001.RKEY INNER JOIN'
      
        '                      dbo.Data0005 ON dbo.DATA0157.EMPL_PTR = db' +
        'o.Data0005.RKEY INNER JOIN'
      
        '                      dbo.Data0010 ON dbo.DATA0157.CUSTOMER_PTR ' +
        '= dbo.Data0010.RKEY')
    Left = 59
    Top = 106
    object AQ157rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object AQ157PRINT_NUMBER: TStringField
      DisplayLabel = #25171#21360#21333#21495
      FieldName = 'PRINT_NUMBER'
      Size = 15
    end
    object AQ157EMPLOYEE_NAME: TStringField
      DisplayLabel = #36755#20837#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object AQ157ENT_DATE: TDateTimeField
      DisplayLabel = #36755#20837#26085#26399
      FieldName = 'ENT_DATE'
    end
    object AQ157personnel_name: TStringField
      DisplayLabel = #39046#26009#20154#21592
      FieldName = 'personnel_name'
      Size = 15
    end
    object AQ157BRING_DATE: TDateTimeField
      DisplayLabel = #39046#26009#26085#26399
      FieldName = 'BRING_DATE'
    end
    object AQ157QUANTITY: TIntegerField
      DisplayLabel = #39046#26009#24635#25968#37327
      FieldName = 'QUANTITY'
    end
    object AQ157AMOUNT: TBCDField
      DisplayLabel = #24635#37329#39069
      FieldName = 'AMOUNT'
      Precision = 10
      Size = 2
    end
    object AQ157REMARK: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REMARK'
      Size = 100
    end
    object AQ157receipt_number: TStringField
      DisplayLabel = #25910#25454#25209#21495
      FieldName = 'receipt_number'
    end
    object AQ157CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object AQ157ABBR_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object AQ157CURR_CODE: TStringField
      DisplayLabel = #24065#31181
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object AQ157CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object AQ157CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object AQ157EMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
    end
  end
  object AQ158: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    BeforeOpen = AQ158BeforeOpen
    Parameters = <
      item
        Name = 'd157Rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.DATA0158.*, dbo.Data0025.MANU_PART_NUMBER, dbo.Da' +
        'ta0025.MANU_PART_DESC,'
      
        '                  data0153.PO_NUMBER,data0153.MFG_DATE,data0025.' +
        'analysis_code_2,'
      
        '                 Convert(Float,data0158.PRICE) as Price6,data015' +
        '3.TAX_RATE'
      'FROM         dbo.DATA0158 INNER JOIN'
      
        '                      dbo.DATA0153 ON dbo.DATA0158.STOCK_PTR = d' +
        'bo.DATA0153.rkey INNER JOIN'
      
        '                      dbo.Data0025 ON dbo.DATA0153.CUSTPART_PTR ' +
        '= dbo.Data0025.RKEY'
      'where data0158.PRINT_PTR=:d157Rkey')
    Left = 61
    Top = 158
    object AQ158RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AQ158MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object AQ158MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object AQ158OUT_QTY: TIntegerField
      DisplayLabel = #25968#37327
      DisplayWidth = 5
      FieldName = 'OUT_QTY'
    end
    object AQ158RECE_NUMBER: TStringField
      DisplayLabel = #25910#26009#21333#21495
      FieldName = 'RECE_NUMBER'
      Size = 15
    end
    object AQ158PRICE: TBCDField
      DisplayLabel = #21333#20215
      FieldName = 'PRICE'
      Precision = 12
      Size = 6
    end
    object AQ158Price6: TFloatField
      DisplayLabel = #21333#20215
      FieldName = 'Price6'
      ReadOnly = True
    end
    object AQ158REMARK: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REMARK'
      Size = 50
    end
    object AQ158STOCK_PTR: TIntegerField
      FieldName = 'STOCK_PTR'
    end
    object AQ158PRINT_PTR: TIntegerField
      FieldName = 'PRINT_PTR'
    end
    object AQ158PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#21333#21495
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object AQ158MFG_DATE: TDateTimeField
      DisplayLabel = #20837#24211#26085#26399
      FieldName = 'MFG_DATE'
    end
    object AQ158analysis_code_2: TStringField
      DisplayLabel = #23458#25143#29289#26009#21495
      FieldName = 'analysis_code_2'
      Size = 50
    end
    object AQ158TAX_RATE: TBCDField
      DisplayLabel = #31246#29575'%'
      FieldName = 'TAX_RATE'
      Precision = 5
      Size = 2
    end
  end
  object DS2: TDataSource
    DataSet = AQ158
    Left = 8
    Top = 155
  end
  object DS1: TDataSource
    DataSet = AQ157
    Left = 8
    Top = 104
  end
  object AQ157_1: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey157'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT  * from data0157 where rkey=:rkey157')
    Left = 123
    Top = 106
  end
  object AQ158_1: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    BeforeOpen = AQ158_1BeforeOpen
    Parameters = <
      item
        Name = 'd157Rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT  * FROM  DATA0158  where PRINT_PTR=:d157Rkey')
    Left = 125
    Top = 158
  end
end
