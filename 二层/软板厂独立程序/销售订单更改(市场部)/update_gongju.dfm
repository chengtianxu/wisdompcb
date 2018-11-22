object Form11: TForm11
  Left = 412
  Top = 270
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26356#25913#24037#20855#36153#29992
  ClientHeight = 368
  ClientWidth = 541
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid1: TStringGrid
    Left = 0
    Top = 0
    Width = 541
    Height = 313
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
      191
      89
      90
      96
      65
      23)
    RowHeights = (
      20
      20)
  end
  object Button1: TButton
    Left = 144
    Top = 331
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 224
    Top = 331
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
  end
  object ComboBox2: TComboBox
    Left = 467
    Top = 23
    Width = 67
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 3
    Text = 'Y'
    OnChange = ComboBox2Change
    OnKeyDown = ComboBox2KeyDown
    Items.Strings = (
      'Y'
      'N')
  end
end
