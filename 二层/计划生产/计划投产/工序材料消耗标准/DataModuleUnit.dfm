object DM: TDM
  OldCreateOrder = False
  Left = 389
  Top = 198
  Height = 381
  Width = 399
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 44
    Top = 18
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    AfterScroll = ADOQuery1AfterScroll
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     dbo.DATA0136.rkey, dbo.DATA0136.group_id, dbo.Data001' +
        '5.WAREHOUSE_NAME, dbo.Data0015.WAREHOUSE_CODE, dbo.Data0015.ABBR' +
        '_NAME, '
      
        '                      dbo.DATA0136.stan_consume, dbo.DATA0136.wa' +
        'rehouse_ptr, dbo.DATA0136.control_name, dbo.DATA0136.unit_ptr, d' +
        'bo.DATA0136.Important_mtl, '
      
        '                      dbo.DATA0136.Prod_Area_Type, dbo.DATA0136.' +
        'Depletion, dbo.DATA0136.Depth, dbo.DATA0136.Plating, dbo.DATA013' +
        '6.Density, dbo.DATA0136.Formula, '
      
        '                      dbo.DATA0136.Formula_Result, dbo.DATA0136.' +
        'Mtl_Type'
      'FROM         dbo.Data0015 INNER JOIN'
      
        '                      dbo.DATA0136 ON dbo.Data0015.RKEY = dbo.DA' +
        'TA0136.warehouse_ptr'
      'WHERE     (1 = 1)')
    Left = 134
    Top = 24
    object ADOQuery1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery1warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object ADOQuery1WAREHOUSE_CODE: TStringField
      DisplayLabel = #24037#21378#20195#30721
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ADOQuery1WAREHOUSE_NAME: TStringField
      DisplayLabel = #24037#21378#21517#31216
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
    object ADOQuery1ABBR_NAME: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOQuery1stan_consume: TBCDField
      DisplayLabel = #26631#20934#20135#20986'('#13217')'
      FieldName = 'stan_consume'
      Precision = 8
      Size = 2
    end
    object ADOQuery1control_name: TStringField
      FieldName = 'control_name'
      Size = 50
    end
    object ADOQuery1unit_ptr: TIntegerField
      FieldName = 'unit_ptr'
    end
    object smlntfldADOQuery1group_id: TSmallintField
      FieldName = 'group_id'
    end
    object ADOQuery1Important_mtl: TWordField
      FieldName = 'Important_mtl'
    end
    object ADOQuery1Prod_Area_Type: TWordField
      FieldName = 'Prod_Area_Type'
    end
    object ADOQuery1Depletion: TFloatField
      FieldName = 'Depletion'
    end
    object ADOQuery1Depth: TFloatField
      FieldName = 'Depth'
    end
    object ADOQuery1Plating: TFloatField
      FieldName = 'Plating'
    end
    object ADOQuery1Density: TFloatField
      FieldName = 'Density'
    end
    object ADOQuery1Formula: TStringField
      FieldName = 'Formula'
      Size = 200
    end
    object ADOQuery1Formula_Result: TFloatField
      FieldName = 'Formula_Result'
    end
    object ADOQuery1Mtl_Type: TWordField
      FieldName = 'Mtl_Type'
    end
  end
  object aqry136: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'SELECT     *'
      'FROM         dbo.DATA0136'
      'where rkey = :rkey')
    Left = 114
    Top = 74
    object aqry136rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object aqry136warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object aqry136stan_consume: TBCDField
      FieldName = 'stan_consume'
      Precision = 8
      Size = 2
    end
    object aqry136control_name: TStringField
      FieldName = 'control_name'
      Size = 50
    end
    object aqry136unit_ptr: TIntegerField
      FieldName = 'unit_ptr'
    end
    object smlntfldaqry136group_id: TSmallintField
      FieldName = 'group_id'
    end
    object aqry136Important_mtl: TWordField
      FieldName = 'Important_mtl'
    end
    object aqry136Prod_Area_Type: TWordField
      FieldName = 'Prod_Area_Type'
    end
    object aqry136Depletion: TFloatField
      FieldName = 'Depletion'
    end
    object aqry136Plating: TFloatField
      FieldName = 'Plating'
    end
    object aqry136Depth: TFloatField
      FieldName = 'Depth'
    end
    object aqry136Density: TFloatField
      FieldName = 'Density'
    end
    object aqry136Formula: TStringField
      FieldName = 'Formula'
      Size = 200
    end
    object aqry136Formula_Result: TFloatField
      FieldName = 'Formula_Result'
    end
    object aqry136Mtl_Type: TWordField
      FieldName = 'Mtl_Type'
    end
  end
  object ADO73: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT Data0073.RKEY, Data0073.USER_LOGIN_NAME AS user_id, Data0' +
        '073.USER_FULL_NAME, Data0005.PHONE'
      'FROM   Data0073 INNER JOIN'
      
        '       Data0005 ON Data0073.EMPLOYEE_PTR = Data0005.RKEY AND Dat' +
        'a0073.EMPLOYEE_PTR = Data0005.RKEY'
      
        'WHERE  (Data0073.USER_GROUP_FLAG = 1) AND (Data0073.ACTIVE_FLAG ' +
        '= 0)'
      'ORDER BY Data0073.USER_LOGIN_NAME')
    Left = 44
    Top = 74
    object ADO73user_id: TStringField
      DisplayLabel = #25805#20316#21592#20195#30721
      FieldName = 'user_id'
      Size = 15
    end
    object ADO73user_full_name: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'user_full_name'
      Size = 30
    end
    object ADO73rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO73PHONE: TStringField
      DisplayLabel = #30005#35805#21495#30721
      FieldName = 'PHONE'
      Size = 14
    end
  end
  object ADO139: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey136'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select  * from data0139 where rkey136=:rkey136')
    Left = 216
    Top = 28
    object ADO139rkey136: TIntegerField
      FieldName = 'rkey136'
    end
    object ADO139csi_ptr: TIntegerField
      FieldName = 'csi_ptr'
    end
  end
  object ADO139_1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey136'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.Data0073.RKEY, dbo.Data0005.PHONE, dbo.Data0005.E' +
        'MPL_CODE, dbo.DATA0139.rkey136, dbo.DATA0139.csi_ptr, '
      
        '                      dbo.Data0073.USER_FULL_NAME, dbo.Data0073.' +
        'USER_LOGIN_NAME'
      'FROM         dbo.DATA0139 INNER JOIN'
      
        '                      dbo.Data0073 ON dbo.DATA0139.csi_ptr = dbo' +
        '.Data0073.RKEY INNER JOIN'
      
        '                      dbo.Data0005 ON dbo.Data0073.EMPLOYEE_PTR ' +
        '= dbo.Data0005.RKEY AND dbo.Data0073.EMPLOYEE_PTR = dbo.Data0005' +
        '.RKEY'
      'WHERE DATA0139.rkey136=:rkey136')
    Left = 326
    Top = 26
    object ADO139_1USER_LOGIN_NAME: TStringField
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
    object ADO139_1USER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object ADO139_1RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO139_1PHONE: TStringField
      FieldName = 'PHONE'
      Size = 14
    end
    object ADO139_1EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object ADO139_1rkey136: TIntegerField
      FieldName = 'rkey136'
    end
    object ADO139_1csi_ptr: TIntegerField
      FieldName = 'csi_ptr'
    end
  end
  object ADO017: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT      dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER, dbo' +
        '.Data0017.INV_PART_DESCRIPTION, dbo.Data0002.UNIT_NAME, '
      '                  dbo.Data0002.RKEY AS Rkey02'
      'FROM         dbo.Data0017 INNER JOIN'
      
        '                      dbo.Data0002 ON dbo.Data0017.STOCK_UNIT_PT' +
        'R = dbo.Data0002.RKEY'
      'ORDER BY dbo.Data0017.INV_PART_NUMBER')
    Left = 44
    Top = 122
    object ADO017RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO017INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADO017INV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object ADO017UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object ADO017Rkey02: TAutoIncField
      FieldName = 'Rkey02'
      ReadOnly = True
    end
  end
  object ADO034: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT RKEY, DEPT_CODE, DEPT_NAME, TTYPE, ACTIVE_FLAG, IS_COST_D' +
        'EPT'
      ' FROM dbo.Data0034 '
      'WHERE (TTYPE = 1) AND (ACTIVE_FLAG = 0) ')
    Left = 116
    Top = 122
    object ADO034RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO034DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADO034DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADO034TTYPE: TStringField
      FieldName = 'TTYPE'
      Size = 1
    end
    object ADO034ACTIVE_FLAG: TWordField
      FieldName = 'ACTIVE_FLAG'
    end
    object ADO034IS_COST_DEPT: TWordField
      FieldName = 'IS_COST_DEPT'
    end
  end
  object ADO154: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
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
      'SELECT     control_ptr, invt_ptr'
      'FROM         dbo.DATA0155'
      'WHERE control_ptr= :rkey017')
    Left = 48
    Top = 180
    object ADO154control_ptr: TIntegerField
      FieldName = 'control_ptr'
    end
    object ADO154invt_ptr: TIntegerField
      FieldName = 'invt_ptr'
    end
  end
  object ADO155: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
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
      'SELECT     control_ptr, dept_ptr'
      'FROM         dbo.DATA0154'
      'WHERE control_ptr= :rkey034')
    Left = 120
    Top = 180
    object ADO155control_ptr: TIntegerField
      FieldName = 'control_ptr'
    end
    object ADO155dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
  end
  object ADO154_1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    DataSource = ds1
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
    Top = 236
    object ADO154_1control_ptr: TIntegerField
      FieldName = 'control_ptr'
    end
    object ADO154_1invt_ptr: TIntegerField
      FieldName = 'invt_ptr'
    end
    object ADO154_1INV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ADO154_1UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object ADO154_1INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADO154_1Rkey02: TAutoIncField
      FieldName = 'Rkey02'
      ReadOnly = True
    end
  end
  object ADO155_1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    DataSource = ds1
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
    Top = 236
    object ADO155_1control_ptr: TIntegerField
      FieldName = 'control_ptr'
    end
    object ADO155_1dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object ADO155_1DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADO155_1DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
  end
  object DataSource2: TDataSource
    DataSet = ADO155_1
    Left = 124
    Top = 291
  end
  object DataSource3: TDataSource
    DataSet = ADO154_1
    Left = 52
    Top = 291
  end
  object DataSource1: TDataSource
    DataSet = ADO139_1
    Left = 324
    Top = 91
  end
  object ds1: TDataSource
    DataSet = ADOQuery1
    Left = 196
    Top = 91
  end
end
