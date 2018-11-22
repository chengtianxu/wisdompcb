object Form3: TForm3
  Left = 257
  Top = 297
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26448#26009#31867#21035#21442#25968
  ClientHeight = 210
  ClientWidth = 562
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
    Left = 204
    Top = 53
    Width = 77
    Height = 13
    Caption = '           '
  end
  object Label2: TLabel
    Left = 138
    Top = 26
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #21442#25968#21517#31216':'
  end
  object Label3: TLabel
    Left = 148
    Top = 82
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = #40664#35748#20540':'
  end
  object Label4: TLabel
    Left = 462
    Top = 73
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object ies_rkey: TLabel
    Left = 465
    Top = 28
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object Edit1: TEdit
    Left = 200
    Top = 22
    Width = 121
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
  end
  object BitBtn1: TBitBtn
    Left = 328
    Top = 20
    Width = 25
    Height = 25
    TabOrder = 1
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
  object Edit2: TEdit
    Left = 201
    Top = 78
    Width = 168
    Height = 21
    MaxLength = 20
    TabOrder = 2
  end
  object Button1: TButton
    Left = 202
    Top = 177
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 282
    Top = 177
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
  end
  object RadioGroup1: TRadioGroup
    Left = 200
    Top = 116
    Width = 185
    Height = 47
    Caption = #21442#25968#24615#36136
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #26448#26009#21442#25968
      #20135#21697#21442#25968)
    TabOrder = 5
  end
end
