object Form_drcalc: TForm_drcalc
  Left = 343
  Top = 303
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #38075#23380#23380#25968#27719#24635
  ClientHeight = 167
  ClientWidth = 302
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
    Left = 53
    Top = 36
    Width = 72
    Height = 13
    Caption = #27719#24635#24320#22987#34892':'
  end
  object Label2: TLabel
    Left = 53
    Top = 74
    Width = 72
    Height = 13
    Caption = #27719#24635#32467#26463#34892':'
  end
  object Edit1: TEdit
    Left = 128
    Top = 32
    Width = 75
    Height = 21
    TabOrder = 0
    Text = '1'
    OnKeyDown = Edit1KeyDown
    OnKeyPress = Edit1KeyPress
    OnKeyUp = Edit1KeyUp
  end
  object Edit2: TEdit
    Left = 128
    Top = 70
    Width = 75
    Height = 21
    TabOrder = 1
    Text = '1'
    OnKeyDown = Edit2KeyDown
    OnKeyPress = Edit1KeyPress
    OnKeyUp = Edit1KeyUp
  end
  object Button1: TButton
    Left = 75
    Top = 120
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 155
    Top = 120
    Width = 75
    Height = 25
    Caption = #20851#38381
    ModalResult = 2
    TabOrder = 3
  end
end
