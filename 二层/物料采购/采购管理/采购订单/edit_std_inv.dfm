object Form9: TForm9
  Left = 521
  Top = 228
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #32534#36753#26631#20934#37319#36141
  ClientHeight = 473
  ClientWidth = 547
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 33
    Top = 37
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #26448#26009#21517#31216':'
  end
  object Label2: TLabel
    Left = 33
    Top = 60
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #26448#26009#35268#26684':'
  end
  object DBText1: TDBText
    Left = 101
    Top = 36
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'inv_part_number'
    DataSource = DM.DataSource3
  end
  object DBText2: TDBText
    Left = 101
    Top = 59
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'inv_part_description'
    DataSource = DM.DataSource3
  end
  object Label3: TLabel
    Left = 134
    Top = 145
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #23384#36135#21333#20301':'
  end
  object Label4: TLabel
    Left = 134
    Top = 172
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #37319#36141#21333#20301':'
  end
  object Label5: TLabel
    Left = 289
    Top = 145
    Width = 7
    Height = 13
  end
  object Label6: TLabel
    Left = 322
    Top = 172
    Width = 7
    Height = 13
  end
  object Label8: TLabel
    Left = 127
    Top = 200
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = #23384#36135'/'#37319#36141':'
  end
  object Label7: TLabel
    Left = 107
    Top = 253
    Width = 86
    Height = 13
    Alignment = taRightJustify
    Caption = #21333#20215'('#19981#21547#31246'):'
  end
  object Label11: TLabel
    Left = 134
    Top = 329
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #20132#36135#26085#26399':'
  end
  object Label13: TLabel
    Left = 147
    Top = 304
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = #22686#20540#31246':'
  end
  object Label14: TLabel
    Left = 160
    Top = 225
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #25968#37327':'
  end
  object Label16: TLabel
    Left = 267
    Top = 302
    Width = 8
    Height = 16
    Caption = '%'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label17: TLabel
    Left = 36
    Top = 115
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #29305#21035#35201#27714':'
  end
  object Label12: TLabel
    Left = 113
    Top = 279
    Width = 80
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#21333#20215'('#21547#31246'):'
  end
  object Label18: TLabel
    Left = 33
    Top = 17
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #26448#26009#32534#30721':'
  end
  object DBText3: TDBText
    Left = 101
    Top = 16
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'inv_number'
    DataSource = DM.DataSource3
  end
  object Label19: TLabel
    Left = 134
    Top = 356
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #29615#20445#26631#35782':'
  end
  object Label9: TLabel
    Left = 253
    Top = 114
    Width = 59
    Height = 13
    Caption = #35831#36141#21407#22240':'
  end
  object Label10: TLabel
    Left = 383
    Top = 143
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #37325#35201#26631#35782':'
  end
  object DBText4: TDBText
    Left = 451
    Top = 142
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'CRITICAL_MATL'
    DataSource = DM.DataSource3
  end
  object Label15: TLabel
    Left = 304
    Top = 356
    Width = 41
    Height = 13
    Alignment = taRightJustify
    Caption = #32784'CAF:'
  end
  object DBText5: TDBText
    Left = 453
    Top = 166
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'CATALOG_NUM'
    DataSource = DM.DataSource3
  end
  object Label20: TLabel
    Left = 385
    Top = 166
    Width = 59
    Height = 13
    Caption = #29615#20445#35748#21487':'
  end
  object SpeedButton1: TSpeedButton
    Left = 16
    Top = 149
    Width = 89
    Height = 33
    Caption = #24211#23384#26597#35810
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 16
    Top = 182
    Width = 89
    Height = 33
    Caption = #22312#36884#26597#35810
    OnClick = SpeedButton2Click
  end
  object SpeedButton3: TSpeedButton
    Left = 16
    Top = 216
    Width = 89
    Height = 33
    Caption = #21382#21490#20215#26684
    OnClick = SpeedButton3Click
  end
  object Label21: TLabel
    Left = 135
    Top = 382
    Width = 65
    Height = 13
    Caption = #35831#36141#32534#21495#65306
  end
  object Label22: TLabel
    Left = 347
    Top = 382
    Width = 59
    Height = 13
    Caption = #35831#36141#37096#38376':'
  end
  object Label23: TLabel
    Left = 135
    Top = 406
    Width = 65
    Height = 13
    Caption = #35831#36141#20154#21592#65306
  end
  object Label24: TLabel
    Left = 33
    Top = 83
    Width = 65
    Height = 13
    Caption = #26368#39640#24211#23384#65306
  end
  object Label25: TLabel
    Left = 256
    Top = 82
    Width = 65
    Height = 13
    Caption = #23433#20840#24211#23384#65306
  end
  object Label26: TLabel
    Left = 310
    Top = 305
    Width = 72
    Height = 13
    Alignment = taRightJustify
    Caption = #21697#29260#20379#24212#21830':'
  end
  object Button1: TButton
    Left = 185
    Top = 430
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 9
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 262
    Top = 430
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 10
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 202
    Top = 141
    Width = 79
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 202
    Top = 167
    Width = 79
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    MaxLength = 5
    ParentFont = False
    TabOrder = 1
    OnClick = Edit2Click
    OnExit = Edit2Exit
  end
  object BitBtn1: TBitBtn
    Left = 289
    Top = 166
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
  object DBEdit1: TDBEdit
    Left = 202
    Top = 194
    Width = 79
    Height = 21
    DataField = 'CONVERSION_FACTOR'
    DataSource = DM.DataSource3
    TabOrder = 3
  end
  object DBEdit2: TDBEdit
    Left = 202
    Top = 249
    Width = 121
    Height = 21
    DataField = 'PRICE'
    DataSource = DM.DataSource3
    TabOrder = 5
    OnClick = DBEdit2Click
    OnExit = DBEdit2Exit
  end
  object MaskEdit1: TMaskEdit
    Left = 202
    Top = 324
    Width = 126
    Height = 21
    TabOrder = 7
    OnExit = MaskEdit1Exit
  end
  object DBEdit5: TDBEdit
    Left = 202
    Top = 300
    Width = 60
    Height = 21
    TabStop = False
    DataField = 'TAX_2'
    DataSource = DM.DataSource3
    Enabled = False
    TabOrder = 8
  end
  object DBEdit6: TDBEdit
    Left = 202
    Top = 221
    Width = 121
    Height = 21
    DataField = 'QUAN_ORD'
    DataSource = DM.DataSource3
    TabOrder = 4
    OnClick = DBEdit6Click
    OnExit = DBEdit6Exit
  end
  object DBEdit7: TDBEdit
    Left = 101
    Top = 112
    Width = 133
    Height = 21
    DataField = 'extra_req'
    DataSource = DM.DataSource3
    TabOrder = 11
  end
  object DBEdit8: TDBEdit
    Left = 202
    Top = 275
    Width = 121
    Height = 21
    DataField = 'tax_price'
    DataSource = DM.DataSource3
    TabOrder = 6
    OnExit = DBEdit8Exit
  end
  object DBEdit9: TDBEdit
    Left = 201
    Top = 352
    Width = 66
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'rohs'
    DataSource = DM.DataSource3
    ReadOnly = True
    TabOrder = 13
  end
  object DBEdit3: TDBEdit
    Left = 320
    Top = 111
    Width = 169
    Height = 21
    DataField = 'reason'
    DataSource = DM.DataSource3
    TabOrder = 12
  end
  object DBEdit4: TDBEdit
    Left = 353
    Top = 352
    Width = 66
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'IF_CAF'
    DataSource = DM.DataSource3
    ReadOnly = True
    TabOrder = 14
  end
  object DBCheckBox1: TDBCheckBox
    Left = 391
    Top = 222
    Width = 76
    Height = 17
    Caption = #32039#24613#29289#26009
    DataField = 'IF_urgency'
    DataSource = DM.DataSource3
    TabOrder = 15
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object Edit3: TEdit
    Left = 201
    Top = 378
    Width = 121
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 16
  end
  object Edit4: TEdit
    Left = 410
    Top = 378
    Width = 121
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 17
  end
  object Edit5: TEdit
    Left = 201
    Top = 402
    Width = 121
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 18
  end
  object DBEdit10: TDBEdit
    Left = 102
    Top = 80
    Width = 121
    Height = 21
    DataField = 'REPORT_VALUE2'
    DataSource = DM.DataSource3
    Enabled = False
    TabOrder = 19
  end
  object DBEdit11: TDBEdit
    Left = 320
    Top = 80
    Width = 121
    Height = 21
    DataField = 'CONSIGN_ONHAND_QTY'
    DataSource = DM.DataSource3
    Enabled = False
    TabOrder = 20
  end
  object DBCheckBox2: TDBCheckBox
    Left = 390
    Top = 248
    Width = 97
    Height = 17
    Caption = #38656#35201'IQC'#26816#39564
    DataField = 'avl_flag'
    DataSource = DM.DataSource3
    ReadOnly = True
    TabOrder = 21
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object DBEdit12: TDBEdit
    Left = 386
    Top = 301
    Width = 97
    Height = 21
    Hint = #21452#20987#21024#38500
    DataField = 'ORIG_ABBRNAME'
    DataSource = DM.DataSource3
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 22
    OnDblClick = DBEdit12DblClick
  end
  object BitBtn5: TBitBtn
    Left = 485
    Top = 299
    Width = 25
    Height = 25
    TabOrder = 23
    TabStop = False
    OnClick = BitBtn5Click
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
