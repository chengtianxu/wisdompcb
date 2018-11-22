object dm: Tdm
  OldCreateOrder = False
  Left = 591
  Top = 196
  Height = 460
  Width = 440
  object ADOConnection1: TADOConnection
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 33
    Top = 7
  end
  object DS1: TDataSource
    DataSet = ADO0696
    Left = 32
    Top = 72
  end
  object ADO0696: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    AfterOpen = ADO0696AfterOpen
    AfterScroll = ADO0696AfterScroll
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      
        'select data0696.rkey,isnull(data0696.submit_person,0) as submit_' +
        'person,'
      'isnull(data0696.submit_department,0) as submit_department,'
      'isnull(data0696.check_status,0) as check_status,'
      'isnull(data0696.circle,0) as circle,'
      'check_type,'
      'row_number() over(order by data0696.rkey ) as '#24207#21495','
      'contract_number as '#21512#21516#32534#21495','
      'contract_name as '#21512#21516#21517#31216','
      'part_A_name_ch as ['#30002#26041#65288#23458#25143#65289#21517#31216'],'
      'part_A_name_en as ['#30002#26041#65288#23458#25143#65289#21517#31216'en],'
      'submit_date  as '#25552#20132#26085#26399','
      
        '(select dept_name from data0034 where rkey=data0696.submit_depar' +
        'tment) as  '#36865#23457#20154#37096#38376' ,'
      
        'isnull((select employee_name from data0005 where rkey=data0696.s' +
        'ubmit_person),'#39#39') as '#36865#23457#20154','
      
        'isnull((select employee_name from data0005 where rkey=data0696.A' +
        'udit_Prt),'#39#39') as '#37096#38376#23457#26680#20154',Audit_Date as '#37096#38376#23457#26680#26102#38388','
      'submit_suggestion as '#36865#23457#20154#24847#35265','
      'case when ( check_status=0  and circle=1 ) then'#39#26410#25552#20132#39
      '         when  ( check_status=0  and circle>1 ) then '#39#24453#37325#25552#20132#39
      '         when   check_status=1 then '#39#24453#23457#26680#39
      '         when  check_status=2 then  '#39#20840#37096#36890#36807#23457#26680#39' '
      '         when check_status=5 then '#39#24453#20801#35768#32852#23457#39' end as '#29366#24577','
      
        'submit_suggestion,Audit_Prt,Audit_Date,data0691.type_code,data06' +
        '91.name,data0691.rkey as Rkey691,'
      'data0696.remark, party_a from  data0696 left join'
      'data0691 on data0696.check_type=data0691.rkey '
      'where data0696.check_status>=0 and 2=2 ')
    Left = 110
    Top = 72
    object ADO0696submit_person: TIntegerField
      FieldName = 'submit_person'
      ReadOnly = True
    end
    object ADO0696submit_department: TIntegerField
      FieldName = 'submit_department'
      ReadOnly = True
    end
    object ADO0696check_status: TIntegerField
      FieldName = 'check_status'
      ReadOnly = True
    end
    object ADO0696circle: TIntegerField
      FieldName = 'circle'
      ReadOnly = True
    end
    object ADO0696DSDesigner: TLargeintField
      FieldName = #24207#21495
      ReadOnly = True
    end
    object ADO0696DSDesigner2: TWideStringField
      FieldName = #21512#21516#32534#21495
      Size = 15
    end
    object ADO0696DSDesigner3: TWideStringField
      FieldName = #21512#21516#21517#31216
      Size = 100
    end
    object ADO0696DSDesigner4: TWideStringField
      FieldName = #30002#26041#65288#23458#25143#65289#21517#31216
      Size = 100
    end
    object ADO0696en: TWideStringField
      FieldName = #30002#26041#65288#23458#25143#65289#21517#31216'en'
      Size = 50
    end
    object ADO0696DSDesigner5: TDateTimeField
      FieldName = #25552#20132#26085#26399
    end
    object ADO0696DSDesigner6: TStringField
      FieldName = #36865#23457#20154#37096#38376
      ReadOnly = True
      Size = 30
    end
    object ADO0696DSDesigner7: TStringField
      FieldName = #36865#23457#20154
      ReadOnly = True
      Size = 16
    end
    object ADO0696DSDesigner8: TMemoField
      FieldName = #36865#23457#20154#24847#35265
      BlobType = ftMemo
    end
    object ADO0696DSDesigner9: TWideStringField
      FieldName = #29366#24577
      ReadOnly = True
    end
    object ADO0696remark: TMemoField
      FieldName = 'remark'
      BlobType = ftMemo
    end
    object ADO0696party_a: TIntegerField
      FieldName = 'party_a'
    end
    object ADO0696submit_suggestion: TMemoField
      FieldName = 'submit_suggestion'
      BlobType = ftMemo
    end
    object ADO0696check_type: TIntegerField
      FieldName = 'check_type'
    end
    object ADO0696rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO0696DSDesigner10: TStringField
      FieldName = #37096#38376#23457#26680#20154
      ReadOnly = True
      Size = 16
    end
    object ADO0696DSDesigner11: TDateTimeField
      FieldName = #37096#38376#23457#26680#26102#38388
    end
    object ADO0696Audit_Prt: TIntegerField
      FieldName = 'Audit_Prt'
    end
    object ADO0696Audit_Date: TDateTimeField
      FieldName = 'Audit_Date'
    end
    object ADO0696type_code: TStringField
      FieldName = 'type_code'
      Size = 10
    end
    object ADO0696name: TWideStringField
      FieldName = 'name'
      Size = 50
    end
    object ADO0696Rkey691: TAutoIncField
      FieldName = 'Rkey691'
      ReadOnly = True
    end
  end
  object DS2: TDataSource
    DataSet = ADO0697
    Left = 32
    Top = 159
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
  object ADO0697: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select contract_rkey,file_name,flag,submit_person,'#13#10'b.employee_n' +
      'ame as submit_person_name,'#13#10'submit_date,modify_person,'#13#10'c.employ' +
      'ee_name as modify_person_name,'#13#10'modify_date'#13#10' from dbo.data0697 ' +
      'a '#13#10'left join data0005 b on a.submit_person=b.rkey'#13#10'left join da' +
      'ta0005 c on a.modify_person=c.rkey'#13#10'where contract_rkey=:rkey696'
    Parameters = <
      item
        Name = 'rkey696'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 112
    Top = 160
    object ADO0697file_name: TWideStringField
      FieldName = 'file_name'
      Size = 50
    end
    object ADO0697submit_person: TIntegerField
      FieldName = 'submit_person'
    end
    object ADO0697submit_person_name: TStringField
      FieldName = 'submit_person_name'
      Size = 16
    end
    object ADO0697submit_date: TDateTimeField
      FieldName = 'submit_date'
    end
    object ADO0697modify_person: TIntegerField
      FieldName = 'modify_person'
    end
    object ADO0697modify_person_name: TStringField
      FieldName = 'modify_person_name'
      Size = 16
    end
    object ADO0697modify_date: TDateTimeField
      FieldName = 'modify_date'
    end
    object ADO0697flag: TIntegerField
      FieldName = 'flag'
    end
    object ADO0697contract_rkey: TIntegerField
      FieldName = 'contract_rkey'
    end
  end
  object ADOD04: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select  CONTROL_NO_LENGTH, SEED_VALUE, SEED_FLAG'#13#10'from Data0004'#13 +
      #10' where table_name='#39'data0696'#39' '
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
  object ADO0691: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterScroll = ADO0691AfterScroll
    Parameters = <>
    SQL.Strings = (
      'select rkey,type_code,name,remark from data0691')
    Left = 111
    Top = 226
    object ADO0691rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO0691type_code: TStringField
      FieldName = 'type_code'
      Size = 10
    end
    object ADO0691name: TWideStringField
      FieldName = 'name'
      Size = 50
    end
    object ADO0691remark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
  end
  object DS691: TDataSource
    DataSet = ADO0691
    Left = 182
    Top = 227
  end
  object ADO0692: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey691'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select b.dept_name,a.rkey,d691_ptr,d34_index,d34_ptr,remark  fro' +
        'm data0692 a left join '
      'data0034 b on a.d34_ptr=b.rkey'
      'where b.ttype=4 and d691_ptr=:rkey691'
      'order by d34_index')
    Left = 112
    Top = 286
    object ADO0692dept_name: TStringField
      FieldName = 'dept_name'
      Size = 30
    end
    object ADO0692rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO0692d691_ptr: TIntegerField
      FieldName = 'd691_ptr'
    end
    object ADO0692d34_index: TIntegerField
      FieldName = 'd34_index'
    end
    object ADO0692d34_ptr: TIntegerField
      FieldName = 'd34_ptr'
    end
    object ADO0692remark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
  end
  object DS692: TDataSource
    DataSet = ADO0692
    Left = 184
    Top = 286
  end
  object ADO0693: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey696'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select a.rkey,a.d696_ptr,d34_index,d34_ptr,check_person,check_st' +
        'atus,'
      'check_time,check_suggestion,b.employee_name,c.dept_name ,'
      
        'case when isnull(check_status,0)=0 and isnull(check_person,0)=0 ' +
        'then '#39#26410#23457#26680#39' '
      
        '        when isnull(check_status,0)=0 and isnull(check_person,0)' +
        '<>0 then '#39#24453#37325#23457#39
      
        '       when isnull(check_status,0)=1  then '#39#24050#23457#26680#39' else '#39#26410#30693#39' end a' +
        's ['#29366#24577']'
      'from data0693 a left join data0005 b on a.check_person=b.rkey'
      ' left join data0034 c on a.d34_ptr=c.rkey'
      'where d696_ptr=:rkey696')
    Left = 116
    Top = 347
    object ADO0693rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO0693d696_ptr: TIntegerField
      FieldName = 'd696_ptr'
    end
    object ADO0693d34_index: TIntegerField
      FieldName = 'd34_index'
    end
    object ADO0693d34_ptr: TIntegerField
      FieldName = 'd34_ptr'
    end
    object ADO0693check_person: TIntegerField
      FieldName = 'check_person'
    end
    object ADO0693DSDesigner: TStringField
      FieldName = #29366#24577
      ReadOnly = True
      Size = 6
    end
    object ADO0693check_time: TDateTimeField
      FieldName = 'check_time'
    end
    object ADO0693check_suggestion: TMemoField
      FieldName = 'check_suggestion'
      BlobType = ftMemo
    end
    object ADO0693employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object ADO0693dept_name: TStringField
      FieldName = 'dept_name'
      Size = 30
    end
    object ADO0693check_status: TIntegerField
      FieldName = 'check_status'
    end
  end
  object DS693: TDataSource
    DataSet = ADO0693
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
      'select distinct d691_ptr,type_code,[name],dept_name=convert('
      'varchar(500),'
      
        'STUFF((SELECT '#39#8594#39' +cast (d34_index as nvarchar(20))+'#39'.'#39'+ dept_na' +
        'me '
      
        'from (select a.rkey,d691_ptr,d34_index,d34_ptr,b.type_code,b.[na' +
        'me],c.dept_name from data0692 a join data0691 b'
      'on a.d691_ptr=b.rkey'
      'join data0034 c on a.d34_ptr=c.rkey) as b'
      ' where d691_ptr=a.d691_ptr'
      'FOR XML PATH('#39#39')), 1, 1, '#39#39')'
      ')  from '
      '('
      
        'select a.rkey,d691_ptr,d34_index,d34_ptr,b.type_code,b.[name],c.' +
        'dept_name from data0692 a join data0691 b'
      'on a.d691_ptr=b.rkey'
      'join data0034 c on a.d34_ptr=c.rkey'
      ')  as a')
    Left = 305
    Top = 175
  end
end
