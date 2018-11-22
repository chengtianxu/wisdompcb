object frmQry: TfrmQry
  Left = 382
  Top = 257
  Width = 723
  Height = 372
  Caption = #26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 715
    Height = 341
    Align = alClient
    TabOrder = 0
    object lbl3: TLabel
      Left = 200
      Top = 16
      Width = 52
      Height = 13
      Caption = #30003#39046#26085#26399
    end
    object lbl4: TLabel
      Left = 373
      Top = 14
      Width = 16
      Height = 16
      Caption = #21040
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object grp1: TGroupBox
      Left = 21
      Top = 32
      Width = 689
      Height = 257
      Caption = #26597#35810#26465#20214#23450#20041
      TabOrder = 0
      object lbl_field: TLabel
        Left = 151
        Top = 41
        Width = 146
        Height = 15
        AutoSize = False
        Caption = #30003#39046#21333#21495
      end
      object rg_condi: TRadioGroup
        Left = 152
        Top = 89
        Width = 153
        Height = 40
        Caption = #26465#20214
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          #31934#30830#26597#25214' '
          #27169#31946#26597#25214)
        TabOrder = 6
        Visible = False
      end
      object edt_Value: TEdit
        Left = 155
        Top = 57
        Width = 132
        Height = 21
        TabOrder = 4
        Visible = False
      end
      object btn_add: TButton
        Left = 197
        Top = 142
        Width = 62
        Height = 25
        Caption = #22686#21152
        TabOrder = 7
        OnClick = btn_addClick
      end
      object lst_fields: TListBox
        Left = 10
        Top = 41
        Width = 135
        Height = 208
        ItemHeight = 13
        TabOrder = 2
        OnClick = lst_fieldsClick
      end
      object txt1: TStaticText
        Left = 10
        Top = 23
        Width = 135
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
        TabOrder = 0
      end
      object btn_del: TButton
        Left = 197
        Top = 174
        Width = 64
        Height = 25
        Caption = #28165#38500
        TabOrder = 8
      end
      object cbb1: TComboBox
        Left = 149
        Top = 58
        Width = 141
        Height = 21
        ItemHeight = 13
        TabOrder = 5
        Visible = False
        Items.Strings = (
          #25163#26426#36890#23380#26495
          #25163#26426#26495
          #26222#36890#26495
          #20809#26495
          '')
      end
      object txt2: TStaticText
        Left = 311
        Top = 23
        Width = 362
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
      object sg1: TStringGrid
        Left = 312
        Top = 48
        Width = 352
        Height = 175
        ColCount = 3
        DefaultRowHeight = 19
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
        PopupMenu = pm1
        ScrollBars = ssHorizontal
        TabOrder = 3
        ColWidths = (
          87
          250
          3)
      end
      object btn_Search: TBitBtn
        Left = 289
        Top = 56
        Width = 20
        Height = 21
        TabOrder = 9
        Visible = False
        OnClick = btn_SearchClick
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
    object btn_OK: TButton
      Left = 231
      Top = 308
      Width = 75
      Height = 25
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 1
    end
    object btn_cancel: TButton
      Left = 407
      Top = 308
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 2
    end
    object dtp3: TDateTimePicker
      Left = 256
      Top = 11
      Width = 107
      Height = 21
      Date = 39878.000000000000000000
      Time = 39878.000000000000000000
      TabOrder = 3
    end
    object dtp4: TDateTimePicker
      Left = 400
      Top = 12
      Width = 107
      Height = 21
      Date = 39878.000000000000000000
      Time = 39878.000000000000000000
      TabOrder = 4
    end
  end
  object pm1: TPopupMenu
    Left = 456
    Top = 91
    object mniN1: TMenuItem
      Caption = #21024#38500
    end
  end
  object qry_temp: TADOQuery
    Parameters = <>
    Left = 621
    Top = 160
  end
end
