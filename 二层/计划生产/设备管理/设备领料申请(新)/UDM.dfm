object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 440
  Top = 259
  Height = 299
  Width = 254
  object con1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 16
  end
  object qrytemp: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 192
    Top = 56
  end
  object qrytemp2: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 192
    Top = 144
  end
  object qry17: TADOQuery
    Connection = con1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      
        '( SELECT     dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER,dat' +
        'a0017.INV_NAME,  dbo.Data0017.INV_DESCRIPTION, dbo.Data0017.INV_' +
        'PART_DESCRIPTION,    '
      
        'SUM(dbo.Data0022.QUAN_ON_HAND) AS Qty, dbo.Data0002.UNIT_NAME, d' +
        'bo.Data0023.ABBR_NAME,'
      
        'Data0023.rkey as rkey23,           dbo.data0016.LOCATION ,'#39#26222#36890#24211#23384#39 +
        ' AS XY    ,d15.abbr_name as '#24037#21378
      ', d496.GROUP_DESC   ,data0002.rkey as rkey02 '
      'FROM         dbo.Data0017 '
      'inner join data0496 d496 on data0017.GROUP_PTR=d496.rkey  '
      
        'INNER JOIN   dbo.Data0022 ON dbo.Data0017.RKEY = dbo.Data0022.IN' +
        'VENTORY_PTR '
      
        'INNER JOIN dbo.Data0002 ON dbo.Data0017.STOCK_UNIT_PTR = dbo.Dat' +
        'a0002.RKEY '
      
        'INNER JOIN dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.R' +
        'KEY '
      
        'INNER JOIN dbo.data0016 ON dbo.data0022.LOCATION_PTR = dbo.data0' +
        '016.RKEY '
      
        'INNER JOIN dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.' +
        'RKEY     '
      
        'inner join data0015 d15 on dbo.Data0456.warehouse_ptr=d15.rkey  ' +
        '   '
      'WHERE   dbo.Data0017.RKEY not in (0) '
      
        'AND (dbo.Data0022.QUAN_ON_HAND > 0) AND   dbo.Data0456.warehouse' +
        '_ptr =  1       '
      
        'GROUP BY dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER,data001' +
        '7.INV_NAME,  dbo.Data0017.INV_DESCRIPTION,      '
      
        'dbo.Data0017.INV_PART_DESCRIPTION, dbo.Data0002.UNIT_NAME, dbo.D' +
        'ata0023.ABBR_NAME,'
      
        'dbo.data0016.LOCATION,Data0023.rkey  ,d15.abbr_name , d496.GROUP' +
        '_DESC ,data0002.rkey  )         '
      'union all           '
      
        '( SELECT  dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER, data0' +
        '017.INV_NAME, dbo.Data0017.INV_DESCRIPTION,'
      
        'dbo.Data0017.INV_PART_DESCRIPTION,          SUM(dbo.Data0134.QUA' +
        'N_ON_HAND) AS Qty, '
      
        'dbo.Data0002.UNIT_NAME,dbo.Data0023.ABBR_NAME,Data0023.rkey as r' +
        'key23,         '
      'dbo.Data0016.LOCATION , '#39'VMI'#24211#23384#39' AS XY_1    ,d15.abbr_name as '#24037#21378' '
      ', d496.GROUP_DESC  ,data0002.rkey as rkey02'
      'FROM   dbo.DATA0134 '
      
        'INNER JOIN dbo.DATA0133 ON dbo.DATA0134.GRN_PTR = dbo.DATA0133.R' +
        'KEY '
      
        'INNER JOIN dbo.Data0017 ON dbo.DATA0134.INVENTORY_PTR = dbo.Data' +
        '0017.RKEY '
      'inner join data0496 d496 on data0017.GROUP_PTR=d496.rkey  '
      
        'INNER JOIN  dbo.Data0016 ON dbo.DATA0134.LOCATION_PTR = dbo.Data' +
        '0016.RKEY '
      
        'INNER JOIN dbo.Data0002 ON dbo.DATA0134.UNIT_PTR = dbo.Data0002.' +
        'RKEY '
      
        'INNER JOIN dbo.Data0023 ON dbo.DATA0133.SUPP_PTR = dbo.Data0023.' +
        'RKEY'
      
        'INNER JOIN dbo.Data0001 ON dbo.DATA0133.currency_ptr = dbo.Data0' +
        '001.RKEY'
      
        'inner join data0015 d15 on dbo.Data0133.warehouse_ptr=d15.rkey  ' +
        '      '
      
        'WHERE   dbo.Data0017.RKEY not in (0) AND (dbo.Data0134.QUAN_ON_H' +
        'AND > 0) AND dbo.Data0133.warehouse_ptr =  1    '
      
        'GROUP BY dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER,data001' +
        '7.INV_NAME, dbo.Data0017.INV_DESCRIPTION,        '
      
        'dbo.Data0017.INV_PART_DESCRIPTION, dbo.Data0002.UNIT_NAME, dbo.D' +
        'ata0023.ABBR_NAME,'
      
        'dbo.data0016.LOCATION,Data0023.rkey   ,d15.abbr_name,d496.GROUP_' +
        'DESC,data0002.rkey   )          '
      'ORDER BY  dbo.Data0017.INV_PART_NUMBER ')
    Left = 113
    Top = 106
    object intgrfldqry17RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object strngfldqry17INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      ReadOnly = True
      Size = 25
    end
    object strngfldqry17INV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object strngfldqry17GROUP_DESC: TStringField
      FieldName = 'GROUP_DESC'
      ReadOnly = True
      Size = 30
    end
    object qry17Qty: TBCDField
      FieldName = 'Qty'
      ReadOnly = True
      Precision = 32
    end
    object strngfldqry17UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
      ReadOnly = True
    end
    object strngfldqry17ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      ReadOnly = True
      Size = 16
    end
    object strngfldqry17LOCATION: TStringField
      FieldName = 'LOCATION'
      ReadOnly = True
    end
    object strngfldqry17XY: TStringField
      FieldName = 'XY'
      ReadOnly = True
      Size = 8
    end
    object strngfldqry17DSDesigner: TStringField
      FieldName = #24037#21378
      ReadOnly = True
      Size = 10
    end
    object intgrfldqry17rkey23: TIntegerField
      FieldName = 'rkey23'
      ReadOnly = True
    end
    object intgrfldqry17rkey02: TIntegerField
      FieldName = 'rkey02'
      ReadOnly = True
    end
    object strngfldqry17INV_NAME: TStringField
      FieldName = 'INV_NAME'
      ReadOnly = True
      Size = 30
    end
    object strngfldqry17INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      ReadOnly = True
      Size = 70
    end
  end
  object qry468: TADOQuery
    Connection = con1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT  Data0468.* ,dbo.Data0017.INV_PART_NUMBER, data0017.inv_n' +
        'ame,dbo.Data0017.INV_DESCRIPTION,data0002.unit_name'
      'FROM   dbo.Data0468 INNER JOIN'
      'dbo.Data0017 ON dbo.Data0468.INVENT_PTR = dbo.Data0017.RKEY'
      'left  join data0002 on data0468.RUNIT=data0002.rkey '
      #13'where 1=1 ')
    Left = 25
    Top = 162
  end
end
