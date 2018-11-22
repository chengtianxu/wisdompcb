object frmPswd_Set: TfrmPswd_Set
  Left = 260
  Top = 230
  BorderStyle = bsDialog
  Caption = #23494#30721#35774#32622
  ClientHeight = 209
  ClientWidth = 353
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 64
    Top = 31
    Width = 46
    Height = 13
    Caption = #21407#23494#30721':'
  end
  object Label2: TLabel
    Left = 51
    Top = 95
    Width = 59
    Height = 13
    Caption = #30830#35748#23494#30721':'
  end
  object Label3: TLabel
    Left = 64
    Top = 63
    Width = 46
    Height = 13
    Caption = #26032#23494#30721':'
  end
  object edtPswdOrg: TEdit
    Left = 120
    Top = 24
    Width = 137
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
  end
  object edtPswdNew: TEdit
    Left = 120
    Top = 56
    Width = 137
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object edtPswdConfirm: TEdit
    Left = 120
    Top = 88
    Width = 137
    Height = 21
    PasswordChar = '*'
    TabOrder = 2
  end
  object Button1: TButton
    Left = 80
    Top = 144
    Width = 75
    Height = 25
    Caption = #30830#23450'(&Y)'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 192
    Top = 144
    Width = 75
    Height = 25
    Caption = #36864#20986'(&E)'
    TabOrder = 4
    OnClick = Button2Click
  end
end
