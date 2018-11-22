object frm_dataoperating: Tfrm_dataoperating
  Left = 262
  Top = 185
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #25968#25454#21047#26032#20013'...'
  ClientHeight = 68
  ClientWidth = 547
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object ProgressBar1: TProgressBar
    Left = 10
    Top = 21
    Width = 528
    Height = 23
    Max = 50000
    Step = 1
    TabOrder = 0
  end
  object Button1: TButton
    Left = 448
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Button1'
    ModalResult = 1
    TabOrder = 1
    Visible = False
    OnClick = Button1Click
  end
end
