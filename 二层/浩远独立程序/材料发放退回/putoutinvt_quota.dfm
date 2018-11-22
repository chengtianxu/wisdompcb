object Form6: TForm6
  Left = 288
  Top = 163
  BorderStyle = bsSingle
  Caption = #25353#37197#39069#21457#25918#29983#20135#29289#26009
  ClientHeight = 508
  ClientWidth = 715
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 307
    Width = 715
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 489
    Width = 715
    Height = 19
    Panels = <
      item
        Alignment = taRightJustify
        Text = #21457#26009#20154#21592':'
        Width = 70
      end
      item
        Width = 100
      end
      item
        Width = 50
      end>
  end
  object SGrid1: TStringGrid
    Left = 0
    Top = 310
    Width = 715
    Height = 179
    Align = alBottom
    ColCount = 8
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
    PopupMenu = PopupMenu2
    TabOrder = 1
    OnMouseDown = SGrid1MouseDown
    ColWidths = (
      157
      118
      182
      64
      65
      64
      64
      64)
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 119
    Width = 715
    Height = 188
    Align = alClient
    DataSource = DM.DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'INV_PART_NUMBER'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_NAME'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_DESCRIPTION'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'type'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_BOM'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quan_alloc'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_ISSUED'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quan_on_hand'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sotck_type'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ISSUE_DATE'
        Visible = True
      end>
  end
  object SGrid2: TStringGrid
    Left = 152
    Top = 416
    Width = 345
    Height = 65
    ColCount = 4
    FixedCols = 0
    RowCount = 2
    TabOrder = 3
    Visible = False
    ColWidths = (
      64
      64
      64
      64)
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 715
    Height = 119
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    object Label1: TLabel
      Left = 364
      Top = 43
      Width = 59
      Height = 13
      Caption = #20986#20179#21333#21495':'
    end
    object Label2: TLabel
      Left = 44
      Top = 42
      Width = 59
      Height = 13
      Caption = #39046#26009#21333#21495':'
    end
    object Label3: TLabel
      Left = 44
      Top = 98
      Width = 59
      Height = 13
      Caption = #39046#26009#37096#38376':'
    end
    object Label4: TLabel
      Left = 366
      Top = 100
      Width = 59
      Height = 13
      Caption = #39046#26009#20154#21592':'
    end
    object Label5: TLabel
      Left = 70
      Top = 70
      Width = 33
      Height = 13
      Caption = #24037#21378':'
    end
    object Label6: TLabel
      Left = 217
      Top = 70
      Width = 70
      Height = 13
      Caption = '          '
    end
    object Label7: TLabel
      Left = 217
      Top = 98
      Width = 70
      Height = 13
      Caption = '          '
    end
    object Label8: TLabel
      Left = 539
      Top = 100
      Width = 70
      Height = 13
      Caption = '          '
    end
    object Label10: TLabel
      Left = 390
      Top = 73
      Width = 33
      Height = 13
      Caption = #22791#27880':'
    end
    object BitBtn1: TBitBtn
      Left = 4
      Top = 4
      Width = 30
      Height = 30
      TabOrder = 0
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
    object CheckBox1: TCheckBox
      Left = 548
      Top = 40
      Width = 86
      Height = 17
      Caption = #20445#23384#21518#25171#21360
      TabOrder = 1
    end
    object BitBtn2: TBitBtn
      Left = 35
      Top = 4
      Width = 30
      Height = 30
      Hint = #20445#23384#24182#26032#24320#19979#19968#20986#20179#21333
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BitBtn2Click
      OnEnter = BitBtn2Enter
      Glyph.Data = {
        C6050000424DC605000000000000360400002800000014000000140000000100
        08000000000090010000C40E0000C40E0000000100000000000000000000E8E0
        18008868080048484800D8D8E000C8C8C8001078F00070500000B0900800F8F8
        F800A8880800D0D8D800B8A81000A0800800C8D0D000E8E8E80068686800B0A0
        100098700800A8900800D0D0D000D8D8D80090700800B0981000C0A81000E0E0
        E0009878080090680800A0880800D8E0D800B8A01000B0901000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000100000000
        000000130000301A1600000000000000E400F712000035A6FC00770000001300
        0700A7FC7700080613000083A600FC7700000000000035A5FC0077FFFF000000
        6800010000000000000000000000000000000000000000000000000000000000
        31000000000000E2EC0000640000660000004716000078011300000047001600
        780001130000F8461600000000000000C000F7120000C8F3EB007770F5001200
        0000ECFD7F0002000000000000001300AF000000000001000A0000884000F877
        30001A1600000100000000998400E6775400F71200000101010001D8F8001200
        450090FB7700801FF80077FFFF00FFFF6000F8120000AD84E6007760F8001200
        D80084E677000000000000FFFF000000C800E2EC0000C8E2EC00001800000000
        00000000000044F8120000400000000000000000000028F81200000000000000
        00000000000000000000000C000000000200000000000101120000872B00F877
        0000ECFD7F00000000000002000000006C00001A0200381A1600007FFF00FFFF
        000000000000381A1600000500000000870031E6770084F8120000218600E677
        9800F81200006713000010FFFF000000680001000000C8E2EC00000000000000
        7000F8120000ACF8120000D8F8001200100030001000F8400000105F5400E677
        680001000000D0F8120000D8F80012000800000000000E0000000F0505BF05BF
        05BF05BF05BF05BF05BF05BF05C7BF0000000000000000000000000000000000
        00050500E1138CE0E0E0E0E0E0E0E0E0E006BD1B00BFBF00031305050505BF05
        050505050505181B00050500C60705050F050FC70F050FC70FBF011B00BFBF00
        011B05A7C7090383BF0503030305011300050500010705091003050503031003
        0305011B00BFBF00011BBF031005BF03101010101005181300050500010705C7
        0FC709C70FC70FC70F05011300BFBF00011B03171017101710171017101B1B18
        00050500011318131813181B181318131813181300BFBF0001181BC601C618C6
        01C601C60101181800050500E11713000003C210050505050510C61800BFBF00
        01181B000010C705C705BF0FC71718C600050500E113180000100F0505000005
        A717C61800BFBF0001C61B000010C70505000005C71718C600050500E1171300
        00100F05050000050F10C60100BFBF00BD0101000010090F0510100FC7170101
        00E90500000000000300000000000000000000000005C705BF05BF0509E9BF05
        BF05BF05BF05BF05BF09}
    end
    object Edit1: TEdit
      Left = 428
      Top = 39
      Width = 107
      Height = 21
      TabStop = False
      Color = cl3DLight
      MaxLength = 10
      ReadOnly = True
      TabOrder = 3
    end
    object Edit2: TEdit
      Left = 108
      Top = 38
      Width = 108
      Height = 21
      Color = cl3DLight
      MaxLength = 15
      ReadOnly = True
      TabOrder = 4
    end
    object Edit3: TEdit
      Left = 108
      Top = 66
      Width = 72
      Height = 21
      MaxLength = 5
      TabOrder = 5
      OnExit = Edit3Exit
      OnKeyUp = Edit3KeyUp
    end
    object Edit4: TEdit
      Left = 108
      Top = 94
      Width = 72
      Height = 21
      MaxLength = 10
      TabOrder = 6
      OnExit = Edit4Exit
      OnKeyUp = Edit4KeyUp
    end
    object Edit5: TEdit
      Left = 429
      Top = 95
      Width = 72
      Height = 21
      MaxLength = 10
      TabOrder = 7
      OnExit = Edit5Exit
    end
    object BitBtn3: TBitBtn
      Left = 185
      Top = 64
      Width = 25
      Height = 25
      TabOrder = 8
      TabStop = False
      OnClick = BitBtn3Click
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        04000000000078000000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888800000888880000080F000888880F00080F000888880F0008000000080000
        000800F000000F00000800F000800F00000800F000800F000008800000000000
        0088880F00080F000888880000080000088888800088800088888880F08880F0
        888888800088800088888888888888888888}
    end
    object BitBtn4: TBitBtn
      Left = 185
      Top = 92
      Width = 25
      Height = 25
      TabOrder = 9
      TabStop = False
      OnClick = BitBtn4Click
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        04000000000078000000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888800000888880000080F000888880F00080F000888880F0008000000080000
        000800F000000F00000800F000800F00000800F000800F000008800000000000
        0088880F00080F000888880000080000088888800088800088888880F08880F0
        888888800088800088888888888888888888}
    end
    object BitBtn5: TBitBtn
      Left = 507
      Top = 91
      Width = 25
      Height = 25
      TabOrder = 10
      TabStop = False
      OnClick = BitBtn5Click
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        04000000000078000000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888800000888880000080F000888880F00080F000888880F0008000000080000
        000800F000000F00000800F000800F00000800F000800F000008800000000000
        0088880F00080F000888880000080000088888800088800088888880F08880F0
        888888800088800088888888888888888888}
    end
    object Edit7: TEdit
      Left = 428
      Top = 69
      Width = 205
      Height = 21
      MaxLength = 40
      TabOrder = 11
    end
    object BitBtn6: TBitBtn
      Left = 222
      Top = 35
      Width = 25
      Height = 25
      TabOrder = 12
      TabStop = False
      OnClick = BitBtn6Click
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        04000000000078000000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888800000888880000080F000888880F00080F000888880F0008000000080000
        000800F000000F00000800F000800F00000800F000800F000008800000000000
        0088880F00080F000888880000080000088888800088800088888880F08880F0
        888888800088800088888888888888888888}
    end
    object BitBtn7: TBitBtn
      Left = 637
      Top = 92
      Width = 75
      Height = 25
      Caption = #33258#21160#21457#25918
      Enabled = False
      TabOrder = 13
      OnClick = BitBtn7Click
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 232
    Top = 184
    object N1: TMenuItem
      Caption = #21457#25918
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #21457#25918#23436#27605
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #37325#26032#29983#25928
      OnClick = N3Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object N6: TMenuItem
      Caption = #25353#20998#37197#21457#25918
      OnClick = N6Click
    end
    object N7: TMenuItem
      Caption = #21462#28040#20998#37197#21457#25918
      OnClick = N7Click
    end
  end
  object Timer1: TTimer
    Interval = 10000
    OnTimer = Timer1Timer
    Left = 56
    Top = 368
  end
  object PopupMenu2: TPopupMenu
    OnPopup = PopupMenu2Popup
    Left = 96
    Top = 392
    object N4: TMenuItem
      Caption = #21024#38500
      OnClick = N4Click
    end
  end
end
