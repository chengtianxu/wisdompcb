object Form8: TForm8
  Left = 208
  Top = 215
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
    Left = 246
    Top = 83
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #22238#22797#20132#26399':'
  end
  object Label5: TLabel
    Left = 92
    Top = 114
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #23458#25143':'
  end
  object Label6: TLabel
    Left = 66
    Top = 138
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #26412#21378#32534#21495':'
  end
  object Label8: TLabel
    Left = 66
    Top = 167
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #23458#25143#22411#21495':'
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
    Left = 478
    Top = 152
    Width = 227
    Height = 209
    Shape = bsFrame
  end
  object Label15: TLabel
    Left = 531
    Top = 163
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #25968#37327':'
  end
  object Label16: TLabel
    Left = 531
    Top = 186
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #20215#26684':'
  end
  object Label17: TLabel
    Left = 531
    Top = 209
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #31246#29575':'
  end
  object Label18: TLabel
    Left = 531
    Top = 232
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #25240#25187':'
  end
  object Label19: TLabel
    Left = 505
    Top = 257
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #24037#20855#36153#29992':'
  end
  object Label20: TLabel
    Left = 528
    Top = 309
    Width = 36
    Height = 13
    Alignment = taRightJustify
    Caption = #21512#35745':'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label21: TLabel
    Left = 485
    Top = 148
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
  object Label4: TLabel
    Left = 245
    Top = 11
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #35746#21333#29366#24577':'
  end
  object Label7: TLabel
    Left = 505
    Top = 337
    Width = 59
    Height = 13
    Caption = #19979#21333#38754#31215':'
  end
  object Label24: TLabel
    Left = 507
    Top = 284
    Width = 59
    Height = 13
    Caption = #24037#20855#31246#37329':'
  end
  object Label25: TLabel
    Left = 230
    Top = 36
    Width = 72
    Height = 13
    Caption = #35013#36816#32852#32476#20154':'
  end
  object Label26: TLabel
    Left = 270
    Top = 60
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #30005#35805':'
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
    Left = 309
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
    Top = 111
    Width = 95
    Height = 21
    Color = cl3DLight
    DataField = 'ABBR_NAME'
    DataSource = DM.DataSource3
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
    Width = 230
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
    Top = 159
    Width = 91
    Height = 21
    Color = cl3DLight
    DataField = 'PARTS_ORDERED'
    DataSource = DM.DataSource3
    TabOrder = 13
  end
  object DBEdit16: TDBEdit
    Left = 575
    Top = 184
    Width = 91
    Height = 21
    Color = cl3DLight
    DataField = 'PART_PRICE'
    DataSource = DM.DataSource3
    TabOrder = 14
  end
  object DBEdit17: TDBEdit
    Left = 575
    Top = 206
    Width = 91
    Height = 21
    Color = cl3DLight
    DataField = 'RUSH_CHARGE'
    DataSource = DM.DataSource3
    TabOrder = 15
  end
  object DBEdit18: TDBEdit
    Left = 575
    Top = 230
    Width = 91
    Height = 21
    Color = cl3DLight
    DataField = 'DISCOUNT'
    DataSource = DM.DataSource3
    TabOrder = 16
  end
  object DBEdit19: TDBEdit
    Left = 575
    Top = 254
    Width = 91
    Height = 21
    Color = cl3DLight
    DataField = 'TOTAL_ADD_L_PRICE'
    DataSource = DM.DataSource3
    TabOrder = 17
  end
  object BitBtn1: TBitBtn
    Left = 670
    Top = 249
    Width = 25
    Height = 25
    TabOrder = 18
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
    Left = 575
    Top = 307
    Width = 92
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 19
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
  object DBEdit3: TDBEdit
    Left = 308
    Top = 8
    Width = 94
    Height = 21
    Color = cl3DLight
    DataField = 'STATUS'
    DataSource = DM.DataSource3
    TabOrder = 22
  end
  object DBEdit7: TDBEdit
    Left = 576
    Top = 333
    Width = 89
    Height = 21
    Color = cl3DLight
    DataField = 'orders_sqft'
    DataSource = DM.DataSource3
    ReadOnly = True
    TabOrder = 23
  end
  object DBCheckBox1: TDBCheckBox
    Left = 391
    Top = 190
    Width = 75
    Height = 17
    Caption = #20215#26684#21547#31246
    DataField = 'tax_in_price'
    DataSource = DM.DataSource3
    ReadOnly = True
    TabOrder = 24
    ValueChecked = 'Y'
    ValueUnchecked = 'N'
  end
  object Edit2: TEdit
    Left = 575
    Top = 280
    Width = 91
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 25
  end
  object Edit11: TEdit
    Left = 309
    Top = 32
    Width = 121
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 26
  end
  object Edit12: TEdit
    Left = 309
    Top = 56
    Width = 121
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 27
  end
end
