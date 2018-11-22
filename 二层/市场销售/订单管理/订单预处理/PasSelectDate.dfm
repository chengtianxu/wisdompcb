object frmSelectDate: TfrmSelectDate
  Left = 484
  Top = 239
  Width = 290
  Height = 244
  Caption = #26032#21333#23548#20837#36873#25321#39033
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
    Top = 16
    Width = 104
    Height = 13
    Caption = #26032#21333#19979#36798#26085#26399#20174#65306
  end
  object Label2: TLabel
    Left = 49
    Top = 64
    Width = 26
    Height = 13
    Caption = #21040#65306
  end
  object Label3: TLabel
    Left = 36
    Top = 108
    Width = 39
    Height = 13
    Caption = #39029#30721#65306
  end
  object Label4: TLabel
    Left = 143
    Top = 107
    Width = 86
    Height = 13
    Caption = #27599'100'#26465#20026#19968#39029
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object DateTimePicker1: TDateTimePicker
    Left = 72
    Top = 43
    Width = 127
    Height = 21
    Date = 43009.000000000000000000
    Time = 43009.000000000000000000
    DateMode = dmUpDown
    TabOrder = 0
  end
  object DateTimePicker2: TDateTimePicker
    Left = 72
    Top = 75
    Width = 127
    Height = 21
    Date = 43009.000000000000000000
    Time = 43009.000000000000000000
    DateMode = dmUpDown
    TabOrder = 1
  end
  object ComboBox1: TComboBox
    Left = 72
    Top = 104
    Width = 65
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    Text = '1'
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9')
  end
  object Button1: TButton
    Left = 64
    Top = 160
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 160
    Top = 160
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 4
    OnClick = Button2Click
  end
end
