object frmBOMBaoJiaTypeAddGolbParam: TfrmBOMBaoJiaTypeAddGolbParam
  Left = 0
  Top = 0
  Caption = #28155#21152#20840#23616#21442#25968
  ClientHeight = 229
  ClientWidth = 413
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 56
    Top = 48
    Width = 36
    Height = 13
    Caption = #21442#25968#65306
  end
  object btn3: TSpeedButton
    Left = 287
    Top = 45
    Width = 23
    Height = 22
    Caption = '...'
    OnClick = btn3Click
  end
  object btn1: TButton
    Left = 80
    Top = 176
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 0
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 248
    Top = 176
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 1
    OnClick = btn2Click
  end
  object edt1: TEdit
    Left = 98
    Top = 45
    Width = 183
    Height = 21
    ReadOnly = True
    TabOrder = 2
  end
  object cdsBP00: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 152
    Top = 88
  end
  object cdsBP05: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 216
    Top = 88
  end
end
