object Form_bug: TForm_bug
  Left = 286
  Top = 228
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #32570#38519#35814#32454#24773#20917
  ClientHeight = 217
  ClientWidth = 392
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
    Left = 94
    Top = 32
    Width = 59
    Height = 13
    Caption = #32570#38519#32534#21495':'
  end
  object Label2: TLabel
    Left = 118
    Top = 64
    Width = 33
    Height = 13
    Caption = #25968#37327':'
  end
  object rkey76: TLabel
    Left = 344
    Top = 56
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object bug76: TLabel
    Left = 344
    Top = 80
    Width = 7
    Height = 13
    Caption = '1'
    Visible = False
  end
  object RadioGroup1: TRadioGroup
    Left = 85
    Top = 96
    Width = 201
    Height = 41
    Caption = #22788#29702#26041#24335
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #25253#24223
      #36864#36135)
    TabOrder = 3
  end
  object Edit1: TEdit
    Left = 166
    Top = 29
    Width = 121
    Height = 21
    ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
    ReadOnly = True
    TabOrder = 0
    OnExit = Edit1Exit
  end
  object Edit2: TEdit
    Left = 165
    Top = 60
    Width = 98
    Height = 21
    ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
    TabOrder = 2
    Text = '0'
    OnExit = Edit2Exit
    OnKeyPress = Edit2KeyPress
  end
  object Button1: TButton
    Left = 96
    Top = 160
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 200
    Top = 160
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 5
    OnClick = Button2Click
  end
  object BitBtn1: TBitBtn
    Left = 287
    Top = 27
    Width = 25
    Height = 25
    TabOrder = 1
    OnClick = BitBtn1Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
      333333777777777F33333330B00000003333337F7777777F3333333000000000
      333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
      333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
      03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
      03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
      3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
      333333333377F7F33333333333330F03333333333337F7F33333333333330B03
      3333333333373733333333333333303333333333333373333333}
    NumGlyphs = 2
  end
end
