object Form2: TForm2
  Left = 253
  Top = 273
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #39069#22806#20215#26684#31867#21035
  ClientHeight = 176
  ClientWidth = 607
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 86
    Top = 16
    Width = 54
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#31867#21035':'
  end
  object Label2: TLabel
    Left = 60
    Top = 44
    Width = 80
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#24635#24080#24080#30446':'
  end
  object Label3: TLabel
    Left = 155
    Top = 65
    Width = 7
    Height = 13
  end
  object DBEdit1: TDBEdit
    Left = 152
    Top = 13
    Width = 201
    Height = 21
    DataField = 'CATEGORY'
    DataSource = Form1.DataSource1
    TabOrder = 0
    OnKeyDown = DBEdit1KeyDown
  end
  object Button1: TButton
    Left = 208
    Top = 144
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 288
    Top = 144
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 6
    OnClick = Button2Click
  end
  object DBCheckBox1: TDBCheckBox
    Left = 152
    Top = 88
    Width = 97
    Height = 17
    Caption = #23545#27492#31867#21035#24449#31246
    DataField = 'TAX_FLAG'
    DataSource = Form1.DataSource1
    TabOrder = 3
    ValueChecked = 'Y'
    ValueUnchecked = 'N'
  end
  object DBCheckBox2: TDBCheckBox
    Left = 152
    Top = 112
    Width = 145
    Height = 17
    Caption = #20801#35768#22312#31867#21035#20013#35760#20323#37329
    DataField = 'COMMISSION_FLAG'
    DataSource = Form1.DataSource1
    TabOrder = 4
    ValueChecked = 'Y'
    ValueUnchecked = 'N'
  end
  object BitBtn1: TBitBtn
    Left = 415
    Top = 37
    Width = 25
    Height = 25
    TabOrder = 2
    TabStop = False
    OnClick = BitBtn1Click
    Glyph.Data = {
      EE000000424DEE000000000000007600000028000000100000000F0000000100
      04000000000078000000130B0000130B00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      888800000888880000080F000888880F00080F000888880F0008000000080000
      000800F000000F00000800F000800F00000800F000800F000008800000000000
      0088880F00080F000888880000080000088888800088800088888880F08880F0
      888888800088800088888888888888888888}
  end
  object Edit1: TEdit
    Left = 152
    Top = 39
    Width = 258
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Edit1Click
    OnExit = Edit1Exit
    OnKeyDown = DBEdit1KeyDown
  end
end
