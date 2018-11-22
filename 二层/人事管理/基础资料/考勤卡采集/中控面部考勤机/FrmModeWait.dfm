object frmWait: TfrmWait
  Left = 481
  Top = 365
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #35831#31561#24453#31243#24207#36816#34892'...'
  ClientHeight = 75
  ClientWidth = 587
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 528
    Top = 41
    Width = 45
    Height = 13
    Caption = #35831#31245#21518'...'
  end
  object lblNote: TLabel
    Left = 0
    Top = 17
    Width = 587
    Height = 16
    Align = alTop
    Alignment = taCenter
    Caption = #27491#22312#36816#34892#20013#35831#31245#21518
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object pb1: TProgressBar
    Left = 0
    Top = 58
    Width = 587
    Height = 17
    Align = alBottom
    TabOrder = 0
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 587
    Height = 17
    Align = alTop
    TabOrder = 1
  end
  object tmr1: TTimer
    Interval = 50
    OnTimer = tmr1Timer
    Left = 8
    Top = 16
  end
end
