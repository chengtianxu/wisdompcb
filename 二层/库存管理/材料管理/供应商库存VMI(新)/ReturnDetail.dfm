object Form_ReturnDetail: TForm_ReturnDetail
  Left = 323
  Top = 181
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20379#24212#21830#36864#36135#26126#32454
  ClientHeight = 257
  ClientWidth = 667
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel
    Left = 434
    Top = 90
    Width = 70
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #21547#31246#20215#26684#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 29
    Top = 138
    Width = 45
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #24037#21378#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 14
    Top = 108
    Width = 60
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #20379#24212#21830#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 4
    Top = 168
    Width = 70
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #20837#24211#24635#25968#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 4
    Top = 78
    Width = 70
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #26448#26009#32534#30721#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 166
    Top = 168
    Width = 70
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #36864#36135#25968#37327#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 322
    Top = 167
    Width = 72
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #22312#24211#25968#37327#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 4
    Top = 48
    Width = 70
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #20986#20179#21333#21495#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 460
    Top = 132
    Width = 45
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #31246#29575#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label13: TLabel
    Left = 4
    Top = 200
    Width = 100
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #26412#27425#36864#36135#25968#37327#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label11: TLabel
    Left = 221
    Top = 200
    Width = 45
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #22791#27880#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton2: TSpeedButton
    Tag = 1
    Left = 358
    Top = 42
    Width = 22
    Height = 24
    Glyph.Data = {
      EE000000424DEE000000000000007600000028000000100000000F0000000100
      04000000000078000000130B0000130B00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      888800000888880000080F000888880F00080F000888880F0008000000080000
      000800F000000F00000800F000800F00000800F000800F000008800000000000
      0088880F00080F000888880000080000088888800088800088888880F08880F0
      888888800088800088888888888888888888}
    OnClick = SpeedButton2Click
  end
  object Label12: TLabel
    Left = 212
    Top = 48
    Width = 70
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #36864#26009#20154#21592#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object DBEdit4: TDBEdit
    Left = 72
    Top = 74
    Width = 163
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'INV_PART_NUMBER'
    DataSource = Form_ReturnOut.DataSource1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object DBEdit5: TDBEdit
    Left = 72
    Top = 104
    Width = 225
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'SUPPLIER_NAME'
    DataSource = Form_ReturnOut.DataSource1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object DBEdit6: TDBEdit
    Left = 72
    Top = 134
    Width = 225
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'WAREHOUSE_NAME'
    DataSource = Form_ReturnOut.DataSource1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object DBEdit8: TDBEdit
    Left = 72
    Top = 164
    Width = 81
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'quantity'
    DataSource = Form_ReturnOut.DataSource1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object DBEdit9: TDBEdit
    Left = 232
    Top = 163
    Width = 81
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'QUAN_RETURNED'
    DataSource = Form_ReturnOut.DataSource1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
  end
  object DBEdit10: TDBEdit
    Left = 394
    Top = 163
    Width = 81
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'quan_on_hand'
    DataSource = Form_ReturnOut.DataSource1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
  end
  object MaskEdit1: TMaskEdit
    Left = 72
    Top = 44
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object Panel1: TPanel
    Left = -1
    Top = 0
    Width = 666
    Height = 33
    TabOrder = 7
    object BitBtn9: TBitBtn
      Left = 62
      Top = 3
      Width = 59
      Height = 28
      Cursor = crHandPoint
      Hint = #20851#38381
      Caption = #20851#38381
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ModalResult = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BitBtn9Click
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        0400000000007800000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF0FFFFFF
        FFFFFFFF00FFFFFFFFFFFFF030FFFFFFFFFFFF0330FFFFFFFFFF003330000000
        0FFFF03330FF0FFFFFFFF03300FF0FFFF4FFF03330FF0FFF44FFF03330FF0FF4
        4444F03330FF0F444444F03330FF0FF44444F0330FFF0FFF44FFF030FFFF0FFF
        F4FFF00FFFFF0FFFFFFFF00000000FFFFFFF}
    end
    object BtnSave: TBitBtn
      Left = 3
      Top = 3
      Width = 59
      Height = 28
      Cursor = crHandPoint
      Hint = #20445#23384
      Caption = #20445#23384
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BtnSaveClick
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
  end
  object DBEdit3: TDBEdit
    Left = 504
    Top = 128
    Width = 89
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'tax_2'
    DataSource = Form_ReturnOut.DataSource1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 8
  end
  object Edit1: TEdit
    Left = 264
    Top = 196
    Width = 369
    Height = 21
    MaxLength = 200
    TabOrder = 9
  end
  object Edit2: TEdit
    Left = 99
    Top = 196
    Width = 99
    Height = 21
    TabOrder = 10
    Text = '0.000'
    OnExit = Edit2Exit
    OnKeyPress = Edit2KeyPress
  end
  object Edit5: TEdit
    Left = 276
    Top = 44
    Width = 80
    Height = 21
    Color = clInfoBk
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 11
  end
  object Edit3: TEdit
    Left = 504
    Top = 88
    Width = 89
    Height = 21
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 12
    Text = 'Edit3'
    OnKeyPress = Edit3KeyPress
  end
end
