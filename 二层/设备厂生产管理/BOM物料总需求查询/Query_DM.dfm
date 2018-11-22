object DM: TDM
  OldCreateOrder = False
  Left = 527
  Top = 105
  Height = 389
  Width = 649
  object ADOConn1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 16
  end
  object qry1: TADOQuery
    Connection = ADOConn1
    Parameters = <>
    SQL.Strings = (
      'SELECT    '
      'dbo.Data0017.INV_PART_NUMBER, '
      
        'dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION,data0017.QUA' +
        'N_ON_HAND,'
      ''
      ' sum(dbo.wzcp0492.STD_QTY) as stdqty,'
      ' sum(dbo.wzcp0492.App_QTY) as app_qty,'
      ' sum(dbo.wzcp0492.Con_QTY) as con_qty, '
      ' sum(dbo.wzcp0492.QUAN_ASSIGN) as quan_assign'
      'FROM         dbo.wzcp0492 INNER JOIN'
      
        '                      dbo.data0492 ON dbo.wzcp0492.D492_ptr = db' +
        'o.data0492.rkey INNER JOIN'
      
        '                      dbo.Data0017 ON dbo.wzcp0492.D017_ptr = db' +
        'o.Data0017.RKEY INNER JOIN'
      
        '                      dbo.WZCP0495 ON dbo.wzcp0492.WZCP0495_PTR ' +
        '= dbo.WZCP0495.rkey INNER JOIN'
      
        '                      dbo.WZCP0494 ON dbo.WZCP0495.PARTBOM_PTR =' +
        ' dbo.WZCP0494.rkey INNER JOIN'
      
        '                      dbo.Data0008 ON dbo.WZCP0494.part_ptr = db' +
        'o.Data0008.RKEY'
      'where'
      '(1=1)')
    Left = 104
    Top = 16
    object qry1INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object qry1INV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object qry1INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object qry1QUAN_ON_HAND: TBCDField
      FieldName = 'QUAN_ON_HAND'
      ReadOnly = True
      Precision = 19
    end
    object qry1stdqty: TBCDField
      FieldName = 'stdqty'
      ReadOnly = True
      Precision = 32
    end
    object qry1app_qty: TBCDField
      FieldName = 'app_qty'
      ReadOnly = True
      Precision = 32
    end
    object qry1con_qty: TBCDField
      FieldName = 'con_qty'
      ReadOnly = True
      Precision = 32
    end
    object qry1quan_assign: TBCDField
      FieldName = 'quan_assign'
      ReadOnly = True
      Precision = 32
    end
  end
  object ds1: TDataSource
    DataSet = qry1
    Left = 176
    Top = 16
  end
end
