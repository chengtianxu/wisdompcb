object frm_main: Tfrm_main
  Left = 192
  Top = 160
  Width = 1049
  Height = 526
  Caption = #38750#35774#22791#31867#22411#20445#20859#35745#21010
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1041
    Height = 41
    Align = alTop
    TabOrder = 0
    object Lab_Fielter: TLabel
      Left = 435
      Top = 16
      Width = 52
      Height = 13
      Caption = #35774#22791#32534#30721
    end
    object Label21: TLabel
      Left = 652
      Top = 15
      Width = 117
      Height = 13
      Caption = #34920#26684#24038#36793#22266#23450#26639#30446#65306
    end
    object Label22: TLabel
      Left = 665
      Top = 0
      Width = 26
      Height = 13
      Hint = 
        #26435#38480'1'#21482#33021#36827#34892'"'#26597#30475#26242#20572#35760#24405'""'#37325#26032#30331#38470'"'#12290#13#10#26435#38480'2'#65292'3'#65292'4'#21487#20197#36827#34892#27491#24120#30340#20445#20859#27969#31243#25805#20316#12290#13#10#26435#38480'3'#65292'4'#24182#19988#29366#24577#20026'"'#24453#25191#34892'"'#21487#20197 +
        #21024#38500#35813#26465#20445#20859#35745#21010#65292#13#10#22312#8220#26126#32454#8221#21487#20197#20462#25913#35745#21010#20445#20859#26102#38388
      Caption = #24110#21161
      ParentShowHint = False
      ShowHint = True
    end
    object BtnClose: TBitBtn
      Left = 8
      Top = 4
      Width = 70
      Height = 33
      Hint = #36864#20986#31243#24207
      Caption = #36864#20986
      TabOrder = 0
      OnClick = BtnCloseClick
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
    object BtnRefresh: TBitBtn
      Left = 77
      Top = 4
      Width = 70
      Height = 33
      Hint = #21047#26032
      Caption = #21047#26032
      TabOrder = 1
      OnClick = BtnRefreshClick
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
    object BtnExportToExcel: TBitBtn
      Left = 146
      Top = 4
      Width = 70
      Height = 33
      Hint = #23548#20986#25968#25454
      Caption = #23548#20986
      TabOrder = 2
      OnClick = BtnExportToExcelClick
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
    object BtnQuery: TBitBtn
      Left = 215
      Top = 4
      Width = 70
      Height = 33
      Hint = #26597#35810#26465#20214
      Caption = #26597#35810
      TabOrder = 3
      OnClick = BtnQueryClick
      Glyph.Data = {
        F2060000424DF206000000000000360400002800000019000000190000000100
        080000000000BC0200001217000012170000000100000000000000000000F8F8
        0000B0B0B00080808000F8600000F0F8F80060606000C8F8C80048484800D0E0
        E00098300000F8C89800F8F8980060000000F898000098989800F86060003030
        3000F8F83000F8F8C800F8E8C800C8C8C800F8F8F8001818180070707000C0C0
        C000E8E8E8005050500000000000000000000000000000000000000000000000
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
        00000013000088331700000000000000E400F712000035A6FC00770000001300
        0700A7FC7700080613000083A600FC7700000000000035A5FC0077FFFF000000
        7C00010000000000000000000000000000000000000000000000000000000000
        4300000000000039F000008800008A0098006317000078011300009863001700
        78000113000090631700000000000000C000F7120000C8F3EB007770F5001200
        0000ECFD7F0002000000000000001300F2000100000001000A0000884000F877
        8800331700000100000000998400E6775400F71200000101010001D8F8001200
        450090FB7700801FF80077FFFF00FFFF6000F8120000AD84E6007760F8001200
        D80084E677000000000000FFFF000000E40039F00000E439F000001800000000
        00000000000044F8120000400000000000000000000028F81200000000000000
        00000000000000000000000C000000000200000000000101120000872B00F877
        0000ECFD7F00000000000002000000009000001A020090331700007FFF00FFFF
        00000000000090331700000500000000870031E6770084F8120000218600E677
        9800F81200006713000010FFFF0000007C0001000000E439F000000000000000
        7000F8120000ACF8120000D8F8001200100030001000F8400000105F5400E677
        7C0001000000D0F8120000D8F80012000800000000000E000000161616161616
        1616161616161616161616161616161616161600000016161616161616161616
        1616161616161616161616161616160000001616161616161616161616161616
        16161616161616161616160000001616161616161616161616161616161616F9
        0F161616161616000000161616161616161616161616161616160A0E040D1616
        1616160000001616161616161616181B1B1B1B1B1B0A0E0ED90D1B0816161600
        00001616161616161616181515151515B50E010E0D030F181616160000001616
        16161616161618050505050F0EFB048302151A0F051616000000161616161616
        1616180909090A0E0E040D0F090505031616160000001616161616161616180F
        150600010E0D03150505050F051616000000161616161602020318A318030211
        E30F19191905050316161600000016161616180B0C1513070B181706030F0F0F
        0F05050F05161600000016161616180C0715130FE90B18171909090909050503
        161616000000161616020B1A14151312120B0B170F0F0F0F0F05050F05161600
        00001616160213131A0907AA0F12191702190219020509031616160000001616
        160213050515140F0F0F0B1802090909A709191816161600000016161602131A
        0515071212121818191A050509190F06161616000000161616090F0C14091319
        0B0F18190219051903061B08161616000000161616161618180B0B0B0F18091A
        0505051505091902051616000000161616161616031818180F14050505050515
        09191B05161616000000161616161616161603091A05050505050515191B1616
        1616160000001616161616161616031902191902190219020F16161616161600
        0000161616161616161616161605161616160505161616161616160000001616
        1616161616161616161616161616161616161616161616000000161616161616
        16161616161616161616161616161616161616000000}
    end
    object BtnFieldsVisable: TBitBtn
      Left = 286
      Top = 4
      Width = 110
      Height = 33
      Hint = #36873#25321#35201#26174#31034#30340#23383#27573
      Caption = #36873#25321#26174#31034#23383#27573
      TabOrder = 4
      OnClick = BtnFieldsVisableClick
      Glyph.Data = {
        0E070000424D0E0700000000000036040000280000001A0000001A0000000100
        080000000000D80200001217000012170000000100000000000000000000D0C8
        C80078787800383838000088080050F85800B8B8B800F8F8F800004800006060
        600080F8880000F00800A0A0A000E0E0E0009898980030303000E8E8E800C0C0
        C00000A80800A8A8A80020F83000D8D8D800C8C8C800505050009090900000D8
        080068686800F0F0F0008080880010F8200098F8A000B0B0B00060F86800D0D0
        D0003850380000A0080090F898000058000008080800C8D0C80008F818007070
        70008080800000980800C8D0D00058F8600088888800D0C8D00068F87000A0F8
        A00000F8080028F8300000B0080000E0080018F8200098F89800000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000130000904C1A00000000000000E400F712000035A6FC00770000001300
        0700A7FC7700080613000083A600FC7700000000000035A5FC0077FFFF000000
        2000010000000000000000000000000000000000000000000000000000000000
        31000000000000F1F500006400006600C800651A00007801130000C865001A00
        780001130000C0651A00000000000000C000F7120000C8F3EB007770F5001200
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
        200001000000D0F8120000D8F80012000800000000000E000000070707070700
        0000000000000000000000000000000000070707000007070707002222222222
        2222222222222222222222222200070700000707070700222222222222222222
        2222222222222222220007070000070707070022222222222222222222222222
        2222222222000707000007070707002222222222222222222222222222222222
        2200070700000707070700220000000000000000000000000000000022000707
        0000070707070022170E0E0E0E0E180E0E0E0E0E0E0E0E002200070700000707
        07070022171313130C1C1A0C1313131313131300220007070000070707070022
        1706061F1809252E1F060606060606002200070700000707070700220911060E
        09239C1A0E061111111111002200070700000707070700221A110C1A34191908
        1A0C11012C0127002200070700000707070700221A0602343514302308291321
        1515150022000707000007070707002229160514050A0DC233D82202060D1000
        220007070000070707070022021B1B070707071B1B312D12081F070022000707
        000007070707002202070707070707070710312D23291B002200070700000707
        07070022021B1B1B1B1B1B1B1B1B0D1E2D201000220007070000070707070022
        290D0D0D0D0D0D0D0D0D0D1524C20DAF2200070700000707070700221A151515
        151515151515151515151500220007070000070707070022092F27212C161616
        0127210116162F002200070700000707070700220F090029291A29F50F171709
        1A0F09002200070700000707070700222222002E0D151017290E111F0E0F2222
        22000707000007070707002222222200002E10290E2121000022222222000707
        0000070707070022222222222200111829210022222222222200070700000707
        0707070000000000000002211F00000000000000000707070000070707070707
        0707070707070300110007070707070707070707000007070707070707070707
        0707170F2A03070707070707070707070000}
    end
    object Edt_Fielter: TEdit
      Left = 499
      Top = 11
      Width = 121
      Height = 21
      TabOrder = 5
      OnChange = Edt_FielterChange
    end
    object Edit2: TEdit
      Left = 772
      Top = 11
      Width = 41
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 6
      Text = '5'
    end
    object UpDown1: TUpDown
      Left = 813
      Top = 11
      Width = 16
      Height = 21
      Associate = Edit2
      Position = 5
      TabOrder = 7
      OnChangingEx = UpDown1ChangingEx
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 41
    Width = 1041
    Height = 391
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = #20445#20859#35745#21010#28165#21333
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 0
        Width = 1033
        Height = 363
        Align = alClient
        DataSource = DM.DataSource1
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        FrozenCols = 5
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
        PopupMenu = PopupMenu1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnColumnMoved = DBGridEh1ColumnMoved
        OnGetCellParams = DBGridEh1GetCellParams
        OnKeyDown = DBGridEh1KeyDown
        OnTitleClick = DBGridEh1TitleClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'PlanMainDate'
            Footers = <>
            ReadOnly = True
            Title.Caption = #35745#21010#26657#27491#26102#38388
            Title.SortIndex = 1
            Title.SortMarker = smUpEh
            Width = 81
          end
          item
            EditButtons = <>
            FieldName = 'DeviNumb'
            Footers = <>
            Title.Caption = #20202#22120#32534#30721
            Title.Color = clRed
            Width = 114
          end
          item
            EditButtons = <>
            FieldName = 'ABBR_NAME'
            Footers = <>
            Title.Caption = #24037#21378
            Width = 59
          end
          item
            EditButtons = <>
            FieldName = 'DEPT_NAME'
            Footers = <>
            Title.Caption = #37096#38376
            Width = 98
          end
          item
            EditButtons = <>
            FieldName = 'FASSET_NAME'
            Footers = <>
            Title.Caption = #20202#22120#21517#31216
            Width = 90
          end
          item
            EditButtons = <>
            FieldName = 'MainExecStat'
            Footers = <>
            Title.Caption = #29366#24577#13#10
            Width = 49
          end
          item
            EditButtons = <>
            FieldName = 'Impact'
            Footers = <>
            Title.Caption = #24433#21709#31243#24230
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'equipment_grade'
            Footers = <>
            Title.Caption = #20202#22120#31561#32423
            Width = 58
          end
          item
            EditButtons = <>
            FieldName = 'LOCATION'
            Footers = <>
            Title.Caption = #20855#20307#20301#32622
            Width = 140
          end
          item
            EditButtons = <>
            FieldName = 'DeviType'
            Footers = <>
            Title.Caption = #26657#27491#31867#22411
            Width = 55
          end
          item
            EditButtons = <>
            FieldName = 'MainCycl'
            Footers = <>
            Title.Caption = #26657#27491#21608#26399
            Width = 54
          end
          item
            EditButtons = <>
            FieldName = 'd840_Location'
            Footers = <>
            Title.Caption = #36131#20219#23567#32452
            Width = 77
          end
          item
            EditButtons = <>
            FieldName = 'StarMainTime'
            Footers = <>
            ReadOnly = True
            Title.Caption = #24320#22987#26657#27491#26102#38388
            Width = 136
          end
          item
            EditButtons = <>
            FieldName = 'ActuCompTime'
            Footers = <>
            ReadOnly = True
            Title.Caption = #23454#38469#23436#25104#26102#38388
            Width = 136
          end
          item
            EditButtons = <>
            FieldName = 'TimeCons'
            Footers = <>
            Title.Caption = #26657#27491#28040#32791#26102#38388
          end
          item
            EditButtons = <>
            FieldName = 'StdTimeCons'
            Footers = <>
            Title.Caption = #26631#20934#28040#32791#26102#38388
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'Acomplish'
            Footers = <>
            Title.Caption = #36798#25104#29575
          end
          item
            EditButtons = <>
            FieldName = 'MainImpl'
            Footers = <>
            Title.Caption = #26657#27491#20154
            Width = 47
          end
          item
            EditButtons = <>
            FieldName = 'User_Full_Name'
            Footers = <>
            Title.Caption = #39564#25910#20154
            Width = 56
          end
          item
            EditButtons = <>
            FieldName = 'Remarks'
            Footers = <>
            Title.Caption = #20445#20859#35760#24405#25551#36848
            Width = 172
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = #26126#32454
      ImageIndex = 1
      object Label1: TLabel
        Left = 8
        Top = 7
        Width = 78
        Height = 13
        Caption = #35745#21010#20445#20859#26102#38388
      end
      object Label2: TLabel
        Left = 8
        Top = 48
        Width = 52
        Height = 13
        Caption = #35774#22791#32534#30721
      end
      object Label3: TLabel
        Left = 8
        Top = 89
        Width = 26
        Height = 13
        Caption = #37096#38376
      end
      object Label4: TLabel
        Left = 8
        Top = 130
        Width = 52
        Height = 13
        Caption = #35774#22791#21517#31216
      end
      object Label5: TLabel
        Left = 8
        Top = 170
        Width = 26
        Height = 13
        Caption = #24037#21378
      end
      object Label6: TLabel
        Left = 196
        Top = 170
        Width = 52
        Height = 13
        Caption = #24433#21709#31243#24230
      end
      object Label7: TLabel
        Left = 196
        Top = 7
        Width = 52
        Height = 13
        Caption = #35774#22791#31561#32423
      end
      object Label8: TLabel
        Left = 196
        Top = 48
        Width = 52
        Height = 13
        Caption = #20855#20307#20301#32622
      end
      object Label9: TLabel
        Left = 196
        Top = 89
        Width = 52
        Height = 13
        Caption = #20445#20859#31867#22411
      end
      object Label10: TLabel
        Left = 196
        Top = 130
        Width = 52
        Height = 13
        Caption = #20445#20859#21608#26399
      end
      object Label13: TLabel
        Left = 574
        Top = 7
        Width = 78
        Height = 13
        Caption = #24320#22987#20445#20859#26102#38388
      end
      object Label14: TLabel
        Left = 574
        Top = 48
        Width = 78
        Height = 13
        Caption = #23454#38469#23436#25104#26102#38388
      end
      object Label15: TLabel
        Left = 574
        Top = 89
        Width = 78
        Height = 13
        Caption = #20445#20859#28040#32791#26102#38388
      end
      object Label16: TLabel
        Left = 574
        Top = 130
        Width = 78
        Height = 13
        Caption = #26631#20934#28040#32791#26102#38388
      end
      object Label17: TLabel
        Left = 385
        Top = 130
        Width = 39
        Height = 13
        Caption = #36798#25104#29575
      end
      object Label18: TLabel
        Left = 385
        Top = 89
        Width = 39
        Height = 13
        Caption = #20445#20859#20154
      end
      object Label19: TLabel
        Left = 385
        Top = 170
        Width = 39
        Height = 13
        Caption = #39564#25910#20154
      end
      object Label20: TLabel
        Left = 763
        Top = 7
        Width = 78
        Height = 13
        Caption = #20445#20859#35760#24405#25551#36848
      end
      object Label12: TLabel
        Left = 385
        Top = 48
        Width = 52
        Height = 13
        Caption = #36131#20219#23567#32452
      end
      object Label11: TLabel
        Left = 385
        Top = 7
        Width = 26
        Height = 13
        Caption = #29366#24577
      end
      object Edt_DeviNumb: TEdit
        Left = 8
        Top = 63
        Width = 163
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object Edt_DEPT_NAME: TEdit
        Left = 8
        Top = 104
        Width = 163
        Height = 21
        Enabled = False
        TabOrder = 1
      end
      object Edt_FASSET_NAME: TEdit
        Left = 8
        Top = 144
        Width = 163
        Height = 21
        Enabled = False
        TabOrder = 2
      end
      object Edt_ABBR_NAME: TEdit
        Left = 8
        Top = 185
        Width = 163
        Height = 21
        Enabled = False
        TabOrder = 3
      end
      object Edt_Impact: TEdit
        Left = 196
        Top = 185
        Width = 163
        Height = 21
        Enabled = False
        TabOrder = 4
      end
      object Edt_equipment_grade: TEdit
        Left = 196
        Top = 24
        Width = 163
        Height = 21
        Enabled = False
        TabOrder = 5
      end
      object Edt_LOCATION: TEdit
        Left = 196
        Top = 63
        Width = 163
        Height = 21
        Enabled = False
        TabOrder = 6
      end
      object Edt_DeviType: TEdit
        Left = 196
        Top = 104
        Width = 163
        Height = 21
        Enabled = False
        TabOrder = 7
      end
      object Edt_MainCycl: TEdit
        Left = 196
        Top = 144
        Width = 163
        Height = 21
        Enabled = False
        TabOrder = 8
      end
      object Edt_StarMainTime: TEdit
        Left = 574
        Top = 24
        Width = 163
        Height = 21
        Enabled = False
        TabOrder = 9
      end
      object Edt_ActuCompTime: TEdit
        Left = 574
        Top = 63
        Width = 163
        Height = 21
        Enabled = False
        TabOrder = 10
      end
      object Edt_TimeCons: TEdit
        Left = 574
        Top = 104
        Width = 163
        Height = 21
        Enabled = False
        TabOrder = 11
      end
      object Edt_StdTimeCons: TEdit
        Left = 574
        Top = 144
        Width = 163
        Height = 21
        Enabled = False
        TabOrder = 12
      end
      object Edt_Acomplish: TEdit
        Left = 385
        Top = 144
        Width = 163
        Height = 21
        Enabled = False
        TabOrder = 13
      end
      object Edt_MainImpl: TEdit
        Left = 385
        Top = 104
        Width = 163
        Height = 21
        Enabled = False
        TabOrder = 14
        OnExit = Edt_MainImplExit
      end
      object meno_Remark: TMemo
        Left = 764
        Top = 24
        Width = 163
        Height = 186
        Enabled = False
        Lines.Strings = (
          '')
        TabOrder = 15
        OnExit = meno_RemarkExit
      end
      object Edt_User_Full_Name: TEdit
        Left = 385
        Top = 185
        Width = 163
        Height = 21
        Enabled = False
        TabOrder = 16
      end
      object DateTimePicker1: TDateTimePicker
        Left = 8
        Top = 24
        Width = 169
        Height = 21
        Date = 42338.379010949080000000
        Time = 42338.379010949080000000
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 17
        OnExit = DateTimePicker1Exit
      end
      object Edt_d840_Location: TEdit
        Left = 385
        Top = 63
        Width = 163
        Height = 21
        Enabled = False
        TabOrder = 18
      end
      object Edt_MainExecStat: TEdit
        Left = 385
        Top = 24
        Width = 163
        Height = 21
        Enabled = False
        TabOrder = 19
      end
      object CheckBox8: TCheckBox
        Left = 2
        Top = 208
        Width = 153
        Height = 17
        Caption = #33258#21160#26174#31034#26448#26009#39046#29992#26126#32454
        Checked = True
        State = cbChecked
        TabOrder = 20
        OnClick = CheckBox8Click
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 232
        Width = 1033
        Height = 131
        Align = alBottom
        DataSource = DM.DataSource4
        TabOrder = 21
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'number'
            Title.Caption = #39046#26009#21333#32534#21495
            Width = 116
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'INV_PART_NUMBER'
            Title.Caption = #26448#26009#32534#21495
            Width = 225
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'INV_PART_DESCRIPTION'
            Title.Caption = #26448#26009#21517#31216'/'#35268#26684
            Width = 364
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'unit_name'
            Title.Caption = #21333#20301
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUAN_BOM'
            Title.Caption = #30003#39046#25968#37327
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUAN_ISSUED'
            Title.Caption = #24050#21457#25968#37327
            Width = 64
            Visible = True
          end>
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 432
    Width = 1041
    Height = 41
    Align = alBottom
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 272
      Height = 39
      Align = alLeft
      Caption = #29366#24577
      TabOrder = 0
      object CheckBox1: TCheckBox
        Left = 6
        Top = 16
        Width = 60
        Height = 16
        Caption = #24453#25191#34892
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = CheckBox1Click
      end
      object CheckBox5: TCheckBox
        Left = 67
        Top = 16
        Width = 60
        Height = 16
        Caption = #24050#36890#30693
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = CheckBox1Click
      end
      object CheckBox3: TCheckBox
        Left = 130
        Top = 16
        Width = 60
        Height = 16
        Caption = #25191#34892#20013
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = CheckBox1Click
      end
      object CheckBox2: TCheckBox
        Left = 197
        Top = 16
        Width = 60
        Height = 16
        Caption = #24050#39564#25910
        TabOrder = 3
        OnClick = CheckBox1Click
      end
    end
    object GroupBox2: TGroupBox
      Left = 618
      Top = 1
      Width = 159
      Height = 39
      Align = alLeft
      Caption = #31579#36873#24037#21378
      TabOrder = 1
      Visible = False
      object Cbb_WareHouse: TComboBox
        Left = 5
        Top = 12
        Width = 124
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        Visible = False
        OnChange = Cbb_WareHouseChange
      end
    end
    object RadioGroup1: TRadioGroup
      Left = 273
      Top = 1
      Width = 192
      Height = 39
      Align = alLeft
      Caption = #31579#36873#26085#26399
      Columns = 4
      ItemIndex = 3
      Items.Strings = (
        #20170#22825'  '
        #26126#22825'  '
        #21518#22825
        #20840#37096)
      TabOrder = 2
      OnClick = RadioGroup1Click
    end
    object RadioGroup2: TRadioGroup
      Left = 465
      Top = 1
      Width = 153
      Height = 39
      Align = alLeft
      Caption = #35774#22791#29366#24577
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #26377#25928
        #20840#37096)
      TabOrder = 3
      OnClick = RadioGroup2Click
    end
    object Panel2: TPanel
      Left = 777
      Top = 1
      Width = 192
      Height = 39
      Align = alLeft
      TabOrder = 4
      object Label24: TLabel
        Left = 39
        Top = 25
        Width = 65
        Height = 13
        Caption = #20170#22825#25110#20043#21069
      end
      object Label26: TLabel
        Left = 144
        Top = 5
        Width = 26
        Height = 13
        Caption = #26126#22825
      end
      object Label25: TLabel
        Left = 40
        Top = 4
        Width = 26
        Height = 13
        Caption = #20854#23427
      end
      object Edit7: TEdit
        Left = 8
        Top = 19
        Width = 25
        Height = 21
        Color = clRed
        ReadOnly = True
        TabOrder = 0
      end
      object Edit9: TEdit
        Left = 112
        Top = 2
        Width = 25
        Height = 21
        Color = clBlue
        ReadOnly = True
        TabOrder = 1
      end
      object Edit8: TEdit
        Left = 8
        Top = 2
        Width = 25
        Height = 21
        Color = clWindowText
        ReadOnly = True
        TabOrder = 2
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 473
    Width = 1041
    Height = 19
    Panels = <
      item
        Width = 200
      end>
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 704
    Top = 168
    object N1: TMenuItem
      Caption = #28155#21152#20219#21153
      OnClick = N1Click
    end
    object N13: TMenuItem
      Caption = #21024#38500#20219#21153
      OnClick = N13Click
    end
    object N2: TMenuItem
      Caption = #36890#30693#20445#20859
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #21462#28040#36890#30693
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #24320#22987#20445#20859
      OnClick = N4Click
    end
    object N9: TMenuItem
      Caption = #39564#25910#36890#36807
      OnClick = N9Click
    end
  end
end
