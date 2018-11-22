object Form7: TForm7
  Left = 274
  Top = 214
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26434#39033#36153#29992
  ClientHeight = 276
  ClientWidth = 492
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'ËÎÌו'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid1: TStringGrid
    Left = 0
    Top = 0
    Width = 492
    Height = 226
    Align = alTop
    DefaultRowHeight = 19
    FixedCols = 3
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing]
    ScrollBars = ssNone
    TabOrder = 0
    OnExit = StringGrid1Exit
    OnKeyPress = StringGrid1KeyPress
    OnSelectCell = StringGrid1SelectCell
    ColWidths = (
      64
      285
      59
      76
      44)
  end
  object Button1: TButton
    Left = 166
    Top = 243
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 246
    Top = 243
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
  end
end
