object frmHighPermit: TfrmHighPermit
  Left = 608
  Top = 450
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #39640#32423#26435#38480
  ClientHeight = 145
  ClientWidth = 233
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 62
    Width = 36
    Height = 13
    Caption = #23494#30721#65306
  end
  object lbl1: TLabel
    Left = 8
    Top = 12
    Width = 48
    Height = 13
    Caption = #29992#25143#21517#65306
  end
  object edtPassword: TEdit
    Left = 8
    Top = 80
    Width = 217
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object OKBtn: TButton
    Left = 14
    Top = 112
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 2
    OnClick = OKBtnClick
  end
  object CancelBtn: TButton
    Left = 150
    Top = 112
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object edtUserName: TEdit
    Left = 8
    Top = 30
    Width = 217
    Height = 21
    TabOrder = 0
  end
end
