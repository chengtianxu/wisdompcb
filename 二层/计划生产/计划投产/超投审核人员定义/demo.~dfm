object DM: TDM
  OldCreateOrder = False
  Left = 521
  Top = 303
  Height = 263
  Width = 292
  object con1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 45
    Top = 57
  end
  object ads616: TADODataSet
    Connection = con1
    CursorType = ctStatic
    CommandText = 
      'select'#13#10'dbo.DATA0616.rkey73,'#13#10'dbo.Data0015.RKEY, '#13#10'case dbo.Data' +
      '0616.ct_TYPE when 0 then '#39#35746#21333#36229#25237#39' when 1 then '#39#34917#26009#36229#25237#39'end ct_TYPE1,d' +
      'bo.Data0616.ct_TYPE,'#13#10'data0015.warehouse_code,dbo.Data0015.ABBR_' +
      'NAME,'#13#10'dbo.Data0073.USER_LOGIN_NAME,dbo.Data0073.USER_FULL_NAME,' +
      #13#10'case dbo.Data0616.ttype when 0 then '#39#37327#26495#39' when 1 then '#39#26679#26495#39'end t' +
      'type1,dbo.Data0616.ttype, data0616.warehouse_ptr,'#13#10'dbo.Data0616.' +
      'seq_no,dbo.Data0616.ct_area'#13#10#13#10'from DATA0616'#13#10'INNER JOIN'#13#10'  dbo.' +
      'Data0073 ON dbo.DATA0616.rkey73 = dbo.Data0073.RKEY '#13#10'INNER JOIN' +
      #13#10'  dbo.Data0015 ON dbo.DATA0616.warehouse_ptr = dbo.Data0015.RK' +
      'EY'#13#10'where 1=1'
    IndexFieldNames = 'warehouse_code'
    Parameters = <>
    Left = 119
    Top = 56
    object strngfldads1strngfldds1ct_TYPE1: TStringField
      FieldName = 'ct_TYPE1'
      ReadOnly = True
      Size = 8
    end
    object wrdfldads1wrdfldds1ct_TYPE: TWordField
      FieldName = 'ct_TYPE'
    end
    object strngfldads1strngfldds1warehouse_code: TStringField
      FieldName = 'warehouse_code'
      Size = 5
    end
    object strngfldads1strngfldds1ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object strngfldads1strngfldds1USER_LOGIN_NAME: TStringField
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
    object strngfldads1strngfldds1USER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object strngfldads1strngfldds1ttype1: TStringField
      FieldName = 'ttype1'
      ReadOnly = True
      Size = 4
    end
    object wrdfldads1wrdfldds1ttype: TWordField
      FieldName = 'ttype'
    end
    object intgrfldads1intgrfldds1seq_no: TIntegerField
      FieldName = 'seq_no'
    end
    object bcdfldads1bcdfldds1ct_area: TBCDField
      FieldName = 'ct_area'
      Precision = 12
    end
    object intgrfldads1rkey73: TIntegerField
      FieldName = 'rkey73'
    end
    object atncfldads1RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object intgrfldads1warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
  end
  object ds1: TDataSource
    DataSet = ads616
    Left = 187
    Top = 60
  end
  object qry616: TADOQuery
    Connection = con1
    Parameters = <
      item
        Name = 'ct_TYPE'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end
      item
        Name = 'rkey73'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'warehouse_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ttype'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end>
    SQL.Strings = (
      'select  warehouse_ptr,ttype,ct_TYPE,seq_no,rkey73,ct_area'
      
        'from DATA0616  where ct_TYPE= :ct_TYPE and rkey73= :rkey73 and w' +
        'arehouse_ptr = :warehouse_ptr and ttype= :ttype')
    Left = 122
    Top = 116
    object intgrfldqry1warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object wrdfldqry1ttype: TWordField
      FieldName = 'ttype'
    end
    object wrdfldqry1ct_TYPE: TWordField
      FieldName = 'ct_TYPE'
    end
    object intgrfldqry1seq_no: TIntegerField
      FieldName = 'seq_no'
    end
    object intgrfldqry1rkey73: TIntegerField
      FieldName = 'rkey73'
    end
    object bcdfldqry1ct_area: TBCDField
      FieldName = 'ct_area'
      Precision = 12
    end
  end
end
