object Form3: TForm3
  Left = 649
  Top = 148
  BorderStyle = bsDialog
  Caption = #24037#31243#22791#27880#20449#24687#24211
  ClientHeight = 633
  ClientWidth = 626
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label19: TLabel
    Left = 8
    Top = 40
    Width = 48
    Height = 13
    Caption = #22522#26412#24037#33402
  end
  object Label1: TLabel
    Left = 8
    Top = 12
    Width = 65
    Height = 13
    Caption = #24037#24207#20195#30721
  end
  object Label2: TLabel
    Left = 306
    Top = 40
    Width = 48
    Height = 13
    Caption = #24037#33402#38590#28857
  end
  object Label3: TLabel
    Left = 8
    Top = 304
    Width = 65
    Height = 13
    Caption = #23454#26045#26041#26696
  end
  object DBEdit1: TDBEdit
    Left = 61
    Top = 8
    Width = 281
    Height = 21
    DataField = 'DEPT_CODE'
    DataSource = dm.DataSource6
    TabOrder = 0
  end
  object DBMemo1: TDBMemo
    Left = 8
    Top = 61
    Width = 281
    Height = 233
    DataField = 'BasicTechnology'
    DataSource = dm.DataSource6
    TabOrder = 1
  end
  object Button1: TButton
    Left = 212
    Top = 576
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 297
    Top = 576
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 3
    OnClick = Button2Click
  end
  object BitBtn3: TBitBtn
    Tag = 3
    Left = 347
    Top = 5
    Width = 25
    Height = 25
    TabOrder = 4
    OnClick = BitBtn3Click
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
  object DBMemo2: TDBMemo
    Left = 305
    Top = 62
    Width = 281
    Height = 233
    DataField = 'DifficultPoint'
    DataSource = dm.DataSource6
    TabOrder = 5
  end
  object DBMemo3: TDBMemo
    Left = 6
    Top = 325
    Width = 579
    Height = 233
    DataField = 'BEIZHU'
    DataSource = dm.DataSource6
    TabOrder = 6
  end
end
