object Form_selectpk: TForm_selectpk
  Left = 237
  Top = 175
  Width = 722
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
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 313
    Width = 706
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 706
    Height = 37
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 219
      Top = 14
      Width = 52
      Height = 13
      Caption = #35013#31665#21333#21495
    end
    object Edit1: TEdit
      Left = 274
      Top = 10
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
      OnKeyDown = DBGrid1KeyDown
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 37
    Width = 706
    Height = 276
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'delivery_no'
        Title.Color = clRed
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
        FieldName = 'LOCATION'
        Width = 97
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
        Width = 69
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 316
    Width = 706
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
    OnKeyDown = DBGrid2KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'SALES_ORDER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_NUMBER'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_SHIPPED'
        Width = 72
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
      end
      item
        Expanded = False
        FieldName = 'SHIPMENT_NO'
        Width = 41
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 454
    Width = 706
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    DesignSize = (
      706
      39)
    object Button1: TButton
      Left = 263
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 346
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = aqd439
    Left = 112
    Top = 366
  end
  object DataSource2: TDataSource
    DataSet = aqd64
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
      'ta0439.customer_ptr, '#13#10'      dbo.Data0001.CURR_CODE, dbo.Data000' +
      '1.CURR_NAME, dbo.Data0001.base_to_other, '#13#10'      dbo.data0439.ch' +
      'arge, dbo.data0439.ship_addr_ptr, dbo.Data0010.ACC_REC_PTR, '#13#10'  ' +
      '    data0439.currency_ptr, '#13#10'      round(SUM(Data0064.QUAN_SHIPP' +
      'ED * Data0064.part_price),2)  AS sum_amount'#13#10'FROM dbo.data0439 I' +
      'NNER JOIN'#13#10'      dbo.Data0010 ON dbo.data0439.customer_ptr = dbo' +
      '.Data0010.RKEY INNER JOIN'#13#10'      dbo.Data0012 ON dbo.data0439.sh' +
      'ip_addr_ptr = dbo.Data0012.RKEY INNER JOIN'#13#10'      dbo.Data0005 O' +
      'N dbo.data0439.employee_ptr = dbo.Data0005.RKEY INNER JOIN'#13#10'    ' +
      '  dbo.Data0001 ON dbo.data0439.currency_ptr = dbo.Data0001.RKEY ' +
      'INNER JOIN'#13#10'      dbo.Data0064 ON dbo.data0439.rkey = dbo.Data00' +
      '64.packing_list_ptr'#13#10'WHERE (dbo.data0439.invoice_ptr IS NULL) an' +
      'd'#13#10'               (data0439.customer_ptr = :rkey10) and'#13#10'       ' +
      '        (data0439.currency_ptr = :rkey01) and '#13#10'               (' +
      'data0439.warehouse_ptr=:rkey15)'#13#10'GROUP BY dbo.data0439.rkey, dbo' +
      '.data0439.delivery_no, dbo.data0439.date_sailing, '#13#10'      dbo.da' +
      'ta0439.shipping_method, dbo.data0439.cartons_no, '#13#10'      dbo.Dat' +
      'a0010.CUST_CODE, dbo.Data0010.CUSTOMER_NAME, '#13#10'      dbo.Data001' +
      '0.ABBR_NAME, dbo.Data0010.DISCOUNT_PCT, '#13#10'      dbo.Data0010.DIS' +
      'COUNT_DAYS, dbo.Data0010.NET_PAY, dbo.Data0012.LOCATION, '#13#10'     ' +
      ' dbo.Data0005.EMPLOYEE_NAME, dbo.data0439.customer_ptr, '#13#10'      ' +
      'dbo.Data0001.CURR_CODE, dbo.Data0001.CURR_NAME, Data0001.base_to' +
      '_other, '#13#10'      dbo.data0439.charge, dbo.data0439.ship_addr_ptr,' +
      ' dbo.Data0010.ACC_REC_PTR, '#13#10'      dbo.data0439.currency_ptr'
    IndexFieldNames = 'delivery_no'
    Parameters = <
      item
        Name = 'rkey10'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'rkey01'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'rkey15'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
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
  end
  object aqd64: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT Data0060.SALES_ORDER, Data0025.MANU_PART_NUMBER, '#13#10'      ' +
      'Data0025.MANU_PART_DESC,  DATA0064.SHIPMENT_NO,'#13#10'      Data0097.' +
      'PO_NUMBER, data0060.tax_in_price,data0060.discount,'#13#10'      Data0' +
      '064.part_price, Data0064.TAX_2, Data0064.QUAN_SHIPPED, '#13#10'      D' +
      'ata0060.TOTAL_ADD_L_PRICE-Data0060.INVD_ADD_L_PRICE as tools_amo' +
      'unt,'#13#10'      data0064.packing_list_ptr,data0064.rkey'#13#10'FROM dbo.Da' +
      'ta0060 INNER JOIN'#13#10'      dbo.Data0064 ON dbo.Data0060.RKEY = dbo' +
      '.Data0064.SO_PTR INNER JOIN'#13#10'      dbo.Data0025 ON dbo.Data0060.' +
      'CUST_PART_PTR = dbo.Data0025.RKEY INNER JOIN'#13#10'      dbo.Data0097' +
      ' ON dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY'#13#10'where d' +
      'ata0064.packing_list_ptr=:rkey'
    DataSource = DataSource1
    MasterFields = 'rkey'
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
    object aqd64SHIPMENT_NO: TSmallintField
      DisplayLabel = #25209#27425
      FieldName = 'SHIPMENT_NO'
    end
  end
end
