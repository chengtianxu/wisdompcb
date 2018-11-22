object dm: Tdm
  OldCreateOrder = False
  Left = 699
  Top = 272
  Height = 359
  Width = 280
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = AQ16
    Left = 104
    Top = 88
  end
  object AQ04: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select seed_value,seed_flag from data0004 where rkey=20')
    Left = 48
    Top = 192
    object AQ04seed_value: TStringField
      FieldName = 'seed_value'
    end
    object AQ04seed_flag: TWordField
      FieldName = 'seed_flag'
    end
  end
  object temp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 176
    Top = 40
  end
  object AQ16: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnPostError = AQ16PostError
    Parameters = <>
    SQL.Strings = (
      
        'select dbo.data0016.rkey,dbo.data0016.code,dbo.data0016.location' +
        ','
      
        'dbo.data0016.location_type,dbo.data0016.whouse_ptr,dbo.data0015.' +
        'warehouse_code,dbo.data0015.warehouse_name,dbo.data0015.abbr_nam' +
        'e,'
      
        'case dbo.data0016.location_type when 0 then '#39#26448#26009#20179#39' when 1 then '#39#25104 +
        #21697#20179#39' end as type,data0016.RelationOrder'
      'from dbo.data0016,dbo.data0015'
      'where dbo.data0016.whouse_ptr=dbo.data0015.rkey'
      '')
    Left = 40
    Top = 88
    object AQ16rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object AQ16code: TStringField
      FieldName = 'code'
      Size = 10
    end
    object AQ16location: TStringField
      FieldName = 'location'
    end
    object AQ16location_type: TWordField
      FieldName = 'location_type'
    end
    object AQ16whouse_ptr: TIntegerField
      FieldName = 'whouse_ptr'
    end
    object AQ16RelationOrder: TBooleanField
      FieldName = 'RelationOrder'
    end
    object AQ16warehouse_code: TStringField
      FieldName = 'warehouse_code'
      Size = 5
    end
    object AQ16warehouse_name: TStringField
      FieldName = 'warehouse_name'
      Size = 70
    end
    object AQ16abbr_name: TStringField
      FieldName = 'abbr_name'
      Size = 10
    end
    object AQ16type: TStringField
      FieldName = 'type'
      ReadOnly = True
      Size = 6
    end
  end
end
