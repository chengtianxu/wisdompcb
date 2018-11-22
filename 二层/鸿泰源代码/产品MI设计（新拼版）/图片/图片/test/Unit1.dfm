object Form1: TForm1
  Left = 244
  Top = 165
  Width = 703
  Height = 500
  Caption = 'net'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 208
    Top = 32
    Width = 145
    Height = 25
    AutoSize = False
    Caption = #21482#22312#31532#20108#21015#26174#31034
  end
  object StringGrid1: TStringGrid
    Left = 104
    Top = 64
    Width = 561
    Height = 241
    ColCount = 8
    RowCount = 8
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goEditing, goTabs]
    TabOrder = 0
    OnSelectCell = StringGrid1SelectCell
    RowHeights = (
      24
      24
      24
      24
      24
      24
      24
      24)
  end
  object ComboBox1: TComboBox
    Left = 104
    Top = 352
    Width = 145
    Height = 21
    ImeName = #20013#25991' - QQ'#20116#31508#36755#20837#27861
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 1
    Text = '1'
    OnChange = ComboBox1Change
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5')
  end
end
