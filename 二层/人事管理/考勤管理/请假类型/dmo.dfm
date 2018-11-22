object DM: TDM
  OldCreateOrder = False
  Left = 575
  Top = 263
  Height = 330
  Width = 290
  object ADOConn: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 16
    Top = 40
  end
  object ADOAskForLeave: TADODataSet
    AutoCalcFields = False
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select askforleave.rkey,askforleave.leavetype,askforleave.unit,'#13 +
      #10'datadetail.item,[precision],worktime_calculation,remark '#13#10'from ' +
      'askforleave inner join '#13#10'     datadetail on askforleave.unit=dat' +
      'adetail.rkey '
    Parameters = <>
    Left = 120
    Top = 24
    object ADOAskForLeaverkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOAskForLeaveleavetype: TWideStringField
      FieldName = 'leavetype'
      Size = 50
    end
    object ADOAskForLeaveunit: TIntegerField
      FieldName = 'unit'
    end
    object ADOAskForLeaveitem: TWideStringField
      FieldName = 'item'
    end
    object ADOAskForLeaveprecision: TSmallintField
      FieldName = 'precision'
    end
    object ADOAskForLeaveworktime_calculation: TBooleanField
      FieldName = 'worktime_calculation'
    end
    object ADOAskForLeaveremark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOAskForLeave
    Left = 216
    Top = 24
  end
  object ADODetail: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    CommandText = 
      'select rkey, dictid, item from datadetail where dictid=13 and it' +
      'em like '#39'%'#39'+:item+'#39'%'#39' order by rkey'
    Parameters = <
      item
        Name = 'item+'#39'%'#39
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end>
    Left = 120
    Top = 80
    object ADODetailrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADODetailitem: TWideStringField
      FieldName = 'item'
    end
    object ADODetaildictid: TIntegerField
      FieldName = 'dictid'
    end
  end
  object ADOAskLeaveRegister: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    CommandText = 
      'SELECT count(*) as rowsCount FROM AskLeaveRegister where leavety' +
      'pe=:leavetype'
    Parameters = <
      item
        Name = 'leavetype'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 120
    Top = 136
    object ADOAskLeaveRegisterrowsCount: TIntegerField
      FieldName = 'rowsCount'
      ReadOnly = True
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConn
    Parameters = <>
    Left = 120
    Top = 200
  end
end
