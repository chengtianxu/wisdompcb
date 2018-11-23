object frmqkftp: Tfrmqkftp
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = #19978#20256'/'#19979#36733
  ClientHeight = 81
  ClientWidth = 369
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lbl3: TRzLabel
    Left = 16
    Top = 27
    Width = 39
    Height = 13
    Caption = #36827#24230#65306
  end
  object lblTotalSize: TRzLabel
    Left = 132
    Top = 27
    Width = 42
    Height = 13
    Caption = '/1024M'
  end
  object lblLocalFile: TRzLabel
    Left = 17
    Top = 49
    Width = 344
    Height = 26
    AutoSize = False
    Caption = #26412#22320#25991#20214#65306
    WordWrap = True
  end
  object btnCLose: TRzButton
    Left = 317
    Top = 24
    Width = 44
    Height = 22
    Caption = #32456#27490
    TabOrder = 0
    TabStop = False
    OnClick = btnCLoseClick
  end
  object pb1: TProgressBar
    Left = 16
    Top = 6
    Width = 345
    Height = 17
    Max = 1000
    TabOrder = 1
  end
  object lblNowSize: TStaticText
    Left = 56
    Top = 27
    Width = 71
    Height = 17
    Alignment = taRightJustify
    AutoSize = False
    Caption = '0'
    TabOrder = 2
  end
  object idftp1: TIdFTP
    OnWork = idftp1Work
    OnWorkBegin = idftp1WorkBegin
    OnWorkEnd = idftp1WorkEnd
    IPVersion = Id_IPv4
    ConnectTimeout = 30000
    NATKeepAlive.UseKeepAlive = False
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 248
    Top = 32
  end
end
