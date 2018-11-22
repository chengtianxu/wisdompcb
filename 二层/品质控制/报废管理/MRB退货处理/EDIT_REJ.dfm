object Form3: TForm3
  Left = 259
  Top = 298
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = '   '#32534#36753#25298#25910#21697#19982#19981#33391#21697
  ClientHeight = 176
  ClientWidth = 553
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
    Left = 88
    Top = 19
    Width = 92
    Height = 13
    Alignment = taRightJustify
    Caption = #25298#25910#21697'/'#19981#33391#21697':'
  end
  object Label2: TLabel
    Left = 146
    Top = 79
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #25968#37327':'
  end
  object Label3: TLabel
    Left = 184
    Top = 49
    Width = 224
    Height = 13
    AutoSize = False
  end
  object Label5: TLabel
    Left = 448
    Top = 24
    Width = 7
    Height = 13
    Visible = False
  end
  object Label6: TLabel
    Left = 147
    Top = 110
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #22791#27880':'
  end
  object Edit1: TEdit
    Left = 186
    Top = 16
    Width = 81
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Edit1Click
    OnExit = Edit1Exit
    OnKeyDown = Edit1KeyDown
  end
  object Edit2: TEdit
    Left = 186
    Top = 75
    Width = 81
    Height = 21
    MaxLength = 10
    TabOrder = 1
    OnExit = Edit2Exit
    OnKeyDown = Edit2KeyDown
    OnKeyPress = Edit2KeyPress
  end
  object BitBtn1: TBitBtn
    Left = 274
    Top = 14
    Width = 25
    Height = 25
    TabOrder = 3
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
  object Button1: TButton
    Left = 195
    Top = 142
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 275
    Top = 142
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 5
  end
  object Edit3: TEdit
    Left = 186
    Top = 106
    Width = 199
    Height = 21
    MaxLength = 20
    TabOrder = 2
    OnKeyDown = Edit3KeyDown
  end
end
