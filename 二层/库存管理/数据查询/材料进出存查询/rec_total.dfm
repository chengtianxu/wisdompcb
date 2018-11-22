object Form6: TForm6
  Left = 254
  Top = 177
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
    object Edit3: TEdit
      Left = 367
      Top = 11
      Width = 152
      Height = 21
      Anchors = [akTop]
      TabOrder = 0
      OnChange = Edit3Change
    end
    object BitBtn1: TBitBtn
      Left = 16
      Top = 5
      Width = 57
      Height = 30
      Cursor = crHandPoint
      Hint = #36864#20986
      Caption = #36864#20986
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BitBtn1Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
    end
    object BitBtn4: TBitBtn
      Left = 74
      Top = 5
      Width = 57
      Height = 30
      Hint = #23548#20986#25968#25454'Excel'
      Caption = #23548#20986
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BitBtn4Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DADADADADADA
        DADAADADADADADADADADDADADADADAD00000000000000006666007777777706E
        EF0AA0E6666606EEF0ADDA0E66606EEF060AADA0E606EEF0000DDADA006EEF0A
        DADAADAD06EEF00DADADDAD06EEF0670DADAAD06EEF0E6670DADD06EEF0A0E66
        70DA0FFFF0ADA0EEEE0D00000ADADA00000AADADADADADADADAD}
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 810
    Height = 405
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
        FieldName = 'std_price'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'std_notaxprice'
        Width = 107
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
    Prepared = True
    SQL.Strings = (
      'SELECT Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME,'
      '      dbo.Data0017.INV_DESCRIPTION, dbo.Data0002.UNIT_NAME, '
      '      dbo.Data0496.GROUP_DESC, dbo.Data0023.ABBR_NAME, '
      '      SUM(dbo.Data0022.QUANTITY ) AS total_received, '
      
        'ROUND(SUM(Data0022.QUANTITY * Data0022.tax_PRICE * Data0456.EXCH' +
        '_RATE), 3)'
      '                                       AS std_price,'
      
        'ROUND(SUM(Data0022.QUANTITY * Data0022.tax_PRICE * Data0456.EXCH' +
        '_RATE/'
      '          (1+data0022.tax_2*0.01)), 3) AS std_notaxprice,'
      '      data0019.inv_group_name, Data0017.STOCK_SELL,'
      
        '      SUM(dbo.Data0022.QUANTITY * dbo.Data0022.STOCK_BASE) AS to' +
        'tal_weight,'
      
        'ROUND(SUM(Data0022.QUANTITY * Data0017.STOCK_SELL), 4) AS total_' +
        'area'
      'FROM dbo.Data0456 INNER JOIN'
      '      dbo.data0019 INNER JOIN'
      '      dbo.Data0022 INNER JOIN'
      '      dbo.Data0017 INNER JOIN'
      
        '      dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY' +
        ' ON'
      '      dbo.Data0022.INVENTORY_PTR = dbo.Data0017.RKEY ON'
      '      dbo.data0019.rkey = dbo.Data0496.GROUP_PTR ON'
      '      dbo.Data0456.RKEY = dbo.Data0022.GRN_PTR INNER JOIN'
      
        '      dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0002 ON dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0' +
        '002.RKEY'
      'WHERE (dbo.Data0022.QUANTITY <> 0)'
      'GROUP BY Data0017.INV_PART_NUMBER, Data0017.INV_NAME,'
      '      Data0017.INV_DESCRIPTION, Data0496.GROUP_DESC,'
      '      Data0023.ABBR_NAME, Data0002.UNIT_NAME, Data0017.STD_COST,'
      '      data0019.inv_group_name,'
      '      Data0017.STOCK_SELL'
      'ORDER BY Data0017.INV_PART_NUMBER')
    Left = 258
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
      Size = 16
    end
    object adotota22total_received: TFloatField
      DisplayLabel = #25509#25910#25968#37327
      DisplayWidth = 14
      FieldName = 'total_received'
    end
    object adotota22std_price: TBCDField
      DisplayLabel = #37329#39069'('#26412#24065#21547#31246')'
      DisplayWidth = 20
      FieldName = 'std_price'
      ReadOnly = True
      Precision = 32
      Size = 16
    end
    object adotota22std_notaxprice: TBCDField
      DisplayLabel = #37329#39069'('#26412#24065#19981#21547#31246')'
      DisplayWidth = 20
      FieldName = 'std_notaxprice'
      ReadOnly = True
      Precision = 32
      Size = 8
    end
    object adotota22STOCK_SELL: TFloatField
      DisplayLabel = #21333#20301#38754#31215
      FieldName = 'STOCK_SELL'
    end
    object adotota22total_weight: TFloatField
      DisplayLabel = #25509#25910#37325#37327'(Kg)'
      FieldName = 'total_weight'
    end
    object adotota22total_area: TFloatField
      DisplayLabel = #25509#25910#38754#31215
      FieldName = 'total_area'
      ReadOnly = True
    end
  end
end
