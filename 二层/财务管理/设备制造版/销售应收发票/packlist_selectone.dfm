object Form_selectpk: TForm_selectpk
  Left = 237
  Top = 175
  Width = 716
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
    Top = 324
    Width = 708
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 708
    Height = 37
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 219
      Top = 14
      Width = 52
      Height = 13
      Caption = #20986#20179#21333#21495
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
    Width = 708
    Height = 287
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
        FieldName = 'sales_order'
        Title.Color = clRed
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sales_date'
        ReadOnly = False
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ship_method'
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
        Width = 109
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
        Width = 61
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 327
    Width = 708
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
        FieldName = 'PROD_CODE'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUCT_NAME'
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantity'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'price'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tax_rate'
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
    Top = 465
    Width = 708
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    DesignSize = (
      708
      39)
    object Button1: TButton
      Left = 260
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 343
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
      'SELECT t60.rkey, t60.sales_order, t60.sales_date, '#13#10'      t60.sh' +
      'ip_method, t10.CUST_CODE, t10.CUSTOMER_NAME, '#13#10'      t10.ABBR_NA' +
      'ME, t10.DISCOUNT_PCT, '#13#10'      t10.DISCOUNT_DAYS, t10.NET_PAY, t6' +
      '0.LOCATION, '#13#10'      t5.EMPLOYEE_NAME, t60.customer_ptr, '#13#10'      ' +
      't10.REG_TAX_FIXED_UNUSED,'#13#10'      t10.EDI_FLAG_CREDIT_MEMO,t10.FE' +
      'D_TAX_ID_NO,'#13#10'      t1.CURR_CODE, t1.CURR_NAME, t1.base_to_other' +
      ', '#13#10'      t10.ACC_REC_PTR, t60.currency_ptr,'#13#10'      round(SUM(t6' +
      '3.quantity * t63.price),2)  AS sum_amount'#13#10'FROM  dbo.WZCP0060 t6' +
      '0 INNER JOIN'#13#10'      dbo.Data0010 t10 ON t60.customer_ptr = t10.R' +
      'KEY INNER JOIN'#13#10'      dbo.Data0005 t5 ON t60.ent_user_ptr = t5.R' +
      'KEY INNER JOIN'#13#10'      dbo.Data0001 t1 ON t60.currency_ptr = t1.R' +
      'KEY INNER JOIN'#13#10'      dbo.WZCP0063 t63 ON t60.rkey = t63.so_ptr'#13 +
      #10'WHERE (t60.invoice_ptr IS NULL) and t60.type = 1 and t60.status' +
      ' = 3'#13#10'               and'#13#10'               (t60.customer_ptr = :rk' +
      'ey10) and'#13#10'               (t60.currency_ptr = :rkey01)'#13#10'GROUP BY' +
      ' t60.rkey, t60.sales_order, t60.sales_date, '#13#10'      t60.ship_met' +
      'hod, t10.CUST_CODE, t10.CUSTOMER_NAME, '#13#10'      t10.ABBR_NAME, t1' +
      '0.DISCOUNT_PCT,'#13#10'      t10.DISCOUNT_DAYS, t10.NET_PAY, t60.LOCAT' +
      'ION, '#13#10'      t5.EMPLOYEE_NAME,t60.customer_ptr, '#13#10'      t10.REG_' +
      'TAX_FIXED_UNUSED,'#13#10'      t10.EDI_FLAG_CREDIT_MEMO, t10.FED_TAX_I' +
      'D_NO,'#13#10'      t1.CURR_CODE, t1.CURR_NAME, t1.base_to_other, '#13#10'   ' +
      '   t10.ACC_REC_PTR, t60.currency_ptr'
    IndexFieldNames = 'sales_order'
    Parameters = <
      item
        Name = 'rkey10'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'rkey01'
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
    object aqd439sales_order: TStringField
      DisplayLabel = #20986#20179#21333#21495
      FieldName = 'sales_order'
      Size = 12
    end
    object aqd439sales_date: TDateTimeField
      DisplayLabel = #26085#26399
      FieldName = 'sales_date'
    end
    object aqd439ship_method: TStringField
      DisplayLabel = #35013#36816#26041#27861
      FieldName = 'ship_method'
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
      DisplayLabel = #36755#20837#21592#24037
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
    object aqd439ACC_REC_PTR: TIntegerField
      FieldName = 'ACC_REC_PTR'
    end
    object aqd439currency_ptr: TIntegerField
      FieldName = 'currency_ptr'
    end
    object aqd439sum_amount: TFloatField
      DisplayLabel = #37329#39069
      FieldName = 'sum_amount'
    end
    object aqd439base_to_other: TFloatField
      DisplayLabel = #27719#29575
      FieldName = 'base_to_other'
    end
    object aqd439REG_TAX_FIXED_UNUSED: TStringField
      FieldName = 'REG_TAX_FIXED_UNUSED'
      FixedChar = True
      Size = 1
    end
    object aqd439EDI_FLAG_CREDIT_MEMO: TSmallintField
      FieldName = 'EDI_FLAG_CREDIT_MEMO'
    end
    object aqd439FED_TAX_ID_NO: TStringField
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
      'select t70.SALES_ORDER, '#13#10'      t8.PROD_CODE, t8.PRODUCT_NAME, t' +
      '8.PRODUCT_DESC,'#13#10'      '#39'Y'#39' as tax_in_price,'#13#10'      t63.price, t6' +
      '3.tax_rate, t63.quantity, t63.so_ptr, t63.rkey'#13#10'from WZCP0063 t6' +
      '3 INNER JOIN'#13#10'     WZCP0060 t60 ON t63.so_ptr = t60.RKEY INNER J' +
      'OIN'#13#10'     WZCP0070 t70 ON t60.SALES_REP_PTR = t70.RKEY INNER JOI' +
      'N'#13#10'     Data0008 t8 ON t63.prod_ptr = t8.RKEY'#13#10'where t63.so_ptr=' +
      ':rkey'
    DataSource = DataSource1
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
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
    object aqd64price: TBCDField
      DisplayLabel = #20215#26684
      FieldName = 'price'
      Precision = 10
      Size = 2
    end
    object aqd64tax_rate: TBCDField
      DisplayLabel = #31246#29575'%'
      FieldName = 'tax_rate'
      Precision = 4
      Size = 2
    end
    object aqd64quantity: TBCDField
      DisplayLabel = #20986#20179#25968#37327
      FieldName = 'quantity'
      Precision = 10
      Size = 2
    end
    object aqd64tax_in_price: TStringField
      DisplayLabel = #20215#26684#21547#31246
      FieldName = 'tax_in_price'
      ReadOnly = True
      Size = 1
    end
    object aqd64rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object aqd64PROD_CODE: TStringField
      DisplayLabel = #20135#21697#32534#30721
      FieldName = 'PROD_CODE'
      Size = 15
    end
    object aqd64PRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#21517#31216
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object aqd64PRODUCT_DESC: TStringField
      FieldName = 'PRODUCT_DESC'
      Size = 200
    end
    object aqd64so_ptr: TIntegerField
      FieldName = 'so_ptr'
    end
  end
end
