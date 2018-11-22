object Form_cutdate: TForm_cutdate
  Left = 403
  Top = 329
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20445#23384#26410#24320#31080#25968#37327#21450#37329#39069
  ClientHeight = 242
  ClientWidth = 377
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 57
    Top = 68
    Width = 85
    Height = 13
    Caption = #26399#26410#25130#25968#26085#26399':'
  end
  object Label2: TLabel
    Left = 83
    Top = 108
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #25805#20316#26085#26399':'
  end
  object dtpk1: TDateTimePicker
    Left = 144
    Top = 65
    Width = 112
    Height = 21
    Date = 40996.000000000000000000
    Time = 40996.000000000000000000
    TabOrder = 0
  end
  object Button1: TButton
    Left = 110
    Top = 183
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 200
    Top = 183
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
  end
  object Edit1: TEdit
    Left = 144
    Top = 104
    Width = 169
    Height = 21
    ReadOnly = True
    TabOrder = 3
  end
end
