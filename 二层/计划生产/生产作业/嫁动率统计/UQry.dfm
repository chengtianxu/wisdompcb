object FrmQry: TFrmQry
  Left = 541
  Top = 211
  Width = 553
  Height = 300
  Caption = #26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 537
    Height = 262
    Align = alClient
    TabOrder = 0
    object pnl2: TPanel
      Left = 1
      Top = 1
      Width = 535
      Height = 260
      Align = alClient
      Caption = #26597#35810
      TabOrder = 0
      object grp1: TGroupBox
        Left = 7
        Top = 12
        Width = 268
        Height = 221
        Caption = #26597#35810#26465#20214#23450#20041
        TabOrder = 0
        object lbl_field: TLabel
          Left = 101
          Top = 42
          Width = 52
          Height = 13
          Caption = #23458#25143#20195#30721
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object lbl4: TLabel
          Left = 92
          Top = 55
          Width = 52
          Height = 13
          Alignment = taRightJustify
          Caption = #36215#22987#26085#26399
          Visible = False
        end
        object lbl5: TLabel
          Left = 95
          Top = 97
          Width = 52
          Height = 13
          Alignment = taRightJustify
          Caption = #32456#27490#26085#26399
          Visible = False
        end
        object lbl_rkey15: TLabel
          Left = 120
          Top = 184
          Width = 7
          Height = 13
          Caption = '0'
          Visible = False
        end
        object dtpt1: TDateTimePicker
          Left = 185
          Top = 71
          Width = 82
          Height = 21
          Date = 38974.333333333340000000
          Format = 'hh:mm:ss'
          Time = 38974.333333333340000000
          Kind = dtkTime
          TabOrder = 5
          Visible = False
        end
        object dtp1: TDateTimePicker
          Left = 91
          Top = 71
          Width = 95
          Height = 21
          Date = 37257.000000000000000000
          Format = 'yyyy-MM-dd'
          Time = 37257.000000000000000000
          TabOrder = 4
          Visible = False
        end
        object btn_add: TButton
          Left = 155
          Top = 138
          Width = 75
          Height = 25
          Caption = #22686#21152
          TabOrder = 0
          OnClick = btn_addClick
        end
        object btn_sel: TBitBtn
          Left = 234
          Top = 69
          Width = 25
          Height = 25
          TabOrder = 1
          Visible = False
          OnClick = btn_selClick
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
        object lst1: TListBox
          Left = 10
          Top = 33
          Width = 81
          Height = 176
          ItemHeight = 13
          Items.Strings = (
            #32479#35745#32534#21495
            #32479#35745#26085#26399)
          TabOrder = 2
          OnClick = lst1Click
        end
        object txt1: TStaticText
          Left = 10
          Top = 16
          Width = 81
          Height = 17
          Alignment = taCenter
          AutoSize = False
          BevelInner = bvLowered
          BevelOuter = bvNone
          Caption = #26465#20214#39033#30446
          Color = clGrayText
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindow
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 3
        end
        object dtp2: TDateTimePicker
          Left = 91
          Top = 113
          Width = 95
          Height = 21
          Date = 37575.000000000000000000
          Format = 'yyyy-MM-dd'
          Time = 37575.000000000000000000
          TabOrder = 6
          Visible = False
        end
        object dtpt2: TDateTimePicker
          Left = 185
          Top = 113
          Width = 82
          Height = 21
          Date = 38974.333333333340000000
          Format = 'hh:mm:ss'
          Time = 38974.333333333340000000
          Kind = dtkTime
          TabOrder = 7
          Visible = False
        end
        object edt_value: TEdit
          Left = 112
          Top = 71
          Width = 113
          Height = 21
          TabOrder = 8
        end
      end
      object txt2: TStaticText
        Left = 279
        Top = 15
        Width = 248
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BevelInner = bvLowered
        BevelOuter = bvNone
        Caption = #24050#23450#20041#30340#26465#20214
        Color = clGrayText
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindow
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 1
      end
      object sgrid1: TStringGrid
        Left = 279
        Top = 33
        Width = 530
        Height = 200
        ColCount = 3
        DefaultRowHeight = 19
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        PopupMenu = pm1
        ScrollBars = ssVertical
        TabOrder = 2
        ColWidths = (
          76
          167
          280)
      end
      object btn_OK: TButton
        Left = 183
        Top = 236
        Width = 75
        Height = 25
        Caption = #30830#23450
        ModalResult = 1
        TabOrder = 3
      end
      object btn_cancel: TButton
        Left = 271
        Top = 236
        Width = 75
        Height = 25
        Caption = #21462#28040
        ModalResult = 2
        TabOrder = 4
      end
    end
  end
  object pm1: TPopupMenu
    Left = 408
    Top = 181
    object N1: TMenuItem
      Caption = #21024#38500
    end
  end
end
