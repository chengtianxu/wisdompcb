object Form1: TForm1
  Left = 196
  Top = 155
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #36864#22238#29289#26009#32473#20379#24212#21830'('#38750#29983#20135#29289#26009#37319#36141#35746#21333')'
  ClientHeight = 448
  ClientWidth = 768
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 83
    Top = 41
    Width = 87
    Height = 13
    Alignment = taRightJustify
    Caption = '    '#37319#36141#35746#21333#21495#30721':'
  end
  object Label2: TLabel
    Left = 122
    Top = 68
    Width = 48
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#20379#24212#21830':'
  end
  object Label3: TLabel
    Left = 131
    Top = 95
    Width = 39
    Height = 13
    Alignment = taRightJustify
    Caption = '    '#24037#21378':'
  end
  object Label4: TLabel
    Left = 2
    Top = 124
    Width = 84
    Height = 13
    Alignment = taRightJustify
    Caption = '    '#37319#36141#35746#21333#20449#24687
  end
  object Label5: TLabel
    Left = 430
    Top = 40
    Width = 102
    Height = 13
    Alignment = taRightJustify
    Caption = '    '#20379#24212#21830#35013#36816#22320#28857': '
  end
  object Label6: TLabel
    Left = 445
    Top = 66
    Width = 87
    Height = 13
    Alignment = taRightJustify
    Caption = '    '#37319#36141#35746#21333#26085#26399':'
  end
  object Label7: TLabel
    Left = 445
    Top = 93
    Width = 87
    Height = 13
    Alignment = taRightJustify
    Caption = '    '#26368#21518#30830#35748#20154#21592':'
  end
  object Label8: TLabel
    Left = 445
    Top = 120
    Width = 87
    Height = 13
    Alignment = taRightJustify
    Caption = '    '#20107#29289#22788#29702#26085#26399':'
  end
  object Label9: TLabel
    Left = 4
    Top = 286
    Width = 84
    Height = 13
    Alignment = taRightJustify
    Caption = '    '#19994#21153#22788#29702#20449#24687
  end
  object Label10: TLabel
    Left = 246
    Top = 69
    Width = 3
    Height = 13
  end
  object Label11: TLabel
    Left = 246
    Top = 96
    Width = 3
    Height = 13
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 8
    Width = 29
    Height = 28
    Hint = #36864#20986
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TabStop = False
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
  object DBGrid1: TDBGrid
    Left = -1
    Top = 142
    Width = 768
    Height = 136
    DataSource = DM.DataSource1
    Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DESCRIPTION'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GUI_GE'
        Width = 166
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPTION2'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_ORD'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTITY_RECEIVED'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_RETN'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEL_DATE'
        Width = 72
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 304
    Width = 768
    Height = 144
    Align = alBottom
    DataSource = DM.DataSource2
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'GRN_NUMBER'
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATE_RECD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_RECD'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_ON_HAND'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quan_to_ship'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quan_returned'
        Width = 114
        Visible = True
      end>
  end
  object Edit1: TEdit
    Left = 174
    Top = 38
    Width = 121
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Edit1Click
    OnExit = Edit1Exit
  end
  object BitBtn2: TBitBtn
    Left = 301
    Top = 36
    Width = 25
    Height = 25
    TabOrder = 2
    TabStop = False
    OnClick = BitBtn2Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
      333333777777777F33333330B00000003333337F7777777F3333333000000000
      333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
      333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
      03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
      03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
      3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
      333333333377F7F33333333333330F03333333333337F7F33333333333330B03
      3333333333373733333333333333303333333333333373333333}
    NumGlyphs = 2
  end
  object MaskEdit1: TMaskEdit
    Left = 536
    Top = 115
    Width = 72
    Height = 21
    EditMask = '!9999-!99-99;1;_'
    MaxLength = 10
    TabOrder = 3
    Text = '    -  -  '
    OnExit = MaskEdit1Exit
  end
  object Edit2: TEdit
    Left = 173
    Top = 64
    Width = 66
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 6
  end
  object Edit3: TEdit
    Left = 173
    Top = 91
    Width = 66
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 7
  end
  object Edit4: TEdit
    Left = 536
    Top = 36
    Width = 209
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 8
  end
  object Edit5: TEdit
    Left = 536
    Top = 62
    Width = 121
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 9
  end
  object Edit6: TEdit
    Left = 536
    Top = 88
    Width = 210
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 10
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 352
    Top = 88
    object N1: TMenuItem
      Caption = #36864#36135
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #21024#38500'/'#26816#26597
      OnClick = N2Click
    end
  end
end
