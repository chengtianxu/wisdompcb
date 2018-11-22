object Form10: TForm10
  Left = 343
  Top = 395
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #32534#36753#26434#39033#37319#36141
  ClientHeight = 336
  ClientWidth = 553
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 57
    Top = 25
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #29289#21697#21517#31216':'
  end
  object Label4: TLabel
    Left = 56
    Top = 115
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #37319#36141#21333#20301':'
  end
  object Label5: TLabel
    Left = 82
    Top = 144
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #25968#37327':'
  end
  object Label6: TLabel
    Left = 230
    Top = 172
    Width = 93
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#20215#26684'('#19981#21547#31246'):'
  end
  object Label7: TLabel
    Left = 56
    Top = 227
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #20132#36135#26085#26399':'
  end
  object Label8: TLabel
    Left = 69
    Top = 204
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = #22686#20540#31246':'
  end
  object Label9: TLabel
    Left = 191
    Top = 203
    Width = 7
    Height = 13
    Caption = '%'
  end
  object Label10: TLabel
    Left = 235
    Top = 114
    Width = 7
    Height = 13
  end
  object Label15: TLabel
    Left = 82
    Top = 83
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #31867#21035':'
  end
  object Label2: TLabel
    Left = 57
    Top = 51
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #29289#21697#35268#26684':'
  end
  object Label3: TLabel
    Left = 42
    Top = 173
    Width = 73
    Height = 13
    Alignment = taRightJustify
    Caption = #20215#26684'('#21547#31246'):'
  end
  object Label11: TLabel
    Left = 289
    Top = 84
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #29615#20445#26631#35782':'
  end
  object Label12: TLabel
    Left = 263
    Top = 202
    Width = 59
    Height = 13
    Caption = #35831#36141#21407#22240':'
  end
  object Label13: TLabel
    Left = 56
    Top = 254
    Width = 65
    Height = 13
    Caption = #35831#36141#32534#21495#65306
  end
  object Label14: TLabel
    Left = 264
    Top = 254
    Width = 65
    Height = 13
    Caption = #35831#36141#37096#38376#65306
  end
  object Label16: TLabel
    Left = 56
    Top = 278
    Width = 65
    Height = 13
    Caption = #35831#36141#20154#21592#65306
  end
  object DBEdit2: TDBEdit
    Left = 122
    Top = 21
    Width = 269
    Height = 21
    DataField = 'DESCRIPTION'
    DataSource = DM.DataSource4
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 121
    Top = 111
    Width = 77
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    MaxLength = 5
    ParentFont = False
    TabOrder = 4
    OnClick = Edit2Click
    OnExit = Edit2Exit
  end
  object BitBtn2: TBitBtn
    Left = 206
    Top = 109
    Width = 25
    Height = 25
    TabOrder = 5
    TabStop = False
    OnExit = BitBtn2Exit
    OnMouseDown = BitBtn2MouseDown
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
    Left = 121
    Top = 140
    Width = 121
    Height = 21
    DataField = 'QUAN_ORD'
    DataSource = DM.DataSource4
    TabOrder = 6
    OnClick = DBEdit3Click
    OnExit = DBEdit3Exit
    OnKeyPress = DBEdit5KeyPress
  end
  object DBEdit4: TDBEdit
    Left = 329
    Top = 168
    Width = 96
    Height = 21
    TabStop = False
    DataField = 'UNIT_PRICE'
    DataSource = DM.DataSource4
    Enabled = False
    TabOrder = 8
  end
  object MaskEdit1: TMaskEdit
    Left = 122
    Top = 223
    Width = 157
    Height = 21
    TabOrder = 10
    OnExit = MaskEdit1Exit
  end
  object DBEdit5: TDBEdit
    Left = 122
    Top = 199
    Width = 63
    Height = 21
    DataField = 'STATE_TAX'
    DataSource = DM.DataSource4
    TabOrder = 9
    OnClick = DBEdit5Click
    OnExit = DBEdit5Exit
    OnKeyPress = DBEdit5KeyPress
  end
  object Button1: TButton
    Left = 193
    Top = 298
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 11
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 273
    Top = 298
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 12
    OnClick = Button2Click
  end
  object DBComboBox1: TDBComboBox
    Left = 122
    Top = 80
    Width = 161
    Height = 21
    Style = csDropDownList
    DataField = 'DESCRIPTION2'
    DataSource = DM.DataSource4
    ItemHeight = 13
    TabOrder = 2
  end
  object DBEdit1: TDBEdit
    Left = 123
    Top = 48
    Width = 406
    Height = 21
    DataField = 'GUI_GE'
    DataSource = DM.DataSource4
    TabOrder = 1
  end
  object DBEdit6: TDBEdit
    Left = 121
    Top = 169
    Width = 96
    Height = 21
    DataField = 'tax_price'
    DataSource = DM.DataSource4
    TabOrder = 7
    OnClick = DBEdit4Click
    OnExit = DBEdit6Exit
    OnKeyPress = DBEdit5KeyPress
  end
  object DBComboBox2: TDBComboBox
    Left = 352
    Top = 80
    Width = 96
    Height = 21
    Style = csDropDownList
    DataField = 'rohs'
    DataSource = DM.DataSource4
    ItemHeight = 13
    Items.Strings = (
      #8544#32423
      #8545#32423)
    TabOrder = 3
  end
  object DBEdit7: TDBEdit
    Left = 328
    Top = 199
    Width = 169
    Height = 21
    DataField = 'reason'
    DataSource = DM.DataSource4
    TabOrder = 13
  end
  object DBCheckBox1: TDBCheckBox
    Left = 329
    Top = 144
    Width = 79
    Height = 17
    Caption = #32039#24613#29289#26009
    DataField = 'IF_urgency'
    DataSource = DM.DataSource4
    TabOrder = 14
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object Edit1: TEdit
    Left = 122
    Top = 250
    Width = 121
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 15
  end
  object Edit3: TEdit
    Left = 331
    Top = 250
    Width = 121
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 16
  end
  object Edit4: TEdit
    Left = 122
    Top = 274
    Width = 121
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 17
  end
  object DBCheckBox2: TDBCheckBox
    Left = 416
    Top = 144
    Width = 97
    Height = 17
    Caption = #38656#35201'IQC'#26816#39564
    DataField = 'avl_flag'
    DataSource = DM.DataSource4
    TabOrder = 18
    ValueChecked = 'Y'
    ValueUnchecked = 'N'
  end
end
