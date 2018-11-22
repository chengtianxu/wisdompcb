object frmParamAdd: TfrmParamAdd
  Left = 529
  Top = 305
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #24037#24207#21442#25968
  ClientHeight = 202
  ClientWidth = 301
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
    Left = 230
    Top = 30
    Width = 23
    Height = 22
    Caption = #26597
    OnClick = btnMoreClick
  end
  object lblDesc: TLabel
    Left = 96
    Top = 58
    Width = 3
    Height = 13
  end
  object lblUnit: TLabel
    Left = 96
    Top = 117
    Width = 3
    Height = 13
  end
  object lbldtype: TLabel
    Left = 224
    Top = 92
    Width = 3
    Height = 13
  end
  object edtParam: TLabeledEdit
    Left = 96
    Top = 32
    Width = 121
    Height = 21
    EditLabel.Width = 24
    EditLabel.Height = 13
    EditLabel.Caption = #21442#25968
    LabelPosition = lpLeft
    TabOrder = 0
    OnExit = edtParamExit
  end
  object edtValue: TLabeledEdit
    Left = 96
    Top = 88
    Width = 121
    Height = 21
    EditLabel.Width = 36
    EditLabel.Height = 13
    EditLabel.Caption = #21442#25968#20540
    LabelPosition = lpLeft
    TabOrder = 1
    OnExit = edtValueExit
  end
  object btnOK: TButton
    Left = 64
    Top = 168
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 2
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 176
    Top = 168
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 3
    OnClick = btnCancelClick
  end
end
