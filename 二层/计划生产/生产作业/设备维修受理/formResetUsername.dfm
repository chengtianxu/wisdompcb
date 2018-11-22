object frmResetUsername: TfrmResetUsername
  Left = 474
  Top = 285
  BorderStyle = bsDialog
  Caption = 'frmResetUsername'
  ClientHeight = 183
  ClientWidth = 327
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 61
    Top = 36
    Width = 48
    Height = 13
    Caption = #29992#25143#21517#65306
    FocusControl = edtUsername
  end
  object Label2: TLabel
    Left = 73
    Top = 84
    Width = 36
    Height = 13
    Caption = #23494#30721#65306
    FocusControl = edtPassword
  end
  object btOK: TButton
    Left = 40
    Top = 128
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 2
    OnClick = btOKClick
  end
  object btCancel: TButton
    Left = 200
    Top = 128
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 3
    OnClick = btCancelClick
  end
  object edtUsername: TEdit
    Left = 112
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 0
    OnKeyPress = edtUsernameKeyPress
  end
  object edtPassword: TEdit
    Left = 112
    Top = 80
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
    OnKeyPress = edtPasswordKeyPress
  end
  object qryTemp: TADOQuery
    Parameters = <>
    Left = 248
    Top = 24
  end
end
