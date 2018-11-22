object DM: TDM
  OldCreateOrder = False
  Left = 421
  Top = 347
  Height = 444
  Width = 499
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 40
  end
  object ADO597: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterScroll = ADO597AfterScroll
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     dbo.data0597.status AS ststusr, dbo.data0597.rkey, db' +
        'o.data0597.spNumber, dbo.Data0010.ABBR_NAME, dbo.Data0073.USER_F' +
        'ULL_NAME, '
      
        '                      dbo.Data0001.CURR_NAME, dbo.data0597.v_tty' +
        'pe, dbo.data0597.Number, dbo.data0597.spmoney, dbo.Data0015.ABBR' +
        '_NAME AS ABBR_NAME_1, '
      
        '                      dbo.Data0005.EMPLOYEE_NAME AS yw05, dbo.da' +
        'ta0597.EntryTime, CASE dbo.data0597.Debit WHEN 0 THEN '#39#21542#39' WHEN 1' +
        ' THEN '#39#26159#39' ELSE '#39#20854#23427#39' END AS debita, '
      '                      dbo.data0597.Remarks, '
      
        '                      CASE dbo.data0597.status WHEN 1 THEN '#39#26410#25552#20132#39 +
        ' WHEN 2 THEN '#39#35780#23457#20013#39' WHEN 3 THEN '#39#24050#35780#23457#39' WHEN 4 THEN '#39#36864#22238#39' ELSE '#39#20854#23427#39' ' +
        'END AS v_status, '
      
        '                      dbo.data0597.submit_date, dbo.data0597.ywe' +
        'xplain, dbo.data0597.rkey73, dbo.data0599.status, dbo.data0599.r' +
        'key597, dbo.data0599.seq_no'
      'FROM         dbo.Data0073 INNER JOIN'
      '                      dbo.data0597 INNER JOIN'
      
        '                      dbo.Data0010 ON dbo.data0597.rkey10 = dbo.' +
        'Data0010.RKEY ON dbo.Data0073.RKEY = dbo.data0597.rkey73 INNER J' +
        'OIN'
      
        '                      dbo.Data0001 ON dbo.data0597.rkey01 = dbo.' +
        'Data0001.RKEY INNER JOIN'
      
        '                      dbo.Data0015 ON dbo.data0597.rkey15 = dbo.' +
        'Data0015.RKEY INNER JOIN'
      
        '                      dbo.Data0005 ON dbo.data0597.Salesman = db' +
        'o.Data0005.RKEY INNER JOIN'
      
        '                      dbo.data0599 ON dbo.data0597.rkey = dbo.da' +
        'ta0599.rkey597'
      'WHERE 1=1'
      '')
    Left = 144
    Top = 44
    object ADO597ststusr: TWordField
      FieldName = 'ststusr'
    end
    object ADO597rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO597spNumber: TStringField
      FieldName = 'spNumber'
      Size = 50
    end
    object ADO597ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADO597USER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object ADO597CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object ADO597v_ttype: TWideStringField
      FieldName = 'v_ttype'
      Size = 50
    end
    object ADO597Number: TIntegerField
      FieldName = 'Number'
    end
    object ADO597spmoney: TBCDField
      FieldName = 'spmoney'
      Precision = 19
    end
    object ADO597ABBR_NAME_1: TStringField
      FieldName = 'ABBR_NAME_1'
      Size = 10
    end
    object ADO597yw05: TStringField
      FieldName = 'yw05'
      Size = 10
    end
    object ADO597EntryTime: TDateTimeField
      FieldName = 'EntryTime'
    end
    object ADO597debita: TStringField
      FieldName = 'debita'
      ReadOnly = True
      Size = 4
    end
    object ADO597Remarks: TWideStringField
      FieldName = 'Remarks'
      Size = 300
    end
    object ADO597v_status: TStringField
      FieldName = 'v_status'
      ReadOnly = True
      Size = 6
    end
    object ADO597submit_date: TDateTimeField
      FieldName = 'submit_date'
    end
    object ADO597ywexplain: TWideStringField
      FieldName = 'ywexplain'
      Size = 300
    end
    object ADO597rkey73: TIntegerField
      FieldName = 'rkey73'
    end
    object ADO597status: TBooleanField
      FieldName = 'status'
    end
    object ADO597rkey597: TIntegerField
      FieldName = 'rkey597'
    end
    object ADO597seq_no: TIntegerField
      FieldName = 'seq_no'
    end
  end
  object ADO599: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey597'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.data0599.rkey597, dbo.data0599.PUTH_INFO, dbo.dat' +
        'a0599.seq_no, dbo.data0599.auth_date, dbo.Data0073.USER_FULL_NAM' +
        'E,case  dbo.data0599.status when 0 then '#39#26410#23457#26680#39' when 1 then '#39#24050#23457#26680#39'e' +
        'lse '#39#36864#22238#39'  end as status1'
      'FROM         dbo.data0599 LEFT OUTER JOIN'
      
        '                      dbo.Data0073 ON dbo.data0599.rkey73 = dbo.' +
        'Data0073.RKEY  '
      ''
      'where dbo.data0599.rkey597=:rkey597')
    Left = 144
    Top = 104
    object ADO599rkey597: TIntegerField
      FieldName = 'rkey597'
    end
    object ADO599PUTH_INFO: TWideStringField
      FieldName = 'PUTH_INFO'
      Size = 100
    end
    object ADO599seq_no: TIntegerField
      FieldName = 'seq_no'
    end
    object ADO599auth_date: TDateTimeField
      FieldName = 'auth_date'
    end
    object ADO599USER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object ADO599status1: TStringField
      FieldName = 'status1'
      ReadOnly = True
      Size = 6
    end
  end
  object DataSource1: TDataSource
    DataSet = ADO597
    Left = 204
    Top = 48
  end
  object DataSource2: TDataSource
    DataSet = ADO599
    Left = 204
    Top = 104
  end
  object DataSource3: TDataSource
    DataSet = ADS598
    Left = 204
    Top = 168
  end
  object ADOPS: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey597'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT  top 1 mark,  rkey597, rkey73, auth_date, PUTH_INFO, seq_' +
        'no, status'
      'FROM         dbo.data0599'
      ''
      'where rkey597=:rkey597 and status=0 ORDER BY SEQ_NO asc')
    Left = 424
    Top = 44
    object ADOPSrkey597: TIntegerField
      FieldName = 'rkey597'
    end
    object ADOPSrkey73: TIntegerField
      FieldName = 'rkey73'
    end
    object ADOPSauth_date: TDateTimeField
      FieldName = 'auth_date'
    end
    object ADOPSPUTH_INFO: TWideStringField
      FieldName = 'PUTH_INFO'
      Size = 100
    end
    object ADOPSseq_no: TIntegerField
      FieldName = 'seq_no'
    end
    object ADOPSstatus: TBooleanField
      FieldName = 'status'
    end
    object ADOPSmark: TBooleanField
      FieldName = 'mark'
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 420
    Top = 128
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 420
    Top = 180
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      ''
      ''
      '')
    Left = 424
    Top = 236
  end
  object ADS598: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'SELECT     dbo.DATA0598.rec_no, dbo.Tier3_CustomerFiles.FileName' +
      ', dbo.Data0005.EMPL_CODE, dbo.Data0005.EMPLOYEE_NAME, dbo.DATA05' +
      '98.remark, '#13#10'                      dbo.Tier3_CustomerFiles.Uploa' +
      'dTime, dbo.Tier3_CustomerFiles.Ftp_fileName, dbo.Tier3_CustomerF' +
      'iles.IDKey, dbo.Tier3_CustomerFiles.Ftp_Ptr'#13#10'FROM         dbo.DA' +
      'TA0598 INNER JOIN'#13#10'                      dbo.Tier3_CustomerFiles' +
      ' ON dbo.DATA0598.FtpIDKey = dbo.Tier3_CustomerFiles.IDKey INNER ' +
      'JOIN'#13#10'                      dbo.Data0005 ON dbo.Tier3_CustomerFi' +
      'les.UploadUser_d05ptr = dbo.Data0005.RKEY'#13#10'where data0598.rkey59' +
      '7 = :rkey597'#13#10'order by dbo.DATA0598.rec_no'
    Parameters = <
      item
        Name = 'rkey597'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 140
    Top = 168
    object ADS598rec_no: TIntegerField
      FieldName = 'rec_no'
    end
    object ADS598FileName: TStringField
      FieldName = 'FileName'
      Size = 512
    end
    object ADS598EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object ADS598EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADS598remark: TStringField
      FieldName = 'remark'
      Size = 100
    end
    object ADS598UploadTime: TDateTimeField
      FieldName = 'UploadTime'
    end
    object ADS598Ftp_fileName: TStringField
      FieldName = 'Ftp_fileName'
      FixedChar = True
      Size = 38
    end
    object ADS598IDKey: TStringField
      FieldName = 'IDKey'
      FixedChar = True
      Size = 38
    end
    object ADS598Ftp_Ptr: TIntegerField
      FieldName = 'Ftp_Ptr'
    end
  end
  object ADO609: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART' +
      '_DESC, dbo.data0609.rkey, dbo.data0609.rkey597, dbo.data0609.Num' +
      'ber25, dbo.data0609.condate, dbo.data0609.remark, '#13#10'            ' +
      '          dbo.data0609.rec_no, dbo.data0609.xingtai, dbo.data060' +
      '9.explain, dbo.data0609.company, dbo.data0609.Number, dbo.data06' +
      '09.spUnitPrice, dbo.data0609.spliable, '#13#10'                      d' +
      'bo.data0609.spmonth'#13#10'FROM         dbo.data0609 INNER JOIN'#13#10'     ' +
      '                 dbo.Data0025 ON dbo.data0609.Number25 = dbo.Dat' +
      'a0025.MANU_PART_NUMBER'#13#10'where rkey597=:rkey597'
    Parameters = <
      item
        Name = 'rkey597'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 140
    Top = 224
    object ADO609MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ADO609rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO609rkey597: TIntegerField
      FieldName = 'rkey597'
    end
    object ADO609Number25: TStringField
      FieldName = 'Number25'
      Size = 30
    end
    object ADO609condate: TDateTimeField
      FieldName = 'condate'
    end
    object ADO609remark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
    object ADO609rec_no: TWideStringField
      FieldName = 'rec_no'
      Size = 50
    end
    object ADO609xingtai: TStringField
      FieldName = 'xingtai'
    end
    object ADO609explain: TWideStringField
      FieldName = 'explain'
      Size = 200
    end
    object ADO609company: TStringField
      FieldName = 'company'
    end
    object ADO609Number: TIntegerField
      FieldName = 'Number'
    end
    object ADO609spUnitPrice: TBCDField
      FieldName = 'spUnitPrice'
      Precision = 19
    end
    object ADO609spliable: TWideStringField
      FieldName = 'spliable'
      Size = 10
    end
    object ADO609spmonth: TDateTimeField
      FieldName = 'spmonth'
    end
    object ADO609MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
  end
  object DS609: TDataSource
    DataSet = ADO609
    Left = 196
    Top = 224
  end
end
