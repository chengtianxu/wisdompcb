object frmProcessShow: TfrmProcessShow
  Left = 317
  Top = 282
  BorderStyle = bsNone
  ClientHeight = 79
  ClientWidth = 480
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 480
    Height = 79
    Align = alClient
    Shape = bsFrame
    Style = bsRaised
  end
  object Label1: TLabel
    Left = 16
    Top = 53
    Width = 449
    Height = 13
    Alignment = taCenter
    AutoSize = False
  end
  object progressbar: TProgressBar
    Left = 8
    Top = 13
    Width = 465
    Height = 31
    TabOrder = 0
  end
end
