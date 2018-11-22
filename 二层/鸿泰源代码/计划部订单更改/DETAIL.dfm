object Form8: TForm8
  Left = 244
  Top = 211
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #38144#21806#35746#21333#32454#33410
  ClientHeight = 366
  ClientWidth = 713
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 29
    Top = 11
    Width = 96
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '   '#38144#21806#35746#21333#21495#30721':'
  end
  object Label2: TLabel
    Left = 45
    Top = 35
    Width = 80
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#36755#20837#26085#26399':'
  end
  object Label3: TLabel
    Left = 233
    Top = 83
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #22238#22797#20132#26399':'
  end
  object Label5: TLabel
    Left = 92
    Top = 111
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #23458#25143':'
  end
  object Label6: TLabel
    Left = 52
    Top = 138
    Width = 73
    Height = 13
    Alignment = taRightJustify
    Caption = '  '#26412#21378#32534#21495':'
  end
  object Label8: TLabel
    Left = 52
    Top = 167
    Width = 73
    Height = 13
    Alignment = taRightJustify
    Caption = '  '#23458#25143#22411#21495':'
  end
  object Label9: TLabel
    Left = 40
    Top = 191
    Width = 85
    Height = 13
    Alignment = taRightJustify
    Caption = #37319#36141#23450#21333#21495#30721':'
  end
  object Label10: TLabel
    Left = 40
    Top = 215
    Width = 85
    Height = 13
    Alignment = taRightJustify
    Caption = #37319#36141#23450#21333#26085#26399':'
  end
  object Label11: TLabel
    Left = 59
    Top = 239
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#20135#21697#31867#22411':'
  end
  object Label12: TLabel
    Left = 92
    Top = 263
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #36135#24065':'
  end
  object Label13: TLabel
    Left = 92
    Top = 287
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #27719#29575':'
  end
  object Label14: TLabel
    Left = 66
    Top = 311
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #23558#35201#30830#35748':'
  end
  object Bevel1: TBevel
    Left = 470
    Top = 136
    Width = 227
    Height = 200
    Shape = bsFrame
  end
  object Label15: TLabel
    Left = 531
    Top = 153
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #25968#37327':'
  end
  object Label16: TLabel
    Left = 531
    Top = 224
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #20215#26684':'
    Visible = False
  end
  object Label17: TLabel
    Left = 520
    Top = 247
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = #22686#20540#31246':'
    Visible = False
  end
  object Label18: TLabel
    Left = 533
    Top = 270
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #25240#25187':'
    Visible = False
  end
  object Label19: TLabel
    Left = 507
    Top = 293
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #29983#20135#24037#20855':'
    Visible = False
  end
  object Label20: TLabel
    Left = 533
    Top = 319
    Width = 28
    Height = 13
    Alignment = taRightJustify
    Caption = #21512#35745
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label21: TLabel
    Left = 485
    Top = 153
    Width = 26
    Height = 13
    Caption = #21512#35745
  end
  object Label22: TLabel
    Left = 66
    Top = 59
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #23458#25143#20132#26399':'
  end
  object Label23: TLabel
    Left = 66
    Top = 83
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #35745#21010#20132#26399':'
  end
  object Button1: TButton
    Left = 333
    Top = 317
    Width = 75
    Height = 25
    Caption = #20851#38381
    ModalResult = 2
    TabOrder = 0
  end
  object DBEdit1: TDBEdit
    Left = 133
    Top = 8
    Width = 94
    Height = 21
    Color = cl3DLight
    DataField = 'SALES_ORDER'
    DataSource = DM.DataSource3
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 133
    Top = 32
    Width = 95
    Height = 21
    Color = cl3DLight
    DataField = 'ENT_DATE'
    DataSource = DM.DataSource3
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 296
    Top = 80
    Width = 95
    Height = 21
    Color = cl3DLight
    DataField = 'SCH_DATE'
    DataSource = DM.DataSource3
    TabOrder = 3
  end
  object DBEdit5: TDBEdit
    Left = 133
    Top = 108
    Width = 95
    Height = 21
    Color = cl3DLight
    DataField = 'CUST_CODE'
    DataSource = DM.DataSource1
    TabOrder = 4
  end
  object DBEdit6: TDBEdit
    Left = 133
    Top = 135
    Width = 121
    Height = 21
    Color = cl3DLight
    DataField = 'MANU_PART_NUMBER'
    DataSource = DM.DataSource3
    TabOrder = 5
  end
  object DBEdit8: TDBEdit
    Left = 133
    Top = 164
    Width = 231
    Height = 21
    Color = cl3DLight
    DataField = 'MANU_PART_DESC'
    DataSource = DM.DataSource3
    TabOrder = 6
  end
  object DBEdit9: TDBEdit
    Left = 133
    Top = 188
    Width = 121
    Height = 21
    Color = cl3DLight
    DataField = 'PO_NUMBER'
    DataSource = DM.DataSource3
    TabOrder = 7
  end
  object DBEdit10: TDBEdit
    Left = 133
    Top = 212
    Width = 81
    Height = 21
    Color = cl3DLight
    DataField = 'PO_DATE'
    DataSource = DM.DataSource3
    TabOrder = 8
  end
  object DBEdit11: TDBEdit
    Left = 133
    Top = 236
    Width = 230
    Height = 21
    Color = cl3DLight
    DataField = 'PRODUCT_NAME'
    DataSource = DM.DataSource3
    TabOrder = 9
  end
  object DBEdit12: TDBEdit
    Left = 133
    Top = 260
    Width = 121
    Height = 21
    Color = cl3DLight
    DataField = 'CURR_NAME'
    DataSource = DM.DataSource3
    TabOrder = 10
  end
  object DBEdit13: TDBEdit
    Left = 133
    Top = 284
    Width = 84
    Height = 21
    Color = cl3DLight
    DataField = 'EXCH_RATE'
    DataSource = DM.DataSource3
    TabOrder = 11
  end
  object DBEdit14: TDBEdit
    Left = 133
    Top = 308
    Width = 84
    Height = 21
    Color = cl3DLight
    DataField = 'TO_BE_CONFIRMED'
    DataSource = DM.DataSource3
    TabOrder = 12
  end
  object DBEdit15: TDBEdit
    Left = 575
    Top = 149
    Width = 91
    Height = 21
    Color = cl3DLight
    DataField = 'PARTS_ORDERED'
    DataSource = DM.DataSource3
    TabOrder = 13
  end
  object DBEdit16: TDBEdit
    Left = 575
    Top = 222
    Width = 91
    Height = 21
    Color = cl3DLight
    DataField = 'PART_PRICE'
    DataSource = DM.DataSource3
    TabOrder = 14
    Visible = False
  end
  object DBEdit17: TDBEdit
    Left = 575
    Top = 244
    Width = 91
    Height = 21
    Color = cl3DLight
    DataField = 'RUSH_CHARGE'
    DataSource = DM.DataSource3
    TabOrder = 15
    Visible = False
  end
  object DBEdit18: TDBEdit
    Left = 575
    Top = 268
    Width = 91
    Height = 21
    Color = cl3DLight
    DataField = 'DISCOUNT'
    DataSource = DM.DataSource3
    TabOrder = 16
    Visible = False
  end
  object DBEdit19: TDBEdit
    Left = 575
    Top = 292
    Width = 91
    Height = 21
    Color = cl3DLight
    DataField = 'TOTAL_ADD_L_PRICE'
    DataSource = DM.DataSource3
    TabOrder = 17
    Visible = False
  end
  object BitBtn1: TBitBtn
    Left = 670
    Top = 287
    Width = 25
    Height = 25
    TabOrder = 18
    Visible = False
    OnClick = BitBtn1Click
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000120B0000120B00001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DAD0D0D0D0DA
      DADAADADADADA00DADADDADADADAD000DADAADADADADA0B70DADDADADADAD0B8
      0ADA00000000AD0B70AD0FFFFFF0DA0B80DA0F7FF8F0ADA0B70D0FFF00000000
      B00A0F7F0FF0FFF001100FFF0FF0F7F0000A44444444FFF0ADAD44444444F7F0
      DADAADAD0FFFFFF0ADADDADA44444444DADAADAD44444444ADAD}
  end
  object Edit1: TEdit
    Left = 574
    Top = 317
    Width = 92
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 19
    Visible = False
  end
  object DBEdit20: TDBEdit
    Left = 133
    Top = 56
    Width = 95
    Height = 21
    Color = cl3DLight
    DataField = 'ORIG_REQUEST_DATE'
    DataSource = DM.DataSource3
    TabOrder = 20
  end
  object DBEdit21: TDBEdit
    Left = 133
    Top = 80
    Width = 95
    Height = 21
    Color = cl3DLight
    DataField = 'ORIG_SCHED_SHIP_DATE'
    DataSource = DM.DataSource3
    TabOrder = 21
  end
end
