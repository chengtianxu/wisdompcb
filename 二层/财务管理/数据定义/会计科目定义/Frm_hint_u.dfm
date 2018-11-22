object F_hint: TF_hint
  Left = 334
  Top = 322
  Width = 400
  Height = 88
  BorderIcons = []
  Caption = #25910#38598#25968#25454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 392
    Height = 58
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 28
      Top = 15
      Width = 172
      Height = 13
      Caption = #27491#22312#25910#38598#25968#25454#65292#35831#31245#20505'......'
    end
    object ProgressBar1: TProgressBar
      Left = 6
      Top = 34
      Width = 380
      Height = 14
      Smooth = True
      TabOrder = 0
    end
    object Animate2: TAnimate
      Left = 9
      Top = 14
      Width = 16
      Height = 16
      CommonAVI = aviFindFile
      StopFrame = 8
    end
  end
end
