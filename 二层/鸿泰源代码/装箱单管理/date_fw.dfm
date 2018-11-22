object Form10: TForm10
  Left = 262
  Top = 207
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26085#26399#33539#22260#36807#28388#26465#20214
  ClientHeight = 133
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
    Left = 76
    Top = 24
    Width = 60
    Height = 13
    Alignment = taRightJustify
    Caption = '    '#20986#36135#26085#26399
  end
  object Label2: TLabel
    Left = 54
    Top = 52
    Width = 18
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#20174':'
  end
  object Label3: TLabel
    Left = 208
    Top = 52
    Width = 18
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#21040':'
  end
  object DTPk1: TDateTimePicker
    Left = 86
    Top = 48
    Width = 97
    Height = 21
    CalAlignment = dtaLeft
    Date = 38240
    Time = 38240
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 0
    OnKeyDown = DTPk1KeyDown
  end
  object DTPk2: TDateTimePicker
    Left = 232
    Top = 48
    Width = 97
    Height = 21
    CalAlignment = dtaLeft
    Date = 38240.6414492593
    Time = 38240.6414492593
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 1
    OnKeyDown = DTPk2KeyDown
  end
  object Button1: TButton
    Left = 122
    Top = 90
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 2
  end
  object Button2: TButton
    Left = 201
    Top = 90
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 3
  end
end
