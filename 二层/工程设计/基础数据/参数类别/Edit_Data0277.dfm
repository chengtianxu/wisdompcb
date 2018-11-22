object frmEdit_Data0277: TfrmEdit_Data0277
  Left = 231
  Top = 282
  Width = 413
  Height = 242
  Caption = #21442#25968#31867#21035
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 32
    Width = 65
    Height = 13
    Caption = #31867#21035#21517#31216#65306
  end
  object Label2: TLabel
    Left = 16
    Top = 56
    Width = 65
    Height = 13
    Caption = #31867#21035#25551#36848#65306
  end
  object Label3: TLabel
    Left = 16
    Top = 96
    Width = 60
    Height = 13
    Caption = #29366'   '#24577#65306
  end
  object rgStatus: TRadioGroup
    Left = 96
    Top = 88
    Width = 161
    Height = 41
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #26377#25928
      #22833#25928)
    TabOrder = 0
  end
  object edtName: TEdit
    Left = 96
    Top = 24
    Width = 161
    Height = 21
    TabOrder = 1
  end
  object edtDesc: TEdit
    Left = 96
    Top = 56
    Width = 297
    Height = 21
    TabOrder = 2
  end
  object btnSave: TButton
    Left = 96
    Top = 168
    Width = 75
    Height = 25
    Caption = #20445#23384'(&S)'
    TabOrder = 3
    OnClick = btnSaveClick
  end
  object btnCancel: TButton
    Left = 200
    Top = 168
    Width = 75
    Height = 25
    Caption = #21462#28040'(&C)'
    ModalResult = 2
    TabOrder = 4
  end
end
