object DM: TDM
  OldCreateOrder = False
  Left = 448
  Top = 293
  Height = 323
  Width = 449
  object con1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 104
    Top = 32
  end
  object adsMain: TADODataSet
    Connection = con1
    CursorType = ctStatic
    LockType = ltReadOnly
    AfterScroll = adsMainAfterScroll
    CommandText = 
      'SELECT     dbo.hr_KeyPosition.rkey, dbo.hr_KeyPosition.deptid, d' +
      'bo.hr_KeyPosition.positionname, dbo.hr_KeyPosition.qty_Dev, dbo.' +
      'hr_KeyPosition.qty_req, dbo.hr_KeyPosition.qty_has, '#13#10'          ' +
      '            dbo.datadepartment.departmentname, dbo.datadepartmen' +
      't.departmentcode'#13#10'FROM         dbo.datadepartment INNER JOIN'#13#10'  ' +
      '                    dbo.hr_KeyPosition ON dbo.datadepartment.rke' +
      'y = dbo.hr_KeyPosition.deptid'
    Parameters = <>
    Left = 104
    Top = 112
    object adsMainrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object adsMaindeptid: TIntegerField
      FieldName = 'deptid'
    end
    object adsMainpositionname: TWideStringField
      DisplayLabel = #20851#38190#23703#20301
      FieldName = 'positionname'
      Size = 40
    end
    object adsMainqty_Dev: TIntegerField
      DisplayLabel = #20851#38190#35774#22791#25968#37327
      FieldName = 'qty_Dev'
    end
    object adsMainqty_req: TIntegerField
      DisplayLabel = #20154#21592#38656#27714#25968#37327
      FieldName = 'qty_req'
    end
    object adsMainqty_has: TIntegerField
      DisplayLabel = #29616#26377#20154#21592#25968#37327
      FieldName = 'qty_has'
    end
    object adsMaindepartmentname: TWideStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'departmentname'
    end
    object adsMaindepartmentcode: TWideStringField
      DisplayLabel = #37096#38376#20195#30721
      FieldName = 'departmentcode'
    end
  end
  object dsMain: TDataSource
    DataSet = adsMain
    Left = 160
    Top = 112
  end
  object adsDetail: TADODataSet
    Connection = con1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      ' SELECT     rkey, keyid, reqtype, reqitem'#13#10#9#9#9',CASE Reqtype WHEN' +
      ' 0 THEN '#39#22521#35757#39' WHEN 1 THEN '#39#24037#40836#39' END as strtype '#13#10'FROM         dbo.' +
      'hr_PositionReq '#13#10'where keyid=:key'
    DataSource = dsMain
    Parameters = <
      item
        Name = 'key'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 104
    Top = 184
    object adsDetailrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object adsDetailkeyid: TIntegerField
      FieldName = 'keyid'
    end
    object adsDetailreqtype: TWordField
      FieldName = 'reqtype'
    end
    object adsDetailreqitem: TWideStringField
      DisplayLabel = #38656#27714#26631#20934
      FieldName = 'reqitem'
      Size = 100
    end
    object adsDetailstrtype: TStringField
      DisplayLabel = #38656#27714#31867#22411
      FieldName = 'strtype'
      ReadOnly = True
      Size = 4
    end
  end
  object dsDetail: TDataSource
    DataSet = adsDetail
    Left = 160
    Top = 184
  end
  object qryTmp: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 320
    Top = 120
  end
end
