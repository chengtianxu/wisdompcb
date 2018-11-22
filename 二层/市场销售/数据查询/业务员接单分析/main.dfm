object Form1: TForm1
  Left = 292
  Top = 231
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #38144#21806#35746#21333#27719#24635#26597#35810
  ClientHeight = 289
  ClientWidth = 411
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 95
    Top = 140
    Width = 226
    Height = 64
    Shape = bsFrame
  end
  object Label2: TLabel
    Left = 109
    Top = 136
    Width = 54
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #36827#21333#26085#26399
  end
  object Label3: TLabel
    Left = 118
    Top = 155
    Width = 20
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #20174':'
  end
  object Label4: TLabel
    Left = 117
    Top = 179
    Width = 21
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #21040':'
  end
  object Label1: TLabel
    Left = 206
    Top = 217
    Width = 46
    Height = 13
    Caption = #25968#25454#28304':'
  end
  object Label5: TLabel
    Left = 52
    Top = 217
    Width = 33
    Height = 13
    Caption = #24037#21378':'
  end
  object Button1: TButton
    Left = 125
    Top = 245
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 218
    Top = 245
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 1
    OnClick = Button2Click
  end
  object DTPk1: TDateTimePicker
    Left = 153
    Top = 150
    Width = 120
    Height = 21
    Date = 37789.000000000000000000
    Time = 37789.000000000000000000
    TabOrder = 2
  end
  object DTPk2: TDateTimePicker
    Left = 153
    Top = 176
    Width = 120
    Height = 21
    Date = 37789.000000000000000000
    Time = 37789.000000000000000000
    TabOrder = 3
  end
  object RGp2: TRadioGroup
    Left = 95
    Top = 70
    Width = 226
    Height = 62
    Caption = #20135#21697#24615#36136
    Columns = 3
    ItemIndex = 2
    Items.Strings = (
      #37327#20135#26495
      #26679#26495
      #20840#37096)
    TabOrder = 4
  end
  object RadioGroup1: TRadioGroup
    Left = 96
    Top = 15
    Width = 225
    Height = 50
    Caption = #27719#24635#26041#24335
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #19994#21153#21592
      #23458#25143)
    TabOrder = 5
  end
  object ComboBox1: TComboBox
    Left = 257
    Top = 212
    Width = 96
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 6
    Text = #35746#21333#25968#25454
    Items.Strings = (
      #35746#21333#25968#25454
      #20986#36135#25968#25454)
  end
  object ComboBox2: TComboBox
    Left = 96
    Top = 212
    Width = 96
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 7
  end
end
