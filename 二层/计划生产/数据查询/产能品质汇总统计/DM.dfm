object Damo: TDamo
  OldCreateOrder = False
  Left = 601
  Top = 401
  Height = 244
  Width = 370
  object con1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 24
  end
  object qry725: TADOQuery
    Connection = con1
    CursorType = ctStatic
    OnCalcFields = qry725CalcFields
    EnableBCD = False
    Parameters = <>
    SQL.Strings = (
      'select a.*,[name]=convert(varchar(500),STUFF'
      
        '                          ((SELECT '#39','#39' + data0034.dept_name from' +
        ' data0034'
      
        'inner join data0726 on data0726.conProitem_ptr=data0034.rkey whe' +
        're data0726.con_ptr=a.rkey'
      'FOR XML PATH('#39#39')), 1, 1, '#39#39'))'
      'from data0725 as a  order by a.Ord')
    Left = 104
    Top = 24
    object atncfldqry725rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object wdstrngfldqry725ControlItemName: TWideStringField
      FieldName = 'ControlItemName'
      Size = 50
    end
    object fltfldqry725TarNum: TFloatField
      FieldName = 'TarNum'
    end
    object fltfldqry725TarDellTax: TFloatField
      FieldName = 'TarDellTax'
    end
    object intgrfldqry725ItemType: TIntegerField
      FieldName = 'ItemType'
    end
    object strngfldqry725name: TStringField
      FieldName = 'name'
      ReadOnly = True
      Size = 50
    end
    object wdstrngfldqry725IsNo: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'IsNo'
      Size = 8
      Calculated = True
    end
    object qry725Ord: TIntegerField
      FieldName = 'Ord'
    end
  end
  object ds725: TDataSource
    DataSet = qry725
    Left = 160
    Top = 24
  end
  object qrytemp: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 232
    Top = 24
  end
  object ds0034: TDataSource
    DataSet = ads0034
    Left = 272
    Top = 80
  end
  object ads0034: TADODataSet
    Connection = con1
    CursorType = ctStatic
    CommandText = 
      'select cast(0 as bit) sel, rkey, dept_code, dept_name,BARCODE_EN' +
      'TRY_FLAG from data0034 where ttype=1'
    Parameters = <>
    Left = 232
    Top = 80
    object blnfldads0034sel: TBooleanField
      FieldName = 'sel'
      ReadOnly = True
    end
    object atncfldads0034rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ads0034dept_code: TStringField
      FieldName = 'dept_code'
      Size = 10
    end
    object ads0034dept_name: TStringField
      FieldName = 'dept_name'
      Size = 30
    end
    object ads0034BARCODE_ENTRY_FLAG: TStringField
      FieldName = 'BARCODE_ENTRY_FLAG'
      Size = 1
    end
  end
  object qry729: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 104
    Top = 80
  end
  object ds729: TDataSource
    DataSet = qry729
    Left = 160
    Top = 80
  end
  object qry729s: TADOQuery
    Connection = con1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'dtp1'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'SELECT [Data0729].[rkey]'
      '      ,[Data0729].[ControlItemName]'
      '      ,[DTarNum]'
      '      ,[DProNum]'
      '      ,[DFinalProTax]'
      '      ,[MProNum]'
      '      ,[MFinalProTax]'
      '      ,[WIP]'
      '      ,[DTarDellTax]'
      '      ,[DDelTax]'
      '      ,'
      
        'case when ([DFinalDelTax] >= 500) or ([DFinalDelTax] = 0)  then ' +
        '500 '
      'else [DFinalDelTax] end [DFinalDelTax]'
      '      ,[MDelTax]'
      '      ,'
      
        'case when ([MFinalDelTax] >= 500) or ([MFinalDelTax] = 0)  then ' +
        '500 '
      'else [MFinalDelTax] end [MFinalDelTax]'
      '      ,[Date]'
      '      ,[StarDateTiem]'
      '      ,[EndDateTime],Ord'
      '  FROM [wisdompcb].[dbo].[Data0729],data0725'
      
        ' where Date =:dtp1 and Data0729.[ControlItemName]=data0725.[Cont' +
        'rolItemName]'
      'order by Ord')
    Left = 104
    Top = 144
    object qry729srkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object qry729sControlItemName: TWideStringField
      FieldName = 'ControlItemName'
      ReadOnly = True
      Size = 50
    end
    object qry729sDTarNum: TFloatField
      FieldName = 'DTarNum'
      ReadOnly = True
    end
    object qry729sDProNum: TFloatField
      FieldName = 'DProNum'
      ReadOnly = True
    end
    object qry729sDFinalProTax: TFloatField
      FieldName = 'DFinalProTax'
      ReadOnly = True
      DisplayFormat = '0.00%'
    end
    object qry729sMProNum: TFloatField
      FieldName = 'MProNum'
      ReadOnly = True
    end
    object qry729sMFinalProTax: TFloatField
      FieldName = 'MFinalProTax'
      ReadOnly = True
      DisplayFormat = '0.00%'
    end
    object qry729sWIP: TFloatField
      FieldName = 'WIP'
    end
    object qry729sDTarDellTax: TFloatField
      FieldName = 'DTarDellTax'
      ReadOnly = True
      DisplayFormat = '0.00%'
    end
    object qry729sDDelTax: TFloatField
      FieldName = 'DDelTax'
      ReadOnly = True
      DisplayFormat = '0.00%'
    end
    object qry729sDFinalDelTax: TFloatField
      FieldName = 'DFinalDelTax'
      ReadOnly = True
      DisplayFormat = '0.00%'
    end
    object qry729sMDelTax: TFloatField
      FieldName = 'MDelTax'
      ReadOnly = True
      DisplayFormat = '0.00%'
    end
    object qry729sMFinalDelTax: TFloatField
      FieldName = 'MFinalDelTax'
      ReadOnly = True
      DisplayFormat = '0.00%'
    end
    object qry729sDate: TDateTimeField
      FieldName = 'Date'
      ReadOnly = True
    end
    object qry729sStarDateTiem: TDateTimeField
      FieldName = 'StarDateTiem'
      ReadOnly = True
    end
    object qry729sEndDateTime: TDateTimeField
      FieldName = 'EndDateTime'
      ReadOnly = True
    end
  end
  object ds729s: TDataSource
    DataSet = qry729s
    Left = 160
    Top = 144
  end
end
