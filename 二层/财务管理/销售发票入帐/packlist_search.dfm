object Form_packlist: TForm_packlist
  Left = 250
  Top = 158
  Width = 785
  Height = 531
  Caption = #35013#31665#21333#26597#25214
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 313
    Width = 769
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    Visible = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 769
    Height = 55
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 110
      Top = 22
      Width = 52
      Height = 13
      Caption = #23458#25143#20195#30721
    end
    object Label2: TLabel
      Left = 304
      Top = 10
      Width = 72
      Height = 13
      Caption = #36865#36135#26085#26399#20174':'
    end
    object Label4: TLabel
      Left = 357
      Top = 33
      Width = 20
      Height = 13
      Caption = #21040':'
    end
    object Edit1: TEdit
      Left = 165
      Top = 18
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
      OnKeyDown = DBGrid1KeyDown
    end
    object dtpk1: TDateTimePicker
      Left = 381
      Top = 5
      Width = 102
      Height = 21
      Date = 38848.000000000000000000
      Time = 38848.000000000000000000
      TabOrder = 1
      OnCloseUp = dtpk1CloseUp
      OnExit = dtpk1CloseUp
    end
    object dtpk2: TDateTimePicker
      Left = 381
      Top = 29
      Width = 102
      Height = 21
      Date = 38848.000000000000000000
      Time = 38848.000000000000000000
      TabOrder = 2
      OnCloseUp = dtpk1CloseUp
      OnExit = dtpk1CloseUp
    end
    object CheckBox1: TCheckBox
      Left = 35
      Top = 20
      Width = 57
      Height = 17
      Caption = #20840#36873
      TabOrder = 3
      OnClick = CheckBox1Click
    end
    object dtt1: TDateTimePicker
      Left = 487
      Top = 5
      Width = 91
      Height = 21
      Date = 40542.000000000000000000
      Time = 40542.000000000000000000
      DateMode = dmUpDown
      Kind = dtkTime
      TabOrder = 4
      OnExit = dtpk1CloseUp
    end
    object dtt2: TDateTimePicker
      Left = 488
      Top = 28
      Width = 91
      Height = 21
      Date = 40542.999988425920000000
      Time = 40542.999988425920000000
      DateMode = dmUpDown
      Kind = dtkTime
      TabOrder = 5
      OnExit = dtpk1CloseUp
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 55
    Width = 769
    Height = 258
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'delivery_no'
        Title.Color = cl3DLight
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'date_sailing'
        ReadOnly = False
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'shipping_method'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUST_CODE'
        Title.Color = clRed
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FED_TAX_ID_NO'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCATION'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'base_to_other'
        ReadOnly = False
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sum_amount'
        ReadOnly = False
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_name15'
        Width = 70
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 316
    Width = 769
    Height = 138
    Align = alBottom
    DataSource = DataSource2
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Visible = False
    Columns = <
      item
        Expanded = False
        FieldName = 'SALES_ORDER'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_NUMBER'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Width = 133
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_SHIPPED'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'part_price'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAX_2'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tax_in_price'
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 454
    Width = 769
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    DesignSize = (
      769
      39)
    object Button1: TButton
      Left = 289
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #30830#23450
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 380
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Cancel = True
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = aqd439
    OnDataChange = DataSource1DataChange
    Left = 112
    Top = 366
  end
  object DataSource2: TDataSource
    Left = 112
    Top = 398
  end
  object aqd439: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT dbo.data0439.rkey, dbo.data0439.delivery_no, dbo.data0439' +
      '.date_sailing, '#13#10'      dbo.data0439.shipping_method, dbo.data043' +
      '9.cartons_no, '#13#10'      dbo.Data0010.CUST_CODE, dbo.Data0010.CUSTO' +
      'MER_NAME, '#13#10'      dbo.Data0010.ABBR_NAME, dbo.Data0010.DISCOUNT_' +
      'PCT, '#13#10'      dbo.Data0010.DISCOUNT_DAYS, dbo.Data0010.NET_PAY, d' +
      'bo.Data0012.LOCATION, '#13#10'      dbo.Data0005.EMPLOYEE_NAME, dbo.da' +
      'ta0439.customer_ptr, data0010.REG_TAX_FIXED_UNUSED,'#13#10'      data0' +
      '010.EDI_FLAG_CREDIT_MEMO,data0439.warehouse_ptr,data0010.FED_TAX' +
      '_ID_NO,'#13#10'      dbo.Data0001.CURR_CODE, dbo.Data0001.CURR_NAME, d' +
      'bo.Data0001.base_to_other, '#13#10'      dbo.data0439.charge, dbo.data' +
      '0439.ship_addr_ptr, dbo.Data0010.ACC_REC_PTR, '#13#10'      dbo.data04' +
      '39.currency_ptr, dbo.Data0015.ABBR_NAME as abbr_name15,'#13#10'      r' +
      'ound(SUM(Data0064.QUAN_SHIPPED * Data0064.part_price),2)  AS sum' +
      '_amount'#13#10'FROM dbo.data0439 INNER JOIN'#13#10'      dbo.Data0010 ON dbo' +
      '.data0439.customer_ptr = dbo.Data0010.RKEY INNER JOIN'#13#10'      dbo' +
      '.Data0012 ON dbo.data0439.ship_addr_ptr = dbo.Data0012.RKEY INNE' +
      'R JOIN'#13#10'      dbo.Data0005 ON dbo.data0439.employee_ptr = dbo.Da' +
      'ta0005.RKEY INNER JOIN'#13#10'      dbo.Data0001 ON dbo.data0439.curre' +
      'ncy_ptr = dbo.Data0001.RKEY INNER JOIN'#13#10'      dbo.Data0064 ON db' +
      'o.data0439.rkey = dbo.Data0064.packing_list_ptr  INNER JOIN'#13#10'   ' +
      '   dbo.Data0015 ON dbo.data0439.warehouse_ptr = dbo.Data0015.RKE' +
      'Y'#13#10'WHERE (dbo.data0439.invoice_ptr IS NULL) and'#13#10'               ' +
      '(data0439.date_ent >= :dtpk1) and'#13#10'               (data0439.date' +
      '_ent <= :dtpk2)'#13#10'GROUP BY dbo.data0439.rkey, dbo.data0439.delive' +
      'ry_no, dbo.data0439.date_sailing, '#13#10'      dbo.data0439.shipping_' +
      'method, dbo.data0439.cartons_no, '#13#10'      dbo.Data0010.CUST_CODE,' +
      ' dbo.Data0010.CUSTOMER_NAME, '#13#10'      dbo.Data0010.ABBR_NAME, dbo' +
      '.Data0010.DISCOUNT_PCT, data0010.FED_TAX_ID_NO,'#13#10'      dbo.Data0' +
      '010.DISCOUNT_DAYS, dbo.Data0010.NET_PAY, dbo.Data0012.LOCATION, ' +
      #13#10'      dbo.Data0005.EMPLOYEE_NAME, dbo.data0439.customer_ptr, '#13 +
      #10'      dbo.Data0001.CURR_CODE, dbo.Data0001.CURR_NAME, Data0001.' +
      'base_to_other, '#13#10'      dbo.data0439.charge, dbo.data0439.ship_ad' +
      'dr_ptr, dbo.Data0010.ACC_REC_PTR, '#13#10'      dbo.data0439.currency_' +
      'ptr, data0010.REG_TAX_FIXED_UNUSED,data0439.warehouse_ptr,'#13#10'    ' +
      '  data0010.EDI_FLAG_CREDIT_MEMO,dbo.Data0015.ABBR_NAME'
    IndexFieldNames = 'delivery_no'
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 38353d
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 38869d
      end>
    Left = 144
    Top = 366
    object aqd439rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object aqd439delivery_no: TStringField
      DisplayLabel = #35013#31665#21333#21495
      FieldName = 'delivery_no'
      Size = 10
    end
    object aqd439date_sailing: TDateTimeField
      DisplayLabel = #36865#36135#26085#26399
      FieldName = 'date_sailing'
    end
    object aqd439shipping_method: TStringField
      DisplayLabel = #35013#36816#26041#27861
      FieldName = 'shipping_method'
    end
    object aqd439cartons_no: TIntegerField
      FieldName = 'cartons_no'
    end
    object aqd439CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object aqd439CUSTOMER_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object aqd439ABBR_NAME: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object aqd439DISCOUNT_PCT: TBCDField
      FieldName = 'DISCOUNT_PCT'
      Precision = 4
      Size = 2
    end
    object aqd439DISCOUNT_DAYS: TSmallintField
      FieldName = 'DISCOUNT_DAYS'
    end
    object aqd439NET_PAY: TSmallintField
      FieldName = 'NET_PAY'
    end
    object aqd439LOCATION: TStringField
      DisplayLabel = #36865#36135#22320#28857
      FieldName = 'LOCATION'
      Size = 80
    end
    object aqd439EMPLOYEE_NAME: TStringField
      DisplayLabel = #35013#36816#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object aqd439customer_ptr: TIntegerField
      FieldName = 'customer_ptr'
    end
    object aqd439CURR_CODE: TStringField
      DisplayLabel = #36135#24065#20195#30721
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object aqd439CURR_NAME: TStringField
      DisplayLabel = #36135#24065#21517#31216
      FieldName = 'CURR_NAME'
    end
    object aqd439charge: TFloatField
      DisplayLabel = #35013#36816#36153#29992
      FieldName = 'charge'
    end
    object aqd439ship_addr_ptr: TIntegerField
      FieldName = 'ship_addr_ptr'
    end
    object aqd439ACC_REC_PTR: TIntegerField
      FieldName = 'ACC_REC_PTR'
    end
    object aqd439currency_ptr: TIntegerField
      FieldName = 'currency_ptr'
    end
    object aqd439sum_amount: TFloatField
      DisplayLabel = #19981#21547#31246#37329#39069
      FieldName = 'sum_amount'
    end
    object aqd439base_to_other: TFloatField
      DisplayLabel = #27719#29575
      FieldName = 'base_to_other'
    end
    object aqd439REG_TAX_FIXED_UNUSED: TStringField
      DisplayLabel = #21457#31080#21040#26399#35745#31639#26041#27861
      FieldName = 'REG_TAX_FIXED_UNUSED'
      FixedChar = True
      Size = 1
    end
    object aqd439EDI_FLAG_CREDIT_MEMO: TSmallintField
      DisplayLabel = #32467#24080#26085
      FieldName = 'EDI_FLAG_CREDIT_MEMO'
    end
    object aqd439abbr_name15: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'abbr_name15'
      Size = 10
    end
    object aqd439warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object aqd439FED_TAX_ID_NO: TStringField
      DisplayLabel = #20184#27454#26041#24335
      DisplayWidth = 20
      FieldName = 'FED_TAX_ID_NO'
      Size = 50
    end
  end
  object aqd64: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT Data0060.SALES_ORDER, '#13#10'     Data0025.MANU_PART_NUMBER, D' +
      'ata0025.MANU_PART_DESC, '#13#10'      Data0097.PO_NUMBER, data0060.tax' +
      '_in_price,data0060.discount,'#13#10'      dbo.Data0064.part_price, Dat' +
      'a0064.TAX_2, Data0064.QUAN_SHIPPED, '#13#10'      Data0060.TOTAL_ADD_L' +
      '_PRICE-Data0060.INVD_ADD_L_PRICE as tools_amount,'#13#10'      data006' +
      '4.packing_list_ptr,data0064.rkey'#13#10'FROM Data0060 INNER JOIN'#13#10'    ' +
      '  Data0064 ON dbo.Data0060.RKEY = Data0064.SO_PTR INNER JOIN'#13#10'  ' +
      '    Data0025 ON dbo.Data0060.CUST_PART_PTR = Data0025.RKEY INNER' +
      ' JOIN'#13#10'      Data0097 ON dbo.Data0060.PURCHASE_ORDER_PTR = Data0' +
      '097.RKEY'#13#10'where data0064.packing_list_ptr=:rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 217
      end>
    Left = 144
    Top = 398
    object aqd64SALES_ORDER: TStringField
      DisplayLabel = #38144#21806#35746#21333
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object aqd64PO_NUMBER: TStringField
      DisplayLabel = #23458#25143#37319#36141#35746#21333
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object aqd64part_price: TFloatField
      DisplayLabel = #20215#26684
      FieldName = 'part_price'
    end
    object aqd64TAX_2: TBCDField
      DisplayLabel = #31246#29575'%'
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object aqd64QUAN_SHIPPED: TIntegerField
      DisplayLabel = #35013#36816#25968#37327
      FieldName = 'QUAN_SHIPPED'
    end
    object aqd64tax_in_price: TStringField
      DisplayLabel = #20215#26684#21547#31246
      FieldName = 'tax_in_price'
      FixedChar = True
      Size = 1
    end
    object aqd64discount: TBCDField
      FieldName = 'discount'
      Precision = 5
      Size = 2
    end
    object aqd64tools_amount: TFloatField
      FieldName = 'tools_amount'
      ReadOnly = True
    end
    object aqd64packing_list_ptr: TIntegerField
      FieldName = 'packing_list_ptr'
    end
    object aqd64rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object aqd64MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object aqd64MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
  end
end
