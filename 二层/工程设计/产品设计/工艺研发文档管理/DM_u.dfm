object DM: TDM
  OldCreateOrder = False
  Left = 437
  Top = 315
  Height = 280
  Width = 330
  object ADOCon: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 16
  end
  object ADO306: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select * from FD306')
    Left = 104
    Top = 24
    object ADO306type_name: TWideStringField
      DisplayLabel = #31867#21035#21517#31216
      FieldName = 'type_name'
      Size = 10
    end
    object ADO306rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
  end
  object ADO307: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    AfterOpen = ADO307AfterScroll
    AfterScroll = ADO307AfterScroll
    OnCalcFields = ADO307CalcFields
    Parameters = <>
    SQL.Strings = (
      'select * from FD307 where startdate>=getdate()-365')
    Left = 104
    Top = 88
    object ADO307PrgID: TWideStringField
      DisplayLabel = #39033#30446#32534#21495
      FieldName = 'PrgID'
    end
    object ADO307PrgName: TWideStringField
      DisplayLabel = #39033#30446#21517#31216
      FieldName = 'PrgName'
      Size = 50
    end
    object ADO307PrgScript: TMemoField
      DisplayLabel = #39033#30446#31616#20171
      FieldName = 'PrgScript'
      BlobType = ftMemo
    end
    object ADO307PrgFunc: TMemoField
      DisplayLabel = #39033#30446#30446#30340
      FieldName = 'PrgFunc'
      BlobType = ftMemo
    end
    object ADO307Responsor: TWideStringField
      DisplayLabel = #36127#36131#20154
      FieldName = 'Responsor'
      Size = 24
    end
    object ADO307partMan: TWideStringField
      DisplayLabel = #21442#19982#20154
      FieldName = 'partMan'
      Size = 50
    end
    object ADO307StartDate: TDateTimeField
      DisplayLabel = #31435#39033#26102#38388
      FieldName = 'StartDate'
    end
    object ADO307EndDate: TDateTimeField
      DisplayLabel = #32467#26463#26102#38388
      FieldName = 'EndDate'
    end
    object ADO307status: TBooleanField
      DisplayLabel = #29366#24577
      FieldName = 'status'
    end
    object ADO307overMan: TIntegerField
      DisplayLabel = #32467#26696#20154
      FieldName = 'overMan'
    end
    object ADO307overDate: TDateTimeField
      DisplayLabel = #32467#26696#26102#38388
      FieldName = 'overDate'
    end
    object ADO307type_ptr: TIntegerField
      FieldName = 'type_ptr'
    end
    object ADO307rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO307PrgRemark: TMemoField
      DisplayLabel = #39033#30446#35780#20215
      FieldName = 'PrgRemark'
      BlobType = ftMemo
    end
    object ADO307employee_name: TStringField
      DisplayLabel = #32467#26696#20154
      FieldKind = fkCalculated
      FieldName = 'employee_name'
      Calculated = True
    end
    object ADO307type_name: TStringField
      DisplayLabel = #39033#30446#31867#21035
      FieldKind = fkCalculated
      FieldName = 'type_name'
      Calculated = True
    end
  end
  object ADO308: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    OnCalcFields = ADO308CalcFields
    Parameters = <
      item
        Name = 'Rkey308'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select  rkey, source_ptr, doc_name, doc_ver, saveDate, saveMan, ' +
        'createMan, DocScript, status'
      ' from FD308  where source_ptr=:Rkey308'
      '')
    Left = 104
    Top = 152
    object ADO308doc_name: TWideStringField
      DisplayLabel = #25991#26723#21517#31216
      FieldName = 'doc_name'
      Size = 40
    end
    object ADO308doc_ver: TSmallintField
      DisplayLabel = #25991#26723#29256#26412
      FieldName = 'doc_ver'
    end
    object ADO308createMan: TWideStringField
      DisplayLabel = #21019#24314#20154
      FieldName = 'createMan'
    end
    object ADO308saveDate: TDateTimeField
      DisplayLabel = #23384#26723#26102#38388
      FieldName = 'saveDate'
    end
    object ADO308employee_name: TStringField
      DisplayLabel = #23384#26723#20154
      FieldKind = fkCalculated
      FieldName = 'employee_name'
      Calculated = True
    end
    object ADO308status: TBooleanField
      DisplayLabel = #32467#26696
      FieldName = 'status'
    end
    object ADO308rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO308DocScript: TMemoField
      DisplayLabel = #25991#26723#25551#21465
      FieldName = 'DocScript'
      BlobType = ftMemo
    end
    object ADO308source_ptr: TIntegerField
      FieldName = 'source_ptr'
    end
    object ADO308saveMan: TIntegerField
      DisplayLabel = 'saveman'
      FieldName = 'saveMan'
    end
  end
  object tmp: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 192
    Top = 152
  end
  object ADOImg: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 248
    Top = 152
  end
end
