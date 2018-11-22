object DM: TDM
  OldCreateOrder = False
  Left = 531
  Top = 252
  Height = 243
  Width = 310
  object adoConn: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 23
    Top = 8
  end
  object dsIn: TDataSource
    DataSet = cdsIn
    Left = 88
    Top = 8
  end
  object aqIn: TADOQuery
    Connection = adoConn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      
        'select Cast(0 as tinyint) as IsSelected ,d56.Qty_BackLog as Tran' +
        'sQty, D56.PANELS as TransPNLQty, '
      'D25.MANU_PART_NUMBER,D25.MANU_PART_DESC,D25.PARENT_PTR,'
      'D492.SO_NO, D06.RKEY,D06.WORK_ORDER_NUMBER,D06.BOM_PTR,'
      'ENT_DATETIME, D06.QUAN_PROD, D06.QUAN_REJ,D06.Quan_Sch, '
      
        'D56.Qty_BackLog, D56.PANELS, D06.PARTS_PER_PANEL,D06.PRIORITY_CO' +
        'DE'
      
        'from data0006 D06(nolock) inner join data0056 D56(nolock) on D56' +
        '.WO_Ptr=D06.rKey'
      'inner join data0492 D492(nolock) on D06.Cut_NO=D492.Cut_NO'
      'inner join data0025 D25(nolock) on D06.BOM_PTR = D25.RKEY'
      'where d06.PROD_STATUS=6 and d56.Qty_BackLog>0'
      'order by D492.SO_NO, D06.work_order_Number,ENT_DATETIME')
    Left = 256
    Top = 8
    object aqInIsSelected: TWordField
      FieldName = 'IsSelected'
    end
    object aqInTransQty: TFloatField
      FieldName = 'TransQty'
    end
    object aqInTransPNLQty: TIntegerField
      FieldName = 'TransPNLQty'
    end
    object aqInMANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
      ReadOnly = True
    end
    object aqInMANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      ReadOnly = True
      Size = 80
    end
    object aqInPARENT_PTR: TIntegerField
      FieldName = 'PARENT_PTR'
      ReadOnly = True
    end
    object aqInSO_NO: TStringField
      FieldName = 'SO_NO'
      ReadOnly = True
      FixedChar = True
      Size = 12
    end
    object aqInRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aqInWORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      ReadOnly = True
      Size = 22
    end
    object aqInBOM_PTR: TIntegerField
      FieldName = 'BOM_PTR'
    end
    object aqInENT_DATETIME: TDateTimeField
      FieldName = 'ENT_DATETIME'
      ReadOnly = True
    end
    object aqInQUAN_PROD: TFloatField
      FieldName = 'QUAN_PROD'
      ReadOnly = True
    end
    object aqInQUAN_REJ: TFloatField
      FieldName = 'QUAN_REJ'
      ReadOnly = True
    end
    object aqInQuan_Sch: TFloatField
      FieldName = 'Quan_Sch'
      ReadOnly = True
    end
    object aqInQty_BackLog: TFloatField
      FieldName = 'Qty_BackLog'
      ReadOnly = True
    end
    object aqInPANELS: TIntegerField
      FieldName = 'PANELS'
      ReadOnly = True
    end
    object aqInPARTS_PER_PANEL: TFloatField
      FieldName = 'PARTS_PER_PANEL'
      ReadOnly = True
    end
    object aqInPRIORITY_CODE: TWordField
      FieldName = 'PRIORITY_CODE'
    end
  end
  object cdsIn: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspIn'
    AfterOpen = cdsInAfterOpen
    AfterScroll = cdsInAfterScroll
    Left = 144
    Top = 8
    object cdsInIsSelected: TSmallintField
      FieldName = 'IsSelected'
      OnChange = cdsInIsSelectedChange
    end
    object cdsInTransQty: TFloatField
      FieldName = 'TransQty'
      OnValidate = cdsInTransQtyValidate
    end
    object cdsInTransPNLQty: TIntegerField
      FieldName = 'TransPNLQty'
      OnValidate = cdsInTransPNLQtyValidate
    end
    object cdsInMANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
      ReadOnly = True
    end
    object cdsInMANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      ReadOnly = True
      Size = 80
    end
    object cdsInPARENT_PTR: TIntegerField
      FieldName = 'PARENT_PTR'
      ReadOnly = True
    end
    object cdsInSO_NO: TStringField
      FieldName = 'SO_NO'
      ReadOnly = True
      FixedChar = True
      Size = 12
    end
    object cdsInRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object cdsInWORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      ReadOnly = True
      Size = 22
    end
    object cdsInBOM_PTR: TIntegerField
      FieldName = 'BOM_PTR'
      ReadOnly = True
    end
    object cdsInENT_DATETIME: TDateTimeField
      FieldName = 'ENT_DATETIME'
      ReadOnly = True
    end
    object cdsInQUAN_PROD: TFloatField
      FieldName = 'QUAN_PROD'
      ReadOnly = True
    end
    object cdsInQUAN_REJ: TFloatField
      FieldName = 'QUAN_REJ'
      ReadOnly = True
    end
    object cdsInQuan_Sch: TFloatField
      FieldName = 'Quan_Sch'
      ReadOnly = True
    end
    object cdsInQty_BackLog: TFloatField
      FieldName = 'Qty_BackLog'
      ReadOnly = True
    end
    object cdsInPANELS: TIntegerField
      FieldName = 'PANELS'
      ReadOnly = True
    end
    object cdsInPARTS_PER_PANEL: TFloatField
      FieldName = 'PARTS_PER_PANEL'
      ReadOnly = True
    end
    object cdsInPRIORITY_CODE: TSmallintField
      FieldName = 'PRIORITY_CODE'
    end
  end
  object dspIn: TDataSetProvider
    DataSet = aqIn
    Left = 200
    Top = 8
  end
  object aqOut: TADOQuery
    Connection = adoConn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'BOM_PTR'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select Cast(0 as tinyint) as IsSelected ,D06.RKEY,D06.WORK_ORDER' +
        '_NUMBER,D06.ENT_DATETIME,D06.CUT_NO,D06.QUAN_SCH,D06.PANELS,'
      'D25_1.MANU_PART_NUMBER,D25_1.MANU_PART_DESC,D25_1.RKEY as RKEY25'
      'from dbo.Data0006 D06(nolock) inner join'
      
        'dbo.Data0025 D25(nolock) on D06.BOM_PTR = D25.PARENT_PTR inner j' +
        'oin'
      'dbo.Data0025 D25_1(nolock) on D25.PARENT_PTR = D25_1.RKEY'
      'where D06.WIPMAT_STATUS=0'
      'and D06.PROD_STATUS=2'
      'and D25.RKEY = :BOM_PTR'
      'order by D06.WORK_ORDER_NUMBER')
    Left = 256
    Top = 57
    object aqOutIsSelected: TWordField
      FieldName = 'IsSelected'
    end
    object aqOutRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aqOutWORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      ReadOnly = True
      Size = 22
    end
    object aqOutENT_DATETIME: TDateTimeField
      FieldName = 'ENT_DATETIME'
      ReadOnly = True
    end
    object aqOutCUT_NO: TStringField
      FieldName = 'CUT_NO'
      ReadOnly = True
      FixedChar = True
      Size = 12
    end
    object aqOutQUAN_SCH: TFloatField
      FieldName = 'QUAN_SCH'
      ReadOnly = True
    end
    object aqOutPANELS: TIntegerField
      FieldName = 'PANELS'
      ReadOnly = True
    end
    object aqOutMANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
      ReadOnly = True
    end
    object aqOutMANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      ReadOnly = True
      Size = 80
    end
    object aqOutRKEY25: TAutoIncField
      FieldName = 'RKEY25'
      ReadOnly = True
    end
  end
  object dsOut: TDataSource
    DataSet = cdsOut
    Left = 88
    Top = 56
  end
  object cdsOut: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOut'
    Left = 144
    Top = 56
    object cdsOutIsSelected: TSmallintField
      FieldName = 'IsSelected'
      OnChange = cdsOutIsSelectedChange
    end
    object cdsOutRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object cdsOutWORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      ReadOnly = True
      Size = 22
    end
    object cdsOutENT_DATETIME: TDateTimeField
      FieldName = 'ENT_DATETIME'
      ReadOnly = True
    end
    object cdsOutCUT_NO: TStringField
      FieldName = 'CUT_NO'
      ReadOnly = True
      Visible = False
      FixedChar = True
      Size = 12
    end
    object cdsOutQUAN_SCH: TFloatField
      FieldName = 'QUAN_SCH'
      ReadOnly = True
    end
    object cdsOutPANELS: TIntegerField
      FieldName = 'PANELS'
      ReadOnly = True
    end
    object cdsOutMANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
      ReadOnly = True
    end
    object cdsOutMANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      ReadOnly = True
      Size = 80
    end
    object cdsOutRKEY25: TAutoIncField
      FieldName = 'RKEY25'
      ReadOnly = True
    end
  end
  object dspOut: TDataSetProvider
    DataSet = aqOut
    Left = 201
    Top = 56
  end
  object aqTmp: TADOQuery
    Connection = adoConn
    Parameters = <>
    Left = 24
    Top = 56
  end
  object aqTmp1: TADOQuery
    Connection = adoConn
    Parameters = <>
    Left = 23
    Top = 106
  end
  object aq48: TADOQuery
    Connection = adoConn
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select * '
      'from data0048'
      'where rkey=0')
    Left = 256
    Top = 112
  end
  object aqENGFlow: TADOQuery
    Connection = adoConn
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'vptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select data0038.dept_ptr,data0038.step_number,'
      ' data0034.barcode_entry_flag'
      ' from data0038,data0034'
      'where data0038.source_ptr=:vptr'
      'and data0038.step_number>=1'
      'and data0038.dept_ptr=data0034.rkey'
      'order by data0038.step_number')
    Left = 198
    Top = 112
  end
end
