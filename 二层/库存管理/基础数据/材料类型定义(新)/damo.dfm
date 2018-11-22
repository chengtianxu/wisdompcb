object DM: TDM
  OldCreateOrder = False
  Left = 845
  Top = 258
  Height = 330
  Width = 335
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 12
  end
  object DataSource1: TDataSource
    DataSet = ADO496
    Left = 48
    Top = 65
  end
  object ADO499: TADOQuery
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
      'select * from data0499'
      'where inv_group_ptr=:rkey'
      'order by seq_no')
    Left = 112
    Top = 121
    object ADO499RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO499INV_GROUP_PTR: TIntegerField
      FieldName = 'INV_GROUP_PTR'
    end
    object ADO499PARAMETER_PTR: TIntegerField
      FieldName = 'PARAMETER_PTR'
    end
    object ADO499DEF_VALUE: TStringField
      FieldName = 'DEF_VALUE'
    end
    object ADO499SEQ_NO: TSmallintField
      FieldName = 'SEQ_NO'
    end
    object ADO499ttype: TWordField
      FieldName = 'ttype'
    end
  end
  object aq278: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    DataSource = DataSource2
    Parameters = <
      item
        Name = 'parameter_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select rkey,PARAMETER_NAME,PARAMETER_DESC from data0278'
      'where rkey=:parameter_ptr')
    Left = 164
    Top = 121
    object aq278rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object aq278PARAMETER_NAME: TStringField
      FieldName = 'PARAMETER_NAME'
      FixedChar = True
      Size = 10
    end
    object aq278PARAMETER_DESC: TStringField
      FieldName = 'PARAMETER_DESC'
      FixedChar = True
    end
  end
  object DataSource2: TDataSource
    DataSet = ADO499
    Left = 48
    Top = 124
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'group_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = 15
      end>
    SQL.Strings = (
      'select * from data0019'
      'where rkey=:group_ptr')
    Left = 172
    Top = 65
    object ADOQuery1rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery1inv_group_name: TStringField
      FieldName = 'inv_group_name'
    end
    object ADOQuery1inv_group_desc: TStringField
      FieldName = 'inv_group_desc'
      Size = 40
    end
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'gl_acct_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT'
      '      Data0103.GL_ACC_NUMBER, '
      '           ISNULL(Data0103_1.GL_DESCRIPTION, '#39#39')'
      '      +'#39'-'#39'+ Data0103.GL_DESCRIPTION AS description_2,'
      '      Data0103_2.GL_DESCRIPTION'
      'FROM dbo.Data0103 Data0103_2 RIGHT OUTER JOIN'
      '      dbo.Data0103 Data0103_1 ON '
      '      Data0103_2.RKEY = Data0103_1.PARENT_PTR RIGHT OUTER JOIN'
      '      dbo.Data0103 ON Data0103_1.RKEY = dbo.Data0103.PARENT_PTR'
      'where data0103.rkey = :gl_acct_ptr')
    Left = 168
    Top = 16
    object ADOQuery2GL_ACC_NUMBER: TStringField
      FieldName = 'GL_ACC_NUMBER'
      FixedChar = True
      Size = 18
    end
    object ADOQuery2description_2: TStringField
      FieldName = 'description_2'
      ReadOnly = True
      Size = 101
    end
    object ADOQuery2GL_DESCRIPTION: TStringField
      FieldName = 'GL_DESCRIPTION'
      Size = 50
    end
  end
  object temp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 249
    Top = 44
  end
  object ADO496: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    AfterDelete = ADO496AfterDelete
    OnDeleteError = ADO496DeleteError
    OnPostError = ADO496PostError
    CommandText = 
      'select data0496.*,case ttype when '#39'P'#39' then '#39#30452#25509#26448#26009#39' when '#39'M'#39' then ' +
      #39#38388#25509#26448#26009#39' end as type,'#13#10'       data0019.inv_group_name,data0019.inv' +
      '_group_desc'#13#10'from data0496,data0019'#13#10'where data0496.group_ptr=da' +
      'ta0019.rkey'
    IndexFieldNames = 'GROUP_NAME'
    Parameters = <>
    Left = 108
    Top = 68
    object ADO496RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO496GROUP_NAME: TStringField
      FieldName = 'GROUP_NAME'
      Size = 10
    end
    object ADO496GROUP_DESC: TStringField
      FieldName = 'GROUP_DESC'
      Size = 30
    end
    object ADO496ttype: TStringField
      FieldName = 'ttype'
      FixedChar = True
      Size = 1
    end
    object ADO496group_ptr: TIntegerField
      FieldName = 'group_ptr'
    end
    object ADO496SPEC_RKEY: TStringField
      FieldName = 'SPEC_RKEY'
      FixedChar = True
      Size = 1
    end
    object ADO496MASK_INV_NUMBER: TStringField
      FieldName = 'MASK_INV_NUMBER'
      Size = 25
    end
    object ADO496IF_FLAG: TWordField
      FieldName = 'IF_FLAG'
    end
    object ADO496gl_acct_ptr: TIntegerField
      FieldName = 'gl_acct_ptr'
    end
    object ADO496quote_flag: TBooleanField
      FieldName = 'quote_flag'
    end
    object ADO496type: TStringField
      DisplayWidth = 8
      FieldName = 'type'
      ReadOnly = True
      Size = 8
    end
    object ADO496inv_group_name: TStringField
      FieldName = 'inv_group_name'
    end
    object ADO496inv_group_desc: TStringField
      FieldName = 'inv_group_desc'
      Size = 40
    end
    object ADO496INSPECT: TWideStringField
      FieldName = 'INSPECT'
      FixedChar = True
      Size = 1
    end
    object ADO496SHELF_LIFE: TSmallintField
      FieldName = 'SHELF_LIFE'
    end
    object ADO496CATALOG_NUM: TWideStringField
      FieldName = 'CATALOG_NUM'
      FixedChar = True
      Size = 10
    end
    object ADO496AVL_FLAG: TWideStringField
      FieldName = 'AVL_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADO496IsMaster: TBooleanField
      DisplayLabel = 'MI'#35774#35745#26102'BOM'#24517#36873
      FieldName = 'IsMaster'
    end
    object ADO496Rkey595: TIntegerField
      FieldName = 'Rkey595'
    end
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 48
    Top = 184
  end
end
