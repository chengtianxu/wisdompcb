object Form11: TForm11
  Left = 258
  Top = 149
  Width = 696
  Height = 480
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 688
    Height = 412
    Align = alClient
    Color = cl3DLight
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 412
    Width = 688
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      688
      41)
    object Button2: TButton
      Left = 345
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akLeft, akTop, akBottom]
      Caption = #20851#38381
      ModalResult = 2
      TabOrder = 0
    end
    object Button1: TButton
      Left = 267
      Top = 9
      Width = 75
      Height = 25
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 1
      Visible = False
    end
  end
end
