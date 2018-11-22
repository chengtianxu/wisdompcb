object inputform: Tinputform
  Left = 450
  Top = 115
  Width = 698
  Height = 544
  VertScrollBar.ParentColor = False
  VertScrollBar.Smooth = True
  VertScrollBar.Style = ssHotTrack
  VertScrollBar.Tracking = True
  VertScrollBar.Visible = False
  Caption = #38075#24102#25991#20214#23548#20837
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid1: TStringGrid
    Left = 0
    Top = 0
    Width = 682
    Height = 505
    Align = alClient
    ColCount = 12
    DefaultRowHeight = 20
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing, goAlwaysShowEditor]
    PopupMenu = PopupMenu1
    ScrollBars = ssHorizontal
    TabOrder = 0
    OnDblClick = StringGrid1DblClick
    OnSelectCell = StringGrid1SelectCell
    ColWidths = (
      23
      32
      30
      51
      28
      91
      48
      49
      49
      49
      54
      153)
  end
  object ComboBox1: TComboBox
    Left = 160
    Top = 424
    Width = 113
    Height = 21
    AutoDropDown = True
    ItemHeight = 13
    TabOrder = 1
    Visible = False
    OnSelect = ComboBox1Select
  end
  object OpenDialog1: TOpenDialog
    InitialDir = 'D:\drill'
    Options = [ofReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 88
    Top = 416
  end
  object PopupMenu1: TPopupMenu
    Left = 120
    Top = 416
    object N1: TMenuItem
      Caption = #36861#21152#36827#38075#21632#34920
      object A1: TMenuItem
        Caption = #20316#20026'A'#26495#36861#21152
        OnClick = A1Click
      end
      object B1: TMenuItem
        Caption = #20316#20026'B'#26495#36861#21152
        OnClick = B1Click
      end
      object N5: TMenuItem
        Caption = #36861#21152#21040#26368#21518
        OnClick = N5Click
      end
    end
    object N2: TMenuItem
      Caption = #35206#30422#21040#38075#21632#34920
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object N4: TMenuItem
      AutoCheck = True
      AutoHotkeys = maManual
      AutoLineReduction = maManual
      Caption = #28608#27963#24555#25463#20462#25913
      OnClick = N4Click
    end
    object N6: TMenuItem
      Caption = #28165#31354#19968#21015
      Enabled = False
      OnClick = N6Click
    end
  end
end
