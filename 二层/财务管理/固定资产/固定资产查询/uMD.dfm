object DM: TDM
  OldCreateOrder = False
  Left = 357
  Top = 195
  Height = 494
  Width = 682
  object Conn: TADOConnection
    ConnectionTimeout = 25
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 8
  end
  object Qery: TADOQuery
    Connection = Conn
    Parameters = <>
    Left = 192
    Top = 56
  end
  object DS517: TADODataSet
    Connection = Conn
    Parameters = <>
    Left = 192
    Top = 120
  end
  object DS326: TADODataSet
    Connection = Conn
    LockType = ltBatchOptimistic
    CommandText = 'SELECT * '#13#10'FROM data0326 where rkey=:vrkey'
    Parameters = <
      item
        Name = 'vrkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 80
    Top = 136
  end
  object DS325: TADODataSet
    Connection = Conn
    LockType = ltBatchOptimistic
    CommandText = 'SELECT * '#13#10'FROM data0325 where rkey=:vrkey'
    Parameters = <
      item
        Name = 'vrkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 32
    Top = 136
  end
  object DataSource1: TDataSource
    DataSet = Qery517
    Left = 32
    Top = 72
  end
  object Qery517: TADODataSet
    Connection = Conn
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    CommandText = 
      'select Data0517.id_code, Data0517.BOOK_DATE, Data0517.FASSET_COD' +
      'E, data0517.orig_BOOK_DATE,'#13#10'(select data0103.GL_ACC_NUMber from' +
      ' data0103 where rkey = data0517.fasset_gl_ptr) as GL_ACC_NUMber2' +
      ','#13#10'(select top 1 data0034.Dept_Name from data0326 inner join dat' +
      'a0034 on data0326.dept_ptr = data0034.rkey'#13#10'where data0326.fasse' +
      't_ptr = data0517.rkey order by data0326.rkey asc) as dept,'#13#10'(sel' +
      'ect top 1 Data0103.GL_ACC_NUMber from data0326 inner join Data01' +
      '03 on data0326.FACCU_DEPT_GL_PTR = Data0103.RKEY'#13#10'where data0326' +
      '.fasset_ptr = data0517.rkey order by data0326.rkey asc) as GL_AC' +
      'C_NUMber326,'#13#10'      Data0517.FASSET_NAME,Data0517.FASSET_DESC, D' +
      'ata0514.FASSET_TYPE, Data0515.FASSET_ALT_TYPE, '#13#10'      Data0105.' +
      'VOUCHER, Data0516.FASSET_STATUS, Data0517.ORIGINAL_VALUE, Data05' +
      '17.dept_ptr,'#13#10'      round(Data0517.SUMMED_DEPRE,2)  SUMMED_DEPRE' +
      ', Data0517.NET_VALUE, Data0517.SURPLUS_RATE, data0517.voucher_pt' +
      'r, case Data0516.IN_DEPRECIATION when 0 then '#39#19981#25240#26087#39' when 1 then '#39 +
      #25240#26087#39' end as IN_Depr,'#13#10'      Data0517.SURPLUS, CASE WHEN (Data0514' +
      '.depr_mthd_ptr = 0) '#13#10'      THEN '#39#19981#35745#25552#25240#26087#39' WHEN (Data0514.depr_mth' +
      'd_ptr = 1) '#13#10'      THEN '#39#24179#22343#24180#38480#27861#39' WHEN (Data0514.depr_mthd_ptr = 2' +
      ') '#13#10'      THEN '#39#24037#20316#37327#27861#39' WHEN (Data0514.depr_mthd_ptr = 3) '#13#10'      ' +
      'THEN '#39#21452#20493#20313#39069#36882#20943#27861#39' WHEN (Data0514.depr_mthd_ptr = 3) '#13#10'      THEN '#39#24037 +
      #20316#24180#38480#27861#39' END AS DEPRE_MTHD_PTR, '#13#10'      Data0517.EXPECTED_LIFE_MONT' +
      'HS, Data0517.DEPRED_MONTHS, '#13#10'      Data0517.LOADING_UNIT, Data0' +
      '517.MONTH_DEPRE_RATE,Data0103.GL_Acc_Number,Data0103.GL_Descript' +
      'ion, '#13#10'      Data0517.MONTH_DEPRE_AMT , Data0517.LOCATION, '#13#10'   ' +
      '   case when Data0105.STATUS=0 then '#39#26410#23457#39#13#10'      when Data0105.ST' +
      'ATUS=1 then '#39#20250#35745#24050#23457#39#13#10'when Data0105.STATUS=2 then '#39#20027#31649#24050#23457#39#9#13#10'when Da' +
      'ta0105.STATUS=3 then '#39#24050#30331#24080#39#13#10'when Data0105.STATUS=4 then '#39#20986#32435#23457#26680#39' e' +
      'nd as STATUS, Data0517.RKEY,data0015.abbr_name,Data0517.orig_ori' +
      'ginal_value,Data0517.user_date,data0517.supplier_name,data0517.r' +
      'emark'#13#10#13#10'FROM Data0517 '#13#10'INNER JOIN'#13#10'      Data0514 ON Data0517.' +
      'FASSET_TYPE_PTR = Data0514.RKEY '#13#10'INNER JOIN'#13#10'      Data0515 ON ' +
      'Data0517.ALT_TYPE_PTR = Data0515.RKEY '#13#10'INNER JOIN'#13#10'      Data05' +
      '16 ON Data0517.STATUS_PTR = Data0516.RKEY'#13#10#13#10'LEFT OUTER JOIN'#13#10'  ' +
      '    Data0105 ON Data0517.voucher_ptr = Data0105.RKEY Inner join ' +
      #13#10'      Data0103 on Data0103.rKey=Data0517.DEPRE_ACCT_PTR'#13#10#13#10'   ' +
      '  left join data0015 on data0517.warehouse_ptr=data0015.rkey'#13#10'WH' +
      'ERE Data0517.active_flag = 1 AND (1=1)  order by Data0517.Fasset' +
      '_Code'#13#10#13#10
    FieldDefs = <
      item
        Name = 'id_code'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'BOOK_DATE'
        Attributes = [faFixed]
        DataType = ftDateTime
      end
      item
        Name = 'FASSET_CODE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'orig_BOOK_DATE'
        Attributes = [faFixed]
        DataType = ftDateTime
      end
      item
        Name = 'GL_ACC_NUMber2'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 18
      end
      item
        Name = 'dept'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'GL_ACC_NUMber326'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 18
      end
      item
        Name = 'FASSET_NAME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'FASSET_DESC'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'FASSET_TYPE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'FASSET_ALT_TYPE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'VOUCHER'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'FASSET_STATUS'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ORIGINAL_VALUE'
        Attributes = [faFixed]
        DataType = ftBCD
        Precision = 12
        Size = 2
      end
      item
        Name = 'dept_ptr'
        Attributes = [faFixed]
        DataType = ftInteger
      end
      item
        Name = 'SUMMED_DEPRE'
        Attributes = [faReadonly, faFixed]
        DataType = ftBCD
        Precision = 12
        Size = 2
      end
      item
        Name = 'NET_VALUE'
        Attributes = [faFixed]
        DataType = ftBCD
        Precision = 12
        Size = 2
      end
      item
        Name = 'SURPLUS_RATE'
        Attributes = [faFixed]
        DataType = ftFloat
      end
      item
        Name = 'voucher_ptr'
        Attributes = [faFixed]
        DataType = ftInteger
      end
      item
        Name = 'IN_Depr'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 6
      end
      item
        Name = 'SURPLUS'
        Attributes = [faFixed]
        DataType = ftFloat
      end
      item
        Name = 'DEPRE_MTHD_PTR'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 14
      end
      item
        Name = 'EXPECTED_LIFE_MONTHS'
        Attributes = [faFixed]
        DataType = ftFloat
      end
      item
        Name = 'DEPRED_MONTHS'
        Attributes = [faFixed]
        DataType = ftFloat
      end
      item
        Name = 'LOADING_UNIT'
        Attributes = [faFixed]
        DataType = ftFixedChar
        Size = 10
      end
      item
        Name = 'MONTH_DEPRE_RATE'
        Attributes = [faFixed]
        DataType = ftFloat
      end
      item
        Name = 'GL_Acc_Number'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'GL_Description'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'MONTH_DEPRE_AMT'
        Attributes = [faFixed]
        DataType = ftBCD
        Precision = 19
        Size = 2
      end
      item
        Name = 'LOCATION'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'STATUS'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 8
      end
      item
        Name = 'RKEY'
        Attributes = [faReadonly, faFixed]
        DataType = ftAutoInc
      end
      item
        Name = 'abbr_name'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'orig_original_value'
        Attributes = [faFixed]
        DataType = ftFloat
      end
      item
        Name = 'user_date'
        Attributes = [faFixed]
        DataType = ftDateTime
      end
      item
        Name = 'supplier_name'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'remark'
        DataType = ftString
        Size = 100
      end>
    Parameters = <>
    StoreDefs = True
    Left = 88
    Top = 72
    object Qery517id_code: TStringField
      FieldName = 'id_code'
      FixedChar = True
      Size = 15
    end
    object Qery517BOOK_DATE: TDateTimeField
      FieldName = 'BOOK_DATE'
    end
    object Qery517FASSET_CODE: TStringField
      FieldName = 'FASSET_CODE'
      Size = 10
    end
    object Qery517FASSET_NAME: TStringField
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object Qery517FASSET_TYPE: TStringField
      FieldName = 'FASSET_TYPE'
      FixedChar = True
    end
    object Qery517FASSET_ALT_TYPE: TStringField
      FieldName = 'FASSET_ALT_TYPE'
      FixedChar = True
    end
    object Qery517VOUCHER: TStringField
      FieldName = 'VOUCHER'
      FixedChar = True
      Size = 12
    end
    object Qery517FASSET_STATUS: TStringField
      FieldName = 'FASSET_STATUS'
    end
    object Qery517ORIGINAL_VALUE: TFloatField
      DisplayLabel = #24403#21069#21407#20540
      FieldName = 'ORIGINAL_VALUE'
    end
    object Qery517SUMMED_DEPRE: TFloatField
      FieldName = 'SUMMED_DEPRE'
    end
    object Qery517NET_VALUE: TFloatField
      FieldName = 'NET_VALUE'
    end
    object Qery517SURPLUS_RATE: TFloatField
      FieldName = 'SURPLUS_RATE'
    end
    object Qery517SURPLUS: TFloatField
      FieldName = 'SURPLUS'
    end
    object Qery517DEPRE_MTHD_PTR: TStringField
      FieldName = 'DEPRE_MTHD_PTR'
      ReadOnly = True
      Size = 14
    end
    object Qery517EXPECTED_LIFE_MONTHS: TFloatField
      FieldName = 'EXPECTED_LIFE_MONTHS'
    end
    object Qery517DEPRED_MONTHS: TFloatField
      FieldName = 'DEPRED_MONTHS'
    end
    object Qery517LOADING_UNIT: TStringField
      FieldName = 'LOADING_UNIT'
      FixedChar = True
      Size = 10
    end
    object Qery517MONTH_DEPRE_RATE: TFloatField
      FieldName = 'MONTH_DEPRE_RATE'
    end
    object Qery517MONTH_DEPRE_AMT: TBCDField
      FieldName = 'MONTH_DEPRE_AMT'
      Precision = 19
      Size = 2
    end
    object Qery517LOCATION: TStringField
      FieldName = 'LOCATION'
      FixedChar = True
      Size = 40
    end
    object Qery517remark: TStringField
      FieldName = 'remark'
      Size = 100
    end
    object Qery517RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object Qery517FASSET_DESC: TStringField
      FieldName = 'FASSET_DESC'
      Size = 40
    end
    object Qery517STATUS: TStringField
      FieldName = 'STATUS'
      ReadOnly = True
      Size = 8
    end
    object Qery517dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object Qery517voucher_ptr: TIntegerField
      FieldName = 'voucher_ptr'
    end
    object Qery517IN_Depr: TStringField
      FieldName = 'IN_Depr'
      Size = 6
    end
    object Qery517GL_Acc_Number: TStringField
      FieldName = 'GL_Acc_Number'
      Size = 18
    end
    object Qery517GL_Description: TStringField
      FieldName = 'GL_Description'
      Size = 50
    end
    object Qery517abbr_name: TStringField
      FieldName = 'abbr_name'
      Size = 10
    end
    object Qery517orig_original_value: TFloatField
      DisplayLabel = #20837#24080#21407#20540
      FieldName = 'orig_original_value'
    end
    object Qery517user_date: TDateTimeField
      DisplayLabel = #36141#20837#26085#26399
      FieldName = 'user_date'
    end
    object Qery517supplier_name: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'supplier_name'
      Size = 50
    end
    object Qery517orig_BOOK_DATE: TDateTimeField
      FieldName = 'orig_BOOK_DATE'
    end
    object strngfldQery517dept: TStringField
      FieldName = 'dept'
      ReadOnly = True
      Size = 30
    end
    object strngfldQery517GL_ACC_NUMber2: TStringField
      FieldName = 'GL_ACC_NUMber2'
      ReadOnly = True
      Size = 18
    end
    object strngfldQery517GL_ACC_NUMber326: TStringField
      FieldName = 'GL_ACC_NUMber326'
      ReadOnly = True
      Size = 18
    end
  end
  object Qery0001: TADOQuery
    Connection = Conn
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
      'SELECT '
      'FROM data0001'
      'WHERE (rkey =:vrkey)')
    Left = 192
    Top = 184
  end
  object Qery103: TADOQuery
    Connection = Conn
    Parameters = <>
    SQL.Strings = (
      
        'SELECT dbo.Data0103.RKEY, dbo.Data0103.CURR_TP, dbo.Data0103.CUR' +
        'R_PTR,'
      
        '      CASE data0103.db_cr WHEN '#39'D'#39' THEN '#39#20511#26041#39' WHEN '#39'C'#39' THEN '#39#36151#26041#39' ' +
        'END AS '#31867#22411','
      '      case data0103.curr_tp when 0 then '#39#19981#26680#31639#39
      '                            when 1 then '#39#26680#31639#39
      '                            when 2 then '#39#26680#31639#21333#19968#39
      '      end  as '#22806#24065#26680#31639','
      
        '      Data0103.GL_ACC_NUMBER, ISNULL(Data0103_1.GL_DESCRIPTION, ' +
        #39#39')'
      '      +'#39#9472#39'+ Data0103.GL_DESCRIPTION AS description_2,'
      '      Data0103_2.GL_DESCRIPTION'
      'FROM dbo.Data0103 Data0103_2 RIGHT OUTER JOIN'
      '      dbo.Data0103 Data0103_1 ON '
      '      Data0103_2.RKEY = Data0103_1.PARENT_PTR RIGHT OUTER JOIN'
      '      dbo.Data0103 ON Data0103_1.RKEY = dbo.Data0103.PARENT_PTR'
      'WHERE (dbo.Data0103.HAS_CHILD = 0)')
    Left = 240
    Top = 120
    object Qery103RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object Qery103CURR_TP: TWordField
      FieldName = 'CURR_TP'
    end
    object Qery103CURR_PTR: TIntegerField
      FieldName = 'CURR_PTR'
    end
    object Qery103StringField: TStringField
      FieldName = #31867#22411
      ReadOnly = True
      Size = 4
    end
    object Qery103StringField2: TStringField
      FieldName = #22806#24065#26680#31639
      ReadOnly = True
      Size = 8
    end
    object Qery103GL_ACC_NUMBER: TStringField
      FieldName = 'GL_ACC_NUMBER'
      FixedChar = True
      Size = 18
    end
    object Qery103description_2: TStringField
      FieldName = 'description_2'
      ReadOnly = True
      Size = 101
    end
    object Qery103GL_DESCRIPTION: TStringField
      FieldName = 'GL_DESCRIPTION'
      Size = 50
    end
  end
  object Qery508: TADOQuery
    Connection = Conn
    Parameters = <>
    SQL.Strings = (
      'SELECT * from data0508')
    Left = 240
    Top = 184
  end
  object ads0514: TADODataSet
    Connection = Conn
    LockType = ltBatchOptimistic
    CommandText = 'select FASSET_TYPE from data0514'
    Parameters = <>
    Left = 32
    Top = 208
  end
  object ads0516: TADODataSet
    Connection = Conn
    LockType = ltBatchOptimistic
    CommandText = 'select FASSET_STATUS from data0516'
    Parameters = <>
    Left = 88
    Top = 208
  end
  object qryAcctItem: TADOQuery
    Connection = Conn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT dbo.Data0103.RKEY, dbo.Data0103.CURR_TP, dbo.Data0103.CUR' +
        'R_PTR,'
      
        '      CASE data0103.db_cr WHEN '#39'D'#39' THEN '#39#20511#26041#39' WHEN '#39'C'#39' THEN '#39#36151#26041#39' ' +
        'END AS '#31867#22411','
      '      case data0103.curr_tp when 0 then '#39#19981#26680#31639#39
      '                            when 1 then '#39#26680#31639#39
      '                            when 2 then '#39#26680#31639#21333#19968#39
      '      end  as '#22806#24065#26680#31639','
      
        '      Data0103.GL_ACC_NUMBER, ISNULL(Data0103_1.GL_DESCRIPTION, ' +
        #39#39')'
      '      +'#39'-'#39'+ Data0103.GL_DESCRIPTION AS description_2,'
      '      Data0103_2.GL_DESCRIPTION'
      'FROM dbo.Data0103 Data0103_2 RIGHT OUTER JOIN'
      '      dbo.Data0103 Data0103_1 ON '
      '      Data0103_2.RKEY = Data0103_1.PARENT_PTR RIGHT OUTER JOIN'
      '      dbo.Data0103 ON Data0103_1.RKEY = dbo.Data0103.PARENT_PTR'
      'WHERE (dbo.Data0103.HAS_CHILD = 0)'
      ' '
      ' ')
    Left = 384
    Top = 112
    object qryAcctItemRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object qryAcctItemCURR_TP: TWordField
      FieldName = 'CURR_TP'
    end
    object intgrfldAcctItemCURR_PTR: TIntegerField
      FieldName = 'CURR_PTR'
    end
    object strngfldAcctItemDSDesigner: TStringField
      FieldName = #31867#22411
      ReadOnly = True
      Size = 4
    end
    object strngfldAcctItemDSDesigner2: TStringField
      FieldName = #22806#24065#26680#31639
      ReadOnly = True
      Size = 8
    end
    object strngfldAcctItemGL_ACC_NUMBER: TStringField
      FieldName = 'GL_ACC_NUMBER'
      Size = 18
    end
    object strngfldAcctItemdescription_2: TStringField
      FieldName = 'description_2'
      ReadOnly = True
      Size = 101
    end
    object strngfldAcctItemGL_DESCRIPTION: TStringField
      FieldName = 'GL_DESCRIPTION'
      Size = 50
    end
  end
end
