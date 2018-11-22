object DM: TDM
  OldCreateOrder = False
  Left = 381
  Top = 186
  Height = 326
  Width = 322
  object ADOCon: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 38
    Top = 24
  end
  object ADOsalaryaccount: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     rkey, Accountname, createdate, createman, discription' +
        ', remark'
      'FROM         dbo.salaryaccount')
    Left = 40
    Top = 72
    object ADOsalaryaccountrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOsalaryaccountAccountname: TWideStringField
      FieldName = 'Accountname'
      Size = 50
    end
    object ADOsalaryaccountcreatedate: TDateTimeField
      FieldName = 'createdate'
    end
    object ADOsalaryaccountcreateman: TIntegerField
      FieldName = 'createman'
    end
    object ADOsalaryaccountdiscription: TWideStringField
      FieldName = 'discription'
      Size = 50
    end
    object ADOsalaryaccountremark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
  end
  object DS: TDataSource
    DataSet = ADOsalaryaccount
    Left = 40
    Top = 120
  end
  object tmp1: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 151
    Top = 73
  end
  object ADODesignSalaryItem: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'RKEYS'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT     rkey, itemname, type, datafield, datasourcetype,'
      
        '                 case datasourcetype when 1 then '#39#20844#24335#39' when 0 the' +
        'n '#39#25968#20540#39' when 2 then '#39#22266#23450#20540#39' END AS datasourcetype_s,'
      
        '                 datasource, fieldsource, fixedmoney, Expression' +
        '1, Expression2, IsDisplay, IsAvail, Tag, Accountid, '
      '                      ItemIndex, RefreshFlag'
      'FROM         dbo.DesignSalaryItem'
      'WHERE Accountid= :RKEYS'
      'order by ItemIndex')
    Left = 48
    Top = 176
    object ADODesignSalaryItemrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADODesignSalaryItemitemname: TWideStringField
      FieldName = 'itemname'
      Size = 50
    end
    object ADODesignSalaryItemtype: TWideStringField
      FieldName = 'type'
    end
    object ADODesignSalaryItemdatafield: TWideStringField
      FieldName = 'datafield'
      Size = 10
    end
    object ADODesignSalaryItemdatasourcetype: TWordField
      FieldName = 'datasourcetype'
    end
    object ADODesignSalaryItemdatasource: TIntegerField
      FieldName = 'datasource'
    end
    object ADODesignSalaryItemfieldsource: TWideStringField
      FieldName = 'fieldsource'
      Size = 50
    end
    object ADODesignSalaryItemfixedmoney: TBCDField
      FieldName = 'fixedmoney'
      Precision = 19
    end
    object ADODesignSalaryItemExpression1: TWideStringField
      FieldName = 'Expression1'
      Size = 2000
    end
    object ADODesignSalaryItemExpression2: TWideStringField
      FieldName = 'Expression2'
      Size = 4000
    end
    object ADODesignSalaryItemIsDisplay: TSmallintField
      FieldName = 'IsDisplay'
    end
    object ADODesignSalaryItemIsAvail: TSmallintField
      FieldName = 'IsAvail'
    end
    object ADODesignSalaryItemTag: TIntegerField
      FieldName = 'Tag'
    end
    object ADODesignSalaryItemAccountid: TIntegerField
      FieldName = 'Accountid'
    end
    object ADODesignSalaryItemItemIndex: TIntegerField
      FieldName = 'ItemIndex'
    end
    object ADODesignSalaryItemRefreshFlag: TIntegerField
      FieldName = 'RefreshFlag'
    end
    object ADODesignSalaryItemdatasourcetype_s: TStringField
      FieldName = 'datasourcetype_s'
      ReadOnly = True
      Size = 6
    end
  end
  object DS2: TDataSource
    DataSet = ADODesignSalaryItem
    Left = 48
    Top = 224
  end
end
