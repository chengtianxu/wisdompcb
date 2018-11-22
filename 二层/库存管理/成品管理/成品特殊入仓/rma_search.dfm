object Form3: TForm3
  Left = 254
  Top = 168
  Width = 813
  Height = 508
  Caption = #24453#20837#20179#36864#36135#21333#25628#32034
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 797
    Height = 387
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
        FieldName = 'rma_number'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rma_date'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTY_AUTH'
        ReadOnly = False
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qty_ship'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sales_order'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_name'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_NUMBER'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rma_type'
        ReadOnly = False
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'status'
        ReadOnly = False
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ware_code'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 428
    Width = 797
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      797
      41)
    object Button1: TButton
      Left = 304
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 404
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 797
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 261
      Top = 14
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #36864#36135#21333#21495
    end
    object Edit1: TEdit
      Left = 319
      Top = 10
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
      OnKeyDown = DBGrid1KeyDown
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     TOP (100) PERCENT dbo.Data0098.RMA_NUMBER, dbo.Data00' +
        '98.RMA_DATE, dbo.Data0098.QTY_AUTH,'
      ' dbo.Data0098.QTY_RECD, dbo.Data0098.RMA_STATUS, '
      
        '                      dbo.Data0098.RKEY, dbo.Data0098.CUSTOMER_P' +
        'TR, dbo.Data0098.qty_ship,'
      
        ' dbo.Data0098.CUSTOMER_PART_PTR, dbo.Data0060.SALES_ORDER, data0' +
        '023.abbr_name as abbr_23name,'
      
        '                      dbo.Data0098.SHIPMENT_PTR, dbo.Data0098.SO' +
        '_PTR, dbo.Data0010.ABBR_NAME,'
      
        ' dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC, dbo' +
        '.Data0097.PO_NUMBER,'
      
        ' CASE WHEN data0098.so_ptr IS NULL THEN data0015.warehouse_code ' +
        'ELSE data0015_1.warehouse_code END AS ware_code, '
      
        '                      CASE WHEN data0098.so_ptr IS NULL THEN dat' +
        'a0015.abbr_name ELSE data0015_1.abbr_name END AS abbrname,'
      
        ' CASE WHEN data0098.so_ptr IS NULL THEN data0015.rkey ELSE data0' +
        '015_1.rkey END AS rkey15'
      'FROM         dbo.Data0098 LEFT OUTER JOIN'
      
        '                      dbo.Data0060 ON dbo.Data0098.SO_PTR = dbo.' +
        'Data0060.RKEY INNER JOIN'
      
        '                      dbo.Data0010 ON dbo.Data0098.CUSTOMER_PTR ' +
        '= dbo.Data0010.RKEY INNER JOIN'
      
        '                      dbo.Data0025 ON dbo.Data0098.CUSTOMER_PART' +
        '_PTR = dbo.Data0025.RKEY INNER JOIN'
      
        '                      dbo.Data0015 ON dbo.Data0025.PROD_ROUTE_PT' +
        'R = dbo.Data0015.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0015 AS Data0015_1 ON dbo.Data0060' +
        '.SHIP_REG_TAX_ID = Data0015_1.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDE' +
        'R_PTR = dbo.Data0097.RKEY LEFT OUTER JOIN'
      
        '                     data0023 on data0060.supplier_ptr=data0023.' +
        'rkey'
      'WHERE     (dbo.Data0098.RMA_STATUS = 2)'
      'ORDER BY dbo.Data0098.RMA_NUMBER')
    Left = 610
    Top = 439
    object ADOQuery1rma_number: TStringField
      DisplayLabel = #36864#36135#21333#21495
      FieldName = 'rma_number'
      FixedChar = True
      Size = 10
    end
    object ADOQuery1rma_date: TDateTimeField
      DisplayLabel = #36864#36135#26085#26399
      FieldName = 'rma_date'
    end
    object ADOQuery1QTY_AUTH: TIntegerField
      DisplayLabel = #36864#36135#25968#37327
      FieldName = 'QTY_AUTH'
    end
    object ADOQuery1qty_recd: TIntegerField
      DisplayLabel = #20837#20179#25968#37327
      FieldName = 'qty_recd'
    end
    object ADOQuery1so_ptr: TIntegerField
      FieldName = 'so_ptr'
    end
    object ADOQuery1RMA_STATUS: TSmallintField
      FieldName = 'RMA_STATUS'
    end
    object ADOQuery1rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery1customer_ptr: TIntegerField
      FieldName = 'customer_ptr'
    end
    object ADOQuery1customer_part_ptr: TIntegerField
      FieldName = 'customer_part_ptr'
    end
    object ADOQuery1sales_order: TStringField
      DisplayLabel = #38144#21806#35746#21333
      FieldName = 'sales_order'
      FixedChar = True
      Size = 12
    end
    object ADOQuery1shipment_ptr: TIntegerField
      FieldName = 'shipment_ptr'
    end
    object ADOQuery1rma_type: TStringField
      DisplayLabel = #31867#22411
      FieldKind = fkCalculated
      FieldName = 'rma_type'
      Size = 6
      Calculated = True
    end
    object ADOQuery1status: TStringField
      DisplayLabel = #29366#24577
      FieldKind = fkCalculated
      FieldName = 'status'
      Size = 6
      Calculated = True
    end
    object ADOQuery1abbr_name: TStringField
      DisplayLabel = #23458#25143
      FieldName = 'abbr_name'
      Size = 10
    end
    object ADOQuery1MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOQuery1MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADOQuery1qty_ship: TIntegerField
      DisplayLabel = #38656#34917#20132#25968#37327
      FieldName = 'qty_ship'
    end
    object ADOQuery1PO_NUMBER: TStringField
      DisplayWidth = 25
      FieldName = 'PO_NUMBER'
      Size = 100
    end
    object ADOQuery1ware_code: TStringField
      DisplayLabel = #24037#21378#20195#30721
      FieldName = 'ware_code'
      ReadOnly = True
      Size = 5
    end
    object ADOQuery1abbrname: TStringField
      FieldName = 'abbrname'
      ReadOnly = True
      Size = 10
    end
    object ADOQuery1rkey15: TIntegerField
      FieldName = 'rkey15'
      ReadOnly = True
    end
    object ADOQuery1abbr_23name: TStringField
      FieldName = 'abbr_23name'
      Size = 16
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 576
    Top = 440
  end
end
