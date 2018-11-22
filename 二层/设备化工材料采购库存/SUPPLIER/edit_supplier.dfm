object Form2: TForm2
  Left = 208
  Top = 134
  Width = 705
  Height = 469
  Caption = #20379#24212#21830
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 0
    Width = 697
    Height = 41
    Cursor = crArrow
    Align = alTop
  end
  object Label1: TLabel
    Left = 269
    Top = 13
    Width = 67
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#20379#24212#21830':'
  end
  object DBText1: TDBText
    Left = 347
    Top = 13
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'SUPPLIER_NAME'
    DataSource = DM.DataSource1
  end
  object copy_lab: TLabel
    Left = 176
    Top = 16
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 8
    Width = 25
    Height = 25
    Cursor = crHandPoint
    Hint = #20445#23384
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
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
    Left = 34
    Top = 8
    Width = 25
    Height = 25
    Cursor = crHandPoint
    Hint = #35760#20107#26412
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ShowHint = True
    TabOrder = 1
    TabStop = False
    OnClick = BitBtn2Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555500000000
      0555555F7777777775F55500FFFFFFFFF0555577F5FFFFFFF7F550F0FEEEEEEE
      F05557F7F777777757F550F0FFFFFFFFF05557F7F5FFFFFFF7F550F0FEEEEEEE
      F05557F7F777777757F550F0FF777FFFF05557F7F5FFFFFFF7F550F0FEEEEEEE
      F05557F7F777777757F550F0FF7F777FF05557F7F5FFFFFFF7F550F0FEEEEEEE
      F05557F7F777777757F550F0FF77F7FFF05557F7F5FFFFFFF7F550F0FEEEEEEE
      F05557F7F777777757F550F0FFFFFFFFF05557F7FF5F5F5F57F550F00F0F0F0F
      005557F77F7F7F7F77555055070707070555575F7F7F7F7F7F55550507070707
      0555557575757575755555505050505055555557575757575555}
    NumGlyphs = 2
  end
  object BitBtn3: TBitBtn
    Left = 60
    Top = 8
    Width = 25
    Height = 25
    Cursor = crHandPoint
    Hint = #21462#28040
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    TabStop = False
    OnClick = BitBtn3Click
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
    Width = 697
    Height = 17
    DragReorder = False
    Sections = <
      item
        Alignment = taCenter
        ImageIndex = -1
        Text = #20869#23481#36873#25321
        Width = 200
      end
      item
        Alignment = taCenter
        ImageIndex = -1
        Width = 565
      end>
  end
  object TreeView1: TTreeView
    Left = 0
    Top = 58
    Width = 199
    Height = 384
    Align = alLeft
    HideSelection = False
    Indent = 19
    ReadOnly = True
    TabOrder = 4
    OnChange = TreeView1Change
    Items.Data = {
      0200000023000000000000000000000000000000FFFFFFFF0000000003000000
      0AB9A9D3A6C9CCD0C5CFA221000000000000000100000001000000FFFFFFFF00
      0000000000000008D2BBB0E3D0C5CFA221000000000000000200000002000000
      FFFFFFFF000000000000000008B2C6CEF1D0C5CFA22100000000000000050000
      0005000000FFFFFFFF000000000000000008B6EECDE2D7CAD1B6210000000000
      00000600000006000000FFFFFFFF000000000000000008D7B0D4CBB5D8B5E3}
  end
  object Notebook1: TNotebook
    Left = 199
    Top = 58
    Width = 498
    Height = 384
    Align = alClient
    PageIndex = 1
    TabOrder = 5
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
        Left = 9
        Top = 9
        Width = 93
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#20379#24212#21830#20195#30721':'
      end
      object Label3: TLabel
        Left = 9
        Top = 34
        Width = 93
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#20379#24212#21830#21517#31216':'
      end
      object Label4: TLabel
        Left = 48
        Top = 58
        Width = 54
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#32553#20889':'
      end
      object Label5: TLabel
        Left = 48
        Top = 82
        Width = 54
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#22320#22336':'
      end
      object Label6: TLabel
        Left = 41
        Top = 155
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#24030'/'#30465':'
      end
      object Label7: TLabel
        Left = 22
        Top = 179
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#30005#35805#21495#30721':'
      end
      object Label8: TLabel
        Left = 22
        Top = 203
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#24320#25143#38134#34892':'
      end
      object Label9: TLabel
        Left = 22
        Top = 227
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#38134#34892#24080#21495':'
      end
      object Label10: TLabel
        Left = 9
        Top = 251
        Width = 93
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#22269#23478#25110#22320#21306':'
      end
      object Label11: TLabel
        Left = 48
        Top = 276
        Width = 54
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#36135#24065':'
      end
      object Label12: TLabel
        Left = 245
        Top = 154
        Width = 54
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#37038#32534':'
      end
      object Label13: TLabel
        Left = 219
        Top = 178
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#20256#30495#21495#30721':'
      end
      object Label14: TLabel
        Left = 281
        Top = 60
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#35821#35328#26631#35760':'
      end
      object Bevel1: TBevel
        Left = 18
        Top = 303
        Width = 479
        Height = 73
      end
      object Label15: TLabel
        Left = 46
        Top = 318
        Width = 81
        Height = 13
        Alignment = taRightJustify
        Caption = '    '#32852#32476#20154'1:'
      end
      object Label16: TLabel
        Left = 292
        Top = 318
        Width = 47
        Height = 13
        Alignment = taRightJustify
        Caption = '  '#30005#35805':'
      end
      object Label17: TLabel
        Left = 46
        Top = 347
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#30005#23376#37038#20214':'
      end
      object Label38: TLabel
        Left = 264
        Top = 278
        Width = 7
        Height = 13
      end
      object Label39: TLabel
        Left = 264
        Top = 250
        Width = 7
        Height = 13
      end
      object Label49: TLabel
        Left = 202
        Top = 8
        Width = 73
        Height = 13
        Alignment = taRightJustify
        Caption = '  '#24314#26723#26085#26399':'
      end
      object DBEdit2: TDBEdit
        Left = 107
        Top = 29
        Width = 292
        Height = 21
        DataField = 'SUPPLIER_NAME'
        DataSource = DM.DataSource1
        MaxLength = 100
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 107
        Top = 53
        Width = 108
        Height = 21
        DataField = 'ABBR_NAME'
        DataSource = DM.DataSource1
        TabOrder = 2
      end
      object DBEdit7: TDBEdit
        Left = 109
        Top = 150
        Width = 121
        Height = 21
        DataField = 'STATE'
        DataSource = DM.DataSource1
        TabOrder = 4
      end
      object DBEdit8: TDBEdit
        Left = 110
        Top = 174
        Width = 121
        Height = 21
        DataField = 'PHONE'
        DataSource = DM.DataSource1
        TabOrder = 6
      end
      object DBEdit9: TDBEdit
        Left = 110
        Top = 199
        Width = 291
        Height = 21
        DataField = 'TELEX'
        DataSource = DM.DataSource1
        TabOrder = 8
      end
      object DBEdit10: TDBEdit
        Left = 302
        Top = 151
        Width = 98
        Height = 21
        DataField = 'ZIP'
        DataSource = DM.DataSource1
        TabOrder = 5
      end
      object DBEdit11: TDBEdit
        Left = 302
        Top = 175
        Width = 98
        Height = 21
        DataField = 'FAX'
        DataSource = DM.DataSource1
        TabOrder = 7
      end
      object DBEdit12: TDBEdit
        Left = 364
        Top = 57
        Width = 33
        Height = 21
        DataField = 'LANGUAGE_FLAG'
        DataSource = DM.DataSource1
        TabOrder = 10
      end
      object DBEdit13: TDBEdit
        Left = 110
        Top = 223
        Width = 188
        Height = 21
        DataField = 'GEN_EMAIL_ADDRESS'
        DataSource = DM.DataSource1
        TabOrder = 9
      end
      object Edit1: TEdit
        Left = 110
        Top = 247
        Width = 65
        Height = 21
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 11
        OnClick = Edit1Click
        OnExit = Edit1Exit
      end
      object Edit2: TEdit
        Left = 110
        Top = 272
        Width = 65
        Height = 21
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 12
        OnClick = Edit2Click
        OnExit = Edit2Exit
      end
      object BitBtn4: TBitBtn
        Left = 178
        Top = 245
        Width = 25
        Height = 25
        Hint = #22269#23478#22320#21306#25628#32034
        ParentShowHint = False
        ShowHint = True
        TabOrder = 13
        TabStop = False
        OnClick = BitBtn4Click
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
      object BitBtn5: TBitBtn
        Left = 178
        Top = 272
        Width = 25
        Height = 25
        TabOrder = 14
        TabStop = False
        OnClick = BitBtn5Click
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
      object DBEdit14: TDBEdit
        Left = 136
        Top = 314
        Width = 153
        Height = 21
        DataField = 'CONTACT_NAME_1'
        DataSource = DM.DataSource1
        TabOrder = 15
      end
      object DBEdit15: TDBEdit
        Left = 345
        Top = 314
        Width = 100
        Height = 21
        DataField = 'CONT_PHONE_1'
        DataSource = DM.DataSource1
        TabOrder = 16
      end
      object DBEdit16: TDBEdit
        Left = 136
        Top = 343
        Width = 309
        Height = 21
        DataField = 'EMAIL_FOR_CONTACT1'
        DataSource = DM.DataSource1
        TabOrder = 17
      end
      object ScrollBar1: TScrollBar
        Left = 478
        Top = 304
        Width = 17
        Height = 70
        Kind = sbVertical
        Max = 6
        Min = 1
        PageSize = 0
        Position = 1
        TabOrder = 18
        OnChange = ScrollBar1Change
      end
      object MaskEdit1: TMaskEdit
        Left = 107
        Top = 5
        Width = 77
        Height = 21
        MaxLength = 10
        TabOrder = 0
      end
      object DBMemo1: TDBMemo
        Left = 108
        Top = 80
        Width = 291
        Height = 64
        DataField = 'BILLING_ADDRESS_1'
        DataSource = DM.DataSource1
        MaxLength = 100
        TabOrder = 3
        WantReturns = False
      end
      object DBRadioGroup2: TDBRadioGroup
        Left = 316
        Top = 216
        Width = 109
        Height = 85
        DataField = 'TTYPE'
        DataSource = DM.DataSource1
        Items.Strings = (
          #26448#26009#20379#24212#21830
          #22806#21457#21152#24037#21830
          #20004#20010#37117#26159)
        TabOrder = 19
        Values.Strings = (
          '0'
          '1'
          '2')
      end
      object DBEdit1: TDBEdit
        Left = 278
        Top = 4
        Width = 121
        Height = 21
        DataField = 'SUPPIER_ENT_DATE'
        DataSource = DM.DataSource1
        TabOrder = 20
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = #36130#21153#20449#24687
      object Bevel2: TBevel
        Left = 24
        Top = 13
        Width = 518
        Height = 166
        Shape = bsFrame
      end
      object Label18: TLabel
        Left = 37
        Top = 8
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = ' '#36130#21153#36164#35759
      end
      object Label19: TLabel
        Left = 94
        Top = 31
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#20184#27454#26465#20214':'
      end
      object Label20: TLabel
        Left = 94
        Top = 55
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#38468#21152#26465#27454':'
      end
      object Label21: TLabel
        Left = 114
        Top = 81
        Width = 60
        Height = 13
        Alignment = taRightJustify
        Caption = '  '#20928#20184#27454':'
      end
      object Label22: TLabel
        Left = 112
        Top = 108
        Width = 60
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20184#27454#26041#27861':'
      end
      object Label23: TLabel
        Left = 92
        Top = 134
        Width = 82
        Height = 13
        Alignment = taRightJustify
        Caption = '   A/P '#24080#30446':'
      end
      object Label24: TLabel
        Left = 240
        Top = 29
        Width = 7
        Height = 13
        Caption = '%'
      end
      object Label25: TLabel
        Left = 240
        Top = 55
        Width = 7
        Height = 13
        Caption = '%'
      end
      object Label26: TLabel
        Left = 227
        Top = 81
        Width = 47
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#22825#25968
      end
      object Label27: TLabel
        Left = 182
        Top = 153
        Width = 98
        Height = 13
        Caption = '              '
      end
      object DBEdit17: TDBEdit
        Left = 176
        Top = 26
        Width = 62
        Height = 21
        DataField = 'DISCOUNT'
        DataSource = DM.DataSource1
        MaxLength = 6
        TabOrder = 0
      end
      object DBEdit18: TDBEdit
        Left = 176
        Top = 51
        Width = 62
        Height = 21
        DataField = 'DISCOUNT2'
        DataSource = DM.DataSource1
        MaxLength = 6
        TabOrder = 2
      end
      object DBEdit19: TDBEdit
        Left = 176
        Top = 77
        Width = 62
        Height = 21
        DataField = 'PAYMENT_TERMS'
        DataSource = DM.DataSource1
        TabOrder = 4
      end
      object DBEdit20: TDBEdit
        Left = 176
        Top = 103
        Width = 142
        Height = 21
        DataField = 'TAX_ID_NUMBER'
        DataSource = DM.DataSource1
        TabOrder = 5
      end
      object DBEdit21: TDBEdit
        Left = 256
        Top = 25
        Width = 62
        Height = 21
        DataField = 'DISCOUNT_DAYS'
        DataSource = DM.DataSource1
        TabOrder = 1
      end
      object DBEdit22: TDBEdit
        Left = 256
        Top = 52
        Width = 62
        Height = 21
        DataField = 'DISCOUNT2_DAYS'
        DataSource = DM.DataSource1
        TabOrder = 3
      end
      object Edit3: TEdit
        Left = 176
        Top = 129
        Width = 249
        Height = 21
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnClick = Edit3Click
        OnExit = Edit3Exit
      end
      object BitBtn6: TBitBtn
        Left = 432
        Top = 126
        Width = 25
        Height = 25
        TabOrder = 7
        TabStop = False
        OnClick = BitBtn6Click
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
      object DBCheckBox2: TDBCheckBox
        Left = 449
        Top = 356
        Width = 112
        Height = 17
        Caption = #36880#19968#21015#21360#26816#26597
        DataField = 'PRNT_ONE_INV_PER_CHK'
        DataSource = DM.DataSource1
        TabOrder = 8
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
        Visible = False
      end
      object DBCheckBox3: TDBCheckBox
        Left = 353
        Top = 27
        Width = 113
        Height = 17
        Caption = #26242#32531#24212#20184#27454#39033#24080
        DataField = 'PUT_ALL_INV_HOLD'
        DataSource = DM.DataSource1
        Enabled = False
        TabOrder = 9
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = #20986#21475#22320#22336
      object Bevel3: TBevel
        Left = 15
        Top = 16
        Width = 538
        Height = 137
        Shape = bsFrame
      end
      object Label28: TLabel
        Left = 42
        Top = 10
        Width = 106
        Height = 13
        Alignment = taRightJustify
        Caption = '    '#36755#20986#34920#26684#20301#32622
      end
      object Label29: TLabel
        Left = 53
        Top = 44
        Width = 93
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#20379#24212#21830#22995#21517':'
      end
      object Label30: TLabel
        Left = 101
        Top = 69
        Width = 47
        Height = 13
        Alignment = taRightJustify
        Caption = '  '#22320#22336':'
      end
      object DBEdit23: TDBEdit
        Left = 160
        Top = 40
        Width = 303
        Height = 21
        DataField = 'NAME_FOR_FORM'
        DataSource = DM.DataSource1
        TabOrder = 0
      end
      object DBEdit24: TDBEdit
        Left = 160
        Top = 64
        Width = 303
        Height = 21
        DataField = 'ADDRESS1_FOR_FORM'
        DataSource = DM.DataSource1
        TabOrder = 1
      end
      object DBEdit25: TDBEdit
        Left = 160
        Top = 88
        Width = 303
        Height = 21
        DataField = 'ADDRESS2_FOR_FORM'
        DataSource = DM.DataSource1
        TabOrder = 2
      end
      object DBEdit26: TDBEdit
        Left = 160
        Top = 112
        Width = 303
        Height = 21
        DataField = 'ADDRESS3_FOR_FORM'
        DataSource = DM.DataSource1
        TabOrder = 3
      end
      object BitBtn10: TBitBtn
        Left = 470
        Top = 38
        Width = 25
        Height = 25
        Hint = #20174#19968#33324#36164#35759#20013#22797#21046
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        TabStop = False
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000120B0000120B00001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
          DADAADADADA0000000ADDADADAD0FFFFF0DAADADADA0FCCCF0ADDADADAD0FFFF
          F0DAAD000000FCCCF0ADDA088880FFFFF0DA0008CCC0FCCCF0AD06088880FFFF
          F0DA0608CCC0000000AD060888880ADADADA0608CCC80DADAD4D060888880ADA
          D444060000000DADAD4D0666660ADA4ADA4A0000000DADA444AD}
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'EDI'#36164#35759
      object Bevel4: TBevel
        Left = 13
        Top = 18
        Width = 540
        Height = 71
        Shape = bsFrame
      end
      object Label31: TLabel
        Left = 40
        Top = 13
        Width = 54
        Height = 13
        Caption = 'EDI '#20449#24687
      end
      object Label32: TLabel
        Left = 11
        Top = 45
        Width = 75
        Height = 13
        Alignment = taRightJustify
        Caption = '   EDI'#26631#35782':'
      end
      object Bevel5: TBevel
        Left = 13
        Top = 111
        Width = 541
        Height = 121
        Shape = bsFrame
      end
      object Label33: TLabel
        Left = 31
        Top = 106
        Width = 91
        Height = 13
        Caption = #32534#36753#22806#21457#36716#31227#25806
      end
      object DBEdit27: TDBEdit
        Left = 91
        Top = 41
        Width = 332
        Height = 21
        DataField = 'EDI_ID'
        DataSource = DM.DataSource1
        TabOrder = 0
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 25
        Top = 128
        Width = 516
        Height = 89
        Caption = #22312#26032#37319#36141#23450#21333#20013#20351#29992#26032#32534#36753#31243#24335
        DataField = 'EDI_OUT_NEW_PO'
        DataSource = DM.DataSource1
        Items.Strings = (
          #20572#29992
          #21482#29992#32534#36753#31243#24335)
        TabOrder = 1
        Values.Strings = (
          '0'
          '1')
        OnClick = DBRadioGroup1Click
      end
      object DBCheckBox1: TDBCheckBox
        Left = 151
        Top = 164
        Width = 134
        Height = 17
        Caption = 'PO'#25913#21464#20801#35768#32534#36753'EDI'
        DataField = 'EDI_OUT_CHG_PO'
        DataSource = DM.DataSource1
        TabOrder = 2
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = #39069#22806#36164#35759
      object Bevel6: TBevel
        Left = 8
        Top = 16
        Width = 545
        Height = 113
        Shape = bsFrame
      end
      object Label34: TLabel
        Left = 24
        Top = 12
        Width = 91
        Height = 13
        Caption = #29992#25143#23450#20041#30340#26639#20301
      end
      object Label35: TLabel
        Left = 104
        Top = 36
        Width = 70
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #31080#25454#31181#31867':'
      end
      object Label36: TLabel
        Left = 112
        Top = 63
        Width = 62
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20184#27454#22320#28857':'
      end
      object Label37: TLabel
        Left = 89
        Top = 90
        Width = 85
        Height = 13
        Alignment = taRightJustify
        Caption = #26495#26009#19987#29992#20195#30721':'
      end
      object DBEdit28: TDBEdit
        Left = 180
        Top = 33
        Width = 192
        Height = 21
        DataField = 'ANALYSIS_CODE1'
        DataSource = DM.DataSource1
        TabOrder = 0
      end
      object DBEdit29: TDBEdit
        Left = 180
        Top = 59
        Width = 192
        Height = 21
        DataField = 'ANALYSIS_CODE2'
        DataSource = DM.DataSource1
        TabOrder = 1
      end
      object DBEdit30: TDBEdit
        Left = 180
        Top = 85
        Width = 192
        Height = 21
        DataField = 'ANALYSIS_CODE3'
        DataSource = DM.DataSource1
        TabOrder = 2
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = #35013#36816#22320#22336
      object Bevel7: TBevel
        Left = 3
        Top = 112
        Width = 559
        Height = 27
        Shape = bsBottomLine
      end
      object Label40: TLabel
        Left = 91
        Top = 141
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = #22320#22336':'
      end
      object Label41: TLabel
        Left = 92
        Top = 208
        Width = 40
        Height = 13
        Caption = #24030'/'#30465':'
      end
      object Label42: TLabel
        Left = 318
        Top = 208
        Width = 54
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#37038#32534':'
      end
      object Label43: TLabel
        Left = 57
        Top = 235
        Width = 67
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#32852#32476#20154':'
      end
      object Label44: TLabel
        Left = 44
        Top = 258
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#30005#35805#21495#30721':'
      end
      object Label45: TLabel
        Left = 262
        Top = 257
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#20256#30495#21495#30721':'
      end
      object Label46: TLabel
        Left = 39
        Top = 285
        Width = 85
        Height = 13
        Alignment = taRightJustify
        Caption = #32852#32476#30005#23376#37038#31665':'
      end
      object Label47: TLabel
        Left = 13
        Top = 309
        Width = 111
        Height = 13
        Alignment = taRightJustify
        Caption = #35013#36816#20132#36135#25552#21069#22825#25968':'
      end
      object Label48: TLabel
        Left = 262
        Top = 308
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#35821#35328#26631#35760':'
      end
      object DBGrid1: TDBGrid
        Left = 5
        Top = 2
        Width = 487
        Height = 131
        DataSource = DM.DataSource2
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = PopupMenu2
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnDblClick = DBGrid1DblClick
        OnKeyDown = DBGrid1KeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'FACTORY_LOCATION'
            Title.Caption = #35013#36816#22320#28857
            Width = 371
            Visible = True
          end>
      end
      object DBEdit34: TDBEdit
        Left = 130
        Top = 203
        Width = 86
        Height = 21
        Color = cl3DLight
        DataField = 'STATE'
        DataSource = DM.DataSource2
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit35: TDBEdit
        Left = 377
        Top = 203
        Width = 99
        Height = 21
        Color = cl3DLight
        DataField = 'ZIP'
        DataSource = DM.DataSource2
        ReadOnly = True
        TabOrder = 2
      end
      object DBEdit36: TDBEdit
        Left = 131
        Top = 228
        Width = 344
        Height = 21
        Color = cl3DLight
        DataField = 'CONTACT'
        DataSource = DM.DataSource2
        ReadOnly = True
        TabOrder = 3
      end
      object DBEdit37: TDBEdit
        Left = 131
        Top = 253
        Width = 121
        Height = 21
        Color = cl3DLight
        DataField = 'PHONE'
        DataSource = DM.DataSource2
        ReadOnly = True
        TabOrder = 4
      end
      object DBEdit38: TDBEdit
        Left = 352
        Top = 252
        Width = 122
        Height = 21
        Color = cl3DLight
        DataField = 'FAX'
        DataSource = DM.DataSource2
        ReadOnly = True
        TabOrder = 5
      end
      object DBEdit39: TDBEdit
        Left = 131
        Top = 278
        Width = 344
        Height = 21
        Color = cl3DLight
        DataField = 'EMAIL_FOR_CONTACT'
        DataSource = DM.DataSource2
        ReadOnly = True
        TabOrder = 6
      end
      object DBEdit40: TDBEdit
        Left = 131
        Top = 303
        Width = 121
        Height = 21
        Color = cl3DLight
        DataField = 'SHIPPING_LEAD_TIME'
        DataSource = DM.DataSource2
        ReadOnly = True
        TabOrder = 7
      end
      object DBEdit41: TDBEdit
        Left = 352
        Top = 303
        Width = 49
        Height = 21
        Color = cl3DLight
        DataField = 'LANGUAGE_FLAG'
        DataSource = DM.DataSource2
        ReadOnly = True
        TabOrder = 8
      end
      object DBMemo2: TDBMemo
        Left = 128
        Top = 141
        Width = 348
        Height = 53
        Color = cl3DLight
        DataField = 'FACTORY_ADDRESS_1'
        DataSource = DM.DataSource2
        ReadOnly = True
        TabOrder = 9
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 112
    Top = 8
    object N1: TMenuItem
      Caption = #37319#36141#23450#21333
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #20511#39033#22791#24536#24405
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #19968#33324#36164#35759
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #20132#36135
      OnClick = N4Click
    end
  end
  object PopupMenu2: TPopupMenu
    OnPopup = PopupMenu2Popup
    Left = 664
    Top = 8
    object N5: TMenuItem
      Caption = #28155#21152#35013#36816#22320#28857
      OnClick = N5Click
    end
    object N6: TMenuItem
      Caption = #32534#36753#35013#36816#22320#28857
      OnClick = N6Click
    end
    object N7: TMenuItem
      Caption = #21024#38500#35013#36816#22320#28857
      OnClick = N7Click
    end
  end
end
