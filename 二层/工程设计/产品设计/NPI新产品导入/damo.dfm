object DM: TDM
  OldCreateOrder = False
  Left = 514
  Top = 294
  Height = 316
  Width = 334
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 8
  end
  object DS600: TDataSource
    DataSet = ADS600
    Left = 88
    Top = 8
  end
  object DS603: TDataSource
    DataSet = ADS603
    Left = 88
    Top = 64
  end
  object ADS600: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterOpen = ADS600AfterOpen
    AfterScroll = ADS600AfterScroll
    CommandText = 
      'SELECT      dbo.DATA0600.Rkey, dbo.DATA0600.NPI_NUMBER, dbo.DATA' +
      '0600.NIP_NAME, dbo.DATA0600.create_date, dbo.DATA0600.submit_dat' +
      'e,'#13#10'                   case dbo.DATA0600.status when 1 then '#39#26410#25552#20132 +
      #39' when 2 then '#39#35780#23457#20013#39' when 3 then '#39#24050#35780#23457#39' when 4 then '#39#36864#22238#39'  else '#39#20854#23427 +
      #39' end as v_status, '#13#10'                      dbo.DATA0600.auth_dat' +
      'e, dbo.DATA0600.rkmark, dbo.DATA0600.v_ttype, dbo.Data0025.MANU_' +
      'PART_NUMBER, dbo.Data0025.MANU_PART_DESC, '#13#10'                    ' +
      '  dbo.Data0025.ANALYSIS_CODE_2, dbo.Data0025.ANALYSIS_CODE_5, db' +
      'o.Data0025.ANALYSIS_CODE_1, dbo.Data0025.LAYERS, dbo.DATA0600.st' +
      'atus,'#13#10'                      dbo.Data0008.PROD_CODE, dbo.Data000' +
      '8.PRODUCT_NAME, dbo.Data0005.EMPL_CODE, dbo.Data0005.EMPLOYEE_NA' +
      'ME,data0600.Cust_part_ptr,data0600.create_userptr'#13#10'FROM         ' +
      'dbo.DATA0600 INNER JOIN'#13#10'                      dbo.Data0025 ON d' +
      'bo.DATA0600.CUST_PART_PTR = dbo.Data0025.RKEY INNER JOIN'#13#10'      ' +
      '                dbo.Data0005 ON dbo.DATA0600.create_userptr = db' +
      'o.Data0005.RKEY INNER JOIN'#13#10'                      dbo.Data0008 O' +
      'N dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY'#13#10'where 1=1'
    Parameters = <>
    Left = 144
    Top = 16
    object ADS600Rkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object ADS600NPI_NUMBER: TStringField
      DisplayLabel = 'NPI'#32534#21495
      FieldName = 'NPI_NUMBER'
      Size = 10
    end
    object ADS600NIP_NAME: TWideStringField
      DisplayLabel = #35780#23457#20027#39064
      FieldName = 'NIP_NAME'
      Size = 100
    end
    object ADS600create_date: TDateTimeField
      DisplayLabel = #21019#24314#26085#26399
      FieldName = 'create_date'
    end
    object ADS600submit_date: TDateTimeField
      DisplayLabel = #25552#20132#35780#23457#26085#26399
      FieldName = 'submit_date'
    end
    object ADS600auth_date: TDateTimeField
      DisplayLabel = #26368#21518#35780#23457#36890#36807#26085#26399
      FieldName = 'auth_date'
    end
    object ADS600rkmark: TWideStringField
      DisplayLabel = #22791#27880#35828#26126
      FieldName = 'rkmark'
      Size = 200
    end
    object ADS600v_ttype: TStringField
      DisplayLabel = #35780#23457#27969#31243#20195#30721
      FieldName = 'v_ttype'
    end
    object ADS600MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADS600MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ADS600ANALYSIS_CODE_2: TStringField
      DisplayLabel = #23458#25143#29289#26009#21495
      FieldName = 'ANALYSIS_CODE_2'
      Size = 80
    end
    object ADS600ANALYSIS_CODE_5: TStringField
      DisplayLabel = 'PCS'#21333#21482#23610#23544
      FieldName = 'ANALYSIS_CODE_5'
      Size = 30
    end
    object ADS600ANALYSIS_CODE_1: TStringField
      DisplayLabel = #35268#26684'('#20132#36135#23610#23544')set'
      FieldName = 'ANALYSIS_CODE_1'
      Size = 30
    end
    object ADS600LAYERS: TWordField
      DisplayLabel = #23618#25968
      FieldName = 'LAYERS'
    end
    object ADS600PROD_CODE: TStringField
      DisplayLabel = #20135#21697#31867#21035#20195#30721
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object ADS600PRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#31867#21035#21517#31216
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADS600EMPL_CODE: TStringField
      DisplayLabel = #21019#24314#20154#24037#21495
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object ADS600EMPLOYEE_NAME: TStringField
      DisplayLabel = #21019#24314#20154
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADS600v_status: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'v_status'
      ReadOnly = True
      Size = 6
    end
    object ADS600Cust_part_ptr: TIntegerField
      FieldName = 'Cust_part_ptr'
    end
    object ADS600create_userptr: TIntegerField
      FieldName = 'create_userptr'
    end
    object ADS600status: TWordField
      FieldName = 'status'
    end
  end
  object ADS603: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT     rec_no, npi_ptr, diff_declare, solution, duty_officer' +
      ', status_date'#13#10'FROM         dbo.DATA0603'#13#10'where npi_ptr = :npi_p' +
      'tr'#13#10'order by rec_no'
    DataSource = DS600
    IndexFieldNames = 'npi_ptr'
    MasterFields = 'Rkey'
    Parameters = <
      item
        Name = 'npi_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 144
    Top = 64
    object ADS603rec_no: TIntegerField
      FieldName = 'rec_no'
    end
    object ADS603npi_ptr: TIntegerField
      FieldName = 'npi_ptr'
    end
    object ADS603diff_declare: TWideStringField
      FieldName = 'diff_declare'
      Size = 100
    end
    object ADS603solution: TMemoField
      FieldName = 'solution'
      BlobType = ftMemo
    end
    object ADS603duty_officer: TWideStringField
      FieldName = 'duty_officer'
      Size = 10
    end
    object ADS603status_date: TMemoField
      FieldName = 'status_date'
      BlobType = ftMemo
    end
  end
  object ADS614: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 'SELECT     v_ttype, Remark'#13#10'FROM         dbo.DATA0614'
    Parameters = <>
    Left = 136
    Top = 128
    object ADS614v_ttype: TStringField
      DisplayLabel = 'NPI'#23457#25209#27969#31243#20195#30721
      FieldName = 'v_ttype'
    end
    object ADS614Remark: TWideStringField
      DisplayLabel = #35780#23457#35828#26126
      FieldName = 'Remark'
      Size = 100
    end
  end
  object ADS615: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.DATA0615.v_ttype, dbo.DATA0615.rec_no,  dbo.Data0' +
      '034.DEPT_CODE, dbo.Data0034.DEPT_NAME, '#13#10'                      d' +
      'bo.Data0073.USER_FULL_NAME, dbo.Data0073.USER_LOGIN_NAME,data061' +
      '5.rkey34,data0615.csi_ptr'#13#10'FROM         dbo.DATA0615 INNER JOIN'#13 +
      #10'                      dbo.Data0034 ON dbo.DATA0615.rkey34 = dbo' +
      '.Data0034.RKEY INNER JOIN'#13#10'                      dbo.Data0073 ON' +
      ' dbo.DATA0615.csi_ptr = dbo.Data0073.RKEY'#13#10'where DATA0615.v_ttyp' +
      'e = :v_ttype'#13#10'order by DATA0615.rec_no'
    DataSource = DS614
    IndexFieldNames = 'v_ttype'
    MasterFields = 'v_ttype'
    Parameters = <
      item
        Name = 'v_ttype'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end>
    Left = 144
    Top = 184
    object ADS615v_ttype: TStringField
      FieldName = 'v_ttype'
    end
    object ADS615rec_no: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'rec_no'
    end
    object ADS615DEPT_CODE: TStringField
      DisplayLabel = #23457#25209#37096#38376#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADS615DEPT_NAME: TStringField
      DisplayLabel = #23457#25209#37096#38376#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADS615USER_FULL_NAME: TStringField
      DisplayLabel = #20449#24687#36890#30693#29992#25143
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object ADS615USER_LOGIN_NAME: TStringField
      DisplayLabel = #20449#24687#25509#25910#20154#20195#30721
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
    object ADS615rkey34: TIntegerField
      FieldName = 'rkey34'
    end
    object ADS615csi_ptr: TIntegerField
      FieldName = 'csi_ptr'
    end
  end
  object DS614: TDataSource
    DataSet = ADS614
    Left = 96
    Top = 128
  end
  object DS615: TDataSource
    DataSet = ADS615
    Left = 96
    Top = 184
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 24
    Top = 112
  end
  object ADS6031: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'SELECT     rec_no, npi_ptr, diff_declare, solution, duty_officer' +
      ', status_date'#13#10'FROM         dbo.DATA0603'#13#10'where npi_ptr = :npi_p' +
      'tr'#13#10'order by rec_no'
    Parameters = <
      item
        Name = 'npi_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 256
    Top = 16
    object ADS6031rec_no: TIntegerField
      FieldName = 'rec_no'
    end
    object ADS6031npi_ptr: TIntegerField
      FieldName = 'npi_ptr'
    end
    object ADS6031diff_declare: TWideStringField
      FieldName = 'diff_declare'
      Size = 100
    end
    object ADS6031solution: TMemoField
      FieldName = 'solution'
      BlobType = ftMemo
    end
    object ADS6031duty_officer: TWideStringField
      FieldName = 'duty_officer'
      Size = 10
    end
    object ADS6031status_date: TMemoField
      FieldName = 'status_date'
      BlobType = ftMemo
    end
  end
  object DS6031: TDataSource
    DataSet = ADS6031
    Left = 208
    Top = 16
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 40
    Top = 184
  end
  object ADS602: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT     TOP (100) PERCENT dbo.DATA0602.npi_ptr, dbo.DATA0602.' +
      'dept_ptr, dbo.DATA0602.user_ptr, '#13#10'                 dbo.DATA0602' +
      '.auth_date, dbo.DATA0602.PUTH_INFO, dbo.DATA0602.rec_no,'#13#10'      ' +
      '            case   dbo.DATA0602.auth_flag when 0 then'#39#26410#35780#23457#39' when ' +
      '1 then '#39#24050#35780#23457#39' when 2 then '#39#36864#22238#39' else '#39#20854#23427#39' end as v_auth_flag, '#13#10'  ' +
      '                dbo.DATA0602.csi_ptr, dbo.Data0034.DEPT_NAME, db' +
      'o.Data0005.EMPLOYEE_NAME,dbo.DATA0602.auth_flag'#13#10'FROM         db' +
      'o.DATA0602 LEFT JOIN'#13#10'                      dbo.Data0005 ON dbo.' +
      'DATA0602.user_ptr = dbo.Data0005.RKEY INNER JOIN'#13#10'              ' +
      '        dbo.Data0034 ON dbo.DATA0602.dept_ptr = dbo.Data0034.RKE' +
      'Y '#13#10'where npi_ptr = :rkey600'#13#10'ORDER BY dbo.DATA0602.rec_no'
    Parameters = <
      item
        Name = 'rkey600'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 256
    Top = 72
    object ADS602npi_ptr: TIntegerField
      FieldName = 'npi_ptr'
    end
    object ADS602dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object ADS602user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object ADS602auth_date: TDateTimeField
      DisplayLabel = #35780#23457#26085#26399
      FieldName = 'auth_date'
    end
    object ADS602PUTH_INFO: TStringField
      DisplayLabel = #35780#23457#22791#27880
      FieldName = 'PUTH_INFO'
      Size = 50
    end
    object ADS602rec_no: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'rec_no'
    end
    object ADS602csi_ptr: TIntegerField
      FieldName = 'csi_ptr'
    end
    object ADS602DEPT_NAME: TStringField
      DisplayLabel = #35780#23457#37096#38376
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADS602EMPLOYEE_NAME: TStringField
      DisplayLabel = #35780#23457#29992#25143
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADS602v_auth_flag: TStringField
      DisplayLabel = #35780#23457#29366#24577
      FieldName = 'v_auth_flag'
      ReadOnly = True
      Size = 6
    end
    object ADS602auth_flag: TWordField
      FieldName = 'auth_flag'
    end
  end
  object DS602: TDataSource
    DataSet = ADS602
    Left = 208
    Top = 72
  end
  object DS601: TDataSource
    DataSet = ADS601
    Left = 208
    Top = 128
  end
  object ADS601: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
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
    Left = 264
    Top = 128
    object ADS601rec_no: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'rec_no'
    end
    object ADS601FileName: TStringField
      DisplayLabel = #25991#20214#21517
      FieldName = 'FileName'
      Size = 512
    end
    object ADS601UploadTime: TDateTimeField
      DisplayLabel = #19978#20256#26102#38388
      FieldName = 'UploadTime'
    end
    object ADS601EMPL_CODE: TStringField
      DisplayLabel = #19978#20256#20154#24037#21495
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object ADS601EMPLOYEE_NAME: TStringField
      DisplayLabel = #19978#20256#20154
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADS601remark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 100
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
    Left = 208
    Top = 184
  end
  object qryFileList2: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
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
      'SELECT     FtpIDKey, remark, npi_ptr, rec_no'
      'FROM         dbo.DATA0601'
      'where npi_ptr =:rkey600')
    Left = 264
    Top = 184
  end
end
