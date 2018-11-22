object FrmEditPo_no: TFrmEditPo_no
  Left = 468
  Top = 370
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20462#25913#21512#21516#21495#30721
  ClientHeight = 98
  ClientWidth = 492
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 28
    Top = 20
    Width = 65
    Height = 13
    Caption = #21407#21512#21516#21495#30721
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 268
    Top = 20
    Width = 65
    Height = 13
    Caption = #29616#21512#21516#21495#30721
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object edt1: TEdit
    Left = 104
    Top = 16
    Width = 121
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 0
  end
  object edt2: TEdit
    Left = 344
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object btn1: TBitBtn
    Left = 304
    Top = 64
    Width = 75
    Height = 25
    Caption = #30830#35748
    TabOrder = 2
    OnClick = btn1Click
  end
  object btn2: TBitBtn
    Left = 392
    Top = 64
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 3
    OnClick = btn2Click
  end
end
