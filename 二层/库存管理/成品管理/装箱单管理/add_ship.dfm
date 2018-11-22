object Form2: TForm2
  Left = 329
  Top = 222
  HelpType = htKeyword
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #35013#36816#25351#27966#35814#32454#20869#23481
  ClientHeight = 358
  ClientWidth = 678
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 46
    Top = 45
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#38144#21806#23450#21333':'
  end
  object Label2: TLabel
    Left = 46
    Top = 218
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#35013#36816#21495#30721':'
  end
  object Label3: TLabel
    Left = 46
    Top = 293
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#23458#25143#20195#30721':'
  end
  object Label4: TLabel
    Left = 46
    Top = 319
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#23458#25143#22995#21517':'
  end
  object Label5: TLabel
    Left = 315
    Top = 46
    Width = 92
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#37319#36141#23450#21333#21495#30721':'
  end
  object Label6: TLabel
    Left = 315
    Top = 70
    Width = 92
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#37319#36141#23450#21333#26085#26399':'
  end
  object Label8: TLabel
    Left = 53
    Top = 170
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #22238#22797#20132#26399':'
  end
  object Label9: TLabel
    Left = 46
    Top = 194
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#36135#21040#25910#27454':'
  end
  object Label10: TLabel
    Left = 53
    Top = 242
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #25351#27966#26085#26399':'
  end
  object Label11: TLabel
    Left = 46
    Top = 267
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#21512#35745#37329#39069':'
  end
  object Label13: TLabel
    Left = 341
    Top = 95
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#35013#36816#22320#28857':'
  end
  object Label14: TLabel
    Left = 367
    Top = 120
    Width = 40
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#22320#22336':'
  end
  object Label15: TLabel
    Left = 367
    Top = 194
    Width = 40
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#30465#20221':'
  end
  object Label16: TLabel
    Left = 367
    Top = 220
    Width = 40
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#37038#32534':'
  end
  object Label17: TLabel
    Left = 354
    Top = 245
    Width = 53
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#32852#32476#20154':'
  end
  object Label18: TLabel
    Left = 367
    Top = 269
    Width = 40
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#30005#35805':'
  end
  object Label12: TLabel
    Left = 46
    Top = 69
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#23450#36141#25968#37327':'
  end
  object Label19: TLabel
    Left = 46
    Top = 93
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#25351#27966#25968#37327':'
  end
  object Label20: TLabel
    Left = 46
    Top = 120
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#36864#36135#25968#37327':'
  end
  object BitBtn3: TBitBtn
    Left = 10
    Top = 7
    Width = 30
    Height = 27
    Hint = #20851#38381
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TabStop = False
    OnClick = BitBtn3Click
    Glyph.Data = {
      EE000000424DEE000000000000007600000028000000100000000F0000000100
      0400000000007800000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF0FFFFFF
      FFFFFFFF00FFFFFFFFFFFFF030FFFFFFFFFFFF0330FFFFFFFFFF003330000000
      0FFFF03330FF0FFFFFFFF03300FF0FFFF4FFF03330FF0FFF44FFF03330FF0FF4
      4444F03330FF0F444444F03330FF0FF44444F0330FFF0FFF44FFF030FFFF0FFF
      F4FFF00FFFFF0FFFFFFFF00000000FFFFFFF}
  end
  object DBEdit1: TDBEdit
    Left = 117
    Top = 42
    Width = 92
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'SALES_ORDER'
    DataSource = DM.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    ReadOnly = True
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 117
    Top = 213
    Width = 41
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'SHIPMENT_NO'
    DataSource = DM.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    ReadOnly = True
    TabOrder = 2
  end
  object DBEdit3: TDBEdit
    Left = 118
    Top = 289
    Width = 65
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'CUST_CODE'
    DataSource = DM.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    ReadOnly = True
    TabOrder = 3
  end
  object DBEdit4: TDBEdit
    Left = 118
    Top = 315
    Width = 233
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'customer_name'
    DataSource = DM.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    ReadOnly = True
    TabOrder = 4
  end
  object DBEdit5: TDBEdit
    Left = 414
    Top = 42
    Width = 121
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'PO_NUMBER'
    DataSource = DM.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    ReadOnly = True
    TabOrder = 5
  end
  object DBEdit6: TDBEdit
    Left = 414
    Top = 66
    Width = 97
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'PO_DATE'
    DataSource = DM.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    ReadOnly = True
    TabOrder = 6
  end
  object DBEdit8: TDBEdit
    Left = 117
    Top = 166
    Width = 89
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'sch_date'
    DataSource = DM.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    ReadOnly = True
    TabOrder = 7
  end
  object DBEdit9: TDBEdit
    Left = 117
    Top = 190
    Width = 33
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'cod_flag'
    DataSource = DM.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    ReadOnly = True
    TabOrder = 8
  end
  object DBEdit10: TDBEdit
    Left = 117
    Top = 238
    Width = 76
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'DATE_ASSIGN'
    DataSource = DM.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    ReadOnly = True
    TabOrder = 9
  end
  object DBEdit11: TDBEdit
    Left = 198
    Top = 264
    Width = 56
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'CURR_NAME'
    DataSource = DM.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    ReadOnly = True
    TabOrder = 10
  end
  object DBEdit12: TDBEdit
    Left = 117
    Top = 263
    Width = 76
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'total_case'
    DataSource = DM.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    ReadOnly = True
    TabOrder = 11
  end
  object DBEdit13: TDBEdit
    Left = 413
    Top = 91
    Width = 244
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'LOCATION'
    DataSource = DM.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    ReadOnly = True
    TabOrder = 12
  end
  object DBEdit14: TDBEdit
    Left = 413
    Top = 115
    Width = 244
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'SHIP_TO_ADDRESS_1'
    DataSource = DM.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    ReadOnly = True
    TabOrder = 13
  end
  object DBEdit17: TDBEdit
    Left = 413
    Top = 190
    Width = 76
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'STATE'
    DataSource = DM.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    ReadOnly = True
    TabOrder = 14
  end
  object DBEdit18: TDBEdit
    Left = 413
    Top = 216
    Width = 76
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'ZIP'
    DataSource = DM.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    ReadOnly = True
    TabOrder = 15
  end
  object DBEdit19: TDBEdit
    Left = 413
    Top = 240
    Width = 121
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'SHIP_TO_CONTACT'
    DataSource = DM.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    ReadOnly = True
    TabOrder = 16
  end
  object DBEdit20: TDBEdit
    Left = 413
    Top = 265
    Width = 121
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'SHIP_TO_PHONE'
    DataSource = DM.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    ReadOnly = True
    TabOrder = 17
  end
  object DBEdit21: TDBEdit
    Left = 117
    Top = 65
    Width = 92
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'PARTS_ORDERED'
    DataSource = DM.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    ReadOnly = True
    TabOrder = 18
  end
  object DBEdit22: TDBEdit
    Left = 117
    Top = 90
    Width = 92
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'PARTS_SHIPPED'
    DataSource = DM.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    ReadOnly = True
    TabOrder = 19
  end
  object DBEdit23: TDBEdit
    Left = 117
    Top = 114
    Width = 92
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'PARTS_RETURNED'
    DataSource = DM.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    ReadOnly = True
    TabOrder = 20
  end
end
