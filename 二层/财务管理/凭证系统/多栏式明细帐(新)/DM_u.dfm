object DM: TDM
  OldCreateOrder = False
  Left = 451
  Top = 225
  Height = 393
  Width = 513
  object ADOCon: TADOConnection
    CommandTimeout = 180
    ConnectionString = 'FILE NAME=D:\vss_work\172.16.68.8.udl'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 16
  end
  object Tmp1: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandTimeout = 180
    Parameters = <>
    Left = 80
    Top = 16
  end
  object Qry508: TADOQuery
    Connection = ADOCon
    Parameters = <>
    SQL.Strings = (
      'select * from data0508')
    Left = 152
    Top = 16
  end
  object ADOQ106: TADOQuery
    Connection = ADOCon
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 160
    Top = 216
  end
  object ADOQ103: TADOQuery
    Connection = ADOCon
    Parameters = <
      item
        Name = 'vrkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select gl_description from data0103  '
      'where parent_ptr=:vrkey  '
      'order by gl_acc_number')
    Left = 232
    Top = 216
  end
  object Qry105_106: TADOQuery
    Connection = ADOCon
    Parameters = <
      item
        Name = 'vVoucher'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 12
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT dbo.Data0105.VOUCHER, dbo.Data0105.FYEAR, dbo.Data0105.PE' +
        'RIOD, '
      '      dbo.Data0105.ATTACHED, dbo.Data0105.ENTERED_DT, '
      '      dbo.Data0103.GL_ACC_NUMBER, dbo.Data0103.GL_DESCRIPTION, '
      
        '      dbo.Data0106.D_C, case when Data0106.EXCH_RATE>0 then ROUN' +
        'D(1 / dbo.Data0106.EXCH_RATE,4) else 0 end AS EXCH_RATE, '
      '      dbo.Data0001.CURR_CODE, dbo.Data0106.AMOUNT, '
      '      Isnull(dbo.Data0106.PRICE,0) AS orig_amount, '
      '      dbo.Data0005.EMPLOYEE_NAME,dbo.Data0106.DESCRIPTION'
      'FROM dbo.Data0105 INNER JOIN'
      '      dbo.Data0106 ON '
      '      dbo.Data0105.RKEY = dbo.Data0106.GL_HEADER_PTR INNER JOIN'
      '      dbo.Data0103 ON '
      '      dbo.Data0106.GL_ACCT_NO_PTR = dbo.Data0103.RKEY INNER JOIN'
      
        '      dbo.Data0001 ON dbo.Data0106.CURR_PTR = dbo.Data0001.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0005 ON dbo.Data0105.ENTERED_BY_EMPL_PTR = dbo.Dat' +
        'a0005.RKEY'
      'WHERE (Data0105.VOUCHER = :vVoucher)')
    Left = 304
    Top = 216
  end
end
