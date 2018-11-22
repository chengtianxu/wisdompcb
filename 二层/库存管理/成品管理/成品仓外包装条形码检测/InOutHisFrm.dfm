object frmInOutHis: TfrmInOutHis
  Left = 283
  Top = 251
  Width = 1546
  Height = 675
  Caption = #36827#20986#24211#35760#24405
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
  object ehFrmMain: TDBGridEh
    Left = 0
    Top = 65
    Width = 1530
    Height = 571
    Align = alClient
    DataSource = ds405
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    FooterRowCount = 1
    PopupMenu = pm1
    ReadOnly = True
    SumList.Active = True
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    UseMultiTitle = True
    OnDrawColumnCell = ehFrmMainDrawColumnCell
    OnTitleClick = ehFrmMainTitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'LockStatus'
        Footers = <>
        KeyList.Strings = (
          '0'
          '1')
        PickList.Strings = (
          #26410#38145#23450
          #21697#36136#38145#23450)
        Title.Caption = #38145#23450#29366#24577
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'barid'
        Footers = <>
        Title.Caption = #26631#31614'ID'
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'code'
        Footers = <>
        Title.Caption = #23458#25143#20195#30721
        Width = 70
      end
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
        FieldName = 'qty'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #25968#37327
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'lotno'
        Footers = <>
        Title.Caption = #21608#26399
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'place'
        Footers = <>
        Title.Caption = #20301#32622
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'indatetime'
        Footers = <>
        Title.Caption = #20837#24211#26102#38388
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'ANALYSIS_CODE_2'
        Footers = <>
        Title.Caption = #23458#25143#29289#26009#21495
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'surface'
        Footers = <>
        Title.Caption = #34920#38754#22788#29702
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'PO_NUMBER'
        Footers = <>
        Title.Caption = #23458#25143#35746#21333#21495
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'inusername'
        Footers = <>
        Title.Caption = #20837#24211#20154
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'outusername'
        Footers = <>
        Title.Caption = #20986#24211#20154
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'outdatetime'
        Footers = <>
        Title.Caption = #20986#24211#26102#38388
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'description'
        Footers = <>
        Title.Caption = #25551#36848
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'notes'
        Footers = <>
        Title.Caption = #22791#27880
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'barcode_id'
        Footers = <>
        Title.Caption = #26465#30721
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'CaseNo'
        Footers = <>
        Title.Caption = #31665#21495
      end
      item
        EditButtons = <>
        FieldName = 'param1'
        Footers = <>
        Title.Caption = #38468#21152
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'notes698'
        Footers = <>
        Title.Caption = #38468#21152'2'
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'rkey698'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'id699'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'baknote'
        Footers = <>
        Title.Caption = #22791#27880
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'v_date'
        Footers = <>
        Title.Caption = #25171#21360#26085#26399
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'WORK_ORDER_NUMBER'
        Footers = <>
        Title.Caption = #20316#19994#21333#21495
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'EMPLOYEE_NAME'
        Footers = <>
        Title.Caption = #26631#31614#25171#21360#20154
        Width = 80
      end>
  end
  object pnl3: TPanel
    Left = 0
    Top = 33
    Width = 1530
    Height = 32
    Align = alTop
    TabOrder = 1
    object lbl1: TLabel
      Left = 14
      Top = 9
      Width = 39
      Height = 13
      Caption = #26102#38388#65306
    end
    object lbl2: TLabel
      Left = 279
      Top = 7
      Width = 13
      Height = 13
      Caption = #33267
    end
    object lbl3: TLabel
      Left = 814
      Top = 8
      Width = 39
      Height = 13
      Caption = #31665#25968#65306
    end
    object lblpackno: TLabel
      Left = 854
      Top = 8
      Width = 63
      Height = 13
      Caption = '         '
    end
    object dtp1: TDateTimePicker
      Left = 54
      Top = 4
      Width = 99
      Height = 21
      Date = 42024.689216597220000000
      Time = 42024.689216597220000000
      TabOrder = 0
      OnChange = dtp1Change
    end
    object dtp2: TDateTimePicker
      Left = 309
      Top = 4
      Width = 125
      Height = 21
      Date = 42024.689216597220000000
      Time = 42024.689216597220000000
      TabOrder = 1
      OnChange = dtp1Change
    end
    object dtp3: TDateTimePicker
      Left = 158
      Top = 4
      Width = 107
      Height = 21
      Date = 42024.000000000000000000
      Time = 42024.000000000000000000
      Kind = dtkTime
      TabOrder = 2
      OnChange = dtp1Change
    end
    object dtp4: TDateTimePicker
      Left = 438
      Top = 4
      Width = 107
      Height = 21
      Date = 42024.999988425920000000
      Time = 42024.999988425920000000
      Kind = dtkTime
      TabOrder = 3
      OnChange = dtp1Change
    end
    object cbx1: TCheckBox
      Left = 568
      Top = 7
      Width = 65
      Height = 17
      Caption = #24211#23384
      Checked = True
      State = cbChecked
      TabOrder = 4
      OnClick = cbx1Click
    end
    object cbx2: TCheckBox
      Left = 632
      Top = 7
      Width = 73
      Height = 17
      Caption = #24050#20986#24211
      TabOrder = 5
      OnClick = cbx1Click
    end
    object cbx3: TCheckBox
      Left = 705
      Top = 6
      Width = 97
      Height = 17
      Caption = #24050#21024#38500
      TabOrder = 6
      Visible = False
      OnClick = cbx1Click
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 1530
    Height = 33
    Align = alTop
    TabOrder = 2
    object lbl4: TLabel
      Left = 684
      Top = 11
      Width = 52
      Height = 13
      Caption = #26631#31614#24211#65306
    end
    object lbl5: TLabel
      Left = 872
      Top = 13
      Width = 39
      Height = 13
      Caption = #21608#26399#65306
    end
    object btnExit: TBitBtn
      Left = 0
      Top = 1
      Width = 65
      Height = 31
      Caption = #36864#20986
      TabOrder = 0
      OnClick = btnExitClick
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
      Left = 66
      Top = 1
      Width = 65
      Height = 31
      Caption = #21047#26032
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
    object btnExprotToExcel: TBitBtn
      Left = 132
      Top = 1
      Width = 65
      Height = 31
      Caption = #23548#20986
      TabOrder = 2
      OnClick = btnExprotToExcelClick
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
    object btnSearch: TBitBtn
      Left = 198
      Top = 1
      Width = 65
      Height = 31
      Caption = #26597#35810
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
    object btnFields: TBitBtn
      Left = 264
      Top = 1
      Width = 65
      Height = 31
      Caption = #23383#27573
      TabOrder = 4
      Visible = False
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
    object edtFilter: TLabeledEdit
      Left = 525
      Top = 6
      Width = 121
      Height = 21
      EditLabel.Width = 64
      EditLabel.Height = 15
      EditLabel.Caption = #26412#21378#32534#21495
      EditLabel.Font.Charset = ANSI_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -15
      EditLabel.Font.Name = #40657#20307
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      LabelPosition = lpLeft
      TabOrder = 5
      OnChange = edtFilterChange
    end
    object btn1: TButton
      Left = 400
      Top = 8
      Width = 75
      Height = 25
      Caption = 'btn1'
      TabOrder = 6
      Visible = False
    end
    object cbx4: TComboBox
      Left = 744
      Top = 8
      Width = 97
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 7
      Text = #27491#24120#24211
      OnChange = cbx4Change
      Items.Strings = (
        #27491#24120#24211
        #36807#26399#24211)
    end
    object btnZQ: TBitBtn
      Left = 328
      Top = 2
      Width = 65
      Height = 31
      Caption = #35774#32622
      TabOrder = 8
      Visible = False
      OnClick = btnZQClick
    end
    object edtzhouqi: TEdit
      Left = 920
      Top = 7
      Width = 121
      Height = 21
      TabOrder = 9
      OnChange = edtFilterChange
    end
  end
  object ads405: TADODataSet
    Connection = dm1.con1
    CursorType = ctStatic
    AfterScroll = ads405AfterScroll
    CommandText = 
      'SELECT top 10000 isnull(d25.REVIEW_DAYS, 0) AS youxiaoqi'#13#10#9' , d4' +
      '05.*'#13#10#9' , d699.*'#13#10#9' , d05_1.EMPLOYEE_NAME AS inusername'#13#10#9' , d05' +
      '_2.EMPLOYEE_NAME AS outusername'#13#10#9' , d698.notes AS notes698'#13#10#9' ,' +
      ' d698.surface'#13#10#9' , d698.v_date'#13#10#9' , d06.WORK_ORDER_NUMBER'#13#10#9' , d' +
      '05_3.EMPLOYEE_NAME'#13#10#9' , case WHEN'#13#10#9#9'd698.lotno < right(DateName' +
      '(year,dateadd(wk,0-d07.REVIEW_DAYS/7,getdate())),2) + right('#39'00'#39 +
      ' + DateName(week,dateadd(wk,0-d07.REVIEW_DAYS/7,getdate())),2)'#13#10 +
      #9#9'then 1'#13#10#9#9'ELSE'#13#10#9#9' 0'#13#10#9#9'END as isguoqi'#13#10#9' , case WHEN'#13#10#9#9'd698.' +
      'lotno < right(DateName(year,dateadd(wk,0-d07.AlterDay/7,getdate(' +
      '))),2) + right('#39'00'#39' + DateName(week,dateadd(wk,0-d07.AlterDay/7,' +
      'getdate())),2)'#13#10#9#9'then 1'#13#10#9#9'ELSE'#13#10#9#9' 0'#13#10#9#9'END as isAlter'#13#10#9' , ca' +
      'se WHEN'#13#10#9#9'd698.lotno < right(DateName(year,dateadd(wk,0-d07.cus' +
      'tReciveDay/7,getdate())),2) + right('#39'00'#39' + DateName(week,dateadd' +
      '(wk,0-d07.custReciveDay/7,getdate())),2)'#13#10#9#9'then 1'#13#10#9#9'ELSE'#13#10#9#9' 0' +
      #13#10#9#9'END as IsOvercustRec'#13#10#9' , d07.REVIEW_DAYS'#13#10#9' , d07.AlterDay'#13 +
      #10#9' , d07.custReciveDay'#13#10#9' '#13#10'FROM'#13#10#9'data0405 d405'#13#10#9'LEFT JOIN dat' +
      'a0005 d05_1'#13#10#9#9'ON d405.inuser = d05_1.RKEY'#13#10#9'LEFT JOIN data0005 ' +
      'd05_2'#13#10#9#9'ON d405.outuser = d05_2.RKEY'#13#10#9'INNER JOIN data0699 d699' +
      #13#10#9#9'ON d405.rkey698 = d699.pack_ptr AND d405.id699 = d699.order_' +
      'no'#13#10#9'INNER JOIN DATA0698 d698'#13#10#9#9'ON d699.pack_ptr = d698.rkey'#13#10#9 +
      'LEFT JOIN Data0006 d06'#13#10#9#9'ON d06.RKEY = d699.wo_ptr'#13#10#9'LEFT JOIN ' +
      'Data0005 d05_3'#13#10#9#9'ON d698.empl_ptr = d05_3.RKEY'#13#10#9'INNER JOIN Dat' +
      'a0025 d25'#13#10#9#9'ON d25.MANU_PART_NUMBER = d699.MANU_PART_NUMBER'#13#10'IN' +
      'NER JOIN Data0008 d08 on d25.PROD_CODE_PTR = d08.RKEY'#13#10'INNER JOI' +
      'N Data0007 d07 ON d07.RKEY = d08.PR_GRP_POINTER'
    Parameters = <>
    Left = 160
    Top = 208
    object ads405rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ads405rkey698: TIntegerField
      FieldName = 'rkey698'
    end
    object ads405id699: TIntegerField
      FieldName = 'id699'
    end
    object ads405inuser: TIntegerField
      FieldName = 'inuser'
    end
    object ads405outuser: TIntegerField
      FieldName = 'outuser'
    end
    object ads405indatetime: TDateTimeField
      FieldName = 'indatetime'
    end
    object ads405outdatetime: TDateTimeField
      FieldName = 'outdatetime'
    end
    object ads405pack_ptr: TIntegerField
      FieldName = 'pack_ptr'
    end
    object ads405order_no: TSmallintField
      FieldName = 'order_no'
    end
    object ads405MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ads405MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ads405ANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      Size = 50
    end
    object ads405PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ads405description: TStringField
      FieldName = 'description'
      Size = 50
    end
    object ads405code: TStringField
      FieldName = 'code'
      Size = 15
    end
    object ads405qty: TIntegerField
      FieldName = 'qty'
    end
    object ads405lotno: TStringField
      FieldName = 'lotno'
      Size = 10
    end
    object ads405notes: TStringField
      FieldName = 'notes'
      Size = 50
    end
    object ads405barcode_id: TStringField
      FieldName = 'barcode_id'
      Size = 80
    end
    object ads405CaseNo: TStringField
      FieldName = 'CaseNo'
      Size = 7
    end
    object ads405param1: TStringField
      FieldName = 'param1'
      Size = 80
    end
    object ads405inusername: TStringField
      FieldName = 'inusername'
      Size = 16
    end
    object ads405outusername: TStringField
      FieldName = 'outusername'
      Size = 16
    end
    object ads405status: TIntegerField
      FieldName = 'status'
    end
    object strngfldads405place: TStringField
      FieldName = 'place'
      Size = 500
    end
    object strngfldads405Param2: TStringField
      FieldName = 'Param2'
      Size = 150
    end
    object intgrfldads405wo_ptr: TIntegerField
      FieldName = 'wo_ptr'
    end
    object intgrfldads405outpackkey: TIntegerField
      FieldName = 'outpackkey'
    end
    object strngfldads405barid: TStringField
      FieldName = 'barid'
      Size = 30
    end
    object intgrfldads405IncNO: TIntegerField
      FieldName = 'IncNO'
    end
    object intgrfldads405LockStatus: TIntegerField
      FieldName = 'LockStatus'
    end
    object ads405baknote: TStringField
      FieldName = 'baknote'
      Size = 512
    end
    object ads405note698: TStringField
      FieldName = 'notes698'
      Size = 50
    end
    object ads405LotOrder: TStringField
      FieldName = 'LotOrder'
      Size = 128
    end
    object ads405surface: TStringField
      FieldName = 'surface'
      Size = 30
    end
    object ads405v_date: TDateTimeField
      FieldName = 'v_date'
    end
    object ads405WORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object ads405EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ads405youxiaoqi: TSmallintField
      FieldName = 'youxiaoqi'
      ReadOnly = True
    end
    object ads405printfilename: TStringField
      FieldName = 'printfilename'
      Size = 200
    end
    object ads405isguoqi: TIntegerField
      FieldName = 'isguoqi'
      ReadOnly = True
    end
    object ads405isAlter: TIntegerField
      FieldName = 'isAlter'
      ReadOnly = True
    end
    object ads405IsOvercustRec: TIntegerField
      FieldName = 'IsOvercustRec'
      ReadOnly = True
    end
    object ads405REVIEW_DAYS: TIntegerField
      FieldName = 'REVIEW_DAYS'
    end
    object ads405AlterDay: TIntegerField
      FieldName = 'AlterDay'
    end
    object ads405custReciveDay: TIntegerField
      FieldName = 'custReciveDay'
    end
  end
  object ds405: TDataSource
    DataSet = ads405
    Left = 216
    Top = 208
  end
  object pm1: TPopupMenu
    OnPopup = pm1Popup
    Left = 320
    Top = 224
    object mnidele: TMenuItem
      Caption = #21024#38500
      OnClick = mnideleClick
    end
    object mniModiyPace: TMenuItem
      Caption = #20462#25913#20301#32622
      OnClick = mniModiyPaceClick
    end
    object mniReInStock: TMenuItem
      Caption = #20877#20837#24211
      OnClick = mniReInStockClick
    end
    object mniN1: TMenuItem
      Caption = '-'
    end
    object mniPinZhiGuanKong: TMenuItem
      Caption = #21697#36136#31649#25511
      OnClick = mniPinZhiGuanKongClick
    end
    object mniQuXiaoGuanKong: TMenuItem
      Caption = #21462#28040#31649#25511
      OnClick = mniQuXiaoGuanKongClick
    end
    object mniAllLock: TMenuItem
      Caption = #20840#37096#31649#25511
      OnClick = mniAllLockClick
    end
    object mniAllUnLock: TMenuItem
      Caption = #20840#37096#21462#28040#31649#25511
      OnClick = mniAllUnLockClick
    end
  end
end
