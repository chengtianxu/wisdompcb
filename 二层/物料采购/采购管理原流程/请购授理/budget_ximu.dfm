object Form5: TForm5
  Left = 374
  Top = 148
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #39044#31639#32454#30446
  ClientHeight = 401
  ClientWidth = 340
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
  object Label1: TLabel
    Left = 38
    Top = 16
    Width = 63
    Height = 13
    Alignment = taRightJustify
    Caption = '    '#39044#31639#20195#30721':'
  end
  object Edit1: TEdit
    Left = 109
    Top = 12
    Width = 161
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 0
  end
  object editor1: TStringGrid
    Left = 0
    Top = 40
    Width = 340
    Height = 292
    Color = cl3DLight
    ColCount = 3
    DefaultRowHeight = 19
    FixedCols = 0
    RowCount = 14
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
    TabOrder = 1
    OnDrawCell = editor1DrawCell
    ColWidths = (
      85
      119
      130)
  end
  object Button1: TButton
    Left = 136
    Top = 360
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
  end
end
