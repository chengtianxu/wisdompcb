object frmHalf_Finished_Prod_Deploy: TfrmHalf_Finished_Prod_Deploy
  Left = 272
  Top = 135
  AutoScroll = False
  Caption = #21322#25104#21697#20998#37197
  ClientHeight = 564
  ClientWidth = 802
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 265
    Width = 802
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object Splitter2: TSplitter
    Left = 0
    Top = 433
    Width = 802
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 802
    Height = 224
    Align = alTop
    DataSource = Dmcon.dsProdList
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghClearSelection, dghRowHighlight]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    TitleHeight = 18
    OnKeyDown = DBGridEh1KeyDown
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'SO_NO'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #35746#21333#32534#21495
        Width = 105
      end
      item
        Color = clWhite
        EditButtons = <>
        FieldName = 'WORK_ORDER_NUMBER'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #20316#19994#21333#21495
        Title.Color = clRed
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -13
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Width = 122
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_NUMBER'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #26412#21378#32534#21495
        Width = 91
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_DESC'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #23458#25143#22411#21495
        Width = 128
      end
      item
        EditButtons = <>
        FieldName = 'QUAN_SCH'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #25237#20135#25968'PCS'
        Width = 67
      end
      item
        EditButtons = <>
        FieldName = 'PARTS_PER_PANEL'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = 'Units'
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'panels'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = 'PNLS'
        Width = 48
      end
      item
        EditButtons = <>
        FieldName = 'SCH_COMPL_DATE'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #35745#21010#20837#20179
        Width = 68
      end
      item
        EditButtons = <>
        FieldName = 'ENT_DATETIME'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #25237#20135#26102#38388
        Width = 110
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 802
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 654
      Top = 13
      Width = 13
      Height = 13
      Caption = #21040
      Visible = False
    end
    object labelKey: TLabel
      Left = 527
      Top = 10
      Width = 7
      Height = 13
      Alignment = taRightJustify
    end
    object SpeedButton1: TSpeedButton
      Left = 734
      Top = 6
      Width = 59
      Height = 26
      Caption = #33258#21160#20998#37197
      Visible = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 342
      Top = 6
      Width = 59
      Height = 26
      Caption = #20462#25913#25968#37327
      Visible = False
      OnClick = SpeedButton2Click
    end
    object SpeedButton3: TSpeedButton
      Left = 61
      Top = 6
      Width = 71
      Height = 26
      Caption = #20851#38381#20316#19994#21333
      OnClick = SpeedButton3Click
    end
    object SpeedButton4: TSpeedButton
      Left = 264
      Top = 6
      Width = 71
      Height = 26
      Caption = #25171#24320#20316#19994#21333
      Visible = False
      OnClick = SpeedButton4Click
    end
    object BitBtn1: TBitBtn
      Left = 0
      Top = 6
      Width = 62
      Height = 26
      Hint = #36864#20986#31995#32479
      Caption = #36864#20986
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
    object BitBtn3: TBitBtn
      Left = 132
      Top = 6
      Width = 55
      Height = 26
      Hint = #21047#26032#24403#21069#25968#25454
      Caption = #21047#26032
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BitBtn3Click
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000610B0000610B00000001000000000000000000003300
        00006600000099000000CC000000FF0000000033000033330000663300009933
        0000CC330000FF33000000660000336600006666000099660000CC660000FF66
        000000990000339900006699000099990000CC990000FF99000000CC000033CC
        000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
        0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
        330000333300333333006633330099333300CC333300FF333300006633003366
        33006666330099663300CC663300FF6633000099330033993300669933009999
        3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
        330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
        66006600660099006600CC006600FF0066000033660033336600663366009933
        6600CC336600FF33660000666600336666006666660099666600CC666600FF66
        660000996600339966006699660099996600CC996600FF99660000CC660033CC
        660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
        6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
        990000339900333399006633990099339900CC339900FF339900006699003366
        99006666990099669900CC669900FF6699000099990033999900669999009999
        9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
        990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
        CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
        CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
        CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
        CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
        CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
        FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
        FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
        FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
        FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
        000000808000800000008000800080800000C0C0C00080808000191919004C4C
        4C00B2B2B200E5E5E5005A1E1E00783C3C0096646400C8969600FFC8C800465F
        82005591B9006EB9D7008CD2E600B4E6F000D8E9EC0099A8AC00646F7100E2EF
        F100C56A31000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000EEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE5E09
        095EEEEEEEEEEEEEEEEEEEEEEEEEE28181E2EEEEEEEEEEEEEEEEEEEEEE090910
        1009EEEEEEEEEEEEEEEEEEEEEE8181ACAC81EEEEEEEEEEEEEEEEEEEE09101009
        095EEEEEEEEEEEEEEEEEEEEE81ACAC8181E2EEEEEEEEEEEEEEEEEE5E0910095E
        EEEE09090909090909EEEEE281AC81E2EEEE81818181818181EEEE0910095EEE
        EEEE09101010101009EEEE81AC81E2EEEEEE81ACACACACAC81EEEE091009EEEE
        EEEEEE091010101009EEEE81AC81EEEEEEEEEE81ACACACAC81EEEE0910095EEE
        EEEEEE5E0910101009EEEE81AC81E2EEEEEEEEE281ACACAC81EEEE5E0910095E
        EE5E09091009101009EEEEE281AC81E2EEE28181AC81ACAC81EEEEEE09101009
        09091010095E091009EEEEEE81ACAC818181ACAC81E281AC81EEEEEEEE090910
        10100909EEEEEE0909EEEEEEEE8181ACACAC8181EEEEEE8181EEEEEEEEEE5E09
        09095EEEEEEEEEEEEEEEEEEEEEEEE2818181E2EEEEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE}
      NumGlyphs = 2
    end
    object BitBtn2: TBitBtn
      Left = 802
      Top = 2
      Width = 57
      Height = 30
      Hint = #23548#20986#25968#25454#21040'Excel'
      Caption = #23548#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Visible = False
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
    object edtKey: TEdit
      Left = 538
      Top = 6
      Width = 109
      Height = 21
      TabOrder = 4
      OnChange = edtKeyChange
      OnKeyPress = edtKeyKeyPress
    end
    object dtpStartDate: TDateTimePicker
      Left = 539
      Top = 6
      Width = 108
      Height = 21
      Date = 39226.661515115740000000
      Time = 39226.661515115740000000
      TabOrder = 5
      Visible = False
      OnChange = dtpStartDateChange
    end
    object dtpEndDate: TDateTimePicker
      Left = 670
      Top = 6
      Width = 108
      Height = 21
      Date = 39226.661631215280000000
      Time = 39226.661631215280000000
      TabOrder = 6
      Visible = False
      OnChange = dtpStartDateChange
    end
    object BitBtn4: TBitBtn
      Left = 187
      Top = 6
      Width = 57
      Height = 26
      Hint = #37325#26032#23450#20041#26597#35810#26465#20214
      Caption = #26597#35810
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BitBtn4Click
      Glyph.Data = {
        C6050000424DC605000000000000360400002800000014000000140000000100
        08000000000090010000C40E0000C40E0000000100000000000000000000E8E0
        0000D0A000006060600038383800F0700000B8B8C00020202000A8B0B000F0F0
        F800B8400000C0600800A0A0A000E0E0E800D8D8E000B8100000D0D8D800C0A0
        8800B8300000F8F8080098989800B0504000B0908800B8706000E0A86000E0D8
        C000F070380088888800F0D8B0005858580008101000E0D0B000B8504000E8C8
        A000F0B85000E8D8A800C8C8C800D8982000D8C0B00050505000C8803800F0C8
        8800F8500800D8A040007078780008080800E8C0880028283000F8980000E8F0
        F00040404000B0B8B800B8A0A000C0682800E0A87800F0800000C8D0D000C898
        8000E0A88000D8904800E0E0E000F0A0000070707000E0783000B0888800E8D0
        6800C8B8A800C8700800D8885000B850180028282000B8887800F0F0D8001818
        1800F070180090909000D8C05800E8B09800F8F0E000F8F0F00048484800B8C0
        C800F0C06000F8F8F800F8805800F8F0C80080808000B8906000B0B0B000D090
        5000F8600000D8D0C800E0A05800B8585800B8B00000B8481000D0D0B000D078
        3000C0702000F0A86800C0602000E8E8E800A8A8A800F0C0B800B0201000F0A8
        4000E0B89000B8B8B80068686800F0F0E800F0982000D8D0A800E8C88000F0E0
        C000B8380800F0800800D8E0E000C0C0C000F0680800B0B0B800C0601800E0B8
        7800F0981000C8781800C0C8C80010101800C8A09000E0B8600030303000F0F0
        F000C0B8B80028282800E8E0E000F0F8F8003838400078787800F0D8B800D8C8
        B800F0C89000E0E8E800B8601000D0883800F8680800D8D0B800E8D08800C8C8
        D000D0D0D000B8B0B00058586000D8D8D8002820200010101000E8E8F000F8F8
        F000D8D0D000B8786000B8480000F0780000F0880000E0B08000B8C0C000B818
        0000C0A88800B8300800B0504800F0E0B000E8D0B000F0D08800F8501000F880
        0800ECFD7F0002000000000000001300E8000100000001000A0000884000F877
        78004B1B00000100000000998400E6775400F71200000101010001D8F8001200
        450090FB7700801FF80077FFFF00FFFF6000F8120000AD84E6007760F8001200
        D80084E677000000000000FFFF0000003800A8F8000038A8F800001800000000
        00000000000044F8120000400000000000000000000028F81200000000000000
        00000000000000000000000C000000000200000000000101120000872B00F877
        0000ECFD7F00000000000002000000006C00001A0200804B1B00007FFF00FFFF
        000000000000804B1B00000500000000870031E6770084F8120000218600E677
        9800F81200006713000010FFFF00000020000100000038A8F800000000000000
        7000F8120000ACF8120000D8F8001200100030001000F8400000105F5400E677
        200001000000D0F8120000D8F80012000800000000000E0000005331B2861D86
        1D861D861D861DF81DC57431F62C9824801414572C572C6C2C6C6C1D6C6C77B2
        6CB2B26C2CDF1232DF6C6CF86CF86C861D1B006C1D0E94530E8A6E8A24240E24
        24240E6F6CB294800E531D31550E4C245524242424515551B26C322453318655
        248A0E557780000086576C002CB20E5398536C31305A55F8CC1424511486B2F3
        1D802453535386534C229457536F066F06242CB2806C065353551D5353511D53
        638C12152477248680F8245353318653531D7755358D35121B57066FF66C2453
        98536C535380240EAA6F631557123551B26C24535353945353B2065398554D35
        776F0624C56C065353551D53536C6F53535355246F152451806C245353319453
        532480535353246F7E8D531D946C245398536C53535314F85353AA2453531480
        576C245353532C5353555314C557776F14002C246C5706535355575353315353
        551B6CF857146E146C2C24535331866C775353555353535353225A35C5B20653
        9853570E57535353535353535353AA08143153315353986C866C2C6C6C1D941D
        861D8680775398535355}
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 268
    Width = 802
    Height = 40
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    object SpeedButton5: TSpeedButton
      Left = 5
      Top = 7
      Width = 108
      Height = 26
      Caption = #33258#21160#20998#37197#25968#37327
      Flat = True
      OnClick = SpeedButton5Click
    end
    object SpeedButton6: TSpeedButton
      Left = 117
      Top = 7
      Width = 108
      Height = 26
      Caption = #25163#24037#20998#37197#25968#37327
      Flat = True
      OnClick = SpeedButton6Click
    end
    object SpeedButton7: TSpeedButton
      Left = 232
      Top = 7
      Width = 108
      Height = 26
      Caption = #21462#28040#20998#37197
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
      OnClick = SpeedButton7Click
    end
    object Label3: TLabel
      Left = 504
      Top = 16
      Width = 288
      Height = 13
      Caption = #27880#24847':'#21482#33021#26159#21516#19968#25209#25237#20135#30340#20316#19994#21333#25165#33021#33258#21160#20998#37197
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object DBGridEh2: TDBGridEh
    Left = 0
    Top = 308
    Width = 802
    Height = 125
    Align = alTop
    DataSource = Dmcon.dsSubProds
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    TitleHeight = 18
    Columns = <
      item
        EditButtons = <>
        FieldName = 'bom_step'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #27493#39588
        Width = 55
      end
      item
        EditButtons = <>
        FieldName = 'manu_part_number'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #20135#21697#32534#21495
        Width = 148
      end
      item
        EditButtons = <>
        FieldName = 'qty_bom'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = 'BOM'#29992#37327
        Width = 137
      end
      item
        EditButtons = <>
        FieldName = 'Qty_Total_Req'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #38656#27714#24635#37327
        Width = 97
      end
      item
        EditButtons = <>
        FieldName = 'quan_issued'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #24050#21457#25918#25968#37327
        Width = 87
      end
      item
        EditButtons = <>
        FieldName = 'Qty_Needed'
        Footer.FieldName = 'Qty_Needed'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #24453#21457#25918#25968#37327
        Width = 93
      end>
  end
  object DBGridEh3: TDBGridEh
    Left = 0
    Top = 463
    Width = 802
    Height = 82
    Align = alClient
    DataSource = Dmcon.dsTransRec
    Flat = True
    FooterColor = clMoneyGreen
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghClearSelection, dghRowHighlight]
    ReadOnly = True
    SumList.Active = True
    TabOrder = 5
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    TitleHeight = 18
    Columns = <
      item
        EditButtons = <>
        FieldName = 'Work_order_Number'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #20316#19994#21333#21495
        Width = 127
      end
      item
        EditButtons = <>
        FieldName = 'TDate'
        Footer.FieldName = 'TDate'
        Footer.Value = #21512#35745':'
        Footer.ValueType = fvtStaticText
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #20998#37197#26102#38388
        Width = 146
      end
      item
        EditButtons = <>
        FieldName = 'Qty'
        Footer.FieldName = 'Qty'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #20998#37197#25968#37327
        Width = 157
      end>
  end
  object Panel3: TPanel
    Left = 0
    Top = 436
    Width = 802
    Height = 27
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 4
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 91
      Height = 13
      Caption = #24050#20998#37197#30340#20316#19994#21333
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 545
    Width = 802
    Height = 19
    Panels = <
      item
        Text = #20316#19994#21333#25968#37327#65306
        Width = 80
      end
      item
        Width = 50
      end>
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 504
    Top = 496
    object N1: TMenuItem
      Caption = #21462#28040#20998#37197
      OnClick = N1Click
    end
  end
end
