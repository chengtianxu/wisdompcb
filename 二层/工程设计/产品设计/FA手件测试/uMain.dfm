object main: Tmain
  Left = 291
  Top = 51
  ActiveControl = BitBtn2
  BorderStyle = bsDialog
  Caption = 'FA'#27979#35797
  ClientHeight = 755
  ClientWidth = 1108
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1108
    Height = 33
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object vpass: TLabel
      Left = 691
      Top = 9
      Width = 6
      Height = 13
      Caption = '0'
      Visible = False
    end
    object Label3: TLabel
      Left = 520
      Top = 9
      Width = 48
      Height = 16
      Alignment = taRightJustify
      Caption = 'FA'#32534#21495
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object BitBtn1: TBitBtn
      Left = 3
      Top = 1
      Width = 60
      Height = 30
      Caption = #36864#20986
      TabOrder = 0
      OnClick = BitBtn1Click
      Kind = bkClose
    end
    object BitBtn3: TBitBtn
      Left = 193
      Top = 0
      Width = 60
      Height = 30
      Caption = #23548#20986
      TabOrder = 1
      OnClick = BitBtn3Click
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
      Left = 125
      Top = 1
      Width = 69
      Height = 30
      Caption = #26597#35810
      TabOrder = 2
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
    object BitBtn6: TBitBtn
      Left = 347
      Top = 3
      Width = 59
      Height = 27
      Hint = #29992#25143#33258#23450#20041#25253#34920#26684#24335
      Caption = #23450#20041
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BitBtn6Click
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
    end
    object BtBrush: TBitBtn
      Left = 65
      Top = 2
      Width = 57
      Height = 29
      Caption = #21047#26032
      TabOrder = 4
      OnClick = BtBrushClick
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
      Left = 254
      Top = 2
      Width = 92
      Height = 27
      Caption = #23450#20041#27969#31243
      TabOrder = 5
      OnClick = BitBtn2Click
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
    object edtFilter: TEdit
      Left = 578
      Top = 6
      Width = 108
      Height = 21
      TabOrder = 6
      OnChange = edtFilterChange
    end
  end
  object Panel2: TPanel
    Left = 790
    Top = 32
    Width = 315
    Height = 721
    Caption = 'Panel2'
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 313
      Height = 719
      Align = alClient
      DataSource = dm.DataSource4
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = PopupMenu3
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGridEh1DrawColumnCell
      OnKeyDown = DBGridEh1KeyDown
      Columns = <
        item
          EditButtons = <>
          FieldName = 'd34_index'
          Footers = <>
          Title.Caption = #24207
          Width = 19
        end
        item
          EditButtons = <>
          FieldName = 'dept_name'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #23457#26680#37096#38376
          Width = 65
        end
        item
          EditButtons = <>
          FieldName = #29366#24577
          Footers = <>
          Title.Alignment = taCenter
          Width = 45
        end
        item
          EditButtons = <>
          FieldName = 'employee_name'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #23457#26680#20154
          Width = 45
        end
        item
          EditButtons = <>
          FieldName = 'check_time'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #25805#20316#26102#38388
          Width = 118
        end
        item
          EditButtons = <>
          FieldName = 'check_suggestion'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'check_person'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'rkey'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'd34_ptr'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'check_status'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #23457#26680#29366#24577
          Visible = False
          Width = 55
        end>
    end
    object DBMemo1: TDBMemo
      Left = 4
      Top = 485
      Width = 311
      Height = 234
      DataField = #36865#23457#20154#24847#35265
      DataSource = dm.DataSource1
      ReadOnly = True
      TabOrder = 1
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 30
    Width = 791
    Height = 723
    Caption = 'Panel2'
    TabOrder = 2
    object Panel3: TPanel
      Left = 1
      Top = 424
      Width = 785
      Height = 297
      TabOrder = 0
      object Label1: TLabel
        Left = 520
        Top = 9
        Width = 48
        Height = 16
        Alignment = taRightJustify
        Caption = 'FA'#32534#21495
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 3
        Top = 57
        Width = 56
        Height = 14
        Caption = #21442#19982#20154#21592
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lblFilter: TLabel
        Left = 335
        Top = 22
        Width = 32
        Height = 32
        Alignment = taRightJustify
        Caption = #24037#33402#13#10#38590#28857
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 334
        Top = 118
        Width = 32
        Height = 32
        Alignment = taRightJustify
        Caption = #25511#21046#13#10#35201#27714
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 333
        Top = 226
        Width = 32
        Height = 32
        Alignment = taRightJustify
        Caption = #27979#35797#13#10#32467#26524
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Panel7: TPanel
        Left = 416
        Top = 0
        Width = 376
        Height = 296
        Caption = 'Panel7'
        TabOrder = 0
        object Panel8: TPanel
          Left = 0
          Top = 0
          Width = 509
          Height = 89
          Caption = 'Panel8'
          TabOrder = 0
          object DBMemo2: TDBMemo
            Left = 3
            Top = 1
            Width = 485
            Height = 87
            DataField = 'DifficultPoint'
            DataSource = dm.DataSource5
            PopupMenu = PopupMenu2
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
        object Panel9: TPanel
          Left = 0
          Top = 88
          Width = 509
          Height = 97
          Caption = 'Panel9'
          TabOrder = 1
          object DBMemo3: TDBMemo
            Left = 3
            Top = 0
            Width = 485
            Height = 96
            DataField = 'BEIZHU'
            DataSource = dm.DataSource5
            PopupMenu = PopupMenu2
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
        object Panel10: TPanel
          Left = 0
          Top = 184
          Width = 509
          Height = 111
          Caption = 'Panel10'
          TabOrder = 2
          object DBMemo4: TDBMemo
            Left = 4
            Top = 0
            Width = 483
            Height = 109
            DataField = 'TestResult'
            DataSource = dm.DataSource5
            PopupMenu = PopupMenu2
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
      end
    end
    object Panel5: TPanel
      Left = 0
      Top = 0
      Width = 793
      Height = 425
      Caption = 'Panel5'
      TabOrder = 1
      object DBGridEh2: TDBGridEh
        Left = 1
        Top = 1
        Width = 791
        Height = 423
        Align = alClient
        DataSource = dm.DataSource1
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = PopupMenu1
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGridEh2DrawColumnCell
        OnKeyDown = DBGridEh2KeyDown
        OnMouseDown = DBGridEh2MouseDown
        OnTitleClick = DBGridEh2TitleClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'F_NUM'
            Footers = <>
            Title.Caption = 'FA'#32534#21495
            Width = 90
          end
          item
            EditButtons = <>
            FieldName = 'MANU_PART_NUMBER'
            Footers = <>
            Title.Caption = #26412#21378#32534#21495
            Width = 150
          end
          item
            EditButtons = <>
            FieldName = 'SALES_ORDER'
            Footers = <>
            Title.Caption = #38144#21806#35746#21333#21495
          end
          item
            EditButtons = <>
            FieldName = 'CUSTOMER_NAME'
            Footers = <>
            Title.Caption = #23458#25143#21517#31216
            Width = 110
          end
          item
            EditButtons = <>
            FieldName = 'QUAN_ON_HAND'
            Footers = <>
            Title.Caption = #25968#37327
          end
          item
            EditButtons = <>
            FieldName = #29366#24577
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'CreateDate'
            Footers = <>
            Title.Caption = #21019#24314#26085#26399
          end
          item
            EditButtons = <>
            FieldName = 'EMPLOYEE_NAME'
            Footers = <>
            Title.Caption = #21019#24314#20154
            Width = 95
          end>
      end
    end
  end
  object Panel6: TPanel
    Left = 0
    Top = 456
    Width = 289
    Height = 297
    Caption = 'Panel6'
    TabOrder = 3
    object DBGridEh3: TDBGridEh
      Left = 1
      Top = 1
      Width = 287
      Height = 295
      Align = alClient
      DataSource = dm.DataSource5
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = PopupMenu2
      ReadOnly = True
      RowLines = 2
      RowSizingAllowed = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGridEh3DrawColumnCell
      Columns = <
        item
          EditButtons = <>
          FieldName = 'STEP_NUMBER'
          Footers = <>
          Title.Caption = #24207#21495
          Width = 33
        end
        item
          EditButtons = <>
          FieldName = 'DEPT_CODE'
          Footers = <>
          Title.Caption = #24037#24207#20195#30721
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'DEPT_NAME'
          Footers = <>
          Title.Caption = #24037#24207#21517#31216
          Width = 135
        end
        item
          EditButtons = <>
          FieldName = 'DifficultPoint'
          Footers = <>
          Title.Caption = #38590#28857
          Visible = False
          Width = 250
        end
        item
          EditButtons = <>
          FieldName = 'BEIZHU'
          Footers = <>
          Title.Caption = #25511#21046#35201#27714
          Visible = False
          Width = 200
        end
        item
          EditButtons = <>
          FieldName = 'TestResult'
          Footers = <>
          Title.Caption = #27979#35797#32467#26524
          Visible = False
          Width = 272
        end>
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 648
    Top = 160
    object N15: TMenuItem
      Caption = #26032#22686
      OnClick = N15Click
    end
    object N1: TMenuItem
      Caption = #32534#36753
      OnClick = N1Click
    end
    object F2: TMenuItem
      Caption = #26816#26597
      OnClick = F2Click
    end
    object N2: TMenuItem
      Caption = #21024#38500
      OnClick = N2Click
    end
    object N4: TMenuItem
      Caption = #25552#20132#23457#26680
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = #21462#28040#23457#26680
      OnClick = N5Click
    end
    object FA1: TMenuItem
      Caption = #25171#21360'FA'#27979#35797#34920
      OnClick = FA1Click
    end
  end
  object PopupMenu3: TPopupMenu
    OnPopup = PopupMenu3Popup
    Left = 883
    Top = 178
    object MenuItem1: TMenuItem
      Caption = '-'
    end
    object N6: TMenuItem
      Tag = 1
      Caption = #23457#26680
      OnClick = N6Click
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object N8: TMenuItem
      Tag = 2
      Caption = #21462#28040#23457#26680
      OnClick = N6Click
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object N14: TMenuItem
      Tag = 3
      Caption = #36864#22238#36865#23457#20154
      OnClick = N6Click
    end
    object N17: TMenuItem
      Caption = '-'
    end
  end
  object ApplicationEvents1: TApplicationEvents
    OnMessage = ApplicationEvents1Message
    Left = 680
    Top = 248
  end
  object PopupMenu2: TPopupMenu
    OnPopup = PopupMenu2Popup
    Left = 144
    Top = 528
    object N11: TMenuItem
      Caption = #26032#22686#24037#24207
      OnClick = N11Click
    end
    object N3: TMenuItem
      Caption = #32534#36753#24037#24207
      OnClick = N3Click
    end
    object N12: TMenuItem
      Caption = #21024#38500#24037#24207
      OnClick = N12Click
    end
    object N10: TMenuItem
      Caption = #26816#26597#24037#24207
      OnClick = N10Click
    end
    object FA2: TMenuItem
      Caption = #25171#21360'FA'#27979#35797#34920
      OnClick = FA1Click
    end
  end
end
