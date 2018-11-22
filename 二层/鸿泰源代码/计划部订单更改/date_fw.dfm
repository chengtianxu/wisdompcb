object Form5: TForm5
  Left = 326
  Top = 279
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26085#26399#33539#22260#36807#28388#26465#20214
  ClientHeight = 137
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 57
    Top = 26
    Width = 60
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#19979#21333#26085#26399':'
  end
  object Label2: TLabel
    Left = 40
    Top = 52
    Width = 18
    Height = 13
    Caption = ' '#20174':'
  end
  object Label3: TLabel
    Left = 202
    Top = 51
    Width = 18
    Height = 13
    Caption = ' '#21040':'
  end
  object DTpk1: TDateTimePicker
    Left = 65
    Top = 46
    Width = 121
    Height = 25
    CalAlignment = dtaLeft
    Date = 38240
    Time = 38240
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 0
  end
  object DTPk2: TDateTimePicker
    Left = 225
    Top = 46
    Width = 121
    Height = 24
    CalAlignment = dtaLeft
    Date = 38240
    Time = 38240
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 1
  end
  object Button1: TButton
    Left = 130
    Top = 91
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 2
  end
  object Button2: TButton
    Left = 210
    Top = 91
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 3
  end
end
