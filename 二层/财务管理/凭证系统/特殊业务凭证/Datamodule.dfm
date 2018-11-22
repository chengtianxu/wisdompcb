object DM: TDM
  OldCreateOrder = False
  Left = 621
  Top = 334
  Height = 416
  Width = 476
  object ADOConnection1: TADOConnection
    ConnectionTimeout = 25
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 15
  end
  object ADOData0128: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 'select rkey,gl_acct_ptr from data0128'#13#10
    FieldDefs = <
      item
        Name = 'rkey'
        Attributes = [faReadonly, faFixed]
        DataType = ftAutoInc
      end
      item
        Name = 'gl_acct_ptr'
        Attributes = [faFixed]
        DataType = ftInteger
      end>
    Parameters = <>
    StoreDefs = True
    Left = 128
    Top = 72
  end
  object ADOData0508: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from data0508'
    Parameters = <>
    Left = 211
    Top = 16
    object ADOData0508RKEY: TSmallintField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOData0508CLASS1: TSmallintField
      FieldName = 'CLASS1'
    end
    object ADOData0508CLASS2: TSmallintField
      FieldName = 'CLASS2'
    end
    object ADOData0508CLASS3: TSmallintField
      FieldName = 'CLASS3'
    end
    object ADOData0508CLASS4: TSmallintField
      FieldName = 'CLASS4'
    end
    object ADOData0508CLASS5: TSmallintField
      FieldName = 'CLASS5'
    end
    object ADOData0508CLASS6: TSmallintField
      FieldName = 'CLASS6'
    end
    object ADOData0508OPEN_DATE: TDateTimeField
      FieldName = 'OPEN_DATE'
    end
    object ADOData0508RESET_FLAG: TSmallintField
      FieldName = 'RESET_FLAG'
    end
    object ADOData0508CURR_FYEAR: TIntegerField
      FieldName = 'CURR_FYEAR'
    end
    object ADOData0508CURR_PERIOD: TSmallintField
      FieldName = 'CURR_PERIOD'
    end
    object ADOData0508DEPRE_FLAG: TSmallintField
      FieldName = 'DEPRE_FLAG'
    end
    object ADOData0508INITIALIZED: TSmallintField
      FieldName = 'INITIALIZED'
    end
    object ADOData0508AP_FLAG: TStringField
      FieldName = 'AP_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADOData0508AR_FLAG: TStringField
      FieldName = 'AR_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADOData0508STOCK_FLAG: TStringField
      FieldName = 'STOCK_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADOData0508CONTROL_DATE: TDateTimeField
      FieldName = 'CONTROL_DATE'
    end
    object ADOData0508fin_control1: TWordField
      FieldName = 'fin_control1'
    end
    object ADOData0508fin_control2: TWordField
      FieldName = 'fin_control2'
    end
    object ADOData0508fasset_initlized: TStringField
      FieldName = 'fasset_initlized'
      FixedChar = True
      Size = 1
    end
  end
  object ADOQ0106: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT Data0103.GL_ACC_NUMBER, Data0103.GL_DESCRIPTION, '#13#10'      ' +
      'dbo.Data0001.CURR_NAME, Data0103_2.GL_DESCRIPTION AS tGL_DESCRIP' +
      'TION, '#13#10'      Data0103_1.GL_DESCRIPTION AS pGL_DESCRIPTION, data' +
      '0001.curr_code,'#13#10'      dbo.Data0106.GL_HEADER_PTR, dbo.Data0106.' +
      'RKEY, '#13#10'      dbo.Data0106.GL_ACCT_NO_PTR, dbo.Data0106.REF_NUMB' +
      'ER, '#13#10'      dbo.Data0106.DESCRIPTION, dbo.Data0106.SRCE_PTR, dbo' +
      '.Data0106.AMOUNT, '#13#10'      dbo.Data0106.D_C, dbo.Data0106.FYEAR, ' +
      'dbo.Data0106.PERIOD, '#13#10'      dbo.Data0106.INV_PTR, dbo.Data0106.' +
      'UNIT_PTR, dbo.Data0106.CURR_PTR, '#13#10'      dbo.Data0106.PRICE, dbo' +
      '.Data0106.EXCH_RATE,'#13#10'(case when data0103_4.GL_DESCRIPTION is no' +
      't null then'#13#10'  data0103_4.GL_DESCRIPTION+'#39'-'#39'+'#13#10'  data0103_3.GL_D' +
      'ESCRIPTION+'#39'-'#39'+'#13#10'  data0103_2.GL_DESCRIPTION+'#39'-'#39'+'#13#10'  data0103_1.' +
      'GL_DESCRIPTION+'#39'-'#39'+data0103.GL_DESCRIPTION'#13#10'else case when data0' +
      '103_3.GL_DESCRIPTION is not null then'#13#10'  data0103_3.GL_DESCRIPTI' +
      'ON+'#39'-'#39'+'#13#10'  data0103_2.GL_DESCRIPTION+'#39'-'#39'+'#13#10'  data0103_1.GL_DESCR' +
      'IPTION+'#39'-'#39'+data0103.GL_DESCRIPTION'#13#10' else case when data0103_2.G' +
      'L_DESCRIPTION is not null then'#13#10'  data0103_2.GL_DESCRIPTION+'#39'-'#39'+' +
      #13#10'  data0103_1.GL_DESCRIPTION+'#39'-'#39'+data0103.GL_DESCRIPTION'#13#10' else' +
      ' case when data0103_1.GL_DESCRIPTION is not null then'#13#10'   data01' +
      '03_1.GL_DESCRIPTION+'#39'-'#39'+data0103.GL_DESCRIPTION'#13#10' else '#13#10'   data' +
      '0103.GL_DESCRIPTION'#13#10'end '#13#10'end'#13#10'end'#13#10'end) as description_2'#13#10'FROM' +
      ' dbo.Data0103 Data0103_4 RIGHT OUTER JOIN'#13#10'      dbo.Data0103 Da' +
      'ta0103_3 ON '#13#10'      Data0103_4.RKEY = Data0103_3.PARENT_PTR RIGH' +
      'T OUTER JOIN'#13#10'      dbo.Data0103 Data0103_2 ON '#13#10'      Data0103_' +
      '3.RKEY = Data0103_2.PARENT_PTR RIGHT OUTER JOIN'#13#10'      dbo.Data0' +
      '103 Data0103_1 ON '#13#10'      Data0103_2.RKEY = Data0103_1.PARENT_PT' +
      'R RIGHT OUTER JOIN'#13#10'      dbo.Data0103 ON Data0103_1.RKEY = dbo.' +
      'Data0103.PARENT_PTR'#13#10'inner join  dbo.Data0106 ON Data0103.RKEY =' +
      ' dbo.Data0106.GL_ACCT_NO_PTR INNER JOIN'#13#10'      dbo.Data0001 ON d' +
      'bo.Data0106.CURR_PTR = dbo.Data0001.RKEY'#13#10'WHERE (dbo.Data0106.GL' +
      '_HEADER_PTR =  :rkey)'#13#10
    DataSource = FrmMain.DataSource1
    IndexFieldNames = 'RKEY'
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 209
    Top = 128
    object ADOQ0106GL_ACC_NUMBER: TStringField
      FieldName = 'GL_ACC_NUMBER'
      FixedChar = True
      Size = 18
    end
    object ADOQ0106GL_DESCRIPTION: TStringField
      FieldName = 'GL_DESCRIPTION'
      Size = 50
    end
    object ADOQ0106curr_code: TStringField
      FieldName = 'curr_code'
      Size = 5
    end
    object ADOQ0106CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object ADOQ0106tGL_DESCRIPTION: TStringField
      FieldName = 'tGL_DESCRIPTION'
      Size = 50
    end
    object ADOQ0106pGL_DESCRIPTION: TStringField
      FieldName = 'pGL_DESCRIPTION'
      Size = 50
    end
    object ADOQ0106GL_HEADER_PTR: TIntegerField
      FieldName = 'GL_HEADER_PTR'
    end
    object ADOQ0106RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQ0106GL_ACCT_NO_PTR: TIntegerField
      FieldName = 'GL_ACCT_NO_PTR'
    end
    object ADOQ0106REF_NUMBER: TStringField
      FieldName = 'REF_NUMBER'
      Size = 10
    end
    object ADOQ0106DESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 100
    end
    object ADOQ0106SRCE_PTR: TIntegerField
      FieldName = 'SRCE_PTR'
    end
    object ADOQ0106AMOUNT: TBCDField
      FieldName = 'AMOUNT'
      Precision = 18
      Size = 2
    end
    object ADOQ0106D_C: TStringField
      FieldName = 'D_C'
      FixedChar = True
      Size = 1
    end
    object ADOQ0106FYEAR: TIntegerField
      FieldName = 'FYEAR'
    end
    object ADOQ0106PERIOD: TSmallintField
      FieldName = 'PERIOD'
    end
    object ADOQ0106INV_PTR: TIntegerField
      FieldName = 'INV_PTR'
    end
    object ADOQ0106UNIT_PTR: TIntegerField
      FieldName = 'UNIT_PTR'
    end
    object ADOQ0106CURR_PTR: TIntegerField
      FieldName = 'CURR_PTR'
    end
    object ADOQ0106PRICE: TFloatField
      FieldName = 'PRICE'
    end
    object ADOQ0106EXCH_RATE: TFloatField
      FieldName = 'EXCH_RATE'
    end
    object ADOQ0106description_2: TStringField
      FieldName = 'description_2'
      ReadOnly = True
      Size = 254
    end
  end
  object ADOData0103: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT dbo.Data0103.RKEY, dbo.Data0103.CURR_TP, dbo.Data0103.CUR' +
      'R_PTR,'#13#10'      CASE data0103.db_cr WHEN '#39'D'#39' THEN '#39#20511#26041#39' WHEN '#39'C'#39' TH' +
      'EN '#39#36151#26041#39' END AS '#31867#22411','#13#10'      case data0103.curr_tp when 0 then '#39#19981#26680#31639 +
      #39#13#10'                            when 1 then '#39#26680#31639#39#13#10'               ' +
      '             when 2 then '#39#26680#31639#21333#19968#39#13#10'      end  as '#22806#24065#26680#31639','#13#10'      Data' +
      '0103.GL_ACC_NUMBER,'#13#10#13#10'(case when data0103_4.GL_DESCRIPTION is n' +
      'ot null then'#13#10'  data0103_4.GL_DESCRIPTION+'#39'-'#39'+'#13#10'  data0103_3.GL_' +
      'DESCRIPTION+'#39'-'#39'+'#13#10'  data0103_2.GL_DESCRIPTION+'#39'-'#39'+'#13#10'  data0103_1' +
      '.GL_DESCRIPTION+'#39'-'#39'+data0103.GL_DESCRIPTION'#13#10'else case when data' +
      '0103_3.GL_DESCRIPTION is not null then'#13#10'  data0103_3.GL_DESCRIPT' +
      'ION+'#39'-'#39'+'#13#10'  data0103_2.GL_DESCRIPTION+'#39'-'#39'+'#13#10'  data0103_1.GL_DESC' +
      'RIPTION+'#39'-'#39'+data0103.GL_DESCRIPTION'#13#10' else case when data0103_2.' +
      'GL_DESCRIPTION is not null then'#13#10'  data0103_2.GL_DESCRIPTION+'#39'-'#39 +
      '+'#13#10'  data0103_1.GL_DESCRIPTION+'#39'-'#39'+data0103.GL_DESCRIPTION'#13#10' els' +
      'e case when data0103_1.GL_DESCRIPTION is not null then'#13#10'   data0' +
      '103_1.GL_DESCRIPTION+'#39'-'#39'+data0103.GL_DESCRIPTION'#13#10' else '#13#10'   dat' +
      'a0103.GL_DESCRIPTION'#13#10'end '#13#10'end'#13#10'end'#13#10'end) as description_2'#13#10#13#10'F' +
      'ROM dbo.Data0103 Data0103_4 RIGHT OUTER JOIN'#13#10'      dbo.Data0103' +
      ' Data0103_3 ON '#13#10'      Data0103_4.RKEY = Data0103_3.PARENT_PTR R' +
      'IGHT OUTER JOIN'#13#10'      dbo.Data0103 Data0103_2 ON '#13#10'      Data01' +
      '03_3.RKEY = Data0103_2.PARENT_PTR RIGHT OUTER JOIN'#13#10'      dbo.Da' +
      'ta0103 Data0103_1 ON '#13#10'      Data0103_2.RKEY = Data0103_1.PARENT' +
      '_PTR RIGHT OUTER JOIN'#13#10'      dbo.Data0103 ON Data0103_1.RKEY = d' +
      'bo.Data0103.PARENT_PTR'#13#10'WHERE (Data0103.HAS_CHILD = 0) and (Data' +
      '0103.ACTIVE_FLAG='#39'Y'#39')'#13#10'order by dbo.Data0103.gl_acc_number'#13#10
    Parameters = <>
    Prepared = True
    Left = 128
    Top = 16
    object ADOData0103RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOData0103CURR_TP: TWordField
      FieldName = 'CURR_TP'
    end
    object ADOData0103CURR_PTR: TIntegerField
      FieldName = 'CURR_PTR'
    end
    object ADOData0103DSDesigner: TStringField
      FieldName = #31867#22411
      ReadOnly = True
      Size = 4
    end
    object ADOData0103DSDesigner2: TStringField
      FieldName = #22806#24065#26680#31639
      ReadOnly = True
      Size = 8
    end
    object ADOData0103GL_ACC_NUMBER: TStringField
      DisplayLabel = #31185#30446#20195#30721
      FieldName = 'GL_ACC_NUMBER'
      FixedChar = True
      Size = 18
    end
    object ADOData0103description_2: TStringField
      DisplayLabel = #31185#30446#21517#31216
      FieldName = 'description_2'
      ReadOnly = True
      Size = 101
    end
  end
  object Ado105: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = Ado105CalcFields
    Parameters = <
      item
        Name = 'vdate1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'vdate2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'vStaus0'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end
      item
        Name = 'vStaus1'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end
      item
        Name = 'vStaus2'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end
      item
        Name = 'vStaus3'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end
      item
        Name = 'vStaus4'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'SELECT Data0105.RKEY, Data0105.VOUCHER, Data0105.TRANS_TYPE,'
      
        'Data0105.ENTERED_DT, Data0105.STATUS, Data0105.FYEAR, Data0105.P' +
        'ERIOD,'
      
        'Data0005.EMPLOYEE_NAME,Data0105.ATTACHED,Data0105.VOU_TYPE,data0' +
        '105.SPECIAL_POSTING,'
      
        'data0105.ENTERED_BY_EMPL_PTR,data0105.BATCH_NUMBER,'#39#29305#27530#36716#36134#39' as vTr' +
        'anType'
      'FROM Data0105 INNER JOIN'
      '     Data0005 ON Data0105.ENTERED_BY_EMPL_PTR = Data0005.RKEY'
      'where'
      'VOU_TYPE=4'
      'and entered_dt>=:vdate1'
      'and entered_dt<=:vdate2'
      'and data0105.STATUS<>:vStaus0'
      'and data0105.STATUS<>:vStaus1'
      'and data0105.STATUS<>:vStaus2'
      'and data0105.STATUS<>:vStaus3'
      'and  data0105.STATUS<>:vStaus4'
      'order by Data0105.VOUCHER')
    Left = 210
    Top = 73
    object Ado105rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object Ado105voucher: TStringField
      DisplayLabel = #20973#35777#32534#21495
      FieldName = 'voucher'
      FixedChar = True
      Size = 12
    end
    object Ado105TRANS_TYPE: TSmallintField
      FieldName = 'TRANS_TYPE'
    end
    object Ado105entered_dt: TDateTimeField
      FieldName = 'entered_dt'
    end
    object Ado105status: TSmallintField
      FieldName = 'status'
    end
    object Ado105FYEAR: TIntegerField
      FieldName = 'FYEAR'
    end
    object Ado105PERIOD: TSmallintField
      FieldName = 'PERIOD'
    end
    object Ado105employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object Ado105cstatus: TStringField
      FieldKind = fkCalculated
      FieldName = 'cstatus'
      Calculated = True
    end
    object Ado105vTranType: TStringField
      FieldName = 'vTranType'
    end
    object Ado105ATTACHED: TSmallintField
      FieldName = 'ATTACHED'
    end
    object Ado105VOU_TYPE: TSmallintField
      FieldName = 'VOU_TYPE'
    end
    object Ado105ENTERED_BY_EMPL_PTR: TIntegerField
      FieldName = 'ENTERED_BY_EMPL_PTR'
    end
    object Ado105BATCH_NUMBER: TStringField
      FieldName = 'BATCH_NUMBER'
      Size = 16
    end
    object Ado105SPECIAL_POSTING: TStringField
      FieldName = 'SPECIAL_POSTING'
      FixedChar = True
      Size = 1
    end
  end
  object ADOQ: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 280
    Top = 16
  end
  object ADOQ0001: TADOQuery
    Connection = ADOConnection1
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'select rkey,curr_code,curr_name,exch_rate'
      'from data0001 order by curr_code')
    Left = 40
    Top = 128
    object ADOQ0001rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQ0001curr_code: TStringField
      FieldName = 'curr_code'
      Size = 5
    end
    object ADOQ0001curr_name: TStringField
      FieldName = 'curr_name'
    end
    object ADOQ0001exch_rate: TFloatField
      FieldName = 'exch_rate'
    end
  end
  object ADOData0001: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'vrkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0001 where rkey=:vrkey')
    Left = 120
    Top = 128
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    Left = 338
    Top = 15
  end
end
