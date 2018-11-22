object DM: TDM
  OldCreateOrder = False
  Left = 662
  Top = 253
  Height = 298
  Width = 339
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=wisdompcb1077;Persist Security Info' +
      '=True;User ID=sa;Initial Catalog=demo2;Data Source=172.18.8.37'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 167
    Top = 83
  end
  object aq0028: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    ParamCheck = False
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      
        'select inv_part_number,inv_part_description,data0017.stock_unit_' +
        'ptr,isnull(data0017.CATALOG_NUM,'#39#39') as CATALOG_NUM,'
      
        '       data0023.code,data0023.supplier_name,data0028.lead_time,d' +
        'ata0805.model,data0805.inv_name as '#29615#27979#29289#26009#21517#31216' ,'
      '       data0028.supplier_part_no,data0028.sugg_reorder_qty,'
      '       data0001.curr_name,data0001.curr_code,data0028.rkey,'
      '       data0002.unit_code,data0002.unit_name,data0028.PRICE_1,'
      
        '       data0023.abbr_name,data0017.inv_name,data0028.rohs,data00' +
        '28.TAX_2 as TAX,'
      
        '       cast(data0028.TAX_2 as varchar(10))+ '#39'%'#39' as TAX_2,data002' +
        '8.orig_abbrname, '
      
        '       data0028.qte_price,data0028.qte_price2,data0028.avl_flag,' +
        'data0028.prot_report_ptr,data0028.remark,'
      
        'case data0023.status when 0 then '#39#26377#25928#39' when 1 then '#39#26080#25928#39' end as su' +
        'pper_statu,data0028.IF_CAF'
      'from   data0028 inner join '
      
        '       data0017 on data0028.inventory_ptr=data0017.rkey inner jo' +
        'in'
      
        '       data0023 on data0028.supplier_ptr=data0023.rkey  inner jo' +
        'in'
      
        '       data0001 on data0028.currency_ptr=data0001.rkey inner joi' +
        'n'
      
        '       data0002 on data0028.purchase_unit_ptr=data0002.rkey left' +
        ' join'
      
        '       data0805 on data0028.prot_report_ptr=data0805.rkey  where' +
        ' '
      '       data0028.supplier_ptr =1'
      '       order by inv_part_number')
    Left = 32
    Top = 88
    object aq0028inv_part_number: TStringField
      DisplayLabel = #26448#26009#20195#30721
      FieldName = 'inv_part_number'
      Size = 25
    end
    object aq0028inv_part_description: TStringField
      DisplayLabel = #26448#26009#21517#31216#35268#26684
      FieldName = 'inv_part_description'
      ReadOnly = True
      Size = 100
    end
    object aq0028stock_unit_ptr: TIntegerField
      FieldName = 'stock_unit_ptr'
    end
    object aq0028code: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'code'
      Size = 10
    end
    object aq0028supplier_name: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldName = 'supplier_name'
      Size = 100
    end
    object aq0028lead_time: TSmallintField
      FieldName = 'lead_time'
    end
    object aq0028supplier_part_no: TStringField
      FieldName = 'supplier_part_no'
    end
    object aq0028sugg_reorder_qty: TFloatField
      FieldName = 'sugg_reorder_qty'
    end
    object aq0028curr_name: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'curr_name'
    end
    object aq0028curr_code: TStringField
      FieldName = 'curr_code'
      Size = 5
    end
    object aq0028rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object aq0028unit_code: TStringField
      DisplayLabel = #37319#36141#21333#20301
      FieldName = 'unit_code'
      Size = 5
    end
    object aq0028unit_name: TStringField
      FieldName = 'unit_name'
    end
    object aq0028PRICE_1: TFloatField
      DisplayLabel = #21333#20215
      FieldName = 'PRICE_1'
    end
    object aq0028abbr_name: TStringField
      FieldName = 'abbr_name'
      Size = 10
    end
    object aq0028inv_name: TStringField
      FieldName = 'inv_name'
      Size = 30
    end
    object aq0028rohs: TStringField
      FieldName = 'rohs'
      Size = 10
    end
    object aq0028TAX_2: TStringField
      FieldName = 'TAX_2'
      ReadOnly = True
      Size = 11
    end
    object aq0028qte_price: TFloatField
      DisplayLabel = #24066#22330#25253#20215#20215#26684
      FieldName = 'qte_price'
    end
    object aq0028qte_price2: TIntegerField
      DisplayLabel = #20445#25345#26399#22825#25968
      FieldName = 'qte_price2'
    end
    object aq0028avl_flag: TStringField
      DisplayLabel = #20215#26684#35748#21487
      FieldName = 'avl_flag'
      FixedChar = True
      Size = 1
    end
    object aq0028supper_statu: TStringField
      DisplayLabel = #20379#24212#21830#29366#24577
      FieldName = 'supper_statu'
      ReadOnly = True
      Size = 4
    end
    object aq0028IF_CAF: TWideStringField
      FieldName = 'IF_CAF'
      FixedChar = True
      Size = 2
    end
    object aq0028TAX: TFloatField
      FieldName = 'TAX'
    end
    object aq0028prot_report_ptr: TIntegerField
      FieldName = 'prot_report_ptr'
    end
    object aq0028CATALOG_NUM: TStringField
      FieldName = 'CATALOG_NUM'
      FixedChar = True
      Size = 10
    end
    object aq0028model: TStringField
      FieldName = 'model'
    end
    object aq0028DSDesigner: TStringField
      FieldName = #29615#27979#29289#26009#21517#31216
    end
    object aq0028remark: TWideStringField
      FieldName = 'remark'
      Size = 300
    end
    object aq0028orig_abbrname: TStringField
      DisplayLabel = #21697#29260#20379#24212#21830
      FieldName = 'orig_abbrname'
      Size = 16
    end
  end
  object DataSource1: TDataSource
    DataSet = aq0028
    Left = 31
    Top = 138
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    ParamCheck = False
    Parameters = <>
    Left = 32
    Top = 31
  end
  object ADO28: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterDelete = ADO28AfterDelete
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
      'select * from data0028 where rkey=:rkey')
    Left = 95
    Top = 87
    object ADO28RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO28SUPPLIER_PTR: TIntegerField
      FieldName = 'SUPPLIER_PTR'
    end
    object ADO28INVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object ADO28EMPLOYEE_PTR: TIntegerField
      FieldName = 'EMPLOYEE_PTR'
    end
    object ADO28CSI_USER_PTR: TIntegerField
      FieldName = 'CSI_USER_PTR'
    end
    object ADO28TDATE: TDateTimeField
      FieldName = 'TDATE'
    end
    object ADO28SUPPLIER_PART_NO: TStringField
      FieldName = 'SUPPLIER_PART_NO'
      FixedChar = True
    end
    object ADO28SUGG_REORDER_QTY: TFloatField
      Alignment = taLeftJustify
      FieldName = 'SUGG_REORDER_QTY'
      DisplayFormat = '0.000'
      EditFormat = '0.000'
    end
    object ADO28LEAD_TIME: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'LEAD_TIME'
    end
    object ADO28AMT_QUAN_FLAG: TWordField
      FieldName = 'AMT_QUAN_FLAG'
    end
    object ADO28MIN_ORDER_QTY: TFloatField
      FieldName = 'MIN_ORDER_QTY'
    end
    object ADO28MIN_ORDER_AMT: TFloatField
      FieldName = 'MIN_ORDER_AMT'
    end
    object ADO28TAX_1: TFloatField
      FieldName = 'TAX_1'
    end
    object ADO28TAX_2: TFloatField
      Alignment = taLeftJustify
      FieldName = 'TAX_2'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object ADO28PRICE_1: TFloatField
      FieldName = 'PRICE_1'
    end
    object ADO28PRICE_2: TFloatField
      FieldName = 'PRICE_2'
    end
    object ADO28PRICE_3: TFloatField
      FieldName = 'PRICE_3'
    end
    object ADO28PRICE_4: TFloatField
      FieldName = 'PRICE_4'
    end
    object ADO28PRICE_5: TFloatField
      FieldName = 'PRICE_5'
    end
    object ADO28PRICE_6: TFloatField
      FieldName = 'PRICE_6'
    end
    object ADO28QUAN_VOL_1: TFloatField
      FieldName = 'QUAN_VOL_1'
    end
    object ADO28QUAN_VOL_2: TFloatField
      FieldName = 'QUAN_VOL_2'
    end
    object ADO28QUAN_VOL_3: TFloatField
      FieldName = 'QUAN_VOL_3'
    end
    object ADO28QUAN_VOL_4: TFloatField
      FieldName = 'QUAN_VOL_4'
    end
    object ADO28QUAN_VOL_5: TFloatField
      FieldName = 'QUAN_VOL_5'
    end
    object ADO28DISC_1: TFloatField
      FieldName = 'DISC_1'
    end
    object ADO28DISC_2: TFloatField
      FieldName = 'DISC_2'
    end
    object ADO28DISC_3: TFloatField
      FieldName = 'DISC_3'
    end
    object ADO28DISC_4: TFloatField
      FieldName = 'DISC_4'
    end
    object ADO28DISC_5: TFloatField
      FieldName = 'DISC_5'
    end
    object ADO28DISC_6: TFloatField
      FieldName = 'DISC_6'
    end
    object ADO28TAX_3: TFloatField
      FieldName = 'TAX_3'
    end
    object ADO28TAX_4: TFloatField
      FieldName = 'TAX_4'
    end
    object ADO28PURCHASE_UNIT_PTR: TIntegerField
      FieldName = 'PURCHASE_UNIT_PTR'
    end
    object ADO28CONVERSION_FACTOR: TFloatField
      Alignment = taLeftJustify
      FieldName = 'CONVERSION_FACTOR'
      DisplayFormat = '0.0000'
      EditFormat = '0.0000'
    end
    object ADO28AVL_FLAG: TStringField
      FieldName = 'AVL_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADO28CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object ADO28EDI_OUT_FORCST: TIntegerField
      FieldName = 'EDI_OUT_FORCST'
    end
    object ADO28qte_price: TFloatField
      DisplayLabel = #24066#22330#25253#20215#20215#26684
      FieldName = 'qte_price'
    end
    object ADO28TAX_FLAG: TStringField
      FieldName = 'TAX_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADO28qte_price2: TIntegerField
      FieldName = 'qte_price2'
    end
    object ADO28QTE_PRICE1: TFloatField
      FieldName = 'QTE_PRICE1'
    end
    object ADO28rohs: TStringField
      FieldName = 'rohs'
      Size = 10
    end
    object ADO28quote_type: TWordField
      FieldName = 'quote_type'
    end
    object ADO28IF_CAF: TWideStringField
      FieldName = 'IF_CAF'
      FixedChar = True
      Size = 2
    end
    object ADO28prot_report_ptr: TIntegerField
      FieldName = 'prot_report_ptr'
    end
    object ADO28remark: TWideStringField
      FieldName = 'remark'
      Size = 300
    end
    object ADO28ORIG_ABBRNAME: TStringField
      FieldName = 'ORIG_ABBRNAME'
      Size = 16
    end
  end
  object DataSource2: TDataSource
    DataSet = ADO28
    Left = 96
    Top = 137
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    LockType = ltPessimistic
    ParamCheck = False
    Parameters = <>
    Left = 94
    Top = 32
  end
  object ADO17: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'supp_rkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'self_rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'update data0017 '
      'set pref_supplier_ptr=:supp_rkey'
      'where rkey=:self_rkey')
    Left = 211
    Top = 32
  end
  object ADO2811: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'ep053;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@v_type'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 28
      end
      item
        Name = '@v_rkey'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 163
    Top = 32
  end
  object ADODataSet1: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    Left = 168
    Top = 136
    object ADODataSet1SUPPLIER_PTR: TIntegerField
      FieldName = 'SUPPLIER_PTR'
    end
    object ADODataSet1INVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object ADODataSet1EMPLOYEE_PTR: TIntegerField
      FieldName = 'EMPLOYEE_PTR'
    end
    object ADODataSet1CSI_USER_PTR: TIntegerField
      FieldName = 'CSI_USER_PTR'
    end
    object ADODataSet1TDATE: TDateTimeField
      FieldName = 'TDATE'
    end
    object ADODataSet1SUPPLIER_PART_NO: TStringField
      FieldName = 'SUPPLIER_PART_NO'
    end
    object ADODataSet1SUGG_REORDER_QTY: TFloatField
      FieldName = 'SUGG_REORDER_QTY'
    end
    object ADODataSet1LEAD_TIME: TSmallintField
      FieldName = 'LEAD_TIME'
    end
    object ADODataSet1AMT_QUAN_FLAG: TWordField
      FieldName = 'AMT_QUAN_FLAG'
    end
    object ADODataSet1MIN_ORDER_QTY: TFloatField
      FieldName = 'MIN_ORDER_QTY'
    end
    object ADODataSet1MIN_ORDER_AMT: TFloatField
      FieldName = 'MIN_ORDER_AMT'
    end
    object ADODataSet1TAX_1: TFloatField
      FieldName = 'TAX_1'
    end
    object ADODataSet1TAX_2: TFloatField
      FieldName = 'TAX_2'
    end
    object ADODataSet1PRICE_1: TFloatField
      FieldName = 'PRICE_1'
    end
    object ADODataSet1PRICE_2: TFloatField
      FieldName = 'PRICE_2'
    end
    object ADODataSet1PRICE_3: TFloatField
      FieldName = 'PRICE_3'
    end
    object ADODataSet1PRICE_4: TFloatField
      FieldName = 'PRICE_4'
    end
    object ADODataSet1PRICE_5: TFloatField
      FieldName = 'PRICE_5'
    end
    object ADODataSet1PRICE_6: TFloatField
      FieldName = 'PRICE_6'
    end
    object ADODataSet1QUAN_VOL_1: TFloatField
      FieldName = 'QUAN_VOL_1'
    end
    object ADODataSet1QUAN_VOL_2: TFloatField
      FieldName = 'QUAN_VOL_2'
    end
    object ADODataSet1QUAN_VOL_3: TFloatField
      FieldName = 'QUAN_VOL_3'
    end
    object ADODataSet1QUAN_VOL_4: TFloatField
      FieldName = 'QUAN_VOL_4'
    end
    object ADODataSet1QUAN_VOL_5: TFloatField
      FieldName = 'QUAN_VOL_5'
    end
    object ADODataSet1DISC_1: TFloatField
      FieldName = 'DISC_1'
    end
    object ADODataSet1DISC_2: TFloatField
      FieldName = 'DISC_2'
    end
    object ADODataSet1DISC_3: TFloatField
      FieldName = 'DISC_3'
    end
    object ADODataSet1DISC_4: TFloatField
      FieldName = 'DISC_4'
    end
    object ADODataSet1DISC_5: TFloatField
      FieldName = 'DISC_5'
    end
    object ADODataSet1DISC_6: TFloatField
      FieldName = 'DISC_6'
    end
    object ADODataSet1TAX_3: TFloatField
      FieldName = 'TAX_3'
    end
    object ADODataSet1TAX_4: TFloatField
      FieldName = 'TAX_4'
    end
    object ADODataSet1PURCHASE_UNIT_PTR: TIntegerField
      FieldName = 'PURCHASE_UNIT_PTR'
    end
    object ADODataSet1CONVERSION_FACTOR: TFloatField
      FieldName = 'CONVERSION_FACTOR'
    end
    object ADODataSet1AVL_FLAG: TStringField
      FieldName = 'AVL_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADODataSet1CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object ADODataSet1EDI_OUT_FORCST: TIntegerField
      FieldName = 'EDI_OUT_FORCST'
    end
    object ADODataSet1qte_price: TFloatField
      FieldName = 'qte_price'
    end
    object ADODataSet1tax_flag: TStringField
      FieldName = 'tax_flag'
      FixedChar = True
      Size = 1
    end
    object ADODataSet1QTE_PRICE1: TBCDField
      FieldName = 'QTE_PRICE1'
      Precision = 10
      Size = 2
    end
    object ADODataSet1rohs: TStringField
      FieldName = 'rohs'
      Size = 10
    end
    object ADODataSet1quote_type: TWordField
      FieldName = 'quote_type'
    end
    object ADODataSet1qte_price2: TIntegerField
      FieldName = 'qte_price2'
    end
  end
  object qryFtp: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
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
      'where IDkey=:IDKey')
    Left = 216
    Top = 208
    object qryFtpIDKey: TStringField
      FieldName = 'IDKey'
      FixedChar = True
      Size = 38
    end
    object qryFtpFileName: TStringField
      FieldName = 'FileName'
      Size = 512
    end
    object qryFtpFtp_Ptr: TIntegerField
      FieldName = 'Ftp_Ptr'
    end
    object qryFtpFtpDir: TStringField
      FieldName = 'FtpDir'
      Size = 1024
    end
    object qryFtpFtp_fileName: TStringField
      FieldName = 'Ftp_fileName'
      FixedChar = True
      Size = 38
    end
    object qryFtpUploadTime: TDateTimeField
      FieldName = 'UploadTime'
    end
    object qryFtpUploadUser_d05ptr: TIntegerField
      FieldName = 'UploadUser_d05ptr'
    end
    object qryFtpGroupIDKey: TStringField
      FieldName = 'GroupIDKey'
      FixedChar = True
      Size = 38
    end
    object qryFtpBEnable: TBooleanField
      FieldName = 'BEnable'
    end
  end
  object dsFile: TDataSource
    DataSet = qryFile
    Left = 112
    Top = 208
  end
  object qry28_1: TADOQuery
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
      'select rkey28,FtpIDKey from Data0028_FileList'
      'where rkey28=:rkey')
    Left = 176
    Top = 208
    object qry28_1rkey28: TIntegerField
      FieldName = 'rkey28'
    end
    object qry28_1FtpIDKey: TWideStringField
      FieldName = 'FtpIDKey'
      FixedChar = True
      Size = 38
    end
  end
  object qryFile: TADOQuery
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
      'SELECT * FROM Data0028_FileList inner join '
      
        #9#9#9'Tier3_CustomerFiles on Data0028_FileList.FtpIDKey = Tier3_Cus' +
        'tomerFiles.IDKey'
      'WHERE Data0028_FileList.rkey28=:rkey')
    Left = 64
    Top = 208
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
