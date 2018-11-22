object DM: TDM
  OldCreateOrder = False
  Left = 788
  Top = 288
  Height = 310
  Width = 315
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 8
  end
  object ADS209: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.Data0235.goods_name, dbo.Data0235.goods_guige, db' +
      'o.Data0235.goods_type, dbo.Data0023.ABBR_NAME, Data0023.code as ' +
      'code23,'#13#10'                  dbo.Data0235.quan_to_ship, dbo.Data02' +
      '09.QUANTITY, dbo.Data0002.UNIT_NAME, dbo.Data0209.TDATE, '#13#10'     ' +
      '             dbo.Data0005.EMPLOYEE_NAME AS Expr1, dbo.Data0209.r' +
      'emark, dbo.Data0209.shipping_method, '#13#10'                  dbo.Dat' +
      'a0209.tran_date,case dbo.Data0209.status when '#39'1'#39' then '#39#24050#35013#36816#39' whe' +
      'n '#39'0'#39' then '#39#26410#35013#36816#39' end  as '#39'v_state'#39','#13#10'                  dbo.Data0' +
      '015.ABBR_NAME,dbo.Data0016.LOCATION, tran_by.EMPLOYEE_NAME, dbo.' +
      'Data0076.CODE,'#13#10'                  dbo.Data0076.REJECT_DESCRIPTIO' +
      'N,data0209.Rkey,Data0235.quan_returned,Data0235.QUAN_RECD,'#13#10'    ' +
      '              Data0072.QUAN_RETN,Data0235.D0072_PTR,Data0235.RKE' +
      'Y as Rkey235, Data0235.unit_price,Data0456.exch_rate,'#13#10'         ' +
      '         Data0235.state_tax,Data0209.QUANTITY*Data0235.unit_pric' +
      'e as sum_price ,Data0001.CURR_NAME,data0070.PO_NUMBER'#13#10'FROM     ' +
      '    dbo.Data0209 INNER JOIN'#13#10'             dbo.Data0235 ON dbo.Da' +
      'ta0209.SRCE_PTR = dbo.Data0235.RKEY INNER JOIN'#13#10'             dbo' +
      '.Data0005 ON dbo.Data0209.EMPL_PTR = dbo.Data0005.RKEY left JOIN' +
      #13#10'             dbo.Data0005 AS tran_by ON dbo.Data0209.tran_by_u' +
      'serptr = tran_by.RKEY INNER JOIN'#13#10'             dbo.Data0076 ON d' +
      'bo.Data0209.GL_HDR_PTR = dbo.Data0076.RKEY INNER JOIN'#13#10'         ' +
      '    dbo.Data0002 ON dbo.Data0235.unit_ptr = dbo.Data0002.RKEY IN' +
      'NER JOIN'#13#10'             dbo.Data0456 ON dbo.Data0235.GRN_PTR = db' +
      'o.Data0456.RKEY INNER JOIN'#13#10'             dbo.Data0016 ON dbo.Dat' +
      'a0235.location_ptr = dbo.Data0016.RKEY INNER JOIN'#13#10'             ' +
      'dbo.Data0015 ON dbo.Data0456.warehouse_ptr = dbo.Data0015.RKEY I' +
      'NNER JOIN'#13#10'             dbo.Data0023 ON dbo.Data0456.SUPP_PTR = ' +
      'dbo.Data0023.RKEY  INNER JOIN'#13#10'             Data0072  ON     Dat' +
      'a0072.RKEY = Data0235.D0072_PTR inner join'#13#10'             data000' +
      '1  ON Data0001.RKEY = Data0456.currency_ptr left join'#13#10'         ' +
      '    data0070  on data0070.rkey=data0456.PO_PTR'#13#10'where    1=1'
    IndexFieldNames = 'goods_name'
    Parameters = <>
    Left = 96
    Top = 64
    object ADS209goods_name: TStringField
      FieldName = 'goods_name'
      Size = 60
    end
    object ADS209goods_guige: TStringField
      FieldName = 'goods_guige'
      Size = 200
    end
    object ADS209goods_type: TStringField
      FieldName = 'goods_type'
    end
    object ADS209ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object ADS209quan_to_ship: TFloatField
      FieldName = 'quan_to_ship'
    end
    object ADS209QUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
    object ADS209UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object ADS209TDATE: TDateTimeField
      FieldName = 'TDATE'
    end
    object ADS209Expr1: TStringField
      FieldName = 'Expr1'
      Size = 16
    end
    object ADS209remark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
    object ADS209shipping_method: TWideStringField
      FieldName = 'shipping_method'
    end
    object ADS209tran_date: TDateTimeField
      FieldName = 'tran_date'
    end
    object ADS209v_state: TStringField
      FieldName = 'v_state'
      ReadOnly = True
      Size = 6
    end
    object ADS209EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADS209CODE: TStringField
      FieldName = 'CODE'
      Size = 5
    end
    object ADS209REJECT_DESCRIPTION: TStringField
      FieldName = 'REJECT_DESCRIPTION'
      Size = 30
    end
    object ADS209Rkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object ADS209ABBR_NAME_1: TStringField
      FieldName = 'ABBR_NAME_1'
      Size = 10
    end
    object ADS209LOCATION: TStringField
      FieldName = 'LOCATION'
    end
    object ADS209quan_returned: TFloatField
      FieldName = 'quan_returned'
    end
    object ADS209QUAN_RECD: TBCDField
      FieldName = 'QUAN_RECD'
      Precision = 10
      Size = 3
    end
    object ADS209QUAN_RETN: TFloatField
      FieldName = 'QUAN_RETN'
    end
    object ADS209D0072_PTR: TIntegerField
      FieldName = 'D0072_PTR'
    end
    object ADS209Rkey235: TIntegerField
      FieldName = 'Rkey235'
      ReadOnly = True
    end
    object ADS209unit_price: TBCDField
      FieldName = 'unit_price'
      Precision = 10
      Size = 3
    end
    object ADS209state_tax: TBCDField
      FieldName = 'state_tax'
      Precision = 4
      Size = 2
    end
    object ADS209CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object ADS209exch_rate: TBCDField
      FieldName = 'exch_rate'
      Precision = 12
      Size = 8
    end
    object ADS209sum_price: TFloatField
      FieldName = 'sum_price'
      ReadOnly = True
    end
    object ADS209PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#35746#21333#21495
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object ADS209code23: TStringField
      FieldName = 'code23'
      Size = 10
    end
  end
  object DataSource1: TDataSource
    DataSet = ADS209
    Left = 32
    Top = 72
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 88
    Top = 136
  end
end
