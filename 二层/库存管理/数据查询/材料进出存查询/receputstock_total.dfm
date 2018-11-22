object Form8: TForm8
  Left = 235
  Top = 144
  Width = 851
  Height = 546
  Caption = #26448#26009#36827#20986#23384#27719#24635#34920
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 50
    Width = 835
    Height = 458
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'inv_group_name'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_PART_NUMBER'
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_name'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_DESCRIPTION'
        Width = 203
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GROUP_NAME'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STD_COST'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'begstock'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'begstock_money'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'received'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'received_money'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'extend'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'extend_money'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quan_returen'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'amount_returen'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quan_scrap'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'amount_csrap'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'stock'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'amount'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STOCK_BASE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'totol_hight'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'totol_mianji'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 835
    Height = 50
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 142
      Top = 25
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Caption = '  '#21512#35745':'
    end
    object Label2: TLabel
      Left = 195
      Top = 4
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '   '#26399#21021#24211#23384#37329#39069
    end
    object Label3: TLabel
      Left = 293
      Top = 4
      Width = 86
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '   '#26412#26399#25509#25910#37329#39069
    end
    object Label4: TLabel
      Left = 715
      Top = 4
      Width = 94
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '   '#26399#26410#24211#23384#37329#39069
    end
    object Label5: TLabel
      Left = 397
      Top = 4
      Width = 89
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '   '#26412#26399#21457#25918#37329#39069
    end
    object Label6: TLabel
      Left = 509
      Top = 4
      Width = 89
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '   '#26412#26399#36864#36135#37329#39069
    end
    object Label7: TLabel
      Left = 610
      Top = 4
      Width = 89
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '   '#26412#26399#25253#24223#37329#39069
    end
    object Edit1: TEdit
      Left = 193
      Top = 22
      Width = 94
      Height = 21
      TabStop = False
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 0
      Text = 'Edit1'
    end
    object Edit2: TEdit
      Left = 289
      Top = 22
      Width = 103
      Height = 21
      TabStop = False
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 1
      Text = 'Edit2'
    end
    object Edit3: TEdit
      Left = 395
      Top = 22
      Width = 106
      Height = 21
      TabStop = False
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 2
      Text = 'Edit3'
    end
    object Edit4: TEdit
      Left = 721
      Top = 22
      Width = 106
      Height = 21
      TabStop = False
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 3
      Text = 'Edit4'
    end
    object Edit5: TEdit
      Left = 504
      Top = 22
      Width = 106
      Height = 21
      TabStop = False
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 4
      Text = 'Edit5'
    end
    object Edit6: TEdit
      Left = 612
      Top = 22
      Width = 106
      Height = 21
      TabStop = False
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 5
      Text = 'Edit6'
    end
    object BitBtn1: TBitBtn
      Left = 16
      Top = 9
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
      TabOrder = 6
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
      Left = 75
      Top = 9
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
      TabOrder = 7
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
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 72
    Top = 113
  end
  object ADOTable1: TADOTable
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterOpen = ADOTable1AfterOpen
    OnCalcFields = ADOTable1CalcFields
    TableName = 'received_extend_stock_total'
    Left = 104
    Top = 113
    object ADOTable1rkey: TIntegerField
      FieldName = 'rkey'
    end
    object ADOTable1INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#20195#30721
      DisplayWidth = 24
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADOTable1INV_name: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_name'
      Size = 30
    end
    object ADOTable1INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ADOTable1UNIT_NAME: TStringField
      DisplayLabel = #23384#36135#21333#20301
      DisplayWidth = 17
      FieldName = 'UNIT_NAME'
    end
    object ADOTable1GROUP_NAME: TStringField
      DisplayLabel = #26448#26009#31867#21035
      DisplayWidth = 15
      FieldName = 'GROUP_NAME'
      Size = 10
    end
    object ADOTable1inv_group_name: TStringField
      DisplayLabel = #26448#26009#32452#21035
      FieldName = 'inv_group_name'
    end
    object ADOTable1STD_COST: TFloatField
      DisplayLabel = #26631#20934#25104#26412
      DisplayWidth = 12
      FieldName = 'STD_COST'
    end
    object ADOTable1begstock: TFloatField
      DisplayLabel = #26399#21021#24211#23384
      FieldKind = fkCalculated
      FieldName = 'begstock'
      Calculated = True
    end
    object ADOTable1begstock_money: TCurrencyField
      DisplayLabel = #26399#21021#24211#23384#37329#39069
      FieldKind = fkCalculated
      FieldName = 'begstock_money'
      DisplayFormat = '0.000'
      currency = False
      Calculated = True
    end
    object ADOTable1received: TFloatField
      DisplayLabel = #26412#26399#25509#25910
      DisplayWidth = 12
      FieldName = 'received'
    end
    object ADOTable1received_money: TFloatField
      DisplayLabel = #25509#25910#37329#39069
      DisplayWidth = 16
      FieldName = 'received_money'
    end
    object ADOTable1extend: TFloatField
      DisplayLabel = #26412#26399#21457#25918
      DisplayWidth = 12
      FieldName = 'extend'
    end
    object ADOTable1extend_money: TFloatField
      DisplayLabel = #21457#25918#37329#39069
      DisplayWidth = 14
      FieldName = 'extend_money'
    end
    object ADOTable1stock: TFloatField
      DisplayLabel = #26399#26410#24211#23384
      FieldName = 'stock'
    end
    object ADOTable1amount: TFloatField
      DisplayLabel = #26399#26410#24211#23384#37329#39069
      FieldName = 'amount'
    end
    object ADOTable1ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object ADOTable1STOCK_SELL: TFloatField
      DisplayLabel = #26631#20934#38754#31215
      FieldName = 'STOCK_SELL'
    end
    object ADOTable1STOCK_BASE: TFloatField
      DisplayLabel = #26631#20934#21333#37325
      FieldName = 'STOCK_BASE'
    end
    object ADOTable1totol_hight: TFloatField
      DisplayLabel = #24211#23384#24635#37325
      FieldName = 'totol_hight'
      ReadOnly = True
    end
    object ADOTable1totol_mianji: TFloatField
      DisplayLabel = #24211#23384#38754#31215
      FieldName = 'totol_mianji'
      ReadOnly = True
    end
    object ADOTable1quan_returen: TFloatField
      DisplayLabel = #26412#26399#36864#36135
      FieldName = 'quan_returen'
    end
    object ADOTable1amount_returen: TFloatField
      DisplayLabel = #36864#36135#37329#39069
      FieldName = 'amount_returen'
    end
    object ADOTable1quan_scrap: TFloatField
      DisplayLabel = #26412#26399#25253#24223
      FieldName = 'quan_scrap'
    end
    object ADOTable1amount_csrap: TFloatField
      DisplayLabel = #25253#24223#37329#39069
      FieldName = 'amount_csrap'
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 40
    Top = 112
    object N3: TMenuItem
      Caption = #25353#32452#21035#36807#28388
      OnClick = N3Click
    end
    object N1: TMenuItem
      Caption = #25353#31867#21035#36807#28388
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #25353#26448#26009#21517#31216#36807#28388
      OnClick = N2Click
    end
  end
end
