object DM: TDM
  OldCreateOrder = False
  Left = 453
  Top = 334
  Height = 333
  Width = 436
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 12
  end
  object ado600: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    AfterScroll = ado600AfterScroll
    Parameters = <
      item
        Name = 'rkey34'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.DATA0600.rkey, dbo.DATA0600.NPI_NUMBER, dbo.DATA0' +
        '600.NIP_NAME, dbo.Data0025.MANU_PART_NUMBER, dbo.Data0005.EMPLOY' +
        'EE_NAME, '
      
        '                      dbo.DATA0600.create_date, dbo.DATA0600.sub' +
        'mit_date,dbo.DATA0600.auth_date, dbo.DATA0600.rkmark, dbo.DATA06' +
        '00.v_ttype, '
      
        '                      dbo.DATA0602.dept_ptr,case dbo.DATA0600.st' +
        'atus when 1 then '#39#26410#25552#20132#39' when 2 then '#39#35780#23457#20013#39' when 3 then '#39#24050#35780#23457#39'else '#39 +
        #36864#22238#39'end as status1'
      'FROM         dbo.DATA0600 INNER JOIN'
      
        '                      dbo.DATA0602 ON dbo.DATA0600.rkey = dbo.DA' +
        'TA0602.npi_ptr INNER JOIN'
      
        '                      dbo.Data0005 ON dbo.DATA0600.create_userpt' +
        'r = dbo.Data0005.RKEY INNER JOIN'
      
        '                      dbo.Data0025 ON dbo.DATA0600.CUST_PART_PTR' +
        ' = dbo.Data0025.RKEY'
      '           '
      ''
      ''
      
        'where dbo.DATA0602.dept_ptr= :rkey34 and (dbo.DATA0600.status = ' +
        '2 or dbo.DATA0600.status =4)')
    Left = 116
    Top = 24
    object ado600rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ado600NPI_NUMBER: TStringField
      FieldName = 'NPI_NUMBER'
      Size = 10
    end
    object ado600NIP_NAME: TWideStringField
      FieldName = 'NIP_NAME'
      Size = 100
    end
    object ado600MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ado600EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ado600create_date: TDateTimeField
      FieldName = 'create_date'
    end
    object ado600submit_date: TDateTimeField
      FieldName = 'submit_date'
    end
    object ado600auth_date: TDateTimeField
      FieldName = 'auth_date'
    end
    object ado600rkmark: TWideStringField
      FieldName = 'rkmark'
      Size = 200
    end
    object ado600v_ttype: TStringField
      FieldName = 'v_ttype'
    end
    object ado600dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object ado600status1: TStringField
      FieldName = 'status1'
      ReadOnly = True
      Size = 6
    end
  end
  object DataSource1: TDataSource
    DataSet = ado600
    Left = 192
    Top = 16
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'npi_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.Data0005.EMPLOYEE_NAME, dbo.Data0034.DEPT_NAME, d' +
        'bo.DATA0602.auth_date, '
      
        'dbo.DATA0602.PUTH_INFO,case dbo.DATA0602.auth_flag when 0 then '#39 +
        #26410#35780#23457#39' when 1 then '#39#24050#35780#23457#39' when 2 then '#39#36864#22238#39' end as auth_flag1'
      ''
      'FROM         dbo.DATA0602 LEFT JOIN'
      
        '                      dbo.Data0005 ON dbo.DATA0602.user_ptr = db' +
        'o.Data0005.RKEY LEFT JOIN'
      
        '                      dbo.Data0034 ON dbo.DATA0602.dept_ptr = db' +
        'o.Data0034.RKEY '
      'where npi_ptr = :npi_ptr '
      ''
      'ORDER BY rec_no')
    Left = 112
    Top = 88
    object ADOQuery1DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADOQuery1auth_date: TDateTimeField
      FieldName = 'auth_date'
    end
    object ADOQuery1PUTH_INFO: TStringField
      FieldName = 'PUTH_INFO'
      Size = 50
    end
    object ADOQuery1EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOQuery1auth_flag1: TStringField
      FieldName = 'auth_flag1'
      ReadOnly = True
      Size = 6
    end
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery1
    Left = 192
    Top = 88
  end
  object DataSource3: TDataSource
    DataSet = ADO603
    Left = 188
    Top = 140
  end
  object ADO603: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0603 where npi_ptr = :ptr')
    Left = 108
    Top = 148
    object ADO603rec_no: TIntegerField
      FieldName = 'rec_no'
    end
    object ADO603npi_ptr: TIntegerField
      FieldName = 'npi_ptr'
    end
    object ADO603diff_declare: TWideStringField
      FieldName = 'diff_declare'
      Size = 100
    end
    object ADO603solution: TMemoField
      FieldName = 'solution'
      BlobType = ftMemo
    end
    object ADO603duty_officer: TWideStringField
      FieldName = 'duty_officer'
      Size = 10
    end
    object ADO603status_date: TMemoField
      FieldName = 'status_date'
      BlobType = ftMemo
    end
  end
  object ADO601: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey600'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.DATA0601.rec_no, dbo.Tier3_CustomerFiles.FileName' +
        ', dbo.Data0005.EMPL_CODE, dbo.Data0005.EMPLOYEE_NAME, dbo.DATA06' +
        '01.remark, '
      
        '                      dbo.Tier3_CustomerFiles.UploadTime, dbo.Ti' +
        'er3_CustomerFiles.Ftp_fileName, dbo.Tier3_CustomerFiles.IDKey'
      'FROM         dbo.DATA0601 INNER JOIN'
      
        '                      dbo.Tier3_CustomerFiles ON dbo.DATA0601.Ft' +
        'pIDKey = dbo.Tier3_CustomerFiles.IDKey INNER JOIN'
      
        '                      dbo.Data0005 ON dbo.Tier3_CustomerFiles.Up' +
        'loadUser_d05ptr = dbo.Data0005.RKEY'
      'where data0601.npi_ptr = :rkey600')
    Left = 112
    Top = 204
    object ADO601rec_no: TIntegerField
      FieldName = 'rec_no'
    end
    object ADO601FileName: TStringField
      FieldName = 'FileName'
      Size = 512
    end
    object ADO601EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object ADO601EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADO601remark: TStringField
      FieldName = 'remark'
      Size = 100
    end
    object ADO601UploadTime: TDateTimeField
      FieldName = 'UploadTime'
    end
    object ADO601Ftp_fileName: TStringField
      FieldName = 'Ftp_fileName'
      FixedChar = True
      Size = 38
    end
    object ADO601IDKey: TStringField
      FieldName = 'IDKey'
      FixedChar = True
      Size = 38
    end
  end
  object DataSource4: TDataSource
    DataSet = ADO601
    Left = 192
    Top = 200
  end
  object ADOedit602: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'npi_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'dept_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     npi_ptr,dept_ptr,auth_flag, user_ptr, auth_date, PUTH' +
        '_INFO'
      'FROM         dbo.DATA0602'
      'WHERE npi_ptr=:npi_ptr and dept_ptr=:dept_ptr')
    Left = 256
    Top = 12
    object ADOedit602npi_ptr: TIntegerField
      FieldName = 'npi_ptr'
    end
    object ADOedit602dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object ADOedit602auth_flag: TWordField
      FieldName = 'auth_flag'
    end
    object ADOedit602user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object ADOedit602auth_date: TDateTimeField
      FieldName = 'auth_date'
    end
    object ADOedit602PUTH_INFO: TStringField
      FieldName = 'PUTH_INFO'
      Size = 50
    end
  end
  object temp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 260
    Top = 84
  end
  object ADOloop: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
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
      
        'SELECT     dbo.DATA0600.rkey, dbo.DATA0600.status, dbo.DATA0600.' +
        'auth_date, dbo.DATA0602.auth_flag'
      'FROM         dbo.DATA0602 INNER JOIN'
      
        '                      dbo.DATA0600 ON dbo.DATA0602.npi_ptr = dbo' +
        '.DATA0600.rkey'
      
        'WHERE dbo.DATA0600.rkey=:rkey and (dbo.DATA0602.auth_flag=0 or d' +
        'bo.DATA0602.auth_flag=2)')
    Left = 256
    Top = 136
    object ADOlooprkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOloopstatus: TWordField
      FieldName = 'status'
    end
    object ADOloopauth_date: TDateTimeField
      FieldName = 'auth_date'
    end
    object ADOloopauth_flag: TWordField
      FieldName = 'auth_flag'
    end
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
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
      
        'SELECT       dbo.DATA0600.rkey, dbo.DATA0600.status, dbo.DATA060' +
        '0.auth_date, dbo.DATA0602.auth_flag, dbo.DATA0602.PUTH_INFO,'
      'dbo.DATA0602.user_ptr, dbo.DATA0602.auth_date as date602'
      'FROM         dbo.DATA0602 INNER JOIN'
      
        '             dbo.DATA0600 ON dbo.DATA0602.npi_ptr = dbo.DATA0600' +
        '.rkey'
      'WHERE dbo.DATA0600.rkey=:rkey ')
    Left = 264
    Top = 196
    object ADOQuery2rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery2status: TWordField
      FieldName = 'status'
    end
    object ADOQuery2auth_date: TDateTimeField
      FieldName = 'auth_date'
    end
    object ADOQuery2auth_flag: TWordField
      FieldName = 'auth_flag'
    end
    object ADOQuery2PUTH_INFO: TStringField
      FieldName = 'PUTH_INFO'
      Size = 50
    end
    object ADOQuery2user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object ADOQuery2date602: TDateTimeField
      FieldName = 'date602'
    end
  end
  object ADS601: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'SELECT     dbo.DATA0601.rec_no, dbo.Tier3_CustomerFiles.FileName' +
      ', dbo.Data0005.EMPL_CODE, dbo.Data0005.EMPLOYEE_NAME, dbo.DATA06' +
      '01.remark, '#13#10'                      dbo.Tier3_CustomerFiles.Uploa' +
      'dTime, dbo.Tier3_CustomerFiles.Ftp_fileName, dbo.Tier3_CustomerF' +
      'iles.IDKey, dbo.Tier3_CustomerFiles.Ftp_Ptr'#13#10'FROM         dbo.DA' +
      'TA0601 INNER JOIN'#13#10'                      dbo.Tier3_CustomerFiles' +
      ' ON dbo.DATA0601.FtpIDKey = dbo.Tier3_CustomerFiles.IDKey INNER ' +
      'JOIN'#13#10'                      dbo.Data0005 ON dbo.Tier3_CustomerFi' +
      'les.UploadUser_d05ptr = dbo.Data0005.RKEY'#13#10'where data0601.npi_pt' +
      'r = :rkey600'#13#10'order by dbo.DATA0601.rec_no'
    Parameters = <
      item
        Name = 'rkey600'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 324
    Top = 100
    object ADS601rec_no: TIntegerField
      FieldName = 'rec_no'
    end
    object ADS601FileName: TStringField
      FieldName = 'FileName'
      Size = 512
    end
    object ADS601EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object ADS601EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADS601remark: TStringField
      FieldName = 'remark'
      Size = 100
    end
    object ADS601UploadTime: TDateTimeField
      FieldName = 'UploadTime'
    end
    object ADS601Ftp_fileName: TStringField
      FieldName = 'Ftp_fileName'
      FixedChar = True
      Size = 38
    end
    object ADS601IDKey: TStringField
      FieldName = 'IDKey'
      FixedChar = True
      Size = 38
    end
    object ADS601Ftp_Ptr: TIntegerField
      FieldName = 'Ftp_Ptr'
    end
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 332
    Top = 168
  end
end
