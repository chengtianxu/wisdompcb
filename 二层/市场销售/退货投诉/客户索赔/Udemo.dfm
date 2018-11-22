object DM: TDM
  OldCreateOrder = False
  Left = 369
  Top = 256
  Height = 421
  Width = 543
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 28
  end
  object ADO597: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterScroll = ADO597AfterScroll
    CommandText = 
      'SELECT dbo.data0597.status as ststusr,    dbo.data0597.rkey, dbo' +
      '.data0597.spNumber, dbo.Data0010.ABBR_NAME, dbo.Data0073.USER_FU' +
      'LL_NAME, dbo.Data0001.CURR_NAME, dbo.data0597.v_ttype ,dbo.data0' +
      '597.Number,dbo.data0597.spmoney,'#13#10'                      dbo.Data' +
      '0015.ABBR_NAME as ABBR_NAME_1, dbo.Data0005.EMPLOYEE_NAME AS yw0' +
      '5, dbo.data0597.EntryTime, case dbo.data0597.Debit when 0 then '#39 +
      #21542#39' when 1 then '#39#26159#39' else '#39#20854#23427#39' end as debita, dbo.data0597.Remarks' +
      ', '#13#10'                     case dbo.data0597.status when 1 then '#39#26410 +
      #25552#20132#39' when 2 then '#39#35780#23457#20013#39' when 3 then '#39#24050#35780#23457#39'   else '#39#36864#22238#39' end as v_sta' +
      'tus,  dbo.data0597.submit_date, dbo.data0597.ywexplain,dbo.data0' +
      '597.rkey73,b.USER_FULL_NAME'#13#10'FROM         dbo.Data0073 INNER JOI' +
      'N'#13#10'                      dbo.data0597 INNER JOIN'#13#10'              ' +
      '        dbo.Data0010 ON dbo.data0597.rkey10 = dbo.Data0010.RKEY ' +
      'ON dbo.Data0073.RKEY = dbo.data0597.rkey73 INNER JOIN'#13#10'         ' +
      '             dbo.Data0001 ON dbo.data0597.rkey01 = dbo.Data0001.' +
      'RKEY INNER JOIN'#13#10'                      dbo.Data0015 ON dbo.data0' +
      '597.rkey15 = dbo.Data0015.RKEY INNER JOIN'#13#10'                     ' +
      ' dbo.Data0005 ON dbo.data0597.Salesman = dbo.Data0005.RKEY OUTER' +
      ' APPLY'#13#10#9#9#9#9#9'  (SELECT data0073.USER_FULL_NAME FROM dbo.data0599' +
      ' INNER JOIN data0073 ON data0599.rkey73 = data0073.RKEY'#13#10#9#9#9#9#9'  ' +
      'WHERE rkey597=data0597.rkey AND mark =1'#13#10#9#9#9#9#9'  ) b'#13#10' where'#13#10'   ' +
      '  dbo.data0597.status<> :v1 and  dbo.data0597.status<> :v2 and'#13#10 +
      '     dbo.data0597.status<> :v3 and  dbo.data0597.status<> :v4 an' +
      'd'#13#10'    EntryTime>= :vdate1 AND  EntryTime<= :vdate2'#13#10'    '
    Parameters = <
      item
        Name = 'v1'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end
      item
        Name = 'v2'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end
      item
        Name = 'v3'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end
      item
        Name = 'v4'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end
      item
        Name = 'vdate1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'vdate2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    Left = 136
    Top = 28
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
    object ADO597CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
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
    object ADO597USER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object ADO597yy: TFloatField
      FieldKind = fkCalculated
      FieldName = 'yy'
      Calculated = True
    end
    object ADO597v_ttype: TWideStringField
      FieldName = 'v_ttype'
      Size = 50
    end
    object ADO597ststusr: TWordField
      FieldName = 'ststusr'
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
    object ADO597rkey73: TIntegerField
      FieldName = 'rkey73'
    end
    object ADO597USER_FULL_NAME_1: TStringField
      FieldName = 'USER_FULL_NAME_1'
      Size = 30
    end
  end
  object DS597: TDataSource
    DataSet = ADO597
    Left = 188
    Top = 28
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
    Left = 136
    Top = 80
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
    Left = 192
    Top = 80
  end
  object ADO607: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterScroll = ADO607AfterScroll
    Parameters = <>
    SQL.Strings = (
      'SELECT     dbo.Data0073.USER_FULL_NAME, dbo.data0607.*'
      'FROM         dbo.Data0073 RIGHT OUTER JOIN'
      
        '                      dbo.data0607 ON dbo.Data0073.RKEY = dbo.da' +
        'ta0607.rkey73')
    Left = 48
    Top = 424
    object ADO607v_ttype: TWideStringField
      FieldName = 'v_ttype'
      Size = 50
    end
    object ADO607Explain: TWideStringField
      FieldName = 'Explain'
      Size = 100
    end
    object ADO607rkey73: TIntegerField
      FieldName = 'rkey73'
    end
    object ADO607USER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
  end
  object ado608: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'v_ttype'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.Data0073.USER_LOGIN_NAME, dbo.Data0073.USER_FULL_' +
        'NAME, dbo.Data0073.RKEY, dbo.data0608.seq_no, dbo.data0608.v_tty' +
        'pe, dbo.data0608.rkey73'
      'FROM       dbo.data0608 INNER JOIN'
      
        '           dbo.Data0073 ON dbo.data0608.rkey73 = dbo.Data0073.RK' +
        'EY'
      'where dbo.data0608.v_ttype=:v_ttype'
      'ORDER BY seq_no ASC')
    Left = 48
    Top = 476
    object ado608USER_LOGIN_NAME: TStringField
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
    object ado608USER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object ado608RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ado608seq_no: TIntegerField
      FieldName = 'seq_no'
    end
    object ado608v_ttype: TWideStringField
      FieldName = 'v_ttype'
      Size = 50
    end
    object ado608rkey73: TIntegerField
      FieldName = 'rkey73'
    end
  end
  object DS607: TDataSource
    DataSet = ADO607
    Left = 96
    Top = 428
  end
  object DS608: TDataSource
    DataSet = ado608
    Left = 96
    Top = 476
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 340
    Top = 432
  end
  object aq607: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'v_ttype'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0607 where v_ttype=:v_ttype')
    Left = 48
    Top = 528
    object aq607v_ttype: TWideStringField
      FieldName = 'v_ttype'
      Size = 50
    end
    object aq607Explain: TWideStringField
      FieldName = 'Explain'
      Size = 100
    end
    object aq607rkey73: TIntegerField
      FieldName = 'rkey73'
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
    Left = 152
    Top = 540
  end
  object qryFileList2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
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
      'SELECT     FtpIDKey, remark, rkey597, rec_no'
      'FROM         dbo.DATA0598'
      'where rkey597=:rkey597')
    Left = 148
    Top = 592
    object qryFileList2FtpIDKey: TWideStringField
      FieldName = 'FtpIDKey'
      FixedChar = True
      Size = 38
    end
    object qryFileList2remark: TStringField
      FieldName = 'remark'
      Size = 100
    end
    object qryFileList2rkey597: TIntegerField
      FieldName = 'rkey597'
    end
    object qryFileList2rec_no: TIntegerField
      FieldName = 'rec_no'
    end
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
    Left = 92
    Top = 524
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
  object DS598: TDataSource
    DataSet = ADS598
    Left = 88
    Top = 596
  end
  object ADOl598: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.data0598.rec_no, dbo.Tier3_CustomerFiles.FileName' +
      ' AS Expr1, dbo.Data0005.EMPLOYEE_NAME, dbo.data0598.rkey597'#13#10'FRO' +
      'M         dbo.data0598 INNER JOIN'#13#10'                      dbo.Tie' +
      'r3_CustomerFiles ON dbo.data0598.FtpIDKey = dbo.Tier3_CustomerFi' +
      'les.IDKey INNER JOIN'#13#10'                      dbo.Data0005 ON dbo.' +
      'Tier3_CustomerFiles.UploadUser_d05ptr = dbo.Data0005.RKEY'#13#10'where' +
      '  rkey597=:rkey597'
    Parameters = <
      item
        Name = 'rkey597'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 232
    Top = 432
    object ADOl598rec_no: TIntegerField
      FieldName = 'rec_no'
    end
    object ADOl598Expr1: TStringField
      FieldName = 'Expr1'
      Size = 512
    end
    object ADOl598EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOl598rkey597: TIntegerField
      FieldName = 'rkey597'
    end
  end
  object ADODl599: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.data0599.rkey597, dbo.data0599.PUTH_INFO, dbo.dat' +
      'a0599.seq_no, dbo.data0599.rkey73, dbo.data0599.auth_date,dbo.Da' +
      'ta0073.USER_FULL_NAME, '#13#10'                      CASE dbo.data0599' +
      '.status WHEN 0 THEN '#39#26410#23457#26680#39' WHEN 1 THEN '#39#24050#23457#26680#39' ELSE '#39#36864#22238#39' END AS sta' +
      'tus1, dbo.data0597.v_ttype'#13#10'FROM         dbo.data0599 INNER JOIN' +
      #13#10'                      dbo.data0597 ON dbo.data0599.rkey597 = d' +
      'bo.data0597.rkey LEFT OUTER JOIN'#13#10'                      dbo.Data' +
      '0073 ON dbo.data0599.rkey73 = dbo.Data0073.RKEY'#13#10#13#10'where rkey597' +
      '=:rkey597'#13#10#13#10'ORDER BY dbo.data0599.seq_no ASC'
    Parameters = <
      item
        Name = 'rkey597'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 236
    Top = 488
    object ADODl599rkey597: TIntegerField
      FieldName = 'rkey597'
    end
    object ADODl599PUTH_INFO: TWideStringField
      FieldName = 'PUTH_INFO'
      Size = 100
    end
    object ADODl599seq_no: TIntegerField
      FieldName = 'seq_no'
    end
    object ADODl599auth_date: TDateTimeField
      FieldName = 'auth_date'
    end
    object ADODl599USER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object ADODl599status1: TStringField
      FieldName = 'status1'
      ReadOnly = True
      Size = 6
    end
    object ADODl599v_ttype: TWideStringField
      FieldName = 'v_ttype'
      Size = 50
    end
    object ADODl599rkey73: TIntegerField
      FieldName = 'rkey73'
    end
  end
  object DSl598: TDataSource
    DataSet = ADOl598
    Left = 280
    Top = 436
  end
  object DSl599: TDataSource
    DataSet = ADODl599
    Left = 288
    Top = 492
  end
  object ADOpv597: TADOQuery
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
      
        'SELECT    spNumber, rkey10, rkey73, EntryTime, rkey01, Debit, Re' +
        'marks, status, submit_date, Salesman, ywexplain, rkey15, rkey'
      'FROM         dbo.data0597'
      ''
      'where rkey=:rkey')
    Left = 260
    Top = 32
    object ADOpv597spNumber: TStringField
      FieldName = 'spNumber'
      Size = 50
    end
    object ADOpv597rkey10: TAutoIncField
      FieldName = 'rkey10'
      ReadOnly = True
    end
    object ADOpv597rkey73: TIntegerField
      FieldName = 'rkey73'
    end
    object ADOpv597EntryTime: TDateTimeField
      FieldName = 'EntryTime'
    end
    object ADOpv597rkey01: TIntegerField
      FieldName = 'rkey01'
    end
    object ADOpv597Debit: TBooleanField
      FieldName = 'Debit'
    end
    object ADOpv597Remarks: TWideStringField
      FieldName = 'Remarks'
      Size = 300
    end
    object ADOpv597status: TWordField
      FieldName = 'status'
    end
    object ADOpv597submit_date: TDateTimeField
      FieldName = 'submit_date'
    end
    object ADOpv597Salesman: TIntegerField
      FieldName = 'Salesman'
    end
    object ADOpv597ywexplain: TWideStringField
      FieldName = 'ywexplain'
      Size = 300
    end
    object ADOpv597rkey15: TIntegerField
      FieldName = 'rkey15'
    end
    object ADOpv597rkey: TIntegerField
      FieldName = 'rkey'
    end
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 48
    Top = 588
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 160
    Top = 428
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 156
    Top = 488
  end
  object edit609: TADOQuery
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
      
        'SELECT rkey597, Number25, condate, remark, rec_no, xingtai, expl' +
        'ain, company, '
      
        '               Number, spUnitPrice, spliable, spmonth FROM dbo.d' +
        'ata0609'
      ''
      'where rkey597=:rkey597')
    Left = 192
    Top = 152
    object edit609rkey597: TIntegerField
      FieldName = 'rkey597'
    end
    object edit609Number25: TStringField
      FieldName = 'Number25'
      Size = 30
    end
    object edit609condate: TDateTimeField
      FieldName = 'condate'
    end
    object edit609remark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
    object edit609rec_no: TWideStringField
      FieldName = 'rec_no'
      Size = 50
    end
    object edit609xingtai: TStringField
      FieldName = 'xingtai'
    end
    object edit609explain: TWideStringField
      FieldName = 'explain'
      Size = 200
    end
    object edit609company: TStringField
      FieldName = 'company'
    end
    object edit609Number: TIntegerField
      FieldName = 'Number'
    end
    object edit609spUnitPrice: TBCDField
      FieldName = 'spUnitPrice'
      Precision = 19
    end
    object edit609spliable: TWideStringField
      FieldName = 'spliable'
      Size = 10
    end
    object edit609spmonth: TDateTimeField
      FieldName = 'spmonth'
    end
  end
  object edit597: TADOQuery
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
      
        'SELECT     dbo.data0597.tax,dbo.data0597.spmoney, dbo.data0597.N' +
        'umber, dbo.data0597.rkey, dbo.data0597.spNumber, dbo.Data0010.AB' +
        'BR_NAME AS name10, '
      
        '                      dbo.Data0073.USER_FULL_NAME, dbo.Data0001.' +
        'CURR_NAME, dbo.Data0015.WAREHOUSE_NAME, dbo.Data0005.ABBR_NAME A' +
        'S yw05, dbo.data0597.Debit, '
      
        '                      dbo.data0597.status, dbo.data0597.ywexplai' +
        'n, dbo.Data0010.CUST_CODE, dbo.Data0034.DEPT_NAME, dbo.data0597.' +
        'v_ttype, dbo.data0597.Remarks, '
      
        '                      dbo.Data0015.ABBR_NAME AS name15, dbo.data' +
        '0597.Salesman, dbo.data0597.rkey73, dbo.data0597.rkey15, dbo.dat' +
        'a0597.rkey10, dbo.data0597.rkey01, '
      
        '                      dbo.Data0005.EMPL_CODE, dbo.Data0015.WAREH' +
        'OUSE_CODE'
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
      
        '                      dbo.Data0034 ON dbo.Data0005.EMPLOYEE_ID =' +
        ' dbo.Data0034.RKEY'
      ''
      'where dbo.data0597.rkey=:rkey')
    Left = 136
    Top = 148
    object edit597rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object edit597spNumber: TStringField
      FieldName = 'spNumber'
      Size = 50
    end
    object edit597name10: TStringField
      FieldName = 'name10'
      Size = 10
    end
    object edit597USER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object edit597CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object edit597WAREHOUSE_NAME: TStringField
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
    object edit597yw05: TStringField
      FieldName = 'yw05'
      Size = 10
    end
    object edit597Debit: TBooleanField
      FieldName = 'Debit'
    end
    object edit597status: TWordField
      FieldName = 'status'
    end
    object edit597ywexplain: TWideStringField
      FieldName = 'ywexplain'
      Size = 300
    end
    object edit597CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object edit597DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object edit597v_ttype: TWideStringField
      FieldName = 'v_ttype'
      Size = 50
    end
    object edit597Remarks: TWideStringField
      FieldName = 'Remarks'
      Size = 300
    end
    object edit597name15: TStringField
      FieldName = 'name15'
      Size = 10
    end
    object edit597Salesman: TIntegerField
      FieldName = 'Salesman'
    end
    object edit597rkey73: TIntegerField
      FieldName = 'rkey73'
    end
    object edit597rkey15: TIntegerField
      FieldName = 'rkey15'
    end
    object edit597rkey10: TIntegerField
      FieldName = 'rkey10'
    end
    object edit597rkey01: TIntegerField
      FieldName = 'rkey01'
    end
    object edit597spmoney: TBCDField
      FieldName = 'spmoney'
      Precision = 19
    end
    object edit597Number: TIntegerField
      FieldName = 'Number'
    end
    object edit597EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object edit597WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object edit597tax: TBooleanField
      FieldName = 'tax'
    end
  end
  object ADOhz: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    Left = 436
    Top = 335
  end
  object DataSource1: TDataSource
    DataSet = ADOhz
    Left = 428
    Top = 271
  end
  object ADODSmx: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'SELECT     dbo.Data0010.CUST_CODE, dbo.Data0010.ABBR_NAME, dbo.d' +
      'ata0609.spmonth, dbo.data0609.spliable, dbo.data0609.spUnitPrice' +
      ', dbo.data0609.Number, '#13#10'                      dbo.data0609.comp' +
      'any, dbo.data0609.explain, dbo.data0609.xingtai, dbo.data0609.re' +
      'c_no, dbo.Data0025.MANU_PART_DESC, dbo.Data0025.MANU_PART_NUMBER' +
      ', '#13#10'                      dbo.data0609.remark, dbo.data0609.cond' +
      'ate, dbo.data0609.rkey597, dbo.Data0001.CURR_NAME'#13#10'FROM         ' +
      'dbo.data0597 INNER JOIN'#13#10'                      dbo.data0609 ON d' +
      'bo.data0597.rkey = dbo.data0609.rkey597 INNER JOIN'#13#10'            ' +
      '          dbo.Data0010 ON dbo.data0597.rkey10 = dbo.Data0010.RKE' +
      'Y INNER JOIN'#13#10'                      dbo.Data0025 ON dbo.data0609' +
      '.Number25 = dbo.Data0025.MANU_PART_NUMBER INNER JOIN'#13#10'          ' +
      '            dbo.Data0001 ON dbo.data0597.rkey01 = dbo.Data0001.R' +
      'KEY'#13#10'WHERE dbo.data0609.rkey597 IN( '#13#10
    Parameters = <>
    Left = 424
    Top = 508
    object ADODSmxCUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADODSmxABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADODSmxspmonth: TDateTimeField
      FieldName = 'spmonth'
    end
    object ADODSmxspliable: TWideStringField
      FieldName = 'spliable'
      Size = 10
    end
    object ADODSmxspUnitPrice: TBCDField
      FieldName = 'spUnitPrice'
      Precision = 19
    end
    object ADODSmxNumber: TIntegerField
      FieldName = 'Number'
    end
    object ADODSmxcompany: TStringField
      FieldName = 'company'
    end
    object ADODSmxexplain: TWideStringField
      FieldName = 'explain'
      Size = 200
    end
    object ADODSmxxingtai: TStringField
      FieldName = 'xingtai'
    end
    object ADODSmxrec_no: TWideStringField
      FieldName = 'rec_no'
      Size = 50
    end
    object ADODSmxMANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ADODSmxMANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADODSmxremark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
    object ADODSmxcondate: TDateTimeField
      FieldName = 'condate'
    end
    object ADODSmxrkey597: TIntegerField
      FieldName = 'rkey597'
    end
    object ADODSmxCURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
  end
  object DataSource2: TDataSource
    DataSet = ADODSmx
    Left = 428
    Top = 456
  end
  object ADO618pres: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    OnCalcFields = ADO618presCalcFields
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
      
        'SELECT  dbo.data0618.sel_n, dbo.data0618.sp_money, dbo.data0618.' +
        'rkey597, dbo.data0618.dep_ptr, '
      '                      dbo.data0618.emp_ptr'
      'FROM    dbo.data0618'
      '                     '
      'WHERE rkey597=:rkey597'
      'ORDER BY sel_n ASC')
    Left = 436
    Top = 64
    object ADO618pressel_n: TIntegerField
      FieldName = 'sel_n'
    end
    object ADO618presemp_ptr: TIntegerField
      FieldName = 'emp_ptr'
    end
    object ADO618presdep_ptr: TIntegerField
      FieldName = 'dep_ptr'
    end
    object ADO618pressp_money: TBCDField
      DisplayLabel = #37329#39069
      FieldName = 'sp_money'
      Precision = 19
    end
    object ADO618presrkey597: TIntegerField
      FieldName = 'rkey597'
    end
    object ADO618presemp: TStringField
      FieldKind = fkCalculated
      FieldName = 'emp'
      Size = 12
      Calculated = True
    end
    object ADO618presdept: TStringField
      FieldKind = fkCalculated
      FieldName = 'dept'
      Size = 50
      Calculated = True
    end
  end
  object Data618: TDataSource
    DataSet = ADO618pres
    Left = 436
    Top = 8
  end
  object tmp2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 432
    Top = 132
  end
  object ADOQuery4: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 360
    Top = 12
  end
  object ADOQuery5: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 360
    Top = 76
  end
  object ADOft: TADOQuery
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
      
        'SELECT     dbo.employeemsg.chinesename, dbo.data0618.sel_n, dbo.' +
        'data0618.sp_money, dbo.data0618.rkey597, dbo.Data0034.DEPT_NAME'
      'FROM         dbo.employeemsg INNER JOIN'
      
        '                      dbo.data0618 ON dbo.employeemsg.rkey = dbo' +
        '.data0618.emp_ptr INNER JOIN'
      
        '                      dbo.Data0034 ON dbo.data0618.dep_ptr = dbo' +
        '.Data0034.RKEY'
      ''
      ''
      'where dbo.data0618.rkey597=:rkey597')
    Left = 364
    Top = 156
    object ADOftchinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object ADOftsel_n: TIntegerField
      FieldName = 'sel_n'
    end
    object ADOftsp_money: TBCDField
      FieldName = 'sp_money'
      Precision = 19
    end
    object ADOftrkey597: TIntegerField
      FieldName = 'rkey597'
    end
    object ADOftDEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
  end
  object DSft: TDataSource
    DataSet = ADOft
    Left = 360
    Top = 216
  end
end
