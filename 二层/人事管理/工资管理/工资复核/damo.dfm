object DM: TDM
  OldCreateOrder = False
  Left = 303
  Top = 157
  Height = 218
  Width = 424
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 72
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * '
      ',(select isnull(employee_name,'#39#39')from data0005 '
      'where rkey=salarycheck.checkman)as S_checkman,'
      
        ' (case when isnull(ischeck,0)=1 then '#39#24050#23457#26680#39'else'#39#26410#23457#26680#39'end) as S_isc' +
        'heck,'
      
        ' (case when isnull(actived,0)=1 then '#39#24050#28608#27963#39'else'#39'-'#39'end) as S_activ' +
        'ed'
      'from salarycheck')
    Left = 104
    Top = 8
    object ADOQuery1rkey: TIntegerField
      FieldName = 'rkey'
    end
    object ADOQuery1checkdate: TDateTimeField
      FieldName = 'checkdate'
      DisplayFormat = 'yyyy-MM-dd'
    end
    object ADOQuery1checkyearmonth: TWideStringField
      FieldName = 'checkyearmonth'
      Size = 10
    end
    object ADOQuery1ischeck: TIntegerField
      FieldName = 'ischeck'
    end
    object ADOQuery1checkman: TIntegerField
      FieldName = 'checkman'
    end
    object ADOQuery1status: TIntegerField
      FieldName = 'status'
    end
    object ADOQuery1checkdesc: TWideStringField
      FieldName = 'checkdesc'
      Size = 50
    end
    object ADOQuery1actived: TIntegerField
      FieldName = 'actived'
    end
    object ADOQuery1S_checkman: TStringField
      FieldName = 'S_checkman'
      ReadOnly = True
      Size = 30
    end
    object ADOQuery1S_ischeck: TStringField
      FieldName = 'S_ischeck'
      ReadOnly = True
      Size = 6
    end
    object ADOQuery1S_actived: TStringField
      FieldName = 'S_actived'
      ReadOnly = True
      Size = 6
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 160
    Top = 8
  end
  object ADOTMP: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 232
    Top = 8
  end
end
