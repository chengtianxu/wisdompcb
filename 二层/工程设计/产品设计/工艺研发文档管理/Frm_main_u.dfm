object Frm_main: TFrm_main
  Left = 276
  Top = 114
  Width = 830
  Height = 642
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #24037#33402#25991#26723#31649#29702
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 814
    Height = 33
    Align = alTop
    TabOrder = 0
    object Label2: TLabel
      Left = 320
      Top = 8
      Width = 52
      Height = 13
      Caption = #39033#30446#32534#21495
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 378
      Top = 4
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
    object BtnClose: TBitBtn
      Left = 3
      Top = 3
      Width = 55
      Height = 28
      Hint = #36864#20986
      Caption = #36864#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = False
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
    object BtnBrush: TBitBtn
      Left = 58
      Top = 3
      Width = 55
      Height = 28
      Hint = #36864#20986
      Caption = #21047#26032
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      TabStop = False
      OnClick = BtnBrushClick
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
    object BtnQry: TBitBtn
      Left = 114
      Top = 3
      Width = 55
      Height = 28
      Hint = #37325#26032#23450#20041#26597#35810#26465#20214
      Caption = #26597#35810
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BtnQryClick
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
    object BtnDef: TBitBtn
      Left = 186
      Top = 2
      Width = 103
      Height = 28
      Hint = #37325#26032#23450#20041#26597#35810#26465#20214
      Caption = #39033#30446#31867#21035#23450#20041
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = BtnDefClick
      Glyph.Data = {
        9E050000424D9E05000000000000360400002800000012000000120000000100
        080000000000680100001217000012170000000100000000000000000000F870
        48000048D800F8F8F800003090004870F80090300000F8886800006F00006E00
        3100003600002E00670000690000660000000000000000000000000000000000
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
        00000013000060AD1700000000000000E400F712000035A6FC00770000001300
        0700A7FC7700080613000083A600FC7700000000000035A5FC0077FFFF000000
        7C00010000000000000000000000000000000000000000000000000000000000
        31000000000000EAF100006400006600D800CD1700007801130000D8CD001700
        780001130000D0CD1700000000000000C000F7120000C8F3EB007770F5001200
        0000ECFD7F0002000000000000001300E8000100000001000A0000884000F877
        6000AD1700000100000000998400E6775400F71200000101010001D8F8001200
        450090FB7700801FF80077FFFF00FFFF6000F8120000AD84E6007760F8001200
        D80084E677000000000000FFFF000000C800EAF10000C8EAF100001800000000
        00000000000044F8120000400000000000000000000028F81200000000000000
        00000000000000000000000C000000000200000000000101120000872B00F877
        0000ECFD7F00000000000002000000006C00001A020068AD1700007FFF00FFFF
        00000000000068AD1700000500000000870031E6770084F8120000218600E677
        9800F81200006713000010FFFF0000007C0001000000C8EAF100000000000000
        7000F8120000ACF8120000D8F8001200100030001000F8400000105F5400E677
        7C0001000000D0F8120000D8F80012000800000000000E000000030303030303
        0303F8F9F8E9A7A703030303F9B50303030303030389EB090606F6F9BF030303
        F9B50303F900000000008B0707E907C8C8000303F9B503030000000000000082
        8201070706D70003F9B50303000405050500F9F9B400EB070706D7C2F9B503A7
        E900FF050500F8A70303F9B5F90701A8F9B503F90AE805050489F9A70303C7FF
        B5B5B1EBF9B50300B9050502C8D7B403030303AF090707E3F9B50300F8050504
        B5C203030303030382070709F9B5030004C005F88C0303030303A703000707B5
        F9B503FF040505E8F9EF03030303F900000707DFF9B50300DD05A80206EF0303
        03030000EB07F9B5F9B503A700020505E803030303030DF9B5B5B1DFF9B50303
        F900B9050289C20303039CF9B10706F8F9B503C70300D4E805028B00F9EFF607
        0707070BF9B50303030300000205028900D4C8D7AFAFC806F9B50303030303F9
        00E8050504049907F8F9B4C7F9B50303030303A703C2F609F809C20303030303
        F9B5}
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 33
    Width = 814
    Height = 426
    Align = alClient
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 448
      Height = 424
      Align = alLeft
      DataSource = DS1
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking]
      PopupMenu = PopupMenu1
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnTitleClick = DBGridEh1TitleClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'PrgID'
          Footers = <>
          Title.Alignment = taCenter
          Title.Color = clRed
          Title.SortIndex = 1
          Title.SortMarker = smUpEh
          Title.TitleButton = True
          Width = 91
        end
        item
          EditButtons = <>
          FieldName = 'PrgName'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Width = 138
        end
        item
          EditButtons = <>
          FieldName = 'Responsor'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Width = 57
        end
        item
          EditButtons = <>
          FieldName = 'overDate'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Width = 71
        end
        item
          EditButtons = <>
          FieldName = 'type_name'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Width = 55
        end>
    end
    object Panel5: TPanel
      Left = 449
      Top = 1
      Width = 364
      Height = 424
      Align = alClient
      TabOrder = 1
      object Label3: TLabel
        Left = 5
        Top = 5
        Width = 56
        Height = 14
        Caption = #31435#39033#26102#38388
        FocusControl = DBEdit1
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 5
        Top = 29
        Width = 56
        Height = 14
        Caption = #32467#26463#26102#38388
        FocusControl = DBEdit2
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 5
        Top = 105
        Width = 56
        Height = 14
        Caption = #39033#30446#31616#20171
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 5
        Top = 242
        Width = 56
        Height = 14
        Caption = #39033#30446#30446#30340
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 211
        Top = 9
        Width = 42
        Height = 14
        Caption = #32467#26696#20154
        FocusControl = DBEdit3
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 209
        Top = 34
        Width = 45
        Height = 14
        Caption = #24050#32467#26696
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 5
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
      object Label10: TLabel
        Left = 5
        Top = 351
        Width = 56
        Height = 14
        Caption = #39033#30446#35780#20215
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object DBEdit1: TDBEdit
        Left = 65
        Top = 3
        Width = 88
        Height = 21
        DataField = 'StartDate'
        DataSource = DS1
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 65
        Top = 27
        Width = 88
        Height = 21
        DataField = 'EndDate'
        DataSource = DS1
        ReadOnly = True
        TabOrder = 1
      end
      object DBMemo2: TDBMemo
        Left = 65
        Top = 103
        Width = 303
        Height = 129
        DataField = 'PrgScript'
        DataSource = DS1
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 2
      end
      object DBMemo3: TDBMemo
        Left = 65
        Top = 238
        Width = 303
        Height = 105
        DataField = 'PrgFunc'
        DataSource = DS1
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 3
      end
      object DBEdit3: TDBEdit
        Left = 255
        Top = 5
        Width = 93
        Height = 21
        Color = clBtnFace
        DataField = 'employee_name'
        DataSource = DS1
        ReadOnly = True
        TabOrder = 4
      end
      object DBMemo4: TDBMemo
        Left = 65
        Top = 56
        Width = 303
        Height = 40
        DataField = 'partMan'
        DataSource = DS1
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 5
      end
      object DBMemo5: TDBMemo
        Left = 65
        Top = 349
        Width = 303
        Height = 76
        DataField = 'PrgRemark'
        DataSource = DS1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 6
      end
      object DBCheckBox1: TDBCheckBox
        Left = 256
        Top = 32
        Width = 73
        Height = 17
        DataField = 'status'
        DataSource = DS1
        ReadOnly = True
        TabOrder = 7
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 459
    Width = 814
    Height = 145
    Align = alBottom
    Caption = 'Panel3'
    TabOrder = 2
    object DBGridEh2: TDBGridEh
      Left = 1
      Top = 1
      Width = 480
      Height = 143
      Align = alLeft
      DataSource = DS2
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      PopupMenu = PopupMenu2
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'doc_name'
          Footers = <>
          Title.Alignment = taCenter
          Width = 152
        end
        item
          EditButtons = <>
          FieldName = 'doc_ver'
          Footers = <>
          Title.Alignment = taCenter
          Width = 52
        end
        item
          EditButtons = <>
          FieldName = 'saveDate'
          Footers = <>
          Title.Alignment = taCenter
          Width = 67
        end
        item
          EditButtons = <>
          FieldName = 'employee_name'
          Footers = <>
          Title.Alignment = taCenter
          Width = 58
        end
        item
          EditButtons = <>
          FieldName = 'createMan'
          Footers = <>
          Title.Alignment = taCenter
          Width = 74
        end
        item
          EditButtons = <>
          FieldName = 'status'
          Footers = <>
          Title.Alignment = taCenter
        end>
    end
    object Panel4: TPanel
      Left = 481
      Top = 1
      Width = 332
      Height = 143
      Align = alClient
      Caption = 'Panel4'
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 24
        Width = 20
        Height = 76
        Caption = #25991#26723#35828#26126
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -19
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object DBMemo1: TDBMemo
        Left = 24
        Top = 1
        Width = 307
        Height = 141
        Align = alRight
        DataField = 'DocScript'
        DataSource = DS2
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object DS1: TDataSource
    DataSet = DM.ADO307
    Left = 176
    Top = 177
  end
  object DS2: TDataSource
    DataSet = DM.ADO308
    Left = 168
    Top = 516
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 272
    Top = 185
    object N1: TMenuItem
      Caption = #26032#22686
      OnClick = N1Click
    end
    object N2: TMenuItem
      Tag = 1
      Caption = #20462#25913
      OnClick = N1Click
    end
    object N3: TMenuItem
      Tag = 2
      Caption = #21024#38500
      OnClick = N1Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N5: TMenuItem
      Tag = 3
      Caption = #32467#26696
      OnClick = N1Click
    end
    object N6: TMenuItem
      Tag = 4
      Caption = #21462#28040#32467#26696
      OnClick = N1Click
    end
  end
  object PopupMenu2: TPopupMenu
    OnPopup = PopupMenu2Popup
    Left = 272
    Top = 523
    object N7: TMenuItem
      Caption = #25171#24320#25991#26723
      OnClick = N7Click
    end
  end
end
