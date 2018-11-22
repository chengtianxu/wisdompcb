object dm: Tdm
  OldCreateOrder = False
  Left = 470
  Top = 185
  Height = 497
  Width = 809
  object ADOConnection1: TADOConnection
    CommandTimeout = 25
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 112
    Top = 18
  end
  object DataSource1: TDataSource
    DataSet = ADO0738
    Left = 106
    Top = 72
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    LockType = ltPessimistic
    Parameters = <>
    Left = 450
    Top = 67
  end
  object ADOD04: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select  CONTROL_NO_LENGTH, SEED_VALUE, SEED_FLAG'#13#10'from Data0004'#13 +
      #10' where table_name='#39'FA0738'#39' '
    CommandType = cmdUnknown
    Parameters = <>
    Left = 448
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
  object ADODel: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'declare @rkey738 int'
      'set @rkey738=:rkey'
      ''
      'delete fa0744'
      'where contract_rkey=@rkey738'
      ''
      'delete fa0743'
      'where d738_ptr=@rkey738'
      ''
      'delete FA0740'
      'where RKEY738=@rkey738'
      ''
      ''
      'delete FA0739'
      'where d738_ptr=@rkey738'
      ''
      ''
      'delete FA0738'
      'where Rkey=@rkey738'
      ''
      ''
      ''
      ''
      ''
      'select 1')
    Left = 448
    Top = 120
  end
  object ADO0738: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    AfterScroll = ADO0738AfterScroll
    CommandText = 
      'select dbo.FA0738.Rkey,FA0738.FA_NUM,dbo.FA0738.RKEY10,dbo.FA073' +
      '8.RKEY25,data0025.MANU_PART_NUMBER,Data0010.CUSTOMER_NAME,chanpi' +
      'nshuxing='#13#10'case dbo.data0025.ttype when 0 then '#39#26679#21697#39' when 1 then ' +
      #39#37327#20135#39' end,data0005.ABBR_NAME,'#13#10'FA0738.BasicTechnology,FA0738.Diff' +
      'icultPoint,FA0738.isChange,'#13#10'FA0738.Quality,FA0738.CreateDate,FA' +
      '0738.BEIZHU,FA0738.AUDITED_ptr,Data0005.EMPLOYEE_NAME,'#13#10'FA=case ' +
      'FA0738.FAStatus when 0 then '#39#21542#39' when 1 then '#39#26159#39' end,FA0738.check' +
      '_type,'#13#10'FA0738.circle,FA0738.submit_suggestion as '#36865#23457#20154#24847#35265',FA0738.c' +
      'heck_status,FA0738.FAStatus,'#13#10'case when ( check_status=0  and ci' +
      'rcle=1 ) then'#39#26410#25552#20132#39#13#10' when  ( check_status=0  and circle>1 ) then' +
      ' '#39#24453#37325#25552#20132#39#13#10' when   check_status=1 then '#39#24453#23457#26680#39#13#10' when  check_status=' +
      '2 then  '#39#20840#37096#36890#36807#23457#26680#39' end as '#29366#24577#13#10' from '#13#10'dbo.FA0738 inner join  '#13#10'dbo' +
      '.Data0025 on  dbo.FA0738.RKEY25=dbo.Data0025.RKEY inner join'#13#10'db' +
      'o.Data0010 on  dbo.FA0738.RKEY10=dbo.Data0010.RKEY inner join'#13#10'd' +
      'bo.Data0005 on  dbo.FA0738.AUDITED_ptr=dbo.Data0005.RKEY'#13#10'order ' +
      'by FA0738.FA_NUM'#13#10
    Parameters = <>
    Left = 168
    Top = 72
    object ADO0738Rkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object ADO0738FA_NUM: TStringField
      FieldName = 'FA_NUM'
    end
    object ADO0738RKEY10: TIntegerField
      FieldName = 'RKEY10'
    end
    object ADO0738RKEY25: TIntegerField
      FieldName = 'RKEY25'
    end
    object ADO0738MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADO0738CUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object ADO0738chanpinshuxing: TStringField
      FieldName = 'chanpinshuxing'
      ReadOnly = True
      Size = 4
    end
    object ADO0738ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADO0738BasicTechnology: TStringField
      FieldName = 'BasicTechnology'
      Size = 200
    end
    object ADO0738DifficultPoint: TStringField
      FieldName = 'DifficultPoint'
      Size = 200
    end
    object ADO0738isChange: TIntegerField
      FieldName = 'isChange'
    end
    object ADO0738Quality: TIntegerField
      FieldName = 'Quality'
    end
    object ADO0738CreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object ADO0738BEIZHU: TStringField
      FieldName = 'BEIZHU'
      Size = 200
    end
    object ADO0738AUDITED_ptr: TIntegerField
      FieldName = 'AUDITED_ptr'
    end
    object ADO0738EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADO0738check_type: TIntegerField
      FieldName = 'check_type'
    end
    object ADO0738circle: TIntegerField
      FieldName = 'circle'
    end
    object ADO0738DSDesigner: TMemoField
      FieldName = #36865#23457#20154#24847#35265
      BlobType = ftMemo
    end
    object ADO0738check_status: TIntegerField
      FieldName = 'check_status'
    end
    object ADO0738FA: TStringField
      FieldName = 'FA'
      ReadOnly = True
      Size = 2
    end
    object ADO0738FAStatus: TIntegerField
      FieldName = 'FAStatus'
    end
    object ADO0738DSDesigner2: TStringField
      FieldName = #29366#24577
      ReadOnly = True
      Size = 12
    end
  end
  object DataSource2: TDataSource
    DataSet = ADO0741
    Left = 102
    Top = 131
  end
  object ADO0741: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterScroll = ADO0741AfterScroll
    Parameters = <>
    SQL.Strings = (
      'select rkey,type_code,name,remark from FA0741')
    Left = 167
    Top = 130
    object ADO0741type_code: TStringField
      FieldName = 'type_code'
      Size = 10
    end
    object ADO0741name: TWideStringField
      FieldName = 'name'
      Size = 50
    end
    object ADO0741remark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
    object ADO0741rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
  end
  object DataSource3: TDataSource
    DataSet = ADO0742
    Left = 104
    Top = 190
  end
  object ADO0742: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey741'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select b.dept_name,a.rkey,d741_ptr,d34_index,d34_ptr,remark  fro' +
        'm FA0742  a left join '
      'data0034 b on a.d34_ptr=b.rkey'
      'where b.ttype=4 and d741_ptr=:rkey741'
      'order by d34_index')
    Left = 168
    Top = 190
    object ADO0742dept_name: TStringField
      FieldName = 'dept_name'
      Size = 30
    end
    object ADO0742rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO0742d741_ptr: TIntegerField
      FieldName = 'd741_ptr'
    end
    object ADO0742d34_index: TIntegerField
      FieldName = 'd34_index'
    end
    object ADO0742d34_ptr: TIntegerField
      FieldName = 'd34_ptr'
    end
    object ADO0742remark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
  end
  object ADOTMP1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 448
    Top = 184
  end
  object ADOFaTest: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'MANU_PART_NUMBER'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end
      item
        Name = 'RKEY738'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select distinct   Data0034.DEPT_CODE ,Data0034.DEPT_NAME,Difficu' +
        'ltPoint=convert(nvarchar(1000),FA0739.DifficultPoint),'
      
        'BEIZHU=convert(nvarchar(1000),FA0739.BEIZHU),FA0740.TestResult,F' +
        'A0740.TStatus,FA0740.finished,FA0740.suggestion from data0034 le' +
        'ft JOIN'
      
        'dbo.FA0739 on dbo.FA0739.DEPT_CODE = dbo.Data0034.DEPT_CODE inne' +
        'r JOIN'
      'dbo.FA0738 on dbo.FA0739.d738_ptr=FA0738.Rkey right JOIN'
      
        'dbo.FA0740 on dbo.FA0740.DEPT_CODE=dbo.data0034.DEPT_CODE right ' +
        'JOIN'
      'dbo.Data0025  on dbo.FA0740.RKEY25=dbo.Data0025.RKEY'
      'where data0034.TTYPE=1'
      'and Data0025.MANU_PART_NUMBER=:MANU_PART_NUMBER'
      'and FA0738.rkey=:RKEY738')
    Left = 168
    Top = 248
    object ADOFaTestDEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADOFaTestDEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADOFaTestDifficultPoint: TWideStringField
      FieldName = 'DifficultPoint'
      ReadOnly = True
      Size = 1000
    end
    object ADOFaTestBEIZHU: TWideStringField
      FieldName = 'BEIZHU'
      ReadOnly = True
      Size = 1000
    end
    object ADOFaTestTestResult: TWideStringField
      FieldName = 'TestResult'
      Size = 500
    end
    object ADOFaTestTStatus: TIntegerField
      FieldName = 'TStatus'
    end
    object ADOFaTestfinished: TStringField
      FieldName = 'finished'
      Size = 50
    end
    object ADOFaTestsuggestion: TWideStringField
      FieldName = 'suggestion'
      Size = 1000
    end
  end
  object DataSource4: TDataSource
    DataSet = ADOFaTest
    Left = 96
    Top = 246
  end
  object ADO0743: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey738'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select a.rkey,a.d738_ptr,d34_index,d34_ptr,check_person,check_st' +
        'atus,'
      'check_time,check_suggestion,b.employee_name,c.dept_name ,'
      
        'case when isnull(check_status,0)=0 and isnull(check_person,0)=0 ' +
        'then '#39#26410#23457#26680#39' '
      
        '        when isnull(check_status,0)=0 and isnull(check_person,0)' +
        '<>0 then '#39#24453#37325#23457#39
      
        '       when isnull(check_status,0)=1  then '#39#24050#23457#26680#39' else '#39#26410#30693#39' end a' +
        's ['#29366#24577']'
      'from FA0743 a left join data0005 b on a.check_person=b.rkey'
      ' left join data0034 c on a.d34_ptr=c.rkey'
      'where d738_ptr=:rkey738'
      'order by d34_index')
    Left = 172
    Top = 323
    object ADO0743d541_ptr: TIntegerField
      FieldName = 'd738_ptr'
    end
    object ADO0743d34_index: TIntegerField
      FieldName = 'd34_index'
    end
    object ADO0743d34_ptr: TIntegerField
      FieldName = 'd34_ptr'
    end
    object ADO0743check_person: TIntegerField
      FieldName = 'check_person'
    end
    object ADO0743check_status: TIntegerField
      FieldName = 'check_status'
    end
    object ADO0743check_time: TDateTimeField
      FieldName = 'check_time'
    end
    object ADO0743check_suggestion: TMemoField
      FieldName = 'check_suggestion'
      BlobType = ftMemo
    end
    object ADO0743employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object ADO0743dept_name: TStringField
      FieldName = 'dept_name'
      Size = 30
    end
    object ADO0743DSDesigner: TStringField
      FieldName = #29366#24577
      ReadOnly = True
      Size = 6
    end
    object ADO0743rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
  end
  object DataSource5: TDataSource
    DataSet = ADO0743
    Left = 92
    Top = 315
  end
  object Queryofbp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select distinct d741_ptr,type_code,[name],dept_name=convert('
      'varchar(500),'
      
        'STUFF((SELECT '#39#8594#39' +cast (d34_index as nvarchar(20))+'#39'.'#39'+ dept_na' +
        'me '
      
        'from (select a.rkey,d741_ptr,d34_index,d34_ptr,b.type_code,b.[na' +
        'me],c.dept_name from FA0742 a join FA0741 b'
      'on a.d741_ptr=b.rkey'
      'join data0034 c on a.d34_ptr=c.rkey) as b'
      ' where d741_ptr=a.d741_ptr'
      'FOR XML PATH('#39#39')), 1, 1, '#39#39')'
      ')  from '
      
        '(select a.rkey,d741_ptr,d34_index,d34_ptr,b.type_code,b.[name],c' +
        '.dept_name from FA0742 a join FA0741 b'
      'on a.d741_ptr=b.rkey'
      'join data0034 c on a.d34_ptr=c.rkey'
      ')  as a')
    Left = 449
    Top = 295
  end
  object ADOTMP2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 448
    Top = 232
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    TableDirect = True
    TableName = 'FA0739'
    Left = 568
    Top = 77
    object ADOTable1RKEY: TIntegerField
      FieldName = 'RKEY'
    end
    object ADOTable1d738_ptr: TIntegerField
      FieldName = 'd738_ptr'
    end
    object ADOTable1DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADOTable1DifficultPoint: TMemoField
      FieldName = 'DifficultPoint'
      BlobType = ftMemo
    end
    object ADOTable1BEIZHU: TMemoField
      FieldName = 'BEIZHU'
      BlobType = ftMemo
    end
    object ADOTable1BasicTechnology: TMemoField
      FieldName = 'BasicTechnology'
      BlobType = ftMemo
    end
    object ADOTable1varchar_738: TStringField
      FieldName = 'varchar_738'
    end
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'DEPT_CODE'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      'select * from FA0739 where DEPT_CODE=:DEPT_CODE')
    Left = 624
    Top = 25
  end
  object QRY1: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'DEPT_CODE'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      'delete FA0739 where DEPT_CODE = :DEPT_CODE')
    Left = 624
    Top = 81
  end
  object DataSource6: TDataSource
    DataSet = ADOTable1
    Left = 558
    Top = 129
  end
  object DataSource7: TDataSource
    DataSet = ADOQuery2
    Left = 624
    Top = 129
  end
  object DataSource8: TDataSource
    DataSet = ADOQuery3
    Left = 558
    Top = 193
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'd738_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from FA0739 where d738_ptr=:d738_ptr')
    Left = 624
    Top = 193
  end
  object ADO0740Edit: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'RKEY738'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select  * from FA0740'
      'where RKEY738=:RKEY738')
    Left = 232
    Top = 264
    object ADO0740EditRkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object ADO0740EditRKEY25: TIntegerField
      FieldName = 'RKEY25'
    end
    object ADO0740EditRKEY10: TIntegerField
      FieldName = 'RKEY10'
    end
    object ADO0740EditRKEY738: TIntegerField
      FieldName = 'RKEY738'
    end
    object ADO0740EditTestDate: TDateTimeField
      FieldName = 'TestDate'
    end
    object ADO0740EditCreate_ptr: TIntegerField
      FieldName = 'Create_ptr'
    end
    object ADO0740EditTStatus: TIntegerField
      FieldName = 'TStatus'
    end
    object ADO0740EditTestResult: TWideStringField
      FieldName = 'TestResult'
      Size = 500
    end
    object ADO0740EditDEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADO0740Editfinished: TStringField
      FieldName = 'finished'
      Size = 50
    end
    object ADO0740Editsuggestion: TWideStringField
      FieldName = 'suggestion'
      Size = 1000
    end
  end
  object UPdate740: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'd738_ptr'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'd738_ptr2'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'update FA0740'
      'set FA0740.DEPT_CODE=FA0739.DEPT_CODE'
      'from FA0740,FA0739'
      'where FA0740.RKEY738=FA0739.d738_ptr'
      'and FA0739.d738_ptr=:d738_ptr'
      ''
      ''
      ''
      ''
      'insert into FA0740(RKEY25,'
      'RKEY10,'
      'RKEY738,'
      'TestDate,'
      'Create_ptr,'
      'TestResult,'
      'DEPT_CODE,'
      'finished,'
      'suggestion,'
      'TStatus'
      ')'
      
        'select FA0740.RKEY25,FA0740.RKEY10,FA0740.RKEY738,FA0740.TestDat' +
        'e,'
      
        'FA0740.Create_ptr,FA0740.TestResult,FA0739.DEPT_CODE,FA0740.fini' +
        'shed,'
      'FA0740.suggestion,FA0740.TStatus'
      'from FA0740,FA0739'
      'where FA0740.RKEY738=FA0739.d738_ptr'
      'and FA0739.d738_ptr=:d738_ptr2'
      'and FA0740.DEPT_CODE<>FA0739.DEPT_CODE'
      ''
      ''
      ''
      ''
      'select 1')
    Left = 288
    Top = 248
  end
  object ADOQuery4: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select top 1 Rkey  from FA0738'
      'order by Rkey desc')
    Left = 352
    Top = 248
    object ADOQuery4Rkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
  end
  object QueryofbpTMP: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'd741_ptr'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      ''
      'select distinct d741_ptr,type_code,[name],dept_name=convert('
      'varchar(500),'
      
        'STUFF((SELECT '#39#8594#39' +cast (d34_index as nvarchar(20))+'#39'.'#39'+ dept_na' +
        'me '
      
        'from (select a.rkey,d741_ptr,d34_index,d34_ptr,b.type_code,b.[na' +
        'me],c.dept_name from FA0742 a join FA0741 b'
      'on a.d741_ptr=b.rkey'
      'join data0034 c on a.d34_ptr=c.rkey) as b'
      ' where d741_ptr=a.d741_ptr'
      'FOR XML PATH('#39#39')), 1, 1, '#39#39')'
      ')  from '
      
        '(select a.rkey,d741_ptr,d34_index,d34_ptr,b.type_code,b.[name],c' +
        '.dept_name from FA0742 a join FA0741 b'
      'on a.d741_ptr=b.rkey'
      'join data0034 c on a.d34_ptr=c.rkey'
      ')  as a'
      'where d741_ptr=:d741_ptr'
      '')
    Left = 561
    Top = 308
    object QueryofbpTMPd741_ptr: TIntegerField
      FieldName = 'd741_ptr'
    end
    object QueryofbpTMPtype_code: TStringField
      FieldName = 'type_code'
      Size = 10
    end
    object QueryofbpTMPname: TWideStringField
      FieldName = 'name'
      Size = 100
    end
    object QueryofbpTMPdept_name: TStringField
      FieldName = 'dept_name'
      ReadOnly = True
      Size = 500
    end
  end
  object DataSource9: TDataSource
    Left = 558
    Top = 249
  end
  object ADODataSet_ud2: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select employee_id from data0005 where rkey=:rkey')
    Left = 369
    Top = 23
    object ADODataSet_ud2employee_id: TIntegerField
      FieldName = 'employee_id'
    end
  end
  object ADOQuery5: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'TestResult'
        Size = -1
        Value = Null
      end
      item
        Name = 'RKEY738'
        Size = -1
        Value = Null
      end
      item
        Name = 'DEPT_CODE'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @TestResult nvarchar(1000)'
      'set @TestResult=:TestResult'
      ''
      'update FA0740'
      'set TestResult=@TestResult'
      'where RKEY738=:RKEY738'
      'and DEPT_CODE=:DEPT_CODE'
      ''
      ''
      'select 1')
    Left = 285
    Top = 304
  end
  object DS2: TDataSource
    DataSet = ADO0744
    Left = 88
    Top = 383
  end
  object ADO0744: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select contract_rkey,file_name,flag,submit_person,'#13#10'b.employee_n' +
      'ame as submit_person_name,'#13#10'submit_date,modify_person,'#13#10'modify_d' +
      'ate'#13#10'from dbo.FA0744 a '#13#10'left join data0005 b on a.submit_person' +
      '=b.rkey'#13#10'where contract_rkey=:rkey744'
    Parameters = <
      item
        Name = 'rkey744'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 168
    Top = 392
    object ADO0744contract_rkey: TIntegerField
      FieldName = 'contract_rkey'
    end
    object ADO0744file_name: TWideStringField
      FieldName = 'file_name'
      Size = 100
    end
    object ADO0744flag: TIntegerField
      FieldName = 'flag'
    end
    object ADO0744submit_person: TIntegerField
      FieldName = 'submit_person'
    end
    object ADO0744submit_person_name: TStringField
      FieldName = 'submit_person_name'
      Size = 16
    end
    object ADO0744submit_date: TDateTimeField
      FieldName = 'submit_date'
    end
    object ADO0744modify_person: TIntegerField
      FieldName = 'modify_person'
    end
    object ADO0744modify_date: TDateTimeField
      FieldName = 'modify_date'
    end
  end
  object ADO0740: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select  * from FA0740'
      '')
    Left = 232
    Top = 200
    object ADO0740Rkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object ADO0740RKEY25: TIntegerField
      FieldName = 'RKEY25'
    end
    object ADO0740RKEY10: TIntegerField
      FieldName = 'RKEY10'
    end
    object ADO0740RKEY738: TIntegerField
      FieldName = 'RKEY738'
    end
    object ADO0740TestDate: TDateTimeField
      FieldName = 'TestDate'
    end
    object ADO0740Create_ptr: TIntegerField
      FieldName = 'Create_ptr'
    end
    object ADO0740TestResult: TWideStringField
      FieldName = 'TestResult'
      Size = 500
    end
    object ADO0740DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADO0740finished: TStringField
      FieldName = 'finished'
      Size = 50
    end
    object ADO0740suggestion: TWideStringField
      FieldName = 'suggestion'
      Size = 1000
    end
    object ADO0740TStatus: TIntegerField
      FieldName = 'TStatus'
    end
  end
end
