object Frm_EdtXh: TFrm_EdtXh
  Left = 416
  Top = 143
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = #29289#26009#28040#32791
  ClientHeight = 682
  ClientWidth = 859
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 531
    Top = 161
    Width = 1
    Height = 521
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 859
    Height = 33
    Align = alTop
    TabOrder = 1
    object Label16: TLabel
      Left = 472
      Top = 11
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #26412#21378#32534#21495
    end
    object BitBtn9: TBitBtn
      Left = 1
      Top = 3
      Width = 59
      Height = 28
      Cursor = crHandPoint
      Hint = #20851#38381
      Caption = #20851#38381
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
      Left = 62
      Top = 3
      Width = 59
      Height = 28
      Cursor = crHandPoint
      Hint = #20445#23384
      Caption = #20445#23384
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
    object BtRead: TBitBtn
      Left = 125
      Top = 3
      Width = 59
      Height = 28
      Cursor = crHandPoint
      Hint = #35835#21462#26412#21378#36807#26495#25968
      Caption = #35835#21462
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BtReadClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADA000000000000ADAD0FFFFFFFFFF0DADA0F00F00000F0ADAD0FFFFFFFFFF0
        DADA0F00F00000F0ADAD0FFFFFFFFFF0DADA0FFFFFFF0FF0ADAD0FF0FFF080F0
        DAD40F080F0808000D440FF08080808880440000080808888844DADAD0808888
        8844ADADAD0888888044DADADAD000000A44ADADADADADADADAD}
    end
    object BtCal: TBitBtn
      Left = 255
      Top = 3
      Width = 59
      Height = 28
      Cursor = crHandPoint
      Caption = #35745#31639
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BtCalClick
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000C40E0000C40E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FD00FDF300F3F700F7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFE200E29902994C164C711271E100E1FE00FEFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFD700D7B600B62B1A2B616F617A947A687D682320239D099DD2
        00D2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFDE00DEB500B55128512C532CABB7ABFCFFFCBAB8BA9A9C
        9A9CA79C446244422B42AA04AAD300D3FE00FEFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFD400D4A000A05D2B5D525A52A4B5A4E7E7E7F9F8F9
        BBBBBBD4D4D4666666A5A5A5ACABAC8E9D8E2C512C5B3A5B9C0C9CC800C8F500
        F5FF00FFFF00FFFF00FFFF00FFE500E57D007D572257666166A2BDA2D1D4D1FF
        FFFFC0BFC0AAAAAA8C8C8CC5C5C5272727BDBDBD4E4F4ED5D0D5C1B0C1808D80
        5B605B381C38CB00CBFF00FFFF00FFFF00FF560056581458586558B9C5B9D1D8
        D1F2F0F2E1E1E17A7A7AAEAEAEA1A1A13C3C3CEDEDED3333338E8E8EC1BCC1C2
        CEC2509A50A7BAA7C8C8C8144614B400B4FF00FFFF00FFFF00FF5E835EC2D4C2
        EDEEEDDFE0DFD4D4D49F9F9F9999998181819797976C6C6CA5A5A5333333EBEB
        EBCCCDCCE6DBE6B1DEB100E600519C51474347740674F500F5FF00FFFF00FFFF
        00FFB56DB5B7A3B7B7E1B7D9DAD97E787E6F716FB2B1B26262628484848D8D8D
        BFBFBFDBDBDBCECECEE0E0E0D4D2D48485843954394751469796965F655FA809
        A8FD00FDFF00FFFF00FFFC02FCEB13EBC152C194B7949DB69DA19DA14A494A99
        9999B7B7B7E2E2E2D4D4D4CFCFCFEFEFEF919191202020535153928C95D6D6E9
        DEDDE9A1B1A01B1D1BE200E2FF00FFFF00FFFF00FFFF00FFFE00FEF606F6B558
        B588DC88EEFFEEEEF0EEDCDCDCD1D1D0E8E8EAF6F6F6000000222222A0A0A9CB
        CCDDFFFFFFFFFFBAEAEABDD4D4DF6B816B700D70F800F8FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFF600F6994699A4A5A4C8CCC8B4B4B42E2E2C000000F3F3
        F8F2F2FFFFFFFFFFFFC4FFFF00FFFF26EFEFC2D7D6E48A9E8A4E124EF500F5FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9527953A463A262729
        4B4B4A7A7A89FFFFFFFFFF9CFCFC13D4D4008F8F07D8D800FFFF6BDFDFDDDAD6
        E1447B44830783FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF96
        3F965B6B5952526C939326969600FFFF68C6C6008F8F0B71715B6B6B947F7F00
        FFFF0DFAFABCD2D2DFA4ACA42E272EFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFCE4DCE9CA39BB0B5D1EEEE5FFFFF00E5E50019195AB1B1BEBD
        BDFAC4C4E1949464C7C700FFFF7DE1E1DBD1CED4285F28BB00BBFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBA83B9B4C3C5595824FBFB00FFFF
        13EEEEDAECECFF6565EE9292D4ACAC9BABAB03FFFF00F5F5B8D4D4E0D2CED200
        0800FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD430D4C4CEC0
        464C87ADAD00FFFF00EBEB3CE1E1FFFFFFFEFDFDC0E2E27BC1C10DC5C5009896
        7AC5C9D1AACAA9350935FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFB671B5C5CFCD000000FFFF00F9F914E8E883EAEA87FFFF18C2C200
        878614838253769876ABADAEB576B5D304D3FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFCE30CEC1D4BF8387A2686700FFFF00FFFF03DB
        DA004F4F007A7F5187999481AC8DC568C8E12FE1F609F6FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFA00FAA963A8E9F9F20000
        00FFFF007472004A503595A9A796A39FBF6DC3DF35DEFB04FAFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        D328D3B6BBB7AEB2B0474637819C899EB0AAC56EC5DB3ADBF802F8FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF748774DDF0DF81BA89BE73C0DE36DDFD00FDFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF84A484FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object BtExl: TBitBtn
      Left = 317
      Top = 3
      Width = 59
      Height = 28
      Cursor = crHandPoint
      Caption = #23548#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = BtExlClick
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
    object BtUpdate: TBitBtn
      Left = 186
      Top = 3
      Width = 59
      Height = 28
      Cursor = crHandPoint
      Hint = #26356#26032#24037#31243#20449#24687#21450#35745#31639#21442#25968
      Caption = #26356#26032
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = BtUpdateClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADA000000000000ADAD0FFFFFFFFFF0DADA0F00F00000F0ADAD0FFFFFFFFFF0
        DADA0F00F00000F0ADAD0FFFFFFFFFF0DADA0FFFFFFF0FF0ADAD0FF0FFF080F0
        DAD40F080F0808000D440FF08080808880440000080808888844DADAD0808888
        8844ADADAD0888888044DADADAD000000A44ADADADADADADADAD}
    end
    object Edit2: TEdit
      Left = 527
      Top = 6
      Width = 121
      Height = 21
      TabOrder = 6
      OnChange = Edit2Change
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 33
    Width = 859
    Height = 128
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 5
      Top = 12
      Width = 52
      Height = 13
      Caption = #32479#35745#32534#21495
    end
    object Label3: TLabel
      Left = 5
      Top = 40
      Width = 52
      Height = 13
      Caption = #32479#35745#24037#24207
    end
    object SpeedButton1: TSpeedButton
      Left = 110
      Top = 36
      Width = 23
      Height = 22
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        04000000000078000000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888800000888880000080F000888880F00080F000888880F0008000000080000
        000800F000000F00000800F000800F00000800F000800F000008800000000000
        0088880F00080F000888880000080000088888800088800088888880F08880F0
        888888800088800088888888888888888888}
      OnClick = SpeedButton1Click
    end
    object Label4: TLabel
      Left = 2
      Top = 93
      Width = 52
      Height = 13
      Caption = #35745#31639#20844#24335
    end
    object SpeedButton2: TSpeedButton
      Tag = 1
      Left = 121
      Top = 89
      Width = 23
      Height = 22
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        04000000000078000000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888800000888880000080F000888880F00080F000888880F0008000000080000
        000800F000000F00000800F000800F00000800F000800F000008800000000000
        0088880F00080F000888880000080000088888800088800088888880F08880F0
        888888800088800088888888888888888888}
      OnClick = SpeedButton1Click
    end
    object Label5: TLabel
      Left = 179
      Top = 10
      Width = 52
      Height = 13
      Caption = #24320#22987#26085#26399
    end
    object Label6: TLabel
      Left = 179
      Top = 41
      Width = 52
      Height = 13
      Caption = #32467#26463#26085#26399
    end
    object Label14: TLabel
      Left = 3
      Top = 65
      Width = 52
      Height = 13
      Caption = #29289#26009#32534#30721
    end
    object SpeedButton3: TSpeedButton
      Tag = 2
      Left = 155
      Top = 61
      Width = 23
      Height = 22
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        04000000000078000000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888800000888880000080F000888880F00080F000888880F0008000000080000
        000800F000000F00000800F000800F00000800F000800F000008800000000000
        0088880F00080F000888880000080000088888800088800088888880F08880F0
        888888800088800088888888888888888888}
      OnClick = SpeedButton1Click
    end
    object Label15: TLabel
      Left = 145
      Top = 93
      Width = 26
      Height = 13
      Caption = #22791#27880
    end
    object Label2: TLabel
      Left = 135
      Top = 41
      Width = 7
      Height = 13
    end
    object Label21: TLabel
      Left = 181
      Top = 65
      Width = 7
      Height = 13
    end
    object Label17: TLabel
      Left = 436
      Top = 11
      Width = 7
      Height = 13
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object MaskEdit1: TMaskEdit
      Left = 61
      Top = 8
      Width = 73
      Height = 21
      TabOrder = 0
    end
    object EdtDept: TEdit
      Left = 61
      Top = 36
      Width = 50
      Height = 21
      TabOrder = 1
      OnEnter = EdtDeptEnter
      OnExit = EdtDeptExit
    end
    object EdtFor: TEdit
      Left = 58
      Top = 89
      Width = 62
      Height = 21
      TabOrder = 3
      OnEnter = EdtForEnter
      OnExit = EdtForExit
    end
    object DateTimePicker1: TDateTimePicker
      Left = 234
      Top = 6
      Width = 95
      Height = 21
      Date = 40140.000000000000000000
      Time = 40140.000000000000000000
      TabOrder = 4
    end
    object DateTimePicker2: TDateTimePicker
      Left = 234
      Top = 37
      Width = 95
      Height = 21
      Date = 40140.000000000000000000
      Time = 40140.000000000000000000
      TabOrder = 6
    end
    object GroupBox1: TGroupBox
      Left = 547
      Top = 1
      Width = 311
      Height = 126
      Align = alRight
      Caption = #23454#38469#28040#32791'/'#29702#35770#28040#32791
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      object Label7: TLabel
        Left = 28
        Top = 101
        Width = 56
        Height = 13
        Caption = #29702#35770#28040#32791
        Font.Charset = ANSI_CHARSET
        Font.Color = clGreen
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 6
        Top = 78
        Width = 78
        Height = 13
        Caption = #26368#22823#27979#37327#28040#32791
      end
      object Label9: TLabel
        Left = 155
        Top = 80
        Width = 78
        Height = 13
        Caption = #26368#23567#27979#37327#28040#32791
      end
      object Label10: TLabel
        Left = 155
        Top = 103
        Width = 78
        Height = 13
        Caption = #24179#22343#27979#37327#28040#32791
      end
      object Label11: TLabel
        Left = 3
        Top = 24
        Width = 52
        Height = 13
        Caption = #26399#21021#25968#37327
      end
      object Label12: TLabel
        Left = 158
        Top = 24
        Width = 52
        Height = 13
        Caption = #26412#26399#39046#29992
      end
      object Label13: TLabel
        Left = 158
        Top = 48
        Width = 52
        Height = 13
        Caption = #26399#26411#25968#37327
      end
      object Label22: TLabel
        Left = 3
        Top = 48
        Width = 56
        Height = 13
        Caption = #23454#38469#28040#32791
        Font.Charset = ANSI_CHARSET
        Font.Color = clGreen
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Shape1: TShape
        Left = 5
        Top = 69
        Width = 311
        Height = 1
        Pen.Color = clBlue
      end
      object LbUnit1: TLabel
        Left = 125
        Top = 24
        Width = 7
        Height = 13
      end
      object LbUnit2: TLabel
        Left = 125
        Top = 48
        Width = 7
        Height = 13
      end
      object LbUnit3: TLabel
        Left = 283
        Top = 24
        Width = 7
        Height = 13
      end
      object LbUnit4: TLabel
        Left = 283
        Top = 48
        Width = 7
        Height = 13
      end
      object EdtSumVal: TEdit
        Left = 88
        Top = 98
        Width = 63
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clGreen
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object Edit4: TEdit
        Left = 87
        Top = 74
        Width = 63
        Height = 21
        ReadOnly = True
        TabOrder = 3
      end
      object Edit5: TEdit
        Left = 238
        Top = 76
        Width = 67
        Height = 21
        ReadOnly = True
        TabOrder = 4
      end
      object Edit6: TEdit
        Left = 238
        Top = 99
        Width = 67
        Height = 21
        ReadOnly = True
        TabOrder = 5
      end
      object Edit7: TEdit
        Left = 60
        Top = 20
        Width = 62
        Height = 21
        TabOrder = 6
        OnKeyPress = Edit7KeyPress
      end
      object Edit8: TEdit
        Left = 215
        Top = 20
        Width = 68
        Height = 21
        ReadOnly = True
        TabOrder = 0
        OnKeyPress = Edit7KeyPress
      end
      object Edit9: TEdit
        Left = 215
        Top = 44
        Width = 68
        Height = 21
        TabOrder = 1
        OnKeyPress = Edit7KeyPress
      end
      object Edit1: TEdit
        Left = 60
        Top = 44
        Width = 62
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clGreen
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
      end
    end
    object PartEdt: TEdit
      Left = 59
      Top = 61
      Width = 95
      Height = 21
      TabOrder = 2
      OnEnter = PartEdtEnter
      OnExit = PartEdtExit
    end
    object EdtMem: TEdit
      Left = 173
      Top = 89
      Width = 300
      Height = 21
      TabOrder = 8
    end
    object DateTimePicker3: TDateTimePicker
      Left = 327
      Top = 6
      Width = 82
      Height = 21
      Date = 40140.000000000000000000
      Time = 40140.000000000000000000
      Kind = dtkTime
      TabOrder = 5
    end
    object DateTimePicker4: TDateTimePicker
      Left = 327
      Top = 37
      Width = 82
      Height = 21
      Date = 40140.000000000000000000
      Time = 40140.000000000000000000
      Kind = dtkTime
      TabOrder = 7
    end
    object BitBtn6: TBitBtn
      Tag = 3
      Left = 409
      Top = 6
      Width = 25
      Height = 25
      TabOrder = 10
      TabStop = False
      OnClick = SpeedButton1Click
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
  end
  object GroupBox2: TGroupBox
    Left = 532
    Top = 161
    Width = 327
    Height = 521
    Align = alClient
    Caption = #35745#31639#21442#25968#21450#20844#24335
    TabOrder = 2
    object StringGrid1: TStringGrid
      Left = 2
      Top = 188
      Width = 347
      Height = 291
      ColCount = 4
      Enabled = False
      FixedCols = 0
      RowCount = 11
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
      ScrollBars = ssNone
      TabOrder = 0
      ColWidths = (
        29
        83
        83
        174)
    end
    object DBEdit9: TDBEdit
      Left = 209
      Top = 217
      Width = 127
      Height = 21
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      DataField = 'PARA_VALUE_0'
      DataSource = DM.DS2
      PopupMenu = PopupMenu3
      TabOrder = 1
      OnKeyPress = DBEdit9KeyPress
    end
    object DBEdit10: TDBEdit
      Tag = 1
      Left = 209
      Top = 242
      Width = 127
      Height = 21
      BorderStyle = bsNone
      DataField = 'PARA_VALUE_1'
      DataSource = DM.DS2
      PopupMenu = PopupMenu3
      TabOrder = 2
      OnKeyPress = DBEdit9KeyPress
    end
    object DBEdit11: TDBEdit
      Tag = 2
      Left = 209
      Top = 267
      Width = 127
      Height = 21
      BorderStyle = bsNone
      DataField = 'PARA_VALUE_2'
      DataSource = DM.DS2
      PopupMenu = PopupMenu3
      TabOrder = 3
      OnKeyPress = DBEdit9KeyPress
    end
    object DBEdit12: TDBEdit
      Tag = 3
      Left = 209
      Top = 292
      Width = 127
      Height = 21
      BorderStyle = bsNone
      DataField = 'PARA_VALUE_3'
      DataSource = DM.DS2
      PopupMenu = PopupMenu3
      TabOrder = 4
      OnKeyPress = DBEdit9KeyPress
    end
    object DBEdit19: TDBEdit
      Tag = 4
      Left = 209
      Top = 317
      Width = 127
      Height = 21
      BorderStyle = bsNone
      DataField = 'PARA_VALUE_4'
      DataSource = DM.DS2
      PopupMenu = PopupMenu3
      TabOrder = 5
      OnKeyPress = DBEdit9KeyPress
    end
    object DBEdit20: TDBEdit
      Tag = 5
      Left = 209
      Top = 342
      Width = 127
      Height = 21
      BorderStyle = bsNone
      DataField = 'PARA_VALUE_5'
      DataSource = DM.DS2
      PopupMenu = PopupMenu3
      TabOrder = 6
      OnKeyPress = DBEdit9KeyPress
    end
    object DBEdit21: TDBEdit
      Tag = 6
      Left = 209
      Top = 367
      Width = 127
      Height = 21
      BorderStyle = bsNone
      DataField = 'PARA_VALUE_6'
      DataSource = DM.DS2
      PopupMenu = PopupMenu3
      TabOrder = 7
      OnKeyPress = DBEdit9KeyPress
    end
    object DBEdit22: TDBEdit
      Tag = 7
      Left = 208
      Top = 392
      Width = 127
      Height = 21
      BorderStyle = bsNone
      DataField = 'PARA_VALUE_7'
      DataSource = DM.DS2
      PopupMenu = PopupMenu3
      TabOrder = 8
      OnKeyPress = DBEdit9KeyPress
    end
    object DBEdit23: TDBEdit
      Tag = 8
      Left = 208
      Top = 417
      Width = 127
      Height = 21
      BorderStyle = bsNone
      DataField = 'PARA_VALUE_8'
      DataSource = DM.DS2
      PopupMenu = PopupMenu3
      TabOrder = 9
      OnKeyPress = DBEdit9KeyPress
    end
    object DBEdit24: TDBEdit
      Tag = 9
      Left = 208
      Top = 442
      Width = 127
      Height = 21
      BorderStyle = bsNone
      DataField = 'PARA_VALUE_9'
      DataSource = DM.DS2
      PopupMenu = PopupMenu3
      TabOrder = 10
      OnKeyPress = DBEdit9KeyPress
    end
    object DBEdit5: TDBEdit
      Left = 37
      Top = 217
      Width = 79
      Height = 21
      BorderStyle = bsNone
      DataField = 'PARA_PTR_0'
      DataSource = DM.DS4
      Enabled = False
      TabOrder = 11
    end
    object DBEdit6: TDBEdit
      Left = 37
      Top = 241
      Width = 79
      Height = 21
      BorderStyle = bsNone
      DataField = 'PARA_PTR_1'
      DataSource = DM.DS4
      Enabled = False
      TabOrder = 12
    end
    object DBEdit7: TDBEdit
      Left = 37
      Top = 267
      Width = 79
      Height = 21
      BorderStyle = bsNone
      DataField = 'PARA_PTR_2'
      DataSource = DM.DS4
      Enabled = False
      TabOrder = 13
    end
    object DBEdit8: TDBEdit
      Left = 37
      Top = 291
      Width = 79
      Height = 21
      BorderStyle = bsNone
      DataField = 'PARA_PTR_3'
      DataSource = DM.DS4
      Enabled = False
      TabOrder = 14
    end
    object DBEdit13: TDBEdit
      Left = 37
      Top = 316
      Width = 79
      Height = 21
      BorderStyle = bsNone
      DataField = 'PARA_PTR_4'
      DataSource = DM.DS4
      Enabled = False
      TabOrder = 15
    end
    object DBEdit14: TDBEdit
      Left = 37
      Top = 343
      Width = 79
      Height = 21
      BorderStyle = bsNone
      DataField = 'PARA_PTR_5'
      DataSource = DM.DS4
      Enabled = False
      TabOrder = 16
    end
    object DBEdit15: TDBEdit
      Left = 37
      Top = 368
      Width = 79
      Height = 21
      BorderStyle = bsNone
      DataField = 'PARA_PTR_6'
      DataSource = DM.DS4
      Enabled = False
      TabOrder = 17
    end
    object DBEdit16: TDBEdit
      Left = 37
      Top = 393
      Width = 79
      Height = 21
      BorderStyle = bsNone
      DataField = 'PARA_PTR_7'
      DataSource = DM.DS4
      Enabled = False
      TabOrder = 18
    end
    object DBEdit17: TDBEdit
      Left = 37
      Top = 417
      Width = 79
      Height = 21
      BorderStyle = bsNone
      DataField = 'PARA_PTR_8'
      DataSource = DM.DS4
      Enabled = False
      TabOrder = 19
    end
    object DBEdit18: TDBEdit
      Left = 37
      Top = 443
      Width = 79
      Height = 21
      BorderStyle = bsNone
      DataField = 'PARA_PTR_9'
      DataSource = DM.DS4
      Enabled = False
      TabOrder = 20
    end
    object DBEdit25: TDBEdit
      Left = 123
      Top = 217
      Width = 76
      Height = 21
      BorderStyle = bsNone
      DataField = 'Un0'
      DataSource = DM.DS4
      Enabled = False
      TabOrder = 21
    end
    object DBEdit26: TDBEdit
      Left = 123
      Top = 241
      Width = 76
      Height = 21
      BorderStyle = bsNone
      DataField = 'Un1'
      DataSource = DM.DS4
      Enabled = False
      TabOrder = 22
    end
    object DBEdit27: TDBEdit
      Left = 123
      Top = 265
      Width = 76
      Height = 21
      BorderStyle = bsNone
      DataField = 'Un2'
      DataSource = DM.DS4
      Enabled = False
      TabOrder = 23
    end
    object DBEdit28: TDBEdit
      Left = 123
      Top = 291
      Width = 76
      Height = 21
      BorderStyle = bsNone
      DataField = 'Un3'
      DataSource = DM.DS4
      Enabled = False
      TabOrder = 24
    end
    object DBEdit29: TDBEdit
      Left = 123
      Top = 318
      Width = 76
      Height = 21
      BorderStyle = bsNone
      DataField = 'Un4'
      DataSource = DM.DS4
      Enabled = False
      TabOrder = 25
    end
    object DBEdit30: TDBEdit
      Left = 123
      Top = 343
      Width = 76
      Height = 21
      BorderStyle = bsNone
      DataField = 'Un5'
      DataSource = DM.DS4
      Enabled = False
      TabOrder = 26
    end
    object DBEdit31: TDBEdit
      Left = 123
      Top = 368
      Width = 76
      Height = 21
      BorderStyle = bsNone
      DataField = 'Un6'
      DataSource = DM.DS4
      Enabled = False
      TabOrder = 27
    end
    object DBEdit32: TDBEdit
      Left = 123
      Top = 393
      Width = 76
      Height = 21
      BorderStyle = bsNone
      DataField = 'Un7'
      DataSource = DM.DS4
      Enabled = False
      TabOrder = 28
    end
    object DBEdit33: TDBEdit
      Left = 123
      Top = 417
      Width = 76
      Height = 21
      BorderStyle = bsNone
      DataField = 'Un8'
      DataSource = DM.DS4
      Enabled = False
      TabOrder = 29
    end
    object DBEdit34: TDBEdit
      Left = 123
      Top = 441
      Width = 76
      Height = 21
      BorderStyle = bsNone
      DataField = 'Un9'
      DataSource = DM.DS4
      Enabled = False
      TabOrder = 30
    end
    object PageControl1: TPageControl
      Left = 2
      Top = 15
      Width = 323
      Height = 173
      ActivePage = TabSheet1
      Align = alTop
      TabOrder = 31
      object TabSheet1: TTabSheet
        Caption = #29702#35770#32467#26524#35745#31639#20844#24335
        object Memo1: TMemo
          Left = 0
          Top = 0
          Width = 315
          Height = 145
          Align = alClient
          ReadOnly = True
          TabOrder = 0
        end
      end
      object TabSheet2: TTabSheet
        Caption = #26368#22823#32467#26524#35745#31639#20844#24335
        ImageIndex = 1
        object Memo2: TMemo
          Left = 0
          Top = 0
          Width = 339
          Height = 145
          Align = alClient
          ReadOnly = True
          TabOrder = 0
        end
      end
      object TabSheet3: TTabSheet
        Caption = #26368#23567#32467#26524#35745#31639#20844#24335
        ImageIndex = 2
        object Memo3: TMemo
          Left = 0
          Top = 0
          Width = 339
          Height = 78
          Align = alClient
          ReadOnly = True
          TabOrder = 0
        end
      end
      object TabSheet4: TTabSheet
        Caption = #24179#22343#32467#26524#35745#31639#20844#24335
        ImageIndex = 3
        object Memo4: TMemo
          Left = 0
          Top = 0
          Width = 339
          Height = 78
          Align = alClient
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
    object DBNavigator1: TDBNavigator
      Left = 4
      Top = 481
      Width = 224
      Height = 25
      DataSource = DM.DS2
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Hints.Strings = (
        #31532#19968#26465
        #19978#19968#26465
        #19979#19968#26465
        #26368#21518#19968#26465
        'Insert record'
        'Delete record'
        'Edit record'
        'Post edit'
        'Cancel edit'
        'Refresh data')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 32
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 161
    Width = 531
    Height = 521
    Align = alLeft
    Caption = 'Panel3'
    TabOrder = 3
    object Label18: TLabel
      Left = 11
      Top = 488
      Width = 52
      Height = 13
      Caption = #24635#35760#24405#25968
    end
    object Label19: TLabel
      Left = 187
      Top = 489
      Width = 47
      Height = 13
      Caption = #24635'PNL'#25968
    end
    object Label20: TLabel
      Left = 376
      Top = 488
      Width = 47
      Height = 13
      Caption = #24635'SET'#25968
    end
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 529
      Height = 479
      Align = alTop
      DataSource = DM.DS2
      Flat = True
      FooterColor = clInfoBk
      FooterFont.Charset = ANSI_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      FrozenCols = 1
      PopupMenu = PopupMenu2
      SortLocal = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      TitleLines = 1
      OnTitleClick = DBGridEh1TitleClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'MANU_PART_NUMBER'
          Footer.Value = #35760#24405#25968
          Footer.ValueType = fvtStaticText
          Footers = <>
          Width = 96
        end
        item
          Color = clWhite
          EditButtons = <>
          EndEllipsis = True
          FieldName = 'MANU_PART_DESC'
          Footer.FieldName = 'MANU_PART_DESC'
          Footer.ValueType = fvtCount
          Footer.WordWrap = True
          Footers = <>
          Width = 103
        end
        item
          EditButtons = <>
          FieldName = 'WORK_ORDER_number'
          Footers = <>
          Width = 107
        end
        item
          EditButtons = <>
          FieldName = 'PANEL_A_B'
          Footers = <>
          Width = 41
        end
        item
          EditButtons = <>
          FieldName = 'customer_name'
          Footers = <>
          Width = 106
        end
        item
          EditButtons = <>
          FieldName = 'EPI_NUMBER'
          Footers = <>
          Width = 69
        end
        item
          EditButtons = <>
          FieldName = 'ttype'
          Footers = <>
          Width = 40
        end
        item
          EditButtons = <>
          FieldName = 'REMARK'
          Footers = <>
          Width = 188
        end
        item
          EditButtons = <>
          FieldName = 'pan_qty'
          Footers = <>
          Width = 38
        end
        item
          EditButtons = <>
          FieldName = 'set_qty'
          Footers = <>
          Width = 49
        end
        item
          EditButtons = <>
          FieldName = 'pcs_qty'
          Footers = <>
          Width = 51
        end
        item
          EditButtons = <>
          FieldName = 'pan_size'
          Footers = <>
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'set_size'
          Footers = <>
          Width = 51
        end
        item
          EditButtons = <>
          FieldName = 'pcs_size'
          Footers = <>
          Width = 52
        end
        item
          EditButtons = <>
          FieldName = 'pan_sqrt'
          Footers = <>
          Width = 62
        end
        item
          EditButtons = <>
          FieldName = 'set_sqrt'
          Footers = <>
          Width = 51
        end
        item
          EditButtons = <>
          FieldName = 'pcs_sqrt'
          Footers = <>
          Width = 52
        end
        item
          EditButtons = <>
          FieldName = 'theory_result'
          Footers = <>
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'measure_result1'
          Footers = <>
          Width = 90
        end
        item
          EditButtons = <>
          FieldName = 'measure_result2'
          Footers = <>
          Width = 94
        end
        item
          EditButtons = <>
          FieldName = 'measure_result3'
          Footers = <>
          Width = 85
        end>
    end
    object Edit12: TEdit
      Left = 429
      Top = 484
      Width = 71
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 1
    end
    object Edit10: TEdit
      Left = 69
      Top = 484
      Width = 60
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 2
    end
    object Edit11: TEdit
      Left = 235
      Top = 485
      Width = 86
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 3
    end
  end
  object PopupMenu2: TPopupMenu
    OnPopup = PopupMenu2Popup
    Left = 360
    Top = 320
    object M1: TMenuItem
      Caption = #22806#21333#36755#20837
      OnClick = M1Click
    end
    object M2: TMenuItem
      Tag = 1
      Caption = #22806#21333#32534#36753
      OnClick = M1Click
    end
    object M3: TMenuItem
      Tag = 2
      Caption = #22806#21333#21024#38500
      OnClick = M3Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object M11: TMenuItem
      Caption = #24037#24207#27979#37327#32467#26524#32534#36753'/'#26597#30475
      OnClick = M11Click
    end
    object M22: TMenuItem
      Caption = #35835#21462#27979#37327#32467#26524'('#20174'EXCEL'#25991#20214')'
      OnClick = M22Click
    end
    object M33: TMenuItem
      Tag = 1
      Caption = #35835#21462#27979#37327#32467#26524'('#20174'RTF'#25991#20214')'
      OnClick = M22Click
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 384
    Top = 1
    object N1: TMenuItem
      Caption = #36807#26495#27719#24635
      OnClick = N1Click
    end
    object N2: TMenuItem
      Tag = 1
      Caption = #36807#26495#26126#32454
      OnClick = N1Click
    end
  end
  object PopupMenu3: TPopupMenu
    Left = 809
    Top = 593
    object N3: TMenuItem
      Caption = #35835#21462#27979#37327#26368#22823#20540
      ShortCut = 16467
      OnClick = N3Click
    end
    object N4: TMenuItem
      Tag = 1
      Caption = #35835#21462#27979#37327#26368#23567#20540
      ShortCut = 16474
      OnClick = N3Click
    end
    object N6: TMenuItem
      Tag = 2
      Caption = #35835#21462#27979#37327#24179#22343#20540
      ShortCut = 16449
      OnClick = N3Click
    end
  end
  object ActionList1: TActionList
    Left = 864
    Top = 1
    object ActPiror: TAction
      Caption = 'Piror'
      OnExecute = ActPirorExecute
    end
    object ActNext: TAction
      Caption = 'Next'
      OnExecute = ActNextExecute
    end
  end
end
