object frmSetRowCol: TfrmSetRowCol
  Left = 341
  Top = 288
  BorderStyle = bsDialog
  Caption = #35774#32622#34892#25968#21644#21015#25968
  ClientHeight = 101
  ClientWidth = 326
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 39
    Height = 13
    Caption = #34892#25968#65306
  end
  object Label2: TLabel
    Left = 24
    Top = 64
    Width = 39
    Height = 13
    Caption = #21015#25968#65306
  end
  object OKBtn: TButton
    Left = 215
    Top = 12
    Width = 75
    Height = 25
    Caption = #30830#23450'(&Y)'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object CancelBtn: TButton
    Left = 215
    Top = 52
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040'(&C)'
    ModalResult = 2
    TabOrder = 1
  end
  object edtRow: TSpinEdit
    Left = 72
    Top = 16
    Width = 105
    Height = 22
    MaxValue = 100
    MinValue = 2
    TabOrder = 2
    Value = 2
  end
  object edtCol: TSpinEdit
    Left = 72
    Top = 56
    Width = 105
    Height = 22
    MaxValue = 100
    MinValue = 2
    TabOrder = 3
    Value = 2
  end
end
