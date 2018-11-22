object Frm_salesOrder: TFrm_salesOrder
  Left = 332
  Top = 226
  Width = 690
  Height = 485
  Caption = #38144#21806#35746#21333
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 217
    Width = 682
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 682
    Height = 35
    Align = alTop
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 141
      Top = 11
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #35746#21333#32534#21495
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clDefault
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object BtClose: TBitBtn
      Left = 0
      Top = 2
      Width = 65
      Height = 30
      Caption = #21462#28040
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      Kind = bkCancel
    end
    object Edit1: TEdit
      Left = 198
      Top = 5
      Width = 121
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnChange = Edit1Change
    end
    object BitBtn1: TBitBtn
      Left = 64
      Top = 2
      Width = 65
      Height = 30
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
      Kind = bkOK
    end
  end
  object Grd1: TDBGridEh
    Left = 0
    Top = 35
    Width = 682
    Height = 182
    Align = alTop
    DataSource = DS1
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    OnDblClick = Grd1DblClick
    OnKeyDown = Grd1KeyDown
    OnTitleClick = Grd1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'sales_order'
        Footers = <>
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'sales_date'
        Footers = <>
        Width = 82
      end
      item
        EditButtons = <>
        FieldName = 'CUST_CODE'
        Footers = <>
        Visible = False
        Width = 59
      end
      item
        EditButtons = <>
        FieldName = 'ABBR_NAME'
        Footers = <>
        Width = 103
      end
      item
        EditButtons = <>
        FieldName = 'PO_NO'
        Footers = <>
        Title.Caption = #21512#21516#21495
        Width = 101
      end
      item
        EditButtons = <>
        FieldName = 'ship_method'
        Footers = <>
        Visible = False
        Width = 58
      end
      item
        EditButtons = <>
        FieldName = 'location'
        Footers = <>
        Visible = False
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'CURR_CODE'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'exch_rate'
        Footers = <>
        Visible = False
        Width = 39
      end
      item
        EditButtons = <>
        FieldName = 'total_amount'
        Footers = <>
        Visible = False
        Width = 57
      end
      item
        EditButtons = <>
        FieldName = 'CONTACT_NAME'
        Footers = <>
        Width = 44
      end
      item
        EditButtons = <>
        FieldName = 'CONT_PHONE'
        Footers = <>
        Width = 73
      end
      item
        EditButtons = <>
        FieldName = 'TAX_cate'
        Footers = <>
        Visible = False
        Width = 57
      end
      item
        EditButtons = <>
        FieldName = 'pay_method'
        Footers = <>
        Visible = False
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'remark'
        Footers = <>
        Width = 126
      end
      item
        EditButtons = <>
        FieldName = 'DEPT_CODE'
        Footers = <>
        Width = 85
      end
      item
        EditButtons = <>
        FieldName = 'DEPT_NAME'
        Footers = <>
        Width = 88
      end
      item
        EditButtons = <>
        FieldName = 'REP_CODE'
        Footers = <>
        Visible = False
        Width = 71
      end
      item
        EditButtons = <>
        FieldName = 'sales_rep_name'
        Footers = <>
        Visible = False
        Width = 71
      end
      item
        EditButtons = <>
        FieldName = 'EMPL_CODE'
        Footers = <>
        Width = 46
      end
      item
        EditButtons = <>
        FieldName = 'EMPLOYEE_NAME'
        Footers = <>
        Width = 70
      end>
  end
  object Grd2: TDBGridEh
    Left = 0
    Top = 220
    Width = 682
    Height = 231
    Align = alClient
    DataSource = DS2
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'PROD_CODE'
        Footers = <>
        Title.Alignment = taCenter
        Width = 77
      end
      item
        EditButtons = <>
        FieldName = 'PRODUCT_NAME'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #20135#21697#21517#31216
        Width = 92
      end
      item
        EditButtons = <>
        FieldName = 'quantity'
        Footers = <>
        Title.Caption = #35746#21333#25968#37327
      end
      item
        EditButtons = <>
        FieldName = 'price'
        Footers = <>
        Title.Alignment = taCenter
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'tax_rate'
        Footers = <>
        Title.Alignment = taCenter
        Visible = False
        Width = 33
      end
      item
        EditButtons = <>
        FieldName = 'complete_date'
        Footers = <>
        Width = 72
      end
      item
        EditButtons = <>
        FieldName = 'remark'
        Footers = <>
        Title.Alignment = taCenter
        Width = 214
      end>
  end
  object ADO70: TADOQuery
    Connection = DM.ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterScroll = ADO70AfterScroll
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     dbo.WZCP0070.*, dbo.Data0010.CUST_CODE, dbo.Data0010.' +
        'CUSTOMER_NAME, data0010.ABBR_NAME,dbo.Data0009.REP_CODE, dbo.Dat' +
        'a0009.sales_rep_name, '
      
        '                      dbo.Data0005.EMPL_CODE, dbo.Data0005.EMPLO' +
        'YEE_NAME, dbo.Data0034.DEPT_CODE, dbo.Data0034.DEPT_NAME, dbo.Da' +
        'ta0001.CURR_CODE, '
      
        '                      dbo.Data0001.CURR_NAME,data0010.rkey rkey1' +
        '0,'
      '                    case when wzcp0070.status=1 then '#39#26410#25552#20132#39
      '                             when wzcp0070.status=2 then '#39#24453#30830#35748#39
      '                             when wzcp0070.status=3 then '#39#24050#30830#35748#39
      '                             when wzcp0070.status=4 then '#39#24050#25237#20135#39
      '                             when wzcp0070.status=5 then '#39#24050#23436#25104#39
      
        '                             when wzcp0070.status=6 then '#39#34987#36864#22238#39'  ' +
        'end status_c'
      'FROM         dbo.Data0034 INNER JOIN'
      '                      dbo.Data0005 INNER JOIN'
      '                      dbo.WZCP0070 INNER JOIN'
      
        '                      dbo.Data0010 ON dbo.WZCP0070.customer_ptr ' +
        '= dbo.Data0010.RKEY left JOIN'
      
        '                      dbo.Data0009 ON dbo.WZCP0070.SALES_REP_PTR' +
        ' = dbo.Data0009.RKEY ON dbo.Data0005.RKEY = dbo.WZCP0070.ent_use' +
        'r_ptr INNER JOIN'
      
        '                      dbo.Data0001 ON dbo.WZCP0070.currency_ptr ' +
        '= dbo.Data0001.RKEY ON dbo.Data0034.RKEY = dbo.WZCP0070.produce_' +
        'deptptr'
      ''
      'where WZCP0070.type=1 and WZCP0070.status in (3,4)')
    Left = 592
    Top = 96
    object ADO70rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO70sales_order: TStringField
      DisplayLabel = #35746#21333#32534#21495
      FieldName = 'sales_order'
      Size = 12
    end
    object ADO70sales_date: TDateTimeField
      DisplayLabel = #19979#21333#26085#26399
      FieldName = 'sales_date'
    end
    object ADO70customer_ptr: TIntegerField
      FieldName = 'customer_ptr'
    end
    object ADO70type: TWordField
      FieldName = 'type'
    end
    object ADO70status: TWordField
      FieldName = 'status'
    end
    object ADO70ship_method: TStringField
      DisplayLabel = #35013#36816#26041#27861
      FieldName = 'ship_method'
    end
    object ADO70location: TStringField
      DisplayLabel = #36865#36135#22320#22336
      FieldName = 'location'
      Size = 50
    end
    object ADO70SALES_REP_PTR: TIntegerField
      FieldName = 'SALES_REP_PTR'
    end
    object ADO70ent_date: TDateTimeField
      DisplayLabel = #36755#20837#26085#26399
      FieldName = 'ent_date'
    end
    object ADO70ent_user_ptr: TIntegerField
      FieldName = 'ent_user_ptr'
    end
    object ADO70currency_ptr: TIntegerField
      FieldName = 'currency_ptr'
    end
    object ADO70exch_rate: TBCDField
      DisplayLabel = #27719#29575
      FieldName = 'exch_rate'
      Precision = 10
      Size = 6
    end
    object ADO70total_amount: TBCDField
      DisplayLabel = #21512#35745#37329#39069
      FieldName = 'total_amount'
      Precision = 10
      Size = 2
    end
    object ADO70entrust_deptptr: TIntegerField
      FieldName = 'entrust_deptptr'
    end
    object ADO70produce_deptptr: TIntegerField
      FieldName = 'produce_deptptr'
    end
    object ADO70CONTACT_NAME: TStringField
      DisplayLabel = #32852#31995#20154
      FieldName = 'CONTACT_NAME'
    end
    object ADO70CONT_PHONE: TStringField
      DisplayLabel = #32852#31995#30005#35805
      FieldName = 'CONT_PHONE'
    end
    object ADO70TAX_cate: TStringField
      DisplayLabel = #31080#25454#31867#22411
      FieldName = 'TAX_cate'
    end
    object ADO70pay_method: TStringField
      DisplayLabel = #20184#27454#26041#27861
      FieldName = 'pay_method'
    end
    object ADO70CONF_BY_EMPL_PTR: TIntegerField
      FieldName = 'CONF_BY_EMPL_PTR'
    end
    object ADO70CONF_DATE: TDateTimeField
      FieldName = 'CONF_DATE'
    end
    object ADO70remark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 50
    end
    object ADO70CUST_CODE: TStringField
      DisplayLabel = #23458#25143#32534#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADO70CUSTOMER_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object ADO70ABBR_NAME: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADO70REP_CODE: TStringField
      DisplayLabel = #19994#21153#21592#32534#30721
      FieldName = 'REP_CODE'
      Size = 5
    end
    object ADO70sales_rep_name: TStringField
      DisplayLabel = #19994#21153#21592#21517#31216
      FieldName = 'sales_rep_name'
    end
    object ADO70EMPL_CODE: TStringField
      DisplayLabel = #36755#20837#21592
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object ADO70EMPLOYEE_NAME: TStringField
      DisplayLabel = #36755#20837#21592#21517#31216
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADO70DEPT_CODE: TStringField
      DisplayLabel = #29983#20135#37096#38376#32534#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADO70DEPT_NAME: TStringField
      DisplayLabel = #29983#20135#37096#38376#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADO70CURR_CODE: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADO70CURR_NAME: TStringField
      DisplayLabel = #36135#24065#21517#31216
      FieldName = 'CURR_NAME'
    end
    object ADO70status_c: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'status_c'
      ReadOnly = True
      Size = 6
    end
    object ADO70rkey10: TIntegerField
      FieldName = 'rkey10'
      ReadOnly = True
    end
    object wdstrngfldADO70PO_NO: TWideStringField
      FieldName = 'PO_NO'
      Size = 50
    end
  end
  object ADO71: TADOQuery
    Connection = DM.ADOCon
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey70'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.WZCP0071.*, dbo.Data0008.PROD_CODE, dbo.Data0008.' +
        'PRODUCT_NAME'
      'FROM         dbo.WZCP0071 INNER JOIN'
      
        '                      dbo.Data0008 ON dbo.WZCP0071.prod_ptr = db' +
        'o.Data0008.RKEY'
      'where WZCP0071.so_ptr=:rkey70')
    Left = 592
    Top = 160
    object ADO71rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO71so_ptr: TIntegerField
      FieldName = 'so_ptr'
    end
    object ADO71prod_ptr: TIntegerField
      FieldName = 'prod_ptr'
    end
    object ADO71price: TBCDField
      DisplayLabel = #21333#20215'('#21547#31246')'
      FieldName = 'price'
      Precision = 10
      Size = 2
    end
    object ADO71tax_rate: TBCDField
      DisplayLabel = #31246#29575
      FieldName = 'tax_rate'
      Precision = 4
      Size = 2
    end
    object ADO71complete_date: TDateTimeField
      DisplayLabel = #23436#24037#26085#26399
      FieldName = 'complete_date'
    end
    object ADO71remark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 50
    end
    object ADO71PROD_CODE: TStringField
      DisplayLabel = #24037#31243#32534#30721
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object ADO71PRODUCT_NAME: TStringField
      DisplayLabel = #24037#31243#21517#31216
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADO71quantity: TFloatField
      FieldName = 'quantity'
    end
    object ADO71PARTS_SHIPPED: TFloatField
      FieldName = 'PARTS_SHIPPED'
    end
    object ADO71QTY_PLANED: TFloatField
      FieldName = 'QTY_PLANED'
    end
    object ADO71returen_qty: TFloatField
      FieldName = 'returen_qty'
    end
  end
  object DS1: TDataSource
    DataSet = ADO70
    Left = 536
    Top = 96
  end
  object DS2: TDataSource
    DataSet = ADO71
    Left = 536
    Top = 163
  end
end
