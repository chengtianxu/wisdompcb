object FrmMain: TFrmMain
  Left = 319
  Top = 243
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #23458#25143#23545#24080#21333#26597#35810
  ClientHeight = 296
  ClientWidth = 560
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn3: TBitBtn
    Left = 192
    Top = 248
    Width = 75
    Height = 25
    Caption = #26597#25214
    Default = True
    TabOrder = 0
    OnClick = BitBtn3Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BitBtn4: TBitBtn
    Left = 296
    Top = 248
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 1
    Kind = bkClose
  end
  object GroupBox2: TGroupBox
    Left = 15
    Top = 25
    Width = 529
    Height = 80
    Caption = #23458#25143#33539#22260
    TabOrder = 2
    object Label8: TLabel
      Left = 51
      Top = 23
      Width = 51
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'From:'
    end
    object Label10: TLabel
      Left = 212
      Top = 24
      Width = 250
      Height = 13
      AutoSize = False
    end
    object Label1: TLabel
      Left = 50
      Top = 51
      Width = 51
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'To:'
    end
    object Label4: TLabel
      Left = 211
      Top = 52
      Width = 250
      Height = 13
      AutoSize = False
    end
    object Edit6: TEdit
      Left = 106
      Top = 19
      Width = 73
      Height = 21
      TabOrder = 0
      OnExit = Edit6Exit
    end
    object BitBtn6: TBitBtn
      Left = 182
      Top = 19
      Width = 23
      Height = 21
      TabOrder = 1
      TabStop = False
      OnMouseDown = BitBtn6MouseDown
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADA000000000000ADAD0FFFFFFFFFF0DADA0F00F00000F0ADAD0FFFFFFFFFF0
        DADA0F00F00000F0ADAD0FFFFFFFFFF0DADA0FFFFFFF0FF0ADAD0FF0FFF080F0
        DAD40F080F0808000D440FF08080808880440000080808888844DADAD0808888
        8844ADADAD0888888044DADADAD000000A44ADADADADADADADAD}
    end
    object Edit1: TEdit
      Left = 106
      Top = 47
      Width = 73
      Height = 21
      TabOrder = 2
      OnExit = Edit1Exit
    end
    object BitBtn1: TBitBtn
      Left = 181
      Top = 47
      Width = 23
      Height = 21
      TabOrder = 3
      TabStop = False
      OnMouseDown = BitBtn1MouseDown
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADA000000000000ADAD0FFFFFFFFFF0DADA0F00F00000F0ADAD0FFFFFFFFFF0
        DADA0F00F00000F0ADAD0FFFFFFFFFF0DADA0FFFFFFF0FF0ADAD0FF0FFF080F0
        DAD40F080F0808000D440FF08080808880440000080808888844DADAD0808888
        8844ADADAD0888888044DADADAD000000A44ADADADADADADADAD}
    end
  end
  object CheckBox1: TCheckBox
    Left = 17
    Top = 217
    Width = 230
    Height = 17
    Caption = #25130#27490#26399#20043#21518#30340#24080#39033#19981#21453#26144#22312#23545#24080#21333#20869
    Checked = True
    State = cbChecked
    TabOrder = 3
  end
  object DateTimePicker1: TDateTimePicker
    Left = 78
    Top = 247
    Width = 105
    Height = 21
    Date = 38329.000000000000000000
    Time = 38329.000000000000000000
    TabOrder = 4
    Visible = False
  end
  object DateTimePicker2: TDateTimePicker
    Left = 72
    Top = 262
    Width = 107
    Height = 21
    Date = 38329.000000000000000000
    Time = 38329.000000000000000000
    TabOrder = 5
    Visible = False
  end
  object DateTimePicker3: TDateTimePicker
    Left = 17
    Top = 237
    Width = 105
    Height = 21
    Date = 38329.000000000000000000
    Time = 38329.000000000000000000
    TabOrder = 6
    Visible = False
  end
  object DateTimePicker5: TDateTimePicker
    Left = 16
    Top = 260
    Width = 105
    Height = 21
    Date = 38329.000000000000000000
    Time = 38329.000000000000000000
    TabOrder = 7
    Visible = False
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 113
    Width = 313
    Height = 96
    Caption = #25130#27490#26399#38388
    TabOrder = 8
    object Label11: TLabel
      Left = 113
      Top = 35
      Width = 42
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'From:'
    end
    object Label12: TLabel
      Left = 131
      Top = 68
      Width = 22
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'To:'
    end
    object DateTimePicker6: TDateTimePicker
      Left = 161
      Top = 33
      Width = 104
      Height = 21
      Date = 38329.370913981500000000
      Time = 38329.370913981500000000
      TabOrder = 0
      OnExit = DateTimePicker6Exit
    end
    object DateTimePicker7: TDateTimePicker
      Left = 160
      Top = 65
      Width = 106
      Height = 21
      Date = 38329.370913981500000000
      Time = 38329.370913981500000000
      TabOrder = 1
      OnExit = DateTimePicker7Exit
    end
    object ComboBox1: TComboBox
      Left = 16
      Top = 32
      Width = 86
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 2
      Text = #21457#31080#26085#26399
      Items.Strings = (
        #21457#31080#26085#26399
        #24080#40836#26085#26399)
    end
  end
  object RadioGroup2: TRadioGroup
    Left = 344
    Top = 114
    Width = 200
    Height = 60
    Caption = #25490#24207#26041#24335
    ItemIndex = 0
    Items.Strings = (
      #25353#23458#25143#35746#21333#21495
      #25353#20986#36135#26085#26399)
    TabOrder = 9
  end
  object CheckBox2: TCheckBox
    Left = 297
    Top = 217
    Width = 157
    Height = 17
    Caption = #23545#24080#21333#20869#26174#31034#24403#21069#20313#39069
    TabOrder = 10
  end
  object DateTimePicker4: TDateTimePicker
    Left = 16
    Top = 248
    Width = 105
    Height = 21
    Date = 38329.000000000000000000
    Time = 38329.000000000000000000
    TabOrder = 11
    Visible = False
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 511
    Top = 15
  end
  object DataSource1: TDataSource
    Left = 471
    Top = 39
  end
  object ADOData0010: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    ParamCheck = False
    Parameters = <>
    SQL.Strings = (
      'SELECT  RKEY,CUST_CODE,CUSTOMER_NAME'
      'FROM  Data0010'
      'ORDER BY CUST_CODE')
    Left = 271
    Top = 32
  end
  object ADOData0493: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    OnCalcFields = ADOData0493CalcFields
    CommandText = 'select * from data0493'#13#10
    Parameters = <>
    Left = 344
    Top = 16
    object ADOData0493Company_Name: TStringField
      FieldName = 'Company_Name'
      Size = 50
    end
    object ADOData0493Company_Name2: TStringField
      FieldName = 'Company_Name2'
      Size = 50
    end
    object ADOData0493Company_Name3: TStringField
      FieldName = 'Company_Name3'
      Size = 50
    end
    object ADOData0493ship_address: TStringField
      FieldName = 'ship_address'
      Size = 50
    end
    object ADOData0493Company_Icon: TBlobField
      FieldName = 'Company_Icon'
    end
    object ADOData0493SITE_INFO_ADD_1: TStringField
      FieldName = 'SITE_INFO_ADD_1'
      FixedChar = True
      Size = 50
    end
    object ADOData0493SITE_INFO_ADD_2: TStringField
      FieldName = 'SITE_INFO_ADD_2'
      FixedChar = True
      Size = 50
    end
    object ADOData0493SITE_INFO_ADD_3: TStringField
      FieldName = 'SITE_INFO_ADD_3'
      FixedChar = True
      Size = 50
    end
    object ADOData0493SITE_INFO_PHONE: TStringField
      FieldName = 'SITE_INFO_PHONE'
      FixedChar = True
      Size = 30
    end
    object ADOData0493printed_by_name: TStringField
      FieldKind = fkCalculated
      FieldName = 'printed_by_name'
      Calculated = True
    end
  end
  object ADO0116: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'Select cust_ptr, sum(AVL_AMT*ex_rate) as amount'#13#10'from data0116'#13#10 +
      'where avl_amt>0'#13#10'and cust_ptr=:customer_ptr'#13#10'group by cust_ptr'#13#10 +
      'order by cust_ptr'#13#10
    DataSource = DataSource1
    MasterFields = 'customer_ptr'
    Parameters = <
      item
        Name = 'customer_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 344
    Top = 48
  end
  object DataSource2: TDataSource
    Left = 472
    Top = 71
  end
  object DataSource3: TDataSource
    DataSet = Ado0112
    Left = 408
    Top = 72
  end
  object ADOItems0: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
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
      'Select data0062.amount,data0061.category'
      'from data0061,data0062'
      'where data0062.addl_cat_ptr=data0061.rkey'
      'and data0062.so_ptr=:rkey')
    Left = 271
    Top = 104
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'vptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select employee_name from data0005 where rkey=:vptr')
    Left = 272
    Top = 72
  end
  object ADODetails: TADOStoredProc
    Connection = ADOConnection1
    LockType = ltReadOnly
    ProcedureName = 'EP134;4'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@vptr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@vptr2'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@vindex'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 416
    Top = 240
    object ADODetailsinvoice_total: TBCDField
      FieldName = 'invoice_total'
      Precision = 19
    end
    object ADODetailsamount_credited: TBCDField
      FieldName = 'amount_credited'
      Precision = 19
    end
    object ADODetailsamt_paid: TBCDField
      FieldName = 'amt_paid'
      ReadOnly = True
      Precision = 19
    end
    object ADODetailsinvoice_date: TDateTimeField
      FieldName = 'invoice_date'
    end
  end
  object ADOCusts: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    ProcedureName = 'EP134;5'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@vptr1'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = 'x'
      end
      item
        Name = '@vptr2'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = 'x'
      end
      item
        Name = '@vptr1_1'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = 'x'
      end
      item
        Name = '@vptr2_1'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = 'x'
      end
      item
        Name = '@vdate1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 38353d
      end
      item
        Name = '@vdate2'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 38353d
      end
      item
        Name = '@vdate1_1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 38353d
      end
      item
        Name = '@vdate2_1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 38353d
      end>
    Left = 448
    Top = 240
    object ADOCustscustomer_ptr: TIntegerField
      FieldName = 'customer_ptr'
    end
    object ADOCustscurrency_ptr: TIntegerField
      FieldName = 'currency_ptr'
    end
    object ADOCustsopen_amt: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'open_amt'
      Calculated = True
    end
    object ADOCustsamt_current: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'amt_current'
      Calculated = True
    end
    object ADOCustsamt_paid: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'amt_paid'
      Calculated = True
    end
    object ADOCustsamt_credited: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'amt_credited'
      Calculated = True
    end
    object ADOCustsclose_amt: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'close_amt'
      Calculated = True
    end
    object ADOCustsamt1: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'amt1'
      Calculated = True
    end
    object ADOCustsamt2: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'amt2'
      Calculated = True
    end
    object ADOCustsamt3: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'amt3'
      Calculated = True
    end
    object ADOCustsamt4: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'amt4'
      Calculated = True
    end
    object ADOCustsamt5: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'amt5'
      Calculated = True
    end
    object ADOCustsamt6: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'amt6'
      Calculated = True
    end
  end
  object Adopaid: TADOStoredProc
    Connection = ADOConnection1
    LockType = ltReadOnly
    ProcedureName = 'EP134;6'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@vptr1'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@vptr2'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@vdate1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 38353d
      end
      item
        Name = '@vdate2'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 38353d
      end>
    Left = 480
    Top = 240
  end
  object ADOCredited: TADOStoredProc
    Connection = ADOConnection1
    LockType = ltReadOnly
    ProcedureName = 'EP134;7'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@vptr1'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@vptr2'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@vdate1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 38353d
      end
      item
        Name = '@vdate2'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 38353d
      end>
    Left = 512
    Top = 240
  end
  object Ado0112: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    OnCalcFields = Ado0112CalcFields
    Parameters = <>
    SQL.Strings = (
      'SELECT dbo.Data0025.ANALYSIS_CODE_1, dbo.Data0001.CURR_CODE,'
      '      dbo.Data0112.EXCHANGE_RATE, dbo.Data0112.CUSTOMER_PTR,'
      '      dbo.Data0112.CURRENCY_PTR, dbo.Data0112.invoice_number,'
      
        '      Data0112.INVOICE_DATE,data0112.POSTED_DATE, Data0008.PRODU' +
        'CT_NAME,'
      '      dbo.Data0112.INVOICE_TOTAL, dbo.Data0112.amount_paid, '
      '      dbo.Data0112.amount_credited, dbo.Data0112.CASH_DISC, '
      
        '      dbo.Data0112.INVOICE_TOTAL - dbo.Data0112.amount_paid - db' +
        'o.Data0112.CASH_DISC'
      
        '       - dbo.Data0112.amount_credited AS amt_payable, dbo.Data01' +
        '12.discount_days, '
      
        '      dbo.Data0112.discount_pct, dbo.Data0112.net_pay, dbo.data0' +
        '439.delivery_no,'
      '      dbo.Data0060.PARTS_ORDERED, dbo.Data0025.MANU_PART_NUMBER,'
      '      dbo.Data0025.MANU_PART_DESC, dbo.Data0025.unit_sq,'
      '      dbo.Data0064.DATE_SHIPPED,'
      
        '      0.0 + dbo.Data0064.QUAN_SHIPPED AS quan_shipped, dbo.Data0' +
        '097.PO_NUMBER, '
      '      dbo.Data0064.part_price, dbo.Data0064.TAX_2, '
      '      (dbo.Data0060.PARTS_ALLOC * dbo.Data0064.QUAN_SHIPPED)'
      
        '      * (1 + dbo.Data0064.TAX_2 * 0.01) AS amt_shipped, dbo.Data' +
        '0060.tax_in_price,'
      
        '       NULL AS rkey, Data0010.CUST_CODE, Data0010.CUSTOMER_NAME,' +
        ' data0010.ABBR_NAME,'
      '      dbo.Data0010.CONTACT_NAME_1, dbo.Data0010.CONT_PHONE_1,'
      
        '      dbo.Data0010.FAX, dbo.Data0010.FED_TAX_ID_NO, dbo.Data0010' +
        '.FIN_DATE,'
      
        '      dbo.Data0025.tot_accu_matl_per_sqft, dbo.Data0025.tot_accu' +
        '_OVHD_per_sqft,'
      
        '      dbo.Data0010.BILLING_ADDRESS_1, dbo.Data0010.BILLING_ADDRE' +
        'SS_2,'
      '      dbo.Data0010.BILLING_ADDRESS_3, dbo.Data0060.FOB,'
      
        '      dbo.Data0025.ANALYSIS_CODE_2,data0025.LAYERS,Data0060.SALE' +
        'S_ORDER,case data0025.ttype when 0 then '#39#37327#20135#39' when 1 then '#39#26679#26495#39' el' +
        'se '#39#39' end as sttype'
      'FROM dbo.Data0060 INNER JOIN'
      
        '      dbo.Data0064 ON dbo.Data0060.RKEY = dbo.Data0064.SO_PTR IN' +
        'NER JOIN'
      '      dbo.Data0010 INNER JOIN'
      
        '      dbo.Data0112 ON dbo.Data0112.CUSTOMER_PTR = dbo.Data0010.R' +
        'KEY INNER JOIN'
      
        '      dbo.Data0001 ON dbo.Data0112.CURRENCY_PTR = dbo.Data0001.R' +
        'KEY INNER JOIN'
      
        '      dbo.data0439 ON dbo.Data0112.RKEY = dbo.data0439.invoice_p' +
        'tr ON'
      
        '      dbo.Data0064.packing_list_ptr = dbo.data0439.rkey INNER JO' +
        'IN'
      '      dbo.Data0097 ON'
      
        '      dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY INNER ' +
        'JOIN'
      
        '      dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.' +
        'RKEY INNER JOIN'
      
        '      dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.' +
        'RKEY'
      
        'WHERE (dbo.Data0112.INVOICE_STATUS <> 3) AND (dbo.Data0112.INVOI' +
        'CE_TYPE = 1)'
      'and data0010.cust_code>='#39'1806'#39
      'and data0010.cust_code<='#39'1806'#39
      'and data0112.POSTED_DATE>='#39'2010-01-01'#39
      'and data0112.POSTED_DATE<='#39'2011-01-31'#39
      ''
      'union all'
      ''
      'SELECT dbo.Data0025.ANALYSIS_CODE_1, dbo.Data0001.CURR_CODE,'
      '      dbo.Data0112.EXCHANGE_RATE, dbo.Data0112.CUSTOMER_PTR,'
      '      dbo.Data0112.CURRENCY_PTR, dbo.Data0112.invoice_number,'
      
        '      Data0112.INVOICE_DATE,data0112.POSTED_DATE,Data0008.PRODUC' +
        'T_NAME,'
      '      dbo.Data0112.INVOICE_TOTAL, dbo.Data0112.amount_paid,'
      '      dbo.Data0112.amount_credited, dbo.Data0112.CASH_DISC, '
      
        '      dbo.Data0112.INVOICE_TOTAL - dbo.Data0112.amount_paid - db' +
        'o.Data0112.CASH_DISC'
      
        '       - dbo.Data0112.amount_credited AS amt_payable, dbo.Data01' +
        '12.discount_days,'
      
        '      dbo.Data0112.discount_pct, dbo.Data0112.net_pay, NULL AS d' +
        'elivery_no, '
      
        '      dbo.Data0060.PARTS_ORDERED, dbo.Data0025.MANU_PART_NUMBER,' +
        ' '
      '      dbo.Data0025.MANU_PART_DESC, dbo.Data0025.unit_sq, NULL '
      
        '      AS date_shipped, NULL AS quan_shipped, dbo.Data0097.PO_NUM' +
        'BER, NULL '
      
        '      AS part_price, NULL AS tax_2, dbo.Data0112.INVOICE_TOTAL A' +
        'S amt_shipped, '
      
        '      dbo.Data0060.tax_in_price, dbo.Data0060.RKEY, dbo.Data0010' +
        '.CUST_CODE, '
      
        '      dbo.Data0010.CUSTOMER_NAME, data0010.ABBR_NAME,dbo.Data001' +
        '0.CONTACT_NAME_1, '
      
        '      dbo.Data0010.CONT_PHONE_1, dbo.Data0010.FAX, dbo.Data0010.' +
        'FED_TAX_ID_NO, '
      
        '      dbo.Data0010.FIN_DATE, dbo.Data0025.tot_accu_matl_per_sqft' +
        ', '
      
        '      dbo.Data0025.tot_accu_OVHD_per_sqft, dbo.Data0010.BILLING_' +
        'ADDRESS_1,'
      
        '      dbo.Data0010.BILLING_ADDRESS_2, dbo.Data0010.BILLING_ADDRE' +
        'SS_3,'
      
        '      dbo.Data0060.FOB, dbo.Data0025.ANALYSIS_CODE_2,data0025.LA' +
        'YERS,Data0060.SALES_ORDER,case data0025.ttype when 0 then '#39#37327#20135#39' w' +
        'hen 1 then '#39#26679#26495#39' else '#39#39' end as sttype'
      'FROM dbo.Data0025 INNER JOIN'
      
        '      dbo.Data0060 ON dbo.Data0025.RKEY = dbo.Data0060.CUST_PART' +
        '_PTR INNER JOIN'
      '      dbo.Data0008 ON'
      '      dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY INNER JOIN'
      '      dbo.Data0010 INNER JOIN'
      
        '      dbo.Data0112 ON dbo.Data0112.CUSTOMER_PTR = dbo.Data0010.R' +
        'KEY INNER JOIN'
      
        '      dbo.Data0001 ON dbo.Data0112.CURRENCY_PTR = dbo.Data0001.R' +
        'KEY ON'
      
        '      dbo.Data0060.RKEY = dbo.Data0112.sales_order_ptr INNER JOI' +
        'N'
      '      dbo.Data0097 ON'
      '      dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY'
      
        'WHERE (dbo.Data0112.INVOICE_STATUS <> 3) AND (dbo.Data0112.INVOI' +
        'CE_TYPE = 2)'
      'and data0010.cust_code>='#39'1806'#39
      'and data0010.cust_code<='#39'1806'#39
      'and data0112.POSTED_DATE>='#39'2010-01-01'#39
      'and data0112.POSTED_DATE<='#39'2011-01-31'#39
      ''
      'union all'
      ''
      'SELECT dbo.Data0025.ANALYSIS_CODE_1, dbo.Data0001.CURR_CODE,'
      '      dbo.Data0116.EX_RATE AS exchange_rate, '
      
        '      dbo.Data0116.CUST_PTR AS customer_ptr, dbo.Data0116.CURREN' +
        'CY_PTR, '
      '      '#39'('#36864')'#39' + dbo.Data0098.RMA_NUMBER AS invoice_number,'
      
        '      Data0116.RMA_DATE AS invoice_date, DATA0116.MEMO_DATE AS P' +
        'OSTED_DATE,Data0008.PRODUCT_NAME,'
      
        '      - (1 * dbo.Data0116.AMOUNT) AS invoice_total, 0 AS amount_' +
        'paid, '
      
        '      0 AS amount_credited, 0 AS cash_disc, 0 AS amt_payable, 0 ' +
        'AS discount_days,'
      
        '      0 AS discount_pct, 0 AS net_pay, '#39#39' AS delivery_no, dbo.Da' +
        'ta0060.PARTS_ORDERED, '
      
        '      dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC' +
        ', '
      
        '      dbo.Data0025.unit_sq, dbo.Data0098.RMA_DATE AS date_shippe' +
        'd, '
      
        '      - (1 * dbo.Data0098.QTY_AUTH) AS quan_shipped, dbo.Data009' +
        '7.PO_NUMBER, '
      
        '      dbo.Data0060.PART_PRICE, dbo.Data0060.RUSH_CHARGE AS tax_2' +
        ', '
      
        '      - ((1 * dbo.Data0060.PARTS_ALLOC) * (1 + dbo.Data0060.RUSH' +
        '_CHARGE * 0.01) '
      
        '      * dbo.Data0098.QTY_AUTH) AS amt_shipped, dbo.Data0060.tax_' +
        'in_price, NULL'
      
        '      AS rkey,Data0010.CUST_CODE,Data0010.CUSTOMER_NAME,data0010' +
        '.ABBR_NAME,'
      '      dbo.Data0010.CONTACT_NAME_1, dbo.Data0010.CONT_PHONE_1, '
      
        '      dbo.Data0010.FAX, dbo.Data0010.FED_TAX_ID_NO, dbo.Data0010' +
        '.FIN_DATE, '
      
        '      dbo.Data0025.tot_accu_matl_per_sqft, dbo.Data0025.tot_accu' +
        '_OVHD_per_sqft, '
      
        '      dbo.Data0010.BILLING_ADDRESS_1, dbo.Data0010.BILLING_ADDRE' +
        'SS_2, '
      '      dbo.Data0010.BILLING_ADDRESS_3, dbo.Data0060.FOB,'
      
        '      dbo.Data0025.ANALYSIS_CODE_2,data0025.LAYERS,Data0060.SALE' +
        'S_ORDER,case data0025.ttype when 0 then '#39#37327#20135#39' when 1 then '#39#26679#26495#39' el' +
        'se '#39#39' end as sttype'
      'FROM dbo.Data0001 INNER JOIN'
      '      dbo.Data0116 INNER JOIN'
      
        '      dbo.Data0010 ON dbo.Data0116.CUST_PTR = dbo.Data0010.RKEY ' +
        'ON'
      '      dbo.Data0001.RKEY = dbo.Data0116.CURRENCY_PTR INNER JOIN'
      '      dbo.Data0008 INNER JOIN'
      '      dbo.Data0097 INNER JOIN'
      '      dbo.Data0025 INNER JOIN'
      '      dbo.Data0098 ON'
      
        '      dbo.Data0025.RKEY = dbo.Data0098.CUSTOMER_PART_PTR INNER J' +
        'OIN'
      '      dbo.Data0060 ON dbo.Data0098.SO_PTR = dbo.Data0060.RKEY ON'
      '      dbo.Data0097.RKEY = dbo.Data0060.PURCHASE_ORDER_PTR ON'
      '      dbo.Data0008.RKEY = dbo.Data0025.PROD_CODE_PTR ON'
      '      dbo.Data0116.RKEY = dbo.Data0098.srce_ptr'
      
        'WHERE (dbo.Data0116.MEMO_TP = 4) AND (dbo.Data0116.memo_status <' +
        '> 3)'
      'and data0010.cust_code>='#39'1806'#39
      'and data0010.cust_code<='#39'1806'#39
      'and data0116.MEMO_DATE>='#39'2010-01-01'#39
      'and data0116.MEMO_DATE<='#39'2011-01-31'#39
      
        'order by data0010.cust_code,data0112.currency_ptr,data0097.po_nu' +
        'mber'
      ' ')
    Left = 408
    Top = 40
    object Ado0112ANALYSIS_CODE_1: TStringField
      FieldName = 'ANALYSIS_CODE_1'
      ReadOnly = True
      Size = 30
    end
    object Ado0112CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      ReadOnly = True
      Size = 5
    end
    object Ado0112EXCHANGE_RATE: TFloatField
      FieldName = 'EXCHANGE_RATE'
      ReadOnly = True
    end
    object Ado0112CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
      ReadOnly = True
    end
    object Ado0112CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
      ReadOnly = True
    end
    object Ado0112invoice_number: TStringField
      FieldName = 'invoice_number'
      ReadOnly = True
      Size = 14
    end
    object Ado0112INVOICE_DATE: TDateTimeField
      DisplayLabel = #24080#40836#26085#26399
      FieldName = 'INVOICE_DATE'
      ReadOnly = True
    end
    object Ado0112POSTED_DATE: TDateTimeField
      DisplayLabel = #21457#31080#26085#26399
      FieldName = 'POSTED_DATE'
      ReadOnly = True
    end
    object Ado0112PRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#31867#22411#21517#31216
      FieldName = 'PRODUCT_NAME'
      ReadOnly = True
      Size = 30
    end
    object Ado0112INVOICE_TOTAL: TBCDField
      FieldName = 'INVOICE_TOTAL'
      ReadOnly = True
      Precision = 19
    end
    object Ado0112amount_paid: TBCDField
      FieldName = 'amount_paid'
      ReadOnly = True
      Precision = 19
    end
    object Ado0112amount_credited: TBCDField
      FieldName = 'amount_credited'
      ReadOnly = True
      Precision = 19
    end
    object Ado0112CASH_DISC: TBCDField
      FieldName = 'CASH_DISC'
      ReadOnly = True
      Precision = 19
    end
    object Ado0112amt_payable: TBCDField
      FieldName = 'amt_payable'
      ReadOnly = True
      Precision = 19
    end
    object Ado0112discount_days: TIntegerField
      FieldName = 'discount_days'
      ReadOnly = True
    end
    object Ado0112discount_pct: TBCDField
      FieldName = 'discount_pct'
      ReadOnly = True
      Precision = 19
    end
    object Ado0112net_pay: TIntegerField
      FieldName = 'net_pay'
      ReadOnly = True
    end
    object Ado0112delivery_no: TStringField
      FieldName = 'delivery_no'
      ReadOnly = True
      Size = 10
    end
    object Ado0112PARTS_ORDERED: TFloatField
      FieldName = 'PARTS_ORDERED'
      ReadOnly = True
    end
    object Ado0112MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
      ReadOnly = True
    end
    object Ado0112MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      ReadOnly = True
      Size = 40
    end
    object Ado0112unit_sq: TFloatField
      FieldName = 'unit_sq'
      ReadOnly = True
    end
    object Ado0112DATE_SHIPPED: TDateTimeField
      FieldName = 'DATE_SHIPPED'
      ReadOnly = True
    end
    object Ado0112quan_shipped: TBCDField
      DisplayLabel = #20986#36135#25968#37327
      FieldName = 'quan_shipped'
      ReadOnly = True
      Precision = 12
      Size = 1
    end
    object Ado0112PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      ReadOnly = True
      Size = 25
    end
    object Ado0112part_price: TFloatField
      FieldName = 'part_price'
      ReadOnly = True
    end
    object Ado0112TAX_2: TBCDField
      DisplayLabel = #31246#29575'%'
      FieldName = 'TAX_2'
      ReadOnly = True
      Precision = 5
      Size = 2
    end
    object Ado0112amt_shipped: TFloatField
      FieldName = 'amt_shipped'
      ReadOnly = True
    end
    object Ado0112tax_in_price: TStringField
      DisplayLabel = #20215#26684#21547#31246
      FieldName = 'tax_in_price'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object Ado0112rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object Ado0112CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      ReadOnly = True
      Size = 10
    end
    object Ado0112CUSTOMER_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'CUSTOMER_NAME'
      ReadOnly = True
      Size = 100
    end
    object Ado0112ABBR_NAME: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'ABBR_NAME'
      ReadOnly = True
      Size = 10
    end
    object Ado0112CONTACT_NAME_1: TStringField
      FieldName = 'CONTACT_NAME_1'
      ReadOnly = True
      FixedChar = True
    end
    object Ado0112CONT_PHONE_1: TStringField
      FieldName = 'CONT_PHONE_1'
      ReadOnly = True
      FixedChar = True
      Size = 14
    end
    object Ado0112FAX: TStringField
      FieldName = 'FAX'
      ReadOnly = True
      FixedChar = True
    end
    object Ado0112FED_TAX_ID_NO: TStringField
      FieldName = 'FED_TAX_ID_NO'
      ReadOnly = True
      Size = 50
    end
    object Ado0112FIN_DATE: TDateTimeField
      FieldName = 'FIN_DATE'
      ReadOnly = True
    end
    object Ado0112tot_accu_matl_per_sqft: TFloatField
      FieldName = 'tot_accu_matl_per_sqft'
      ReadOnly = True
    end
    object Ado0112tot_accu_OVHD_per_sqft: TFloatField
      FieldName = 'tot_accu_OVHD_per_sqft'
      ReadOnly = True
    end
    object Ado0112BILLING_ADDRESS_1: TStringField
      FieldName = 'BILLING_ADDRESS_1'
      ReadOnly = True
      Size = 100
    end
    object Ado0112BILLING_ADDRESS_2: TStringField
      FieldName = 'BILLING_ADDRESS_2'
      ReadOnly = True
      Size = 50
    end
    object Ado0112BILLING_ADDRESS_3: TStringField
      FieldName = 'BILLING_ADDRESS_3'
      ReadOnly = True
      Size = 30
    end
    object Ado0112FOB: TStringField
      FieldName = 'FOB'
      ReadOnly = True
      Size = 50
    end
    object Ado0112ANALYSIS_CODE_2: TStringField
      DisplayLabel = #23458#25143#29289#26009#21495
      FieldName = 'ANALYSIS_CODE_2'
      ReadOnly = True
      Size = 50
    end
    object Ado0112LAYERS: TWordField
      DisplayLabel = #20135#21697#23618#25968
      FieldName = 'LAYERS'
      ReadOnly = True
    end
    object Ado0112Detail_text: TStringField
      FieldKind = fkCalculated
      FieldName = 'Detail_text'
      Size = 200
      Calculated = True
    end
    object Ado0112SALES_ORDER: TStringField
      DisplayLabel = #38144#21806#35746#21333#21495
      FieldName = 'SALES_ORDER'
      ReadOnly = True
      FixedChar = True
      Size = 12
    end
    object Ado0112sttype: TStringField
      DisplayLabel = #35746#21333#31867#22411
      DisplayWidth = 10
      FieldName = 'sttype'
      ReadOnly = True
      Size = 4
    end
  end
end
