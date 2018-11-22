object DM: TDM
  OldCreateOrder = False
  Left = 694
  Top = 412
  Height = 303
  Width = 369
  object con1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 17
  end
  object aqmain: TADOQuery
    Connection = con1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'SELECT Data0023.CODE, Data0023.ABBR_NAME,'
      ' Data0017.INV_PART_NUMBER,Data0017.INV_PART_DESCRIPTION,'
      ' Data0028.PRICE_1,Data0028.LEAD_TIME,data0028.qte_price,'
      
        ' Data0028.TAX_2,case Data0028.AVL_FLAG when '#39'Y'#39' then '#39#24050#35748#21487#39' when ' +
        #39'N'#39' then'#39#26410#35748#21487#39' when '#39'T'#39' then '#39#26242#26102#35748#21487#39' end as AVL_FLAG,'
      ' data0028.EDI_OUT_FORCST, Data0023.SUPPLIER_NAME,Data0028.TDATE,'
      ' Data0028.SUPPLIER_PART_NO,Data0028.SUGG_REORDER_QTY,'
      ' Data0028.AMT_QUAN_FLAG,Data0028.MIN_ORDER_QTY,'
      ' Data0028.MIN_ORDER_AMT,Data0028.PRICE_2,'
      ' Data0028.PRICE_3,Data0028.PRICE_4, dbo.Data0028.PRICE_5,'
      ' Data0028.PRICE_6,Data0028.QUAN_VOL_1,'
      ' Data0028.QUAN_VOL_2,Data0028.QUAN_VOL_3,'
      ' Data0028.QUAN_VOL_4,Data0028.QUAN_VOL_5,'
      ' Data0028.DISC_1,Data0028.DISC_2,Data0028.DISC_3,'
      ' Data0028.DISC_4,Data0028.DISC_5,Data0028.DISC_6,'
      ' Data0028.CONVERSION_FACTOR,Data0001.CURR_CODE,'
      ' Data0001.CURR_NAME,Data0002.UNIT_NAME AS '#37319#36141#21333#20301','
      ' Data0002_1.UNIT_NAME AS '#24211#23384#21333#20301',Data0028.RKEY,'
      ' Data0073.USER_FULL_NAME,Data0073.USER_LOGIN_NAME,'
      
        ' DATA0073_1.USER_FULL_NAME as USER_FULL_NAME_1, DATA0073_1.USER_' +
        'LOGIN_NAME as USER_LOGIN_NAME_1'
      'FROM Data0017 INNER JOIN Data0028 ON'
      '     Data0017.RKEY = Data0028.INVENTORY_PTR INNER JOIN'
      
        '     Data0023 ON Data0028.SUPPLIER_PTR = Data0023.RKEY INNER JOI' +
        'N'
      
        '     Data0001 ON Data0028.CURRENCY_PTR = Data0001.RKEY INNER JOI' +
        'N'
      
        '     Data0002 ON Data0028.PURCHASE_UNIT_PTR = Data0002.RKEY INNE' +
        'R JOIN'
      
        '     Data0002 Data0002_1 ON Data0017.STOCK_UNIT_PTR = Data0002_1' +
        '.RKEY INNER JOIN'
      
        '     Data0073 ON Data0028.CSI_USER_PTR = Data0073.RKEY  LEFT JOI' +
        'N'
      
        '     Data0073 Data0073_1 ON data0028.EDI_OUT_FORCST=Data0073_1.R' +
        'KEY'
      'where 1=1'
      '   ')
    Left = 22
    Top = 61
    object adsaq1CODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object adsaq1ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object adsaq1INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object adsaq1INV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object fltfldaq1PRICE_1: TFloatField
      FieldName = 'PRICE_1'
    end
    object ads363aq1LEAD_TIME: TSmallintField
      FieldName = 'LEAD_TIME'
    end
    object fltfldaq1qte_price: TFloatField
      FieldName = 'qte_price'
    end
    object fltfldaq1TAX_2: TFloatField
      FieldName = 'TAX_2'
    end
    object aqmainEDI_OUT_FORCST: TIntegerField
      FieldName = 'EDI_OUT_FORCST'
    end
    object adsaq1SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object aq1TDATE: TDateTimeField
      FieldName = 'TDATE'
    end
    object adsaq1SUPPLIER_PART_NO: TStringField
      FieldName = 'SUPPLIER_PART_NO'
    end
    object fltfldaq1SUGG_REORDER_QTY: TFloatField
      FieldName = 'SUGG_REORDER_QTY'
    end
    object aq1AMT_QUAN_FLAG: TWordField
      FieldName = 'AMT_QUAN_FLAG'
    end
    object fltfldaq1MIN_ORDER_QTY: TFloatField
      FieldName = 'MIN_ORDER_QTY'
    end
    object fltfldaq1MIN_ORDER_AMT: TFloatField
      FieldName = 'MIN_ORDER_AMT'
    end
    object fltfldaq1PRICE_2: TFloatField
      FieldName = 'PRICE_2'
    end
    object fltfldaq1PRICE_3: TFloatField
      FieldName = 'PRICE_3'
    end
    object fltfldaq1PRICE_4: TFloatField
      FieldName = 'PRICE_4'
    end
    object fltfldaq1PRICE_5: TFloatField
      FieldName = 'PRICE_5'
    end
    object fltfldaq1PRICE_6: TFloatField
      FieldName = 'PRICE_6'
    end
    object fltfldaq1QUAN_VOL_1: TFloatField
      FieldName = 'QUAN_VOL_1'
    end
    object fltfldaq1QUAN_VOL_2: TFloatField
      FieldName = 'QUAN_VOL_2'
    end
    object fltfldaq1QUAN_VOL_3: TFloatField
      FieldName = 'QUAN_VOL_3'
    end
    object fltfldaq1QUAN_VOL_4: TFloatField
      FieldName = 'QUAN_VOL_4'
    end
    object fltfldaq1QUAN_VOL_5: TFloatField
      FieldName = 'QUAN_VOL_5'
    end
    object fltfldaq1DISC_1: TFloatField
      FieldName = 'DISC_1'
    end
    object fltfldaq1DISC_2: TFloatField
      FieldName = 'DISC_2'
    end
    object fltfldaq1DISC_3: TFloatField
      FieldName = 'DISC_3'
    end
    object fltfldaq1DISC_4: TFloatField
      FieldName = 'DISC_4'
    end
    object fltfldaq1DISC_5: TFloatField
      FieldName = 'DISC_5'
    end
    object fltfldaq1DISC_6: TFloatField
      FieldName = 'DISC_6'
    end
    object fltfldaq1CONVERSION_FACTOR: TFloatField
      FieldName = 'CONVERSION_FACTOR'
    end
    object adsaq1CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object adsaq1CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object adsaq1DSDesigner: TStringField
      FieldName = #37319#36141#21333#20301
    end
    object adsaq1DSDesigner2: TStringField
      FieldName = #24211#23384#21333#20301
    end
    object aqmainRKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object adsaq1USER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object adsaq1USER_LOGIN_NAME: TStringField
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
    object aqmainAVL_FLAG: TStringField
      FieldName = 'AVL_FLAG'
      ReadOnly = True
      Size = 8
    end
    object aqmainUSER_FULL_NAME_1: TStringField
      FieldName = 'USER_FULL_NAME_1'
      Size = 30
    end
    object aqmainUSER_LOGIN_NAME_1: TStringField
      FieldName = 'USER_LOGIN_NAME_1'
      Size = 15
    end
  end
  object ds1: TDataSource
    DataSet = aqmain
    Left = 69
    Top = 60
  end
  object aq3: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 26
    Top = 148
  end
  object dsFile: TDataSource
    DataSet = qryFile
    Left = 200
    Top = 200
  end
  object qryFile: TADOQuery
    Connection = con1
    CursorType = ctStatic
    LockType = ltReadOnly
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
      'SELECT * FROM Data0028_FileList inner join '
      
        #9#9#9'Tier3_CustomerFiles on Data0028_FileList.FtpIDKey = Tier3_Cus' +
        'tomerFiles.IDKey'
      'WHERE Data0028_FileList.rkey28=:rkey')
    Left = 152
    Top = 200
    object qryFileFileName: TStringField
      DisplayLabel = #25991#20214#21517
      FieldName = 'FileName'
      Size = 512
    end
    object qryFileFtpIDKey: TWideStringField
      FieldName = 'FtpIDKey'
      FixedChar = True
      Size = 38
    end
    object qryFilerkey28: TIntegerField
      FieldName = 'rkey28'
    end
    object qryFileIDKey: TStringField
      FieldName = 'IDKey'
      FixedChar = True
      Size = 38
    end
    object qryFileFtp_Ptr: TIntegerField
      FieldName = 'Ftp_Ptr'
    end
    object qryFileFtpDir: TStringField
      FieldName = 'FtpDir'
      Size = 1024
    end
    object qryFileFtp_fileName: TStringField
      FieldName = 'Ftp_fileName'
      FixedChar = True
      Size = 38
    end
    object qryFileUploadTime: TDateTimeField
      FieldName = 'UploadTime'
    end
    object qryFileUploadUser_d05ptr: TIntegerField
      FieldName = 'UploadUser_d05ptr'
    end
    object qryFileGroupIDKey: TStringField
      FieldName = 'GroupIDKey'
      FixedChar = True
      Size = 38
    end
    object qryFileBEnable: TBooleanField
      FieldName = 'BEnable'
    end
  end
end
