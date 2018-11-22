object frmAddDept: TfrmAddDept
  Left = 570
  Top = 279
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #28155#21152#24037#24207
  ClientHeight = 258
  ClientWidth = 440
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
  object btnMore: TSpeedButton
    Left = 198
    Top = 22
    Width = 23
    Height = 22
    Caption = #26597
    OnClick = btnMoreClick
  end
  object lbl1: TLabel
    Left = 14
    Top = 76
    Width = 48
    Height = 13
    Caption = #21152#24037#25351#31034
  end
  object lblDept_name: TLabel
    Left = 66
    Top = 54
    Width = 3
    Height = 13
  end
  object edtDept: TLabeledEdit
    Left = 64
    Top = 24
    Width = 121
    Height = 21
    EditLabel.Width = 48
    EditLabel.Height = 13
    EditLabel.Caption = #24037#24207#20195#30721
    LabelPosition = lpLeft
    TabOrder = 0
    OnExit = edtDeptExit
  end
  object mmoNote: TMemo
    Left = 13
    Top = 100
    Width = 401
    Height = 105
    MaxLength = 2048
    TabOrder = 1
  end
  object btnOK: TButton
    Left = 120
    Top = 216
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 2
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 264
    Top = 216
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 3
    OnClick = btnCancelClick
  end
end
