object Form1: TForm1
  Left = 269
  Top = 205
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #23458#25143#29305#21035#35201#27714
  ClientHeight = 453
  ClientWidth = 566
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 41
    Top = 13
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #23458#25143#20195#30721':'
  end
  object Memo1: TMemo
    Left = 0
    Top = 39
    Width = 566
    Height = 414
    Align = alBottom
    ReadOnly = True
    TabOrder = 1
    OnKeyPress = Memo1KeyPress
  end
  object Edit1: TEdit
    Left = 100
    Top = 9
    Width = 121
    Height = 21
    TabOrder = 0
    OnExit = Edit1Exit
    OnKeyDown = Edit1KeyDown
  end
  object Button1: TButton
    Left = 262
    Top = 6
    Width = 75
    Height = 25
    Caption = #20445#23384
    Enabled = False
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 366
    Top = 6
    Width = 75
    Height = 25
    Caption = #21462#28040
    Enabled = False
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 471
    Top = 6
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 4
    OnClick = Button3Click
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 400
    Top = 408
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 432
    Top = 408
  end
end
