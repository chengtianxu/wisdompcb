object Form3: TForm3
  Left = 423
  Top = 124
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #28155#21152#38144#21806#23450#21333
  ClientHeight = 420
  ClientWidth = 672
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 255
    Top = 387
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 335
    Top = 387
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 672
    Height = 378
    ActivePage = TabSheet1
    Align = alTop
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #35746#21333#20449#24687
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      object Label2: TLabel
        Left = 45
        Top = 52
        Width = 75
        Height = 13
        Alignment = taRightJustify
        Caption = ' '#25968#37327'(Set):'
        Visible = False
      end
      object Label26: TLabel
        Left = 45
        Top = 52
        Width = 75
        Height = 13
        Alignment = taRightJustify
        Caption = ' '#25968#37327'(Pcs):'
      end
      object Bevel1: TBevel
        Left = 391
        Top = 32
        Width = 265
        Height = 52
        Shape = bsFrame
      end
      object Label1: TLabel
        Left = 35
        Top = 24
        Width = 85
        Height = 13
        Alignment = taRightJustify
        Caption = #38144#21806#35746#21333#32534#21495':'
      end
      object Label3: TLabel
        Left = 45
        Top = 81
        Width = 75
        Height = 13
        Alignment = taRightJustify
        Caption = ' '#20215#26684'(Set):'
        Visible = False
      end
      object Label5: TLabel
        Left = 87
        Top = 135
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = #25240#25187':'
      end
      object Label6: TLabel
        Left = 61
        Top = 165
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = #20248#20808#39034#24207':'
      end
      object Label7: TLabel
        Left = 61
        Top = 220
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = #23458#25143#20132#26399':'
      end
      object Label8: TLabel
        Left = 61
        Top = 248
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = #35745#21010#20132#26399':'
      end
      object Label9: TLabel
        Left = 87
        Top = 277
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = #21442#32771':'
      end
      object Bevel2: TBevel
        Left = 391
        Top = 96
        Width = 265
        Height = 133
        Shape = bsFrame
      end
      object Label11: TLabel
        Left = 401
        Top = 90
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = ' '#21512#35745
      end
      object Label10: TLabel
        Left = 401
        Top = 27
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = ' '#21382#21490#20215#26684
        Color = clBtnFace
        ParentColor = False
      end
      object Label13: TLabel
        Left = 444
        Top = 40
        Width = 113
        Height = 13
        Alignment = taRightJustify
        Caption = '    '#26368#36817#38144#21806#20215#26684':'
      end
      object Label14: TLabel
        Left = 393
        Top = 62
        Width = 164
        Height = 13
        Alignment = taRightJustify
        Caption = ' '#19978#19968#27425#37319#36141#23450#21333'/'#37096#20214#20215#26684':'
      end
      object Label15: TLabel
        Left = 450
        Top = 104
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = #20215#26684#21512#35745'Pcs:'
      end
      object Label17: TLabel
        Left = 497
        Top = 139
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = #25240#25187':'
      end
      object Label18: TLabel
        Left = 471
        Top = 158
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = #24037#20855#36153#29992':'
      end
      object Label19: TLabel
        Left = 497
        Top = 191
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = #24635#35745':'
      end
      object Label29: TLabel
        Left = 176
        Top = 135
        Width = 7
        Height = 13
        Caption = '%'
      end
      object Label30: TLabel
        Left = 585
        Top = 104
        Width = 42
        Height = 13
        Alignment = taRightJustify
        Caption = '0.0000'
      end
      object Label32: TLabel
        Left = 592
        Top = 139
        Width = 35
        Height = 13
        Alignment = taRightJustify
        Caption = '0.000'
      end
      object Label33: TLabel
        Left = 585
        Top = 158
        Width = 42
        Height = 13
        Alignment = taRightJustify
        Caption = '0.0000'
      end
      object Label34: TLabel
        Left = 579
        Top = 191
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
      object Label35: TLabel
        Left = 564
        Top = 40
        Width = 63
        Height = 13
        Alignment = taRightJustify
        Caption = '0.0000000'
      end
      object Label36: TLabel
        Left = 564
        Top = 61
        Width = 63
        Height = 13
        Alignment = taRightJustify
        Caption = '0.0000000'
      end
      object Label27: TLabel
        Left = 45
        Top = 110
        Width = 75
        Height = 13
        Alignment = taRightJustify
        Caption = ' '#20215#26684'(Pcs):'
      end
      object Label39: TLabel
        Left = 41
        Top = 328
        Width = 79
        Height = 13
        Alignment = taRightJustify
        Caption = ' '#20986#36135#26495#26041#24335':'
      end
      object Label40: TLabel
        Left = 126
        Top = 328
        Width = 7
        Height = 13
      end
      object Label_qteptr: TLabel
        Left = 315
        Top = 110
        Width = 7
        Height = 13
        Caption = '0'
        Visible = False
      end
      object SpeedButton1: TSpeedButton
        Left = 313
        Top = 136
        Width = 57
        Height = 22
        Caption = #21462#28040
        Flat = True
        OnClick = SpeedButton1Click
      end
      object Label22: TLabel
        Left = 471
        Top = 212
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = #19979#21333#38754#31215':'
      end
      object Label41: TLabel
        Left = 585
        Top = 210
        Width = 42
        Height = 13
        Alignment = taRightJustify
        Caption = '0.0000'
      end
      object Label4: TLabel
        Left = 497
        Top = 121
        Width = 33
        Height = 13
        Caption = #31246#37329':'
      end
      object Label16: TLabel
        Left = 592
        Top = 120
        Width = 35
        Height = 13
        Alignment = taRightJustify
        Caption = '0.000'
      end
      object Label28: TLabel
        Left = 471
        Top = 175
        Width = 59
        Height = 13
        Caption = #24037#20855#31246#37329':'
      end
      object Label31: TLabel
        Left = 585
        Top = 175
        Width = 42
        Height = 13
        Alignment = taRightJustify
        Caption = '0.0000'
      end
      object Label12: TLabel
        Left = 34
        Top = 193
        Width = 85
        Height = 13
        Alignment = taRightJustify
        Caption = #21407#22987#23458#25143#20132#26399':'
      end
      object Bevel3: TBevel
        Left = 391
        Top = 240
        Width = 265
        Height = 98
        Hint = '* '#26410#32467#31639#24635#39069#26410#21253#21547#26412#38144#21806#35746#21333
        ParentShowHint = False
        Shape = bsFrame
        ShowHint = True
      end
      object Label37: TLabel
        Left = 439
        Top = 258
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = #20449#29992#31561#32423':'
      end
      object Label38: TLabel
        Left = 439
        Top = 280
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = #20449#29992#38480#39069':'
      end
      object Label42: TLabel
        Left = 426
        Top = 301
        Width = 72
        Height = 13
        Alignment = taRightJustify
        Caption = #26410#32467#31639#24635#39069':'
      end
      object Label43: TLabel
        Left = 614
        Top = 258
        Width = 13
        Height = 13
        Alignment = taRightJustify
        Caption = #26080
      end
      object Label44: TLabel
        Left = 585
        Top = 280
        Width = 42
        Height = 13
        Alignment = taRightJustify
        Caption = '0.0000'
      end
      object Label45: TLabel
        Left = 585
        Top = 301
        Width = 42
        Height = 13
        Alignment = taRightJustify
        Caption = '0.0000'
      end
      object Label46: TLabel
        Left = 401
        Top = 235
        Width = 111
        Height = 13
        Caption = ' '#23458#25143#20449#29992#39069#24230#20449#24687
        Color = clBtnFace
        ParentColor = False
      end
      object Edit16: TEdit
        Left = 126
        Top = 48
        Width = 75
        Height = 21
        TabOrder = 1
        Text = '0'
        Visible = False
        OnExit = Edit16Exit
        OnKeyDown = Edit16KeyDown
        OnKeyPress = Edit2KeyPress
      end
      object Edit2: TEdit
        Left = 126
        Top = 48
        Width = 75
        Height = 21
        TabOrder = 2
        Text = '0'
        OnExit = Edit3Exit
        OnKeyDown = Edit2KeyDown
        OnKeyPress = Edit2KeyPress
      end
      object Edit1: TEdit
        Left = 126
        Top = 20
        Width = 121
        Height = 21
        TabStop = False
        MaxLength = 12
        TabOrder = 0
      end
      object Edit3: TEdit
        Left = 126
        Top = 106
        Width = 92
        Height = 21
        TabOrder = 4
        Text = '0.00000000'
        OnExit = Edit3Exit
        OnKeyDown = Edit3KeyDown
        OnKeyPress = Edit3KeyPress
      end
      object Edit5: TEdit
        Left = 126
        Top = 131
        Width = 43
        Height = 21
        TabOrder = 5
        Text = '0.00'
        OnExit = Edit5Exit
        OnKeyDown = Edit5KeyDown
        OnKeyPress = Edit5KeyPress
      end
      object Edit9: TEdit
        Left = 126
        Top = 273
        Width = 241
        Height = 21
        MaxLength = 50
        TabOrder = 9
        OnKeyDown = Edit9KeyDown
      end
      object MaskEdit1: TMaskEdit
        Left = 126
        Top = 217
        Width = 88
        Height = 21
        EditMask = '!0000-!90-90;1;_'
        MaxLength = 10
        TabOrder = 7
        Text = '    -  -  '
        OnExit = MaskEdit1Exit
        OnKeyDown = MaskEdit1KeyDown
      end
      object MaskEdit2: TMaskEdit
        Left = 126
        Top = 244
        Width = 88
        Height = 21
        EditMask = '!0000-!90-90;1;_'
        MaxLength = 10
        TabOrder = 8
        Text = '    -  -  '
        OnExit = MaskEdit2Exit
        OnKeyDown = MaskEdit2KeyDown
      end
      object BitBtn1: TBitBtn
        Left = 226
        Top = 76
        Width = 78
        Height = 25
        Hint = #21382#21490#20215#26684#20449#24687
        Caption = #21382#21490#20215#26684
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
        TabStop = False
        OnClick = BitBtn1Click
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
      object BitBtn2: TBitBtn
        Left = 226
        Top = 105
        Width = 78
        Height = 25
        Caption = #25253#20215#21333#21495
        TabOrder = 11
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
      object Edit18: TEdit
        Left = 126
        Top = 78
        Width = 92
        Height = 21
        TabOrder = 3
        Text = '0.00000000'
        Visible = False
        OnExit = Edit18Exit
        OnKeyDown = Edit3KeyDown
        OnKeyPress = Edit3KeyPress
      end
      object Edit10: TEdit
        Left = 226
        Top = 136
        Width = 79
        Height = 21
        TabStop = False
        Color = cl3DLight
        ReadOnly = True
        TabOrder = 12
      end
      object MaskEdit3: TMaskEdit
        Left = 126
        Top = 190
        Width = 88
        Height = 21
        EditMask = '!0000-!90-90;1;_'
        MaxLength = 10
        TabOrder = 6
        Text = '    -  -  '
        OnExit = MaskEdit3Exit
        OnKeyDown = MaskEdit3KeyDown
      end
      object btnFindContract: TBitBtn
        Left = 306
        Top = 105
        Width = 78
        Height = 25
        Caption = 'RFQ'#21512#21516
        ParentShowHint = False
        ShowHint = True
        TabOrder = 13
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
      object btn1: TBitBtn
        Left = 306
        Top = 76
        Width = 78
        Height = 25
        Caption = 'BOM'#25253#20215#21333
        ParentShowHint = False
        ShowHint = True
        TabOrder = 14
        TabStop = False
        OnClick = btn1Click
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
      object ComboBox2: TComboBox
        Left = 126
        Top = 160
        Width = 92
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 15
      end
    end
    object TabSheet2: TTabSheet
      Caption = #29983#20135#24037#20855#36153#29992
      ImageIndex = 1
      OnExit = TabSheet2Exit
      object StringGrid1: TStringGrid
        Left = 0
        Top = 0
        Width = 664
        Height = 232
        Align = alTop
        ColCount = 6
        Ctl3D = False
        DefaultRowHeight = 19
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
        ParentCtl3D = False
        ScrollBars = ssVertical
        TabOrder = 0
        OnDrawCell = StringGrid1DrawCell
        OnExit = StringGrid1Exit
        OnKeyPress = StringGrid1KeyPress
        OnSelectCell = StringGrid1SelectCell
        ColWidths = (
          318
          88
          82
          84
          64
          64)
        RowHeights = (
          19
          19)
      end
      object ComboBox1: TComboBox
        Left = 577
        Top = 20
        Width = 65
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 1
        Text = 'Y'
        OnChange = ComboBox1Change
        OnKeyDown = ComboBox1KeyDown
        Items.Strings = (
          'Y'
          'N')
      end
    end
    object TabSheet3: TTabSheet
      Caption = #20998#26512#20195#30721
      ImageIndex = 2
      object Label23: TLabel
        Left = 150
        Top = 36
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = #20998#26512#20195#30721'1'
      end
      object Label24: TLabel
        Left = 150
        Top = 63
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = #20998#26512#20195#30721'2'
      end
      object Label25: TLabel
        Left = 150
        Top = 91
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = #20998#26512#20195#30721'3'
      end
      object Label20: TLabel
        Left = 150
        Top = 115
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = #20998#26512#20195#30721'4'
      end
      object Label21: TLabel
        Left = 150
        Top = 143
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = #20998#26512#20195#30721'5'
      end
      object StringGrid2: TStringGrid
        Left = 0
        Top = 184
        Width = 661
        Height = 145
        DefaultRowHeight = 19
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goRowSelect]
        PopupMenu = PopupMenu1
        ScrollBars = ssVertical
        TabOrder = 0
        Visible = False
        OnDblClick = StringGrid2DblClick
        OnMouseDown = StringGrid2MouseDown
        ColWidths = (
          115
          332
          105
          106
          64)
      end
      object Edit11: TEdit
        Left = 219
        Top = 34
        Width = 259
        Height = 21
        MaxLength = 20
        TabOrder = 1
      end
      object Edit12: TEdit
        Left = 219
        Top = 60
        Width = 259
        Height = 21
        MaxLength = 20
        TabOrder = 2
      end
      object Edit13: TEdit
        Left = 219
        Top = 87
        Width = 259
        Height = 21
        MaxLength = 20
        TabOrder = 3
      end
      object Edit4: TEdit
        Left = 219
        Top = 112
        Width = 259
        Height = 21
        MaxLength = 20
        TabOrder = 4
      end
      object Edit7: TEdit
        Left = 219
        Top = 139
        Width = 259
        Height = 21
        MaxLength = 20
        TabOrder = 5
      end
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 40
    Top = 384
    object add_rep: TMenuItem
      Caption = #28155#21152#38144#21806#20195#34920
      OnClick = add_repClick
    end
    object edit_rep: TMenuItem
      Caption = #32534#36753#38144#21806#20195#34920
      OnClick = edit_repClick
    end
    object del_rep: TMenuItem
      Caption = #21024#38500#38144#21806#20195#34920
      OnClick = del_repClick
    end
  end
end
