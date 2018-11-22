object Form12: TForm12
  Left = 245
  Top = 150
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20445#30041#37319#36141#35746#21333#21495
  ClientHeight = 436
  ClientWidth = 547
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 98
    Top = 107
    Width = 92
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#37319#36141#23450#21333#21495#30721':'
  end
  object Label2: TLabel
    Left = 98
    Top = 250
    Width = 92
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#37319#36141#23450#21333#31867#22411':'
  end
  object Label3: TLabel
    Left = 123
    Top = 135
    Width = 67
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#20379#24212#21830':'
  end
  object Label4: TLabel
    Left = 110
    Top = 164
    Width = 80
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#35013#36816#22320#28857':'
  end
  object Label5: TLabel
    Left = 120
    Top = 193
    Width = 70
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '   '#32852#32476#20154':'
  end
  object Label6: TLabel
    Left = 107
    Top = 223
    Width = 83
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #30005#35805'/'#20256#30495':'
  end
  object Label7: TLabel
    Left = 147
    Top = 78
    Width = 43
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = ' '#24037#21378':'
  end
  object Label9: TLabel
    Left = 131
    Top = 280
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #35013#36816#26041#27861':'
  end
  object Label10: TLabel
    Left = 312
    Top = 134
    Width = 7
    Height = 13
  end
  object Label8: TLabel
    Left = 311
    Top = 79
    Width = 7
    Height = 13
  end
  object Label11: TLabel
    Left = 123
    Top = 306
    Width = 64
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #20184#27454#26041#27861':'
  end
  object Label12: TLabel
    Left = 123
    Top = 331
    Width = 64
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #31080#25454#31181#31867':'
  end
  object Label13: TLabel
    Left = 123
    Top = 357
    Width = 64
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #20184#27454#22320#28857':'
  end
  object Button1: TButton
    Left = 197
    Top = 392
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 10
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 278
    Top = 392
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 11
    OnClick = Button2Click
  end
  object DBEdit1: TDBEdit
    Left = 197
    Top = 103
    Width = 144
    Height = 21
    TabStop = False
    DataField = 'PO_NUMBER'
    DataSource = DM.DataSource2
    ReadOnly = True
    TabOrder = 13
  end
  object ComboBox1: TComboBox
    Left = 197
    Top = 246
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 5
    Text = #29983#20135#29289#26009
    OnChange = ComboBox1Change
    Items.Strings = (
      #29983#20135#29289#26009
      #38750#29983#20135#29289#26009
      #22806#21457#21152#24037)
  end
  object Edit1: TEdit
    Left = 197
    Top = 131
    Width = 77
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Edit1Click
    OnExit = Edit1Exit
  end
  object BitBtn1: TBitBtn
    Left = 280
    Top = 129
    Width = 25
    Height = 25
    TabOrder = 14
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
  object DBEdit2: TDBEdit
    Left = 197
    Top = 160
    Width = 185
    Height = 21
    DataField = 'factory_location'
    DataSource = DM.DataSource2
    ReadOnly = True
    TabOrder = 2
  end
  object DBComboBox1: TDBComboBox
    Left = 197
    Top = 189
    Width = 185
    Height = 21
    DataField = 'SUPPIER_CONTACT'
    DataSource = DM.DataSource2
    ItemHeight = 13
    TabOrder = 3
  end
  object BitBtn2: TBitBtn
    Left = 390
    Top = 158
    Width = 25
    Height = 25
    TabOrder = 15
    TabStop = False
    OnClick = BitBtn2Click
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
  object DBEdit3: TDBEdit
    Left = 197
    Top = 218
    Width = 183
    Height = 21
    DataField = 'CONTACT_PHONE'
    DataSource = DM.DataSource2
    TabOrder = 4
  end
  object BitBtn3: TBitBtn
    Left = 278
    Top = 73
    Width = 25
    Height = 25
    TabOrder = 16
    TabStop = False
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
  object DBEdit6: TDBEdit
    Left = 197
    Top = 276
    Width = 185
    Height = 21
    DataField = 'SHIPPING_METHOD'
    DataSource = DM.DataSource2
    TabOrder = 6
  end
  object BitBtn4: TBitBtn
    Left = 390
    Top = 274
    Width = 25
    Height = 25
    TabOrder = 17
    TabStop = False
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
  object RadioGroup1: TRadioGroup
    Left = 197
    Top = 26
    Width = 150
    Height = 39
    Caption = #37319#36141#22320#28857
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #22269#20869
      #22269#22806)
    TabOrder = 12
    OnClick = RadioGroup1Click
  end
  object Edit2: TEdit
    Left = 198
    Top = 75
    Width = 75
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Edit2Click
    OnExit = Edit2Exit
  end
  object DBEdit4: TDBEdit
    Left = 197
    Top = 302
    Width = 186
    Height = 21
    DataField = 'ANALYSIS_CODE_5'
    DataSource = DM.DataSource2
    TabOrder = 7
  end
  object DBEdit5: TDBEdit
    Left = 197
    Top = 327
    Width = 186
    Height = 21
    DataField = 'ANALYSIS_CODE_4'
    DataSource = DM.DataSource2
    TabOrder = 8
  end
  object DBEdit7: TDBEdit
    Left = 197
    Top = 352
    Width = 186
    Height = 21
    DataField = 'ANALYSIS_CODE_3'
    DataSource = DM.DataSource2
    TabOrder = 9
  end
end
