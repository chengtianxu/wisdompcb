object DM1: TDM1
  OldCreateOrder = False
  Left = 368
  Top = 203
  Height = 405
  Width = 516
  object con1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 16
  end
  object adsDetail: TADODataSet
    Connection = con1
    CursorType = ctStatic
    CommandText = 
      'select d34.dept_name,d34.dept_code,d83.dept_note,d84.seq_no,d278' +
      '.parameter_name,d84.tvalue from data0082 d82'#13#10'inner join data008' +
      '3 d83 on d83.grade_code = d82.grade_code'#13#10'left join data0084 d84' +
      ' on d83.grade_code = d84.grade_code and d83.dept_ptr = d84.dept_' +
      'ptr'#13#10'inner join data0034 d34 on d83.dept_ptr = d34.rkey'#13#10'left jo' +
      'in data0278 d278 on d278.rkey = d84.parameter_ptr'#13#10'where d82.gra' +
      'de_code = :param1'
    Parameters = <
      item
        Name = 'param1'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    Left = 24
    Top = 120
    object strngfldDetaildept_name: TStringField
      FieldName = 'dept_name'
      Size = 30
    end
    object strngfldDetaildept_code: TStringField
      FieldName = 'dept_code'
      Size = 10
    end
    object wdstrngfldDetaildept_note: TWideStringField
      FieldName = 'dept_note'
      Size = 2048
    end
    object intgrfldDetailseq_no: TIntegerField
      FieldName = 'seq_no'
    end
    object strngfldDetailparameter_name: TStringField
      FieldName = 'parameter_name'
      Size = 10
    end
    object strngfldDetailtvalue: TStringField
      FieldName = 'tvalue'
      Size = 30
    end
  end
  object adsMaster: TADODataSet
    Connection = con1
    CursorType = ctStatic
    AfterScroll = adsMasterAfterScroll
    CommandText = 'select * from data0082'
    Parameters = <>
    Left = 24
    Top = 64
    object strngfldMastergrade_code: TStringField
      FieldName = 'grade_code'
      Size = 10
    end
    object wdstrngfldMastergrade_name: TWideStringField
      FieldName = 'grade_name'
      Size = 50
    end
    object wdstrngfldMastergrade_remark: TWideStringField
      FieldName = 'grade_remark'
      Size = 50
    end
  end
  object dsMaster: TDataSource
    DataSet = adsMaster
    Left = 72
    Top = 64
  end
  object dsdetail: TDataSource
    DataSet = adsDetail
    Left = 72
    Top = 120
  end
  object qrytmp: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 336
    Top = 72
  end
end
