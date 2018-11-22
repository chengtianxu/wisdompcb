object Form3: TForm3
  Left = 281
  Top = 245
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #23558#25968#25454#23548#20986#21040'ODBC'
  ClientHeight = 337
  ClientWidth = 582
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 7
    Width = 49
    Height = 13
    AutoSize = False
    Caption = #25968#25454#28304
  end
  object Label2: TLabel
    Left = 214
    Top = 7
    Width = 33
    Height = 13
    AutoSize = False
    Caption = #34920
  end
  object Label3: TLabel
    Left = 387
    Top = 7
    Width = 46
    Height = 13
    AutoSize = False
    Caption = #23383#27573
  end
  object ListBox1: TListBox
    Left = 30
    Top = 26
    Width = 161
    Height = 249
    ItemHeight = 13
    TabOrder = 0
    OnClick = ListBox1Click
    OnDblClick = ListBox1DblClick
  end
  object ListBox2: TListBox
    Left = 210
    Top = 26
    Width = 158
    Height = 249
    ItemHeight = 13
    TabOrder = 1
    OnClick = ListBox2Click
  end
  object ListBox3: TListBox
    Left = 386
    Top = 26
    Width = 158
    Height = 249
    Enabled = False
    ItemHeight = 13
    TabOrder = 2
  end
  object Button1: TButton
    Left = 176
    Top = 296
    Width = 75
    Height = 25
    Caption = #30830#23450
    Enabled = False
    ModalResult = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 288
    Top = 296
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
  end
  object Database1: TDatabase
    LoginPrompt = False
    SessionName = 'Default'
    Left = 16
    Top = 288
  end
  object Table1: TTable
    Left = 48
    Top = 288
  end
end
