object frmrpt_Item_Edt: Tfrmrpt_Item_Edt
  Left = 261
  Top = 322
  BorderStyle = bsDialog
  Caption = #25253#34920#36164#26009#32534#36753
  ClientHeight = 169
  ClientWidth = 380
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
  object Label2: TLabel
    Left = 24
    Top = 24
    Width = 59
    Height = 13
    Caption = #25253#34920#21517#31216':'
  end
  object Label3: TLabel
    Left = 24
    Top = 56
    Width = 59
    Height = 13
    Caption = #25253#34920#26631#39064':'
  end
  object Label4: TLabel
    Left = 24
    Top = 88
    Width = 59
    Height = 13
    Caption = #25991#20214#21517#31216':'
  end
  object edtRptName: TEdit
    Left = 96
    Top = 16
    Width = 225
    Height = 21
    TabOrder = 0
  end
  object edtRptTitle: TEdit
    Left = 96
    Top = 48
    Width = 225
    Height = 21
    TabOrder = 1
  end
  object edtFileName: TEdit
    Left = 96
    Top = 80
    Width = 225
    Height = 21
    TabOrder = 2
  end
  object btnSave: TButton
    Left = 88
    Top = 128
    Width = 75
    Height = 25
    Caption = #20445#23384'(&S)'
    TabOrder = 3
    OnClick = btnSaveClick
  end
  object btnCancel: TButton
    Left = 200
    Top = 128
    Width = 75
    Height = 25
    Caption = #21462#28040'(&C)'
    TabOrder = 4
  end
end
