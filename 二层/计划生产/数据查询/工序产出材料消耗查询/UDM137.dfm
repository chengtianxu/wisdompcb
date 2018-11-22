object DM: TDM
  OldCreateOrder = False
  Left = 382
  Top = 186
  Height = 500
  Width = 347
  object DataSource1: TDataSource
    DataSet = ADO137
    Left = 184
    Top = 32
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=62ddf8f60269678;Persist Security In' +
      'fo=True;User ID=WZPCBConnect;Initial Catalog=sj_v20_live;Data So' +
      'urce=172.16.0.8'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 32
  end
  object ADO137: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    Left = 120
    Top = 32
    object ADO137curr_date: TDateTimeField
      FieldName = 'curr_date'
    end
    object ADO137avlage_area: TBCDField
      FieldName = 'avlage_area'
      Precision = 8
      Size = 2
    end
    object ADO137total_takeout: TBCDField
      FieldName = 'total_takeout'
      Precision = 8
      Size = 2
    end
    object ADO137avlage_consume: TBCDField
      FieldName = 'avlage_consume'
      Precision = 8
      Size = 2
    end
    object ADO137actual_consume: TBCDField
      FieldName = 'actual_consume'
      ReadOnly = True
      Precision = 19
      Size = 11
    end
    object ADO137diff: TBCDField
      FieldName = 'diff'
      ReadOnly = True
      Precision = 20
      Size = 11
    end
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    Left = 48
    Top = 88
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 120
    Top = 88
  end
  object ADO155_1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    DataSource = DataSource4
    Parameters = <
      item
        Name = 'rkey017'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.DATA0155.control_ptr, dbo.DATA0155.invt_ptr, dbo.' +
        'Data0017.INV_NAME, dbo.Data0002.UNIT_NAME,dbo.Data0002.RKEY AS R' +
        'key02,'
      '                dbo.Data0017.INV_PART_NUMBER'
      'FROM         dbo.DATA0155 INNER JOIN'
      
        '                      dbo.Data0017 ON dbo.DATA0155.invt_ptr = db' +
        'o.Data0017.RKEY INNER JOIN'
      
        '                      dbo.Data0002 ON dbo.Data0017.PURCH_UNIT_PT' +
        'R = dbo.Data0002.RKEY AND dbo.Data0017.STOCK_UNIT_PTR = dbo.Data' +
        '0002.RKEY'
      'WHERE control_ptr= :rkey017')
    Left = 48
    Top = 148
    object ADO155_1control_ptr: TIntegerField
      FieldName = 'control_ptr'
    end
    object ADO155_1invt_ptr: TIntegerField
      FieldName = 'invt_ptr'
    end
    object ADO155_1INV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ADO155_1UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object ADO155_1INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADO155_1Rkey02: TAutoIncField
      FieldName = 'Rkey02'
      ReadOnly = True
    end
  end
  object ADO154_1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    DataSource = DataSource4
    Parameters = <
      item
        Name = 'rkey034'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.DATA0154.control_ptr, dbo.DATA0154.dept_ptr, dbo.' +
        'Data0034.DEPT_CODE, dbo.Data0034.DEPT_NAME'
      'FROM         dbo.DATA0154 INNER JOIN'
      
        '                      dbo.Data0034 ON dbo.DATA0154.dept_ptr = db' +
        'o.Data0034.RKEY'
      'WHERE control_ptr= :rkey034')
    Left = 120
    Top = 148
    object ADO154_1control_ptr: TIntegerField
      FieldName = 'control_ptr'
    end
    object ADO154_1dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object ADO154_1DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADO154_1DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
  end
  object DataSource2: TDataSource
    DataSet = ADO154_1
    Left = 124
    Top = 203
  end
  object DataSource3: TDataSource
    DataSet = ADO155_1
    Left = 52
    Top = 203
  end
  object ADO136: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    AfterScroll = ADO136AfterScroll
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey0136'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT      dbo.DATA0136.rkey, dbo.Data0015.WAREHOUSE_NAME, dbo.' +
        'Data0015.WAREHOUSE_CODE, dbo.Data0015.ABBR_NAME, '
      
        '                      dbo.DATA0136.stan_consume, dbo.DATA0136.wa' +
        'rehouse_ptr, dbo.DATA0136.control_name, dbo.DATA0136.unit_ptr'
      'FROM         dbo.Data0015 INNER JOIN'
      
        '                      dbo.DATA0136 ON dbo.Data0015.RKEY = dbo.DA' +
        'TA0136.warehouse_ptr'
      'WHERE dbo.DATA0136.rkey= :rkey0136')
    Left = 54
    Top = 272
    object ADO136rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO136warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object ADO136WAREHOUSE_CODE: TStringField
      DisplayLabel = #24037#21378#20195#30721
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ADO136WAREHOUSE_NAME: TStringField
      DisplayLabel = #24037#21378#21517#31216
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
    object ADO136ABBR_NAME: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADO136stan_consume: TBCDField
      DisplayLabel = #26631#20934#20135#20986'('#13217')'
      FieldName = 'stan_consume'
      Precision = 8
      Size = 2
    end
    object ADO136control_name: TStringField
      FieldName = 'control_name'
      Size = 50
    end
    object ADO136unit_ptr: TIntegerField
      FieldName = 'unit_ptr'
    end
  end
  object DataSource4: TDataSource
    DataSet = ADO136
    Left = 124
    Top = 267
  end
end
