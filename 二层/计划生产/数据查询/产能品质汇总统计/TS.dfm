object FrmTS: TFrmTS
  Left = 441
  Top = 318
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #25552#31034
  ClientHeight = 85
  ClientWidth = 571
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
  object lb_1: TLabel
    Left = 32
    Top = 16
    Width = 478
    Height = 24
    Caption = #20146#65292#31995#32479#27491#22312#21162#21147#30340#32479#35745#20013#65292#35831#31245#21518'......'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object pb1: TProgressBar
    Left = 32
    Top = 48
    Width = 505
    Height = 17
    Max = 50
    TabOrder = 0
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 520
    Top = 8
  end
end
