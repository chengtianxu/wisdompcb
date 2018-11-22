object Form3: TForm3
  Left = 253
  Top = 308
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #31246#31080#26631#35782
  ClientHeight = 209
  ClientWidth = 395
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 56
    Top = 35
    Width = 59
    Height = 13
    Caption = #31246#31080#37329#39069':'
  end
  object Label2: TLabel
    Left = 80
    Top = 123
    Width = 33
    Height = 13
    Caption = #22791#27880':'
  end
  object Label3: TLabel
    Left = 56
    Top = 83
    Width = 59
    Height = 13
    Caption = #31246#31080#26085#26399':'
  end
  object Edit1: TEdit
    Left = 120
    Top = 31
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '0.00'
    OnExit = Edit1Exit
    OnKeyPress = Edit1KeyPress
  end
  object Edit2: TEdit
    Left = 120
    Top = 119
    Width = 249
    Height = 21
    MaxLength = 50
    TabOrder = 2
  end
  object Button1: TButton
    Left = 110
    Top = 159
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 190
    Top = 159
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
  end
  object DateTimePicker1: TDateTimePicker
    Left = 120
    Top = 79
    Width = 121
    Height = 21
    CalAlignment = dtaLeft
    Date = 38765
    Time = 38765
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 1
  end
end
