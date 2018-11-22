object DM: TDM
  OldCreateOrder = False
  Left = 678
  Top = 142
  Height = 502
  Width = 504
  object ADOConnection1: TADOConnection
    ConnectionTimeout = 25
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 16
  end
  object ado04: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select SEED_VALUE,SEED_FLAG from data0004'
      'where rkey=56')
    Left = 189
    Top = 21
    object ado04SEED_VALUE: TStringField
      FieldName = 'SEED_VALUE'
    end
    object ado04SEED_FLAG: TWordField
      FieldName = 'SEED_FLAG'
    end
  end
  object ado457: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT rkey,GON_NUMBER, warehouse_ptr, dept_ptr, TTYPE, CREATE_D' +
        'ATE, CREATE_BY, '
      '      RECD_BY, REF_NUMBER,Cut_NO,cut_no492'
      'FROM dbo.Data0457'
      'where rkey is null')
    Left = 40
    Top = 80
    object ado457rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ado457GON_NUMBER: TStringField
      FieldName = 'GON_NUMBER'
      Size = 10
    end
    object ado457warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object ado457dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object ado457TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object ado457CREATE_DATE: TDateTimeField
      FieldName = 'CREATE_DATE'
    end
    object ado457CREATE_BY: TIntegerField
      FieldName = 'CREATE_BY'
    end
    object ado457RECD_BY: TIntegerField
      FieldName = 'RECD_BY'
    end
    object ado457REF_NUMBER: TStringField
      FieldName = 'REF_NUMBER'
      Size = 15
    end
    object ado457Cut_NO: TStringField
      FieldName = 'Cut_NO'
      FixedChar = True
      Size = 40
    end
    object ado457cut_no492: TStringField
      FieldName = 'cut_no492'
      FixedChar = True
      Size = 12
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 128
    Top = 24
  end
  object ado207: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT INVENTORY_PTR, GON_PTR, D0022_PTR, QUANTITY, DEPT_PTR, TD' +
        'ATE, '
      '      TTYPE,STANDARD_COST,d0468_ptr'
      'FROM Data0207'
      'where rkey is null')
    Left = 88
    Top = 80
    object ado207INVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object ado207GON_PTR: TIntegerField
      FieldName = 'GON_PTR'
    end
    object ado207D0022_PTR: TIntegerField
      FieldName = 'D0022_PTR'
    end
    object ado207QUANTITY: TBCDField
      FieldName = 'QUANTITY'
      Precision = 10
      Size = 3
    end
    object ado207DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ado207TDATE: TDateTimeField
      FieldName = 'TDATE'
    end
    object ado207TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object ado207STANDARD_COST: TBCDField
      FieldName = 'STANDARD_COST'
      Precision = 10
      Size = 3
    end
    object ado207d0468_ptr: TIntegerField
      FieldName = 'd0468_ptr'
    end
  end
  object ado208: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select SOURCE_PTR,DEPT_PTR,GON_PTR,TDATE,QUANTITY,TRANSACTION_PT' +
        'R'
      'from data0208'
      'where rkey is null')
    Left = 88
    Top = 128
    object ado208SOURCE_PTR: TIntegerField
      FieldName = 'SOURCE_PTR'
    end
    object ado208DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ado208GON_PTR: TIntegerField
      FieldName = 'GON_PTR'
    end
    object ado208TDATE: TDateTimeField
      FieldName = 'TDATE'
    end
    object ado208QUANTITY: TBCDField
      FieldName = 'QUANTITY'
      Precision = 10
      Size = 3
    end
    object ado208TRANSACTION_PTR: TIntegerField
      FieldName = 'TRANSACTION_PTR'
    end
  end
  object ado95: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select TRAN_TP,INVT_PTR,SRCE_PTR,TRAN_BY,TRAN_DATE,'
      'QUANTITY from data0095'
      'where rkey is null')
    Left = 88
    Top = 184
    object ado95TRAN_TP: TSmallintField
      FieldName = 'TRAN_TP'
    end
    object ado95INVT_PTR: TIntegerField
      FieldName = 'INVT_PTR'
    end
    object ado95SRCE_PTR: TIntegerField
      FieldName = 'SRCE_PTR'
    end
    object ado95TRAN_BY: TIntegerField
      FieldName = 'TRAN_BY'
    end
    object ado95TRAN_DATE: TDateTimeField
      FieldName = 'TRAN_DATE'
    end
    object ado95QUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
  end
  object ads468: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    OnCalcFields = ads468CalcFields
    CommandText = 
      'SELECT TOP 100 PERCENT Data0468.CUT_NO, Data0468.INVENT_PTR, Dat' +
      'a0468.RKEY, '#13#10'      Data0468.STATUS,  Data0017.STOCK_UNIT_PTR, D' +
      'ata0017.INV_PART_NUMBER, '#13#10'     Data0017.INV_NAME, Data0017.INV_' +
      'DESCRIPTION, Data0468.QUAN_BOM, '#13#10'     Data0468.QUAN_ISSUED, Dat' +
      'a0002.UNIT_NAME, data0002.UNIT_CODE,'#13#10'data0017.quan_on_hand-data' +
      '0017.QUAN_ASSIGN as quan_on_hand'#13#10'FROM data0492 INNER JOIN'#13#10'    ' +
      '  Data0468 ON data0492.CUT_NO = Data0468.CUT_NO INNER JOIN'#13#10'    ' +
      '  Data0002 INNER JOIN'#13#10'      Data0017 ON Data0002.RKEY = Data001' +
      '7.STOCK_UNIT_PTR ON '#13#10'      Data0468.INVENT_PTR = Data0017.RKEY'#13 +
      #10'WHERE (Data0468.DEPT_PTR = :rkey34) AND '#13#10'               (data0' +
      '492.WHOUSE_PTR = :wh_ptr) And'#13#10'              (Data0468.STATUS = ' +
      '0) AND '#13#10'              (data0492.Con_Flag = 2) and'#13#10'            ' +
      '  (data0468.invent_or=0)'#13#10'order by Data0468.CUT_NO'
    Parameters = <
      item
        Name = 'rkey34'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 56
      end
      item
        Name = 'wh_ptr'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 1
      end>
    Left = 248
    Top = 88
    object ads468cut_no: TStringField
      DisplayLabel = #37197#26009#21333#21495
      FieldName = 'cut_no'
      FixedChar = True
      Size = 12
    end
    object ads468invent_ptr: TIntegerField
      FieldName = 'invent_ptr'
    end
    object ads468STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object ads468type: TStringField
      DisplayLabel = #29366#24577
      FieldKind = fkCalculated
      FieldName = 'type'
      Size = 4
      Calculated = True
    end
    object ads468INV_PART_NUMBER: TStringField
      DisplayLabel = #29289#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ads468INV_NAME: TStringField
      DisplayLabel = #29289#26009#21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ads468INV_DESCRIPTION: TStringField
      DisplayLabel = #29289#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ads468QUAN_BOM: TFloatField
      DisplayLabel = #37197#39069#25968#37327
      DisplayWidth = 5
      FieldName = 'QUAN_BOM'
    end
    object ads468QUAN_ISSUED: TFloatField
      DisplayLabel = #21457#25918#25968#37327
      DisplayWidth = 5
      FieldName = 'QUAN_ISSUED'
    end
    object ads468RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ads468STOCK_UNIT_PTR: TIntegerField
      FieldName = 'STOCK_UNIT_PTR'
    end
    object ads468UNIT_CODE: TStringField
      FieldName = 'UNIT_CODE'
      Size = 5
    end
    object ads468UNIT_NAME: TStringField
      DisplayLabel = #37197#39069#21333#20301
      FieldName = 'UNIT_NAME'
    end
    object ads468quan_on_hand: TFloatField
      DisplayLabel = #24403#21069#24211#23384
      FieldName = 'quan_on_hand'
    end
  end
  object DataSource1: TDataSource
    DataSet = ads468
    Left = 184
    Top = 88
  end
  object DataSource2: TDataSource
    DataSet = aq22
    Left = 184
    Top = 140
  end
  object aq22: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    OnCalcFields = aq22CalcFields
    CommandText = 
      'SELECT     dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, ' +
      'dbo.Data0017.INV_DESCRIPTION, dbo.Data0016.LOCATION, dbo.Data002' +
      '2.QUAN_TO_BE_STOCKED, dbo.Data0002.UNIT_NAME, '#13#10'                ' +
      '      dbo.Data0022.QUAN_ON_HAND, dbo.Data0456.warehouse_ptr, dbo' +
      '.Data0022.EXPIRE_DATE, dbo.Data0022.rohs, dbo.Data0023.ABBR_NAME' +
      ', dbo.Data0022.SUPPLIER2, dbo.Data0017.STD_COST, '#13#10'             ' +
      '         dbo.Data0002.UNIT_CODE, dbo.Data0022.INVENTORY_PTR, dbo' +
      '.Data0022.RKEY, dbo.Data0022.BARCODE_ID, Data0071.reason'#13#10'      ' +
      '                , (case when (d391.status=2) or (d391.status is ' +
      'null )  then '#39#26159#39'  else '#39#21542#39'  end )  as  '#39#26159#21542#21487#21457#26009#39#13#10'FROM         dbo' +
      '.Data0022 INNER JOIN'#13#10'                      dbo.Data0016 ON dbo.' +
      'Data0022.LOCATION_PTR = dbo.Data0016.RKEY INNER JOIN'#13#10'          ' +
      '            dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR = dbo.Dat' +
      'a0017.RKEY INNER JOIN'#13#10'                      dbo.Data0002 ON dbo' +
      '.Data0022.LOCATION_PTR_FROM = dbo.Data0002.RKEY INNER JOIN'#13#10'    ' +
      '                  dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Dat' +
      'a0456.RKEY INNER JOIN'#13#10'                      dbo.Data0023 ON dbo' +
      '.Data0456.SUPP_PTR = dbo.Data0023.RKEY LEFT OUTER JOIN'#13#10'        ' +
      '              dbo.Data0071 ON dbo.Data0022.SOURCE_PTR = dbo.Data' +
      '0071.RKEY'#13#10'                       left join data0391 d391 on dat' +
      'a0022.rkey391=d391.rkey '#13#10'WHERE     (dbo.Data0022.QUAN_ON_HAND >' +
      ' 0)'#13#10#13#10#13#10#13#10
    IndexFieldNames = 'EXPIRE_DATE'
    Parameters = <>
    Left = 248
    Top = 141
    object aq22INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      DisplayWidth = 18
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object aq22INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      DisplayWidth = 15
      FieldName = 'INV_NAME'
      Size = 30
    end
    object aq22INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      DisplayWidth = 21
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object aq22LOCATION: TStringField
      DisplayLabel = #23384#20179#20301#32622
      DisplayWidth = 10
      FieldName = 'LOCATION'
      Size = 10
    end
    object aq22UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      DisplayWidth = 10
      FieldName = 'UNIT_NAME'
    end
    object aq22QUAN_ON_HAND: TBCDField
      DisplayLabel = #24211#23384#25968#37327
      DisplayWidth = 12
      FieldName = 'QUAN_ON_HAND'
      Precision = 19
    end
    object aq22EXPIRE_DATE: TDateTimeField
      DisplayLabel = #26377#25928#26399
      DisplayWidth = 12
      FieldName = 'EXPIRE_DATE'
    end
    object aq22rohs: TStringField
      DisplayLabel = #29615#20445#26631#35782
      DisplayWidth = 10
      FieldName = 'rohs'
      Size = 10
    end
    object aq22ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      DisplayWidth = 10
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object aq22SUPPLIER2: TStringField
      DisplayLabel = #21407#21046#36896#21830
      DisplayWidth = 10
      FieldName = 'SUPPLIER2'
      Size = 10
    end
    object aq22STD_COST: TFloatField
      DisplayLabel = #26631#20934#25104#26412
      DisplayWidth = 10
      FieldName = 'STD_COST'
    end
    object aq22INVENTORY_PTR: TIntegerField
      DisplayWidth = 13
      FieldName = 'INVENTORY_PTR'
    end
    object aq22RKEY: TAutoIncField
      DisplayWidth = 10
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aq22barcode_id: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'barcode_id'
      Size = 12
    end
    object aq22unit_code: TStringField
      FieldName = 'unit_code'
      Size = 5
    end
    object aq22warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object aq22QUAN_TO_BE_STOCKED: TBCDField
      DisplayLabel = #24050#20998#37197#25968#37327
      FieldName = 'QUAN_TO_BE_STOCKED'
      Precision = 18
      Size = 6
    end
    object aq22quan_hand: TFloatField
      DisplayLabel = #26377#25928#24211#23384
      FieldKind = fkCalculated
      FieldName = 'quan_hand'
      Calculated = True
    end
    object aq22reason: TStringField
      DisplayLabel = #35831#36141#21407#22240
      FieldName = 'reason'
    end
    object aq22DSDesigner: TStringField
      FieldName = #26159#21542#21487#21457#26009
      ReadOnly = True
      Size = 2
    end
  end
  object ads468_268: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    OnCalcFields = ads468_268CalcFields
    CommandText = 
      'SELECT     TOP (100) PERCENT dbo.DATA0268.number, dbo.Data0468.I' +
      'NVENT_PTR, '#13#10'dbo.Data0468.RKEY, dbo.Data0468.STATUS, dbo.Data001' +
      '7.STOCK_UNIT_PTR, '#13#10'                      dbo.Data0017.INV_PART_' +
      'NUMBER, dbo.Data0017.INV_NAME,'#13#10' dbo.Data0017.INV_DESCRIPTION, d' +
      'bo.Data0468.QUAN_BOM, Data0468.QUAN_ISSUED, '#13#10'                  ' +
      '    dbo.Data0002.UNIT_NAME, dbo.Data0002.UNIT_CODE, data0468.wzc' +
      'p0492_ptr, data0468.bom_list_ptr,'#13#10' dbo.Data0017.QUAN_ON_HAND - ' +
      'dbo.Data0017.QUAN_ASSIGN AS quan_on_hand,  '#13#10'                   ' +
      '   dbo.Data0468.QUAN_ISSUED AS old_QUAN_ISSUED, DATA0268.CUT_NO,' +
      #13#10'CASE data0468.PRINTIT WHEN '#39'N'#39' THEN '#39'VMI'#24211#23384#39' ELSE '#39#26222#36890#24211#23384#39' END AS' +
      ' sotck_type,'#13#10' isnull(derivedtbl_1.QUAN_ASSIGN,0) as quan_alloc,' +
      'derivedtbl_1.D492_ptr'#13#10'FROM         dbo.DATA0268 INNER JOIN'#13#10'   ' +
      '                   dbo.Data0468 ON dbo.DATA0268.rkey = dbo.Data0' +
      '468.FLOW_NO INNER JOIN'#13#10'                      dbo.Data0002 INNER' +
      ' JOIN'#13#10'                      dbo.Data0017 ON dbo.Data0002.RKEY =' +
      ' dbo.Data0017.STOCK_UNIT_PTR '#13#10'                      ON dbo.Data' +
      '0468.INVENT_PTR = dbo.Data0017.RKEY LEFT OUTER JOIN'#13#10'           ' +
      '               (SELECT   wzcp0492.QUAN_ASSIGN, data0492.CUT_NO, ' +
      'wzcp0492.D492_ptr,wzcp0492.rkey'#13#10'                            FRO' +
      'M          dbo.wzcp0492 INNER JOIN'#13#10'                            ' +
      '                  dbo.data0492 ON dbo.wzcp0492.D492_ptr = dbo.da' +
      'ta0492.rkey) AS derivedtbl_1 '#13#10'ON dbo.DATA0268.CUT_NO = derivedt' +
      'bl_1.CUT_NO AND dbo.Data0468.wzcp0492_ptr = derivedtbl_1.rkey'#13#10'W' +
      'HERE (Data0468.flow_no =:rkey268) AND'#13#10'              (Data0468.S' +
      'TATUS = 0) AND'#13#10'              (data0268.status = 2) and'#13#10'       ' +
      '       (data0468.invent_or=0)'#13#10'order by Data0268.number'
    Parameters = <
      item
        Name = 'rkey268'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 272
    Top = 232
    object ads468_268number: TStringField
      DisplayLabel = #39046#26009#21333#21495
      FieldName = 'number'
      Size = 50
    end
    object ads468_268INVENT_PTR: TIntegerField
      FieldName = 'INVENT_PTR'
    end
    object ads468_268RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ads468_268STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object ads468_268STOCK_UNIT_PTR: TIntegerField
      FieldName = 'STOCK_UNIT_PTR'
    end
    object ads468_268INV_PART_NUMBER: TStringField
      DisplayLabel = #29289#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ads468_268INV_NAME: TStringField
      DisplayLabel = #29289#26009#21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ads468_268INV_DESCRIPTION: TStringField
      DisplayLabel = #29289#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ads468_268QUAN_BOM: TFloatField
      DisplayLabel = #30003#39046#25968#37327
      FieldName = 'QUAN_BOM'
    end
    object ads468_268QUAN_ISSUED: TBCDField
      FieldName = 'QUAN_ISSUED'
      Precision = 12
    end
    object ads468_268UNIT_NAME: TStringField
      DisplayLabel = #24211#23384#21333#20301
      FieldName = 'UNIT_NAME'
    end
    object ads468_268quan_on_hand: TBCDField
      DisplayLabel = #26377#25928#24211#23384
      FieldName = 'quan_on_hand'
      Precision = 19
    end
    object ads468_268UNIT_CODE: TStringField
      DisplayLabel = #21333#20301#20195#30721
      FieldName = 'UNIT_CODE'
      Size = 5
    end
    object ads468_268type: TStringField
      DisplayLabel = #29366#24577
      FieldKind = fkCalculated
      FieldName = 'type'
      Size = 4
      Calculated = True
    end
    object ads468_268quan_alloc: TBCDField
      DisplayLabel = #24635#20998#37197#25968#37327
      FieldName = 'quan_alloc'
      Precision = 9
      Size = 2
    end
    object ads468_268sotck_type: TStringField
      DisplayLabel = #24211#23384#31867#22411
      FieldName = 'sotck_type'
      ReadOnly = True
      Size = 8
    end
    object ads468_268D492_ptr: TIntegerField
      FieldName = 'D492_ptr'
    end
    object ads468_268old_QUAN_ISSUED: TFloatField
      FieldName = 'old_QUAN_ISSUED'
    end
    object ads468_268CUT_NO: TStringField
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object ads468_268bom_list_ptr: TIntegerField
      FieldName = 'bom_list_ptr'
    end
    object ads468_268wzcp0492_ptr: TIntegerField
      FieldName = 'wzcp0492_ptr'
    end
  end
  object DataSource3: TDataSource
    DataSet = ads468_268
    Left = 184
    Top = 224
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 304
    Top = 24
  end
end
