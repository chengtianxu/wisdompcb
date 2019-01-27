object Form2: TForm2
  Left = 316
  Top = 303
  Width = 900
  Height = 591
  Caption = #26448#26009#25509#25910#28165#21333
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 884
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 458
      Top = 2
      Width = 78
      Height = 13
      Alignment = taRightJustify
      Caption = #25509#25910#25968#37327#21512#35745
    end
    object Label2: TLabel
      Left = 555
      Top = 2
      Width = 78
      Height = 13
      Alignment = taRightJustify
      Caption = #37329#39069#26412#24065#21547#31246
    end
    object Label3: TLabel
      Left = 265
      Top = 21
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #26448#26009#32534#30721
    end
    object Label4: TLabel
      Left = 665
      Top = 2
      Width = 91
      Height = 13
      Alignment = taRightJustify
      Caption = #37329#39069#26412#24065#19981#21547#31246
    end
    object Edit1: TEdit
      Left = 459
      Top = 19
      Width = 89
      Height = 21
      TabStop = False
      Color = cl3DLight
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      ReadOnly = True
      TabOrder = 0
      Text = '0.00'
    end
    object Edit2: TEdit
      Left = 555
      Top = 19
      Width = 105
      Height = 21
      TabStop = False
      Color = cl3DLight
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      ReadOnly = True
      TabOrder = 1
      Text = '0.0000'
    end
    object Edit3: TEdit
      Left = 327
      Top = 18
      Width = 127
      Height = 21
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 2
      OnChange = Edit3Change
    end
    object BitBtn5: TBitBtn
      Left = 186
      Top = 6
      Width = 57
      Height = 30
      Hint = #29992#25143#33258#23450#20041#26174#31034#23383#27573
      Caption = #23383#27573
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BitBtn5Click
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
    object Edit4: TEdit
      Left = 666
      Top = 19
      Width = 105
      Height = 21
      TabStop = False
      Color = cl3DLight
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      ReadOnly = True
      TabOrder = 4
      Text = '0.0000'
    end
    object BitBtn1: TBitBtn
      Left = 12
      Top = 6
      Width = 57
      Height = 30
      Cursor = crHandPoint
      Hint = #36864#20986
      Caption = #36864#20986
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
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
    object BitBtn4: TBitBtn
      Left = 70
      Top = 6
      Width = 57
      Height = 30
      Hint = #23548#20986#25968#25454'Excel'
      Caption = #23548#20986
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = BitBtn4Click
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
    object BitBtn2: TBitBtn
      Left = 128
      Top = 6
      Width = 57
      Height = 30
      Hint = #23548#20986#25968#25454'Excel'
      Caption = #25171#21360
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = BitBtn2Click
      Glyph.Data = {
        46060000424D4606000000000000360400002800000016000000160000000100
        0800000000001002000000000000000000000001000000010000343234009C9A
        9C00CCCECC006466640084828400B4B6B400ECEAEC004C4E4C00DCDEDC007476
        7400ACAAAC008C8E8C00CCC2CC0044424400F4F6F400645A6400DCD2DC00746A
        7400C4C2C400A4A2A400ECE2EC00948A9400C4BAC400FCF2FC005C5A5C00847A
        8400BCB2BC009C929C003C3A3C008C8A8C00F4F2F400E4E6E400B4B2B4004C4A
        4C0074727400D4D6D4008C828C00BCBEBC00F4EAF4005C565C00E4DEE4007C7E
        7C00B4AAB40094969400CCCACC004C424C00FCFEFC0064626400DCDADC00ACA2
        AC00A49AA400D4CED4006C666C00BCB6BC00544E54007C767C00948E9400FCF6
        FC007C6E7C00443A44003C363C0084868400ECEEEC00DCE2DC00ACAEAC00CCC6
        CC0044464400645E6400DCD6DC00746E7400C4C6C400A4A6A400ECE6EC00C4BE
        C4005C5E5C00847E84009C969C007C727C008C868C00F4EEF400E4E2E400B4AE
        B400D4CAD4004C464C006C626C00E4DAE400ACA6AC00A49EA400D4D2D4006C6A
        6C00BCBABC00545254007C7A7C0094929400FCFAFC00443E4400000000000000
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
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000041410C44144B
        27531B55264B37591C1926330C414152000052331031344D51241C4537384C48
        041C451A330C524100000C2A5919514458491A11003152164E073C5316330C41
        000024451630410C3358334415420241054D59420D16330C08020F06102C490C
        4133352F364D304F2E1B0F11210D16330000574D4955282C32592D595A5E5E2E
        0E50372F340D531A0000502A5F1A56110D595A2E2E5E5E50583F483743430019
        00000C04440C210312172E5E0E0658442346501F37340D24080234150841252E
        2E5E2E282358233D4C08461F1F195F2400004B45484F2E5E393E493847130721
        212B50402A2E59370000455D2E39391F2323515D031C2121034301252C401156
        00003A385E5058582C011853425B5B374B324C0545341A330802114C0E25235A
        5B4242214A111D1B510B1D225E404E520000152F48502C4622215B5C19571301
        22560839522E27410000554C5B5A3E5802293438200B1D5D4F2E2E2E125D1541
        00001210564D1B1E301E05380932352E5E5E1E49254D2A330802520C58104545
        120B5C36215E28103E10202551262752000041410C4133152F4D351027010E13
        524012352533131B00004152414141550C10524152115918141E350E5E442F19
        000041524152410C41414141520C4B11242E58485E2E4754080241520C414152
        4141524141414455151B2F522E35224E00005241524152410C52414152410C0C
        33381934191915330000}
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 884
    Height = 511
    Align = alClient
    DataSource = DataSource1
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'GRN_NUMBER'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DELIVER_NUMBER'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_REV_NO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'INV_PART_NUMBER'
        Width = 153
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_NAME'
        Width = 152
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_DESCRIPTION'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inv_group_name'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'reason'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'group_desc'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'QUANTITY'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tax_PRICE'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_RTNED_FM_FACT'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TAX_2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = #19981#21547#31246#20215
        Visible = False
      end
      item
        Expanded = False
        FieldName = #21407#24065#21547#31246#37329#39069
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26412#24065#21547#31246#37329#39069
        Visible = False
      end
      item
        Expanded = False
        FieldName = #26412#24065#19981#21547#31246#37329#39069
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CURR_CODE'
        Title.Caption = #36135#24065
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'code23'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAX_ID_NUMBER'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CODE_23'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'IQC'#23457#26680#26102#38388
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'IQC'#23457#26680#20154#21592
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ship_DATE'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_ON_HAND'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WAREHOUSE_CODE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'LOCATION'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rohs'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'SUPPLIER2'
        Title.Caption = #21407#20379#24212#21830#25110#29983#20135#25209#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BARCODE_ID'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cust_decl'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'spec_place'
        PickList.Strings = (
          '')
        Visible = True
      end
      item
        Expanded = False
        FieldName = #25509#25910#38754#31215
        Visible = False
      end
      item
        Expanded = False
        FieldName = #25509#25910#24635#37325
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'v_type'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'po_emplname'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'strstatus'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GLPTR_STATUS'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IQCstatus'
        Title.Caption = 'IQC'#26816#27979#29366#24577
        Visible = False
      end>
  end
  object ado0022: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      
        'SELECT     dbo.Data0456.GRN_NUMBER, dbo.Data0456.DELIVER_NUMBER,' +
        ' dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME,'
      
        '                      dbo.Data0017.INV_DESCRIPTION, dbo.Data0496' +
        '.GROUP_DESC, dbo.Data0015.WAREHOUSE_CODE, dbo.Data0070.PO_NUMBER' +
        ', '
      
        '                      dbo.Data0023.CODE AS code_23, dbo.Data0023' +
        '.ABBR_NAME AS code23, dbo.Data0023.TAX_ID_NUMBER, dbo.Data0022.Q' +
        'UANTITY, '
      
        '                      dbo.Data0022.QUAN_ON_HAND, dbo.Data0001.CU' +
        'RR_CODE, dbo.Data0022.TAX_2, ROUND(dbo.Data0022.tax_price,4) as ' +
        'tax_price, dbo.Data0022.PRICE AS '#19981#21547#31246#20215', '
      
        '                      ROUND(dbo.Data0022.QUANTITY * dbo.Data0022' +
        '.tax_price, 2) AS '#21407#24065#21547#31246#37329#39069', '
      
        '                      ROUND(dbo.Data0022.QUANTITY * dbo.Data0022' +
        '.tax_price * dbo.Data0456.exch_rate, 2) AS '#26412#24065#21547#31246#37329#39069', '
      
        '                      ROUND((dbo.Data0022.QUANTITY * dbo.Data002' +
        '2.tax_price * dbo.Data0456.exch_rate) / (1 + dbo.Data0022.TAX_2 ' +
        '* 0.01), 2) AS '#26412#24065#19981#21547#31246#37329#39069', '
      
        '                      dbo.Data0019.inv_group_name, dbo.Data0002.' +
        'UNIT_NAME, dbo.Data0070.PO_REV_NO, Data0005_1.EMPLOYEE_NAME, dbo' +
        '.Data0016.LOCATION, '
      
        '                      dbo.Data0456.ship_DATE, dbo.Data0022.SUPPL' +
        'IER2, dbo.Data0022.rohs, dbo.Data0022.BARCODE_ID, dbo.Data0022.E' +
        'XPIRE_DATE, '
      
        '                      dbo.Data0022.cust_decl, dbo.Data0017.STOCK' +
        '_SELL * dbo.Data0022.QUANTITY AS '#25509#25910#38754#31215', '
      
        '                      dbo.Data0022.STOCK_BASE * dbo.Data0022.QUA' +
        'NTITY AS '#25509#25910#24635#37325', ROUND(data0022.QUAN_RTNED_FM_FACT,4) as QUAN_RTNE' +
        'D_FM_FACT,'
      
        '                      CASE data0456.ttype WHEN 1 THEN '#39#32534#30721#20837#24211#39' WHE' +
        'N 3 THEN '#39#30452#25509#20837#24211#39' WHEN 4 THEN '#39#35843#25300#20837#24211#39' WHEN 5 THEN '#39'VMI'#20837#24211#39' END AS v_' +
        'type, '
      
        '                      dbo.Data0071.reason, Data0005_2.EMPLOYEE_N' +
        'AME AS po_emplname, dbo.Data0022.spec_place, dbo.Data0016.RKEY A' +
        'S rkey16, '
      
        '                      dbo.Data0005.EMPLOYEE_NAME AS IQC'#23457#26680#20154#21592',dbo.' +
        'Data0391.auth_date AS IQC'#23457#26680#26102#38388',dbo.data0022.GLPTR_STATUS,'
      
        '                      case dbo.data0456.status when 1 then '#39#26410#25552#20132#39 +
        ' when 2 then '#39#24453#23457#26680#39' when 3 then '#39#24050#23457#26680#39' when 4 then '#39#24050#35760#36134#39' when 5 th' +
        'en '#39#24050#20184#27454#39' when 6 then '#39#34987#36864#22238#39' end as strstatus,'
      
        '                      CASE data0391.status WHEN 1 THEN '#39#24453#26816#39564#39'  WH' +
        'EN 3 THEN '#39#23457#26680#19981#21512#26684#39'   WHEN 2  THEN   '#39#24050#23457#26680#39'  END AS IQCstatus'
      'FROM      dbo.Data0002 INNER JOIN'
      '             dbo.Data0023 INNER JOIN'
      '              dbo.Data0019 INNER JOIN'
      '              dbo.Data0022 INNER JOIN'
      
        '              dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data045' +
        '6.RKEY INNER JOIN'
      
        '              dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR = dbo.D' +
        'ata0017.RKEY INNER JOIN'
      
        '              dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0' +
        '496.RKEY ON dbo.Data0019.rkey = dbo.Data0496.group_ptr INNER JOI' +
        'N'
      
        '              dbo.Data0005 AS Data0005_1 ON dbo.Data0456.CREATE_' +
        'BY = Data0005_1.RKEY ON dbo.Data0023.RKEY = dbo.Data0456.SUPP_PT' +
        'R ON     '
      
        '              dbo.Data0002.RKEY = dbo.Data0022.LOCATION_PTR_FROM' +
        ' INNER JOIN'
      
        '              dbo.Data0015 ON dbo.Data0456.warehouse_ptr = dbo.D' +
        'ata0015.RKEY INNER JOIN'
      
        '              dbo.Data0016 ON dbo.Data0022.LOCATION_PTR = dbo.Da' +
        'ta0016.RKEY INNER JOIN'
      
        '              dbo.Data0001 ON dbo.Data0456.currency_ptr = dbo.Da' +
        'ta0001.RKEY LEFT OUTER JOIN'
      
        '              dbo.DATA0391 ON dbo.Data0022.rkey391 = dbo.DATA039' +
        '1.rkey LEFT OUTER JOIN'
      
        '              dbo.Data0071 ON dbo.Data0022.SOURCE_PTR = dbo.Data' +
        '0071.RKEY LEFT OUTER JOIN'
      
        '              dbo.Data0005 ON dbo.DATA0391.auth_user_ptr = dbo.D' +
        'ata0005.RKEY LEFT OUTER JOIN'
      '              dbo.Data0005 AS Data0005_2 RIGHT OUTER JOIN'
      
        '              dbo.Data0070 ON Data0005_2.RKEY = dbo.Data0070.EMP' +
        'LOYEE_POINTER ON dbo.Data0456.PO_PTR = dbo.Data0070.RKEY'
      'WHERE     (dbo.Data0022.QUANTITY > 0) ')
    Left = 48
    Top = 448
    object ado0022GRN_NUMBER: TStringField
      DisplayLabel = #20837#24211#21333#21495
      DisplayWidth = 10
      FieldName = 'GRN_NUMBER'
      ReadOnly = True
      FixedChar = True
      Size = 30
    end
    object ado0022DELIVER_NUMBER: TStringField
      DisplayLabel = #36865#36135#21333#21495
      FieldName = 'DELIVER_NUMBER'
      ReadOnly = True
      Size = 15
    end
    object ado0022PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#35746#21333#21495
      FieldName = 'PO_NUMBER'
      ReadOnly = True
      Size = 15
    end
    object ado0022INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      DisplayWidth = 25
      FieldName = 'INV_PART_NUMBER'
      ReadOnly = True
      Size = 25
    end
    object ado0022INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      DisplayWidth = 15
      FieldName = 'INV_NAME'
      ReadOnly = True
      Size = 30
    end
    object ado0022INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      DisplayWidth = 20
      FieldName = 'INV_DESCRIPTION'
      ReadOnly = True
      Size = 70
    end
    object ado0022GROUP_DESC: TStringField
      DisplayLabel = #26448#26009#31867#22411
      FieldName = 'group_desc'
      ReadOnly = True
      Size = 30
    end
    object ado0022code23: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      DisplayWidth = 11
      FieldName = 'code23'
      ReadOnly = True
      Size = 16
    end
    object ado0022QUANTITY: TFloatField
      DisplayLabel = #25509#25910#25968#37327
      DisplayWidth = 18
      FieldName = 'QUANTITY'
      ReadOnly = True
    end
    object ado0022CURR_CODE: TStringField
      DisplayLabel = #25509#25910#36135#24065
      DisplayWidth = 9
      FieldName = 'CURR_CODE'
      ReadOnly = True
      Size = 5
    end
    object ado0022PRICE: TFloatField
      DisplayLabel = #21547#31246#20215
      FieldName = 'tax_PRICE'
      ReadOnly = True
    end
    object ado0022QUAN_ON_HAND: TFloatField
      DisplayLabel = #29616#26377#25968#37327
      DisplayWidth = 18
      FieldName = 'QUAN_ON_HAND'
      ReadOnly = True
    end
    object ado0022WAREHOUSE_CODE: TStringField
      DisplayLabel = #24037#21378
      DisplayWidth = 9
      FieldName = 'WAREHOUSE_CODE'
      ReadOnly = True
      Size = 5
    end
    object ado0022inv_group_name: TStringField
      DisplayLabel = #26448#26009#32452#21035
      FieldName = 'inv_group_name'
      ReadOnly = True
    end
    object ado0022reason: TStringField
      DisplayLabel = #35831#36141#21407#22240
      DisplayWidth = 20
      FieldName = 'reason'
      ReadOnly = True
      FixedChar = True
      Size = 60
    end
    object ado0022UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      DisplayWidth = 10
      FieldName = 'UNIT_NAME'
      ReadOnly = True
    end
    object ado0022PO_REV_NO: TStringField
      DisplayLabel = #35831#36141#37096#38376
      FieldName = 'PO_REV_NO'
      ReadOnly = True
      Size = 10
    end
    object ado0022EMPLOYEE_NAME: TStringField
      DisplayLabel = #25910#36135#20154#21592
      DisplayWidth = 10
      FieldName = 'EMPLOYEE_NAME'
      ReadOnly = True
      Size = 16
    end
    object ado0022LOCATION: TStringField
      DisplayLabel = #20179#24211
      FieldName = 'LOCATION'
      ReadOnly = True
      Size = 10
    end
    object ado0022TAX_2: TBCDField
      DisplayLabel = #31246#29575'%'
      FieldName = 'TAX_2'
      ReadOnly = True
      Precision = 4
      Size = 2
    end
    object ado0022ship_DATE: TDateTimeField
      DisplayLabel = #25910#36135#26085#26399
      FieldName = 'ship_DATE'
      ReadOnly = True
    end
    object ado0022BARCODE_ID: TStringField
      DisplayLabel = #22791#27880
      DisplayWidth = 50
      FieldName = 'BARCODE_ID'
      ReadOnly = True
      Size = 50
    end
    object ado0022SUPPLIER2: TStringField
      DisplayLabel = #29983#20135#25209#21495#25110#21407#20379#24212#21830
      FieldName = 'SUPPLIER2'
      ReadOnly = True
      Size = 30
    end
    object ado0022rohs: TStringField
      DisplayLabel = #29615#20445#26631#35782
      FieldName = 'rohs'
      ReadOnly = True
      Size = 10
    end
    object ado0022EXPIRE_DATE: TDateTimeField
      DisplayLabel = #26377#25928#26399
      FieldName = 'EXPIRE_DATE'
      ReadOnly = True
    end
    object ado0022CODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'CODE_23'
      ReadOnly = True
      Size = 10
    end
    object ado0022DSDesigner3: TBCDField
      FieldName = #19981#21547#31246#20215
      ReadOnly = True
      Precision = 23
      Size = 12
    end
    object ado0022DSDesigner: TBCDField
      DisplayWidth = 10
      FieldName = #21407#24065#21547#31246#37329#39069
      ReadOnly = True
      Precision = 32
    end
    object ado0022DSDesigner2: TBCDField
      DisplayWidth = 10
      FieldName = #26412#24065#21547#31246#37329#39069
      ReadOnly = True
      Precision = 32
      Size = 6
    end
    object ado0022DSDesigner4: TBCDField
      DisplayWidth = 10
      FieldName = #26412#24065#19981#21547#31246#37329#39069
      ReadOnly = True
      Precision = 32
      Size = 8
    end
    object ado0022DSDesigner5: TFloatField
      DisplayLabel = #25509#25910#24635#37325'KG'
      FieldName = #25509#25910#24635#37325
      ReadOnly = True
    end
    object ado0022DSDesigner6: TFloatField
      FieldName = #25509#25910#38754#31215
      ReadOnly = True
    end
    object ado0022cust_decl: TStringField
      DisplayLabel = #25253#20851#21333#21495
      FieldName = 'cust_decl'
      ReadOnly = True
      Size = 50
    end
    object ado0022v_type: TStringField
      DisplayLabel = #20837#20179#31867#22411
      FieldName = 'v_type'
      ReadOnly = True
      Size = 8
    end
    object ado0022TAX_ID_NUMBER: TStringField
      DisplayLabel = #20184#27454#26041#24335
      FieldName = 'TAX_ID_NUMBER'
      ReadOnly = True
    end
    object ado0022po_emplname: TStringField
      DisplayLabel = #37319#36141#20154#21592
      FieldName = 'po_emplname'
      ReadOnly = True
      Size = 16
    end
    object ado0022spec_place: TStringField
      DisplayLabel = #20855#20307#20301#32622
      FieldName = 'spec_place'
      ReadOnly = True
    end
    object ado0022rkey16: TAutoIncField
      FieldName = 'rkey16'
      ReadOnly = True
    end
    object ado0022IQC: TStringField
      FieldName = 'IQC'#23457#26680#20154#21592
      ReadOnly = True
      Size = 16
    end
    object ado0022IQC2: TDateTimeField
      FieldName = 'IQC'#23457#26680#26102#38388
      ReadOnly = True
    end
    object ado0022QUAN_RTNED_FM_FACT: TFloatField
      DisplayLabel = 'VMI'#21547#31246#20215
      FieldName = 'QUAN_RTNED_FM_FACT'
      ReadOnly = True
    end
    object ado0022GLPTR_STATUS: TBooleanField
      DisplayLabel = #26159#21542#24320#31080
      FieldName = 'GLPTR_STATUS'
      ReadOnly = True
    end
    object ado0022strstatus: TStringField
      DisplayLabel = #20837#24211#21333#29366#24577
      FieldName = 'strstatus'
      ReadOnly = True
      Size = 6
    end
    object ado0022IQCstatus: TStringField
      FieldName = 'IQCstatus'
      ReadOnly = True
      Size = 6
    end
  end
  object DataSource1: TDataSource
    DataSet = ado0022
    Left = 120
    Top = 448
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    Left = 244
    Top = 8
  end
  object PopupMenu2: TPopupMenu
    Left = 131
    Top = 33
    object N1: TMenuItem
      Caption = #35774#35745#25253#34920
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #25171#21360#25253#34920
      OnClick = N2Click
    end
  end
  object ADOQuery1: TADOQuery
    Connection = Form1.ADOConnection1
    Parameters = <>
    Left = 216
    Top = 448
  end
end
