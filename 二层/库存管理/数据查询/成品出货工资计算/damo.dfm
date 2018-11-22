object dm: Tdm
  OldCreateOrder = False
  Left = 551
  Top = 281
  Height = 342
  Width = 363
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 32
  end
  object AQ34: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'select rkey,DEPT_CODE, DEPT_NAME'#13#10'from data0034'#13#10'where wage_flag' +
      '=1'#13#10'order by dept_code'
    Parameters = <>
    Left = 40
    Top = 80
    object AQ34rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object AQ34DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object AQ34DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
  end
  object ADS38: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'select data0038.dept_ptr'#13#10'from data0038 inner join data0034'#13#10'on ' +
      'data0038.dept_ptr=data0034.rkey'#13#10'where data0038.source_ptr=:rkey' +
      '25 and'#13#10'          data0034.wage_flag=1'#13#10
    Parameters = <
      item
        Name = 'rkey25'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 40
    Top = 136
    object ADS38dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
  end
  object ADS494: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT     TOP (100) PERCENT dbo.Data0494.PARAMETER_VALUE, dbo.D' +
      'ata0025.RKEY AS rkey25, dbo.Data0034.RKEY AS rkey34'#13#10'FROM       ' +
      '  dbo.Data0025 INNER JOIN'#13#10'                      dbo.Data0038 ON' +
      ' dbo.Data0025.RKEY = dbo.Data0038.SOURCE_PTR INNER JOIN'#13#10'       ' +
      '               dbo.Data0034 ON dbo.Data0038.DEPT_PTR = dbo.Data0' +
      '034.RKEY INNER JOIN'#13#10'                      dbo.Data0494 ON dbo.D' +
      'ata0038.SOURCE_PTR = dbo.Data0494.custpart_ptr AND '#13#10'           ' +
      '           dbo.Data0038.STEP_NUMBER = dbo.Data0494.step_number I' +
      'NNER JOIN'#13#10'                      dbo.Data0278 ON dbo.Data0494.PA' +
      'RAMETER_PTR = dbo.Data0278.RKEY'#13#10'WHERE     (dbo.Data0034.DEPT_NA' +
      'ME = '#39#23383#31526#39') AND (dbo.Data0278.PARAMETER_DESC = '#39#38754#25968#39') AND (dbo.Dat' +
      'a0025.RKEY = :rkey25)'
    Parameters = <
      item
        Name = 'rkey25'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 40
    Top = 188
    object ADS494PARAMETER_VALUE: TStringField
      FieldName = 'PARAMETER_VALUE'
      Size = 30
    end
    object ADS494rkey25: TIntegerField
      FieldName = 'rkey25'
      ReadOnly = True
    end
    object ADS494rkey34: TIntegerField
      FieldName = 'rkey34'
      ReadOnly = True
    end
  end
end
