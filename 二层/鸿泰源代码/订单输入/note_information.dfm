object Form11: TForm11
  Left = 282
  Top = 141
  Width = 647
  Height = 473
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  DesignSize = (
    639
    446)
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 282
    Top = 395
    Width = 76
    Height = 25
    Anchors = [akBottom]
    Caption = #20851#38381
    ModalResult = 1
    TabOrder = 0
    OnKeyDown = FormKeyDown
  end
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 639
    Height = 377
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = cl3DLight
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 1
    OnKeyDown = FormKeyDown
  end
end
