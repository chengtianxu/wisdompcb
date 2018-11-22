object Form1: TForm1
  Left = 217
  Top = 159
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #36864#22238#29289#26009#32473#20379#24212#21830'('#29983#20135#29289#26009#37319#36141#35746#21333')'
  ClientHeight = 448
  ClientWidth = 768
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 39
    Width = 113
    Height = 13
    Alignment = taRightJustify
    Caption = '    '#37319#36141#35746#21333#21495#30721':'
  end
  object Label2: TLabel
    Left = 58
    Top = 66
    Width = 67
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#20379#24212#21830':'
  end
  object Label3: TLabel
    Left = 64
    Top = 93
    Width = 61
    Height = 13
    Alignment = taRightJustify
    Caption = '    '#24037#21378':'
  end
  object Label4: TLabel
    Left = -20
    Top = 124
    Width = 106
    Height = 13
    Alignment = taRightJustify
    Caption = '    '#37319#36141#35746#21333#20449#24687
  end
  object Label5: TLabel
    Left = 399
    Top = 40
    Width = 133
    Height = 13
    Alignment = taRightJustify
    Caption = '    '#20379#24212#21830#35013#36816#22320#28857': '
  end
  object Label6: TLabel
    Left = 419
    Top = 66
    Width = 113
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
    Caption = '    '#30830#35748#21495#30721':'
  end
  object Label8: TLabel
    Left = 419
    Top = 120
    Width = 113
    Height = 13
    Alignment = taRightJustify
    Caption = '    '#20107#29289#22788#29702#26085#26399':'
  end
  object Label9: TLabel
    Left = 10
    Top = 286
    Width = 78
    Height = 13
    Alignment = taRightJustify
    Caption = #24403#21069#24211#23384#20449#24687
  end
  object Label10: TLabel
    Left = 201
    Top = 67
    Width = 7
    Height = 13
  end
  object Label11: TLabel
    Left = 201
    Top = 94
    Width = 7
    Height = 13
  end
  object csi_rkey: TLabel
    Left = 328
    Top = 14
    Width = 7
    Height = 13
    Caption = '1'
    Visible = False
  end
  object db_ptr: TLabel
    Left = 348
    Top = 14
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object vprev: TLabel
    Left = 364
    Top = 14
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
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
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'inv_part_number'
        Title.Caption = #21407#26448#26009#20195#30721
        Width = 182
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'save_meth'
        Title.Caption = #20648#23384#26041#27861
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quan_ord'
        Title.Caption = #24050#35746#36141#30340#25968#37327
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quan_recd'
        Title.Caption = #24050#25509#25910#30340#25968#37327
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_RETN'
        Title.Caption = #24050#36864#36135#25968#37327
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'unit_code'
        Title.Caption = #37319#36141#21333#20301
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REQ_DATE'
        Title.Caption = #35831#27714#26085#26399
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
    Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'inv_part_number'
        Title.Caption = #21407#26448#26009#20195#30721
        Width = 193
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantity'
        Title.Caption = #24050#25509#25910#30340#25968#37327
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quan_on_hand'
        Title.Caption = #24211#23384#25968#37327
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quan_to_be_shipped'
        Title.Caption = #24453#35013#36816#25968#37327
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_RETURNED'
        Title.Caption = #24050#36864#36135#25968#37327
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'unit_code'
        Title.Caption = #23384#36135#21333#20301
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BARCODE_ID'
        Title.Caption = #22791#27880
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tdate'
        Visible = True
      end>
  end
  object Edit1: TEdit
    Left = 129
    Top = 36
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
    Left = 256
    Top = 34
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
    Left = 128
    Top = 62
    Width = 66
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 6
  end
  object Edit3: TEdit
    Left = 128
    Top = 89
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
