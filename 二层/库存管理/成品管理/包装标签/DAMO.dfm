object DM: TDM
  OldCreateOrder = False
  Left = 736
  Top = 220
  Height = 366
  Width = 422
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 56
    Top = 56
  end
  object ADS698: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT     dbo.DATA0698.pack_number, dbo.Data0005.EMPLOYEE_NAME,' +
      ' '#13#10'                 dbo.DATA0698.v_date, dbo.DATA0698.v_print, d' +
      'bo.DATA0698.pack_item, '#13#10'                 dbo.Data0025.MANU_PART' +
      '_NUMBER, dbo.Data0025.MANU_PART_DESC, '#13#10'                 dbo.Dat' +
      'a0025.ANALYSIS_CODE_2, dbo.Data0097.PO_NUMBER, dbo.DATA0698.code' +
      ', '#13#10'                 dbo.DATA0698.lotno, dbo.DATA0698.notes, dbo' +
      '.DATA0698.qty, data0698.type,'#13#10'                dbo.DATA0698.desc' +
      'ription, dbo.Data0060.SALES_ORDER, dbo.DATA0698.rkey, '#13#10'        ' +
      '        dbo.DATA0698.so_ptr, dbo.Data0010.CUST_CODE, dbo.Data001' +
      '0.ABBR_NAME'#13#10'FROM         dbo.DATA0698 INNER JOIN'#13#10'             ' +
      '         dbo.Data0005 ON dbo.DATA0698.empl_ptr = dbo.Data0005.RK' +
      'EY INNER JOIN'#13#10'                      dbo.Data0060 ON dbo.DATA069' +
      '8.so_ptr = dbo.Data0060.RKEY INNER JOIN'#13#10'                      d' +
      'bo.Data0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.RKEY IN' +
      'NER JOIN'#13#10'                      dbo.Data0097 ON dbo.Data0060.PUR' +
      'CHASE_ORDER_PTR = dbo.Data0097.RKEY INNER JOIN'#13#10'                ' +
      '      dbo.Data0010 ON dbo.Data0060.CUSTOMER_PTR = dbo.Data0010.R' +
      'KEY'#13#10'where data0698.v_date >= :dtpk1 and data0698.v_date <= :dtp' +
      'k2'
    IndexFieldNames = 'pack_number'
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 40179d
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 40513d
      end>
    Left = 128
    Top = 112
    object ADS698pack_number: TStringField
      DisplayLabel = #26631#31614#20195#30721
      FieldName = 'pack_number'
      Size = 10
    end
    object ADS698EMPLOYEE_NAME: TStringField
      DisplayLabel = #21019#24314#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADS698v_date: TDateTimeField
      DisplayLabel = #21019#24314#26085#26399
      FieldName = 'v_date'
    end
    object ADS698v_print: TBooleanField
      DisplayLabel = #26159#21542#21015#21360
      FieldName = 'v_print'
    end
    object ADS698pack_item: TIntegerField
      DisplayLabel = #25171#21360#25968#30446
      FieldName = 'pack_item'
    end
    object ADS698MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADS698MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADS698ANALYSIS_CODE_2: TStringField
      DisplayLabel = #23458#25143#29289#26009#21495
      FieldName = 'ANALYSIS_CODE_2'
      Size = 50
    end
    object ADS698PO_NUMBER: TStringField
      DisplayLabel = #23458#25143#35746#21333#21495
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ADS698code: TStringField
      DisplayLabel = #20195#30721
      FieldName = 'code'
      Size = 15
    end
    object ADS698lotno: TStringField
      DisplayLabel = #25209#27425
      FieldName = 'lotno'
      Size = 10
    end
    object ADS698notes: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'notes'
      Size = 50
    end
    object ADS698qty: TIntegerField
      DisplayLabel = #25968#37327
      FieldName = 'qty'
    end
    object ADS698description: TStringField
      DisplayLabel = #25551#36848
      FieldName = 'description'
      Size = 50
    end
    object ADS698SALES_ORDER: TStringField
      DisplayLabel = #38144#21806#35746#21333#21495
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ADS698rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADS698so_ptr: TIntegerField
      FieldName = 'so_ptr'
    end
    object ADS698CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADS698ABBR_NAME: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADS698type: TStringField
      DisplayLabel = #31867#22411
      FieldName = 'type'
      Size = 4
    end
  end
  object DataSource1: TDataSource
    DataSet = ADS698
    Left = 56
    Top = 112
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 192
    Top = 48
  end
  object ado04: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select SEED_VALUE,SEED_FLAG from data0004'
      'where rkey=74')
    Left = 189
    Top = 109
    object ado04SEED_VALUE: TStringField
      FieldName = 'SEED_VALUE'
    end
    object ado04SEED_FLAG: TWordField
      FieldName = 'SEED_FLAG'
    end
  end
end
