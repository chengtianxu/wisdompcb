object Form3: TForm3
  Left = 347
  Top = 284
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #21407#26448#26009#33539#22260
  ClientHeight = 340
  ClientWidth = 530
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 32
    Top = 184
    Width = 465
    Height = 107
    Shape = bsFrame
  end
  object Bevel1: TBevel
    Left = 32
    Top = 64
    Width = 465
    Height = 105
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 127
    Top = 86
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #31867#21035':'
  end
  object Label2: TLabel
    Left = 93
    Top = 117
    Width = 67
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#21407#26448#26009':'
    Visible = False
  end
  object Label3: TLabel
    Left = 168
    Top = 141
    Width = 63
    Height = 13
    Caption = '         '
    Visible = False
  end
  object Label5: TLabel
    Left = 106
    Top = 210
    Width = 54
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#31867#21035':'
  end
  object Label6: TLabel
    Left = 93
    Top = 242
    Width = 67
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#21407#26448#26009':'
    Visible = False
  end
  object Label8: TLabel
    Left = 169
    Top = 264
    Width = 42
    Height = 13
    Caption = '      '
    Visible = False
  end
  object Label9: TLabel
    Left = 272
    Top = 86
    Width = 42
    Height = 13
    Caption = '      '
  end
  object Label10: TLabel
    Left = 274
    Top = 208
    Width = 49
    Height = 13
    Caption = '       '
  end
  object Label11: TLabel
    Left = 76
    Top = 59
    Width = 13
    Height = 13
    Alignment = taRightJustify
    Caption = #20174
  end
  object Label12: TLabel
    Left = 74
    Top = 180
    Width = 20
    Height = 13
    Caption = ' '#21040
  end
  object rkey496: TLabel
    Left = 509
    Top = 77
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object rkey496_2: TLabel
    Left = 509
    Top = 197
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object rkey17: TLabel
    Left = 509
    Top = 102
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object rkey17_2: TLabel
    Left = 509
    Top = 220
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object Button1: TButton
    Left = 171
    Top = 307
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 8
    OnEnter = Button1Enter
  end
  object Button2: TButton
    Left = 259
    Top = 307
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 9
  end
  object RadioGroup1: TRadioGroup
    Left = 170
    Top = 7
    Width = 185
    Height = 49
    Caption = #25628#32034#20381#25454
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #31867#21035
      #26448#26009)
    TabOrder = 10
    OnClick = RadioGroup1Click
  end
  object Edit1: TEdit
    Left = 166
    Top = 82
    Width = 65
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Edit1Click
    OnExit = Edit1Exit
  end
  object Edit2: TEdit
    Left = 166
    Top = 114
    Width = 203
    Height = 21
    TabOrder = 1
    Visible = False
    OnClick = Edit1Click
    OnExit = Edit2Exit
  end
  object BitBtn1: TBitBtn
    Left = 238
    Top = 80
    Width = 25
    Height = 25
    TabOrder = 2
    TabStop = False
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
  object BitBtn2: TBitBtn
    Left = 376
    Top = 111
    Width = 25
    Height = 26
    TabOrder = 3
    TabStop = False
    Visible = False
    OnClick = BitBtn2Click
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
  object Edit4: TEdit
    Left = 167
    Top = 205
    Width = 65
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = Edit1Click
    OnExit = Edit4Exit
  end
  object Edit5: TEdit
    Left = 167
    Top = 237
    Width = 203
    Height = 21
    Enabled = False
    TabOrder = 5
    Visible = False
    OnClick = Edit1Click
    OnExit = Edit5Exit
  end
  object BitBtn3: TBitBtn
    Left = 239
    Top = 203
    Width = 25
    Height = 25
    TabOrder = 6
    TabStop = False
    OnClick = BitBtn3Click
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
  object BitBtn4: TBitBtn
    Left = 377
    Top = 235
    Width = 25
    Height = 25
    Enabled = False
    TabOrder = 7
    TabStop = False
    Visible = False
    OnClick = BitBtn4Click
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
