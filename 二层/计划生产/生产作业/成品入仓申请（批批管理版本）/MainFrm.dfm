object frmMain: TfrmMain
  Left = 217
  Top = 148
  Width = 1179
  Height = 672
  Caption = #20135#25104#21697#20837#20179#25552#20132
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sgrid1: TStringGrid
    Left = 232
    Top = 108
    Width = 248
    Height = 158
    ColCount = 3
    FixedCols = 0
    RowCount = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
    Visible = False
    ColWidths = (
      83
      160
      79)
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1163
    Height = 34
    Align = alTop
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 0
      Top = 2
      Width = 57
      Height = 30
      Hint = #36864#20986#31995#32479
      Caption = #36864#20986
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
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
    object btnRefresh: TBitBtn
      Left = 59
      Top = 2
      Width = 57
      Height = 30
      Hint = #21047#26032#24403#21069#25968#25454
      Caption = #21047#26032
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
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
    object BitBtn2: TBitBtn
      Left = 116
      Top = 2
      Width = 57
      Height = 30
      Hint = #23548#20986#25968#25454#21040'Excel'
      Caption = #23548#20986
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BitBtn2Click
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
    object BitBtn4: TBitBtn
      Left = 173
      Top = 2
      Width = 57
      Height = 30
      Hint = #37325#26032#23450#20041#26597#35810#26465#20214
      Caption = #26597#35810
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Visible = False
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
    object btnModiyWeight: TBitBtn
      Left = 174
      Top = 2
      Width = 78
      Height = 30
      Hint = #20462#25913#20135#21697#21333#37325'(g)'
      Caption = #20462#25913#21333#37325
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = btnModiyWeightClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        080000000000000100000000000000000000000100000000000000180000D8D8
        D80010A0680000607000C0C0C000105018008880800038A0B00070707000A0A0
        A000F8F8F800B0B0B0005050500050787800484840003030300060A068002860
        C00080B0B8002828280030905800F0F0F00018907000105858004078D0000028
        30002848780070C0B80038A09800E8E8E8000848500048B8F000B8F0C0001048
        A000D0D0D0005878B800003818009090900080D8F80078D0A0002088580058C0
        E8004070B0001840700040704800A8A8A80040A0680068606000202020002070
        380060C8C8002858B00088F0C00060C89800287848004088A80020485800E0E0
        E000A8E0A800506060003098D000C8C8C8002038400000704000487850003048
        980038A0600078A0E0006090D000389058002880500030A0D80028303000B0E8
        F80058C898001878A000488098002088C00090B0F8007878780068A0F0003058
        800030A0D00028485000186838005890E0000870580040403800B8B8B8000898
        5800003048001010100070C8E00028A8680060888000189898004078C0000868
        68009898980080C0D80088E0E000107870005858580068A8880050A0C0002898
        6000306038004098D0002868780080C8980058A870001840880060C8F0002840
        48000060580078707800488878001848300070B8D00008381800189088002858
        68004090C0001020280080808000080808003870C0003060900088D8A8006060
        600040A8A8000040480088888800004020006088E00030688800007878000070
        7000305898001818180038383800A098A0004040400048708000085060009090
        98006868680038A8B8000030200088E0F80020487000407850002078400030A8
        70004848480088889000787070009098900080D0A0003898580038A0680048A0
        68001848A000C0651A00000000000000C000F7120000C8F3EB007770F5001200
        0000ECFD7F0002000000000000001300E8000100000001000A0000884000F877
        90004C1A00000100000000998400E6775400F71200000101010001D8F8001200
        450090FB7700801FF80077FFFF00FFFF6000F8120000AD84E6007760F8001200
        D80084E677000000000000FFFF0000003000F1F5000030F1F500001800000000
        00000000000044F8120000400000000000000000000028F81200000000000000
        00000000000000000000000C000000000200000000000101120000872B00F877
        0000ECFD7F00000000000002000000006C00001A0200984C1A00007FFF00FFFF
        000000000000984C1A00000500000000870031E6770084F8120000218600E677
        9800F81200006713000010FFFF00000020000100000030F1F500000000000000
        7000F8120000ACF8120000D8F8001200100030001000F8400000105F5400E677
        200001000000D0F8120000D8F80012000800000000000E0000000A0A15A40F19
        0F190F190F19B2490AA70A0AC562BF58BF62BF58BF5892A40A0A0A0A10629279
        92929292929222C50A0A150A92585858585862062362BFA40A150A0A9C220667
        6292660F0F0F62C50AA70A0A2322492249B23C79C50F66A40A0A0A0A10A76262
        58A495E070190EA40A0A150A231515150A064479619F19A40A150A0A060A58BF
        58227935E6A0A0A4150A0A0A230A0A0A0A0A220534A01959C5390A0A060A58BF
        58BF22236A3563193C2B150A2315150A0A15150A22CC7E447E920A0A9CA76262
        62626262589219500F0A0A0A2322492049224922491558A40A0A0A0AB20A2263
        22222263222215A40A0A150A490F9B06230623922306F6220A15}
    end
  end
  object pgc1: TPageControl
    Left = 0
    Top = 34
    Width = 1163
    Height = 599
    ActivePage = ts1
    Align = alClient
    TabOrder = 2
    object ts1: TTabSheet
      Caption = #26412#21378#32534#21495#25552#20132
      ImageIndex = 2
      object eh0: TDBGridEh
        Left = 0
        Top = 31
        Width = 1155
        Height = 540
        Align = alClient
        DataSource = ds25
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        FooterRowCount = 1
        PopupMenu = pm1
        ReadOnly = True
        SumList.Active = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnKeyDown = eh0KeyDown
        OnTitleClick = eh0TitleClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'MANU_PART_NUMBER'
            Footers = <>
            Title.Caption = #26412#21378#32534#21495
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'MANU_PART_DESC'
            Footers = <>
            Title.Caption = #23458#25143#22411#21495
            Width = 120
          end
          item
            EditButtons = <>
            FieldName = 'rkey25'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'OnLinePCS'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #22312#32447'PCS'#25968
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'OnLinePnl'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #22312#32447'PNL'#25968
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'ABBR_NAME'
            Footers = <>
            Title.Caption = #23458#25143#31616#31216
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'CUST_CODE'
            Footers = <>
            Title.Caption = #23458#25143#20195#30721
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'ORIG_CUSTOMER'
            Footers = <>
            Title.Caption = #20851#32852#21407#23458#25143
            Width = 80
          end>
      end
      object pnl3: TPanel
        Left = 0
        Top = 0
        Width = 1155
        Height = 31
        Align = alTop
        TabOrder = 1
        object edtFilter25: TLabeledEdit
          Left = 283
          Top = 4
          Width = 121
          Height = 21
          EditLabel.Width = 52
          EditLabel.Height = 13
          EditLabel.Caption = #26412#21378#32534#21495
          LabelPosition = lpLeft
          LabelSpacing = 8
          TabOrder = 0
          OnChange = edtFilter25Change
        end
      end
    end
    object ts2: TTabSheet
      Caption = #25353#20316#19994#21333#25552#20132
      ImageIndex = 3
      object pnl4: TPanel
        Left = 0
        Top = 0
        Width = 1163
        Height = 31
        Align = alTop
        TabOrder = 0
        object edt06Filter: TLabeledEdit
          Left = 283
          Top = 4
          Width = 121
          Height = 21
          EditLabel.Width = 52
          EditLabel.Height = 13
          EditLabel.Caption = #26412#21378#32534#21495
          LabelPosition = lpLeft
          LabelSpacing = 8
          TabOrder = 0
          OnChange = edtFilter25Change
        end
      end
      object eh3: TDBGridEh
        Left = 0
        Top = 31
        Width = 1163
        Height = 548
        Align = alClient
        DataSource = ds06
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        FooterRowCount = 1
        PopupMenu = pm1
        ReadOnly = True
        SumList.Active = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnKeyDown = eh0KeyDown
        OnTitleClick = eh0TitleClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'MANU_PART_NUMBER'
            Footers = <>
            Title.Caption = #26412#21378#32534#21495
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'WORK_ORDER_NUMBER'
            Footers = <>
            Title.Caption = #20316#19994#21333#21495
            Width = 120
          end
          item
            EditButtons = <>
            FieldName = 'MANU_PART_DESC'
            Footers = <>
            Title.Caption = #23458#25143#22411#21495
            Width = 120
          end
          item
            EditButtons = <>
            FieldName = 'QTY_BACKLOG'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #22312#32447'PCS'#25968
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'ABBR_NAME'
            Footers = <>
            Title.Caption = #23458#25143#31616#31216
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'CUST_CODE'
            Footers = <>
            Title.Caption = #23458#25143#20195#30721
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'ORIG_CUSTOMER'
            Footers = <>
            Title.Caption = #20851#32852#21407#23458#25143
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'SALES_ORDER'
            Footers = <>
            Title.Caption = #38144#21806#35746#21333
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'cust_po'
            Footers = <>
            Title.Caption = #23458#25143#35746#21333#21495
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'INTIME'
            Footers = <>
            Title.Caption = #25509#21463#26102#38388
            Width = 100
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = #24453#20837#20179#26126#32454
      ImageIndex = 1
      object eh1: TDBGridEh
        Left = 0
        Top = 31
        Width = 1155
        Height = 540
        Align = alClient
        AllowedOperations = [alopUpdateEh, alopAppendEh]
        DataSource = ds251
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        FooterRowCount = 1
        PopupMenu = pm1
        ReadOnly = True
        SumList.Active = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnKeyDown = eh0KeyDown
        OnTitleClick = eh0TitleClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'manu_part_number'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #26412#21378#32534#21495
            Width = 81
          end
          item
            EditButtons = <>
            FieldName = 'manu_part_desc'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #23458#25143#22411#21495
            Width = 149
          end
          item
            EditButtons = <>
            FieldName = 'REPORT_UNIT_VALUE1'
            Footers = <>
            Title.Caption = #21333#37325'('#20811')'
            Width = 54
          end
          item
            EditButtons = <>
            FieldName = 'WORK_ORDER_NUMBER'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #20316#19994#21333#21495
            Width = 142
          end
          item
            EditButtons = <>
            FieldName = 'cpcs'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #24453#20837#24211'PCS'
            Width = 70
          end
          item
            EditButtons = <>
            FieldName = 'cpnl'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #24453#20837#24211'PNL'
            Width = 70
          end
          item
            EditButtons = <>
            FieldName = 'ctime'
            Footers = <>
            Title.Caption = #25552#20132#26102#38388
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'cuser'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #25552#20132#20154
            Width = 51
          end
          item
            EditButtons = <>
            FieldName = 'ABBR_NAME'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #24037#21378
            Width = 58
          end
          item
            EditButtons = <>
            FieldName = 'BKNote'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #22791#27880
            Width = 124
          end
          item
            EditButtons = <>
            FieldName = 'sales_order'
            Footers = <>
            Title.Caption = #38144#21806#35746#21333
            Width = 110
          end
          item
            EditButtons = <>
            FieldName = 'PO_NUMBER'
            Footers = <>
            Title.Caption = #23458#25143#35746#21333
            Width = 110
          end
          item
            EditButtons = <>
            FieldName = 'ouser'
            Footers = <>
            Title.Caption = #26368#21518#25805#20316#20154
            Width = 70
          end
          item
            EditButtons = <>
            FieldName = 'otime'
            Footers = <>
            Title.Caption = #26368#21518#25805#20316#26102#38388
            Width = 110
          end
          item
            EditButtons = <>
            FieldName = 'status'
            Footers = <>
            KeyList.Strings = (
              '0'
              '1'
              '2'
              '3')
            PickList.Strings = (
              #24453#20837#20179
              #24050#20837#20179
              #21462#28040#20837#20179#25552#20132
              #20179#24211#36864#22238)
            Title.Caption = #29366#24577
          end
          item
            EditButtons = <>
            FieldName = 'ZhouQi'
            Footers = <>
            Title.Caption = #21608#26399
            Width = 50
          end>
      end
      object pnl1: TPanel
        Left = 0
        Top = 0
        Width = 1155
        Height = 31
        Align = alTop
        TabOrder = 1
        object lbl1: TLabel
          Left = 120
          Top = 8
          Width = 39
          Height = 13
          Caption = #26102#38388#65306
        end
        object lbl2: TLabel
          Left = 304
          Top = 8
          Width = 13
          Height = 13
          Caption = #21040
        end
        object cbb1: TComboBox
          Left = 9
          Top = 4
          Width = 89
          Height = 21
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 0
          Text = #24453#20837#24211
          OnChange = cbb1Change
          Items.Strings = (
            #24453#20837#24211
            #24050#32463#20837#24211
            #21462#28040#25552#20132
            #20179#24211#36864#22238)
        end
        object dtp1: TDateTimePicker
          Left = 167
          Top = 3
          Width = 114
          Height = 21
          Date = 41810.000000000000000000
          Time = 41810.000000000000000000
          TabOrder = 1
          OnChange = cbb1Change
        end
        object dtp2: TDateTimePicker
          Left = 335
          Top = 2
          Width = 114
          Height = 21
          Date = 41810.999988425920000000
          Time = 41810.999988425920000000
          TabOrder = 2
          OnChange = cbb1Change
        end
        object edtFilter251: TLabeledEdit
          Left = 584
          Top = 4
          Width = 121
          Height = 21
          EditLabel.Width = 52
          EditLabel.Height = 13
          EditLabel.Caption = #26412#21378#32534#21495
          LabelPosition = lpLeft
          LabelSpacing = 8
          TabOrder = 3
          OnChange = edtFilter25Change
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #24453#20837#20179#27719#24635
      ImageIndex = 2
      object eh2: TDBGridEh
        Left = 0
        Top = 31
        Width = 1155
        Height = 541
        Align = alClient
        AllowedOperations = [alopUpdateEh, alopAppendEh]
        DataSource = ds251Sum
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnKeyDown = eh0KeyDown
        OnTitleClick = eh0TitleClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'manu_part_number'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #26412#21378#32534#21495
            Width = 175
          end
          item
            EditButtons = <>
            FieldName = 'manu_part_desc'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #23458#25143#22411#21495
            Width = 213
          end
          item
            EditButtons = <>
            FieldName = 'qty'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #25968#37327'PCS'
            Width = 91
          end
          item
            EditButtons = <>
            FieldName = 'qty_panel'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #25968#37327'Panel'
            Width = 103
          end
          item
            EditButtons = <>
            FieldName = 'sq'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #38754#31215
          end
          item
            EditButtons = <>
            FieldName = 'po_number'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #23458#25143#35746#21333#21495
            Width = 124
          end
          item
            EditButtons = <>
            FieldName = 'abbr_name'
            Footers = <>
            Title.Caption = #24037#21378
            Width = 80
          end>
      end
      object pnl2: TPanel
        Left = 0
        Top = 0
        Width = 1155
        Height = 31
        Align = alTop
        TabOrder = 1
        object edtFilter251Sum: TLabeledEdit
          Left = 283
          Top = 4
          Width = 121
          Height = 21
          EditLabel.Width = 52
          EditLabel.Height = 13
          EditLabel.Caption = #26412#21378#32534#21495
          LabelPosition = lpLeft
          LabelSpacing = 8
          TabOrder = 0
          OnChange = edtFilter25Change
        end
      end
    end
  end
  object ads25: TADODataSet
    Connection = dm1.con1
    CursorType = ctStatic
    CommandText = 
      'SELECT d25.MANU_PART_NUMBER,d25.MANU_PART_DESC,d25.RKEY as rkey2' +
      '5,SUM(d56.QTY_BACKLOG) as OnLinePCS, d25.REPORT_UNIT_VALUE1,'#13#10'SU' +
      'M(d56.PANELS) AS OnLinePnl,d10.ABBR_NAME,d10.CUST_CODE,d25.ORIG_' +
      'CUSTOMER,d25.auth_Storage, d25.PWeight'#13#10'FROM Data0025 d25'#13#10'INNER' +
      ' JOIN Data0006 d06 on d06.BOM_PTR = d25.RKEY'#13#10'INNER JOIN Data005' +
      '6 d56 ON d56.WO_PTR = d06.RKEY'#13#10'left JOIN data0492 d492 ON d06.C' +
      'UT_NO = d492.CUT_NO'#13#10'left JOIN Data0010 d10 ON d10.RKEY = d492.C' +
      'OMPLETED'#13#10'INNER JOIN Data0015 d15 ON d15.RKEY = d56.LOC_PTR'#13#10'WHE' +
      'RE d06.PROD_STATUS = 5'#13#10'GROUP BY d25.MANU_PART_NUMBER,d25.MANU_P' +
      'ART_DESC,d25.RKEY,d10.ABBR_NAME,d10.CUST_CODE,d25.ORIG_CUSTOMER,' +
      'd25.REPORT_UNIT_VALUE1,d25.auth_Storage,d25.PWeight'
    Parameters = <>
    Left = 100
    Top = 162
    object ads25MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ads25MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ads25rkey25: TAutoIncField
      FieldName = 'rkey25'
      ReadOnly = True
    end
    object ads25OnLinePCS: TFloatField
      FieldName = 'OnLinePCS'
      ReadOnly = True
    end
    object ads25OnLinePnl: TIntegerField
      FieldName = 'OnLinePnl'
      ReadOnly = True
    end
    object ads25ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ads25CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ads25ORIG_CUSTOMER: TStringField
      FieldName = 'ORIG_CUSTOMER'
      Size = 10
    end
    object ads25REPORT_UNIT_VALUE1: TBCDField
      FieldName = 'REPORT_UNIT_VALUE1'
      Precision = 9
    end
    object ads25auth_Storage: TBooleanField
      FieldName = 'auth_Storage'
    end
    object ads25PWeight: TBCDField
      FieldName = 'PWeight'
      Precision = 9
    end
  end
  object ds25: TDataSource
    DataSet = ads25
    Left = 164
    Top = 162
  end
  object ds251: TDataSource
    DataSet = ads251
    Left = 164
    Top = 233
  end
  object ads251: TADODataSet
    Connection = dm1.con1
    CursorType = ctStatic
    CommandText = 
      'select d25.manu_part_number,d25.manu_part_desc,d25.REPORT_UNIT_V' +
      'ALUE1, '#13#10'd06.WORK_ORDER_NUMBER,d251.ctime,d251.cpcs,d251.cpnl,d0' +
      '5_1.EMPLOYEE_NAME as cuser,'#13#10'd15.ABBR_NAME,d60.sales_order,d97.P' +
      'O_NUMBER,d05_2.EMPLOYEE_NAME as ouser, d251.otime,'#13#10'd251.status,' +
      'd251.BKNote,d251.rkey as rkey251,d251.po_ptr as rkey60,d251.wo_p' +
      'tr,d251.ZhouQi'#13#10'from data0251 d251 '#13#10'inner join data0006 d06 on ' +
      'd251.wo_ptr = d06.rkey'#13#10'inner join data0025 d25 on d06.bom_ptr =' +
      ' d25.rkey'#13#10'left join data0056 d56 on d56.wo_ptr = d251.wo_ptr'#13#10'l' +
      'eft join data0015 d15 on d56.loc_ptr = d15.rkey'#13#10'left join data0' +
      '060 d60 on d251.po_ptr = d60.rkey'#13#10'left join data0097 d97 on d60' +
      '.PURCHASE_ORDER_PTR = d97.RKEY'#13#10'inner join data0005 d05_1 on d25' +
      '1.cuser_ptr = d05_1.rkey'#13#10'left join data0005 d05_2 on d251.ouser' +
      '_ptr = d05_2.rkey'#13#10'where d251.status = :P1 and d251.ctime betwee' +
      'n :t1 and :t2'#13#10
    Parameters = <
      item
        Name = 'P1'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 't1'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 't2'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    Left = 100
    Top = 233
    object ads251manu_part_number: TStringField
      FieldName = 'manu_part_number'
    end
    object ads251manu_part_desc: TStringField
      FieldName = 'manu_part_desc'
      Size = 80
    end
    object ads251REPORT_UNIT_VALUE1: TBCDField
      FieldName = 'REPORT_UNIT_VALUE1'
      Precision = 9
    end
    object ads251WORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object ads251ctime: TDateTimeField
      FieldName = 'ctime'
    end
    object ads251cpcs: TIntegerField
      FieldName = 'cpcs'
    end
    object ads251cpnl: TIntegerField
      FieldName = 'cpnl'
    end
    object ads251cuser: TStringField
      FieldName = 'cuser'
      Size = 16
    end
    object ads251ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ads251sales_order: TStringField
      FieldName = 'sales_order'
      FixedChar = True
      Size = 12
    end
    object ads251PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 32
    end
    object ads251ouser: TStringField
      FieldName = 'ouser'
      Size = 16
    end
    object ads251otime: TDateTimeField
      FieldName = 'otime'
    end
    object ads251status: TIntegerField
      FieldName = 'status'
    end
    object ads251BKNote: TStringField
      FieldName = 'BKNote'
      Size = 250
    end
    object ads251rkey251: TAutoIncField
      FieldName = 'rkey251'
      ReadOnly = True
    end
    object ads251rkey60: TIntegerField
      FieldName = 'rkey60'
    end
    object ads251wo_ptr: TIntegerField
      FieldName = 'wo_ptr'
    end
    object strngfldads251ZhouQi: TStringField
      FieldName = 'ZhouQi'
      Size = 200
    end
  end
  object ds251Sum: TDataSource
    DataSet = ads251Sum
    Left = 164
    Top = 314
  end
  object ads251Sum: TADODataSet
    Connection = dm1.con1
    CommandText = 
      'select d25.manu_part_number,d25.manu_part_desc,'#13#10'sum(d251.cpcs) ' +
      'as qty,'#13#10'sum(d251.cpnl) as qty_panel,'#13#10'sum(d251.cpcs*d25.unit_sq' +
      ') as sq,'#13#10'd15.abbr_name,d97.po_number'#13#10'from data0251 d251 '#13#10'inne' +
      'r join data0006 d06 on d06.rkey = d251.wo_ptr'#13#10'inner join data00' +
      '25 d25 on d06.bom_ptr = d25.rkey'#13#10'inner join data0056 d56 on d56' +
      '.wo_ptr = d251.wo_ptr'#13#10'inner join data0015 d15 on d56.loc_ptr = ' +
      'd15.rkey'#13#10'left join data0060 d60 on d60.rkey = d251.po_ptr'#13#10'left' +
      ' join data0097 d97 on d60.PURCHASE_ORDER_PTR = d97.rkey'#13#10'where d' +
      '251.status = 0 and d25.parent_ptr is null'#13#10
    Parameters = <>
    Left = 100
    Top = 314
  end
  object pm1: TPopupMenu
    OnPopup = pm1Popup
    Left = 100
    Top = 386
    object nPost: TMenuItem
      Caption = #27491#24120#25552#20132
      object mniOkNomal: TMenuItem
        Caption = #25104#21697#25552#20132
        OnClick = nPostClick
      end
      object mniWeiShuNomal: TMenuItem
        Tag = 1
        Caption = #23614#25968#25552#20132
        OnClick = nPostClick
      end
    end
    object mniOKFast: TMenuItem
      Caption = #24555#36895#25552#20132
      OnClick = mniOKFastClick
    end
    object nN4: TMenuItem
      Caption = '-'
    end
    object nUnDoPost: TMenuItem
      Caption = #21462#28040#25552#20132
      OnClick = nUnDoPostClick
    end
  end
  object ads06: TADODataSet
    Connection = dm1.con1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT d06.bom_ptr,d25.MANU_PART_NUMBER,d25.MANU_PART_DESC,d06.W' +
      'ORK_ORDER_NUMBER,d06.FLOW_NO,d25.rkey as rkey25,'#13#10'd56.QTY_BACKLO' +
      'G,d56.PANELS,d06.RKEY as rkey06,d56.RKEY as rkey56,d06.PARTS_PER' +
      '_PANEL,d06.cut_no,'#13#10'd10.ABBR_NAME,d10.CUST_CODE,d25.ORIG_CUSTOME' +
      'R ,d56.INTIME,d60.rkey as rkey60 ,d97.PO_NUMBER as cust_po,d60.S' +
      'ALES_ORDER,'#13#10'd06.Panel_A_B,d06.wtype as wtype06,d56.wtype as wty' +
      'pe56'#13#10'FROM Data0006 d06'#13#10'INNER JOIN Data0056 d56 ON d06.RKEY = d' +
      '56.WO_PTR'#13#10'INNER JOIN Data0025 d25 ON d06.BOM_PTR = d25.RKEY'#13#10'le' +
      'ft JOIN data0492 d492 ON d06.CUT_NO = d492.CUT_NO'#13#10'left JOIN Dat' +
      'a0010 d10 ON d10.RKEY = d492.COMPLETED'#13#10'left JOIN Data0015 d15 O' +
      'N d15.RKEY = d56.LOC_PTR'#13#10'left join data0060 d60 ON d492.SO_NO =' +
      ' d60.SALES_ORDER'#13#10'left join data0097 d97 on d60.PURCHASE_ORDER_P' +
      'TR = d97.RKEY'#13#10'WHERE (d06.PROD_STATUS = 5) and (d06.wtype not in' +
      ' (2,4)) and (d56.QTY_BACKLOG - isnull(d06.QUAN_ALLREJ,0) > 0)'
    Parameters = <>
    Left = 268
    Top = 162
    object ads06MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ads06MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ads06WORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object ads06QTY_BACKLOG: TFloatField
      FieldName = 'QTY_BACKLOG'
    end
    object ads06PANELS: TIntegerField
      FieldName = 'PANELS'
    end
    object ads06rkey06: TIntegerField
      FieldName = 'rkey06'
      ReadOnly = True
    end
    object ads06rkey56: TIntegerField
      FieldName = 'rkey56'
      ReadOnly = True
    end
    object ads06PARTS_PER_PANEL: TFloatField
      FieldName = 'PARTS_PER_PANEL'
    end
    object ads06ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ads06CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ads06ORIG_CUSTOMER: TStringField
      FieldName = 'ORIG_CUSTOMER'
      Size = 10
    end
    object ads06rkey60: TIntegerField
      FieldName = 'rkey60'
      ReadOnly = True
    end
    object ads06cust_po: TStringField
      FieldName = 'cust_po'
      Size = 32
    end
    object ads06SALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ads06FLOW_NO: TSmallintField
      FieldName = 'FLOW_NO'
    end
    object ads06cut_no: TStringField
      FieldName = 'cut_no'
      FixedChar = True
      Size = 12
    end
    object ads06INTIME: TDateTimeField
      FieldName = 'INTIME'
    end
    object intgrfldads06Panel_A_B: TIntegerField
      FieldName = 'Panel_A_B'
    end
    object wrdfldads06wtype06: TWordField
      FieldName = 'wtype06'
    end
    object smlntfldads06wtype56: TSmallintField
      FieldName = 'wtype56'
    end
    object intgrfldads06rkey25: TIntegerField
      FieldName = 'rkey25'
      ReadOnly = True
    end
    object ads06bom_ptr: TIntegerField
      FieldName = 'bom_ptr'
    end
  end
  object ds06: TDataSource
    DataSet = ads06
    Left = 316
    Top = 162
  end
end
