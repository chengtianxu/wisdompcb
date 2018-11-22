object frmMain: TfrmMain
  Left = 319
  Top = 95
  Width = 1040
  Height = 679
  Caption = #32771#21220#26126#32454#19982#32479#35745
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl2: TPanel
    Left = 0
    Top = 39
    Width = 1032
    Height = 609
    Align = alClient
    TabOrder = 0
    object ehMain: TDBGridEh
      Left = 1
      Top = 1
      Width = 1030
      Height = 579
      TabStop = False
      Align = alClient
      DataSource = ds1
      FooterColor = clWindow
      FooterFont.Charset = ANSI_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      FooterRowCount = 1
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      OptionsEh = [dghHighlightFocus, dghClearSelection]
      PopupMenu = pmMain
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      UseMultiTitle = True
      OnDrawColumnCell = ehMainDrawColumnCell
      OnTitleClick = ehMainTitleClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'employeecode'
          Footers = <>
          ReadOnly = True
          Title.Caption = #24037#21495
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'ChineseName'
          Footers = <>
          ReadOnly = True
          Title.Caption = #22995#21517
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'CheckDate'
          Footers = <>
          ReadOnly = True
          Title.Caption = #26085#26399
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'XQ'
          Footers = <>
          Title.Caption = #26143#26399
          Width = 20
        end
        item
          EditButtons = <>
          FieldName = 'RestColor'
          Footers = <>
          Title.Caption = #20551#26085
          Width = 20
          OnUpdateData = ehMainColumns4UpdateData
        end
        item
          EditButtons = <>
          FieldName = 'ClassName'
          Footers = <>
          Title.Caption = #29677#27425
          Width = 50
          OnUpdateData = ehMainColumns5UpdateData
        end
        item
          AutoFitColWidth = False
          EditButtons = <>
          FieldName = 'departmentname'
          Footers = <>
          ReadOnly = True
          Title.Caption = #37096#38376
          Width = 65
        end
        item
          EditButtons = <>
          FieldName = 'item'
          Footers = <>
          ReadOnly = True
          Title.Caption = #32844#21153
          Width = 61
        end
        item
          EditButtons = <>
          FieldName = 'classgrouptype'
          Footers = <>
          Title.Caption = #29677#32452#31867#22411
          Width = 40
          OnUpdateData = ehMainColumns7UpdateData
        end
        item
          DisplayFormat = 'HH:MM'
          EditButtons = <>
          FieldName = 'OnDutyTime1'
          Footers = <>
          ReadOnly = True
          Title.Caption = #26102#38388#27573'1|'#31614#21040
          Width = 50
        end
        item
          DisplayFormat = 'HH:MM'
          EditButtons = <>
          FieldName = 'OffDutyTime1'
          Footers = <>
          ReadOnly = True
          Title.Caption = #26102#38388#27573'1|'#31614#36864
          Width = 50
        end
        item
          DisplayFormat = 'HH:MM'
          EditButtons = <>
          FieldName = 'OnDutyTime2'
          Footers = <>
          ReadOnly = True
          Title.Caption = #26102#38388#27573'2|'#31614#21040
          Width = 50
        end
        item
          DisplayFormat = 'HH:MM'
          EditButtons = <>
          FieldName = 'OffDutyTime2'
          Footers = <>
          ReadOnly = True
          Title.Caption = #26102#38388#27573'2|'#31614#36864
          Width = 50
        end
        item
          DisplayFormat = 'HH:MM'
          EditButtons = <>
          FieldName = 'OnDutyTime3'
          Footers = <>
          ReadOnly = True
          Title.Caption = #26102#38388#27573'3|'#31614#21040
          Width = 50
        end
        item
          DisplayFormat = 'HH:MM'
          EditButtons = <>
          FieldName = 'OffDutyTime3'
          Footers = <>
          ReadOnly = True
          Title.Caption = #26102#38388#27573'3|'#31614#36864
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'YTNote'
          Footers = <>
          ReadOnly = True
          Title.Caption = #24322#24120#35828#26126
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'accountname'
          Footers = <>
          ReadOnly = True
          Title.Caption = #36134#21517
          Width = 50
        end
        item
          DisplayFormat = '0.00'
          EditButtons = <>
          FieldName = 'RWT'
          Footer.DisplayFormat = '0.00'
          Footer.ValueType = fvtSum
          Footers = <>
          ReadOnly = True
          Title.Caption = #23454#38469#20986#21220'|'#27491#29677
          Width = 35
        end
        item
          DisplayFormat = '0.00'
          EditButtons = <>
          FieldName = 'ROT'
          Footer.DisplayFormat = '0.00'
          Footer.ValueType = fvtSum
          Footers = <>
          ReadOnly = True
          Title.Caption = #23454#38469#20986#21220'|'#21152#29677
          Width = 35
        end
        item
          DisplayFormat = '0.00'
          EditButtons = <>
          FieldName = 'SWT'
          Footer.DisplayFormat = '0.00'
          Footer.ValueType = fvtSum
          Footers = <>
          ReadOnly = True
          Title.Caption = #35745#21010#20986#21220'|'#27491#29677
          Width = 35
        end
        item
          DisplayFormat = '0.00'
          EditButtons = <>
          FieldName = 'OWT'
          Footer.DisplayFormat = '0.00'
          Footer.ValueType = fvtSum
          Footers = <>
          ReadOnly = True
          Title.Caption = #35745#21010#20986#21220'|'#21152#29677
          Width = 35
        end
        item
          EditButtons = <>
          FieldName = 'SumCN'
          Footers = <>
          ReadOnly = True
          Title.Caption = #36831#21040'|'#27425
          Width = 20
        end
        item
          EditButtons = <>
          FieldName = 'SumCT'
          Footers = <>
          ReadOnly = True
          Title.Caption = #36831#21040'|'#26102
          Width = 20
        end
        item
          EditButtons = <>
          FieldName = 'SumZN'
          Footers = <>
          ReadOnly = True
          Title.Caption = #26089#36864'|'#27425
          Width = 20
        end
        item
          EditButtons = <>
          FieldName = 'SumZT'
          Footers = <>
          ReadOnly = True
          Title.Caption = #26089#36864'|'#26102
          Width = 20
        end
        item
          EditButtons = <>
          FieldName = 'SumKN'
          Footers = <>
          ReadOnly = True
          Title.Caption = #26103#24037'|'#27425
          Width = 20
        end
        item
          EditButtons = <>
          FieldName = 'SumKT'
          Footers = <>
          ReadOnly = True
          Title.Caption = #26103#24037'|'#26102
          Width = 20
        end
        item
          EditButtons = <>
          FieldName = 'SumLN'
          Footers = <>
          ReadOnly = True
          Title.Caption = #35831#20551'|'#27425
          Width = 20
        end
        item
          EditButtons = <>
          FieldName = 'SumLT'
          Footers = <>
          ReadOnly = True
          Title.Caption = #35831#20551'|'#26102
          Width = 20
        end>
    end
    object pnl4: TPanel
      Left = 1
      Top = 580
      Width = 1030
      Height = 28
      Align = alBottom
      TabOrder = 1
      DesignSize = (
        1030
        28)
      object lbl1: TLabel
        Left = 1030
        Top = 8
        Width = 52
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = #35760#24405#25968#65306
      end
      object lblNum: TLabel
        Left = 1081
        Top = 8
        Width = 7
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = '0'
      end
      object Label1: TLabel
        Left = 896
        Top = 8
        Width = 52
        Height = 13
        Caption = #35760#24405#25968#65306
      end
      object lbCount: TLabel
        Left = 952
        Top = 8
        Width = 7
        Height = 13
      end
      object cbxSelectAll: TCheckBox
        Left = 8
        Top = 8
        Width = 65
        Height = 15
        Caption = #20840#36873
        TabOrder = 0
        OnClick = cbxSelectAllClick
      end
      object pb1: TProgressBar
        Left = 81
        Top = 5
        Width = 808
        Height = 17
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
      end
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 1032
    Height = 39
    Align = alTop
    TabOrder = 1
    object lbl5: TLabel
      Left = 684
      Top = 16
      Width = 140
      Height = 13
      Caption = #35831#21450#26102#26597#35810#30097#33258#31163#20154#21592
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnRefresh: TBitBtn
      Left = 216
      Top = 4
      Width = 65
      Height = 31
      Caption = #21047#26032
      TabOrder = 0
      OnClick = btnRefreshClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADABFBFBDADADADADADDADADBFADADADADAADADAD000DADADADDADAD0FBF0DA
        DADAADAD0F7FBF0DADADDAD0F7F87BF0DADAAD0F7F87BFB70DADD0F7F87BFB78
        80DA000F87BFB78880ADDAD00BFB78880ADAADADA0B7888740ADDADADA088804
        440AADADADA000A04440DADADADADADA0440ADADADADADADA00D}
    end
    object btnSearch: TBitBtn
      Left = -1
      Top = 4
      Width = 65
      Height = 31
      Caption = #26597#35810
      TabOrder = 1
      OnClick = btnSearchClick
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
    object grp1: TGroupBox
      Left = 291
      Top = 0
      Width = 303
      Height = 38
      Caption = #36807#28388#65288#36755#20837#21518#25353#22238#36710#65289
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object lbl2: TLabel
        Left = 18
        Top = 17
        Width = 26
        Height = 13
        Caption = #24037#21495
        Visible = False
      end
      object lbl3: TLabel
        Left = 138
        Top = 15
        Width = 13
        Height = 13
        Caption = #20108
      end
      object cbbFilter1: TComboBox
        Left = 8
        Top = 12
        Width = 65
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 0
        Text = #24037#21495
        Items.Strings = (
          #24037#21495
          #22995#21517
          #29677#27425
          #37096#38376
          #29677#32452#31867#22411
          #24322#24120#35828#26126
          #24080#21517
          #20551#26085#31867#22411
          #32844#21153)
      end
      object cbbFilter2: TComboBox
        Left = 156
        Top = 12
        Width = 59
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 1
        TabOrder = 1
        Text = #22995#21517
        Items.Strings = (
          #24037#21495
          #22995#21517
          #29677#27425
          #37096#38376
          #29677#32452#31867#22411
          #24322#24120#35828#26126
          #24080#21517
          #20551#26085#31867#22411)
      end
      object edtFilter1: TEdit
        Left = 72
        Top = 11
        Width = 64
        Height = 21
        TabOrder = 2
        OnChange = edtFilter1Change
        OnKeyPress = edtFilter1KeyPress
        OnKeyUp = edtFilter1KeyUp
      end
      object edtFilter2: TEdit
        Left = 212
        Top = 12
        Width = 64
        Height = 21
        TabOrder = 3
        OnKeyUp = edtFilter1KeyUp
      end
    end
    object grp2: TGroupBox
      Left = 871
      Top = -1
      Width = 146
      Height = 38
      Caption = #21047#26032
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Visible = False
      object lbl4: TLabel
        Left = 109
        Top = 16
        Width = 26
        Height = 13
        Caption = #35828#26126
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = [fsItalic, fsUnderline]
        ParentFont = False
        OnClick = lbl4Click
      end
      object rbAuto: TRadioButton
        Left = 6
        Top = 16
        Width = 50
        Height = 17
        Caption = #33258#21160
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object rbManu: TRadioButton
        Left = 56
        Top = 16
        Width = 51
        Height = 17
        Caption = #25163#21160
        TabOrder = 1
      end
    end
    object btnCheck: TBitBtn
      Left = 64
      Top = 3
      Width = 78
      Height = 32
      Caption = #24037#26102#27719#24635
      TabOrder = 4
      OnClick = btnCheckClick
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000420B0000420B00000001000000000000000000003300
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
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE5E095EEEEE
        EEEEEEEEEEEEEEEEEEEEEEAC81ACEEEEEEEEEEEEEEEEEEEEEEEEEE090909EEEE
        0000000000000000EEEEEE818181EEEE8181818181818181EEEEEE5E095EEEEE
        EEEEEEEEEEEEEEEEEEEEEEAC81ACEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE5E095EEEEE
        EEEEEEEEEEEEEEEEEEEEEEAC81ACEEEEEEEEEEEEEEEEEEEEEEEEEE090909EEEE
        0000000000000000EEEEEE818181EEEE8181818181818181EEEEEE5E095EEEEE
        EEEEEEEEEEEEEEEEEEEEEEAC81ACEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE5E095EEEEE
        EEEEEEEEEEEEEEEEEEEEEEAC81ACEEEEEEEEEEEEEEEEEEEEEEEEEE090909EEEE
        0000000000000000EEEEEE818181EEEE8181818181818181EEEEEE5E095EEEEE
        EEEEEEEEEEEEEEEEEEEEEEAC81ACEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE}
      NumGlyphs = 2
    end
    object btn_export: TButton
      Left = 601
      Top = 9
      Width = 75
      Height = 25
      Caption = #23548#20986'Excel'
      TabOrder = 5
      OnClick = btn_exportClick
    end
    object BitBtn1: TBitBtn
      Left = 142
      Top = 4
      Width = 75
      Height = 31
      Caption = #30097#33258#31163
      TabOrder = 6
      OnClick = BitBtn1Click
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
  end
  object ds1: TDataSource
    DataSet = DM1.adsMain
    Left = 921
    Top = 416
  end
  object pmMain: TPopupMenu
    OnPopup = pmMainPopup
    Left = 440
    Top = 176
    object mniAutoCalc: TMenuItem
      Tag = 1
      Caption = #33258#21160#35745#31639
      OnClick = mniAutoCalcClick
    end
    object mniChengeBC: TMenuItem
      Tag = 2
      Caption = #20462#25913#29677#27425
      OnClick = mniChengeBCClick
    end
    object mniChangeBZ: TMenuItem
      Tag = 3
      Caption = #20462#25913#29677#32452#31867#21035
      OnClick = mniChengeBCClick
    end
    object mniChangeJR: TMenuItem
      Tag = 4
      Caption = #20462#25913#20551#26085
      OnClick = mniChengeBCClick
    end
    object N9: TMenuItem
      Caption = '-'
      Visible = False
    end
    object mniYSJL: TMenuItem
      Tag = 6
      Caption = #21407#22987#35760#24405
      OnClick = mniYSJLClick
    end
    object N13: TMenuItem
      Caption = '-'
      Visible = False
    end
    object mniClearYT: TMenuItem
      Tag = 5
      Caption = #28165#31354#24322#24120
      OnClick = mniClearYTClick
    end
    object mniCLear: TMenuItem
      Tag = 7
      Caption = #28165#31354
      OnClick = mniCLearClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object NExcel1: TMenuItem
      Tag = 8
      Caption = #23548#20986#21040'Excel'
      OnClick = NExcel1Click
    end
    object mniChushiHua: TMenuItem
      Tag = 9
      Caption = #21021#22987#21270
      OnClick = mniChushiHuaClick
    end
    object N12: TMenuItem
      Tag = 10
      Caption = #32771#21220#30003#35831#26126#32454
      OnClick = N12Click
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object mniLocked: TMenuItem
      Tag = 12
      Caption = #21152#38145
      OnClick = mniLockedClick
    end
    object mniUnLocked: TMenuItem
      Tag = 13
      Caption = #35299#38145
      OnClick = mniLockedClick
    end
    object mniPLBK: TMenuItem
      Tag = 14
      Caption = #21518#21488#25209#37327#34917#21345
      OnClick = mniPLBKClick
    end
    object N14: TMenuItem
      Tag = 15
      Caption = #37096#38376#20986#21220#27719#24635
      OnClick = N14Click
    end
  end
end
