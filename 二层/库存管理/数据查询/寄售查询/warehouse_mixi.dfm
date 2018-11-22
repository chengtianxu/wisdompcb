object Form9: TForm9
  Left = 216
  Top = 143
  Width = 787
  Height = 556
  Caption = #25104#21697#24211#23384#26126#32454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 779
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 258
      Top = 16
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = #26412#21378#32534#21495':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Button1: TButton
      Left = 12
      Top = 7
      Width = 75
      Height = 25
      Caption = #36864#20986
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 92
      Top = 7
      Width = 75
      Height = 25
      Caption = #23548#20986'Excel'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Edit1: TEdit
      Left = 326
      Top = 12
      Width = 117
      Height = 21
      TabOrder = 2
      OnChange = Edit1Change
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 779
    Height = 488
    Align = alClient
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'MANU_PART_NUMBER'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Width = 137
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANALYSIS_CODE_2'
        Width = 167
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALES_ORDER'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        Width = 127
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROD_CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUCT_NAME'
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTITY'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTY_ON_HAND'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'unit_sq'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inArea'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MFG_DATE'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRICE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAX_RATE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'delivery_no'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHIP_PTR'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUST_CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUSTOMER_NAME'
        Width = 132
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_CODE'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXCH_RATE'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REMARK'
        Width = 111
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADO53
    OnDataChange = DataSource1DataChange
    Left = 216
    Top = 488
  end
  object ADO53: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     TOP (100) PERCENT dbo.Data0060.SALES_ORDER, dbo.DATA0' +
        '153.PO_NUMBER, dbo.Data0008.PROD_CODE, dbo.Data0008.PRODUCT_NAME' +
        ', '
      
        '                      dbo.Data0025.MANU_PART_NUMBER, dbo.Data002' +
        '5.MANU_PART_DESC, dbo.DATA0153.QUANTITY, dbo.Data0005.EMPLOYEE_N' +
        'AME, '
      
        '                      dbo.DATA0153.MFG_DATE, dbo.DATA0153.REMARK' +
        ', dbo.DATA0153.PRICE, dbo.DATA0153.TAX_RATE, dbo.Data0010.CUST_C' +
        'ODE, '
      
        '                      dbo.Data0010.CUSTOMER_NAME, dbo.Data0010.A' +
        'BBR_NAME, dbo.Data0001.CURR_CODE, dbo.Data0001.CURR_NAME, dbo.DA' +
        'TA0153.EXCH_RATE, '
      
        '                      dbo.DATA0153.QTY_ON_HAND, dbo.Data0025.ANA' +
        'LYSIS_CODE_2, dbo.data0439.delivery_no, dbo.Data0025.unit_sq, '
      
        '                      dbo.DATA0153.QTY_ON_HAND * dbo.Data0025.un' +
        'it_sq AS inArea, dbo.DATA0153.SHIP_PTR'
      'FROM         dbo.DATA0153 INNER JOIN'
      
        '                      dbo.Data0025 ON dbo.DATA0153.CUSTPART_PTR ' +
        '= dbo.Data0025.RKEY INNER JOIN'
      
        '                      dbo.Data0001 ON dbo.DATA0153.CURRENCY_PTR ' +
        '= dbo.Data0001.RKEY INNER JOIN'
      
        '                      dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR' +
        ' = dbo.Data0008.RKEY INNER JOIN'
      
        '                      dbo.Data0010 ON dbo.DATA0153.CUSTOMER_PTR ' +
        '= dbo.Data0010.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0005 ON dbo.DATA0153.EMPL_PTR = db' +
        'o.Data0005.RKEY LEFT OUTER JOIN'
      '                      dbo.Data0060 INNER JOIN'
      
        '                      dbo.Data0064 ON dbo.Data0060.RKEY = dbo.Da' +
        'ta0064.SO_PTR ON dbo.DATA0153.SHIP_PTR = dbo.Data0064.RKEY LEFT ' +
        'OUTER JOIN'
      
        '                      dbo.data0439 ON dbo.data0439.rkey = dbo.Da' +
        'ta0064.packing_list_ptr'
      'WHERE     (dbo.DATA0153.QTY_ON_HAND > 0)'
      
        'ORDER BY dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_D' +
        'ESC')
    Left = 248
    Top = 488
    object ADO53SALES_ORDER: TStringField
      DisplayLabel = #35746#21333#32534#21495
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ADO53PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#35746#21333#21495
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ADO53PROD_CODE: TStringField
      DisplayLabel = #20135#21697#31867#22411#20195#30721
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object ADO53PRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#31867#22411#21517#31216
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADO53MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADO53MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADO53QUANTITY: TIntegerField
      DisplayLabel = #20837#24211#25968#37327
      FieldName = 'QUANTITY'
    end
    object ADO53QTY_ON_HAND: TIntegerField
      DisplayLabel = #24211#23384#25968#37327
      FieldName = 'QTY_ON_HAND'
    end
    object ADO53EMPLOYEE_NAME: TStringField
      DisplayLabel = #20837#24211#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADO53MFG_DATE: TDateTimeField
      DisplayLabel = #20837#24211#26085#26399
      FieldName = 'MFG_DATE'
    end
    object ADO53REMARK: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REMARK'
      Size = 100
    end
    object ADO53PRICE: TBCDField
      DisplayLabel = #20837#24211#20215#26684'('#19981#21547#31246')'
      FieldName = 'PRICE'
      Precision = 12
      Size = 6
    end
    object ADO53TAX_RATE: TBCDField
      DisplayLabel = #31246#29575'(%)'
      FieldName = 'TAX_RATE'
      Precision = 5
      Size = 2
    end
    object ADO53CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADO53CUSTOMER_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object ADO53ABBR_NAME: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADO53CURR_CODE: TStringField
      DisplayLabel = #36135#24065#20195#30721
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADO53CURR_NAME: TStringField
      DisplayLabel = #36135#24065#21517#31216
      FieldName = 'CURR_NAME'
    end
    object ADO53EXCH_RATE: TBCDField
      DisplayLabel = #27719#29575
      FieldName = 'EXCH_RATE'
      Precision = 12
      Size = 8
    end
    object ADO53ANALYSIS_CODE_2: TStringField
      DisplayLabel = #23458#25143#29289#26009#21495
      FieldName = 'ANALYSIS_CODE_2'
      Size = 50
    end
    object ADO53delivery_no: TStringField
      DisplayLabel = #35013#31665#21333#21495
      FieldName = 'delivery_no'
      Size = 10
    end
    object ADO53unit_sq: TFloatField
      DisplayLabel = #21333#21482#38754#31215'('#13217')'
      FieldName = 'unit_sq'
    end
    object ADO53inArea: TFloatField
      DisplayLabel = #24211#23384#38754#31215'('#13217')'
      FieldName = 'inArea'
      ReadOnly = True
    end
    object ADO53SHIP_PTR: TIntegerField
      DisplayLabel = #35760#24405#21495
      FieldName = 'SHIP_PTR'
    end
  end
end
