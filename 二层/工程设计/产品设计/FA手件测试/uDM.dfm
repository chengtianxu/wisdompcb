object dm: Tdm
  OldCreateOrder = False
  Left = 456
  Top = 219
  Height = 552
  Width = 902
  object ADOConnection1: TADOConnection
    CommandTimeout = 25
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 112
    Top = 18
  end
  object DataSource1: TDataSource
    DataSet = ADO0745
    Left = 106
    Top = 72
  end
  object ADO0745: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select dbo.FA0745.Rkey,FA0745.F_NUM,dbo.FA0745.RKEY10,dbo.FA0745' +
      '.RKEY25,dbo.FA0745.RKEY60,FA0745.QUAN_ON_HAND,data0025.MANU_PART' +
      '_NUMBER,Data0010.CUSTOMER_NAME,data0005.ABBR_NAME,'#13#10'FA0745.Creat' +
      'eDate,FA0745.BEIZHU,FA0745.AUDITED_ptr,Data0005.EMPLOYEE_NAME,FA' +
      '0745.check_type,'#13#10'FA0745.circle,FA0745.submit_suggestion as '#36865#23457#20154#24847 +
      #35265',FA0745.check_status,'#13#10'case when ( check_status=0  and circle=1' +
      ' ) then'#39#26410#25552#20132#39#13#10' when  ( check_status=0  and circle>1 ) then '#39#24453#37325#25552#20132 +
      #39#13#10' when   check_status=1 then '#39#24453#23457#26680#39#13#10' when  check_status=2 then' +
      '  '#39#20840#37096#36890#36807#23457#26680#39' end as '#29366#24577',dbo.data0060.SALES_ORDER'#13#10' from '#13#10'dbo.FA074' +
      '5 inner join  '#13#10'dbo.Data0025 on  dbo.FA0745.RKEY25=dbo.Data0025.' +
      'RKEY inner join'#13#10'dbo.Data0010 on  dbo.FA0745.RKEY10=dbo.Data0010' +
      '.RKEY inner join'#13#10'dbo.Data0005 on  dbo.FA0745.AUDITED_ptr=dbo.Da' +
      'ta0005.RKEY inner join'#13#10'dbo.Data0060 on  dbo.FA0745.RKEY60=dbo.D' +
      'ata0060.RKEY'#13#10
    Parameters = <>
    Left = 168
    Top = 72
    object ADO0745Rkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object ADO0745F_NUM: TStringField
      FieldName = 'F_NUM'
    end
    object ADO0745RKEY10: TIntegerField
      FieldName = 'RKEY10'
    end
    object ADO0745RKEY25: TIntegerField
      FieldName = 'RKEY25'
    end
    object ADO0745RKEY60: TIntegerField
      FieldName = 'RKEY60'
    end
    object ADO0745QUAN_ON_HAND: TIntegerField
      FieldName = 'QUAN_ON_HAND'
    end
    object ADO0745MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
      Size = 30
    end
    object ADO0745CUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object ADO0745ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADO0745CreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object ADO0745BEIZHU: TStringField
      FieldName = 'BEIZHU'
      Size = 200
    end
    object ADO0745AUDITED_ptr: TIntegerField
      FieldName = 'AUDITED_ptr'
    end
    object ADO0745EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADO0745check_type: TIntegerField
      FieldName = 'check_type'
    end
    object ADO0745circle: TIntegerField
      FieldName = 'circle'
    end
    object ADO0745DSDesigner: TMemoField
      FieldName = #36865#23457#20154#24847#35265
      BlobType = ftMemo
    end
    object ADO0745check_status: TIntegerField
      FieldName = 'check_status'
    end
    object ADO0745DSDesigner2: TStringField
      FieldName = #29366#24577
      ReadOnly = True
      Size = 12
    end
    object ADO0745SALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
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
    Parameters = <>
    SQL.Strings = (
      
        'select rkey,type_code,name,remark,'#23457#26680#27969#31243'=case Type when 0 then '#39#21046#21069 +
        #33021#21147#31649#29702#23457#26680#27969#31243#39
      
        '                                                 when 1 then '#39'FA' +
        #27979#35797#23457#26680#27969#31243#39' end,Type'
      '  from FA0741')
    Left = 167
    Top = 130
    object ADO0741rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO0741type_code: TStringField
      FieldName = 'type_code'
      Size = 10
    end
    object ADO0741name: TWideStringField
      FieldName = 'name'
      Size = 100
    end
    object ADO0741remark: TWideStringField
      FieldName = 'remark'
      Size = 100
    end
    object ADO0741DSDesigner: TStringField
      FieldName = #23457#26680#27969#31243
      ReadOnly = True
    end
    object ADO0741Type: TIntegerField
      FieldName = 'Type'
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
      
        'select b.dept_name,a.rkey,d741_ptr,d34_index,d34_ptr,a.rkey as r' +
        'key742  from FA0742  a left join '
      'data0034 b on a.d34_ptr=b.rkey'
      'where b.ttype=4 and d741_ptr=:rkey741'
      'order by d34_index')
    Left = 168
    Top = 190
    object ADO0742dept_name: TStringField
      FieldName = 'dept_name'
      ReadOnly = True
      Size = 30
    end
    object ADO0742rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO0742d741_ptr: TIntegerField
      FieldName = 'd741_ptr'
      ReadOnly = True
    end
    object ADO0742d34_index: TIntegerField
      FieldName = 'd34_index'
      ReadOnly = True
    end
    object ADO0742d34_ptr: TIntegerField
      FieldName = 'd34_ptr'
      ReadOnly = True
    end
    object ADO0742rkey742: TAutoIncField
      FieldName = 'rkey742'
      ReadOnly = True
    end
  end
  object ADO0746: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey745'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select a.rkey,a.d745_ptr,d34_index,d34_ptr,check_person,check_st' +
        'atus,'
      'check_time,b.employee_name,c.dept_name ,'
      
        'case when isnull(check_status,0)=0 and isnull(check_person,0)=0 ' +
        'then '#39#26410#23457#26680#39' '
      
        '        when isnull(check_status,0)=0 and isnull(check_person,0)' +
        '<>0 then '#39#24453#37325#23457#39
      
        '       when isnull(check_status,0)=1  then '#39#24050#23457#26680#39' else '#39#26410#30693#39' end a' +
        's ['#29366#24577']'
      'from FA0746 a left join data0005 b on a.check_person=b.rkey'
      ' left join data0034 c on a.d34_ptr=c.rkey'
      'where d745_ptr=:rkey745'
      'order by d34_index')
    Left = 164
    Top = 259
    object ADO0746rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO0746d745_ptr: TIntegerField
      FieldName = 'd745_ptr'
    end
    object ADO0746d34_index: TIntegerField
      FieldName = 'd34_index'
    end
    object ADO0746d34_ptr: TIntegerField
      FieldName = 'd34_ptr'
    end
    object ADO0746check_person: TIntegerField
      FieldName = 'check_person'
    end
    object ADO0746check_status: TIntegerField
      FieldName = 'check_status'
    end
    object ADO0746check_time: TDateTimeField
      FieldName = 'check_time'
    end
    object ADO0746employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object ADO0746dept_name: TStringField
      FieldName = 'dept_name'
      Size = 30
    end
    object ADO0746DSDesigner: TStringField
      FieldName = #29366#24577
      ReadOnly = True
      Size = 6
    end
  end
  object DataSource4: TDataSource
    DataSet = ADO0746
    Left = 100
    Top = 259
  end
  object ADOTMP1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 632
    Top = 16
  end
  object ADOTMP2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 632
    Top = 88
  end
  object ADOTMP3: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 632
    Top = 160
  end
  object ADODel742: TADOQuery
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
      'delete FA0742'
      'where d741_ptr=:rkey741'
      ''
      ''
      'select 1')
    Left = 280
    Top = 190
  end
  object DataSource5: TDataSource
    DataSet = ADO0740
    Left = 84
    Top = 323
  end
  object ADO0740: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'RKEY25'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'RKEY745'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select fa0740.Rkey,data0034.rkey as rkey34,t1.STEP_NUMBER,data00' +
        '34.DEPT_CODE,data0034.DEPT_NAME,fa0740.DifficultPoint,fa0740.BEI' +
        'ZHU,fa0740.TestResult'
      'from dbo.FA0740 inner join dbo.FA0745'
      'on FA0740.RKEY745=FA0745.rkey  inner join dbo.Data0034'
      
        'on FA0740.RKEY34=dbo.Data0034.rkey inner join(SELECT data0038.SO' +
        'URCE_PTR, data0038.DEPT_PTR, '
      'data0038.DEF_ROUT_INST, data0038.STEP_NUMBER, '
      'data0038.tooling_rev, data0038.OUTP_SPFC,'
      'data0038.tool_old_rev, data0038.TOOL_REMARK'
      'FROM Data0038 '
      'where source_ptr=:RKEY25)t1 on Data0034.RKEY=t1.DEPT_PTR'
      'where FA0740.RKEY745=:RKEY745'
      'order by fa0740.Rkey')
    Left = 164
    Top = 323
    object ADO0740Rkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object ADO0740DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADO0740DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADO0740DifficultPoint: TWideStringField
      FieldName = 'DifficultPoint'
      Size = 500
    end
    object ADO0740BEIZHU: TWideStringField
      FieldName = 'BEIZHU'
      Size = 500
    end
    object ADO0740TestResult: TWideStringField
      FieldName = 'TestResult'
      Size = 500
    end
    object ADO0740STEP_NUMBER: TSmallintField
      FieldName = 'STEP_NUMBER'
    end
    object ADO0740rkey34: TAutoIncField
      FieldName = 'rkey34'
      ReadOnly = True
    end
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
      'join data0034 c on a.d34_ptr=c.rkey where b.Type=1'
      ')  as a')
    Left = 281
    Top = 15
    object Queryofbpd741_ptr: TIntegerField
      FieldName = 'd741_ptr'
    end
    object Queryofbptype_code: TStringField
      FieldName = 'type_code'
      Size = 10
    end
    object Queryofbpname: TWideStringField
      FieldName = 'name'
      Size = 100
    end
    object Queryofbpdept_name: TStringField
      FieldName = 'dept_name'
      ReadOnly = True
      Size = 500
    end
  end
  object ADOD04: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select  CONTROL_NO_LENGTH, SEED_VALUE, SEED_FLAG'#13#10'from Data0004'#13 +
      #10' where table_name='#39'FA0745'#39' '#13#10' '
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
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    LockType = ltPessimistic
    Parameters = <>
    Left = 450
    Top = 67
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
    Left = 281
    Top = 68
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
  object Insert740: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from FA0740')
    Left = 228
    Top = 323
    object Insert740Rkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object Insert740RKEY745: TIntegerField
      FieldName = 'RKEY745'
    end
    object Insert740RKEY34: TIntegerField
      FieldName = 'RKEY34'
    end
    object Insert740DifficultPoint: TWideStringField
      FieldName = 'DifficultPoint'
      Size = 500
    end
    object Insert740BEIZHU: TWideStringField
      FieldName = 'BEIZHU'
      Size = 500
    end
    object Insert740TestResult: TWideStringField
      FieldName = 'TestResult'
      Size = 500
    end
    object Insert740TestDate: TDateTimeField
      FieldName = 'TestDate'
    end
    object Insert740Create_ptr: TIntegerField
      FieldName = 'Create_ptr'
    end
  end
  object ADODel: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
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
      'declare @rkey745 int'
      'set @rkey745=:rkey'
      ''
      ''
      ''
      'delete fa0746'
      'where d745_ptr=@rkey745'
      ''
      ''
      ''
      'delete FA0740'
      'where RKEY745=@rkey745'
      ''
      ''
      'delete FA0745'
      'where Rkey=@rkey745'
      ''
      ''
      ''
      ''
      ''
      'select 1')
    Left = 352
    Top = 192
  end
  object ADOQuery6: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'Rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'update FA0745  set submit_suggestion='#39#39
      'where Rkey=:Rkey'
      ''
      ''
      'select 1')
    Left = 285
    Top = 272
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
    Left = 361
    Top = 23
    object ADODataSet_ud2employee_id: TIntegerField
      FieldName = 'employee_id'
    end
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'd745_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select  COUNT(check_status) as sl'
      'from FA0746 a left join data0005 b on a.check_person=b.rkey'
      ' left join data0034 c on a.d34_ptr=c.rkey'
      'where d745_ptr=:d745_ptr and check_status=1')
    Left = 164
    Top = 395
    object ADOQuery2sl: TIntegerField
      FieldName = 'sl'
      ReadOnly = True
    end
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'd745_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select top 1  sl=d34_index-1'
      'from FA0746 a left join data0005 b on a.check_person=b.rkey'
      ' left join data0034 c on a.d34_ptr=c.rkey'
      'where d745_ptr=:d745_ptr'
      'order by d34_index desc')
    Left = 228
    Top = 395
    object ADOQuery3sl: TIntegerField
      FieldName = 'sl'
      ReadOnly = True
    end
  end
  object ADOQuery7: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'rkey25'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select RKEY as rkey25,MANU_PART_NUMBER from data0025 '
      
        'where :rkey25 in (select RKEY25 from FA0745 where check_status i' +
        'n (0,1) )')
    Left = 440
    Top = 208
  end
  object ADOQuery4: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'rkey25'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT    dbo.Data0034.RKEY'
      'FROM         dbo.Data0025 INNER JOIN'
      
        '                      dbo.Data0038 ON dbo.Data0025.RKEY = dbo.Da' +
        'ta0038.SOURCE_PTR INNER JOIN'
      
        '                      dbo.Data0034 ON dbo.Data0038.DEPT_PTR = db' +
        'o.Data0034.RKEY '
      'WHERE   data0025.PARENT_PTR is null'
      'and dbo.Data0025.RKEY=:rkey25'
      'ORDER BY dbo.Data0038.STEP_NUMBER'
      '')
    Left = 448
    Top = 264
  end
  object adsPickWorkShop: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    AfterOpen = adsPickWorkShopAfterOpen
    CommandText = 
      'declare @IsSelected bit '#13#10'select @IsSelected as IsSelected, Data' +
      '0034.RKEY,upper(Dept_Code) as Dept_Code,'#13#10'upper(Dept_Name)+'#39' '#39' a' +
      's Dept_Name from Data0034 INNER JOIN '#13#10'dbo.Data0038 ON dbo.Data0' +
      '038.DEPT_PTR = dbo.Data0034.RKEY INNER JOIN '#13#10'dbo.Data0025 ON db' +
      'o.Data0025.RKEY = dbo.Data0038.SOURCE_PTR '#13#10'where Data0034.TTYPE' +
      '=1 '#13#10'and data0025.PARENT_PTR is null'#13#10'and dbo.Data0025.RKEY=:rke' +
      'y25'#13#10'order by Data0034.dept_Code'
    Parameters = <
      item
        Name = 'rkey25'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    Left = 408
    Top = 392
    object adsPickWorkShopIsSelected: TBooleanField
      FieldName = 'IsSelected'
    end
    object adsPickWorkShopRKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object adsPickWorkShopDept_Code: TStringField
      FieldName = 'Dept_Code'
      ReadOnly = True
    end
    object adsPickWorkShopDept_Name: TStringField
      FieldName = 'Dept_Name'
      ReadOnly = True
      Size = 61
    end
  end
  object dspPickWorkShop: TDataSetProvider
    DataSet = adsPickWorkShop
    Left = 528
    Top = 384
  end
  object cdsPickWorkShop: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 400
    Top = 456
  end
  object dsPickWorkShop: TDataSource
    DataSet = cdsPickWorkShop
    Left = 480
    Top = 464
  end
  object ADODel740: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'RKEY745'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'RKEY34'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'delete FA0740'
      'where RKEY745=:RKEY745'
      'and  RKEY34=:RKEY34'
      ''
      'select 1')
    Left = 296
    Top = 320
  end
end
