object Form6: TForm6
  Left = 198
  Top = 185
  Width = 818
  Height = 480
  Caption = #26448#26009#25509#25910#27719#24635
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 810
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      810
      41)
    object Label3: TLabel
      Left = 306
      Top = 14
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop]
      Caption = #26448#26009#32534#30721
    end
    object Button1: TButton
      Left = 40
      Top = 8
      Width = 75
      Height = 25
      Caption = #36864#20986
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 120
      Top = 8
      Width = 75
      Height = 25
      Caption = #23548#20986'Excel'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Edit3: TEdit
      Left = 367
      Top = 11
      Width = 152
      Height = 21
      Anchors = [akTop]
      TabOrder = 2
      OnChange = Edit3Change
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 810
    Height = 412
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'inv_group_name'
        ReadOnly = False
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_PART_NUMBER'
        ReadOnly = False
        Width = 135
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_NAME'
        ReadOnly = False
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_DESCRIPTION'
        ReadOnly = False
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        ReadOnly = False
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GROUP_DESC'
        ReadOnly = False
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        ReadOnly = False
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total_received'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cost'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'std_price'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STOCK_BASE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total_weight'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STOCK_SELL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total_area'
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = adotota22
    Left = 224
    Top = 8
  end
  object adotota22: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'SELECT TOP 100 PERCENT dbo.Data0017.INV_PART_NUMBER, dbo.Data001' +
        '7.INV_NAME, '
      '      dbo.Data0017.INV_DESCRIPTION, dbo.Data0002.UNIT_NAME, '
      '      dbo.Data0496.GROUP_DESC, dbo.Data0023.ABBR_NAME, '
      
        '      SUM(dbo.Data0022.QUANTITY - dbo.Data0022.QUAN_RETURNED) AS' +
        ' total_received, '
      '      ROUND(dbo.Data0017.STD_COST, 3) AS cost, '
      
        '      ROUND(SUM((dbo.Data0022.QUANTITY - dbo.Data0022.QUAN_RETUR' +
        'NED) '
      
        '      * Data0022.PRICE * Data0022.EXCHANGE_RATE), 3) AS std_pric' +
        'e,'
      '      data0019.inv_group_name, dbo.Data0017.STOCK_BASE,'
      '      Data0017.STOCK_SELL,'
      '      SUM((dbo.Data0022.QUANTITY - dbo.Data0022.QUAN_RETURNED) '
      '      * dbo.Data0017.STOCK_BASE) AS total_weight, '
      
        '      ROUND(SUM((dbo.Data0022.QUANTITY - dbo.Data0022.QUAN_RETUR' +
        'NED) '
      '      * dbo.Data0017.STOCK_SELL / 144), 4) AS total_area'
      'FROM dbo.Data0456 INNER JOIN'
      '      dbo.data0019 INNER JOIN'
      '      dbo.Data0022 INNER JOIN'
      '      dbo.Data0017 INNER JOIN'
      
        '      dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY' +
        ' ON '
      '      dbo.Data0022.INVENTORY_PTR = dbo.Data0017.RKEY ON '
      '      dbo.data0019.rkey = dbo.Data0496.GROUP_PTR ON '
      '      dbo.Data0456.RKEY = dbo.Data0022.GRN_PTR INNER JOIN'
      
        '      dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0002 ON dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0' +
        '002.RKEY'
      'WHERE (dbo.Data0022.QUANTITY <> 0)'
      'GROUP BY Data0017.INV_PART_NUMBER, Data0017.INV_NAME,'
      '      Data0017.INV_DESCRIPTION, Data0496.GROUP_DESC,'
      '      Data0023.ABBR_NAME, Data0002.UNIT_NAME, Data0017.STD_COST,'
      '      data0019.inv_group_name, Data0017.STOCK_BASE,'
      '      Data0017.STOCK_SELL'
      'ORDER BY Data0017.INV_PART_NUMBER')
    Left = 256
    Top = 8
    object adotota22INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      DisplayWidth = 24
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object adotota22INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      DisplayWidth = 20
      FieldName = 'INV_NAME'
      Size = 30
    end
    object adotota22INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      DisplayWidth = 20
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object adotota22inv_group_name: TStringField
      DisplayLabel = #26448#26009#32452#21035
      FieldName = 'inv_group_name'
    end
    object adotota22GROUP_DESC: TStringField
      DisplayLabel = #26448#26009#31867#21035
      DisplayWidth = 17
      FieldName = 'GROUP_DESC'
      Size = 30
    end
    object adotota22UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      DisplayWidth = 12
      FieldName = 'UNIT_NAME'
    end
    object adotota22ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      DisplayWidth = 12
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object adotota22total_received: TFloatField
      DisplayLabel = #25509#25910#25968#37327
      DisplayWidth = 14
      FieldName = 'total_received'
    end
    object adotota22cost: TFloatField
      DisplayLabel = #26631#20934#25104#26412
      DisplayWidth = 16
      FieldName = 'cost'
      DisplayFormat = '0.000'
    end
    object adotota22std_price: TBCDField
      DisplayLabel = #37329#39069'('#20307#20301#24065')'
      FieldName = 'std_price'
      ReadOnly = True
      Precision = 32
      Size = 16
    end
    object adotota22STOCK_BASE: TFloatField
      DisplayLabel = #21333#20301#37325#37327'(Kg)'
      FieldName = 'STOCK_BASE'
    end
    object adotota22STOCK_SELL: TFloatField
      DisplayLabel = #21333#20301#38754#31215'('#24179#26041#33521#23544')'
      FieldName = 'STOCK_SELL'
    end
    object adotota22total_weight: TFloatField
      DisplayLabel = #25509#25910#37325#37327'(Kg)'
      FieldName = 'total_weight'
    end
    object adotota22total_area: TFloatField
      DisplayLabel = #25509#25910#38754#31215'('#24179#26041#33521#23610')'
      FieldName = 'total_area'
      ReadOnly = True
    end
  end
end
