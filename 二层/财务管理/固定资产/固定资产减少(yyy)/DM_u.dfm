object DM: TDM
  OldCreateOrder = False
  Left = 451
  Top = 225
  Height = 322
  Width = 475
  object ADOCon: TADOConnection
    CommandTimeout = 180
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 16
  end
  object Tmp1: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    CommandTimeout = 180
    Parameters = <>
    Left = 96
    Top = 16
  end
  object DS525: TDataSource
    DataSet = ADO525
    Left = 32
    Top = 112
  end
  object ADO525: TADODataSet
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT dbo.Data0517.RKEY ,  dbo.Data0517.FASSET_CODE, dbo.Data05' +
      '17.FASSET_NAME, dbo.Data0517.FASSET_DESC, dbo.Data0514.FASSET_TY' +
      'PE,  dbo.Data0517.ORIGINAL_VALUE, '#13#10' dbo.Data0517.SUMMED_DEPRE, ' +
      'dbo.Data0517.LOCATION, dbo.Data0517.id_code, Data0525.dimi_date ' +
      ',Data0525.reson,'#13#10'data0515.fasset_alt_type,data0525.voucher_ptr,' +
      'data0525.act_ptr,'#13#10'data0005.employee_Name,data0517.MONTH_DEPRE_A' +
      'MT,data0517.BOOK_DATE'#13#10'FROM         dbo.Data0517 INNER JOIN'#13#10'   ' +
      '                   dbo.Data0514 ON dbo.Data0517.FASSET_TYPE_PTR ' +
      '= dbo.Data0514.RKEY inner join data0525 on  data0525.fasset_ptr=' +
      #13#10'data0517.rkey  left join data0515 on data0525.act_ptr=data0515' +
      '.rkey'#13#10'left join data0005  on data0525.ent_by_ptr=data0005.rkey'#13 +
      #10'WHERE    '#13#10'dbo.Data0525.dimi_date>=:Dt1 and Data0525.dimi_date<' +
      '=:Dt2'
    Parameters = <
      item
        Name = 'Dt1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'Dt2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    Prepared = True
    Left = 96
    Top = 112
    object ADO525dimi_date: TDateTimeField
      DisplayLabel = #20943#23569#26085#26399
      DisplayWidth = 16
      FieldName = 'dimi_date'
    end
    object ADO525FASSET_CODE: TStringField
      DisplayLabel = #22266#23450#36164#20135#32534#30721
      FieldName = 'FASSET_CODE'
      Size = 10
    end
    object ADO525FASSET_NAME: TStringField
      DisplayLabel = #22266#23450#36164#20135#21517#31216
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object ADO525FASSET_DESC: TStringField
      DisplayLabel = #35268#26684
      FieldName = 'FASSET_DESC'
      Size = 40
    end
    object ADO525FASSET_TYPE: TStringField
      DisplayLabel = #31867#21035
      FieldName = 'FASSET_TYPE'
    end
    object ADO525ORIGINAL_VALUE: TFloatField
      DisplayLabel = #21407#20540
      FieldName = 'ORIGINAL_VALUE'
    end
    object ADO525SUMMED_DEPRE: TFloatField
      DisplayLabel = #32047#35745#25240#26087
      FieldName = 'SUMMED_DEPRE'
    end
    object ADO525LOCATION: TStringField
      DisplayLabel = #20301#32622
      FieldName = 'LOCATION'
      Size = 16
    end
    object ADO525fasset_alt_type: TStringField
      DisplayLabel = #20943#23569#26041#24335
      FieldName = 'fasset_alt_type'
      FixedChar = True
      Size = 16
    end
    object ADO525employee_Name: TStringField
      DisplayLabel = #24314#26723#20154
      FieldName = 'Employee_name'
      Size = 16
    end
    object ADO525reson: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'reson'
      Size = 60
    end
    object ADO525id_code: TStringField
      DisplayLabel = #21345#29255#21495
      FieldName = 'id_code'
      Size = 15
    end
    object ADO525RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO525voucher_ptr: TIntegerField
      FieldName = 'voucher_ptr'
    end
    object ADO525act_ptr: TSmallintField
      FieldName = 'act_ptr'
    end
    object ADO525MONTH_DEPRE_AMT: TBCDField
      DisplayLabel = #26376#25240#26087#39069
      FieldName = 'MONTH_DEPRE_AMT'
      Precision = 19
      Size = 2
    end
    object ADO525BOOK_DATE: TDateTimeField
      FieldName = 'BOOK_DATE'
    end
  end
  object ADO517: TADODataSet
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT     dbo.Data0517.RKEY ,  dbo.Data0517.FASSET_CODE, dbo.Da' +
      'ta0517.FASSET_NAME, dbo.Data0517.FASSET_DESC, dbo.Data0514.FASSE' +
      'T_TYPE, '#13#10'                      dbo.Data0517.ORIGINAL_VALUE, dbo' +
      '.Data0517.SUMMED_DEPRE, dbo.Data0517.LOCATION, dbo.Data0517.id_c' +
      'ode, dbo.Data0517.BOOK_DATE'#13#10'FROM         dbo.Data0517 INNER JOI' +
      'N'#13#10'                      dbo.Data0514 ON dbo.Data0517.FASSET_TYP' +
      'E_PTR = dbo.Data0514.RKEY'#13#10'WHERE     (dbo.Data0517.active_flag =' +
      ' 1) '#13#10
    Parameters = <>
    Prepared = True
    Left = 96
    Top = 168
    object StringField1: TStringField
      DisplayLabel = #36164#20135#32534#30721
      FieldName = 'FASSET_CODE'
    end
    object StringField5: TStringField
      DisplayLabel = #20301#32622
      FieldName = 'LOCATION'
      Size = 30
    end
    object StringField6: TStringField
      DisplayLabel = #21345#29255#21495
      FieldName = 'id_code'
      Size = 15
    end
    object StringField2: TStringField
      DisplayLabel = #22266#23450#36164#20135#21517#31216
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object StringField3: TStringField
      DisplayLabel = #35268#26684
      FieldName = 'FASSET_DESC'
      Size = 40
    end
    object StringField4: TStringField
      DisplayLabel = #31867#21035
      FieldName = 'FASSET_TYPE'
    end
    object FloatField1: TFloatField
      DisplayLabel = #21407#20540
      FieldName = 'ORIGINAL_VALUE'
    end
    object FloatField2: TFloatField
      DisplayLabel = #32047#35745#25240#26087
      FieldName = 'SUMMED_DEPRE'
    end
    object ADO517RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
  end
  object Data0103: TADODataSet
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT dbo.Data0103.RKEY, dbo.Data0103.CURR_TP, dbo.Data0103.CUR' +
      'R_PTR,'#13#10'      CASE data0103.db_cr WHEN '#39'D'#39' THEN '#39#20511#26041#39' WHEN '#39'C'#39' TH' +
      'EN '#39#36151#26041#39' END AS DB_CR,'#13#10'      case data0103.curr_tp when 0 then '#39 +
      #19981#26680#31639#39#13#10'                            when 1 then '#39#26680#31639#39#13#10'            ' +
      '                when 2 then '#39#26680#31639#21333#19968#39#13#10'      end  as curtp,'#13#10'      ' +
      'Data0103.GL_ACC_NUMBER,'#13#10'case when data0103_2.GL_DESCRIPTION is ' +
      'not null then'#13#10'  data0103_2.GL_DESCRIPTION+'#39'-'#39'+'#13#10'  data0103_1.GL' +
      '_DESCRIPTION+'#39'-'#39'+data0103.GL_DESCRIPTION'#13#10'else'#13#10' case when data0' +
      '103_1.GL_DESCRIPTION is not null then'#13#10'   data0103_1.GL_DESCRIPT' +
      'ION+'#39'-'#39'+data0103.GL_DESCRIPTION'#13#10'  else data0103.GL_DESCRIPTION'#13 +
      #10'  end  '#13#10'end as description_2'#13#10'FROM dbo.Data0103 Data0103_2 RIG' +
      'HT OUTER JOIN'#13#10'      dbo.Data0103 Data0103_1 ON '#13#10'      Data0103' +
      '_2.RKEY = Data0103_1.PARENT_PTR RIGHT OUTER JOIN'#13#10'      dbo.Data' +
      '0103 ON Data0103_1.RKEY = dbo.Data0103.PARENT_PTR'#13#10'where dbo.Dat' +
      'a0103.has_child=0'#13#10'order by dbo.Data0103.gl_acc_number'
    Parameters = <>
    Left = 96
    Top = 64
    object Data0103GL_ACC_NUMBER: TStringField
      DisplayLabel = #31185#30446#20195#30721
      FieldName = 'GL_ACC_NUMBER'
      FixedChar = True
      Size = 18
    end
    object Data0103description_2: TStringField
      DisplayLabel = #31185#30446#20195#30721
      FieldName = 'description_2'
      ReadOnly = True
      Size = 101
    end
    object Data0103DB_CR: TStringField
      DisplayLabel = #20511'/'#36151
      FieldName = 'DB_CR'
      ReadOnly = True
      Size = 4
    end
    object Data0103curtp: TStringField
      FieldName = 'curtp'
      ReadOnly = True
      Size = 8
    end
    object Data0103CURR_TP: TWordField
      DisplayLabel = #24065#21035
      FieldName = 'CURR_TP'
    end
    object Data0103CURR_PTR: TIntegerField
      FieldName = 'CURR_PTR'
    end
    object Data0103RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
  end
end
