object frmMainBOMBaoJia: TfrmMainBOMBaoJia
  Left = 226
  Top = 183
  Caption = 'BOM'#25253#20215#21333
  ClientHeight = 729
  ClientWidth = 1008
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 1008
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object lblFilter: TLabel
      Left = 342
      Top = 10
      Width = 84
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #23458#25143#20195#30721
    end
    object lbl2: TLabel
      Left = 606
      Top = 10
      Width = 60
      Height = 13
      Caption = #21019#24314#26102#38388#65306
    end
    object lbl3: TLabel
      Left = 802
      Top = 10
      Width = 12
      Height = 13
      Caption = #33267
    end
    object btn1: TBitBtn
      Left = 0
      Top = 0
      Width = 57
      Height = 30
      Hint = #36864#20986#31995#32479
      Align = alLeft
      Caption = #36864#20986
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
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btn1Click
    end
    object btnRefresh: TBitBtn
      Left = 57
      Top = 0
      Width = 57
      Height = 30
      Hint = #21047#26032#24403#21069#25968#25454
      Align = alLeft
      Caption = #21047#26032
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADABFBFBDADADADADADDADADBFADADADADAADADAD000DADADADDADAD0FBF0DA
        DADAADAD0F7FBF0DADADDAD0F7F87BF0DADAAD0F7F87BFB70DADD0F7F87BFB78
        80DA000F87BFB78880ADDAD00BFB78880ADAADADA0B7888740ADDADADA088804
        440AADADADA000A04440DADADADADADA0440ADADADADADADA00D}
      TabOrder = 1
      OnClick = btnRefreshClick
    end
    object edtFilter: TEdit
      Left = 433
      Top = 6
      Width = 165
      Height = 21
      ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
      TabOrder = 2
      OnChange = edtFilterChange
    end
    object dtp1: TDateTimePicker
      Left = 671
      Top = 6
      Width = 125
      Height = 21
      Date = 42452.000000000000000000
      Time = 42452.000000000000000000
      ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
      TabOrder = 3
      OnChange = dtp1Change
    end
    object dtp2: TDateTimePicker
      Left = 821
      Top = 6
      Width = 140
      Height = 21
      Date = 42452.999988425930000000
      Time = 42452.999988425930000000
      ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
      TabOrder = 4
      OnChange = dtp1Change
    end
    object btnQuery: TBitBtn
      Left = 114
      Top = 0
      Width = 57
      Height = 30
      Align = alLeft
      Caption = #26597#35810
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
      TabOrder = 5
      OnClick = btnQueryClick
    end
    object btnEditReport: TBitBtn
      Left = 236
      Top = 0
      Width = 57
      Height = 30
      Hint = #29992#25143#33258#23450#20041#25253#34920#26684#24335
      Align = alLeft
      Caption = #23450#20041
      Glyph.Data = {
        5E060000424D5E06000000000000360400002800000017000000170000000100
        08000000000028020000C40E0000C40E0000000100000000000000000000A0E8
        F00048B0E8000028C8005068500000007800C0B8B0005060D00040402000B0B0
        900078707000F8F0D00098A8A0000878D8000060B8000000500008508000E0F0
        D800B8C0F80080A898001060A0000068D80098B8F8005050580050589000A0A0
        9000A8D0E80048A0E8003888D000E0B8E80020100000305858000040B0001048
        C000F0E0F80070B0B8006870900080B0F800C8F8C8000060D0004890F800A0D8
        E0003070C800D8F0F8009090800028507000706868000880F800E8E0F000A8C8
        D8005068B0005868A00038308000D0A09000D0B0D80090A8D800E0E0F0007090
        E0000000100098A0E8006888D800003880003030480080B0F0000028500060B0
        F800C0E0F80048405800B0D8C000C0E0E000C0E8E80038608800C0D0D0000850
        B8000068F8001858D0008080A000B0E0F000C8F0F8000050C8002090E80080B0
        E000B8D8E000A8D0B800F0F8F800F0F8D800003080007880E8000850B00040B0
        F80080A0A800D8D8F00050A0F800F8F0F8004098F00088E0F80000A0F8000008
        6000A0C8C000B0D0F000B8C8C800200828000070E8000878F0005060A0000038
        6800A8909800B0C0C8008040600068B0F000D8F8F80048C8F8000800080080C0
        D800D0D8F000001820004880D80070888800002870005860700078889000A0D0
        D0001858A8000078C00008104000E0F0F000083850000060E800C8F0F000B8E8
        F8000050A80050C0F800A8B0F000B0A0A00080C8F800E8D8E0009098A800C0F0
        F8000048D0004040400058587000383868007088A0002070F00060B0E8003888
        F00098B0B8004068A0004888F0000868E00068C8F8006098E800D8D0B000D0C0
        D000E0D8D80088807000C0A0C00090C0F800082080001090E0008090A000B8D8
        F800B0D8D80058B0F800D0E0F000708080002080F8000848A000F8F0F0001050
        D0004090E0001860B800705060000040D80010100000D0F0E80088B8F800C0C0
        E00088B8C0001018B80040586000080048001060E000A8B8B800A8D0F000A0A0
        B0003860A80070A8E000B0F0F800E0F8E80088A098006090F800E0F8F800A0B8
        B00060A0F80028181800C0D0F800C8F8F800E0F0F8000080D000E0E0E800F0F0
        E80050B0F80068A8F8006060F00080808000C0F8E8003850480020A0F8000000
        3800E8E8F0001058C0003868E000C8E0F0005888F800082068005098F0000040
        C800688890005880A000D0D0D8000010100090B8C800C8C8C800385098003840
        300098A09800D0E8E000080808001040800058586800C0E0C0000050E000D0D8
        E0000058D800687070001870F8000870D00050708800B0C8C80098C8F8002020
        080090B0B0006888E800B8F0F80050A8F000203888001870E00000186000A0F8
        F800D8E0E80070C0F800F8F8E000B0D8F800B0D8D000F8F8F800DF98FFFFFF0B
        22FFFF0B22FFC4DFFFFFFF0B22FFFF0B2200F1002EE2FFFFFFFFFFC5FFDFE21F
        04FFFFC5FFFFFFC5FF00D12E00F1A793FF0BFFFFDFE2220137F1240BFF0B22FF
        FF0026000493F02A9361DF7924C426C5C5C5E27EE2DFFFFFFF00222E37C43B79
        0737A76937E2C426C5C5C4FF931F8DFFFF00FF3CF0C5FFF0F0073C2710E2E2C4
        0BC5FFC5FFC4DF00C10022DF0726C4DFF0798F27031FE2C1F026C4C5F00BC4C1
        2E00FFFF93F0FFC4FFF01C27602793E2DF79C5F0FFC5791FFF00FFFF373CC4FF
        F05EC23C4AC7278D37797926C4E26CFF2200FFC5FF69F05E5E5E965E1C274A27
        93DADF79C12EFFC5FF0022FFDF7E57F9F0DFC23CC21C4A4A276937A56CFF22FF
        FF00FF79E2FF79C2FFF0F05EC25E3C275E271F2EFFC5FFFFFF00C4E22226FF79
        3B26C479C296C21CAD1C03E1FFFFFF0B2200E2C5C5C5FFC5793CC5C4F95E96C2
        1C275EA704FFFFC5FF0093DFC526C4FFFF79CC26C4795EC2C21CAD692404FFFF
        FF00FF379BDF0BC5FFC5793CFFF0C45EC2C21C93048D8DFFFF00FFFFFF2CDAC1
        FF26C5793B26C479C23CC2DFE17E052EFF00FFC5FFFF0B372E79FFC571C2C4F0
        F08F873735D12A61260022FFFF0B22FFFFE224DA37354C0BC49837DF4C1C4A69
        9C00FFFFFFC5FFFFFFFF0BE2FFFF981F0BC40BE22A601C69DF00FF0B22FFFF0B
        22FFFFFF22FFFF35612E2437C2C203DAFF00FFC5FFFFFFC5FFFFFFC5FFFFFFFF
        DF05275E2AA7E2FFFF0022FFFF0B22FFFF0B22FFFF0B22FFFFDF24D134DFFFFF
        FF00}
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = btnEditReportClick
    end
    object btnExportToExcel: TBitBtn
      Left = 171
      Top = 0
      Width = 65
      Height = 30
      Hint = #23548#20986#25968#25454#21040'Excel'
      Align = alLeft
      Caption = #23548#20986
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DADADADADADA
        DADAADADADADADADADADDADADADADAD00000000000000006666007777777706E
        EF0AA0E6666606EEF0ADDA0E66606EEF060AADA0E606EEF0000DDADA006EEF0A
        DADAADAD06EEF00DADADDAD06EEF0670DADAAD06EEF0E6670DADD06EEF0A0E66
        70DA0FFFF0ADA0EEEE0D00000ADADA00000AADADADADADADADAD}
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = btnExportToExcelClick
    end
    object btn2: TBitBtn
      Left = 293
      Top = 0
      Width = 57
      Height = 30
      Align = alLeft
      Caption = #26435#38480
      Kind = bkHelp
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = btn2Click
    end
  end
  object ehMain: TDBGridEh
    Left = 0
    Top = 30
    Width = 1008
    Height = 639
    Align = alClient
    ColumnDefValues.EndEllipsis = True
    DataSource = dsMain
    DynProps = <>
    EditActions = [geaCopyEh, geaSelectAllEh]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #24494#36719#38597#40657
    Font.Style = []
    ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
    ParentFont = False
    PopupMenu = pm1
    ReadOnly = True
    RowHeight = 25
    TabOrder = 1
    OnTitleClick = ehMainTitleClick
    Columns = <
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'BPNO'
        Footers = <>
        Title.Caption = #25253#20215#21333#21495
        Width = 80
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'CUST_CODE'
        Footers = <>
        Title.Caption = #23458#25143#20195#30721
        Width = 60
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'Customer_Name'
        Footers = <>
        Title.Caption = #23458#25143#21517#31216
        Width = 100
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'MANU_PART_NUMBER'
        Footers = <>
        Title.Caption = #26412#21378#32534#21495
        Width = 80
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'Manu_Part_Desc'
        Footers = <>
        Title.Caption = #23458#25143#22411#21495
        Width = 80
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'bpname'
        Footers = <>
        Title.Caption = #25253#20215#26694#26550
        Width = 100
      end
      item
        ButtonStyle = cbsNone
        DynProps = <>
        EditButton.Visible = False
        EditButtons = <>
        FieldName = 'bSurface'
        Footers = <>
        Title.Caption = #34920#38754#22788#29702
        Width = 80
        WordWrap = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'buhanshuijiage_Pcs'
        Footers = <>
        Title.Caption = #19981#21547#31246#20215
        Width = 80
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'hanshuijiage_Pcs'
        Footers = <>
        Title.Caption = #21547#31246#20215#26684
        Width = 80
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'CURR_NAME'
        Footers = <>
        Title.Caption = #36135#24065
        Width = 60
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'maolilv_add'
        Footers = <>
        Title.Caption = #27611#21033#29575
        Width = 60
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'jinglilv_add'
        Footers = <>
        Title.Caption = #25240#29575
        Width = 80
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'SMan'
        Footers = <>
        Title.Caption = #38144#21806#20195#34920
        Width = 70
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'bBPType'
        Footers = <>
        Title.Caption = #25253#20215#31867#22411
        Width = 70
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'BPTime'
        Footers = <>
        Title.Caption = #25253#20215#26102#38388
        Width = 80
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'CMan'
        Footers = <>
        Title.Caption = #25253#20215#21592
        Width = 60
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'AuthStatus'
        Footers = <>
        KeyList.Strings = (
          '0'
          '1'
          '2'
          '3'
          '4')
        PickList.Strings = (
          #26410#25552#20132
          #24453#23457#26680
          #23457#26680#20013
          #23457#26680#25104#21151
          #23457#26680#19981#36890#36807)
        Title.Caption = #23457#26680#29366#24577
        Width = 70
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'CurRate'
        Footers = <>
        Title.Caption = #27719#29575
        Width = 50
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'payment'
        Footers = <>
        Title.Caption = #20184#27454#26041#24335
        Width = 60
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'EnableDays'
        Footers = <>
        Title.Caption = #26377#25928#26399
        Width = 50
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'ANALYSIS_CODE_2'
        Footers = <>
        Title.Caption = #23458#25143#29289#26009#21495
        Width = 100
      end
      item
        ButtonStyle = cbsNone
        DynProps = <>
        EditButton.Visible = False
        EditButtons = <>
        FieldName = #23436#25104#26495#21402'mm'
        Footers = <>
        Title.Caption = #21402#24230
        Width = 40
        WordWrap = True
      end
      item
        ButtonStyle = cbsNone
        DynProps = <>
        EditButton.Visible = False
        EditButtons = <>
        FieldName = 'Layers'
        Footers = <>
        Title.Caption = #23618#25968
        Width = 40
        WordWrap = True
      end
      item
        ButtonStyle = cbsNone
        DynProps = <>
        EditButton.Visible = False
        EditButtons = <>
        FieldName = 'bSet_L'
        Footers = <>
        Title.Caption = 'Set'#38271
        Width = 80
        WordWrap = True
      end
      item
        ButtonStyle = cbsNone
        DynProps = <>
        EditButton.Visible = False
        EditButtons = <>
        FieldName = 'bSet_W'
        Footers = <>
        Title.Caption = 'Set'#23485
        Width = 80
        WordWrap = True
      end
      item
        ButtonStyle = cbsNone
        DynProps = <>
        EditButton.Visible = False
        EditButtons = <>
        FieldName = 'bPCSPerSet'
        Footers = <>
        Title.Caption = 'PCS'#27599'Set'
        Width = 80
        WordWrap = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'Auth_NoteList'
        Footers = <>
        Title.Caption = #23457#25209#22791#27880
        Width = 200
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'bUseAge'
        Footers = <>
        Title.Caption = #21033#29992#29575
        Width = 80
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'OrignPrice'
        Footers = <>
        Title.Caption = #21407#21333#20215#26684
        Width = 120
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'OrignPrice_M'
        Footers = <>
        Title.Caption = #21407#21333#20215#24179#31859
        Width = 80
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'P1_M'
        Footers = <>
        Title.Caption = #20027#26009#24179#31859#25104#26412
        Width = 80
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'P1P2P3P4P5_M'
        Footers = <>
        Title.Caption = #24037#24207#24179#31859#25104#26412
        Width = 80
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 697
    Width = 1008
    Height = 32
    Align = alBottom
    TabOrder = 2
    object lbl1: TLabel
      Left = 16
      Top = 9
      Width = 60
      Height = 13
      Caption = #23457#25209#29366#24577#65306
    end
    object cbxStatus0: TCheckBox
      Left = 87
      Top = 6
      Width = 70
      Height = 17
      Caption = #26410#25552#20132
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = btnRefreshClick
    end
    object cbxStatus1: TCheckBox
      Left = 163
      Top = 6
      Width = 70
      Height = 17
      Caption = #24453#23457#26680
      TabOrder = 1
      OnClick = btnRefreshClick
    end
    object cbxStatus2: TCheckBox
      Left = 239
      Top = 6
      Width = 54
      Height = 17
      Caption = #23457#26680#20013
      TabOrder = 2
      OnClick = btnRefreshClick
    end
    object cbxStatus3: TCheckBox
      Left = 315
      Top = 6
      Width = 70
      Height = 17
      Caption = #24050#23457#26680
      TabOrder = 3
      OnClick = btnRefreshClick
    end
    object cbxStatus4: TCheckBox
      Left = 391
      Top = 6
      Width = 74
      Height = 17
      Caption = #23457#26680#36864#22238
      TabOrder = 4
      OnClick = btnRefreshClick
    end
    object cbxUserOnly: TCheckBox
      Left = 471
      Top = 6
      Width = 106
      Height = 17
      Caption = #21482#26174#31034#26412#20154#25968#25454
      TabOrder = 5
      OnClick = btnRefreshClick
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 669
    Width = 1008
    Height = 28
    Align = alBottom
    TabOrder = 3
    object lbl4: TLabel
      Left = 16
      Top = 7
      Width = 60
      Height = 13
      Caption = #23457#25209#29366#24577#65306
    end
    object rb1: TRadioButton
      Left = 87
      Top = 6
      Width = 70
      Height = 17
      Caption = #24453#23457#26680
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = rb1Click
    end
    object rb2: TRadioButton
      Left = 163
      Top = 5
      Width = 70
      Height = 17
      Caption = #24050#23457#26680
      TabOrder = 1
      OnClick = rb1Click
    end
    object rb3: TRadioButton
      Left = 239
      Top = 5
      Width = 70
      Height = 17
      Caption = #23457#26680#36864#22238
      TabOrder = 2
      OnClick = rb1Click
    end
  end
  object cdsMain: TClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    Left = 176
    Top = 176
    object strngfldMainBPNO: TStringField
      FieldName = 'BPNO'
      Size = 50
    end
    object strngfldMainCustomer_Name: TStringField
      FieldName = 'Customer_Name'
      Size = 512
    end
    object strngfldMainManu_Part_Desc: TStringField
      FieldName = 'Manu_Part_Desc'
      Size = 512
    end
    object intgrfldMainD10_Ptr: TIntegerField
      FieldName = 'D10_Ptr'
    end
    object strngfldMainBP00_Ptr: TStringField
      FieldName = 'BP00_Ptr'
      FixedChar = True
      Size = 38
    end
    object cdsMainhanshuijiage_Pcs: TFMTBCDField
      FieldName = 'hanshuijiage_Pcs'
      DisplayFormat = '#0.########'
      Precision = 18
    end
    object cdsMainbuhanshuijiage_Pcs: TFMTBCDField
      FieldName = 'buhanshuijiage_Pcs'
      DisplayFormat = '#0.########'
      Precision = 18
    end
    object intgrfldMainD01_Ptr: TIntegerField
      FieldName = 'D01_Ptr'
    end
    object cdsMainmaolilv_add: TFMTBCDField
      FieldName = 'maolilv_add'
      Precision = 18
      Size = 5
    end
    object fmtbcdfldMainjinglilv_add: TFMTBCDField
      FieldName = 'jinglilv_add'
      Precision = 18
      Size = 5
    end
    object intgrfldMainCreateMan: TIntegerField
      FieldName = 'CreateMan'
    end
    object intgrfldMainSaleMan: TIntegerField
      FieldName = 'SaleMan'
    end
    object dtmfldMainBPTime: TDateTimeField
      FieldName = 'BPTime'
    end
    object intgrfldMainAuthStatus: TIntegerField
      FieldName = 'AuthStatus'
    end
    object cdsMainCurRate: TFMTBCDField
      FieldName = 'CurRate'
      Precision = 18
      Size = 5
    end
    object strngfldMainpayment: TStringField
      FieldName = 'payment'
      Size = 50
    end
    object intgrfldMainEnableDays: TIntegerField
      FieldName = 'EnableDays'
    end
    object strngfldMainANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      Size = 512
    end
    object strngfldMainCUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object strngfldMainMANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object cdsMainbpname: TWideStringField
      FieldName = 'bpname'
      Size = 50
    end
    object strngfldMainCURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object strngfldMainSMan: TStringField
      FieldName = 'SMan'
      Size = 16
    end
    object strngfldMainCMan: TStringField
      FieldName = 'CMan'
      Size = 16
    end
    object strngfldMainIDKEY: TStringField
      FieldName = 'IDKEY'
      Size = 38
    end
    object intgrfldMaind264_ptr: TIntegerField
      FieldName = 'd264_ptr'
    end
    object strngfldMainThickness: TStringField
      FieldName = #23436#25104#26495#21402'mm'
      Size = 128
    end
    object strngfldMainbSet_L: TStringField
      FieldName = 'bSet_L'
      Size = 128
    end
    object strngfldMainbSet_W: TStringField
      FieldName = 'bSet_W'
      Size = 128
    end
    object strngfldMainbPCSPerSet: TStringField
      FieldName = 'bPCSPerSet'
      Size = 128
    end
    object strngfldMainbSurface: TStringField
      FieldName = 'bSurface'
      Size = 128
    end
    object strngfldMainBPType: TStringField
      FieldName = 'bBPType'
      Size = 128
    end
    object cdsMainAuth_NoteList: TStringField
      FieldName = 'Auth_NoteList'
      Size = 2048
    end
    object cdsMainbUseAge: TStringField
      FieldName = 'bUseAge'
      Size = 200
    end
    object cdsMainOrignPrice: TFMTBCDField
      FieldName = 'OrignPrice'
      Precision = 18
    end
    object cdsMainLayers: TIntegerField
      FieldName = 'Layers'
    end
    object fmtbcdfldMainOrignPrice_M: TFMTBCDField
      FieldName = 'OrignPrice_M'
      Precision = 18
    end
    object fmtbcdfldMainP1_M: TFMTBCDField
      FieldName = 'P1_M'
      Precision = 8
      Size = 18
    end
    object fmtbcdfldMainP1P2P3P4P5_M: TFMTBCDField
      FieldName = 'P1P2P3P4P5_M'
      Precision = 8
      Size = 18
    end
  end
  object dsMain: TDataSource
    DataSet = cdsMain
    Left = 232
    Top = 176
  end
  object pm1: TPopupMenu
    OnPopup = pm1Popup
    Left = 176
    Top = 240
    object mniNew: TMenuItem
      Caption = #26032#22686
      OnClick = mniNewClick
    end
    object mniEdit: TMenuItem
      Caption = #32534#36753
      OnClick = mniEditClick
    end
    object mniView: TMenuItem
      Caption = #26597#30475
      OnClick = mniViewClick
    end
    object mniPostPass: TMenuItem
      Caption = #25552#20132#23457#26680
      OnClick = mniPostPassClick
    end
    object mniCopy: TMenuItem
      Caption = #22797#21046#24403#21069
      OnClick = mniCopyClick
    end
    object mniN5: TMenuItem
      Caption = '-'
    end
    object mniPrint: TMenuItem
      Caption = #25171#21360#25253#34920
      object mniPrintIN: TMenuItem
        Caption = #20869#37096#25253#20215#21333
        OnClick = mniPrintClick
      end
      object mniPrintOutCN: TMenuItem
        Caption = #23545#22806#25253#20215#21333'CN'
        OnClick = mniPrintOutCNClick
      end
      object mniPrintOutEN: TMenuItem
        Caption = #23545#22806#25253#20215#21333'EN'
        OnClick = mniPrintOutENClick
      end
      object mniExportDeptBOMExcel: TMenuItem
        Caption = #23548#20986#24037#24207#25104#26412'EXCEL'
        OnClick = mniExportDeptBOMExcelClick
      end
    end
    object mniN3: TMenuItem
      Caption = '-'
    end
    object mniChaKanShenPiLiuCheng: TMenuItem
      Caption = #26597#30475#23457#25209#27969#31243
      OnClick = mniChaKanShenPiLiuChengClick
    end
    object mniDelete: TMenuItem
      Caption = #21024#38500
      OnClick = mniDeleteClick
    end
  end
  object rpt1: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42536.615557800900000000
    ReportOptions.LastChange = 43154.453947164350000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 240
    Top = 264
    Datasets = <
      item
        DataSetName = 'ds493'
      end
      item
        DataSetName = 'dsBP06'
      end
      item
        DataSetName = 'dsBP07'
      end
      item
        DataSetName = 'dsBP08'
      end
      item
        DataSetName = 'dsBP10'
      end
      item
        DataSetName = 'dsBP11'
      end
      item
        DataSetName = 'dsCustomField'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 179.637910000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Top = 7.559060000000000000
          Width = 714.331170000000000000
          Height = 30.236240000000000000
          DataField = 'Company_Name'
          DataSetName = 'ds493'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[ds493."Company_Name"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 249.448980000000000000
          Top = 38.574830000000000000
          Width = 215.433210000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #20135#21697#25253#20215#25104#26412#20998#26512#26723#26696#34920)
          ParentFont = False
          WordWrap = False
        end
        object Memo3: TfrxMemoView
          Left = 541.897960000000000000
          Top = 43.574830000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #25171#21360#26102#38388#65306)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 610.606680000000000000
          Top = 43.574830000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
        object Picture1: TfrxPictureView
          Left = 10.338590000000000000
          Top = 7.779530000000000000
          Width = 113.385900000000000000
          Height = 52.913420000000000000
          DataField = 'Company_Icon'
          DataSetName = 'ds493'
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Shape5: TfrxShapeView
          Left = 3.779530000000000000
          Top = 71.811070000000000000
          Width = 710.551640000000000000
          Height = 86.929190000000000000
        end
        object Line23: TfrxLineView
          Left = 3.779530000000000000
          Top = 92.047310000000000000
          Width = 710.551640000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line24: TfrxLineView
          Left = 3.779530000000000000
          Top = 113.063080000000000000
          Width = 710.551640000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line25: TfrxLineView
          Left = 3.779530000000000000
          Top = 136.063080000000000000
          Width = 710.551640000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo84: TfrxMemoView
          Left = 7.559060000000000000
          Top = 75.590600000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #25253#20215#21333#21495#65306)
          ParentFont = False
        end
        object Memo85: TfrxMemoView
          Left = 75.590551180000000000
          Top = 75.590600000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'BPNO'
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."BPNO"]')
          ParentFont = False
        end
        object Line26: TfrxLineView
          Left = 154.417440000000000000
          Top = 71.811070000000000000
          Height = 86.929190000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line27: TfrxLineView
          Left = 71.811070000000000000
          Top = 71.811070000000000000
          Height = 86.929190000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line28: TfrxLineView
          Left = 228.346630000000000000
          Top = 71.811070000000000000
          Height = 86.929190000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line29: TfrxLineView
          Left = 293.968770000000000000
          Top = 112.488250000000000000
          Height = 45.354360000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line30: TfrxLineView
          Left = 365.677490000000000000
          Top = 113.488250000000000000
          Height = 45.354360000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line31: TfrxLineView
          Left = 575.386210000000000000
          Top = 71.811070000000000000
          Height = 86.929190000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line32: TfrxLineView
          Left = 643.638220000000000000
          Top = 71.811070000000000000
          Height = 86.929190000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo86: TfrxMemoView
          Left = 7.559060000000000000
          Top = 98.267780000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #26412#21378#32534#21495#65306)
          ParentFont = False
        end
        object Memo87: TfrxMemoView
          Left = 7.559060000000000000
          Top = 117.165430000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            'SET   '#38271#65306)
          ParentFont = False
        end
        object Memo88: TfrxMemoView
          Left = 7.559060000000000000
          Top = 139.842610000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #24065'    '#31181#65306)
          ParentFont = False
        end
        object Memo89: TfrxMemoView
          Left = 75.590551180000000000
          Top = 96.488250000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'MANU_PART_NUMBER'
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."MANU_PART_NUMBER"]')
          ParentFont = False
        end
        object Memo90: TfrxMemoView
          Left = 75.590551180000000000
          Top = 115.385900000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'SetW_A'
          DataSetName = 'dsBP11'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP11."SetW_A"]')
          ParentFont = False
        end
        object Memo91: TfrxMemoView
          Left = 75.590551180000000000
          Top = 137.063080000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'curr_code'
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."curr_code"]')
          ParentFont = False
        end
        object Memo92: TfrxMemoView
          Left = 154.960730000000000000
          Top = 75.590600000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #23458#25143#21517#31216#65306)
          ParentFont = False
        end
        object Memo93: TfrxMemoView
          Left = 154.960730000000000000
          Top = 95.488250000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #23458#25143#22411#21495#65306)
          ParentFont = False
        end
        object Memo94: TfrxMemoView
          Left = 154.960730000000000000
          Top = 117.165430000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            'SET   '#23485#65306)
          ParentFont = False
        end
        object Memo95: TfrxMemoView
          Left = 154.960730000000000000
          Top = 139.842610000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #19981#21547#31246#24179#31859#20215)
          ParentFont = False
        end
        object Memo96: TfrxMemoView
          Left = 230.551181100000000000
          Top = 74.811070000000000000
          Width = 343.937230000000000000
          Height = 18.897650000000000000
          DataField = 'CUSTOMER_NAME'
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."CUSTOMER_NAME"]')
          ParentFont = False
        end
        object Memo97: TfrxMemoView
          Left = 230.551181100000000000
          Top = 95.488250000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          DataField = 'MANU_PART_DESC'
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."MANU_PART_DESC"]')
          ParentFont = False
        end
        object Memo98: TfrxMemoView
          Left = 230.551181100000000000
          Top = 115.385900000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'SetH_A'
          DataSetName = 'dsBP11'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP11."SetH_A"]')
          ParentFont = False
        end
        object Memo99: TfrxMemoView
          Left = 502.677341100000000000
          Top = 116.385900000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DataField = 'baojiadanwei'
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."baojiadanwei"]')
          ParentFont = False
        end
        object Memo101: TfrxMemoView
          Left = 295.173470000000000000
          Top = 117.165430000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            'PCS'#25968'/SET'#65306)
          ParentFont = False
        end
        object Memo102: TfrxMemoView
          Left = 430.866420000000000000
          Top = 139.842610000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #25253#20215#31867#22411#65306)
          ParentFont = False
        end
        object Memo104: TfrxMemoView
          Left = 368.102660000000000000
          Top = 117.385900000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DataField = 'bPCSPerSet'
          DataSetName = 'dsCustomField'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsCustomField."bPCSPerSet"]')
          ParentFont = False
        end
        object Memo105: TfrxMemoView
          Left = 502.677490000000000000
          Top = 140.063080000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'bBPType'
          DataSetName = 'dsCustomField'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsCustomField."bBPType"]')
          ParentFont = False
        end
        object Memo106: TfrxMemoView
          Left = 578.268090000000000000
          Top = 75.590600000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #19994#21153#20154#21592#65306)
          ParentFont = False
        end
        object Memo107: TfrxMemoView
          Left = 578.268090000000000000
          Top = 94.488250000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #25253#20215#20154#21592#65306)
          ParentFont = False
        end
        object Memo108: TfrxMemoView
          Left = 578.268090000000000000
          Top = 117.165430000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #20135#21697#31867#22411#65306)
          ParentFont = False
        end
        object Memo109: TfrxMemoView
          Left = 578.268090000000000000
          Top = 139.842610000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #23454#38469#25253#20215#65306)
          ParentFont = False
        end
        object Memo110: TfrxMemoView
          Left = 642.519685040000000000
          Top = 73.811070000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'sale_man'
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."sale_man"]')
          ParentFont = False
        end
        object Memo111: TfrxMemoView
          Left = 642.519685040000000000
          Top = 96.488250000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'create_man'
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."create_man"]')
          ParentFont = False
        end
        object Memo112: TfrxMemoView
          Left = 642.519685040000000000
          Top = 119.165430000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'BPName'
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."BPName"]')
          ParentFont = False
        end
        object Memo113: TfrxMemoView
          Left = 642.519685040000000000
          Top = 141.842610000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'hanshuijiage_Pcs'
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."hanshuijiage_Pcs"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 7.559060000000000000
          Top = 162.519790000000000000
          Width = 461.102660000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #27492#25253#20215#21333#20165#20869#37096#20351#29992','#23646#20844#21496#26426#23494','#19981#24471#22806#20256#21542#21017#36861#31350#30456#20851#36131#20219)
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 427.086890000000000000
          Top = 113.385900000000000000
          Height = 45.354360000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line2: TfrxLineView
          Left = 498.897960000000000000
          Top = 113.385900000000000000
          Height = 45.354360000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo40: TfrxMemoView
          Left = 430.866420000000000000
          Top = 117.165430000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #25253#20215#21333#20301#65306)
          ParentFont = False
        end
        object Memo81: TfrxMemoView
          Left = 294.803340000000000000
          Top = 139.842610000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Visible = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #25240'  '#29575#65306)
          ParentFont = False
        end
        object Memo82: TfrxMemoView
          Left = 366.614410000000000000
          Top = 139.842610000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."jinglilv_add"]')
          ParentFont = False
        end
        object Memo83: TfrxMemoView
          Left = 230.551330000000000000
          Top = 139.842610000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'buhanshuijiage_M'
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."buhanshuijiage_M"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Top = 306.141930000000000000
        Width = 718.110700000000000000
        DataSetName = 'dsBP06'
        RowCount = 0
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 328.819110000000000000
        Width = 718.110700000000000000
        Columns = 3
        ColumnWidth = 238.110236220472000000
        DataSetName = 'dsBP10'
        RowCount = 0
        object Shape2: TfrxShapeView
          Width = 238.110390000000000000
          Height = 22.677180000000000000
        end
        object Memo35: TfrxMemoView
          Left = 2.559060000000000000
          Top = 4.118120000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DataSetName = 'dsBP10'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dsBP10."PARAMETER_DESC"] '#65306)
          ParentFont = False
          WordWrap = False
        end
        object Memo36: TfrxMemoView
          Left = 139.606370000000000000
          Top = 3.118120000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DataSetName = 'dsBP10'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP10."Param_Value"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo37: TfrxMemoView
          Left = 202.315090000000000000
          Top = 3.000000000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          DataField = 'UNIT_CODE'
          DataSetName = 'dsBP10'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dsBP10."UNIT_CODE"]')
          ParentFont = False
        end
        object Line11: TfrxLineView
          Left = 136.842610000000000000
          Height = 22.677180000000000000
          Visible = False
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line12: TfrxLineView
          Left = 200.315090000000000000
          Height = 22.677180000000000000
          Visible = False
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 260.787570000000000000
        Width = 718.110700000000000000
        object Memo38: TfrxMemoView
          Left = 0.543290000000000000
          Top = 2.000000000000000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = #40657#20307
          Font.Style = [fsBold]
          Fill.BackColor = clBlack
          HAlign = haCenter
          Memo.UTF8W = (
            #25253#20215#21442#25968)
          ParentFont = False
        end
      end
      object Header2: TfrxHeader
        FillType = ftBrush
        Height = 39.574830000000000000
        Top = 419.527830000000000000
        Width = 718.110700000000000000
        object Memo41: TfrxMemoView
          Left = 9.559060000000000000
          Top = 22.779530000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #29289#26009#21517#31216)
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          Left = 93.826840000000000000
          Top = 23.779530000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #20379#24212#21830)
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 170.567100000000000000
          Top = 23.779530000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #29289#26009#35268#26684)
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 341.307360000000000000
          Top = 23.779530000000000000
          Width = 90.708720000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #29289#26009#28040#32791#20215#26684)
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 491.590910000000000000
          Top = 23.779530000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #29992#37327'Pcs')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 559.181510000000000000
          Top = 23.779530000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #37329#39069'Pcs')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = #40657#20307
          Font.Style = [fsBold]
          Fill.BackColor = clBlack
          HAlign = haCenter
          Memo.UTF8W = (
            #20027#35201#29289#26009'(RMB)')
          ParentFont = False
        end
        object Memo103: TfrxMemoView
          Left = 638.961040000000000000
          Top = 23.897650000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #37329#39069'/M')
          ParentFont = False
        end
        object Memo117: TfrxMemoView
          Left = 435.866420000000000000
          Top = 24.677180000000000000
          Width = 49.133890000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #37319#36141#21333#20301)
          ParentFont = False
        end
      end
      object DetailData2: TfrxDetailData
        FillType = ftBrush
        Height = 34.015770000000000000
        Top = 483.779840000000000000
        Width = 718.110700000000000000
        DataSetName = 'dsBP08'
        RowCount = 0
        object Shape3: TfrxShapeView
          Left = -0.220470000000000000
          Width = 718.110700000000000000
          Height = 34.015770000000000000
        end
        object Memo43: TfrxMemoView
          Left = 3.779530000000000000
          Top = 4.000000000000000000
          Width = 83.149660000000000000
          Height = 30.236240000000000000
          DataField = 'INV_NAME'
          DataSetName = 'dsBP08'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP08."INV_NAME"]')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 169.283550000000000000
          Top = 4.000000000000000000
          Width = 188.976500000000000000
          Height = 30.236240000000000000
          DataField = 'INV_PART_DESCRIPTION'
          DataSetName = 'dsBP08'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP08."INV_PART_DESCRIPTION"]')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 360.512060000000000000
          Top = 7.779530000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataSetName = 'dsBP08'
          DisplayFormat.FormatStr = '%2.5f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP08."MStdPrice"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo46: TfrxMemoView
          Left = 493.102660000000000000
          Top = 7.779530000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataSetName = 'dsBP08'
          DisplayFormat.FormatStr = '%2.5f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP08."MUsePerPcs"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo47: TfrxMemoView
          Left = 90.708720000000000000
          Top = 4.000000000000000000
          Width = 71.811070000000000000
          Height = 30.236240000000000000
          DataField = 'ABBR_NAME'
          DataSetName = 'dsBP08'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP08."ABBR_NAME"]')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 563.961040000000000000
          Top = 7.779530000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataSetName = 'dsBP08'
          DisplayFormat.FormatStr = '%2.5f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP08."MUsePrice"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo114: TfrxMemoView
          Left = 634.961040000000000000
          Top = 7.779530000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataField = 'MUsePrice_M'
          DataSetName = 'dsBP08'
          DisplayFormat.FormatStr = '%2.5f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP08."MUsePrice_M"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo116: TfrxMemoView
          Left = 438.425480000000000000
          Top = 7.559060000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataField = 'Unit_Name'
          DataSetName = 'dsBP08'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP08."Unit_Name"]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 540.472790000000000000
        Width = 718.110700000000000000
        object Memo53: TfrxMemoView
          Left = 511.795610000000000000
          Top = 3.000000000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'SumBp08UsePrice'
          DataSetName = 'dsBP08'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP08."SumBp08UsePrice"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo54: TfrxMemoView
          Left = 431.645950000000000000
          Top = 2.000000000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #21512#35745'RMB'#65306)
          ParentFont = False
        end
        object Memo115: TfrxMemoView
          Left = 613.063390000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataSetName = 'dsBP08'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP08."SumBp08UsePrice_M"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object Header3: TfrxHeader
        FillType = ftBrush
        Height = 41.196862600000000000
        Top = 582.047620000000000000
        Width = 718.110700000000000000
        object Memo55: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = #40657#20307
          Font.Style = [fsBold]
          Fill.BackColor = clBlack
          HAlign = haCenter
          Memo.UTF8W = (
            #24037#24207#25104#26412'(RMB)')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Left = 11.118120000000000000
          Top = 22.299212600000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #24037#24207#21517#31216)
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Left = 100.724490000000000000
          Top = 22.299212600000000000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #20027#26009#25104#26412'/P')
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          Left = 187.771800000000000000
          Top = 22.299212600000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #36741#26009#25104#26412'/P')
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          Left = 272.819110000000000000
          Top = 22.299212600000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #20154#24037'/P')
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          Left = 353.645950000000000000
          Top = 22.299212600000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #27700#30005'/P')
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          Left = 429.252320000000000000
          Top = 22.299212600000000000
          Width = 49.133890000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #25240#26087'/P')
          ParentFont = False
        end
        object Memo62: TfrxMemoView
          Left = 526.079160000000000000
          Top = 22.299212600000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #24635#35745'/P')
          ParentFont = False
        end
        object Memo100: TfrxMemoView
          Left = 622.268090000000000000
          Top = 20.897650000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #24635#35745'/M')
          ParentFont = False
        end
      end
      object DetailData4: TfrxDetailData
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        Height = 22.677180000000000000
        ParentFont = False
        Top = 646.299630000000000000
        Width = 718.110700000000000000
        DataSetName = 'dsBP07'
        RowCount = 0
        object Shape1: TfrxShapeView
          Left = -0.220470000000000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
        end
        object Memo63: TfrxMemoView
          Left = 11.338590000000000000
          Top = 3.000000000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataField = 'DEPT_NAME'
          DataSetName = 'dsBP07'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP07."DEPT_NAME"]')
          ParentFont = False
        end
        object Memo64: TfrxMemoView
          Left = 99.944960000000000000
          Top = 3.000000000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataField = 'P1'
          DataSetName = 'dsBP07'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP07."P1"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo65: TfrxMemoView
          Left = 185.992270000000000000
          Top = 3.000000000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'P2'
          DataSetName = 'dsBP07'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP07."P2"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo66: TfrxMemoView
          Left = 271.039580000000000000
          Top = 3.000000000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataField = 'P3'
          DataSetName = 'dsBP07'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP07."P3"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo67: TfrxMemoView
          Left = 350.866420000000000000
          Top = 3.000000000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DataField = 'P4'
          DataSetName = 'dsBP07'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP07."P4"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo68: TfrxMemoView
          Left = 429.252320000000000000
          Top = 3.000000000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataField = 'P5'
          DataSetName = 'dsBP07'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP07."P5"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo69: TfrxMemoView
          Left = 518.520100000000000000
          Top = 3.000000000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'AllP'
          DataSetName = 'dsBP07'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP07."AllP"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo118: TfrxMemoView
          Left = 616.063390000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'AllP_M'
          DataSetName = 'dsBP07'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP07."AllP_M"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object Footer2: TfrxFooter
        FillType = ftBrush
        Height = 109.606370000000000000
        Top = 691.653990000000000000
        Width = 718.110700000000000000
        object Memo70: TfrxMemoView
          Left = 11.338590000000000000
          Top = 3.000000000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #21512#35745'RMB'#65306)
          ParentFont = False
        end
        object Memo71: TfrxMemoView
          Left = 100.944960000000000000
          Top = 4.000000000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          DataField = 'SumP1'
          DataSetName = 'dsBP07'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP07."SumP1"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo72: TfrxMemoView
          Left = 190.992270000000000000
          Top = 4.000000000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DataField = 'SumP2'
          DataSetName = 'dsBP07'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP07."SumP2"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo73: TfrxMemoView
          Left = 268.260050000000000000
          Top = 4.000000000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          DataField = 'SumP3'
          DataSetName = 'dsBP07'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP07."SumP3"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo74: TfrxMemoView
          Left = 330.968770000000000000
          Top = 4.000000000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          DataField = 'SumP4'
          DataSetName = 'dsBP07'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP07."SumP4"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo75: TfrxMemoView
          Left = 395.236550000000000000
          Top = 4.000000000000000000
          Width = 49.133890000000000000
          Height = 15.118120000000000000
          DataField = 'SumP5'
          DataSetName = 'dsBP07'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP07."SumP5"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo76: TfrxMemoView
          Left = 514.520100000000000000
          Top = 4.000000000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DataField = 'SumAllP'
          DataSetName = 'dsBP07'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP07."SumAllP"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo119: TfrxMemoView
          Left = 616.063390000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataSetName = 'dsBP07'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP07."SumAllP_M"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo120: TfrxMemoView
          Left = 3.779530000000000000
          Top = 49.133890000000000000
          Width = 710.551640000000000000
          Height = 52.913420000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Memo121: TfrxMemoView
          Left = 3.779530000000000000
          Top = 27.897650000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #22791#27880#65306)
          ParentFont = False
        end
      end
      object Footer3: TfrxFooter
        FillType = ftBrush
        Height = 86.929190000000000000
        Top = 846.614720000000000000
        Width = 718.110700000000000000
        object Shape4: TfrxShapeView
          Left = 1.779530000000000000
          Top = 36.118120000000000000
          Width = 714.331170000000000000
          Height = 45.354360000000000000
        end
        object Memo7: TfrxMemoView
          Left = 45.456710000000000000
          Top = 18.897650000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #20027#26009#25104#26412)
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 121.047310000000000000
          Top = 18.897650000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #21046#36896#25104#26412)
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 192.858380000000000000
          Top = 18.897650000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #24635#25104#26412)
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 253.330860000000000000
          Top = 18.897650000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #25253#24223#29575)
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 310.023810000000000000
          Top = 18.897650000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Visible = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #38144#21806#25240#25187)
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 378.055350000000000000
          Top = 18.897650000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #25240#29575)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 430.968770000000000000
          Top = 18.897650000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #22686#20540#31246)
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 483.882190000000000000
          Top = 18.897650000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #24065#31181)
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 555.693260000000000000
          Top = 18.897650000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #21547#31246#20215)
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 623.724800000000000000
          Top = 18.897650000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #19981#21547#31246#20215)
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 3.779530000000000000
          Top = 37.795300000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            'PCS')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 3.779530000000000000
          Top = 55.252010000000500000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #24179#31859)
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 45.354360000000000000
          Top = 37.795300000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'P1P2_Pcs'
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."P1P2_Pcs"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 45.354360000000000000
          Top = 56.692950000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'P1P2_M'
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."P1P2_M"]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 120.944960000000000000
          Top = 37.795300000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'P3P4P5_Pcs'
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."P3P4P5_Pcs"]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 120.944960000000000000
          Top = 56.692950000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'P3P4P5_M'
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."P3P4P5_M"]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 192.756030000000000000
          Top = 56.692950000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[<dsBP06."P1P2P3P4P5_M"> + <dsBP06."baofei_cost_M">]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object Memo25: TfrxMemoView
          Left = 257.008040000000000000
          Top = 37.795300000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."baofeilv"]%')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 257.008040000000000000
          Top = 56.692950000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."baofeilv"]%')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 309.921460000000000000
          Top = 37.795300000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."xiaoshouzhekou"]%')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 309.921460000000000000
          Top = 56.692950000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."xiaoshouzhekou"]%')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 374.173470000000000000
          Top = 37.795300000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."jinglilv_add"]%')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 374.173470000000000000
          Top = 56.692950000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."jinglilv_add"]%')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 439.866420000000000000
          Top = 37.795300000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."zengzhishui_add"]%')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 439.866420000000000000
          Top = 56.692950000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."zengzhishui_add"]%')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 483.779840000000000000
          Top = 37.795300000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'curr_code'
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."curr_code"]')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 483.779840000000000000
          Top = 56.692950000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'curr_code'
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."curr_code"]')
          ParentFont = False
        end
        object Memo77: TfrxMemoView
          Left = 555.590910000000000000
          Top = 37.795300000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'hanshuijiage_Pcs'
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."hanshuijiage_Pcs"]')
          ParentFont = False
        end
        object Memo78: TfrxMemoView
          Left = 555.590910000000000000
          Top = 56.692950000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'hanshuijiage_M'
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."hanshuijiage_M"]')
          ParentFont = False
        end
        object Memo79: TfrxMemoView
          Left = 623.622450000000000000
          Top = 37.795300000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'buhanshuijiage_Pcs'
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."buhanshuijiage_Pcs"]')
          ParentFont = False
        end
        object Memo80: TfrxMemoView
          Left = 623.622450000000000000
          Top = 56.692950000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'buhanshuijiage_M'
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."buhanshuijiage_M"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = #40657#20307
          Font.Style = [fsBold]
          Fill.BackColor = clBlack
          HAlign = haCenter
          Memo.UTF8W = (
            #26368#32456#25253#20215)
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 192.756030000000000000
          Top = 37.795300000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[<dsBP06."P1P2P3P4P5_pcs"> + <dsBP06."baofei_cost_pcs">]')
          ParentFont = False
        end
      end
      object DetailData5: TfrxDetailData
        FillType = ftBrush
        Top = 823.937540000000000000
        Width = 718.110700000000000000
        DataSetName = 'dsBP06'
        RowCount = 0
      end
      object DetailData3: TfrxDetailData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 374.173470000000000000
        Width = 718.110700000000000000
        Columns = 3
        ColumnWidth = 238.110236220472400000
        RowCount = 0
        object Memo122: TfrxMemoView
          Left = 3.779530000000000000
          Top = 2.897650000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dsBP10."PARAMETER_DESC"] '#65306)
          ParentFont = False
          WordWrap = False
        end
        object Memo123: TfrxMemoView
          Left = 140.826840000000000000
          Top = 2.897650000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP10."Param_Value"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo124: TfrxMemoView
          Left = 202.535560000000000000
          Top = 2.897650000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          DataField = 'UNIT_CODE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dsBP10."UNIT_CODE"]')
          ParentFont = False
        end
      end
    end
  end
  object pm2: TPopupMenu
    OnPopup = pm2Popup
    Left = 384
    Top = 240
    object mniAuthView: TMenuItem
      Caption = #26597#30475
      OnClick = mniViewClick
    end
    object mniShenPiPass: TMenuItem
      Caption = #23457#25209#36890#36807
      OnClick = mniShenPiPassClick
    end
    object mniShenPiNoPass: TMenuItem
      Caption = #21462#28040#23457#25209
      OnClick = mniShenPiNoPassClick
    end
    object mniViewShenpiStep: TMenuItem
      Caption = #26597#30475#23457#25209#27969#31243
      OnClick = mniChaKanShenPiLiuChengClick
    end
  end
  object qry1: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'if object_id('#39'tempdb..#tmp'#39') is not null '
      'Begin'
      '    drop table #tmp'
      'End'
      ''
      'UPDATE BOMPrice14 set nowauth = 0'
      ''
      'SELECT min(SeqNo) as seqno,BP06_Ptr into #tmp'
      'FROM BOMPrice14 '
      'WHERE Auth_Flag = 0'
      'GROUP BY BP06_Ptr'
      ''
      'UPDATE BOMPrice14 set NowAuth = 1 from BOMPrice14 bp14'
      
        'INNER JOIN #tmp on #tmp.bp06_ptr = bp14.BP06_Ptr and bp14.SeqNo ' +
        '= #tmp.seqno')
    Left = 504
    Top = 456
  end
  object updtsql2: TUpdateSQL
    ModifySQL.Strings = (
      ''
      'SELECT'
      'BP06.P1P2P3P4P5_M,'
      'BP06.P1_M,'
      'BP06.D264_ptr'
      #9' , BP06.IDKEY'
      #9' , BP06.BPNO'
      #9' , BP06.Customer_Name'
      #9' , BP06.Manu_Part_Desc'
      #9' , BP06.D10_Ptr'
      #9' , BP06.BP00_Ptr'
      #9' , BP06.hanshuijiage_Pcs'
      #9' , BP06.buhanshuijiage_Pcs'
      #9' , BP06.D01_Ptr'
      #9' , BP06.maolilv_add'
      #9' , BP06.CreateMan'
      #9' , BP06.SaleMan'
      #9' , BP06.BPTime'
      #9' , BP06.AuthStatus'
      #9' , BP06.CurRate'
      #9' , BP06.payment'
      #9' , BP06.Auth_NoteList'
      #9' , BP06.EnableDays'
      #9' , BP06.ANALYSIS_CODE_2'
      #9' , bp06.jinglilv_add'
      #9' , bp06.OrignPrice'
      #9' , bp06.OrignPrice_M'
      #9' , d10.CUST_CODE'
      #9' , d25.MANU_PART_NUMBER'
      #9' , bp00.bpname'
      #9' , d01.CURR_NAME'
      #9' , d05_1.EMPLOYEE_NAME AS SMan'
      #9' , d05_2.EMPLOYEE_NAME AS CMan'
      #9' , bp06.Layers'
      #9' , bp06.['#23436#25104#26495#21402'mm]'
      #9' , bp06.[bPCSPerSet]'
      #9' , bp06.[bSet_L]'
      '     , bp06.[bSet_W]'
      #9' , bp06.[bSurface]'
      #9' , bp06.[bBPType]'
      #9' , bp06.[bUseAge]'
      'from  bomprice06 bp06'
      #9'LEFT JOIN Data0010 d10'
      #9#9'ON bp06.D10_Ptr = d10.RKEY'
      #9'LEFT JOIN data0025 d25'
      #9#9'ON d25.RKEY = BP06.D25_Ptr'
      #9'LEFT JOIN bomprice00 bp00'
      #9#9'ON bp00.idkey = BP06.bp00_ptr'
      #9'LEFT JOIN data0001 d01'
      #9#9'ON d01.RKEY = BP06.D01_Ptr'
      #9'LEFT JOIN data0005 d05_1'
      #9#9'ON d05_1.RKEY = BP06.SaleMan'
      #9'LEFT JOIN data0005 d05_2'
      #9#9'ON d05_2.Rkey = BP06.CreateMan')
    DeleteSQL.Strings = (
      #9
      #9#9
      
        '--DECLARE @LAYERS int,@'#23436#25104#26495#21402'mm int,@bPCSPerSet int,@bSet_L int,@b' +
        'Set_W int,@bSurface int,@bBPType int,@bUseAge int '
      ''
      ''
      '--SELECT @LAYERS = rkey FROM Data0278 WHERE SPEC_RKEY = '#39'LY'#39
      '--SELECT @'#23436#25104#26495#21402'mm = rkey FROM Data0278 WHERE SPEC_RKEY = '#39'TK'#39
      '--SELECT @bPCSPerSet = rkey FROM Data0278 WHERE SPEC_RKEY = '#39'00'#39
      '--SELECT @bSet_L = rkey FROM Data0278 WHERE SPEC_RKEY = '#39'01'#39
      '--SELECT @bSet_W = rkey FROM Data0278 WHERE SPEC_RKEY = '#39'02'#39
      '--SELECT @bSurface = rkey FROM Data0278 WHERE SPEC_RKEY = '#39'03'#39
      '--SELECT @bBPType = rkey FROM Data0278 WHERE SPEC_RKEY = '#39'04'#39
      
        '--select @bUseAge = rkey from Data0278 where PARAMETER_NAME = '#39'b' +
        'UseAge'#39
      ''
      '--;with tmp1 as'
      '--('
      '--select BP06.IDKey'
      '--'#9' , min(CASE BP10.D278_ptr'
      '--'#9#9'   WHEN @LAYERS THEN'
      '--'#9#9#9'   Param_Value'
      '--'#9'   END) AS [LAYERS]'
      '--'#9' , min(CASE BP10.D278_ptr'
      '--'#9#9'   WHEN @'#23436#25104#26495#21402'mm THEN'
      '--'#9#9#9'   Param_Value'
      '--'#9'   END) AS ['#23436#25104#26495#21402'mm]'
      '--'#9' , min(CASE BP10.D278_ptr'
      '--'#9#9'   WHEN @bPCSPerSet THEN'
      '--'#9#9#9'   Param_Value'
      '--'#9'   END) AS [bPCSPerSet]'
      '--'#9' , min(CASE BP10.D278_ptr'
      '--'#9#9'   WHEN @bSet_L THEN'
      '--'#9#9#9'   Param_Value'
      '--'#9'   END) AS [bSet_L]'
      '--'#9' , min(CASE BP10.D278_ptr'
      '--'#9#9'   WHEN @bSet_W THEN'
      '--'#9#9#9'   Param_Value'
      '--'#9'   END) AS [bSet_W]'
      '--'#9' , min(CASE BP10.D278_ptr'
      '--'#9#9'   WHEN @bSurface THEN'
      '--'#9#9#9'   Param_Value'
      '--'#9'   END) AS [bSurface]'
      '--'#9' , min(CASE BP10.D278_ptr'
      '--'#9#9'   WHEN @bBPType THEN'
      '--'#9#9#9'   Param_Value'
      '--'#9'   END) AS [bBPType]'
      '--'#9' , min(CASE BP10.D278_ptr'
      '--'#9#9'   WHEN @bUseAge THEN'
      '--'#9#9#9'   Param_Value'
      '--'#9'   END) AS [bUseAge]'
      '--FROM'
      '--'#9'BomPrice06 BP06'
      '--'#9'INNER JOIN bomprice10 bp10'
      '--'#9#9'ON bp06.idkey = bp10.bp06_ptr'
      '--'#9'LEFT JOIN Data0010 d10'
      '--'#9#9'ON bp06.D10_Ptr = d10.RKEY'#9#9)
    Left = 304
    Top = 400
  end
end
