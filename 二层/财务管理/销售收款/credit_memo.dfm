object Form_credit: TForm_credit
  Left = 297
  Top = 157
  BorderStyle = bsSingle
  Caption = #36151#39033#22791#24536
  ClientHeight = 284
  ClientWidth = 471
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
    Left = 112
    Top = 55
    Width = 59
    Height = 13
    Caption = #22791#24536#32534#21495':'
  end
  object Label2: TLabel
    Left = 136
    Top = 82
    Width = 33
    Height = 13
    Caption = #26085#26399':'
  end
  object Label3: TLabel
    Left = 136
    Top = 135
    Width = 33
    Height = 13
    Caption = #37329#39069':'
  end
  object Label4: TLabel
    Left = 136
    Top = 110
    Width = 33
    Height = 13
    Caption = #36135#24065':'
  end
  object Label5: TLabel
    Left = 136
    Top = 161
    Width = 33
    Height = 13
    Caption = #22791#27880':'
  end
  object Button1: TButton
    Left = 152
    Top = 216
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 227
    Top = 216
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 6
  end
  object Edit1: TEdit
    Left = 176
    Top = 51
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 176
    Top = 78
    Width = 89
    Height = 21
    ReadOnly = True
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 176
    Top = 105
    Width = 89
    Height = 21
    ReadOnly = True
    TabOrder = 2
  end
  object Edit4: TEdit
    Left = 176
    Top = 131
    Width = 89
    Height = 21
    ReadOnly = True
    TabOrder = 3
  end
  object Edit5: TEdit
    Left = 176
    Top = 157
    Width = 209
    Height = 21
    MaxLength = 60
    TabOrder = 4
  end
end
