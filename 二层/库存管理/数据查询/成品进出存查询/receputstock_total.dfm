object Form8: TForm8
  Left = 212
  Top = 118
  Width = 812
  Height = 566
  Caption = #20135#25104#21697#36827#20986#23384#27719#24635#34920
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 49
    Width = 804
    Height = 490
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
        FieldName = 'manu_PART_NUMBER'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'manu_PART_DESC'
        Width = 174
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROD_CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'unit_sq'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'begstock'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'begstock_mianqi'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rece_total'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mianqi'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ext_total'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ext_mianqi'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 't_quantity'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 't_mianqi'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantity_hand'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'stock_mianqi'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 804
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 208
      Top = 24
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Caption = '  '#21512#35745':'
    end
    object Label2: TLabel
      Left = 254
      Top = 3
      Width = 106
      Height = 13
      Alignment = taRightJustify
      Caption = '    '#26399#21021#24211#23384#38754#31215
    end
    object Label3: TLabel
      Left = 392
      Top = 4
      Width = 91
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '   '#26412#26399#25509#25910#38754#31215
    end
    object Label4: TLabel
      Left = 648
      Top = 5
      Width = 93
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '   '#26399#26410#24211#23384#38754#31215
    end
    object Label5: TLabel
      Left = 528
      Top = 5
      Width = 90
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '   '#26412#26399#21457#25918#38754#31215
    end
    object Edit1: TEdit
      Left = 268
      Top = 21
      Width = 121
      Height = 21
      TabStop = False
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 0
      Text = 'Edit1'
    end
    object Edit2: TEdit
      Left = 393
      Top = 22
      Width = 121
      Height = 21
      TabStop = False
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 1
      Text = 'Edit2'
    end
    object Edit3: TEdit
      Left = 519
      Top = 22
      Width = 121
      Height = 21
      TabStop = False
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 2
      Text = 'Edit3'
    end
    object Edit4: TEdit
      Left = 645
      Top = 22
      Width = 121
      Height = 21
      TabStop = False
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 3
      Text = 'Edit4'
    end
    object BitBtn1: TBitBtn
      Left = 13
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
      TabOrder = 4
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
      Left = 71
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
      TabOrder = 5
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
    Left = 80
    Top = 152
  end
  object ADOTable1: TADOTable
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = ADOTable1CalcFields
    TableName = 'partrece_ext_stock_total'
    Left = 112
    Top = 152
    object ADOTable1CUSTOMER_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'manu_PART_NUMBER'
    end
    object ADOTable1CUSTOMER_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'manu_PART_DESC'
      Size = 40
    end
    object ADOTable1ABBR_NAME: TStringField
      DisplayLabel = #23458#25143
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOTable1PROD_CODE: TStringField
      DisplayLabel = #20135#21697#31867#22411
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object ADOTable1PARAMETER_VALUE: TFloatField
      DisplayLabel = #21333#20803#38754#31215
      FieldName = 'unit_sq'
    end
    object ADOTable1begstock: TFloatField
      DisplayLabel = #26399#21021#24211#23384
      FieldKind = fkCalculated
      FieldName = 'begstock'
      Calculated = True
    end
    object ADOTable1begstock_mianqi: TFloatField
      DisplayLabel = #26399#21021#24211#23384#38754#31215
      FieldKind = fkCalculated
      FieldName = 'begstock_mianqi'
      DisplayFormat = '0.0000'
      Calculated = True
    end
    object ADOTable1rece_total: TFloatField
      DisplayLabel = #26412#26399#25509#25910
      FieldName = 'rece_total'
    end
    object ADOTable1mianqi: TFloatField
      DisplayLabel = #25509#25910#38754#31215
      FieldName = 'mianqi'
    end
    object ADOTable1ext_total: TFloatField
      DisplayLabel = #26412#26399#21457#25918
      FieldName = 'ext_total'
    end
    object ADOTable1ext_mianqi: TFloatField
      DisplayLabel = #21457#25918#38754#31215
      FieldName = 'ext_mianqi'
    end
    object ADOTable1quantity_hand: TFloatField
      DisplayLabel = #26399#26410#24211#23384
      FieldName = 'quantity_hand'
    end
    object ADOTable1stock_mianqi: TFloatField
      DisplayLabel = #24211#23384#38754#31215
      FieldName = 'stock_mianqi'
      ReadOnly = True
    end
    object ADOTable1t_quantity: TIntegerField
      DisplayLabel = #29305#27530#20986#20179
      FieldName = 't_quantity'
    end
    object ADOTable1t_mianqi: TFloatField
      DisplayLabel = #29305#27530#20986#20179#38754#31215
      FieldName = 't_mianqi'
      ReadOnly = True
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 48
    Top = 152
    object N3: TMenuItem
      Caption = #25353#23458#25143#36807#28388
      OnClick = N3Click
    end
    object N1: TMenuItem
      Caption = #25353#20135#21697#31867#22411#36807#28388
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #25353#25353#20135#21697#20195#30721#36807#28388
      OnClick = N2Click
    end
  end
end
