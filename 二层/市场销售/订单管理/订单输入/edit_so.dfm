object Form8: TForm8
  Left = 422
  Top = 247
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #32534#36753#38144#21806#23450#21333
  ClientHeight = 441
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
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 688
    Height = 405
    ActivePage = TabSheet4
    Align = alTop
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #19968#33324#20449#24687
      object Label1: TLabel
        Left = 77
        Top = 7
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = #38144#21806#23450#21333':'
      end
      object Label11: TLabel
        Left = 103
        Top = 54
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = #23458#25143':'
      end
      object Label12: TLabel
        Left = 77
        Top = 107
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = #26412#21378#32534#21495':'
      end
      object Label14: TLabel
        Left = 50
        Top = 174
        Width = 86
        Height = 13
        Alignment = taRightJustify
        Caption = #23458#25143#35746#21333#21495'PO:'
      end
      object Label15: TLabel
        Left = 477
        Top = 205
        Width = 73
        Height = 13
        Alignment = taRightJustify
        Caption = 'PO'#25910#21040#26085#26399':'
      end
      object Label16: TLabel
        Left = 64
        Top = 225
        Width = 72
        Height = 13
        Alignment = taRightJustify
        Caption = #23458#25143#32852#32476#20154':'
      end
      object Label17: TLabel
        Left = 103
        Top = 251
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = #36135#24065':'
      end
      object Label18: TLabel
        Left = 103
        Top = 277
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = #27719#29575':'
      end
      object Label2: TLabel
        Left = 77
        Top = 302
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = #27454#21040#21457#36135':'
      end
      object Label29: TLabel
        Left = 64
        Top = 354
        Width = 72
        Height = 13
        Alignment = taRightJustify
        Caption = #29616#25345#26377#25968#37327':'
      end
      object Label30: TLabel
        Left = 267
        Top = 355
        Width = 85
        Height = 13
        Alignment = taRightJustify
        Caption = #24050#20998#37197#30340#25968#37327':'
      end
      object Label31: TLabel
        Left = 477
        Top = 355
        Width = 72
        Height = 13
        Alignment = taRightJustify
        Caption = #21487#29992#30340#25968#37327':'
      end
      object Label5: TLabel
        Left = 363
        Top = 355
        Width = 7
        Height = 13
        Caption = '0'
      end
      object Label6: TLabel
        Left = 556
        Top = 355
        Width = 7
        Height = 13
        Caption = '0'
      end
      object Label66: TLabel
        Left = 224
        Top = 55
        Width = 98
        Height = 13
        Caption = '              '
      end
      object Label67: TLabel
        Left = 147
        Top = 130
        Width = 49
        Height = 13
        Caption = 'Label67'
      end
      object Label70: TLabel
        Left = 231
        Top = 251
        Width = 63
        Height = 13
        Caption = '         '
      end
      object DBText1: TDBText
        Left = 144
        Top = 301
        Width = 49
        Height = 13
        AutoSize = True
        DataField = 'COD_FLAG'
        DataSource = dm.DataSource2
      end
      object Label71: TLabel
        Left = 356
        Top = 107
        Width = 49
        Height = 13
        Caption = 'Label71'
        Visible = False
      end
      object Label72: TLabel
        Left = 359
        Top = 166
        Width = 49
        Height = 13
        Hint = #21407'60'#20013#30340'key'
        Caption = 'Label72'
        Visible = False
      end
      object Label73: TLabel
        Left = 358
        Top = 181
        Width = 49
        Height = 13
        Hint = #20462#25913#21518#30340'rkey'
        Caption = 'Label73'
        Visible = False
      end
      object Label80: TLabel
        Left = 477
        Top = 282
        Width = 73
        Height = 13
        Alignment = taRightJustify
        Caption = 'SO'#36755#20837#26085#26399':'
      end
      object Label3: TLabel
        Left = 458
        Top = 117
        Width = 91
        Height = 13
        Alignment = taRightJustify
        Caption = #22806#21457#25351#23450#20379#24212#21830
      end
      object Label85: TLabel
        Left = 586
        Top = 140
        Width = 7
        Height = 13
        Alignment = taRightJustify
      end
      object Label86: TLabel
        Left = 490
        Top = 309
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = #36755#20837#20154#21592':'
      end
      object Label87: TLabel
        Left = 490
        Top = 332
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = #30830#35748#20154#21592':'
      end
      object Label91: TLabel
        Left = 493
        Top = 54
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = #35746#21333#26032#26087':'
      end
      object Label13: TLabel
        Left = 77
        Top = 31
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = #24037#21378#20195#30721':'
      end
      object Label52: TLabel
        Left = 256
        Top = 32
        Width = 28
        Height = 13
        Caption = '    '
      end
      object Label75: TLabel
        Left = 77
        Top = 328
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = #20184#27454#26041#24335':'
      end
      object Label92: TLabel
        Left = 145
        Top = 328
        Width = 77
        Height = 13
        Caption = '           '
      end
      object Label93: TLabel
        Left = 183
        Top = 301
        Width = 72
        Height = 13
        Caption = #21487#20986#36135#25968#37327':'
      end
      object Label101: TLabel
        Left = 504
        Top = 258
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = #19994#21153#21592':'
      end
      object lblywy: TLabel
        Left = 558
        Top = 258
        Width = 7
        Height = 13
      end
      object Label102: TLabel
        Left = 64
        Top = 81
        Width = 72
        Height = 13
        Caption = #20851#32852#21407#23458#25143':'
      end
      object Label103: TLabel
        Left = 78
        Top = 198
        Width = 65
        Height = 13
        Caption = #20135#21697#38454#25968#65306
      end
      object Label104: TLabel
        Left = 147
        Top = 151
        Width = 56
        Height = 13
        Caption = 'Label104'
      end
      object Label105: TLabel
        Left = 453
        Top = 232
        Width = 104
        Height = 13
        Caption = #20108#32500#30721#25171#21360#26684#24335#65306
      end
      object Label106: TLabel
        Left = 264
        Top = 8
        Width = 7
        Height = 13
      end
      object DBEdit11: TDBEdit
        Left = 143
        Top = 273
        Width = 91
        Height = 21
        DataField = 'EXCH_RATE'
        DataSource = dm.DataSource2
        TabOrder = 6
        OnKeyPress = DBEdit11KeyPress
      end
      object DBEdit21: TDBEdit
        Left = 143
        Top = 4
        Width = 100
        Height = 21
        DataField = 'SALES_ORDER'
        DataSource = dm.DataSource2
        TabOrder = 0
      end
      object Edit3: TEdit
        Left = 143
        Top = 51
        Width = 74
        Height = 21
        TabStop = False
        ReadOnly = True
        TabOrder = 10
      end
      object Edit4: TEdit
        Left = 143
        Top = 104
        Width = 170
        Height = 21
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        MaxLength = 20
        ParentFont = False
        TabOrder = 1
        OnChange = Edit4Change
        OnClick = Edit4Click
        OnExit = Edit4Exit
      end
      object BitBtn3: TBitBtn
        Left = 320
        Top = 102
        Width = 25
        Height = 25
        TabOrder = 7
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
      object Edit6: TEdit
        Left = 143
        Top = 170
        Width = 169
        Height = 21
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        MaxLength = 25
        ParentFont = False
        TabOrder = 2
        OnClick = Edit6Click
        OnExit = Edit6Exit
      end
      object BitBtn4: TBitBtn
        Left = 320
        Top = 168
        Width = 25
        Height = 25
        TabOrder = 8
        TabStop = False
        OnExit = BitBtn4Exit
        OnMouseDown = BitBtn4MouseDown
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
      object MaskEdit3A: TMaskEdit
        Left = 559
        Top = 201
        Width = 82
        Height = 21
        EditMask = '!0000-!00-00;1;_'
        MaxLength = 10
        TabOrder = 3
        Text = '    -  -  '
      end
      object ComboBox1: TComboBox
        Left = 143
        Top = 221
        Width = 225
        Height = 21
        ItemHeight = 13
        TabOrder = 4
      end
      object Edit7: TEdit
        Left = 143
        Top = 247
        Width = 73
        Height = 21
        TabStop = False
        Color = cl3DLight
        ReadOnly = True
        TabOrder = 9
      end
      object BitBtn7: TBitBtn
        Left = 328
        Top = 321
        Width = 75
        Height = 25
        Caption = #35780#23457#20449#24687
        TabOrder = 11
        OnClick = BitBtn7Click
      end
      object BitBtn8: TBitBtn
        Left = 298
        Top = 245
        Width = 25
        Height = 25
        Hint = #26356#25913#36135#24065
        ParentShowHint = False
        ShowHint = True
        TabOrder = 12
        OnClick = BitBtn8Click
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
      object Edit9: TEdit
        Left = 143
        Top = 350
        Width = 91
        Height = 21
        Color = cl3DLight
        ReadOnly = True
        TabOrder = 13
        OnExit = Edit9Exit
        OnKeyPress = Edit9KeyPress
      end
      object DBEdit24: TDBEdit
        Left = 555
        Top = 278
        Width = 110
        Height = 21
        DataField = 'ENT_DATE'
        DataSource = dm.DataSource2
        TabOrder = 5
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 491
        Top = 74
        Width = 183
        Height = 36
        Caption = #21152#24037#24418#24335
        Columns = 3
        DataField = 'so_tp'
        DataSource = dm.DataSource2
        Items.Strings = (
          #33258#21046
          #22806#21457
          #21322#21046#31243)
        TabOrder = 14
        Values.Strings = (
          '0'
          '1'
          '2')
        OnClick = DBRadioGroup1Click
      end
      object Edit11: TEdit
        Left = 558
        Top = 113
        Width = 83
        Height = 21
        Color = cl3DLight
        ReadOnly = True
        TabOrder = 15
      end
      object BitBtn10: TBitBtn
        Left = 646
        Top = 110
        Width = 25
        Height = 25
        Hint = #26356#25913#36135#24065
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 16
        OnClick = BitBtn10Click
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
      object Edit12: TEdit
        Left = 555
        Top = 304
        Width = 113
        Height = 21
        TabStop = False
        Color = cl3DLight
        ReadOnly = True
        TabOrder = 17
      end
      object Edit13: TEdit
        Left = 555
        Top = 327
        Width = 113
        Height = 21
        TabStop = False
        Color = cl3DLight
        ReadOnly = True
        TabOrder = 18
      end
      object DBRadioGroup2: TDBRadioGroup
        Left = 555
        Top = 11
        Width = 118
        Height = 35
        Caption = #35746#21333#31867#22411
        Columns = 2
        DataField = 'so_style'
        DataSource = dm.DataSource2
        Items.Strings = (
          #27491#24335
          #22791#21697)
        TabOrder = 19
        Values.Strings = (
          '0'
          '1')
      end
      object DBComboBox2: TDBComboBox
        Left = 555
        Top = 51
        Width = 78
        Height = 21
        Style = csDropDownList
        DataField = 'SO_OLDNEW'
        DataSource = dm.DataSource2
        ItemHeight = 13
        Items.Strings = (
          #26032#21333
          #36820#21333
          #26679#26495#36716#29983#20135
          #36820#21333#26377#25913)
        TabOrder = 20
      end
      object DBCheckBox1: TDBCheckBox
        Left = 559
        Top = 179
        Width = 89
        Height = 17
        Caption = #36716#21378'('#20986#21475')'
        DataField = 'COMMISION_ON_TOOLING'
        DataSource = dm.DataSource2
        Enabled = False
        TabOrder = 21
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
      end
      object Edit2: TEdit
        Left = 143
        Top = 28
        Width = 74
        Height = 21
        TabOrder = 22
        OnExit = Edit2Exit
      end
      object BitBtn11: TBitBtn
        Left = 224
        Top = 27
        Width = 25
        Height = 25
        TabOrder = 23
        TabStop = False
        OnClick = BitBtn11Click
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
      object Edit5: TEdit
        Left = 259
        Top = 297
        Width = 58
        Height = 21
        Color = cl3DLight
        ReadOnly = True
        TabOrder = 24
      end
      object BitBtn12: TBitBtn
        Left = 328
        Top = 294
        Width = 75
        Height = 25
        Caption = #39044#25910#26597#35810
        TabOrder = 25
        OnClick = BitBtn12Click
      end
      object Edit14: TEdit
        Left = 143
        Top = 196
        Width = 201
        Height = 21
        Color = clScrollBar
        Enabled = False
        TabOrder = 26
      end
      object Edit17: TEdit
        Left = 142
        Top = 77
        Width = 171
        Height = 21
        TabOrder = 27
        OnDblClick = Edit17DblClick
        OnExit = Edit17Exit
      end
      object BitBtn14: TBitBtn
        Left = 319
        Top = 74
        Width = 25
        Height = 25
        TabOrder = 28
        TabStop = False
        OnClick = BitBtn14Click
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
      object MaskEdit3: TEdit
        Left = 553
        Top = 201
        Width = 110
        Height = 21
        TabOrder = 29
      end
      object Edit18: TEdit
        Left = 554
        Top = 229
        Width = 89
        Height = 21
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 30
      end
      object BitBtn15: TBitBtn
        Left = 643
        Top = 226
        Width = 25
        Height = 25
        TabOrder = 31
        TabStop = False
        OnClick = BitBtn15Click
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
    end
    object TabSheet2: TTabSheet
      Caption = #35013#36816#20449#24687
      ImageIndex = 1
      object Label19: TLabel
        Left = 87
        Top = 15
        Width = 87
        Height = 13
        Alignment = taRightJustify
        Caption = '    '#35013#36816#22320#28857':'
      end
      object Label20: TLabel
        Left = 74
        Top = 43
        Width = 100
        Height = 13
        Alignment = taRightJustify
        Caption = '    '#35013#36816#32852#32476#20154':'
      end
      object Label21: TLabel
        Left = 94
        Top = 99
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#35013#36816#26041#27861':'
      end
      object Label22: TLabel
        Left = 41
        Top = 71
        Width = 133
        Height = 13
        Alignment = taRightJustify
        Caption = '     '#35013#36816#32852#32476#20154#30005#35805':'
      end
      object Label23: TLabel
        Left = 123
        Top = 129
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = ' '#21512#21516#21495':'
      end
      object DBEdit7: TDBEdit
        Left = 192
        Top = 42
        Width = 241
        Height = 21
        DataField = 'SHIPPING_CONTACT'
        DataSource = dm.DataSource2
        TabOrder = 1
      end
      object DBEdit8: TDBEdit
        Left = 192
        Top = 70
        Width = 153
        Height = 21
        DataField = 'SHIP_CONTACT_PHONE'
        DataSource = dm.DataSource2
        TabOrder = 2
      end
      object DBEdit9: TDBEdit
        Left = 192
        Top = 97
        Width = 209
        Height = 21
        DataField = 'SHIPPING_METHOD'
        DataSource = dm.DataSource2
        TabOrder = 3
      end
      object DBEdit10: TDBEdit
        Left = 192
        Top = 125
        Width = 209
        Height = 21
        DataField = 'FOB'
        DataSource = dm.DataSource2
        TabOrder = 4
        OnChange = DBEdit10Change
      end
      object BitBtn2: TBitBtn
        Left = 408
        Top = 95
        Width = 25
        Height = 25
        TabOrder = 5
        OnClick = BitBtn2Click
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
      object Edit8: TEdit
        Left = 192
        Top = 14
        Width = 209
        Height = 21
        TabOrder = 0
        OnClick = Edit8Click
        OnExit = Edit8Exit
      end
      object BitBtn6: TBitBtn
        Left = 408
        Top = 12
        Width = 25
        Height = 25
        TabOrder = 6
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
    end
    object TabSheet3: TTabSheet
      Caption = #21152#24037#25351#31034
      ImageIndex = 2
      object Label7: TLabel
        Left = 110
        Top = 23
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = #22686#20540#31246':'
      end
      object Label8: TLabel
        Left = 189
        Top = 1
        Width = 26
        Height = 13
        Alignment = taRightJustify
        Caption = #31867#21035
      end
      object Label10: TLabel
        Left = 243
        Top = 1
        Width = 26
        Height = 13
        Alignment = taRightJustify
        Caption = #20135#21697
      end
      object Label24: TLabel
        Left = 279
        Top = 1
        Width = 26
        Height = 13
        Alignment = taRightJustify
        Caption = #24037#20855
      end
      object Label25: TLabel
        Left = 330
        Top = 1
        Width = 26
        Height = 13
        Alignment = taRightJustify
        Caption = #31246#29575
      end
      object Label4: TLabel
        Left = 45
        Top = 45
        Width = 66
        Height = 13
        Alignment = taRightJustify
        Caption = ' '#24037#31243#22791#27880':'
      end
      object Label79: TLabel
        Left = 46
        Top = 148
        Width = 66
        Height = 13
        Alignment = taRightJustify
        Caption = ' '#21152#24037#25351#31034':'
      end
      object SpeedButton1: TSpeedButton
        Left = 570
        Top = 145
        Width = 48
        Height = 22
        Caption = #22797#21046
        Flat = True
        OnClick = SpeedButton1Click
      end
      object Label84: TLabel
        Left = 13
        Top = 252
        Width = 105
        Height = 13
        Alignment = taRightJustify
        Caption = ' '#38144#21806#35746#21333#35760#20107#26412':'
      end
      object Label32: TLabel
        Left = 370
        Top = 20
        Width = 8
        Height = 16
        Caption = '%'
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Edit1: TEdit
        Left = 161
        Top = 19
        Width = 74
        Height = 21
        Color = cl3DLight
        ReadOnly = True
        TabOrder = 0
      end
      object DBCheckBox2: TDBCheckBox
        Left = 248
        Top = 21
        Width = 17
        Height = 17
        DataField = 'STATE_PROD_TAX_FLAG'
        DataSource = dm.DataSource2
        TabOrder = 1
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
      end
      object DBCheckBox3: TDBCheckBox
        Left = 283
        Top = 21
        Width = 17
        Height = 17
        DataField = 'STATE_TOOL_TAX_FLAG'
        DataSource = dm.DataSource2
        TabOrder = 2
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
      end
      object Memo1: TMemo
        Left = 117
        Top = 143
        Width = 449
        Height = 99
        ImeMode = imChinese
        MaxLength = 800
        ScrollBars = ssVertical
        TabOrder = 3
      end
      object Memo2: TMemo
        Left = 117
        Top = 42
        Width = 449
        Height = 99
        ImeMode = imChinese
        MaxLength = 800
        ScrollBars = ssVertical
        TabOrder = 4
      end
      object Memo3: TMemo
        Left = 117
        Top = 245
        Width = 449
        Height = 99
        ImeMode = imChinese
        MaxLength = 800
        ScrollBars = ssVertical
        TabOrder = 5
      end
      object DBRadioGroup3: TDBRadioGroup
        Left = 391
        Top = 2
        Width = 175
        Height = 37
        Caption = #35746#21333#20215#26684#31867#21035#32422#23450
        Columns = 2
        DataField = 'TAX_IN_PRICE'
        DataSource = dm.DataSource2
        Enabled = False
        Items.Strings = (
          #19981#21547#31246#20215
          #21547#31246#20215)
        TabOrder = 6
        Values.Strings = (
          'N'
          'Y')
      end
      object DBEdit15: TDBEdit
        Left = 312
        Top = 18
        Width = 51
        Height = 21
        Color = cl3DLight
        DataField = 'RUSH_CHARGE'
        DataSource = dm.DataSource2
        ReadOnly = True
        TabOrder = 7
      end
    end
    object TabSheet4: TTabSheet
      Caption = #35746#21333#20449#24687
      ImageIndex = 3
      object Bevel1: TBevel
        Left = 428
        Top = 27
        Width = 239
        Height = 45
        Shape = bsFrame
      end
      object Label26: TLabel
        Left = 63
        Top = 54
        Width = 75
        Height = 13
        Alignment = taRightJustify
        Caption = ' '#25968#37327'(Set):'
        Visible = False
      end
      object Label27: TLabel
        Left = 66
        Top = 54
        Width = 75
        Height = 13
        Alignment = taRightJustify
        Caption = ' '#25968#37327'(Pcs):'
      end
      object Label28: TLabel
        Left = 63
        Top = 115
        Width = 75
        Height = 13
        Alignment = taRightJustify
        Caption = ' '#20215#26684'(Pcs):'
      end
      object Label33: TLabel
        Left = 91
        Top = 144
        Width = 47
        Height = 13
        Alignment = taRightJustify
        Caption = '  '#25240#25187':'
      end
      object Label34: TLabel
        Left = 65
        Top = 172
        Width = 73
        Height = 13
        Alignment = taRightJustify
        Caption = '  '#20248#20808#39034#24207':'
      end
      object Label35: TLabel
        Left = 72
        Top = 220
        Width = 66
        Height = 13
        Alignment = taRightJustify
        Caption = ' '#23458#25143#20132#26399':'
      end
      object Label36: TLabel
        Left = 72
        Top = 249
        Width = 66
        Height = 13
        Alignment = taRightJustify
        Caption = ' '#35745#21010#20132#26399':'
      end
      object Label37: TLabel
        Left = 84
        Top = 276
        Width = 54
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#21442#32771':'
      end
      object Bevel2: TBevel
        Left = 428
        Top = 76
        Width = 239
        Height = 135
        Shape = bsFrame
      end
      object Label38: TLabel
        Left = 445
        Top = 72
        Width = 26
        Height = 13
        Alignment = taRightJustify
        Caption = #21512#35745
      end
      object Label39: TLabel
        Left = 476
        Top = 87
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#20215#26684#24635#35745':'
      end
      object Label41: TLabel
        Left = 502
        Top = 121
        Width = 54
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#25240#25187':'
      end
      object Label42: TLabel
        Left = 476
        Top = 141
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#29983#20135#24037#20855':'
      end
      object Label43: TLabel
        Left = 496
        Top = 174
        Width = 60
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#21512#35745':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label44: TLabel
        Left = 597
        Top = 174
        Width = 48
        Height = 13
        Alignment = taRightJustify
        Caption = '0.0000'
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label45: TLabel
        Left = 603
        Top = 139
        Width = 42
        Height = 13
        Alignment = taRightJustify
        Caption = '0.0000'
      end
      object Label46: TLabel
        Left = 610
        Top = 120
        Width = 35
        Height = 13
        Alignment = taRightJustify
        Caption = '0.000'
      end
      object Label48: TLabel
        Left = 603
        Top = 87
        Width = 42
        Height = 13
        Alignment = taRightJustify
        Caption = '0.0000'
      end
      object Label50: TLabel
        Left = 354
        Top = 330
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#21521#21518#22825#25968':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clMedGray
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object Label51: TLabel
        Left = 496
        Top = 330
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#21521#21069#22825#25968':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clMedGray
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object Label69: TLabel
        Left = 200
        Top = 143
        Width = 7
        Height = 13
        Caption = '%'
      end
      object Label76: TLabel
        Left = 497
        Top = 48
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = #25968#37327#21512#35745':'
      end
      object Label77: TLabel
        Left = 632
        Top = 47
        Width = 7
        Height = 13
        Alignment = taRightJustify
        Caption = '0'
      end
      object Label78: TLabel
        Left = 456
        Top = 21
        Width = 169
        Height = 13
        Alignment = taRightJustify
        Caption = #26412#20135#21697#22411#21495#37319#36141#35746#21333#25968#37327#21512#35745
      end
      object Label81: TLabel
        Left = 63
        Top = 84
        Width = 75
        Height = 13
        Alignment = taRightJustify
        Caption = ' '#20215#26684'(Set):'
        Visible = False
      end
      object Label82: TLabel
        Left = 59
        Top = 328
        Width = 79
        Height = 13
        Alignment = taRightJustify
        Caption = ' '#20986#36135#26495#26041#24335':'
      end
      object Label83: TLabel
        Left = 143
        Top = 328
        Width = 49
        Height = 13
        Caption = '       '
      end
      object Label9: TLabel
        Left = 224
        Top = 249
        Width = 73
        Height = 13
        Caption = '  '#22238#22797#20132#26399':'
      end
      object SpeedButton2: TSpeedButton
        Left = 333
        Top = 139
        Width = 57
        Height = 22
        Caption = #21462#28040
        Flat = True
        OnClick = SpeedButton2Click
      end
      object Label_qteptr: TLabel
        Left = 336
        Top = 112
        Width = 7
        Height = 13
        Caption = '0'
        Visible = False
      end
      object Label89: TLabel
        Left = 508
        Top = 193
        Width = 47
        Height = 13
        Alignment = taRightJustify
        Caption = '  '#38754#31215':'
      end
      object Label90: TLabel
        Left = 603
        Top = 193
        Width = 42
        Height = 13
        Alignment = taRightJustify
        Caption = '0.0000'
      end
      object Label40: TLabel
        Left = 523
        Top = 104
        Width = 33
        Height = 13
        Caption = #31246#37329':'
      end
      object Label47: TLabel
        Left = 610
        Top = 104
        Width = 35
        Height = 13
        Alignment = taRightJustify
        Caption = '0.000'
      end
      object Label68: TLabel
        Left = 497
        Top = 158
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = #24037#20855#31246#37329':'
      end
      object Label74: TLabel
        Left = 603
        Top = 156
        Width = 42
        Height = 13
        Alignment = taRightJustify
        Caption = '0.0000'
      end
      object Label94: TLabel
        Left = 52
        Top = 196
        Width = 85
        Height = 13
        Alignment = taRightJustify
        Caption = #21407#22987#23458#25143#20132#26399':'
      end
      object Label49: TLabel
        Left = 247
        Top = 60
        Width = 7
        Height = 13
      end
      object GroupBox3: TGroupBox
        Left = 428
        Top = 213
        Width = 239
        Height = 98
        Hint = '* '#26410#32467#31639#24635#39069#26410#21253#21547#26412#38144#21806#35746#21333
        Caption = ' '#23458#25143#20449#29992#39069#24230#20449#24687
        ParentShowHint = False
        ShowHint = True
        TabOrder = 17
        object Label95: TLabel
          Left = 28
          Top = 23
          Width = 59
          Height = 13
          Alignment = taRightJustify
          Caption = #20449#29992#31561#32423':'
        end
        object Label96: TLabel
          Left = 28
          Top = 47
          Width = 59
          Height = 13
          Alignment = taRightJustify
          Caption = #20449#29992#38480#39069':'
        end
        object Label97: TLabel
          Left = 15
          Top = 71
          Width = 72
          Height = 13
          Alignment = taRightJustify
          Caption = #26410#32467#31639#24635#39069':'
        end
        object Label98: TLabel
          Left = 202
          Top = 23
          Width = 13
          Height = 13
          Alignment = taRightJustify
          Caption = #26080
        end
        object Label99: TLabel
          Left = 173
          Top = 47
          Width = 42
          Height = 13
          Alignment = taRightJustify
          Caption = '0.0000'
        end
        object Label100: TLabel
          Left = 173
          Top = 71
          Width = 42
          Height = 13
          Alignment = taRightJustify
          Caption = '0.0000'
        end
      end
      object DBEdit12: TDBEdit
        Left = 144
        Top = 50
        Width = 80
        Height = 21
        DataField = 'SET_ORDERED'
        DataSource = dm.DataSource2
        TabOrder = 0
        Visible = False
        OnExit = DBEdit12Exit
        OnKeyPress = DBEdit13KeyPress
      end
      object DBEdit13: TDBEdit
        Left = 144
        Top = 50
        Width = 80
        Height = 21
        DataField = 'PARTS_ORDERED'
        DataSource = dm.DataSource2
        TabOrder = 1
        OnExit = DBEdit13Exit
        OnKeyPress = DBEdit13KeyPress
      end
      object DBEdit14: TDBEdit
        Left = 144
        Top = 111
        Width = 98
        Height = 21
        DataField = 'PART_PRICE'
        DataSource = dm.DataSource2
        TabOrder = 3
        OnExit = DBEdit13Exit
        OnKeyPress = DBEdit14KeyPress
      end
      object DBEdit16: TDBEdit
        Left = 144
        Top = 140
        Width = 51
        Height = 21
        DataField = 'DISCOUNT'
        DataSource = dm.DataSource2
        TabOrder = 4
        OnExit = DBEdit16Exit
        OnKeyPress = DBEdit16KeyPress
      end
      object DBEdit18: TDBEdit
        Left = 144
        Top = 271
        Width = 249
        Height = 21
        DataField = 'REFERENCE_NUMBER'
        DataSource = dm.DataSource2
        TabOrder = 8
      end
      object DBCheckBox4: TDBCheckBox
        Left = 282
        Top = 330
        Width = 73
        Height = 17
        Caption = #39044#27979#32791#36153
        DataField = 'CONSUME_FORECASTS'
        DataSource = dm.DataSource2
        TabOrder = 9
        ValueChecked = '1'
        ValueUnchecked = '0'
        Visible = False
        OnClick = DBCheckBox4Click
      end
      object DBEdit19: TDBEdit
        Left = 450
        Top = 330
        Width = 56
        Height = 21
        DataField = 'BACKWARD_DAYS'
        DataSource = dm.DataSource2
        Enabled = False
        TabOrder = 10
        Visible = False
      end
      object DBEdit20: TDBEdit
        Left = 590
        Top = 330
        Width = 56
        Height = 21
        DataField = 'FORWARD_DAYS'
        DataSource = dm.DataSource2
        Enabled = False
        TabOrder = 11
        Visible = False
      end
      object MaskEdit1: TMaskEdit
        Left = 144
        Top = 216
        Width = 84
        Height = 21
        EditMask = '!0000-!90-90;1;_'
        MaxLength = 10
        TabOrder = 6
        Text = '    -  -  '
        OnExit = MaskEdit1Exit
      end
      object MaskEdit2: TMaskEdit
        Left = 144
        Top = 245
        Width = 84
        Height = 21
        EditMask = '!0000-!90-90;1;_'
        MaxLength = 10
        TabOrder = 7
        Text = '    -  -  '
        OnExit = MaskEdit2Exit
      end
      object BitBtn5: TBitBtn
        Left = 246
        Top = 81
        Width = 80
        Height = 25
        Caption = #21382#21490#20215#26684
        TabOrder = 12
        TabStop = False
        OnClick = BitBtn5Click
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
      object DBEdit25: TDBEdit
        Left = 144
        Top = 80
        Width = 98
        Height = 21
        DataField = 'SET_PRICE'
        DataSource = dm.DataSource2
        TabOrder = 2
        Visible = False
        OnExit = DBEdit25Exit
        OnKeyPress = DBEdit25KeyPress
      end
      object DBEdit23: TDBEdit
        Left = 299
        Top = 245
        Width = 94
        Height = 21
        TabStop = False
        Color = cl3DLight
        DataField = 'SCH_DATE'
        DataSource = dm.DataSource2
        ReadOnly = True
        TabOrder = 13
      end
      object BitBtn9: TBitBtn
        Left = 246
        Top = 108
        Width = 80
        Height = 25
        Caption = #25253#20215#21333#21495
        TabOrder = 14
        OnClick = BitBtn9Click
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
      object Edit10: TEdit
        Left = 247
        Top = 139
        Width = 78
        Height = 21
        Color = cl3DLight
        ReadOnly = True
        TabOrder = 15
      end
      object MaskEdit4: TMaskEdit
        Left = 144
        Top = 192
        Width = 84
        Height = 21
        EditMask = '!0000-!90-90;1;_'
        MaxLength = 10
        TabOrder = 5
        Text = '    -  -  '
        OnExit = MaskEdit4Exit
      end
      object btnFindContract: TBitBtn
        Left = 328
        Top = 108
        Width = 80
        Height = 25
        Hint = #21382#21490#20215#26684#20449#24687
        Caption = 'RFQ'#21512#21516
        ParentShowHint = False
        ShowHint = True
        TabOrder = 16
        TabStop = False
        OnClick = btnFindContractClick
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
      object BitBtn13: TBitBtn
        Left = 328
        Top = 81
        Width = 78
        Height = 25
        Caption = #39044#22788#29702
        ParentShowHint = False
        ShowHint = True
        TabOrder = 18
        TabStop = False
        OnClick = BitBtn13Click
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
      object ComboBox3: TComboBox
        Left = 144
        Top = 166
        Width = 97
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 19
      end
    end
    object TabSheet5: TTabSheet
      Caption = #29983#20135#24037#20855#36153#29992
      ImageIndex = 4
      OnExit = TabSheet5Exit
      object StringGrid1: TStringGrid
        Left = 0
        Top = 0
        Width = 680
        Height = 297
        Align = alTop
        ColCount = 6
        Ctl3D = False
        DefaultRowHeight = 20
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
        ParentCtl3D = False
        TabOrder = 0
        OnDrawCell = StringGrid1DrawCell
        OnExit = StringGrid1Exit
        OnKeyPress = StringGrid1KeyPress
        OnSelectCell = StringGrid1SelectCell
        ColWidths = (
          306
          104
          93
          89
          64
          64)
        RowHeights = (
          20
          20)
      end
      object ComboBox2: TComboBox
        Left = 608
        Top = 23
        Width = 67
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 1
        Text = 'Y'
        OnChange = ComboBox2Change
        OnKeyDown = ComboBox2KeyDown
        Items.Strings = (
          'Y'
          'N')
      end
    end
    object TabSheet6: TTabSheet
      Caption = #20998#26512#20195#30721
      ImageIndex = 5
      object Label53: TLabel
        Left = 172
        Top = 191
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#20998#26512#20195#30721'1'
      end
      object Label54: TLabel
        Left = 171
        Top = 221
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#20998#26512#20195#30721'2'
      end
      object Label55: TLabel
        Left = 171
        Top = 252
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#20998#26512#20195#30721'3'
      end
      object Label56: TLabel
        Left = 171
        Top = 282
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#20998#26512#20195#30721'4'
      end
      object Label57: TLabel
        Left = 171
        Top = 313
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#20998#26512#20195#30721'5'
      end
      object DBEdit1: TDBEdit
        Left = 262
        Top = 189
        Width = 202
        Height = 21
        DataField = 'ANALYSIS_CODE_1'
        DataSource = dm.DataSource2
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 262
        Top = 219
        Width = 202
        Height = 21
        DataField = 'ANALYSIS_CODE_2'
        DataSource = dm.DataSource2
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 262
        Top = 249
        Width = 202
        Height = 21
        DataField = 'ANALYSIS_CODE_3'
        DataSource = dm.DataSource2
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 262
        Top = 278
        Width = 202
        Height = 21
        DataField = 'ANALYSIS_CODE_4'
        DataSource = dm.DataSource2
        TabOrder = 3
      end
      object DBEdit5: TDBEdit
        Left = 262
        Top = 308
        Width = 202
        Height = 21
        DataField = 'ANALYSIS_CODE_5'
        DataSource = dm.DataSource2
        TabOrder = 4
      end
      object StringGrid2: TStringGrid
        Left = 3
        Top = 13
        Width = 673
        Height = 159
        DefaultRowHeight = 20
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goRowSelect]
        ScrollBars = ssNone
        TabOrder = 5
        Visible = False
        OnMouseDown = StringGrid2MouseDown
        ColWidths = (
          64
          430
          87
          84
          64)
      end
      object DBGrid6: TDBGrid
        Left = 3
        Top = 13
        Width = 673
        Height = 159
        Align = alCustom
        DataSource = dm.DataSource7
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 6
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'sch_date'
            Title.Caption = #23436#24037#26085#26399
            Width = 149
            Visible = True
          end
          item
            Alignment = taLeftJustify
            Expanded = False
            FieldName = 'quantity'
            Title.Caption = #23436#24037#25968#37327
            Width = 154
            Visible = True
          end>
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'ECN '#36164#35759
      ImageIndex = 6
      object Label88: TLabel
        Left = -11
        Top = 100
        Width = 99
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#35746#21333#20462#35746#35760#24405
      end
      object GroupBox1: TGroupBox
        Left = 56
        Top = 12
        Width = 185
        Height = 70
        Caption = #23458#25143' ECN'
        TabOrder = 0
        object Label58: TLabel
          Left = 22
          Top = 20
          Width = 46
          Height = 13
          Alignment = taRightJustify
          Caption = #20869#37096#30340':'
        end
        object Label59: TLabel
          Left = 22
          Top = 41
          Width = 46
          Height = 13
          Alignment = taRightJustify
          Caption = #22806#37096#30340':'
        end
        object Label60: TLabel
          Left = 108
          Top = 20
          Width = 35
          Height = 13
          Alignment = taRightJustify
          Caption = '     '
        end
        object Label61: TLabel
          Left = 114
          Top = 42
          Width = 35
          Height = 13
          Alignment = taRightJustify
          Caption = '     '
        end
      end
      object GroupBox2: TGroupBox
        Left = 272
        Top = 12
        Width = 185
        Height = 70
        Caption = #23458#25143#37096#21697' ECN'
        TabOrder = 1
        object Label62: TLabel
          Left = 22
          Top = 20
          Width = 46
          Height = 13
          Alignment = taRightJustify
          Caption = #20869#37096#30340':'
        end
        object Label63: TLabel
          Left = 22
          Top = 41
          Width = 46
          Height = 13
          Alignment = taRightJustify
          Caption = #22806#37096#30340':'
        end
        object Label64: TLabel
          Left = 120
          Top = 21
          Width = 35
          Height = 13
          Alignment = taRightJustify
          Caption = '     '
        end
        object Label65: TLabel
          Left = 120
          Top = 42
          Width = 35
          Height = 13
          Alignment = taRightJustify
          Caption = '     '
        end
      end
      object Memo4: TMemo
        Left = 0
        Top = 144
        Width = 680
        Height = 233
        Align = alBottom
        Color = cl3DLight
        ReadOnly = True
        TabOrder = 2
      end
    end
    object TabSheet8: TTabSheet
      Caption = #21512#21516#35780#23457#20869#23481
      ImageIndex = 7
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 680
        Height = 377
        Align = alClient
        DataSource = dm.DataSource3
        ImeMode = imChinese
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnCellClick = DBGrid1CellClick
        OnColExit = DBGrid1ColExit
        OnDrawColumnCell = DBGrid1DrawColumnCell
        OnKeyDown = DBGrid1KeyDown
        OnKeyPress = DBGrid1KeyPress
        Columns = <
          item
            Color = cl3DLight
            Expanded = False
            FieldName = 'parameter_name'
            Width = 172
            Visible = True
          end
          item
            Color = cl3DLight
            Expanded = False
            FieldName = 'parameter_desc'
            Width = 194
            Visible = True
          end
          item
            Color = cl3DLight
            Expanded = False
            FieldName = 'unit_name'
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'tvalue'
            Width = 202
            Visible = True
          end>
      end
      object DBComboBox1: TDBComboBox
        Left = 456
        Top = 18
        Width = 206
        Height = 21
        DataField = 'tvalue'
        DataSource = dm.DataSource3
        ImeMode = imChinese
        ItemHeight = 13
        TabOrder = 1
        Visible = False
        OnKeyDown = DBComboBox1KeyDown
      end
    end
  end
  object Button1: TButton
    Left = 261
    Top = 411
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 1
    OnClick = Button1Click
    OnEnter = Button1Enter
  end
  object Button2: TButton
    Left = 339
    Top = 411
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 2
    OnClick = Button2Click
  end
  object BitBtn1: TBitBtn
    Left = 648
    Top = 411
    Width = 25
    Height = 25
    TabOrder = 3
    Visible = False
    OnClick = BitBtn1Click
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
  object Button3: TButton
    Left = 299
    Top = 411
    Width = 75
    Height = 25
    Caption = #20851#38381
    TabOrder = 4
    Visible = False
    OnClick = Button3Click
  end
end
