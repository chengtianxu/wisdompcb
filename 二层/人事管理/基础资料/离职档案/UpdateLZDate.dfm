object FrmUpdateLZDate: TFrmUpdateLZDate
  Left = 270
  Top = 172
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20462#25913#31163#32844#26085#26399
  ClientHeight = 268
  ClientWidth = 515
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lb_code: TLabel
    Left = 86
    Top = 48
    Width = 24
    Height = 17
    AutoSize = False
    Caption = #24037#21495
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object lb_dept: TLabel
    Left = 62
    Top = 114
    Width = 57
    Height = 17
    AutoSize = False
    Caption = #37096#38376#21517#31216
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object lb_oper: TLabel
    Left = 297
    Top = 82
    Width = 52
    Height = 17
    AutoSize = False
    Caption = #20837#32844#26085#26399
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object lb_1: TLabel
    Left = 86
    Top = 82
    Width = 24
    Height = 17
    AutoSize = False
    Caption = #22995#21517
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object lb_11: TLabel
    Left = 297
    Top = 48
    Width = 57
    Height = 17
    AutoSize = False
    Caption = #31163#32844#26085#26399
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object lb_alt: TLabel
    Left = 297
    Top = 114
    Width = 57
    Height = 17
    AutoSize = False
    Caption = #25805#20316#26085#26399
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object lb_3: TLabel
    Left = 63
    Top = 148
    Width = 57
    Height = 17
    AutoSize = False
    Caption = #31163#32844#31867#22411
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object lb_4: TLabel
    Left = 297
    Top = 142
    Width = 57
    Height = 13
    AutoSize = False
    Caption = #31163#32844#21407#22240
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 62
    Top = 180
    Width = 57
    Height = 17
    AutoSize = False
    Caption = #22791#27880
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object dbt_dept: TDBEdit
    Left = 121
    Top = 110
    Width = 128
    Height = 20
    Color = clSkyBlue
    DataField = 'departmentname'
    DataSource = DM.ds_info
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object dbt_code: TDBEdit
    Left = 121
    Top = 44
    Width = 128
    Height = 20
    Color = clSkyBlue
    DataField = 'employeecode'
    DataSource = DM.ds_info
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object dbt_alt: TDBEdit
    Left = 353
    Top = 76
    Width = 128
    Height = 20
    Color = clSkyBlue
    DataField = 'ondutytime'
    DataSource = DM.ds_info
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object chinesename: TDBEdit
    Left = 121
    Top = 76
    Width = 128
    Height = 20
    Color = clSkyBlue
    DataField = 'chinesename'
    DataSource = DM.ds_info
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object dtp1: TDateTimePicker
    Left = 352
    Top = 43
    Width = 129
    Height = 21
    Date = 40985.000000000000000000
    Time = 40985.000000000000000000
    TabOrder = 4
  end
  object bbt_1: TBitBtn
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 5
    OnClick = bbt_1Click
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
  object bbt_2: TBitBtn
    Left = 84
    Top = 8
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 6
    OnClick = bbt_2Click
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
  object dbt_ondutytime: TDBEdit
    Left = 353
    Top = 108
    Width = 128
    Height = 20
    Color = clSkyBlue
    DataField = 'oper_date'
    DataSource = DM.ds_info
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 7
  end
  object cbb_LZtype: TComboBox
    Left = 123
    Top = 143
    Width = 128
    Height = 20
    Style = csDropDownList
    Color = clSkyBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ItemHeight = 12
    ParentFont = False
    TabOrder = 8
  end
  object cbb_LZrs: TComboBox
    Left = 356
    Top = 139
    Width = 125
    Height = 20
    Style = csDropDownList
    Color = clSkyBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ItemHeight = 12
    ParentFont = False
    TabOrder = 9
  end
  object dbedtremark: TDBEdit
    Left = 122
    Top = 176
    Width = 359
    Height = 20
    Color = clSkyBlue
    DataField = 'remark'
    DataSource = DM.ds_info
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 10
  end
end
