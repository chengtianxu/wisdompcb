object Form2: TForm2
  Left = 324
  Top = 183
  Width = 940
  Height = 535
  Caption = #38144#21806#23450#21333#30830#35748
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 924
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Label1: TLabel
      Left = 10
      Top = 11
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = #21487#29992#30340':'
    end
  end
  object StringGrid1: TStringGrid
    Left = 0
    Top = 25
    Width = 924
    Height = 243
    Align = alClient
    ColCount = 17
    DefaultRowHeight = 18
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect, goThumbTracking]
    PopupMenu = PopupMenu1
    TabOrder = 0
    OnClick = StringGrid1Click
    OnDblClick = StringGrid1DblClick
    OnKeyDown = StringGrid1KeyDown
    OnMouseDown = StringGrid1MouseDown
    ColWidths = (
      87
      79
      80
      79
      65
      81
      68
      82
      84
      78
      2
      5
      73
      96
      91
      91
      64)
  end
  object Panel1: TPanel
    Left = 0
    Top = 268
    Width = 924
    Height = 228
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Label2: TLabel
      Left = -15
      Top = 8
      Width = 87
      Height = 13
      Alignment = taRightJustify
      Caption = '    '#23558#35201#30830#35748':'
    end
    object StringGrid2: TStringGrid
      Left = 0
      Top = 32
      Width = 924
      Height = 155
      Align = alBottom
      ColCount = 17
      DefaultRowHeight = 18
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
      PopupMenu = PopupMenu2
      TabOrder = 0
      OnClick = StringGrid2Click
      OnDblClick = N8Click
      OnMouseDown = StringGrid2MouseDown
      ColWidths = (
        91
        83
        82
        81
        66
        77
        64
        81
        94
        72
        3
        4
        74
        95
        97
        89
        64)
    end
    object Panel3: TPanel
      Left = 0
      Top = 187
      Width = 924
      Height = 41
      Align = alBottom
      TabOrder = 1
      DesignSize = (
        924
        41)
      object Button2: TButton
        Left = 484
        Top = 8
        Width = 75
        Height = 25
        Anchors = [akTop]
        Cancel = True
        Caption = #21462#28040
        ModalResult = 2
        TabOrder = 0
      end
      object Button1: TButton
        Left = 322
        Top = 8
        Width = 75
        Height = 25
        Anchors = [akTop]
        Caption = #30830#35748
        Enabled = False
        TabOrder = 1
        OnClick = Button1Click
      end
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 456
    Top = 160
    object N1: TMenuItem
      Caption = #28155#21152#21040#30830#35748#28165#21333
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Caption = #26597#30475#32454#33410
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #38144#21806#35746#21333#35760#20107#26412
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = #35780#23457#20449#24687#35760#20107#26412
      OnClick = N5Click
    end
  end
  object PopupMenu2: TPopupMenu
    OnPopup = PopupMenu2Popup
    Left = 512
    Top = 464
    object N6: TMenuItem
      Caption = #20174#30830#35748#28165#21333#20013#21024#38500
      OnClick = N6Click
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object N8: TMenuItem
      Caption = #26597#30475#32454#33410
      OnClick = N8Click
    end
    object N9: TMenuItem
      Caption = #38144#21806#35746#21333#35760#20107#26412
      OnClick = N9Click
    end
    object N10: TMenuItem
      Caption = #35780#23457#20449#24687#35760#20107#26412
      OnClick = N10Click
    end
  end
end
