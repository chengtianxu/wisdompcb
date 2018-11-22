object Form3: TForm3
  Left = 620
  Top = 321
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #22686#21152'/'#32534#36753#26631#20934#35831#27714#39033#30446
  ClientHeight = 508
  ClientWidth = 499
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 90
    Top = 24
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #24037#21378':'
  end
  object Label2: TLabel
    Left = 77
    Top = 56
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = #21407#26448#26009':'
  end
  object Label3: TLabel
    Left = 77
    Top = 139
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = #20379#24212#21830':'
  end
  object Label4: TLabel
    Left = 52
    Top = 406
    Width = 71
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '   '#37319#36141#21333#20301':'
  end
  object Label5: TLabel
    Left = 64
    Top = 301
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #37319#36141#25968#37327':'
  end
  object Label6: TLabel
    Left = 30
    Top = 330
    Width = 93
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#20215#26684'('#19981#21547#31246'):'
  end
  object Label7: TLabel
    Left = 38
    Top = 247
    Width = 85
    Height = 13
    Alignment = taRightJustify
    Caption = #35201#27714#21040#36135#26085#26399':'
  end
  object Label8: TLabel
    Left = 77
    Top = 79
    Width = 7
    Height = 13
  end
  object Label9: TLabel
    Left = 254
    Top = 140
    Width = 7
    Height = 13
  end
  object DBText1: TDBText
    Left = 227
    Top = 406
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'unit_name'
    DataSource = DM.DataSource3
  end
  object Label10: TLabel
    Left = -1
    Top = 429
    Width = 126
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#23384#36135'/'#37319#36141'('#36716#25442#29575'):'
  end
  object Label11: TLabel
    Left = 270
    Top = 331
    Width = 38
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '   '#36135#24065':'
  end
  object DBText2: TDBText
    Left = 318
    Top = 329
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'curr_name'
    DataSource = DM.DataSource3
  end
  object Label12: TLabel
    Left = 39
    Top = 273
    Width = 84
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #22238#22797#20132#36135#26399':'
  end
  object Label13: TLabel
    Left = 64
    Top = 383
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #35831#36141#21407#22240':'
  end
  object Label14: TLabel
    Left = 66
    Top = 108
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #29305#21035#35201#27714':'
  end
  object avl_flag: TLabel
    Left = 52
    Top = 56
    Width = 7
    Height = 13
    Caption = 'N'
    Visible = False
  end
  object Label15: TLabel
    Left = 43
    Top = 356
    Width = 80
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#20215#26684'('#21547#31246'):'
  end
  object Label16: TLabel
    Left = 261
    Top = 357
    Width = 47
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#31246#29575'%:'
  end
  object DBText3: TDBText
    Left = 318
    Top = 356
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'tax'
    DataSource = DM.DataSource3
  end
  object Label17: TLabel
    Left = 248
    Top = 302
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #29615#20445#31561#32423':'
  end
  object Label18: TLabel
    Left = 304
    Top = 110
    Width = 59
    Height = 13
    Caption = #37325#35201#29289#26009':'
  end
  object DBText4: TDBText
    Left = 368
    Top = 110
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'CRITICAL_MATL'
    DataSource = DM.DataSource3
  end
  object Label19: TLabel
    Left = 387
    Top = 302
    Width = 41
    Height = 13
    Alignment = taRightJustify
    Caption = #32784'CAF:'
  end
  object Label20: TLabel
    Left = 63
    Top = 167
    Width = 65
    Height = 13
    Caption = #20215#26684#22791#27880#65306
  end
  object Label21: TLabel
    Left = 133
    Top = 167
    Width = 56
    Height = 13
    Caption = '        '
  end
  object lbl1: TLabel
    Left = 25
    Top = 221
    Width = 98
    Height = 13
    Alignment = taRightJustify
    Caption = #35831#36141#26102#38656#27714#25968#37327':'
  end
  object Label22: TLabel
    Left = 245
    Top = 220
    Width = 72
    Height = 13
    Alignment = taRightJustify
    Caption = #21697#29260#20379#24212#21830':'
  end
  object Edit1: TEdit
    Left = 131
    Top = 21
    Width = 289
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 132
    Top = 52
    Width = 160
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    MaxLength = 25
    ParentFont = False
    TabOrder = 5
    OnClick = Edit2Click
    OnExit = Edit2Exit
    OnKeyDown = Edit2KeyDown
  end
  object BitBtn3: TBitBtn
    Left = 298
    Top = 50
    Width = 25
    Height = 25
    TabOrder = 4
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
  object Edit3: TEdit
    Left = 132
    Top = 135
    Width = 81
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    TabOrder = 9
    OnClick = Edit3Click
    OnExit = Edit3Exit
    OnKeyDown = Edit3KeyDown
    OnKeyPress = Edit3KeyPress
  end
  object BitBtn4: TBitBtn
    Left = 220
    Top = 133
    Width = 25
    Height = 25
    TabOrder = 8
    TabStop = False
    OnClick = BitBtn4Click
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
    Left = 132
    Top = 297
    Width = 107
    Height = 21
    DataField = 'QUANTITY'
    DataSource = DM.DataSource3
    TabOrder = 15
    OnExit = DBEdit1Exit
    OnKeyDown = DBEdit1KeyDown
    OnKeyPress = DBEdit2KeyPress
  end
  object DBEdit2: TDBEdit
    Left = 132
    Top = 326
    Width = 107
    Height = 21
    DataField = 'UNIT_PRICE'
    DataSource = DM.DataSource3
    ParentShowHint = False
    ShowHint = True
    TabOrder = 18
    OnExit = DBEdit2Exit
    OnKeyDown = DBEdit2KeyDown
    OnKeyPress = DBEdit2KeyPress
  end
  object MaskEdit1: TMaskEdit
    Left = 132
    Top = 244
    Width = 154
    Height = 21
    TabOrder = 12
    OnExit = MaskEdit1Exit
    OnKeyDown = MaskEdit1KeyDown
  end
  object Button1: TButton
    Left = 180
    Top = 460
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 23
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 260
    Top = 460
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 25
    OnClick = Button2Click
  end
  object DBEdit3: TDBEdit
    Left = 133
    Top = 402
    Width = 85
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'unit_code'
    DataSource = DM.DataSource3
    ReadOnly = True
    TabOrder = 21
  end
  object DBEdit4: TDBEdit
    Left = 133
    Top = 426
    Width = 86
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'CONVERSION_FACTOR'
    DataSource = DM.DataSource3
    ReadOnly = True
    TabOrder = 22
  end
  object DBRadioGroup1: TDBRadioGroup
    Left = 313
    Top = 252
    Width = 138
    Height = 38
    Caption = #37319#36141#35746#21333#26684#24335
    Columns = 2
    DataField = 'o_i_flag'
    DataSource = DM.DataSource3
    Items.Strings = (
      #26684#24335#19968
      #26684#24335#20108)
    TabOrder = 13
    Values.Strings = (
      '0'
      '1')
  end
  object MaskEdit2: TMaskEdit
    Left = 132
    Top = 270
    Width = 154
    Height = 21
    TabOrder = 14
    OnExit = MaskEdit2Exit
    OnKeyDown = MaskEdit2KeyDown
  end
  object DBEdit5: TDBEdit
    Left = 132
    Top = 378
    Width = 290
    Height = 21
    DataField = 'reason'
    DataSource = DM.DataSource3
    TabOrder = 20
    OnKeyDown = DBEdit5KeyDown
  end
  object Button3: TButton
    Left = 220
    Top = 460
    Width = 75
    Height = 25
    Caption = #20851#38381
    ModalResult = 1
    TabOrder = 24
    Visible = False
  end
  object BitBtn1: TBitBtn
    Left = 325
    Top = 49
    Width = 57
    Height = 27
    Caption = #21382#21490#20215#26684
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object DBEdit6: TDBEdit
    Left = 132
    Top = 104
    Width = 162
    Height = 21
    DataField = 'extra_req'
    DataSource = DM.DataSource3
    TabOrder = 6
  end
  object Button4: TButton
    Left = 383
    Top = 49
    Width = 57
    Height = 27
    Caption = #24211#23384#26597#35810
    TabOrder = 2
    OnClick = Button4Click
  end
  object DBEdit7: TDBEdit
    Left = 132
    Top = 352
    Width = 107
    Height = 21
    DataField = 'tax_price'
    DataSource = DM.DataSource3
    ParentShowHint = False
    ShowHint = True
    TabOrder = 19
    OnExit = DBEdit7Exit
    OnKeyDown = DBEdit7KeyDown
    OnKeyPress = DBEdit2KeyPress
  end
  object DBEdit8: TDBEdit
    Left = 313
    Top = 298
    Width = 59
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'rohs'
    DataSource = DM.DataSource3
    ReadOnly = True
    TabOrder = 16
  end
  object Button5: TButton
    Left = 441
    Top = 49
    Width = 57
    Height = 27
    Caption = #22312#36884#26597#35810
    TabOrder = 3
    OnClick = Button5Click
  end
  object DBEdit9: TDBEdit
    Left = 434
    Top = 298
    Width = 55
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'IF_CAF'
    DataSource = DM.DataSource3
    ReadOnly = True
    TabOrder = 17
  end
  object CheckBox1: TCheckBox
    Left = 400
    Top = 108
    Width = 76
    Height = 17
    Caption = #29615#20445#35748#21487
    Enabled = False
    TabOrder = 7
  end
  object dbchkIF_urgency: TDBCheckBox
    Left = 132
    Top = 192
    Width = 97
    Height = 17
    Caption = #26159#21542#32039#24613#29289#26009
    DataField = 'IF_urgency'
    DataSource = DM.DataSource3
    TabOrder = 10
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object dbedtQUANTITY: TDBEdit
    Left = 132
    Top = 217
    Width = 107
    Height = 21
    Color = cl3DLight
    DataField = 'req_quantity'
    DataSource = DM.DataSource3
    Enabled = False
    TabOrder = 11
  end
  object DBEdit10: TDBEdit
    Left = 320
    Top = 216
    Width = 121
    Height = 21
    Hint = #21452#20987#21024#38500
    DataField = 'ORIG_ABBRNAME'
    DataSource = DM.DataSource3
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 26
    OnDblClick = DBEdit10DblClick
  end
  object BitBtn2: TBitBtn
    Left = 444
    Top = 213
    Width = 25
    Height = 25
    TabOrder = 27
    TabStop = False
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
end
