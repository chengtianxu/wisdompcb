object dm: Tdm
  OldCreateOrder = False
  Left = 463
  Top = 202
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
    Left = 416
    Top = 392
  end
  object ADO0738: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select dbo.FA0738.Rkey,FA0738.FA_NUM,dbo.FA0738.RKEY10,dbo.FA073' +
      '8.RKEY25,data0025.MANU_PART_NUMBER,Data0010.CUSTOMER_NAME,chanpi' +
      'nshuxing='#13#10'case dbo.data0025.ttype when 0 then '#39#26679#21697#39' when 1 then ' +
      #39#37327#20135#39' end,data0005.ABBR_NAME,'#13#10'FA0738.BasicTechnology,FA0738.isCh' +
      'ange,FA0738.CreateDate,FA0738.AUDITED_ptr,Data0005.EMPLOYEE_NAME' +
      ',FA0738.check_type,'#13#10'FA0738.circle,FA0738.submit_suggestion as '#36865 +
      #23457#20154#24847#35265',FA0738.check_status,'#13#10'case when ( check_status=0  and circl' +
      'e=1 ) then'#39#26410#25552#20132#39#13#10' when  ( check_status=0  and circle>1 ) then '#39#24453 +
      #37325#25552#20132#39#13#10' when   check_status=1 then '#39#24453#23457#26680#39#13#10' when  check_status=2 t' +
      'hen  '#39#20840#37096#36890#36807#23457#26680#39' end as '#29366#24577#13#10' from '#13#10'dbo.FA0738 inner join  '#13#10'dbo.Da' +
      'ta0025 on  dbo.FA0738.RKEY25=dbo.Data0025.RKEY inner join'#13#10'dbo.D' +
      'ata0010 on  dbo.FA0738.RKEY10=dbo.Data0010.RKEY inner join'#13#10'dbo.' +
      'Data0005 on  dbo.FA0738.AUDITED_ptr=dbo.Data0005.RKEY'#13#10
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
    object ADO0738isChange: TIntegerField
      FieldName = 'isChange'
    end
    object ADO0738CreateDate: TDateTimeField
      FieldName = 'CreateDate'
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
  object ADOTMP1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 448
    Top = 184
  end
  object DataSource4: TDataSource
    Left = 680
    Top = 438
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
      'check_time,b.employee_name,c.dept_name ,'
      
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
      'join data0034 c on a.d34_ptr=c.rkey where b.Type=0'
      ')  as a')
    Left = 449
    Top = 295
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
    Left = 560
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
      end
      item
        Name = 'rkey738'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from FA0739 where DEPT_CODE=:DEPT_CODE'
      'and d738_ptr=:rkey738')
    Left = 640
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
    Left = 361
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
    Left = 253
    Top = 312
  end
  object DS2: TDataSource
    DataSet = ADOFTP
    Left = 88
    Top = 383
  end
  object ADOFTP: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'SELECT     dbo.FA0744.rkey,dbo.FA0744.contract_rkey,dbo.FA0744.F' +
      'tpIDKey,dbo.FA0744.remark,dbo.Tier3_CustomerFiles.FileName, dbo.' +
      'Data0005.EMPLOYEE_NAME, '#13#10'                      dbo.Tier3_Custom' +
      'erFiles.UploadTime, dbo.Tier3_CustomerFiles.Ftp_fileName, dbo.Ti' +
      'er3_CustomerFiles.IDKey, dbo.Tier3_CustomerFiles.Ftp_Ptr'#13#10'      ' +
      '                ,dbo.Tier3_CustomerFiles.UploadUser_d05ptr,dbo.T' +
      'ier3_CustomerFiles.GroupIDKey'#13#10'FROM         dbo.FA0744 INNER JOI' +
      'N'#13#10'                      dbo.Tier3_CustomerFiles ON dbo.FA0744.F' +
      'tpIDKey = dbo.Tier3_CustomerFiles.IDKey INNER JOIN'#13#10'            ' +
      '          dbo.Data0005 ON dbo.Tier3_CustomerFiles.UploadUser_d05' +
      'ptr = dbo.Data0005.RKEY'#13#10'where dbo.FA0744.contract_rkey = :rkey7' +
      '38'#13#10'order by dbo.FA0744.rkey'#13#10
    Parameters = <
      item
        Name = 'rkey738'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 168
    Top = 384
    object ADOFTPrkey: TIntegerField
      FieldName = 'rkey'
    end
    object ADOFTPFileName: TStringField
      FieldName = 'FileName'
      Size = 512
    end
    object ADOFTPEMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOFTPremark: TWideStringField
      FieldName = 'remark'
      FixedChar = True
      Size = 10
    end
    object ADOFTPUploadTime: TDateTimeField
      FieldName = 'UploadTime'
    end
    object ADOFTPFtp_fileName: TStringField
      FieldName = 'Ftp_fileName'
      FixedChar = True
      Size = 38
    end
    object ADOFTPIDKey: TStringField
      FieldName = 'IDKey'
      FixedChar = True
      Size = 38
    end
    object ADOFTPFtp_Ptr: TIntegerField
      FieldName = 'Ftp_Ptr'
    end
    object ADOFTPUploadUser_d05ptr: TIntegerField
      FieldName = 'UploadUser_d05ptr'
    end
    object ADOFTPGroupIDKey: TStringField
      FieldName = 'GroupIDKey'
      FixedChar = True
      Size = 38
    end
    object ADOFTPcontract_rkey: TIntegerField
      FieldName = 'contract_rkey'
    end
    object ADOFTPFtpIDKey: TWideStringField
      FieldName = 'FtpIDKey'
      FixedChar = True
      Size = 76
    end
  end
  object qryFtp2: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'IDKey'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 38
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT IDKey, FileName, Ftp_Ptr, FtpDir, Ftp_fileName, UploadTim' +
        'e, UploadUser_d05ptr, GroupIDKey, BEnable from Tier3_CustomerFil' +
        'es'
      'where IDkey = :IDKey')
    Left = 168
    Top = 448
    object qryFtp2IDKey: TStringField
      FieldName = 'IDKey'
      FixedChar = True
      Size = 38
    end
    object qryFtp2FileName: TStringField
      FieldName = 'FileName'
      Size = 512
    end
    object qryFtp2Ftp_Ptr: TIntegerField
      FieldName = 'Ftp_Ptr'
    end
    object qryFtp2FtpDir: TStringField
      FieldName = 'FtpDir'
      Size = 1024
    end
    object qryFtp2Ftp_fileName: TStringField
      FieldName = 'Ftp_fileName'
      FixedChar = True
      Size = 38
    end
    object qryFtp2UploadTime: TDateTimeField
      FieldName = 'UploadTime'
    end
    object qryFtp2UploadUser_d05ptr: TIntegerField
      FieldName = 'UploadUser_d05ptr'
    end
    object qryFtp2GroupIDKey: TStringField
      FieldName = 'GroupIDKey'
      FixedChar = True
      Size = 38
    end
    object qryFtp2BEnable: TBooleanField
      FieldName = 'BEnable'
    end
  end
  object qryFileList2: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey738'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT     FtpIDKey, remark, contract_rkey, rkey'
      'FROM        dbo.FA0744'
      'where contract_rkey =:rkey738')
    Left = 240
    Top = 448
    object qryFileList2FtpIDKey: TWideStringField
      FieldName = 'FtpIDKey'
      FixedChar = True
      Size = 76
    end
    object qryFileList2remark: TWideStringField
      FieldName = 'remark'
      FixedChar = True
      Size = 10
    end
    object qryFileList2contract_rkey: TIntegerField
      FieldName = 'contract_rkey'
    end
    object qryFileList2rkey: TIntegerField
      FieldName = 'rkey'
    end
  end
  object ADODelFpt: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'contract_rkey'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'rkey_744'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'contract_rkey'
        Size = -1
        Value = Null
      end
      item
        Name = 'rkey_744'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'delete Tier3_CustomerFiles'
      'from Tier3_CustomerFiles '
      
        'inner  JOIN FA0744 on dbo.Tier3_CustomerFiles.IDKey=dbo.FA0744.F' +
        'tpIDKey'
      'where dbo.FA0744.contract_rkey=:contract_rkey'
      'and dbo.FA0744.rkey=:rkey_744'
      ''
      ''
      'delete FA0744'
      'where contract_rkey=:contract_rkey'
      'and rkey=:rkey_744'
      ''
      ''
      'select '#39#39)
    Left = 248
    Top = 384
  end
  object ADOQuery6: TADOQuery
    Connection = ADOConnection1
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
      'update FA0738  set submit_suggestion='#39#39
      'where Rkey=:Rkey'
      ''
      ''
      'select 1')
    Left = 325
    Top = 392
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
    Left = 168
    Top = 254
  end
  object ADOUPdate749: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'DifficultPoint'
        Attributes = [paNullable, paLong]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 2147483647
        Value = Null
      end
      item
        Name = 'BEIZHU'
        Attributes = [paNullable, paLong]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 2147483647
        Value = Null
      end
      item
        Name = 'DEPT_CODE'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'rkey738'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE fa0739'
      'SET DifficultPoint=:DifficultPoint,BEIZHU=:BEIZHU'
      'WHERE DEPT_CODE=:DEPT_CODE'
      'and d738_ptr=:rkey738'
      ''
      ''
      ''
      'select 1')
    Left = 560
    Top = 25
  end
  object ADOTMP3: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 368
    Top = 168
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
      
        'where :rkey25 in (select RKEY25 from FA0738 where check_status i' +
        'n (0,1) )')
    Left = 552
    Top = 368
  end
end
