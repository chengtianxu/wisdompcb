object frmTagRead: TfrmTagRead
  Left = 425
  Top = 109
  Width = 826
  Height = 511
  Caption = #26631#31614#35835#21462
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgc1: TPageControl
    Left = 0
    Top = 0
    Width = 810
    Height = 472
    ActivePage = ts2
    Align = alClient
    TabOrder = 0
    object ts1: TTabSheet
      Caption = #20986#36135#35745#21010#23548#20837
      TabVisible = False
      object lv1: TListView
        Left = 0
        Top = 0
        Width = 802
        Height = 444
        Align = alClient
        Columns = <
          item
            AutoSize = True
            Caption = 'PO'#21495#30721
          end
          item
            AutoSize = True
            Caption = 'ITEM'#32534#21495
          end
          item
            AutoSize = True
            Caption = #21457#36135#25968#37327
          end
          item
            AutoSize = True
            Caption = #20132#36135#26085#26399
          end>
        GridLines = True
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
    object ts2: TTabSheet
      Caption = #26465#30721#25195#25551
      ImageIndex = 1
      object sg1: TStringGrid
        Left = 0
        Top = 153
        Width = 802
        Height = 268
        Align = alClient
        ColCount = 17
        DefaultColWidth = 110
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
        PopupMenu = pm1
        TabOrder = 0
        OnDrawCell = sg1DrawCell
      end
      object pnl1: TPanel
        Left = 0
        Top = 0
        Width = 802
        Height = 153
        Align = alTop
        TabOrder = 1
        object mmo1: TMemo
          Left = 1
          Top = 1
          Width = 800
          Height = 151
          Align = alClient
          ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object pnl2: TPanel
        Left = 0
        Top = 421
        Width = 802
        Height = 23
        Align = alBottom
        TabOrder = 2
        object lbl1: TLabel
          Left = 1
          Top = 1
          Width = 240
          Height = 21
          Align = alLeft
          AutoSize = False
          Caption = #35299#26512#25968#65306
        end
        object pb1: TProgressBar
          Left = 241
          Top = 1
          Width = 352
          Height = 21
          Align = alLeft
          TabOrder = 0
        end
      end
    end
  end
  object pm1: TPopupMenu
    OnPopup = pm1Popup
    Left = 576
    Top = 320
    object N1: TMenuItem
      Caption = #26465#30721#35299#26512
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #23548#20986#21040'Excel'
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #21512#24182#30456#21516#39033
      OnClick = N3Click
    end
    object N5: TMenuItem
      Caption = #20986#24211'/'#20837#24211
      OnClick = N5Click
    end
    object N6: TMenuItem
      Caption = #26597#30475#24211#23384
      OnClick = N6Click
    end
  end
  object qry1: TADOQuery
    Parameters = <>
    Left = 532
    Top = 104
  end
end
