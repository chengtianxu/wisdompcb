object dm: Tdm
  OldCreateOrder = False
  Left = 445
  Top = 225
  Height = 261
  Width = 232
  object ADOConnection1: TADOConnection
    CommandTimeout = 25
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 8
  end
  object ADOQ: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 112
    Top = 8
  end
  object ADO457: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'v_key'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0457'
      'where rkey=:v_key')
    Left = 32
    Top = 64
    object ADO457RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO457GON_NUMBER: TStringField
      FieldName = 'GON_NUMBER'
      Size = 10
    end
    object ADO457warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object ADO457dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object ADO457TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object ADO457STATUS: TWordField
      FieldName = 'STATUS'
    end
    object ADO457CREATE_DATE: TDateTimeField
      FieldName = 'CREATE_DATE'
    end
    object ADO457CREATE_BY: TIntegerField
      FieldName = 'CREATE_BY'
    end
    object ADO457RECD_BY: TIntegerField
      FieldName = 'RECD_BY'
    end
    object ADO457AUDITED_BY: TIntegerField
      FieldName = 'AUDITED_BY'
    end
    object ADO457AUDITED_DATE: TDateTimeField
      FieldName = 'AUDITED_DATE'
    end
    object ADO457REF_NUMBER: TStringField
      FieldName = 'REF_NUMBER'
      Size = 15
    end
    object ADO457GL_DEALT_BY: TIntegerField
      FieldName = 'GL_DEALT_BY'
    end
    object ADO457GL_DEALT_DATE: TDateTimeField
      FieldName = 'GL_DEALT_DATE'
    end
    object ADO457Cut_NO: TStringField
      FieldName = 'Cut_NO'
    end
    object ADO457gl_ptr: TIntegerField
      FieldName = 'gl_ptr'
    end
  end
  object ADOC457: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'RKEY'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT dbo.Data0005.EMPLOYEE_NAME, dbo.Data0034.DEPT_NAME,'
      '      dbo.Data0015.WAREHOUSE_CODE, dbo.Data0015.ABBR_NAME, '
      '      dbo.Data0457.GON_NUMBER, dbo.Data0457.AUDITED_DATE, '
      
        '      dbo.Data0457.AUDITED_BY, dbo.Data0457.RECD_BY, dbo.Data045' +
        '7.RKEY, '
      
        '      dbo.Data0457.CREATE_DATE, Data0005_1.EMPLOYEE_NAME AS v_em' +
        'p,'
      
        '      dbo.Data0457.STATUS, dbo.Data0457.ttype,dbo.Data0457.ref_n' +
        'umber,'
      
        '      case data0457.ttype when 1 then '#39#21457#25918#21040#37197#26009#21333#39'  when 2  then '#39#21457#25918 +
        #21040#37096#38376#39
      
        '                                       when 3 then '#39#21457#25918#21040#36710#38388#39'   whe' +
        'n 4 then '#39#26448#26009#36864#36135#39
      
        '                                       when 5 then '#39#26434#39033#29289#21697#20986#20179#39'  whe' +
        'n 6 then '#39#26434#39033#29289#21697#36864#36135#39'  end as v_type,'
      
        '       case data0457.status when 0 then '#39#26410#23457#26680#39'  when 1 then '#39#24050#23457#26680#39 +
        '  when 2  then '#39#24050#20837#24080#39' end as v_status'
      'FROM dbo.Data0457 INNER JOIN'
      
        '      dbo.Data0015 ON dbo.Data0457.warehouse_ptr = dbo.Data0015.' +
        'RKEY INNER JOIN'
      
        '      dbo.Data0005 ON dbo.Data0457.CREATE_BY = dbo.Data0005.RKEY' +
        ' INNER JOIN'
      
        '      dbo.Data0034 ON dbo.Data0457.dept_ptr = dbo.Data0034.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0005 Data0005_1 ON dbo.Data0457.RECD_BY = Data0005' +
        '_1.RKEY'
      'WHERE DATA0457.RKEY=:RKEY      ')
    Left = 112
    Top = 64
    object ADOC457EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOC457DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADOC457WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ADOC457ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOC457GON_NUMBER: TStringField
      FieldName = 'GON_NUMBER'
      Size = 10
    end
    object ADOC457AUDITED_DATE: TDateTimeField
      FieldName = 'AUDITED_DATE'
    end
    object ADOC457AUDITED_BY: TIntegerField
      FieldName = 'AUDITED_BY'
    end
    object ADOC457RECD_BY: TIntegerField
      FieldName = 'RECD_BY'
    end
    object ADOC457RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOC457CREATE_DATE: TDateTimeField
      FieldName = 'CREATE_DATE'
    end
    object ADOC457v_emp: TStringField
      FieldName = 'v_emp'
      Size = 16
    end
    object ADOC457STATUS: TWordField
      FieldName = 'STATUS'
    end
    object ADOC457ttype: TSmallintField
      FieldName = 'ttype'
    end
    object ADOC457v_type: TStringField
      FieldName = 'v_type'
      ReadOnly = True
      Size = 12
    end
    object ADOC457v_status: TStringField
      FieldName = 'v_status'
      ReadOnly = True
      Size = 6
    end
    object ADOC457ref_number: TStringField
      FieldName = 'ref_number'
      Size = 15
    end
  end
  object ADOC207: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
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
      
        'SELECT dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_PART_DESCR' +
        'IPTION, '
      
        '      dbo.Data0017.INV_NAME, dbo.Data0022.rohs, dbo.Data0022.LOC' +
        'ATION_PTR_FROM, '
      
        '      dbo.Data0022.PRICE, dbo.Data0022.TAX_2, dbo.Data0001.CURR_' +
        'NAME, '
      '      dbo.Data0002.UNIT_NAME, dbo.Data0207.QUANTITY'
      'FROM dbo.Data0207 INNER JOIN'
      
        '      dbo.Data0017 ON dbo.Data0207.INVENTORY_PTR = dbo.Data0017.' +
        'RKEY INNER JOIN'
      
        '      dbo.Data0022 ON dbo.Data0207.D0022_PTR = dbo.Data0022.RKEY' +
        ' INNER JOIN'
      '      dbo.Data0002 ON '
      
        '      dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0002.RKEY INNER J' +
        'OIN'
      
        '      dbo.Data0016 ON dbo.Data0022.LOCATION_PTR = dbo.Data0016.R' +
        'KEY INNER JOIN'
      
        '      dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY I' +
        'NNER JOIN'
      
        '      dbo.Data0001 ON dbo.Data0456.currency_ptr = dbo.Data0001.R' +
        'KEY'
      'WHERE Data0207.GON_PTR =:rkey ')
    Left = 32
    Top = 128
    object ADOC207INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#21495
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADOC207INV_PART_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object ADOC207INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ADOC207rohs: TStringField
      FieldName = 'rohs'
      Size = 10
    end
    object ADOC207LOCATION_PTR_FROM: TIntegerField
      FieldName = 'LOCATION_PTR_FROM'
    end
    object ADOC207PRICE: TBCDField
      DisplayLabel = #20215#26684
      FieldName = 'PRICE'
      Precision = 10
      Size = 3
    end
    object ADOC207TAX_2: TBCDField
      DisplayLabel = #31246#29575
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object ADOC207CURR_NAME: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_NAME'
    end
    object ADOC207UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object ADOC207QUANTITY: TBCDField
      FieldName = 'QUANTITY'
      Precision = 10
      Size = 3
    end
  end
  object ADOC208: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'SELECT dbo.DATA0208.QUANTITY, dbo.Data0235.goods_guige, '
      
        '      dbo.Data0235.goods_name, dbo.Data0235.goods_type, dbo.Data' +
        '0002.UNIT_NAME, '
      
        '      dbo.Data0016.LOCATION, dbo.Data0235.rohs, dbo.Data0235.sta' +
        'te_tax, '
      '      dbo.Data0235.unit_price'
      'FROM dbo.DATA0208 INNER JOIN'
      
        '      dbo.Data0235 ON dbo.DATA0208.SOURCE_PTR = dbo.Data0235.RKE' +
        'Y INNER JOIN'
      
        '      dbo.Data0016 ON dbo.Data0235.location_ptr = dbo.Data0016.R' +
        'KEY INNER JOIN'
      '      dbo.Data0002 ON dbo.Data0235.unit_ptr = dbo.Data0002.RKEY'
      'where dbo.DATA0208.GON_PTR =:rkey'
      '')
    Left = 112
    Top = 128
    object ADOC208QUANTITY: TBCDField
      DisplayLabel = #25968#37327
      FieldName = 'QUANTITY'
      Precision = 10
      Size = 3
    end
    object ADOC208goods_guige: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'goods_guige'
      Size = 200
    end
    object ADOC208goods_name: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'goods_name'
      Size = 60
    end
    object ADOC208goods_type: TStringField
      DisplayLabel = #26448#26009#31867#21035
      FieldName = 'goods_type'
    end
    object ADOC208UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object ADOC208LOCATION: TStringField
      DisplayLabel = #20301#32622
      FieldName = 'LOCATION'
      Size = 10
    end
    object ADOC208rohs: TStringField
      FieldName = 'rohs'
      Size = 10
    end
    object ADOC208state_tax: TBCDField
      DisplayLabel = #31246#29575
      FieldName = 'state_tax'
      Precision = 4
      Size = 2
    end
    object ADOC208unit_price: TBCDField
      DisplayLabel = #20215#26684
      FieldName = 'unit_price'
      Precision = 10
      Size = 3
    end
  end
end
