object DM: TDM
  OldCreateOrder = False
  Left = 344
  Top = 189
  Height = 334
  Width = 246
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 8
  end
  object ADS235: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT       dbo.Data0235.goods_name, dbo.Data0235.goods_guige, ' +
      'dbo.Data0235.goods_type, dbo.Data0015.ABBR_NAME,'#13#10'              ' +
      '      dbo.Data0016.LOCATION, dbo.Data0235.QUAN_RECD,dbo.Data0235' +
      '.QUAN_ON_HAND, dbo.Data0235.quan_to_ship, '#13#10'                    ' +
      'dbo.Data0235.quan_returned, dbo.Data0002.UNIT_NAME,dbo.Data0456.' +
      'ship_DATE ,dbo.Data0235.REF_NUMBER,'#13#10'                    dbo.Dat' +
      'a0023.CODE, dbo.Data0023.SUPPLIER_NAME,  dbo.Data0070.PO_NUMBER,' +
      #13#10'                    dbo.Data0070.CONFIRMATION_NUMBER,  dbo.Dat' +
      'a0070.PO_DATE,  dbo.Data0456.GRN_NUMBER, '#13#10'                   db' +
      'o.Data0015.WAREHOUSE_CODE , Data0235.D0072_PTR,dbo.Data0235.RKEY' +
      ',dbo.Data0072.DESCRIPTION2'#13#10'FROM         dbo.Data0456 INNER JOIN' +
      #13#10'                   dbo.Data0235 ON dbo.Data0456.RKEY = dbo.Dat' +
      'a0235.GRN_PTR INNER JOIN'#13#10'                   dbo.Data0070 ON dbo' +
      '.Data0456.PO_PTR = dbo.Data0070.RKEY INNER JOIN'#13#10'               ' +
      '    dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY IN' +
      'NER JOIN'#13#10'                   dbo.Data0002 ON dbo.Data0235.unit_p' +
      'tr = dbo.Data0002.RKEY INNER JOIN'#13#10'                   dbo.Data00' +
      '16 ON dbo.Data0235.location_ptr = dbo.Data0016.RKEY INNER JOIN'#13#10 +
      '                   dbo.Data0015 ON dbo.Data0456.warehouse_ptr = ' +
      'dbo.Data0015.RKEY INNER JOIN'#13#10'                   dbo.Data0072 ON' +
      ' dbo.Data0235.D0072_PTR = dbo.Data0072.RKEY '#13#10'WHERE      dbo.Dat' +
      'a0070.STATUS IN (5, 6, 7) '
    IndexFieldNames = 'goods_name'
    Parameters = <>
    Left = 80
    Top = 64
    object ADS235goods_name: TStringField
      FieldName = 'goods_name'
      Size = 60
    end
    object ADS235goods_guige: TStringField
      FieldName = 'goods_guige'
      Size = 200
    end
    object ADS235goods_type: TStringField
      FieldName = 'goods_type'
    end
    object ADS235ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADS235LOCATION: TStringField
      FieldName = 'LOCATION'
    end
    object ADS235QUAN_RECD: TBCDField
      FieldName = 'QUAN_RECD'
      Precision = 10
      Size = 3
    end
    object ADS235QUAN_ON_HAND: TBCDField
      FieldName = 'QUAN_ON_HAND'
      Precision = 10
      Size = 3
    end
    object ADS235quan_to_ship: TFloatField
      FieldName = 'quan_to_ship'
    end
    object ADS235quan_returned: TFloatField
      FieldName = 'quan_returned'
    end
    object ADS235UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object ADS235ship_DATE: TDateTimeField
      FieldName = 'ship_DATE'
    end
    object ADS235REF_NUMBER: TStringField
      FieldName = 'REF_NUMBER'
      FixedChar = True
      Size = 15
    end
    object ADS235CODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object ADS235SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object ADS235PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object ADS235CONFIRMATION_NUMBER: TStringField
      FieldName = 'CONFIRMATION_NUMBER'
    end
    object ADS235PO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object ADS235GRN_NUMBER: TStringField
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object ADS235WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ADS235RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADS235DESCRIPTION2: TStringField
      FieldName = 'DESCRIPTION2'
      FixedChar = True
    end
    object ADS235D0072_PTR: TIntegerField
      FieldName = 'D0072_PTR'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADS235
    Left = 16
    Top = 64
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 128
    Top = 64
  end
  object Ado849s: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from data0849 where RKey is Null')
    Left = 7
    Top = 155
    object Ado849sRkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object Ado849sD419_ptr: TIntegerField
      FieldName = 'D419_ptr'
    end
    object Ado849sD073_ptr: TIntegerField
      FieldName = 'D073_ptr'
    end
    object Ado849sFormName: TStringField
      FieldName = 'FormName'
      Size = 50
    end
    object Ado849sGridName: TStringField
      FieldName = 'GridName'
      Size = 50
    end
    object Ado849sFieldName: TStringField
      FieldName = 'FieldName'
      Size = 50
    end
    object Ado849sFieldCaption: TStringField
      FieldName = 'FieldCaption'
      Size = 100
    end
    object Ado849sFieldOrder: TIntegerField
      FieldName = 'FieldOrder'
    end
    object Ado849sFieldWidth: TIntegerField
      FieldName = 'FieldWidth'
    end
    object Ado849sIsDisplay: TBooleanField
      FieldName = 'IsDisplay'
    end
  end
  object Ado0849: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'D419_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'D073_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select CAST(0 AS bit) AS Sel, data0849.* from data0849 '
      'where D419_ptr=:D419_ptr and D073_ptr=:D073_ptr')
    Left = 70
    Top = 147
    object Ado0849Sel: TBooleanField
      FieldName = 'Sel'
    end
    object Ado0849Rkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object Ado0849D419_ptr: TIntegerField
      FieldName = 'D419_ptr'
    end
    object Ado0849D073_ptr: TIntegerField
      FieldName = 'D073_ptr'
    end
    object Ado0849FormName: TStringField
      FieldName = 'FormName'
      Size = 50
    end
    object Ado0849GridName: TStringField
      FieldName = 'GridName'
      Size = 50
    end
    object Ado0849FieldName: TStringField
      FieldName = 'FieldName'
      Size = 50
    end
    object Ado0849FieldCaption: TStringField
      FieldName = 'FieldCaption'
      Size = 100
    end
    object Ado0849FieldOrder: TIntegerField
      FieldName = 'FieldOrder'
    end
    object Ado0849FieldWidth: TIntegerField
      FieldName = 'FieldWidth'
    end
    object Ado0849IsDisplay: TBooleanField
      FieldName = 'IsDisplay'
    end
  end
  object DSP2: TDataSetProvider
    DataSet = Ado0849
    Left = 126
    Top = 147
  end
  object CDS2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 166
    Top = 147
  end
end
