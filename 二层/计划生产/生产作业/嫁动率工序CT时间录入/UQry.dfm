object FrmQry: TFrmQry
  Left = 511
  Top = 247
  Width = 652
  Height = 332
  Caption = #26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 636
    Height = 294
    Align = alClient
    TabOrder = 0
    object grp1: TGroupBox
      Left = -3
      Top = -8
      Width = 788
      Height = 257
      Caption = #26597#35810#26465#20214#23450#20041
      TabOrder = 0
      object lbl_field: TLabel
        Left = 151
        Top = 33
        Width = 146
        Height = 15
        AutoSize = False
        Caption = #31867#22411
      end
      object edt_Value: TEdit
        Left = 152
        Top = 50
        Width = 127
        Height = 21
        TabOrder = 0
      end
      object btn_add: TButton
        Left = 197
        Top = 102
        Width = 62
        Height = 25
        Caption = #22686#21152
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btn_addClick
      end
      object lst1: TListBox
        Left = 4
        Top = 42
        Width = 143
        Height = 184
        ItemHeight = 13
        Items.Strings = (
          #26412#21378#32534#21495
          #26426#21488
          #24037#24207#20195#30721
          #32500#25252#20154#21592
          #21472#26495#25968'('#30452#25509#26597#35810#31561#20110'0'#30340')'
          #24037#33402)
        TabOrder = 2
        OnClick = lst1Click
      end
      object txt1: TStaticText
        Left = 4
        Top = 24
        Width = 143
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
      object btn_del: TButton
        Left = 197
        Top = 214
        Width = 64
        Height = 25
        Caption = #28165#38500
        TabOrder = 4
        OnClick = btn_delClick
      end
      object btn_qry: TBitBtn
        Left = 286
        Top = 48
        Width = 22
        Height = 23
        TabOrder = 5
        OnClick = btn_qryClick
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
        TabOrder = 6
      end
      object sgrid1: TStringGrid
        Left = 312
        Top = 48
        Width = 473
        Height = 175
        ColCount = 3
        DefaultRowHeight = 19
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
        PopupMenu = pm1
        ScrollBars = ssHorizontal
        TabOrder = 7
        ColWidths = (
          139
          184
          129)
      end
    end
    object btn_OK: TButton
      Left = 207
      Top = 252
      Width = 75
      Height = 25
      Caption = #30830#23450
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ModalResult = 1
      ParentFont = False
      TabOrder = 1
    end
    object btn_cancel: TButton
      Left = 495
      Top = 252
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 2
    end
  end
  object pm1: TPopupMenu
    Left = 456
    Top = 91
    object N1: TMenuItem
      Caption = #21024#38500
    end
  end
end
