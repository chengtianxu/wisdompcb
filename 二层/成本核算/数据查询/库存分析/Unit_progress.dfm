object Form_progress: TForm_progress
  Left = 296
  Top = 229
  Width = 353
  Height = 123
  AlphaBlend = True
  Caption = #36827#31243
  Color = clActiveBorder
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 329
    Height = 24
    AutoSize = False
  end
  object ProgressBar1: TProgressBar
    Left = 11
    Top = 49
    Width = 325
    Height = 14
    TabOrder = 0
  end
  object Timer1: TTimer
    Interval = 10
    OnTimer = Timer1Timer
    Left = 72
  end
end
