object DM: TDM
  OldCreateOrder = False
  Left = 5
  Top = 248
  Height = 150
  Width = 215
  object ACON: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=wisdompcb1077;Persist Security Info' +
      '=True;User ID=sa;Initial Catalog=wisdompcb_bak;Data Source=172.1' +
      '6.68.8'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 20
    Top = 10
  end
  object AQ160: TADOQuery
    Connection = ACON
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterOpen = AQ160AfterOpen
    AfterScroll = AQ160AfterScroll
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     TOP 100 PERCENT dbo.DATA0160.RKEY, dbo.DATA0160.LOCAT' +
        'ION_CODE, dbo.DATA0160.LOCATION_NAME, dbo.DATA0160.TYPE, '
      
        '                      dbo.DATA0160.OH_degree, dbo.DATA0160.SUPPL' +
        'IER_PTR, dbo.Data0023.CODE, dbo.Data0023.ABBR_NAME, dbo.Data0023' +
        '.SUPPLIER_NAME, '
      
        '                      dbo.DATA0160.FASSET_PTR, dbo.Data0517.FASS' +
        'ET_CODE, dbo.Data0517.FASSET_NAME, dbo.Data0517.FASSET_DESC, '
      '                      dbo.DATA0160.REMARK'
      'FROM         dbo.DATA0160 LEFT OUTER JOIN'
      
        '                      dbo.Data0517 ON dbo.DATA0160.FASSET_PTR = ' +
        'dbo.Data0517.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0023 ON dbo.DATA0160.SUPPLIER_PTR ' +
        '= dbo.Data0023.RKEY'
      'ORDER BY dbo.DATA0160.RKEY')
    Left = 78
    Top = 10
    object AQ160RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AQ160LOCATION_CODE: TStringField
      DisplayLabel = #20301#32622#20195#30721
      FieldName = 'LOCATION_CODE'
      Size = 10
    end
    object AQ160LOCATION_NAME: TStringField
      DisplayLabel = #20301#32622#21517#31216
      FieldName = 'LOCATION_NAME'
      Size = 50
    end
    object AQ160TYPE: TWordField
      DisplayLabel = #31867#22411
      FieldName = 'TYPE'
    end
    object AQ160OH_degree: TWordField
      DisplayLabel = #32763#30952#27425#25968
      FieldName = 'OH_degree'
    end
    object AQ160CODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object AQ160ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object AQ160SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object AQ160SUPPLIER_PTR: TIntegerField
      FieldName = 'SUPPLIER_PTR'
    end
    object AQ160FASSET_CODE: TStringField
      DisplayLabel = #22266#23450#36164#20135#21345#29255
      FieldName = 'FASSET_CODE'
      Size = 10
    end
    object AQ160FASSET_NAME: TStringField
      DisplayLabel = #22266#23450#36164#20135#21517#31216
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object AQ160FASSET_DESC: TStringField
      FieldName = 'FASSET_DESC'
      Size = 40
    end
    object AQ160FASSET_PTR: TIntegerField
      FieldName = 'FASSET_PTR'
    end
    object AQ160REMARK: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REMARK'
      Size = 100
    end
  end
  object DS160: TDataSource
    DataSet = AQ160
    Left = 130
    Top = 12
  end
  object ADOQuery1: TADOQuery
    Connection = ACON
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM DATA0160'
      'WHERE RKEY=:Rkey')
    Left = 80
    Top = 64
    object ADOQuery1RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQuery1LOCATION_CODE: TStringField
      FieldName = 'LOCATION_CODE'
      Size = 10
    end
    object ADOQuery1LOCATION_NAME: TStringField
      FieldName = 'LOCATION_NAME'
      Size = 50
    end
    object ADOQuery1TYPE: TWordField
      FieldName = 'TYPE'
    end
    object ADOQuery1OH_degree: TWordField
      FieldName = 'OH_degree'
    end
    object ADOQuery1SUPPLIER_PTR: TIntegerField
      FieldName = 'SUPPLIER_PTR'
    end
    object ADOQuery1FASSET_PTR: TIntegerField
      FieldName = 'FASSET_PTR'
    end
    object ADOQuery1REMARK: TStringField
      FieldName = 'REMARK'
      Size = 100
    end
  end
  object AQ220: TADOQuery
    Connection = ACON
    Parameters = <
      item
        Name = 'RKEY'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'SELECT     dbo.DATA0220.RKEY'
      'FROM         dbo.DATA0160 INNER JOIN'
      
        '                      dbo.DATA0220 ON dbo.DATA0160.RKEY = dbo.DA' +
        'TA0220.LOCATION_PTR'
      'WHERE     (dbo.DATA0160.RKEY = :RKEY)')
    Left = 134
    Top = 64
  end
end
