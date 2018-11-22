object frmViewInfo: TfrmViewInfo
  Left = 666
  Top = 265
  Width = 388
  Height = 416
  Caption = #35814#32454#20449#24687
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 0
    Top = 0
    Width = 372
    Height = 19
    Align = alTop
    Alignment = taCenter
    Caption = #35814#32454#20449#24687
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object pnl1: TPanel
    Left = 0
    Top = 343
    Width = 372
    Height = 35
    Align = alBottom
    TabOrder = 0
    object btn1: TSpeedButton
      Left = 149
      Top = 3
      Width = 65
      Height = 28
      Caption = #30830#23450
      OnClick = btn1Click
    end
  end
  object sg1: TStringGrid
    Left = 0
    Top = 19
    Width = 372
    Height = 324
    Align = alClient
    ColCount = 2
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    GridLineWidth = 3
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 1
  end
end
