object ship_location: Tship_location
  Left = 303
  Top = 163
  Width = 676
  Height = 516
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #23458#25143#35013#36816#22320#22336
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 660
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 142
      Top = 16
      Width = 65
      Height = 13
      Alignment = taRightJustify
      Caption = #23458#25143#20195#30721#65306
    end
    object Label39: TLabel
      Left = 298
      Top = 16
      Width = 65
      Height = 13
      Alignment = taRightJustify
      Caption = #23458#25143#21517#31216#65306
    end
    object DBEdit1: TDBEdit
      Left = 202
      Top = 12
      Width = 81
      Height = 21
      TabStop = False
      Color = clMenu
      DataField = 'CUST_CODE'
      DataSource = dm.dsq10
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 360
      Top = 12
      Width = 306
      Height = 21
      TabStop = False
      Color = clMenu
      DataField = 'CUSTOMER_NAME'
      DataSource = dm.dsq10
      ReadOnly = True
      TabOrder = 1
    end
  end
  object BitBtn1: TBitBtn
    Left = 7
    Top = 8
    Width = 25
    Height = 25
    Cursor = crHandPoint
    Hint = #23384#30424
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TabStop = False
    OnClick = BitBtn1Click
    Glyph.Data = {
      56070000424D5607000000000000360400002800000028000000140000000100
      0800000000002003000000000000000000000001000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
      0303030303030303030303030303030303030303030303030303030303030303
      0303030303030303030303030303030303030303030303030303030303030303
      0303030303030303030303030303030303030303030303030303030303030303
      030303FFFFFFFFFFFFFFFFFFFFFFFF030303030303F800000000000000000000
      0000F803030303030303F8F8F8F8F8F8F8F8F8F8F8F803FF030303030300FCFC
      00F8FCFCFF070700FCFC00030303030303F8FF03F8FF0303030303F8FF03F8FF
      030303030300FCFC00F8FCFCFF070700FCFC00030303030303F8FF03F8FF0303
      030303F8FF03F8FF030303030300FCFC0007F8F807070700FCFC000303030303
      03F8FF03F8FFFFFFFFFFFFF80303F8FF030303030300FCFC0600000000000006
      FCFC00030303030303F8FF0303F8F8F8F8F8F8030303F8FF030303030300FCFC
      FCFCFCFCFCFCFCFCFCFC00030303030303F8FF0303FFFFFFFFFFFFFFFF03F8FF
      030303030300FC06000000000000000006FC00030303030303F8FF03F8F8F8F8
      F8F8F8F803FFF8FF030303030300FC00FFFFFFFFFFFFFFFF00FC000303030303
      03F8FFF8FF03030303030303F8FFF8FF030303030300FC00FFFFFFFFFFFFFFFF
      00FC00030303030303F8FFF8FF03030303030303F8FFF8FF030303030300FC00
      FFFFFFFFFFFFFFFF00FC00030303030303F8FFF8FF03030303030303F8FFF8FF
      030303030300FC00FFFFFFFFFFFFFFFF00FC00030303030303F8FFF8FF030303
      03030303F8FFF8FF0303030303000000FFFFFFFFFFFFFFFF0000000303030303
      03F8FFF8FF03030303030303F8FFF8FF030303030300FC00FFFFFFFFFFFFFFFF
      00FC00030303030303F8FFF8FFFFFFFFFFFFFFFFF8FFF8030303030303F80000
      00000000000000000000F803030303030303F8F8F8F8F8F8F8F8F8F8F8F80303
      0303030303030303030303030303030303030303030303030303030303030303
      0303030303030303030303030303030303030303030303030303030303030303
      0303030303030303030303030303030303030303030303030303030303030303
      0303030303030303030303030303030303030303030303030303}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 32
    Top = 8
    Width = 25
    Height = 25
    Cursor = crHandPoint
    Hint = #21462#28040
    ModalResult = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    TabStop = False
    OnClick = BitBtn2Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333FFFFF333333000033333388888833333333333F888888FFF333
      000033338811111188333333338833FFF388FF33000033381119999111833333
      38F338888F338FF30000339119933331111833338F388333383338F300003391
      13333381111833338F8F3333833F38F3000039118333381119118338F38F3338
      33F8F38F000039183333811193918338F8F333833F838F8F0000391833381119
      33918338F8F33833F8338F8F000039183381119333918338F8F3833F83338F8F
      000039183811193333918338F8F833F83333838F000039118111933339118338
      F3833F83333833830000339111193333391833338F33F8333FF838F300003391
      11833338111833338F338FFFF883F83300003339111888811183333338FF3888
      83FF83330000333399111111993333333388FFFFFF8833330000333333999999
      3333333333338888883333330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object HeaderControl1: THeaderControl
    Left = 0
    Top = 41
    Width = 660
    Height = 17
    Sections = <
      item
        Alignment = taCenter
        ImageIndex = -1
        Text = #20869#23481#36873#25321
        Width = 140
      end
      item
        Alignment = taCenter
        ImageIndex = -1
        Width = 528
      end>
  end
  object TreeView1: TTreeView
    Left = 0
    Top = 58
    Width = 139
    Height = 419
    Align = alLeft
    HideSelection = False
    Indent = 19
    ReadOnly = True
    TabOrder = 4
    TabStop = False
    OnChange = TreeView1Change
    Items.Data = {
      01000000210000000000000000000000FFFFFFFFFFFFFFFF0000000003000000
      08D7B0D4CBB5D8B5E3210000000000000001000000FFFFFFFFFFFFFFFF000000
      000000000008D2BBB0E3D0C5CFA2230000000000000002000000FFFFFFFFFFFF
      FFFF00000000000000000AD4F6D6B5CBB0B1EABCC72100000000000000030000
      00FFFFFFFFFFFFFFFF000000000000000008C6E4CBFCD0C5CFA2}
  end
  object Notebook1: TNotebook
    Left = 139
    Top = 58
    Width = 521
    Height = 419
    Align = alClient
    PageIndex = 1
    TabOrder = 5
    TabStop = True
    object TPage
      Left = 0
      Top = 0
      Caption = 'Default'
    end
    object TPage
      Left = 0
      Top = 0
      Caption = #19968#33324#20449#24687
      object Label2: TLabel
        Left = 54
        Top = 12
        Width = 65
        Height = 13
        Alignment = taRightJustify
        Caption = #35013#36816#22320#28857#65306
      end
      object Bevel1: TBevel
        Left = 0
        Top = 31
        Width = 529
        Height = 4
        Shape = bsTopLine
      end
      object Label3: TLabel
        Left = 80
        Top = 39
        Width = 39
        Height = 13
        Alignment = taRightJustify
        Caption = #22320#22336#65306
      end
      object Label4: TLabel
        Left = 72
        Top = 94
        Width = 46
        Height = 13
        Caption = #24030'/'#30465#65306
      end
      object Label5: TLabel
        Left = 41
        Top = 228
        Width = 78
        Height = 13
        Alignment = taRightJustify
        Caption = #22269#23478#25110#22320#21306#65306
      end
      object Label6: TLabel
        Left = 67
        Top = 120
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = #32852#32476#20154#65306
      end
      object Label7: TLabel
        Left = 54
        Top = 147
        Width = 65
        Height = 13
        Alignment = taRightJustify
        Caption = #30005#35805#21495#30721#65306
      end
      object Label8: TLabel
        Left = 282
        Top = 147
        Width = 65
        Height = 13
        Alignment = taRightJustify
        Caption = #20256#30495#21495#30721#65306
      end
      object Label10: TLabel
        Left = 54
        Top = 174
        Width = 65
        Height = 13
        Alignment = taRightJustify
        Caption = #30005#23376#37038#20214#65306
      end
      object Label11: TLabel
        Left = 282
        Top = 228
        Width = 65
        Height = 13
        Alignment = taRightJustify
        Caption = #35013#36816#26041#27861#65306
      end
      object Label13: TLabel
        Left = 28
        Top = 255
        Width = 91
        Height = 13
        Alignment = taRightJustify
        Caption = #35013#36816#25552#21069#22825#25968#65306
      end
      object Label14: TLabel
        Left = 269
        Top = 255
        Width = 78
        Height = 13
        Alignment = taRightJustify
        Caption = #22870#37329#26377#25928#26399#65306
      end
      object Label15: TLabel
        Left = 277
        Top = 94
        Width = 65
        Height = 13
        Caption = #37038#25919#32534#30721#65306
      end
      object Label12: TLabel
        Left = 197
        Top = 228
        Width = 76
        Height = 13
        AutoSize = False
      end
      object Label9: TLabel
        Left = 80
        Top = 201
        Width = 39
        Height = 13
        Alignment = taRightJustify
        Caption = #32593#22336#65306
      end
      object DBEdit3: TDBEdit
        Left = 114
        Top = 8
        Width = 201
        Height = 21
        DataField = 'LOCATION'
        DataSource = dm.dsq12
        TabOrder = 0
      end
      object DBEdit4: TDBEdit
        Left = 114
        Top = 90
        Width = 111
        Height = 21
        DataField = 'STATE'
        DataSource = dm.dsq12
        TabOrder = 2
      end
      object DBEdit5: TDBEdit
        Left = 344
        Top = 90
        Width = 121
        Height = 21
        DataField = 'ZIP'
        DataSource = dm.dsq12
        TabOrder = 3
      end
      object DBEdit6: TDBEdit
        Left = 114
        Top = 116
        Width = 351
        Height = 21
        DataField = 'SHIP_TO_CONTACT'
        DataSource = dm.dsq12
        TabOrder = 4
      end
      object DBEdit7: TDBEdit
        Left = 114
        Top = 143
        Width = 111
        Height = 21
        DataField = 'SHIP_TO_PHONE'
        DataSource = dm.dsq12
        TabOrder = 5
      end
      object DBEdit8: TDBEdit
        Left = 344
        Top = 143
        Width = 121
        Height = 21
        DataField = 'SHIP_TO_FAX'
        DataSource = dm.dsq12
        TabOrder = 6
      end
      object DBEdit9: TDBEdit
        Left = 114
        Top = 170
        Width = 351
        Height = 21
        DataField = 'EMAIL_FOR_CONTACT'
        DataSource = dm.dsq12
        TabOrder = 7
      end
      object DBEdit11: TDBEdit
        Left = 344
        Top = 224
        Width = 89
        Height = 21
        DataField = 'SHIP_SHIPPING_METHOD'
        DataSource = dm.dsq12
        TabOrder = 11
      end
      object DBEdit12: TDBEdit
        Left = 114
        Top = 251
        Width = 111
        Height = 21
        DataField = 'SHIP_LEAD_TIME'
        DataSource = dm.dsq12
        TabOrder = 13
      end
      object Edit1: TEdit
        Left = 114
        Top = 224
        Width = 47
        Height = 21
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        OnExit = Edit1Exit
      end
      object BitBtn3: TBitBtn
        Tag = 1
        Left = 166
        Top = 222
        Width = 25
        Height = 25
        Hint = #22269#23478#25110#22320#21306#25628#32034
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
        TabStop = False
        OnClick = BitBtn3Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
          333333777777777F33333330B00000003333337F7777777F3333333000000000
          333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
          333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
          03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
          03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
          3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
          333333333377F7F33333333333330F03333333333337F7F33333333333330B03
          3333333333373733333333333333303333333333333373333333}
        NumGlyphs = 2
      end
      object BitBtn4: TBitBtn
        Tag = 2
        Left = 440
        Top = 222
        Width = 25
        Height = 25
        Hint = #35013#36816#26041#27861#25628#32034
        ParentShowHint = False
        ShowHint = True
        TabOrder = 12
        TabStop = False
        OnClick = BitBtn3Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
          333333777777777F33333330B00000003333337F7777777F3333333000000000
          333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
          333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
          03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
          03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
          3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
          333333333377F7F33333333333330F03333333333337F7F33333333333330B03
          3333333333373733333333333333303333333333333373333333}
        NumGlyphs = 2
      end
      object DBMemo1: TDBMemo
        Left = 114
        Top = 35
        Width = 351
        Height = 50
        DataField = 'SHIP_TO_ADDRESS_1'
        DataSource = dm.dsq12
        MaxLength = 100
        TabOrder = 1
      end
      object DBEdit10: TDBEdit
        Left = 114
        Top = 197
        Width = 351
        Height = 21
        DataField = 'SHIP_TO_ADDRESS_2'
        DataSource = dm.dsq12
        TabOrder = 8
      end
      object DBCheckBox1: TDBCheckBox
        Left = 363
        Top = 9
        Width = 110
        Height = 17
        Caption = #40664#35748#35013#36816#22320#28857
        DataField = 'LANGUAGE_FLAG'
        DataSource = dm.dsq12
        TabOrder = 15
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
      end
      object DBDateTimeEh1: TDBDateTimeEditEh
        Left = 344
        Top = 251
        Width = 123
        Height = 21
        DataField = 'EXPIRED_DATE'
        DataSource = dm.dsq12
        EditButtons = <>
        Kind = dtkDateEh
        TabOrder = 14
        Visible = True
      end
      object rgrpttype: TDBRadioGroup
        Left = 24
        Top = 280
        Width = 225
        Height = 105
        Caption = #35013#31665#21333#26684#24335
        Columns = 2
        DataField = 'overship_flag'
        DataSource = dm.dsq12
        Items.Strings = (
          #26684#24335#19968
          #26684#24335#20108
          #26684#24335#19977
          #26684#24335#22235)
        TabOrder = 16
        Values.Strings = (
          '0'
          '1'
          '2'
          '3')
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = #22686#20540#31246#26631#35782
      object Label23: TLabel
        Left = 281
        Top = 129
        Width = 70
        Height = 13
        Caption = '          '
      end
      object Bevel2: TBevel
        Left = 16
        Top = 266
        Width = 497
        Height = 110
        Shape = bsFrame
      end
      object Label24: TLabel
        Left = 193
        Top = 297
        Width = 26
        Height = 13
        Alignment = taRightJustify
        Caption = #35013#36816
      end
      object Label25: TLabel
        Left = 269
        Top = 297
        Width = 26
        Height = 13
        Alignment = taRightJustify
        Caption = #20135#21697
      end
      object Label26: TLabel
        Left = 344
        Top = 297
        Width = 26
        Height = 13
        Alignment = taRightJustify
        Caption = #24037#20855
      end
      object Label27: TLabel
        Left = 125
        Top = 293
        Width = 26
        Height = 13
        Alignment = taRightJustify
        Caption = #31867#21035
      end
      object Label28: TLabel
        Left = 419
        Top = 297
        Width = 26
        Height = 13
        Alignment = taRightJustify
        Caption = #31246#29575
      end
      object Label29: TLabel
        Left = 41
        Top = 325
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = #22686#20540#31246#65306
      end
      object DBCheckBox2: TDBCheckBox
        Left = 198
        Top = 323
        Width = 17
        Height = 17
        DataField = 'STATE_SHIP_TAX_FLAG'
        DataSource = dm.dsq12
        TabOrder = 0
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
      end
      object DBCheckBox3: TDBCheckBox
        Left = 274
        Top = 323
        Width = 17
        Height = 17
        DataField = 'STATE_PROD_TAX_FLAG'
        DataSource = dm.dsq12
        TabOrder = 1
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
      end
      object DBCheckBox4: TDBCheckBox
        Left = 349
        Top = 323
        Width = 17
        Height = 17
        DataField = 'STATE_TOOL_TAX_FLAG'
        DataSource = dm.dsq12
        TabOrder = 2
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
      end
      object Edit3: TEdit
        Left = 91
        Top = 321
        Width = 80
        Height = 21
        TabStop = False
        Color = cl3DLight
        ReadOnly = True
        TabOrder = 3
      end
      object Edit4: TEdit
        Left = 393
        Top = 321
        Width = 78
        Height = 21
        TabStop = False
        Color = cl3DLight
        ReadOnly = True
        TabOrder = 4
      end
      object GroupBox1: TGroupBox
        Left = 16
        Top = 13
        Width = 497
        Height = 209
        Caption = #22686#20540#31246#20449#24687
        TabOrder = 5
        object Label21: TLabel
          Left = 33
          Top = 145
          Width = 78
          Height = 13
          Alignment = taRightJustify
          Caption = #22686#20540#31246#20195#30721#65306
        end
        object Label22: TLabel
          Left = 33
          Top = 178
          Width = 78
          Height = 13
          Alignment = taRightJustify
          Caption = #22686#20540#31246#26631#35782#65306
        end
        object Label33: TLabel
          Left = 44
          Top = 96
          Width = 65
          Height = 13
          Alignment = taRightJustify
          Caption = #24320#25143#24080#21495#65306
        end
        object Label32: TLabel
          Left = 44
          Top = 61
          Width = 65
          Height = 13
          Alignment = taRightJustify
          Caption = #24320#25143#38134#34892#65306
        end
        object Label31: TLabel
          Left = 18
          Top = 27
          Width = 91
          Height = 13
          Alignment = taRightJustify
          Caption = #32435#31246#20154#30331#35760#21495#65306
        end
        object Label42: TLabel
          Left = 272
          Top = 145
          Width = 209
          Height = 13
          AutoSize = False
        end
        object BitBtn5: TBitBtn
          Tag = 4
          Left = 234
          Top = 139
          Width = 25
          Height = 25
          Hint = #22686#20540#31246#31867#21035#25628#32034
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnClick = BitBtn3Click
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
        object Edit2: TEdit
          Left = 106
          Top = 141
          Width = 122
          Height = 21
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnExit = Edit2Exit
        end
        object DBEdit17: TDBEdit
          Left = 106
          Top = 174
          Width = 122
          Height = 21
          DataField = 'SHIP_REG_TAX_ID'
          DataSource = dm.dsq12
          TabOrder = 5
        end
        object DBEdit16: TDBEdit
          Left = 106
          Top = 92
          Width = 235
          Height = 21
          DataField = 'SHIP_TO_ADDRESS_3'
          DataSource = dm.dsq12
          TabOrder = 2
        end
        object DBEdit15: TDBEdit
          Left = 106
          Top = 57
          Width = 235
          Height = 21
          DataField = 'SHP_ADDR3_FOR_FORM'
          DataSource = dm.dsq12
          TabOrder = 1
        end
        object DBEdit14: TDBEdit
          Left = 106
          Top = 23
          Width = 235
          Height = 21
          DataField = 'SHP_ADDR2_FOR_FORM'
          DataSource = dm.dsq12
          TabOrder = 0
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = #20854#23427#20449#24687
      object Label19: TLabel
        Left = 62
        Top = 166
        Width = 78
        Height = 13
        Alignment = taRightJustify
        Caption = #25910#36135#32852#31995#20154#65306
      end
      object Label20: TLabel
        Left = 101
        Top = 198
        Width = 39
        Height = 13
        Alignment = taRightJustify
        Caption = #30005#35805#65306
      end
      object Label34: TLabel
        Left = 101
        Top = 230
        Width = 39
        Height = 13
        Alignment = taRightJustify
        Caption = #20256#30495#65306
      end
      object Label35: TLabel
        Left = 48
        Top = 19
        Width = 91
        Height = 13
        Alignment = taRightJustify
        Caption = #25910#36135#20844#21496#20013#25991#65306
      end
      object Label36: TLabel
        Left = 48
        Top = 87
        Width = 91
        Height = 13
        Alignment = taRightJustify
        Caption = #25910#36135#22320#22336#20013#25991#65306
      end
      object Label37: TLabel
        Left = 100
        Top = 54
        Width = 39
        Height = 13
        Alignment = taRightJustify
        Caption = #33521#25991#65306
      end
      object Label38: TLabel
        Left = 100
        Top = 117
        Width = 39
        Height = 13
        Alignment = taRightJustify
        Caption = #33521#25991#65306
      end
      object GroupBox2: TGroupBox
        Left = 20
        Top = 264
        Width = 489
        Height = 113
        Caption = #29992#25143#33258#23450#20041#20449#24687
        TabOrder = 7
        object Label16: TLabel
          Left = 30
          Top = 23
          Width = 98
          Height = 13
          Alignment = taRightJustify
          Caption = #35013#36816#20998#26512#20195#30721'1'#65306
        end
        object Label17: TLabel
          Left = 30
          Top = 55
          Width = 98
          Height = 13
          Alignment = taRightJustify
          Caption = #35013#36816#20998#26512#20195#30721'2'#65306
        end
        object Label18: TLabel
          Left = 30
          Top = 87
          Width = 98
          Height = 13
          Alignment = taRightJustify
          Caption = #35013#36816#20998#26512#20195#30721'3'#65306
        end
        object DBEdit25: TDBEdit
          Left = 130
          Top = 19
          Width = 239
          Height = 21
          DataField = 'SHP_ANALYSIS_CODE1'
          DataSource = dm.dsq12
          TabOrder = 0
        end
        object DBEdit26: TDBEdit
          Left = 130
          Top = 51
          Width = 239
          Height = 21
          DataField = 'SHP_ANALYSIS_CODE2'
          DataSource = dm.dsq12
          TabOrder = 1
        end
        object DBEdit27: TDBEdit
          Left = 130
          Top = 83
          Width = 239
          Height = 21
          DataField = 'SHP_ANALYSIS_CODE3'
          DataSource = dm.dsq12
          TabOrder = 2
        end
      end
      object DBEdit18: TDBEdit
        Left = 144
        Top = 162
        Width = 239
        Height = 21
        DataField = 'S3_BARCODE_LABLE'
        DataSource = dm.dsq12
        TabOrder = 4
      end
      object DBEdit19: TDBEdit
        Left = 144
        Top = 194
        Width = 239
        Height = 21
        DataField = 'S4_BARCODE_LABLE'
        DataSource = dm.dsq12
        TabOrder = 5
      end
      object DBEdit20: TDBEdit
        Left = 144
        Top = 226
        Width = 239
        Height = 21
        DataField = 'PACKGE_BARCODE_LABLE'
        DataSource = dm.dsq12
        TabOrder = 6
      end
      object DBEdit21: TDBEdit
        Left = 143
        Top = 15
        Width = 239
        Height = 21
        DataField = 'LOCNAME_FOR_FORM'
        DataSource = dm.dsq12
        TabOrder = 0
      end
      object DBEdit23: TDBEdit
        Left = 143
        Top = 83
        Width = 239
        Height = 21
        DataField = 'SHP_ADDR1_FOR_FORM'
        DataSource = dm.dsq12
        TabOrder = 2
      end
      object DBEdit22: TDBEdit
        Left = 143
        Top = 50
        Width = 239
        Height = 21
        DataField = 'MISC_BARCODE_LABLE'
        DataSource = dm.dsq12
        TabOrder = 1
      end
      object DBEdit24: TDBEdit
        Left = 143
        Top = 113
        Width = 239
        Height = 21
        DataField = 'COFC_FORMAT_FILENAME'
        DataSource = dm.dsq12
        TabOrder = 3
      end
    end
  end
end
