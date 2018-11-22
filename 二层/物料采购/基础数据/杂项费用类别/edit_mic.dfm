object Form2: TForm2
  Left = 237
  Top = 282
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26434#39033#36153#29992#31867#21035
  ClientHeight = 163
  ClientWidth = 583
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 61
    Top = 16
    Width = 99
    Height = 13
    Alignment = taRightJustify
    Caption = '    '#26434#39033#36153#29992#31867#21035':'
  end
  object Label2: TLabel
    Left = 61
    Top = 49
    Width = 99
    Height = 13
    Alignment = taRightJustify
    Caption = '    '#24635#24080#24080#30446#20195#30721':'
  end
  object Label3: TLabel
    Left = 170
    Top = 74
    Width = 3
    Height = 13
  end
  object DBEdit1: TDBEdit
    Left = 168
    Top = 12
    Width = 193
    Height = 21
    DataField = 'MISC_CHARGE_CATEGORY'
    DataSource = Form1.DataSource1
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 168
    Top = 45
    Width = 193
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Edit1Click
    OnExit = Edit1Exit
  end
  object BitBtn1: TBitBtn
    Left = 368
    Top = 44
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
  object DBCheckBox1: TDBCheckBox
    Left = 168
    Top = 97
    Width = 74
    Height = 17
    Caption = #26159#21542#24449#31246
    DataField = 'TAXABLE'
    DataSource = Form1.DataSource1
    TabOrder = 3
    ValueChecked = 'Y'
    ValueUnchecked = 'N'
  end
  object Button1: TButton
    Left = 189
    Top = 128
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 269
    Top = 128
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 5
    OnClick = Button2Click
  end
end
