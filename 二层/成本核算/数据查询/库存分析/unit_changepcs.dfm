object frmChangePcsPrice: TfrmChangePcsPrice
  Left = 704
  Top = 331
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #20462#25913#26448#26009#25104#26412
  ClientHeight = 158
  ClientWidth = 297
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 16
    Top = 32
    Width = 85
    Height = 13
    Caption = #26448#26009#25104#26412'/pcs '#65306
  end
  object lbl2: TLabel
    Left = 20
    Top = 72
    Width = 85
    Height = 13
    Caption = #21046#36896#36153#29992'/pcs '#65306
  end
  object btn1: TButton
    Left = 106
    Top = 103
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 0
    OnClick = btn1Click
  end
  object edt1: TEdit
    Left = 112
    Top = 29
    Width = 161
    Height = 21
    TabOrder = 1
    Text = '0'
    OnKeyPress = edt1KeyPress
  end
  object edt2: TEdit
    Left = 112
    Top = 69
    Width = 161
    Height = 21
    TabOrder = 2
    Text = '0'
    OnKeyPress = edt1KeyPress
  end
end
