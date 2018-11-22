object Form2: TForm2
  Left = 372
  Top = 280
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20135#21697#31867#22411
  ClientHeight = 598
  ClientWidth = 550
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 100
    Top = 442
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = #20998#26512#20195#30721'1:'
  end
  object Label3: TLabel
    Left = 100
    Top = 467
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = #20998#26512#20195#30721'2:'
  end
  object Label4: TLabel
    Left = 100
    Top = 492
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = #20998#26512#20195#30721'3:'
  end
  object Label5: TLabel
    Left = 100
    Top = 518
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = #20998#26512#20195#30721'4:'
  end
  object Label6: TLabel
    Left = 100
    Top = 539
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = #20998#26512#20195#30721'5:'
  end
  object Label7: TLabel
    Left = 107
    Top = 67
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #31867#22411#20195#30721':'
  end
  object Label8: TLabel
    Left = 107
    Top = 93
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #31867#22411#21517#31216':'
  end
  object Label9: TLabel
    Left = 120
    Top = 121
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = #20135#21697#32452':'
  end
  object Label10: TLabel
    Left = 107
    Top = 176
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #29983#20135#21608#26399':'
  end
  object Label11: TLabel
    Left = 327
    Top = 176
    Width = 67
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#26368#20339#25209':'
  end
  object Label12: TLabel
    Left = 87
    Top = 202
    Width = 79
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#21046#36896#25552#21069#26399':'
  end
  object Label15: TLabel
    Left = 203
    Top = 202
    Width = 61
    Height = 13
    Alignment = taRightJustify
    Caption = '   ('#22825#25968')'
  end
  object Label16: TLabel
    Left = 203
    Top = 176
    Width = 61
    Height = 13
    Alignment = taRightJustify
    Caption = '   ('#22825#25968')'
  end
  object DBText1: TDBText
    Left = 282
    Top = 122
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'grp_name'
    DataSource = Form1.DataSource1
  end
  object Label1: TLabel
    Left = 107
    Top = 390
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #24635#24080#24080#30446':'
  end
  object Label17: TLabel
    Left = 316
    Top = 390
    Width = 7
    Height = 13
  end
  object Label18: TLabel
    Left = 435
    Top = 175
    Width = 70
    Height = 13
    Alignment = taRightJustify
    Caption = '  (Panels)'
  end
  object Label13: TLabel
    Left = 81
    Top = 290
    Width = 85
    Height = 13
    Alignment = taRightJustify
    Caption = #37327#20135#26495#25253#24223#29575':'
  end
  object Label14: TLabel
    Left = 233
    Top = 289
    Width = 14
    Height = 13
    Alignment = taRightJustify
    Caption = ' %'
  end
  object Label19: TLabel
    Left = 42
    Top = 232
    Width = 124
    Height = 13
    Alignment = taRightJustify
    Caption = #30456#21516#23618#25968#32534#21495#27969#27700#20540':'
  end
  object Label21: TLabel
    Left = 94
    Top = 315
    Width = 72
    Height = 13
    Alignment = taRightJustify
    Caption = #26679#26495#25253#24223#29575':'
  end
  object Label22: TLabel
    Left = 233
    Top = 314
    Width = 14
    Height = 13
    Alignment = taRightJustify
    Caption = ' %'
  end
  object Label23: TLabel
    Left = 282
    Top = 289
    Width = 111
    Height = 13
    Alignment = taRightJustify
    Caption = #37327#20135#26495#25253#24223#29575#19978#38480':'
  end
  object Label24: TLabel
    Left = 458
    Top = 289
    Width = 14
    Height = 13
    Alignment = taRightJustify
    Caption = ' %'
  end
  object Label25: TLabel
    Left = 294
    Top = 313
    Width = 98
    Height = 13
    Alignment = taRightJustify
    Caption = #26679#26495#25253#24223#29575#19978#38480':'
  end
  object Label26: TLabel
    Left = 458
    Top = 313
    Width = 14
    Height = 13
    Alignment = taRightJustify
    Caption = ' %'
  end
  object Label27: TLabel
    Left = 47
    Top = 341
    Width = 119
    Height = 13
    Caption = 'PTH'#23380#38075#21632#36873#25321#20559#24046':'
  end
  object Label28: TLabel
    Left = 40
    Top = 365
    Width = 126
    Height = 13
    Caption = 'NPTH'#23380#38075#21632#36873#25321#20559#24046':'
  end
  object Label29: TLabel
    Left = 82
    Top = 416
    Width = 85
    Height = 13
    Caption = #26234#33021#27969#31243#27169#22411':'
  end
  object Label30: TLabel
    Left = 316
    Top = 417
    Width = 7
    Height = 13
  end
  object Label20: TLabel
    Left = 111
    Top = 261
    Width = 59
    Height = 13
    Caption = #37327#20135#21069#32512':'
  end
  object Label31: TLabel
    Left = 332
    Top = 260
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #26679#26495#21069#32512':'
  end
  object Label32: TLabel
    Left = 274
    Top = 232
    Width = 49
    Height = 13
    Caption = '       '
  end
  object Label33: TLabel
    Left = 348
    Top = 202
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = #26377#25928#26399':'
  end
  object Label34: TLabel
    Left = 429
    Top = 202
    Width = 61
    Height = 13
    Alignment = taRightJustify
    Caption = '   ('#22825#25968')'
  end
  object Label35: TLabel
    Left = 133
    Top = 146
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #23618#25968':'
  end
  object BitBtn1: TBitBtn
    Left = 12
    Top = 8
    Width = 25
    Height = 25
    Cursor = crHandPoint
    Hint = #20445#23384
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TabStop = False
    OnClick = BitBtn1Click
    Glyph.Data = {
      56070000424D5607000000000000360400002800000028000000140000000100
      0800000000002003000000000000000000000001000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
      0303030303030303030303030303030303030303030303030303030303030303
      0303030303030303030303030303030303030303030303030303030303030303
      0303030303030303030303030303030303030303030303030303030303030303
      030303FFFFFFFFFFFFFFFFFFFFFFFF030303030303F800000000000000000000
      0000F803030303030303F8F8F8F8F8F8F8F8F8F8F8F803FF030303030300FCFC
      00F8FCFCFF070700FCFC00030303030303F8FF03F8FF0303030303F8FF03F8FF
      030303030300FCFC00F8FCFCFF070700FCFC00030303030303F8FF03F8FF0303
      030303F8FF03F8FF030303030300FCFC0007F8F807070700FCFC000303030303
      03F8FF03F8FFFFFFFFFFFFF80303F8FF030303030300FCFC0600000000000006
      FCFC00030303030303F8FF0303F8F8F8F8F8F8030303F8FF030303030300FCFC
      FCFCFCFCFCFCFCFCFCFC00030303030303F8FF0303FFFFFFFFFFFFFFFF03F8FF
      030303030300FC06000000000000000006FC00030303030303F8FF03F8F8F8F8
      F8F8F8F803FFF8FF030303030300FC00FFFFFFFFFFFFFFFF00FC000303030303
      03F8FFF8FF03030303030303F8FFF8FF030303030300FC00FFFFFFFFFFFFFFFF
      00FC00030303030303F8FFF8FF03030303030303F8FFF8FF030303030300FC00
      FFFFFFFFFFFFFFFF00FC00030303030303F8FFF8FF03030303030303F8FFF8FF
      030303030300FC00FFFFFFFFFFFFFFFF00FC00030303030303F8FFF8FF030303
      03030303F8FFF8FF0303030303000000FFFFFFFFFFFFFFFF0000000303030303
      03F8FFF8FF03030303030303F8FFF8FF030303030300FC00FFFFFFFFFFFFFFFF
      00FC00030303030303F8FFF8FFFFFFFFFFFFFFFFF8FFF8030303030303F80000
      00000000000000000000F803030303030303F8F8F8F8F8F8F8F8F8F8F8F80303
      0303030303030303030303030303030303030303030303030303030303030303
      0303030303030303030303030303030303030303030303030303030303030303
      0303030303030303030303030303030303030303030303030303030303030303
      0303030303030303030303030303030303030303030303030303}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 37
    Top = 8
    Width = 25
    Height = 25
    Cursor = crHandPoint
    Hint = #21462#28040
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TabStop = False
    OnClick = BitBtn2Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333FFFFF333333000033333388888833333333333F888888FFF333
      000033338811111188333333338833FFF388FF33000033381119999111833333
      38F338888F338FF30000339119933331111833338F388333383338F300003391
      13333381111833338F8F3333833F38F3000039118333381119118338F38F3338
      33F8F38F000039183333811193918338F8F333833F838F8F0000391833381119
      33918338F8F33833F8338F8F000039183381119333918338F8F3833F83338F8F
      000039183811193333918338F8F833F83333838F000039118111933339118338
      F3833F83333833830000339111193333391833338F33F8333FF838F300003391
      11833338111833338F338FFFF883F83300003339111888811183333338FF3888
      83FF83330000333399111111993333333388FFFFFF8833330000333333999999
      3333333333338888883333330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object DBEdit2: TDBEdit
    Left = 174
    Top = 439
    Width = 226
    Height = 21
    DataField = 'ANALYSIS_CODE1'
    DataSource = Form1.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 16
  end
  object DBEdit3: TDBEdit
    Left = 174
    Top = 464
    Width = 226
    Height = 21
    DataField = 'ANALYSIS_CODE2'
    DataSource = Form1.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 17
  end
  object DBEdit4: TDBEdit
    Left = 174
    Top = 489
    Width = 226
    Height = 21
    DataField = 'ANALYSIS_CODE3'
    DataSource = Form1.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 18
  end
  object DBEdit5: TDBEdit
    Left = 174
    Top = 514
    Width = 226
    Height = 21
    DataField = 'ANALYSIS_CODE4'
    DataSource = Form1.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 19
  end
  object DBEdit6: TDBEdit
    Left = 174
    Top = 539
    Width = 226
    Height = 21
    DataField = 'ANALYSIS_CODE5'
    DataSource = Form1.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 20
  end
  object DBEdit7: TDBEdit
    Left = 174
    Top = 172
    Width = 51
    Height = 21
    DataField = 'LEAD_TIME'
    DataSource = Form1.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 4
    OnExit = DBEdit7Exit
  end
  object DBEdit8: TDBEdit
    Left = 400
    Top = 172
    Width = 51
    Height = 21
    DataField = 'OPT_LOT_SIZE'
    DataSource = Form1.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 5
    OnExit = DBEdit7Exit
  end
  object DBEdit9: TDBEdit
    Left = 174
    Top = 198
    Width = 53
    Height = 21
    DataField = 'MAX_DAYS_EARLY_BUILD'
    DataSource = Form1.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 6
    OnExit = DBEdit7Exit
  end
  object DBEdit12: TDBEdit
    Left = 174
    Top = 65
    Width = 69
    Height = 21
    DataField = 'PROD_CODE'
    DataSource = Form1.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 2
  end
  object DBEdit13: TDBEdit
    Left = 174
    Top = 90
    Width = 226
    Height = 21
    DataField = 'PRODUCT_NAME'
    DataSource = Form1.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 3
  end
  object BitBtn3: TBitBtn
    Left = 242
    Top = 115
    Width = 25
    Height = 25
    Hint = #20135#21697#32452#25628#32034
    ParentShowHint = False
    ShowHint = True
    TabOrder = 21
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
  object DBEdit14: TDBEdit
    Left = 174
    Top = 117
    Width = 64
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'grp_code'
    DataSource = Form1.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 22
  end
  object Edit1: TEdit
    Left = 174
    Top = 386
    Width = 98
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    ParentFont = False
    TabOrder = 15
    OnClick = Edit1Click
    OnExit = Edit1Exit
  end
  object BitBtn4: TBitBtn
    Left = 282
    Top = 384
    Width = 25
    Height = 25
    Hint = #24080#30446#25628#32034
    ParentShowHint = False
    ShowHint = True
    TabOrder = 23
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
  object DBEdit1: TDBEdit
    Left = 174
    Top = 286
    Width = 51
    Height = 21
    DataField = 'EST_SCRAP'
    DataSource = Form1.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 9
  end
  object DBEdit15: TDBEdit
    Left = 174
    Top = 311
    Width = 51
    Height = 21
    DataField = 'EST_SCRAP1'
    DataSource = Form1.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 11
  end
  object DBEdit16: TDBEdit
    Left = 399
    Top = 285
    Width = 51
    Height = 21
    DataField = 'EST_SCRAP_LTM'
    DataSource = Form1.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 10
  end
  object DBEdit17: TDBEdit
    Left = 399
    Top = 309
    Width = 51
    Height = 21
    DataField = 'EST_SCRAP1_LMT'
    DataSource = Form1.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    ParentShowHint = False
    ShowHint = False
    TabOrder = 12
  end
  object DBCheckBox1: TDBCheckBox
    Left = 349
    Top = 339
    Width = 161
    Height = 17
    Caption = #37327#20135#26495#19979#21333#26102#38656#35201#25253#20215
    DataField = 'batch_flag'
    DataSource = Form1.DataSource1
    TabOrder = 24
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object DBCheckBox2: TDBCheckBox
    Left = 349
    Top = 362
    Width = 153
    Height = 17
    Caption = #26679#26495#19979#21333#26102#38656#35201#25253#20215
    DataField = 'former_flag'
    DataSource = Form1.DataSource1
    TabOrder = 25
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object DBEdit18: TDBEdit
    Left = 174
    Top = 337
    Width = 100
    Height = 21
    DataField = 'DG_ADJ_PTH'
    DataSource = Form1.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 13
  end
  object DBEdit19: TDBEdit
    Left = 174
    Top = 361
    Width = 100
    Height = 21
    DataField = 'DG_ADJ_NPTH'
    DataSource = Form1.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 14
  end
  object Edit2: TEdit
    Left = 175
    Top = 412
    Width = 97
    Height = 21
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 26
    OnExit = Edit2Exit
  end
  object BitBtn5: TBitBtn
    Left = 282
    Top = 411
    Width = 25
    Height = 25
    Hint = #24080#30446#25628#32034
    ParentShowHint = False
    ShowHint = True
    TabOrder = 27
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
  object Edit3: TEdit
    Left = 174
    Top = 228
    Width = 54
    Height = 21
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    ParentFont = False
    ReadOnly = True
    TabOrder = 28
  end
  object BitBtn6: TBitBtn
    Left = 240
    Top = 226
    Width = 26
    Height = 26
    Hint = #24080#30446#25628#32034
    ParentShowHint = False
    ShowHint = True
    TabOrder = 29
    TabStop = False
    OnClick = BitBtn6Click
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
  object DBEdit10: TDBEdit
    Left = 175
    Top = 257
    Width = 89
    Height = 21
    DataField = 'PRECHAR1'
    DataSource = Form1.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 7
  end
  object DBEdit11: TDBEdit
    Left = 400
    Top = 256
    Width = 80
    Height = 21
    DataField = 'PRECHAR2'
    DataSource = Form1.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 8
  end
  object DBEdit20: TDBEdit
    Left = 400
    Top = 198
    Width = 53
    Height = 21
    DataField = 'REVIEW_DAYS'
    DataSource = Form1.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 30
    OnExit = DBEdit7Exit
  end
  object DBRadioGroup1: TDBRadioGroup
    Left = 353
    Top = 222
    Width = 193
    Height = 31
    Caption = #23646#24615
    Columns = 2
    DataField = 'difficulty_grade'
    DataSource = Form1.DataSource1
    Items.Strings = (
      'HDI'#20135#21697
      #38750'HDI'#20135#21697)
    TabOrder = 31
    Values.Strings = (
      '0'
      '1')
  end
  object DBEdit21: TDBEdit
    Left = 173
    Top = 142
    Width = 72
    Height = 21
    DataField = 'PROD_INCREMENTBY'
    DataSource = Form1.DataSource1
    TabOrder = 32
  end
  object ADOQuery1: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'g_l_pointer'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    SQL.Strings = (
      'select gl_acc_number,gl_description'
      'from data0103'
      'where rkey=:g_l_pointer')
    Left = 13
    Top = 165
    object ADOQuery1gl_acc_number: TStringField
      FieldName = 'gl_acc_number'
      FixedChar = True
      Size = 18
    end
    object ADOQuery1gl_description: TStringField
      FieldName = 'gl_description'
      Size = 30
    end
  end
  object ADOQuery2: TADOQuery
    Connection = Form1.ADOConnection1
    Parameters = <>
    Left = 48
    Top = 165
  end
end
