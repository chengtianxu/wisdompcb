object DM: TDM
  OldCreateOrder = False
  Left = 554
  Top = 204
  Height = 368
  Width = 493
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=wisdomtopcb1077;Persist Security In' +
      'fo=True;User ID=sa;Initial Catalog=wis_test;Data Source=192.168.' +
      '1.252;Use Procedure for Prepare=1;Auto Translate=True;Packet Siz' +
      'e=4096;Workstation ID=X001;Use Encryption for Data=False;Tag wit' +
      'h column collation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 36
    Top = 16
  end
  object wzdata300: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltPessimistic
    AfterOpen = wzdata300AfterScroll
    AfterScroll = wzdata300AfterScroll
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      
        'SELECT WZDATA300.rkey, WZDATA300.epiboly_number, WZDATA300.statu' +
        's,'
      '      Data0034.DEPT_NAME, Data0034.DEPT_CODE, Data0023.CODE,'
      '      Data0023.SUPPLIER_NAME, Data0023.ABBR_NAME,'
      '      Data0015.WAREHOUSE_CODE, Data0015.WAREHOUSE_NAME,'
      
        '      dbo.Data0015.ABBR_NAME AS warehouse_abbname, WZDATA300.ent' +
        '_data,'
      
        '      dbo.Data0005.EMPL_CODE, dbo.Data0005.EMPLOYEE_NAME,WZDATA3' +
        '00.AUTH_ptr,'
      
        '      dbo.Data0001.CURR_CODE, dbo.Data0001.CURR_NAME,WZDATA300.r' +
        'efer_date,'
      
        '      dbo.Data0094.CODE AS auth_code, dbo.Data0094.PURCHASE_APPR' +
        'OV_DESC,'
      'case when WZDATA300.status=1 then '#39#26410#25552#20132#39
      '         when WZDATA300.status=2 then '#39#24453#23457#25209#39
      '         when WZDATA300.status=3 then  '#39#24050#25209#20934#39
      '         when WZDATA300.status=4 then '#39#24050#25910#36135#39
      '         when WZDATA300.status=5 then '#39#34987#36864#22238#39
      'end   v_status       '
      'FROM dbo.Data0023 INNER JOIN'
      
        '      dbo.WZDATA300 ON dbo.Data0023.RKEY = WZDATA300.supp_ptr IN' +
        'NER JOIN'
      
        '      dbo.Data0034 ON dbo.WZDATA300.dept_ptr = dbo.Data0034.RKEY' +
        ' INNER JOIN'
      '      dbo.Data0015 ON '
      '      dbo.WZDATA300.warehouse_ptr = dbo.Data0015.RKEY INNER JOIN'
      
        '      dbo.Data0005 ON dbo.WZDATA300.empl_ptr = dbo.Data0005.RKEY' +
        ' INNER JOIN'
      
        '      dbo.Data0001 ON dbo.WZDATA300.currency_ptr = dbo.Data0001.' +
        'RKEY INNER JOIN'
      '      dbo.Data0094 ON dbo.WZDATA300.auth_ptr = dbo.Data0094.RKEY'
      '')
    Left = 187
    Top = 10
    object wzdata300rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object wzdata300epiboly_number: TStringField
      DisplayLabel = #22806#21457#32534#21495
      FieldName = 'epiboly_number'
      Size = 15
    end
    object wzdata300status: TWordField
      FieldName = 'status'
    end
    object wzdata300DEPT_NAME: TStringField
      DisplayLabel = #24037#24207#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object wzdata300DEPT_CODE: TStringField
      DisplayLabel = #24037#24207#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object wzdata300CODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object wzdata300SUPPLIER_NAME: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldName = 'SUPPLIER_NAME'
      Size = 40
    end
    object wzdata300ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object wzdata300WAREHOUSE_CODE: TStringField
      DisplayLabel = #24037#21378#20195#30721
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object wzdata300WAREHOUSE_NAME: TStringField
      DisplayLabel = #24037#21378#21517#31216
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
    object wzdata300warehouse_abbname: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'warehouse_abbname'
      Size = 10
    end
    object wzdata300ent_data: TDateTimeField
      DisplayLabel = #30003#35831#26085#26399
      FieldName = 'ent_data'
    end
    object wzdata300EMPL_CODE: TStringField
      DisplayLabel = #21592#24037#20195#30721
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object wzdata300EMPLOYEE_NAME: TStringField
      DisplayLabel = #30003#35831#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object wzdata300CURR_CODE: TStringField
      DisplayLabel = #36135#24065#20195#30721
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object wzdata300CURR_NAME: TStringField
      DisplayLabel = #36135#24065#21517#31216
      FieldName = 'CURR_NAME'
    end
    object wzdata300auth_code: TStringField
      DisplayLabel = #23457#25209#20195#30721
      FieldName = 'auth_code'
      Size = 5
    end
    object wzdata300PURCHASE_APPROV_DESC: TStringField
      DisplayLabel = #23457#25209#21517#31216
      FieldName = 'PURCHASE_APPROV_DESC'
      Size = 40
    end
    object wzdata300v_status: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'v_status'
      Size = 6
    end
    object wzdata300refer_date: TDateTimeField
      FieldName = 'refer_date'
    end
    object wzdata300AUTH_ptr: TIntegerField
      FieldName = 'AUTH_ptr'
    end
  end
  object DataSource1: TDataSource
    DataSet = wzdata300
    Left = 123
    Top = 10
  end
  object adowz300: TADOQuery
    Connection = ADOConnection1
    CursorType = ctDynamic
    LockType = ltPessimistic
    AfterDelete = adowz300AfterDelete
    Parameters = <
      item
        Name = 'key'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select *  from WZDATA300'
      'where '
      ' rkey=:key')
    Left = 187
    Top = 63
    object adowz300rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object adowz300epiboly_number: TStringField
      FieldName = 'epiboly_number'
      Size = 15
    end
    object adowz300status: TWordField
      FieldName = 'status'
    end
    object adowz300supp_ptr: TIntegerField
      FieldName = 'supp_ptr'
    end
    object adowz300dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object adowz300empl_ptr: TIntegerField
      FieldName = 'empl_ptr'
    end
    object adowz300ent_data: TDateTimeField
      FieldName = 'ent_data'
    end
    object adowz300refer_date: TDateTimeField
      FieldName = 'refer_date'
    end
    object adowz300warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object adowz300auth_ptr: TIntegerField
      FieldName = 'auth_ptr'
    end
    object adowz300currency_ptr: TIntegerField
      FieldName = 'currency_ptr'
    end
    object adowz300exch_rate: TBCDField
      FieldName = 'exch_rate'
      Precision = 10
      Size = 8
    end
    object adowz300CONTACT_NAME: TStringField
      FieldName = 'CONTACT_NAME'
    end
    object adowz300CONT_PHONE: TStringField
      FieldName = 'CONT_PHONE'
    end
    object adowz300TAX_cate: TStringField
      FieldName = 'TAX_cate'
    end
    object adowz300pay_method: TStringField
      FieldName = 'pay_method'
      Size = 50
    end
    object adowz300deli_address: TStringField
      FieldName = 'deli_address'
      Size = 50
    end
    object adowz300SHIPPING_METHOD: TStringField
      FieldName = 'SHIPPING_METHOD'
      Size = 50
    end
    object adowz300remark: TStringField
      FieldName = 'remark'
      Size = 100
    end
  end
  object DataSource2: TDataSource
    DataSet = adowz300
    Left = 124
    Top = 63
  end
  object ADO301: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    BeforeDelete = ADO301BeforeDelete
    AfterScroll = ADO301AfterScroll
    OnCalcFields = ADO301CalcFields
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
      'SELECT   *  from  WZDATA301  where  EPIBOLY_PTR=:rkey')
    Left = 193
    Top = 151
    object ADO301RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO301EPIBOLY_PTR: TIntegerField
      FieldName = 'EPIBOLY_PTR'
    end
    object ADO301CUSTPART_PTR: TIntegerField
      FieldName = 'CUSTPART_PTR'
    end
    object ADO301QUANTITY: TIntegerField
      DisplayLabel = #25968#37327
      FieldName = 'QUANTITY'
    end
    object ADO301RECEVIED_QTY: TIntegerField
      FieldName = 'RECEVIED_QTY'
    end
    object ADO301RETURN_QTY: TIntegerField
      FieldName = 'RETURN_QTY'
    end
    object ADO301UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
      Size = 10
    end
    object ADO301STANDARD: TStringField
      DisplayLabel = #35268#26684
      FieldName = 'STANDARD'
      Size = 30
    end
    object ADO301AREA_SQM: TBCDField
      DisplayLabel = #24179#26041#31859
      FieldName = 'AREA_SQM'
      Precision = 6
    end
    object ADO301AREA_SQF: TBCDField
      FieldName = 'AREA_SQF'
      Precision = 6
    end
    object ADO301LAYER: TWordField
      DisplayLabel = #23618#25968
      FieldName = 'LAYER'
    end
    object ADO301THINK: TBCDField
      FieldName = 'THINK'
      Precision = 4
      Size = 2
    end
    object ADO301MIN_aperture: TBCDField
      FieldName = 'MIN_aperture'
      Precision = 5
      Size = 3
    end
    object ADO301REQ_DATE: TDateTimeField
      DisplayLabel = #21040#36135#26085#26399
      FieldName = 'REQ_DATE'
    end
    object ADO301REMARTK: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REMARTK'
      Size = 50
    end
    object ADO301reject_qty: TIntegerField
      FieldName = 'reject_qty'
    end
    object ADO301PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldKind = fkCalculated
      FieldName = 'PART_NUMBER'
      Calculated = True
    end
    object ADO301PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldKind = fkCalculated
      FieldName = 'PART_DESC'
      Calculated = True
    end
    object ADO301rec: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'rec'
      Calculated = True
    end
    object ADO301CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldKind = fkCalculated
      FieldName = 'CUST_CODE'
      Size = 10
      Calculated = True
    end
    object ADO301ABBR_NAME: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldKind = fkCalculated
      FieldName = 'ABBR_NAME'
      Size = 10
      Calculated = True
    end
    object ADO301PRICE: TBCDField
      FieldName = 'PRICE'
      Precision = 10
      Size = 3
    end
    object ADO301set_qty: TIntegerField
      FieldName = 'set_qty'
    end
    object ADO301Cu_THK: TStringField
      FieldName = 'Cu_THK'
      Size = 15
    end
    object ADO301prod_type: TStringField
      FieldName = 'prod_type'
      Size = 30
    end
    object ADO301seq_no: TSmallintField
      FieldName = 'seq_no'
    end
    object ADO301Parmeter: TStringField
      DisplayLabel = #21442#25968
      FieldKind = fkCalculated
      FieldName = 'Parmeter'
      Size = 2000
      Calculated = True
    end
  end
  object DataSource3: TDataSource
    DataSet = ADO301
    Left = 124
    Top = 150
  end
  object ADOwz302: TADOQuery
    Connection = ADOConnection1
    LockType = ltPessimistic
    Parameters = <
      item
        Name = 'rkey300'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select epiboly_ptr,user_ptr,ranking,auth_flag'
      'from wzdata302'
      'where epiboly_ptr=:rkey300')
    Left = 258
    Top = 229
    object ADOwz302epiboly_ptr: TIntegerField
      FieldName = 'epiboly_ptr'
    end
    object ADOwz302user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object ADOwz302ranking: TWordField
      FieldName = 'ranking'
    end
    object ADOwz302auth_flag: TStringField
      FieldName = 'auth_flag'
      FixedChar = True
      Size = 1
    end
  end
  object Aqwz302: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    DataSource = DataSource1
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
      
        'select data0073.user_login_name as user_id,data0073.user_full_na' +
        'me,'
      'wzdata302.auth_date,wzdata302.ranking,'
      'wzdata302.remark,'
      #39'auth_flag'#39'= case'
      ' when wzdata302.auth_date is null then '#39#26410#23457#25209#39
      ' else '#39#24050#23457#25209#39
      ' end'
      'from wzdata302 inner join data0073'
      'on wzdata302.user_ptr=data0073.rkey'
      'where wzdata302.epiboly_ptr=:rkey'
      'order by wzdata302.ranking')
    Left = 195
    Top = 232
    object Aqwz302user_id: TStringField
      DisplayLabel = #31995#32479#29992#25143#20195#30721
      FieldName = 'user_id'
      Size = 10
    end
    object Aqwz302user_full_name: TStringField
      DisplayLabel = #23457#25209#20154#21592
      FieldName = 'user_full_name'
      Size = 30
    end
    object Aqwz302auth_date: TDateTimeField
      DisplayLabel = #23457#25209#26085#26399
      FieldName = 'auth_date'
    end
    object Aqwz302ranking: TWordField
      DisplayLabel = #23457#25209#39034#24207
      FieldName = 'ranking'
    end
    object Aqwz302remark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 50
    end
    object Aqwz302auth_flag: TStringField
      DisplayLabel = #23457#25209#29366#24577
      FieldName = 'auth_flag'
      ReadOnly = True
      Size = 6
    end
  end
  object DataSource4: TDataSource
    DataSet = Aqwz302
    Left = 123
    Top = 232
  end
  object Tmp: TADOQuery
    Connection = ADOConnection1
    LockType = ltPessimistic
    ParamCheck = False
    Parameters = <>
    Left = 31
    Top = 153
  end
  object DataSource5: TDataSource
    DataSet = ADO305
    Left = 292
    Top = 150
  end
  object ADO305: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    BeforeDelete = ADO305BeforeDelete
    OnCalcFields = ADO305CalcFields
    Parameters = <
      item
        Name = 'epiboly_ptr'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT WZDATA305.rkey, WZDATA305.rkey301, WZDATA305.wo_ptr, WZDA' +
        'TA305.Quantity, WZDATA305.EPIBOLY_PTR,  WZDATA305.seq_no '
      'FROM   WZDATA305 '
      'where'
      ''
      'WZDATA305.EPIBOLY_PTR=:epiboly_ptr')
    Left = 361
    Top = 151
    object ADO305rkey301: TIntegerField
      FieldName = 'rkey301'
    end
    object ADO305wo_ptr: TIntegerField
      FieldName = 'wo_ptr'
    end
    object ADO305Quantity: TIntegerField
      DisplayLabel = #25968#37327
      FieldName = 'Quantity'
    end
    object ADO305WORK_ORDER_NUMBER: TStringField
      DisplayLabel = #24037#21333#21495
      FieldKind = fkCalculated
      FieldName = 'WORK_ORDER_NUMBER'
      Calculated = True
    end
    object ADO305EPIBOLY_PTR: TIntegerField
      FieldName = 'EPIBOLY_PTR'
    end
    object ADO305seq_no: TSmallintField
      FieldName = 'seq_no'
    end
    object ADO305rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 32
    Top = 72
  end
  object tmp2: TADOQuery
    Connection = ADOConnection1
    LockType = ltPessimistic
    ParamCheck = False
    Parameters = <>
    Left = 31
    Top = 209
  end
  object ADO493: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select Company_Name as '#20844#21496#21517#31216','
      'Company_Name2 as '#20844#21496#31616#31216','
      'Company_Name3 as '#33521#25991#21517#31216','
      'ship_address as  '#36865#36135#22320#22336','
      'Company_Icon as '#22270#26631
      'from data0493')
    Left = 352
    Top = 16
    object ADO493DSDesigner: TStringField
      FieldName = #20844#21496#21517#31216
      Size = 50
    end
    object ADO493DSDesigner2: TStringField
      FieldName = #20844#21496#31616#31216
      Size = 50
    end
    object ADO493DSDesigner5: TStringField
      FieldName = #33521#25991#21517#31216
      Size = 50
    end
    object ADO493DSDesigner3: TStringField
      FieldName = #36865#36135#22320#22336
      Size = 50
    end
    object ADO493DSDesigner4: TBlobField
      FieldName = #22270#26631
    end
  end
  object DataSource6: TDataSource
    DataSet = ADO493
    Left = 280
    Top = 16
  end
  object qry1Tmp: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'Param1'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end
      item
        Name = 'Param2'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT     dbo.Data0025.MANU_PART_NUMBER,'
      
        ' dbo.Data0038.SOURCE_PTR, dbo.Data0038.DEPT_PTR, dbo.Data0034.RK' +
        'EY'
      'FROM         dbo.Data0025 INNER JOIN'
      
        '                      dbo.Data0038 ON dbo.Data0025.RKEY = dbo.Da' +
        'ta0038.SOURCE_PTR INNER JOIN'
      
        '                      dbo.Data0034 ON dbo.Data0038.DEPT_PTR = db' +
        'o.Data0034.RKEY'
      
        'where Data0025.MANU_PART_NUMBER = :Param1 and Data0034.RKey = :P' +
        'aram2')
    Left = 352
    Top = 232
  end
  object tmp3: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 32
    Top = 272
  end
  object qry1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 280
    Top = 104
  end
end
