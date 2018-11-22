object Form3: TForm3
  Left = 257
  Top = 148
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #20379#24212#21830#35013#36816#22320#22336
  ClientHeight = 453
  ClientWidth = 688
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
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 0
    Width = 688
    Height = 41
    Cursor = crArrow
    Align = alTop
  end
  object Label1: TLabel
    Left = 245
    Top = 13
    Width = 67
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#20379#24212#21830':'
  end
  object DBText1: TDBText
    Left = 320
    Top = 13
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'SUPPLIER_NAME'
    DataSource = DM.DataSource1
  end
  object BitBtn1: TBitBtn
    Left = 18
    Top = 8
    Width = 25
    Height = 25
    Cursor = crHandPoint
    Hint = #20445#23384
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
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
    Left = 43
    Top = 8
    Width = 25
    Height = 25
    Cursor = crHandPoint
    Hint = #21462#28040
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
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
    Width = 688
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
        Width = 487
      end>
  end
  object TreeView1: TTreeView
    Left = 0
    Top = 58
    Width = 200
    Height = 395
    Align = alLeft
    HideSelection = False
    Indent = 19
    ReadOnly = True
    TabOrder = 3
    OnChange = TreeView1Change
    Items.Data = {
      01000000210000000000000000000000FFFFFFFFFFFFFFFF0000000002000000
      08D7B0D4CBB5D8B5E3210000000000000001000000FFFFFFFFFFFFFFFF000000
      000000000008D2BBB0E3D0C5CFA21F0000000000000002000000FFFFFFFFFFFF
      FFFF000000000000000006CBB0B1EABCC7}
  end
  object Notebook1: TNotebook
    Left = 200
    Top = 58
    Width = 488
    Height = 395
    Align = alClient
    PageIndex = 1
    TabOrder = 4
    object TPage
      Left = 0
      Top = 0
      Caption = 'Default'
    end
    object TPage
      Left = 0
      Top = 0
      Caption = #19968#33324#20449#24687
      object Bevel1: TBevel
        Left = 3
        Top = 40
        Width = 481
        Height = 10
        Shape = bsTopLine
      end
      object Label2: TLabel
        Left = 32
        Top = 16
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#35013#36816#22320#28857':'
      end
      object Label3: TLabel
        Left = 58
        Top = 52
        Width = 54
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#22320#22336':'
      end
      object Label4: TLabel
        Left = 53
        Top = 128
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#24030'/'#30465':'
      end
      object Label5: TLabel
        Left = 21
        Top = 153
        Width = 93
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#22269#23478#25110#22320#21306':'
      end
      object Label6: TLabel
        Left = 47
        Top = 178
        Width = 67
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#32852#32476#20154':'
      end
      object Label7: TLabel
        Left = 34
        Top = 203
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#30005#35805#21495#30721':'
      end
      object Label8: TLabel
        Left = 1
        Top = 228
        Width = 113
        Height = 13
        Alignment = taRightJustify
        Caption = '    '#32852#32476#30005#23376#20449#31665':'
      end
      object Label9: TLabel
        Left = -6
        Top = 253
        Width = 120
        Height = 13
        Alignment = taRightJustify
        Caption = '     '#35013#36816#20132#36135#25552#21069':'
      end
      object Label10: TLabel
        Left = 34
        Top = 278
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#35013#36816#26041#27861':'
      end
      object Label11: TLabel
        Left = 34
        Top = 303
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#31163#23736#20215#26684':'
      end
      object Label12: TLabel
        Left = 256
        Top = 126
        Width = 54
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#37038#32534':'
      end
      object Label13: TLabel
        Left = 206
        Top = 202
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#20256#30495#21495#30721':'
      end
      object Label14: TLabel
        Left = 228
        Top = 250
        Width = 54
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#35821#35328':'
      end
      object Label15: TLabel
        Left = 233
        Top = 153
        Width = 7
        Height = 13
      end
      object Label33: TLabel
        Left = 168
        Top = 252
        Width = 47
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#22825#25968
      end
      object DBEdit1: TDBEdit
        Left = 120
        Top = 12
        Width = 211
        Height = 21
        DataField = 'FACTORY_LOCATION'
        DataSource = DM.DataSource2
        TabOrder = 0
      end
      object DBEdit5: TDBEdit
        Left = 121
        Top = 123
        Width = 105
        Height = 21
        DataField = 'STATE'
        DataSource = DM.DataSource2
        TabOrder = 1
      end
      object DBEdit6: TDBEdit
        Left = 314
        Top = 122
        Width = 74
        Height = 21
        DataField = 'ZIP'
        DataSource = DM.DataSource2
        TabOrder = 2
      end
      object Edit1: TEdit
        Left = 121
        Top = 148
        Width = 73
        Height = 21
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = Edit1Click
        OnExit = Edit1Exit
      end
      object BitBtn3: TBitBtn
        Left = 199
        Top = 146
        Width = 25
        Height = 25
        TabOrder = 4
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
      object DBEdit7: TDBEdit
        Left = 121
        Top = 173
        Width = 267
        Height = 21
        DataField = 'CONTACT'
        DataSource = DM.DataSource2
        TabOrder = 5
      end
      object DBEdit8: TDBEdit
        Left = 121
        Top = 198
        Width = 93
        Height = 21
        DataField = 'PHONE'
        DataSource = DM.DataSource2
        TabOrder = 6
      end
      object DBEdit9: TDBEdit
        Left = 294
        Top = 198
        Width = 93
        Height = 21
        DataField = 'FAX'
        DataSource = DM.DataSource2
        TabOrder = 7
      end
      object DBEdit10: TDBEdit
        Left = 121
        Top = 223
        Width = 265
        Height = 21
        DataField = 'EMAIL_FOR_CONTACT'
        DataSource = DM.DataSource2
        TabOrder = 8
      end
      object DBEdit11: TDBEdit
        Left = 121
        Top = 248
        Width = 51
        Height = 21
        DataField = 'SHIPPING_LEAD_TIME'
        DataSource = DM.DataSource2
        TabOrder = 9
      end
      object DBEdit12: TDBEdit
        Left = 292
        Top = 247
        Width = 94
        Height = 21
        DataField = 'LANGUAGE_FLAG'
        DataSource = DM.DataSource2
        TabOrder = 10
      end
      object DBEdit13: TDBEdit
        Left = 121
        Top = 273
        Width = 171
        Height = 21
        DataField = 'SHIPPING_METHOD'
        DataSource = DM.DataSource2
        TabOrder = 11
      end
      object DBEdit14: TDBEdit
        Left = 121
        Top = 299
        Width = 171
        Height = 21
        DataField = 'FOB'
        DataSource = DM.DataSource2
        TabOrder = 12
      end
      object BitBtn4: TBitBtn
        Left = 296
        Top = 271
        Width = 25
        Height = 25
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
      object DBMemo1: TDBMemo
        Left = 120
        Top = 48
        Width = 266
        Height = 68
        DataField = 'FACTORY_ADDRESS_1'
        DataSource = DM.DataSource2
        MaxLength = 100
        TabOrder = 14
        WantReturns = False
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = #31246#26631#35760
      object Bevel2: TBevel
        Left = 3
        Top = 37
        Width = 481
        Height = 12
        Shape = bsTopLine
      end
      object Label16: TLabel
        Left = 56
        Top = 12
        Width = 86
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#35013#36816#22320#28857#65306
      end
      object Label17: TLabel
        Left = 29
        Top = 47
        Width = 113
        Height = 13
        Alignment = taRightJustify
        Caption = '     '#22686#20540#31246#20195#30721#65306
      end
      object Label18: TLabel
        Left = 282
        Top = 46
        Width = 7
        Height = 13
      end
      object Bevel3: TBevel
        Left = 8
        Top = 107
        Width = 473
        Height = 133
        Shape = bsFrame
      end
      object Label19: TLabel
        Left = 11
        Top = 161
        Width = 93
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#22686#20540#31246#20195#30721':'
      end
      object Label20: TLabel
        Left = 130
        Top = 130
        Width = 47
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#31867#21035
      end
      object Label21: TLabel
        Left = 183
        Top = 130
        Width = 47
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#35013#36816
      end
      object Label22: TLabel
        Left = 247
        Top = 130
        Width = 47
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#26448#26009
      end
      object Label23: TLabel
        Left = 314
        Top = 130
        Width = 47
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#26434#39033
      end
      object Label24: TLabel
        Left = 375
        Top = 130
        Width = 47
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#31246#29575
      end
      object DBEdit15: TDBEdit
        Left = 144
        Top = 8
        Width = 175
        Height = 21
        DataField = 'FACTORY_LOCATION'
        DataSource = DM.DataSource2
        TabOrder = 0
      end
      object Edit2: TEdit
        Left = 144
        Top = 43
        Width = 101
        Height = 21
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = Edit2Click
        OnExit = Edit2Exit
      end
      object BitBtn5: TBitBtn
        Left = 250
        Top = 41
        Width = 25
        Height = 25
        TabOrder = 2
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
      object DBCheckBox1: TDBCheckBox
        Left = 144
        Top = 80
        Width = 81
        Height = 17
        Caption = #31246#19978#24449#31246
        Color = cl3DLight
        Ctl3D = True
        DataField = 'TAX_ON_TAX'
        DataSource = DM.DataSource2
        ParentColor = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 3
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
        Visible = False
      end
      object Edit3: TEdit
        Left = 110
        Top = 158
        Width = 78
        Height = 21
        Color = cl3DLight
        ReadOnly = True
        TabOrder = 4
      end
      object DBCheckBox2: TDBCheckBox
        Left = 210
        Top = 160
        Width = 14
        Height = 17
        DataField = 'STATE_SHIP_TAX_FLAG'
        DataSource = DM.DataSource2
        TabOrder = 5
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
      end
      object DBCheckBox3: TDBCheckBox
        Left = 275
        Top = 160
        Width = 14
        Height = 17
        DataField = 'STATE_INVT_TAX_FLAG'
        DataSource = DM.DataSource2
        TabOrder = 6
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
      end
      object DBCheckBox4: TDBCheckBox
        Left = 342
        Top = 160
        Width = 14
        Height = 17
        DataField = 'STATE_MISC_TAX_FLAG'
        DataSource = DM.DataSource2
        TabOrder = 7
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
      end
      object Edit4: TEdit
        Left = 392
        Top = 158
        Width = 55
        Height = 21
        Color = cl3DLight
        ReadOnly = True
        TabOrder = 8
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = #39069#22806#36164#35759
      object Bevel4: TBevel
        Left = 3
        Top = 40
        Width = 480
        Height = 7
        Shape = bsTopLine
      end
      object Label25: TLabel
        Left = 70
        Top = 16
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#35013#36816#22320#28857':'
      end
      object Bevel5: TBevel
        Left = 8
        Top = 57
        Width = 473
        Height = 128
        Shape = bsFrame
      end
      object Label26: TLabel
        Left = 22
        Top = 51
        Width = 113
        Height = 13
        Caption = #36755#20986#34920#26684#20301#32622'     '
      end
      object Bevel6: TBevel
        Left = 8
        Top = 202
        Width = 473
        Height = 103
        Shape = bsFrame
      end
      object Label27: TLabel
        Left = 32
        Top = 197
        Width = 93
        Height = 13
        Caption = #29992#25143#33258#23450#20041'    '
      end
      object Label28: TLabel
        Left = 38
        Top = 72
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#22320#28857#21517#31216':'
      end
      object Label29: TLabel
        Left = 38
        Top = 96
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#22320#28857#22320#22336':'
      end
      object Label30: TLabel
        Left = 31
        Top = 223
        Width = 87
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#35013#36816#20998#26512'1:'
      end
      object Label31: TLabel
        Left = 31
        Top = 247
        Width = 87
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#35013#36816#20998#26512'2:'
      end
      object Label32: TLabel
        Left = 31
        Top = 271
        Width = 87
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#35013#36816#20998#26512'3:'
      end
      object DBEdit16: TDBEdit
        Left = 154
        Top = 12
        Width = 172
        Height = 21
        DataField = 'FACTORY_LOCATION'
        DataSource = DM.DataSource2
        TabOrder = 0
      end
      object DBEdit17: TDBEdit
        Left = 128
        Top = 67
        Width = 276
        Height = 21
        DataField = 'LOC_NAME_FOR_FORM'
        DataSource = DM.DataSource2
        TabOrder = 1
      end
      object DBEdit18: TDBEdit
        Left = 128
        Top = 91
        Width = 276
        Height = 21
        DataField = 'LOC_ADDR1_FOR_FORM'
        DataSource = DM.DataSource2
        TabOrder = 2
      end
      object DBEdit19: TDBEdit
        Left = 128
        Top = 115
        Width = 276
        Height = 21
        DataField = 'LOC_ADDR2_FOR_FORM'
        DataSource = DM.DataSource2
        TabOrder = 3
      end
      object DBEdit20: TDBEdit
        Left = 128
        Top = 139
        Width = 276
        Height = 21
        DataField = 'LOC_ADDR3_FOR_FORM'
        DataSource = DM.DataSource2
        TabOrder = 4
      end
      object DBEdit21: TDBEdit
        Left = 128
        Top = 219
        Width = 157
        Height = 21
        DataField = 'LOC_ANALYSIS_CODE1'
        DataSource = DM.DataSource2
        TabOrder = 5
      end
      object DBEdit22: TDBEdit
        Left = 128
        Top = 243
        Width = 157
        Height = 21
        DataField = 'LOC_ANALYSIS_CODE2'
        DataSource = DM.DataSource2
        TabOrder = 6
      end
      object DBEdit23: TDBEdit
        Left = 128
        Top = 267
        Width = 157
        Height = 21
        DataField = 'LOC_ANALYSIS_CODE3'
        DataSource = DM.DataSource2
        TabOrder = 7
      end
      object BitBtn6: TBitBtn
        Left = 414
        Top = 64
        Width = 25
        Height = 25
        Hint = #20174#19968#33324#20449#24687#20013#22797#21046
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
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
  end
end
