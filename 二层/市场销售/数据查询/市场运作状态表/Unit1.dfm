object FrmMain: TFrmMain
  Left = 117
  Top = 149
  Width = 840
  Height = 509
  Caption = #24066#22330#36816#20316#29366#24577
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object db_ptr: TLabel
    Left = 728
    Top = 152
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object dbeh1: TDBGridEh
    Left = 0
    Top = 56
    Width = 832
    Height = 423
    Align = alClient
    Color = clMoneyGreen
    DataSource = ds1
    Flat = True
    FooterColor = clYellow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    FooterRowCount = 1
    FrozenCols = 1
    ReadOnly = True
    SumList.Active = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    TitleHeight = 30
    TitleLines = 3
    UseMultiTitle = True
    OnDrawColumnCell = dbeh1DrawColumnCell
    Columns = <
      item
        EditButtons = <>
        FieldName = 'date1'
        Footer.Value = #21512#35745#65306
        Footer.ValueType = fvtStaticText
        Footers = <>
        Title.Caption = #26085#26399
        Width = 76
      end
      item
        DisplayFormat = '#,0.00'
        DropDownBox.UseMultiTitle = True
        DropDownSpecRow.CellsText = '12345'
        DropDownSpecRow.Visible = True
        EditButtons = <>
        FieldName = 'f1'
        Footer.DisplayFormat = '#,0.00'
        Footer.FieldName = 'f1'
        Footers = <
          item
            DisplayFormat = '#,0.00'
            FieldName = 'f1'
            ValueType = fvtSum
            WordWrap = True
          end>
        Title.Caption = #24403#26085#35746#21333#25968'|'#26412#21378
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 67
      end
      item
        DisplayFormat = '#,0.00'
        EditButtons = <>
        FieldName = 'f2'
        Footer.DisplayFormat = '#,0.00'
        Footer.FieldName = 'f2'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #24403#26085#35746#21333#25968'|'#22806#21457
        Width = 52
      end
      item
        DisplayFormat = '#,0.00'
        EditButtons = <>
        FieldName = 'f3'
        Footer.DisplayFormat = '#,0.00'
        Footer.FieldName = 'f3'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #24403#26085#35746#21333#25968'|'#21322#21046#31243
        Width = 59
      end
      item
        DisplayFormat = '#,0.00'
        EditButtons = <>
        FieldName = 'f4'
        Footer.DisplayFormat = '#,0.00'
        Footer.FieldName = 'f4'
        Footers = <>
        Title.Caption = #32047#35745#27424#36135#25968'|'#26412#21378
        Width = 105
      end
      item
        DisplayFormat = '#,0.00'
        EditButtons = <>
        FieldName = 'f5'
        Footer.DisplayFormat = '#,0.00'
        Footer.FieldName = 'f5'
        Footers = <>
        Title.Caption = #32047#35745#27424#36135#25968'|'#22806#21457
        Width = 57
      end
      item
        DisplayFormat = '#,0.00'
        EditButtons = <>
        FieldName = 'f6'
        Footer.DisplayFormat = '#,0.00'
        Footer.FieldName = 'f6'
        Footers = <>
        Title.Caption = #32047#35745#27424#36135#25968'|'#21322#21046#31243
        Width = 51
      end
      item
        DisplayFormat = '#,0.00'
        EditButtons = <>
        FieldName = 'f7'
        Footer.DisplayFormat = '#,0.00'
        Footer.FieldName = 'f7'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #36864#36135#27424#36135#25968'|'#26412#21378
        Width = 51
      end
      item
        DisplayFormat = '#,0.00'
        EditButtons = <>
        FieldName = 'f8'
        Footer.DisplayFormat = '#,0.00'
        Footer.FieldName = 'f8'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #36864#36135#27424#36135#25968'|'#22806#21457
        Width = 52
      end
      item
        DisplayFormat = '#,0.00'
        EditButtons = <>
        FieldName = 'f9'
        Footer.DisplayFormat = '#,0.00'
        Footer.FieldName = 'f9'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #36864#36135#27424#36135#25968'|'#21322#21046#31243
        Width = 58
      end
      item
        DisplayFormat = '#,0.00'
        EditButtons = <>
        FieldName = 'f10'
        Footer.DisplayFormat = '#,0.00'
        Footer.FieldName = 'f10'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #24403#26085#20986#36135#25968'|'#26412#21378
        Width = 52
      end
      item
        DisplayFormat = '#,0.00'
        EditButtons = <>
        FieldName = 'f11'
        Footer.DisplayFormat = '#,0.00'
        Footer.FieldName = 'f11'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #24403#26085#20986#36135#25968'|'#22806#21457
        Width = 45
      end
      item
        DisplayFormat = '#,0.00'
        EditButtons = <>
        FieldName = 'f12'
        Footer.DisplayFormat = '#,0.00'
        Footer.FieldName = 'f12'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #24403#26085#20986#36135#25968'|'#21322#21046#31243
        Width = 59
      end
      item
        DisplayFormat = '#,0.00'
        EditButtons = <>
        FieldName = 'f13'
        Footers = <>
        Title.Caption = #32047#35745#20986#36135#25968'|'#26412#21378
        Width = 93
      end
      item
        DisplayFormat = '#,0.00'
        EditButtons = <>
        FieldName = 'f14'
        Footers = <>
        Title.Caption = #32047#35745#20986#36135#25968'|'#22806#21457
        Width = 45
      end
      item
        DisplayFormat = '#,0.00'
        EditButtons = <>
        FieldName = 'f15'
        Footers = <>
        Title.Caption = #32047#35745#20986#36135#25968'|'#21322#21046#31243
        Width = 55
      end
      item
        DisplayFormat = '#,0.00'
        EditButtons = <>
        FieldName = 'f16'
        Footer.DisplayFormat = '#,0.00'
        Footer.FieldName = 'f16'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #24403#26085#36864#36135#25968'|'#26412#21378
        Width = 45
      end
      item
        DisplayFormat = '#,0.00'
        EditButtons = <>
        FieldName = 'f17'
        Footer.DisplayFormat = '#,0.00'
        Footer.FieldName = 'f17'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #24403#26085#36864#36135#25968'|'#22806#21457
        Width = 45
      end
      item
        DisplayFormat = '#,0.00'
        EditButtons = <>
        FieldName = 'f18'
        Footer.DisplayFormat = '#,0.00'
        Footer.FieldName = 'f18'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #24403#26085#36864#36135#25968'|'#21322#21046#31243
        Width = 54
      end
      item
        DisplayFormat = '#0%'
        EditButtons = <>
        FieldName = 'f23'
        Footers = <>
        Title.Caption = #20934#26102#20132#36135#29575'|'#26412#21378
        Width = 45
      end
      item
        DisplayFormat = '#0%'
        EditButtons = <>
        FieldName = 'f24'
        Footers = <>
        Title.Caption = #20934#26102#20132#36135#29575'|'#22806#21457
        Width = 45
      end
      item
        DisplayFormat = '#0%'
        EditButtons = <>
        FieldName = 'f25'
        Footers = <>
        Title.Caption = #20934#26102#20132#36135#29575'|'#21322#21046#31243
        Width = 61
      end
      item
        EditButtons = <>
        FieldName = 'f19'
        Footer.DisplayFormat = '#,0.00'
        Footer.FieldName = 'f19'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #24403#26085#19979#26679#27454#25968'|'#26412#21378
        Width = 45
      end
      item
        EditButtons = <>
        FieldName = 'f20'
        Footer.DisplayFormat = '#,0.00'
        Footer.FieldName = 'f20'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #24403#26085#19979#26679#27454#25968'|'#22806#21457
        Width = 45
      end
      item
        EditButtons = <>
        FieldName = 'f21'
        Footer.DisplayFormat = '#,0.00'
        Footer.FieldName = 'f21'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #24403#26085#20132#26679#27454#25968'|'#26412#21378
        Width = 45
      end
      item
        EditButtons = <>
        FieldName = 'f22'
        Footer.DisplayFormat = '#,0.00'
        Footer.FieldName = 'f22'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #24403#26085#20132#26679#27454#25968'|'#22806#21457
        Width = 45
      end
      item
        DisplayFormat = '#0%'
        EditButtons = <>
        FieldName = 'f26'
        Footers = <>
        Title.Caption = #20934#26102#20132#26679#29575'|'#26412#21378
        Width = 45
      end
      item
        DisplayFormat = '#0%'
        EditButtons = <>
        FieldName = 'f27'
        Footers = <>
        Title.Caption = #20934#26102#20132#26679#29575'|'#22806#21457
        Width = 45
      end>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 832
    Height = 56
    Align = alTop
    Caption = #26597#35810#26465#20214#65306
    TabOrder = 1
    DesignSize = (
      832
      56)
    object Label1: TLabel
      Left = 5
      Top = 24
      Width = 39
      Height = 13
      Caption = #26085#26399#65306
    end
    object Label3: TLabel
      Left = 141
      Top = 22
      Width = 16
      Height = 16
      AutoSize = False
      Caption = #21040
    end
    object Label2: TLabel
      Left = 257
      Top = 24
      Width = 65
      Height = 13
      Caption = #23458#25143#20195#30721#65306
    end
    object Label4: TLabel
      Left = 429
      Top = 23
      Width = 65
      Height = 13
      Caption = #24037#21378#20195#30721#65306
    end
    object SpeedButton1: TSpeedButton
      Left = 773
      Top = 10
      Width = 37
      Height = 41
      Hint = #36864#20986
      Anchors = [akTop, akRight]
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        0400000000007800000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF0FFFFFF
        FFFFFFFF00FFFFFFFFFFFFF030FFFFFFFFFFFF0330FFFFFFFFFF003330000000
        0FFFF03330FF0FFFFFFFF03300FF0FFFF4FFF03330FF0FFF44FFF03330FF0FF4
        4444F03330FF0F444444F03330FF0FF44444F0330FFF0FFF44FFF030FFFF0FFF
        F4FFF00FFFFF0FFFFFFFF00000000FFFFFFF}
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 662
      Top = 10
      Width = 37
      Height = 41
      Hint = #26597#35810
      Anchors = [akTop, akRight]
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Glyph.Data = {
        36080000424D3608000000000000360400002800000020000000200000000100
        080000000000000400000000000000000000000100000001000000000000F8C0
        6800008080009060000098989800F8F8F8003838380078787800F8F8D00020A8
        F80050300000D8900000F0F0F000005018000048D80050505000F0C8A0002020
        2000B8780000B0B0B00000305000181818000090900000F8F8000090D800F8D0
        880060606000006090008080800048484800A0A0A00000000000000000000000
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
        0000000000000000000000000000000000000000000000000000000000000000
        00000013000090281800000000000000E400F712000035A6FC00770000001300
        0700A7FC7700080613000083A600FC7700000000000035A5FC0077FFFF000000
        7C00010000000000000000000000000000000000000000000000000000000000
        3100000000000025F30000640000660008004918000078011300000849001800
        78000113000000491800000000000000C000F7120000C8F3EB007770F5001200
        0000ECFD7F0002000000000000001300E8000100000001000A0000884000F877
        9000281800000100000000998400E6775400F71200000101010001D8F8001200
        450090FB7700801FF80077FFFF00FFFF6000F8120000AD84E6007760F8001200
        D80084E677000000000000FFFF0000000C0025F300000C25F300001800000000
        00000000000044F8120000400000000000000000000028F81200000000000000
        00000000000000000000000C000000000200000000000101120000872B00F877
        0000ECFD7F00000000000002000000006C00001A020098281800007FFF00FFFF
        00000000000098281800000500000000870031E6770084F8120000218600E677
        9800F81200006713000010FFFF0000007C00010000000C25F300000000000000
        7000F8120000ACF8120000D8F8001200100030001000F8400000105F5400E677
        7C0001000000D0F8120000D8F80012000800000000000E000000050505050505
        050505050505050505050505050505050505050505050505050505050505051C
        0F07050505050505050505050505050505050505050505050505050505151515
        1D1D0F0705050505050505050505050505050505050505050505050515030A12
        111111110F0705050505050505050505050505050505050505050515190B030A
        1215111111110F0505050505050505050505050505050505050505150B190B03
        0A1215111111110F0505050505050505050505050505050505050505150B190B
        030A12151111111D0F0505050505050505050505050505050505050505150B19
        0B030A12151111111D0F1C05050505050505050505050505050505050505150B
        190B030A121511111111110F0505051C071A071C050505050505050505050515
        0B190B030A12151A0F1111110F1A1D1D1111111D070505050505050505050505
        150B190B030A1215051A0F111111111111111111111D07050505050505050505
        05150B190B030A1505051C1A0F1111111111111111111D070505050505050505
        0505150B190B030A1A051A110D150011111111111111111D0505050505050505
        050505150B11170E150F000D1618091816021D1D111111110705050505050505
        05050505151515170E15021B1D0F15060F1B161B1D1111111D05050505050505
        0505050505050515171B11041313131313131D02021D11111105050505050505
        050505050505051C0D1C13101313131313131304021111111D05050505050505
        050505050505050D070808081001131313131313071111110705050505050505
        050505050505070D100808080810011313131313130F1D070505050505050505
        050505050505111B080808080808101001131313131C11050505050505050505
        0505050505050D01080808080808080810101010100114050505050505050505
        0505050505051508080808080808080808080808080811050505050505050505
        0505050505050008080808080808080808080808080815050505050505050505
        0505050505051110080808080808080808080808081011050505050505050505
        0505050505050F04080808080808080808080808081E0F050505050505050505
        050505050505071D1008050C0808080808080808081D07050505050505050505
        050505050505050F1E1005050C05080808080808131D05050505050505050505
        05050505050505071D13100505050508080810101D0705050505050505050505
        0505050505050505071D1E08080808080808131D070505050505050505050505
        050505050505050505071D0F1310080804071D07050505050505050505050505
        0505050505050505050505070F1100110F070505050505050505050505050505
        0505050505050505050505050505050505050505050505050505}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton2Click
    end
    object SpeedButton3: TSpeedButton
      Left = 699
      Top = 10
      Width = 37
      Height = 41
      Hint = #23548#20986
      Anchors = [akTop, akRight]
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DADADADADADA
        DADAADADADADADADADADDADADADADAD00000000000000006666007777777706E
        EF0AA0E6666606EEF0ADDA0E66606EEF060AADA0E606EEF0000DDADA006EEF0A
        DADAADAD06EEF00DADADDAD06EEF0670DADAAD06EEF0E6670DADD06EEF0A0E66
        70DA0FFFF0ADA0EEEE0D00000ADADA00000AADADADADADADADAD}
      ParentFont = False
      OnClick = SpeedButton3Click
    end
    object Label5: TLabel
      Left = 587
      Top = 25
      Width = 49
      Height = 13
      Caption = '       '
    end
    object SpeedButton4: TSpeedButton
      Left = 736
      Top = 10
      Width = 37
      Height = 41
      Hint = #25171#21360
      Anchors = [akTop, akRight]
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Glyph.Data = {
        36080000424D3608000000000000360400002800000020000000200000000100
        080000000000000400000000000000000000000100000001000040404000F0C0
        980078D0E000A88080002890C00068D0F80090808000F8F8E800E8E0E0008070
        700090D8E800C0C0C000F8F0D80080F0F80088A0B80068585800D8D0C80048B8
        E800E0D8D000D8D8D800F0D8C800D8B8B00058585800D0F0F8001080B00058C8
        D800A8B0B000A0A0A00080D8F800B8F0F800C8C8C80078C8E000707070008888
        8800F8D0C000A8A8A80050A8D000A0F0F800D0C0B000C0D0D8003850600078C0
        D80070B088009898980048A8D00070C0E800C8E0E000F8C8B000F0F0F000D8C0
        C00078D8F800B8B8B80098D0D00080E8F800F8E8D00090B8C00060C8F80080B0
        900080808000E8C0A8003898D00090D0E80050505000506878009090900098D8
        F80058C0F00090F0F800A0B0A800B8B0B000F8D8B00068686800A0D8F00070D8
        F800F8F0E800C0C8C800E0C8C000F8D0A800D8E0E00080D0E000F8E0C00070C0
        E00078E0F800E0E0D80050B8D800F8F8F80078787800F8E0C800D0C0C000B0F0
        F800A0B8C00030A0C800F8E8D800B8A8A800C0F8F80038A8D80088E8F80088E0
        F80078C8F00088E0E800F0D8B80078A8B80088D0E00048484800F8C8A00068C0
        F00090F8F800E8E8E800D0D0D000C0B8C000B0B0B8007078780088F0F800A8F8
        F800F8F0E0006060600038586000D8C8C80070D0F80080C8E80068C8E000C0B0
        B000F8D0B000B8C8D000C0C8C000E0E0E000B0B0B0005850500070E0F800F8E8
        C8007068680078E8F800D0C8C00080E0F800B8F8F80098D8E80048B0D00068C8
        F8003858680070C8E800E8C8C00080D0E800F8F8F000B0F8F800F8D8B80088D0
        E800010000000000000000000000000000000000000000000000000000000000
        01000000000000000000003F890043008000B5150000780113000080B5001500
        78000113000078B51500000000000000200000000000E4F812000070F5001200
        0000ECFD7F000200000000000000130094000000000001000A0000884000F877
        E000291600000100000000998400E6775400F71200000101010001D8F8001200
        450090FB7700801FF80077FFFF00FFFF6000F8120000AD84E6007760F8001200
        D80084E677000000000000FFFF000000AC004EEE0000AC4EEE00001800000000
        00000000000044F8120000400000000000000000000028F81200000000000000
        00000000000000000000000C000000000200000000000101120000872B00F877
        0000ECFD7F00000000000002000000003A00001A0200E8291600007FFF00FFFF
        000000000000E8291600000500000000870031E6770084F8120000218600E677
        9800F81200006713000010FFFF000000780001000000AC4EEE00000000000000
        7000F8120000ACF8120000D8F8001200100030001000F8400000105F5400E677
        780001000000D0F8120000D8F80012000800000000000E000000555555555555
        5555555555555555555555555555555555555555555555555555555555555555
        5555555555555555555555555555555555555555555555555555555555555555
        555555555555555556673E475555554716205555555555555555555555555555
        5555555555553A567D23563E677F0979563E3E20555555555555555555555555
        5555555555470B55307E337E0603062B1E132B3E677355555555555555555555
        555555201B30306B6B237E330967164756400B7D33203E3E5555555555555555
        553A3A6B55306B6B7D23237E6F003E16473A211B0B13132B3E55555555555555
        2B135555306B6B7D7D2323237E234056474756401B2323213E55555555555555
        335530306B6B6B6C33402B1B237E3333231B40563E407E3E5555555555555555
        33553030301E232B7E403A21402B237E33330B3340456D165555555555555555
        33556B1E1B1B0B136C1B1B2B40403A212B23450B1E4444165555555555555555
        230B1B236C4E136C136B6C0B45231B1B4021402B232A39165555555555555555
        400B136B13136C6C6B7D7D6B7D7D6C0B337E1B2B403A3A165555553F74748A28
        336B7D13136C1E7D7D331E0B0B1E6C4E6B136C0B33331B16555518043C3C3C04
        277D136C6C1E7D6B0B6B30307D6C1E0B330B6C1313130B2055555B1176050538
        5A53136C6C7D7D1E6B30306B306B6B6B7D130B330B1E7E2155552C5432050576
        8B5A0B1E1E1E0B1E7D6B3030306B6B6B6B6B6B6B1E7E21555555882432494949
        49498B650B136B23237E331E137D6B6B6B6B6B6C0B2B5555555554241C493232
        3232808D0855307E231A6E33331E6C136C6C1E7E2B5555555555192C41525252
        5252524F7B222F2F228C4C841E6C6C4E40232B55555555555555785F48353535
        3535353529014D4D6868687A467A645D21555555555555555555781148703560
        6060600D374646464646464646464D0F21555555555555555555024277257070
        707070707E9050505050505050503B822155555555555555555502892D867043
        43436A6326575757575757575781152B215555555555555555550249695E6A6A
        6A6A6A348C3636363636363636367C1E215555555555555555558D3238415E1D
        1D1D594B140C5C5C5C5C5C5C0C146C4E21555555555555555555916149054932
        3232627907727272727272724A151B2B555555555555555555553D6035358585
        8583375C4A4A4A4A4A4A4A4A8E032B55555555555555555555550A8F35353535
        0D6610555555555555555555122B55555555555555555555555551175E717171
        712E0E4431755858587575585855555555555555555555555555551F3D0A3D3D
        8777295555555555555555555555555555555555555555555555555555555555
        5555555555555555555555555555555555555555555555555555}
      ParentFont = False
      OnClick = SpeedButton4Click
    end
    object dtp1: TDateTimePicker
      Left = 41
      Top = 20
      Width = 97
      Height = 21
      Date = 38551.000000000000000000
      Time = 38551.000000000000000000
      TabOrder = 0
    end
    object dtp2: TDateTimePicker
      Left = 157
      Top = 20
      Width = 96
      Height = 21
      Date = 38551.000000000000000000
      Time = 38551.000000000000000000
      TabOrder = 1
    end
    object Edit1: TEdit
      Left = 319
      Top = 20
      Width = 68
      Height = 21
      TabOrder = 2
    end
    object Edit2: TEdit
      Left = 493
      Top = 19
      Width = 57
      Height = 21
      TabOrder = 3
      OnExit = Edit2Exit
    end
    object BitBtn1: TBitBtn
      Left = 392
      Top = 18
      Width = 26
      Height = 25
      TabOrder = 4
      OnClick = BitBtn1Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        777000000000000077000FFFFFFFFFF070000FFFFFFF000080070FFFFFF08778
        08770FFFFF0877F880770FFFFF07777870770FFFFF07F77870770FFFFF08FF78
        80770FFFFFF0877807770FFFFFFF000077770FFFFFFFFFF077770FFFFFFF0000
        77770FFFFFFF070777770FFFFFFF007777770000000007777777}
    end
    object BitBtn2: TBitBtn
      Left = 556
      Top = 17
      Width = 26
      Height = 25
      TabOrder = 5
      OnClick = BitBtn2Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        777000000000000077000FFFFFFFFFF070000FFFFFFF000080070FFFFFF08778
        08770FFFFF0877F880770FFFFF07777870770FFFFF07F77870770FFFFF08FF78
        80770FFFFFF0877807770FFFFFFF000077770FFFFFFFFFF077770FFFFFFF0000
        77770FFFFFFF070777770FFFFFFF007777770000000007777777}
    end
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=wisdompcb1077;Persist Security Info' +
      '=True;User ID=sa;Initial Catalog=wisdompcb_bak;Use Procedure for' +
      ' Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=W' +
      '119;Use Encryption for Data=False;Tag with column collation when' +
      ' possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 136
    Top = 160
  end
  object adosp1: TADOStoredProc
    Connection = ADOConnection1
    LockType = ltReadOnly
    ProcedureName = 'wzsp1407;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@date1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@date2'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@item'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Value = Null
      end
      item
        Name = '@cust'
        Attributes = [paNullable]
        DataType = ftString
        Size = 15
        Value = Null
      end
      item
        Name = '@so_rep'
        Attributes = [paNullable]
        DataType = ftString
        Size = 20
        Value = Null
      end>
    Left = 352
    Top = 136
  end
  object ds1: TDataSource
    AutoEdit = False
    DataSet = cds1
    Left = 312
    Top = 242
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 312
    Top = 280
  end
  object print1: TPrintDBGridEh
    DBGridEh = dbeh1
    Options = [pghOptimalColWidths]
    Page.BottomMargin = 1.000000000000000000
    Page.LeftMargin = 1.000000000000000000
    Page.RightMargin = 1.000000000000000000
    Page.TopMargin = 1.000000000000000000
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -11
    PageFooter.Font.Name = 'MS Sans Serif'
    PageFooter.Font.Style = []
    PageHeader.CenterText.Strings = (
      #24066#22330#36816#20316#29366#24577#34920)
    PageHeader.Font.Charset = DEFAULT_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -16
    PageHeader.Font.Name = #23435#20307
    PageHeader.Font.Style = []
    PrintFontName = #23435#20307
    Units = MM
    Left = 480
    Top = 144
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    Left = 168
    Top = 160
  end
  object ADODataSet1: TADODataSet
    Connection = ADOConnection1
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    Left = 347
    Top = 280
  end
  object cds1: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 344
    Top = 242
    object cds1date1: TDateTimeField
      FieldName = 'date1'
    end
    object cds1f1: TFloatField
      FieldName = 'f1'
    end
    object cds1f2: TFloatField
      FieldName = 'f2'
    end
    object cds1f3: TFloatField
      FieldName = 'f3'
    end
    object cds1f4: TFloatField
      FieldName = 'f4'
    end
    object cds1f5: TFloatField
      FieldName = 'f5'
    end
    object cds1f6: TFloatField
      FieldName = 'f6'
    end
    object cds1f7: TFloatField
      FieldName = 'f7'
    end
    object cds1f8: TFloatField
      FieldName = 'f8'
    end
    object cds1f9: TFloatField
      FieldName = 'f9'
    end
    object cds1f10: TFloatField
      FieldName = 'f10'
    end
    object cds1f11: TFloatField
      FieldName = 'f11'
    end
    object cds1f12: TFloatField
      FieldName = 'f12'
    end
    object cds1f13: TFloatField
      FieldName = 'f13'
    end
    object cds1f14: TFloatField
      FieldName = 'f14'
    end
    object cds1f15: TFloatField
      FieldName = 'f15'
    end
    object cds1f16: TFloatField
      FieldName = 'f16'
    end
    object cds1f17: TFloatField
      FieldName = 'f17'
    end
    object cds1f18: TFloatField
      FieldName = 'f18'
    end
    object cds1f19: TFloatField
      FieldName = 'f19'
    end
    object cds1f20: TFloatField
      FieldName = 'f20'
    end
    object cds1f21: TFloatField
      FieldName = 'f21'
    end
    object cds1f22: TFloatField
      FieldName = 'f22'
    end
    object cds1f23: TFloatField
      FieldName = 'f23'
    end
    object cds1f24: TFloatField
      FieldName = 'f24'
    end
    object cds1f25: TFloatField
      FieldName = 'f25'
    end
    object cds1f26: TFloatField
      FieldName = 'f26'
    end
    object cds1f27: TFloatField
      FieldName = 'f27'
    end
  end
end
