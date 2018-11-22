object dm: Tdm
  OldCreateOrder = False
  Left = 260
  Top = 201
  Height = 462
  Width = 584
  object ADOConnection1: TADOConnection
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 33
    Top = 7
  end
  object DS1: TDataSource
    DataSet = ADO541
    Left = 32
    Top = 72
  end
  object ADOTMP1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 208
    Top = 72
  end
  object ADODataSet_ud: TADODataSet
    Connection = ADOConnection1
    Parameters = <>
    Left = 208
    Top = 16
  end
  object ADOD04: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select  CONTROL_NO_LENGTH, SEED_VALUE, SEED_FLAG'#13#10'from Data0004'#13 +
      #10' where table_name='#39'data0541'#39' '
    CommandType = cmdUnknown
    Parameters = <>
    Left = 312
    Top = 16
    object ADOD04CONTROL_NO_LENGTH: TSmallintField
      FieldName = 'CONTROL_NO_LENGTH'
    end
    object ADOD04SEED_VALUE: TStringField
      FieldName = 'SEED_VALUE'
    end
    object ADOD04SEED_FLAG: TWordField
      FieldName = 'SEED_FLAG'
    end
  end
  object ADO542: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterScroll = ADO542AfterScroll
    Parameters = <>
    SQL.Strings = (
      'select rkey,type_code,name,remark from data0542')
    Left = 111
    Top = 226
    object ADO542type_code: TStringField
      FieldName = 'type_code'
      Size = 10
    end
    object ADO542name: TWideStringField
      FieldName = 'name'
      Size = 50
    end
    object ADO542remark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
    object ADO542rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
  end
  object DS542: TDataSource
    DataSet = ADO542
    Left = 182
    Top = 227
  end
  object ADO544: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey542'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select b.dept_name,a.rkey,d542_ptr,d34_index,d34_ptr,remark  fro' +
        'm data0544  a left join '
      'data0034 b on a.d34_ptr=b.rkey'
      'where b.ttype=4 and d542_ptr=:rkey542'
      'order by d34_index')
    Left = 112
    Top = 286
    object ADO544dept_name: TStringField
      FieldName = 'dept_name'
      Size = 30
    end
    object ADO544d542_ptr: TIntegerField
      FieldName = 'd542_ptr'
    end
    object ADO544d34_index: TIntegerField
      FieldName = 'd34_index'
    end
    object ADO544d34_ptr: TIntegerField
      FieldName = 'd34_ptr'
    end
    object ADO544remark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
    object ADO544rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
  end
  object DS544: TDataSource
    DataSet = ADO544
    Left = 184
    Top = 286
  end
  object ADO545: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey541'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select a.rkey,a.d541_ptr,d34_index,d34_ptr,check_person,check_st' +
        'atus,'
      'check_time,check_suggestion,b.employee_name,c.dept_name ,'
      
        'case when isnull(check_status,0)=0 and isnull(check_person,0)=0 ' +
        'then '#39#26410#23457#26680#39' '
      
        '        when isnull(check_status,0)=0 and isnull(check_person,0)' +
        '<>0 then '#39#24453#37325#23457#39
      
        '       when isnull(check_status,0)=1  then '#39#24050#23457#26680#39' else '#39#26410#30693#39' end a' +
        's ['#29366#24577']'
      'from data0545 a left join data0005 b on a.check_person=b.rkey'
      ' left join data0034 c on a.d34_ptr=c.rkey'
      'where d541_ptr=:rkey541'
      'order by d34_index')
    Left = 116
    Top = 347
    object ADO545d541_ptr: TIntegerField
      FieldName = 'd541_ptr'
    end
    object ADO545d34_index: TIntegerField
      FieldName = 'd34_index'
    end
    object ADO545d34_ptr: TIntegerField
      FieldName = 'd34_ptr'
    end
    object ADO545check_person: TIntegerField
      FieldName = 'check_person'
    end
    object ADO545check_status: TIntegerField
      FieldName = 'check_status'
    end
    object ADO545check_time: TDateTimeField
      FieldName = 'check_time'
    end
    object ADO545check_suggestion: TMemoField
      FieldName = 'check_suggestion'
      BlobType = ftMemo
    end
    object ADO545employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object ADO545dept_name: TStringField
      FieldName = 'dept_name'
      Size = 30
    end
    object ADO545DSDesigner: TStringField
      FieldName = #29366#24577
      ReadOnly = True
      Size = 6
    end
    object ADO545rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
  end
  object DS545: TDataSource
    DataSet = ADO545
    Left = 188
    Top = 347
  end
  object ADOTMP2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 294
    Top = 72
  end
  object Queryofbp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select distinct d542_ptr,type_code,[name],dept_name=convert('
      'varchar(500),'
      
        'STUFF((SELECT '#39#8594#39' +cast (d34_index as nvarchar(20))+'#39'.'#39'+ dept_na' +
        'me '
      
        'from (select a.rkey,d542_ptr,d34_index,d34_ptr,b.type_code,b.[na' +
        'me],c.dept_name from data0544 a join data0542 b'
      'on a.d542_ptr=b.rkey'
      'join data0034 c on a.d34_ptr=c.rkey) as b'
      ' where d542_ptr=a.d542_ptr'
      'FOR XML PATH('#39#39')), 1, 1, '#39#39')'
      ')  from '
      '('
      
        'select a.rkey,d542_ptr,d34_index,d34_ptr,b.type_code,b.[name],c.' +
        'dept_name from data0544 a join data0542 b'
      'on a.d542_ptr=b.rkey'
      'join data0034 c on a.d34_ptr=c.rkey'
      ')  as a'
      '')
    Left = 305
    Top = 175
  end
  object ADO541: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    AfterOpen = ADO541AfterOpen
    AfterScroll = ADO541AfterScroll
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      
        ' select Data0541.rkey,dbo.Data0541.MATERIAL_REPLACE_NO as '#29289#26009#26367#20195#21333#21495 +
        '  , dbo.Data0541.remark, dbo.Data0017.INV_PART_NUMBER as '#26448#26009#32534#30721' , ' +
        'dbo.Data0017.INV_NAME as '#26448#26009#21517#31216',Data0017.INV_DESCRIPTION as '#26448#26009#35268#26684',D' +
        'ata0541.circle,'
      
        ' dbo.Data0025.MANU_PART_NUMBER,dbo.Data0541.d05_ptr,dbo.Data0025' +
        '.MANU_PART_DESC, dbo.Data0010.CUST_CODE as '#23458#25143#20195#30721', dbo.Data0541.su' +
        'bmit_suggestion as '#36865#23457#20154#24847#35265','
      
        'isnull((select employee_name from data0005 where rkey=Data0541.d' +
        '05_ptr),'#39#39') as '#36865#23457#20154', dbo.Data0541.QUAN_ON_HAND,data0541.beizhu, d' +
        'ata0541.reason,'
      
        ' dbo.Data0541.submit_date, dbo.Data0541.check_type,data0541.chec' +
        'k_status, dbo.Data0025.RKEY AS d025_rkey,'
      
        ' dbo.Data0541.INVT_PTR,dbo.Data0541.R34_ptr, dbo.Data0017.Group_' +
        'ptr,'
      'row_number() over(order by Data0541.rkey) as '#24207#21495','
      'case when ( check_status=0  and circle=1 ) then'#39#26410#25552#20132#39
      ' when  ( check_status=0  and circle>1 ) then '#39#24453#37325#25552#20132#39
      ' when   check_status=1 then '#39#24453#23457#26680#39
      ' when  check_status=2 then  '#39#20840#37096#36890#36807#23457#26680#39' end as '#29366#24577
      '  from  Data0541 INNER JOIN'
      
        '                      dbo.Data0017 ON dbo.Data0541.INVT_PTR = db' +
        'o.Data0017.RKEY INNER JOIN'
      
        '                       dbo.Data0025 ON dbo.Data0541.d25_rkey = d' +
        'bo.Data0025.RKEY INNER JOIN'
      
        '                      dbo.Data0010 ON dbo.Data0025.CUSTOMER_PTR ' +
        '= dbo.Data0010.RKEY INNER JOIN'
      
        '                      dbo.Data0005 ON dbo.Data0541.d05_ptr = dbo' +
        '.Data0005.RKEY'
      '         where 1=1')
    Left = 110
    Top = 80
    object ADO541remark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
    object ADO541circle: TIntegerField
      FieldName = 'circle'
    end
    object ADO541MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADO541MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ADO541DSDesigner: TStringField
      FieldName = #23458#25143#20195#30721
      Size = 10
    end
    object ADO541submit_date: TDateTimeField
      FieldName = 'submit_date'
    end
    object ADO541check_type: TIntegerField
      FieldName = 'check_type'
    end
    object ADO541check_status: TIntegerField
      FieldName = 'check_status'
    end
    object ADO541d025_rkey: TAutoIncField
      FieldName = 'd025_rkey'
      ReadOnly = True
    end
    object ADO541DSDesigner2: TLargeintField
      FieldName = #24207#21495
      ReadOnly = True
    end
    object ADO541DSDesigner3: TStringField
      FieldName = #29366#24577
      ReadOnly = True
      Size = 12
    end
    object ADO541INVT_PTR: TIntegerField
      FieldName = 'INVT_PTR'
    end
    object ADO541d05_ptr: TIntegerField
      FieldName = 'd05_ptr'
    end
    object ADO541R34_ptr: TIntegerField
      FieldName = 'R34_ptr'
    end
    object ADO541Group_ptr: TIntegerField
      FieldName = 'Group_ptr'
    end
    object ADO541DSDesigner4: TStringField
      FieldName = #29289#26009#26367#20195#21333#21495
      Size = 10
    end
    object ADO541DSDesigner5: TStringField
      FieldName = #26448#26009#32534#30721
      Size = 25
    end
    object ADO541DSDesigner6: TStringField
      FieldName = #26448#26009#21517#31216
      Size = 30
    end
    object ADO541DSDesigner7: TMemoField
      FieldName = #36865#23457#20154#24847#35265
      BlobType = ftMemo
    end
    object ADO541rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO541DSDesigner8: TStringField
      FieldName = #36865#23457#20154
      ReadOnly = True
      Size = 16
    end
    object ADO541DSDesigner9: TStringField
      FieldName = #26448#26009#35268#26684
      Size = 70
    end
    object ADO541QUAN_ON_HAND: TFloatField
      FieldName = 'QUAN_ON_HAND'
    end
    object ADO541beizhu: TWideStringField
      FieldName = 'beizhu'
    end
    object ADO541reason: TWideStringField
      FieldName = 'reason'
      Size = 50
    end
  end
  object ads494: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT data0278.PARAMETER_NAME,data0278.PARAMETER_DESC,dbo.data0' +
      '494.PARAMETER_VALUE,dbo.data0494.step_number,'#13#10'case data0278.DAT' +
      'A_TYPE when 1 then '#39#25968#23383#39' WHEN 2 THEN '#39#23383#31526#39' end as datatype,data000' +
      '2.UNIT_NAME, dbo.data0494.seq_no,data0494.flow_spfc_flag,'#13#10' dbo.' +
      'Data0038.SOURCE_PTR, dbo.Data0038.DEPT_PTR, dbo.Data0038.STEP_NU' +
      'MBER AS Expr1'#13#10#13#10'FROM dbo.Data0494 inner join'#13#10'dbo.data0278 on d' +
      'ata0494.PARAMETER_PTR=data0278.RKey inner join '#13#10'data0002 on Dat' +
      'a0278.UNIT_PTR = Data0002.RKEY INNER JOIN'#13#10'                     ' +
      ' dbo.Data0038 ON dbo.Data0494.custpart_ptr = dbo.Data0038.SOURCE' +
      '_PTR '#13#10'                      AND dbo.Data0494.step_number = dbo.' +
      'Data0038.STEP_NUMBER'#13#10'where data0494.custpart_ptr = :SOURCE_PTR'#13 +
      #10#13#10
    Parameters = <
      item
        Name = 'SOURCE_PTR'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 331
    Top = 242
    object ads494PARAMETER_NAME: TStringField
      FieldName = 'PARAMETER_NAME'
      Size = 10
    end
    object ads494PARAMETER_DESC: TStringField
      FieldName = 'PARAMETER_DESC'
    end
    object ads494PARAMETER_VALUE: TStringField
      FieldName = 'PARAMETER_VALUE'
      Size = 30
    end
    object ads494step_number: TSmallintField
      FieldName = 'step_number'
    end
    object ads494datatype: TStringField
      FieldName = 'datatype'
      ReadOnly = True
      Size = 4
    end
    object ads494UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object ads494seq_no: TSmallintField
      FieldName = 'seq_no'
    end
    object ads494flow_spfc_flag: TStringField
      FieldName = 'flow_spfc_flag'
      FixedChar = True
      Size = 1
    end
    object ads494SOURCE_PTR: TIntegerField
      FieldName = 'SOURCE_PTR'
    end
    object ads494DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ads494Expr1: TSmallintField
      FieldName = 'Expr1'
    end
  end
  object DataSource5: TDataSource
    DataSet = ads494
    Left = 259
    Top = 243
  end
  object ADS541: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <
      item
        Name = 'rkey541'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      
        'SELECT     TOP (200) rkey, MATERIAL_REPLACE_NO, INVT_PTR, submit' +
        '_date, d05_ptr, submit_suggestion, check_status, check_type, rem' +
        'ark, circle, R34_ptr, data0541.beizhu,data0541.reason,data0541.d' +
        '25_rkey,'
      '                      QUAN_ON_HAND'
      'FROM         Data0541 '
      'where rkey=:rkey541')
    Left = 110
    Top = 144
    object ADS541rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADS541MATERIAL_REPLACE_NO: TStringField
      FieldName = 'MATERIAL_REPLACE_NO'
      Size = 10
    end
    object ADS541INVT_PTR: TIntegerField
      FieldName = 'INVT_PTR'
    end
    object ADS541submit_date: TDateTimeField
      FieldName = 'submit_date'
    end
    object ADS541d05_ptr: TIntegerField
      FieldName = 'd05_ptr'
    end
    object ADS541submit_suggestion: TMemoField
      FieldName = 'submit_suggestion'
      BlobType = ftMemo
    end
    object ADS541check_status: TIntegerField
      FieldName = 'check_status'
    end
    object ADS541check_type: TIntegerField
      FieldName = 'check_type'
    end
    object ADS541remark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
    object ADS541circle: TIntegerField
      FieldName = 'circle'
    end
    object ADS541R34_ptr: TIntegerField
      FieldName = 'R34_ptr'
    end
    object ADS541QUAN_ON_HAND: TFloatField
      FieldName = 'QUAN_ON_HAND'
    end
    object ADS541beizhu: TWideStringField
      FieldName = 'beizhu'
    end
    object ADS541reason: TWideStringField
      FieldName = 'reason'
      Size = 50
    end
    object ADS541d25_rkey: TIntegerField
      FieldName = 'd25_rkey'
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select rkey from data0060')
    Left = 392
    Top = 104
    object ADOQuery1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
  end
end
