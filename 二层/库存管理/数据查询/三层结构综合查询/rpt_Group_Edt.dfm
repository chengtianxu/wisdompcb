object frmrpt_Group_Edt: Tfrmrpt_Group_Edt
  Left = 272
  Top = 377
  BorderStyle = bsDialog
  Caption = #25253#34920#32452
  ClientHeight = 137
  ClientWidth = 331
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
    Left = 16
    Top = 40
    Width = 72
    Height = 13
    Caption = #25253#34920#32452#21517#31216':'
  end
  object edtRptName: TEdit
    Left = 96
    Top = 32
    Width = 177
    Height = 21
    TabOrder = 0
  end
  object btnSave: TButton
    Left = 72
    Top = 88
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 1
    OnClick = btnSaveClick
  end
  object btnCancel: TButton
    Left = 176
    Top = 88
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
  end
end
