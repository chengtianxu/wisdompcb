inherited frmorderNote_mod284: TfrmorderNote_mod284
  Caption = #38144#21806#35746#21333#35760#20107#26412
  ClientHeight = 195
  ClientWidth = 611
  Font.Height = -13
  Font.Name = #23435#20307
  Position = poOwnerFormCenter
  ExplicitWidth = 627
  ExplicitHeight = 234
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 611
    Height = 195
    Align = alClient
    TabOrder = 0
    object lbl1: TLabel
      Left = 37
      Top = 14
      Width = 138
      Height = 13
      Caption = ' '#20851#32852#25991#20214#21495'/'#26242#20572#21407#22240':'
    end
    object mmo1: TMemo
      Left = -1
      Top = 41
      Width = 606
      Height = 107
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object btn1: TButton
      Left = 222
      Top = 156
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 1
      OnClick = btn1Click
    end
    object btn2: TButton
      Left = 302
      Top = 156
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 2
    end
    object btn3: TBitBtn
      Left = 8
      Top = 6
      Width = 25
      Height = 25
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        04000000000078000000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888800000888880000080F000888880F00080F000888880F0008000000080000
        000800F000000F00000800F000800F00000800F000800F000008800000000000
        0088880F00080F000888880000080000088888800088800088888880F08880F0
        888888800088800088888888888888888888}
      TabOrder = 3
    end
    object edt_no: TEdit
      Left = 167
      Top = 10
      Width = 438
      Height = 21
      MaxLength = 50
      TabOrder = 4
    end
  end
end
