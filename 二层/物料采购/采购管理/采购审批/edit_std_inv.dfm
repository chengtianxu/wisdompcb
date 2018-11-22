object Form9: TForm9
  Left = 383
  Top = 172
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26631#20934#37319#36141#32454#30446
  ClientHeight = 427
  ClientWidth = 535
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 43
    Top = 33
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #26448#26009#21517#31216':'
  end
  object Label2: TLabel
    Left = 43
    Top = 54
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #26448#26009#35268#26684':'
  end
  object DBText1: TDBText
    Left = 111
    Top = 32
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'inv_part_number'
    DataSource = DM.DataSource2
  end
  object DBText2: TDBText
    Left = 111
    Top = 53
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'inv_part_description'
    DataSource = DM.DataSource2
  end
  object Label3: TLabel
    Left = 34
    Top = 104
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#23384#36135#21333#20301':'
  end
  object Label4: TLabel
    Left = 41
    Top = 131
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #37319#36141#21333#20301':'
  end
  object Label5: TLabel
    Left = 196
    Top = 104
    Width = 7
    Height = 13
  end
  object Label6: TLabel
    Left = 229
    Top = 132
    Width = 7
    Height = 13
  end
  object Label8: TLabel
    Left = 34
    Top = 158
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = #23384#36135'/'#37319#36141':'
  end
  object Label7: TLabel
    Left = 54
    Top = 212
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = #21547#31246#20215':'
  end
  object Label11: TLabel
    Left = 41
    Top = 261
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #20986#36135#26085#26399':'
  end
  object Label13: TLabel
    Left = 54
    Top = 287
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = #22686#20540#31246':'
  end
  object Label14: TLabel
    Left = 41
    Top = 183
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #37319#36141#25968#37327':'
  end
  object Label16: TLabel
    Left = 175
    Top = 285
    Width = 7
    Height = 13
    Caption = '%'
  end
  object Label12: TLabel
    Left = 246
    Top = 183
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #24211#23384#25968#37327':'
  end
  object Label17: TLabel
    Left = 35
    Top = 9
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#26448#26009#32534#30721':'
  end
  object DBText3: TDBText
    Left = 110
    Top = 8
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'partnumber'
    DataSource = DM.DataSource2
  end
  object Label18: TLabel
    Left = 246
    Top = 208
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #22312#36884#25968#37327':'
  end
  object Label19: TLabel
    Left = 42
    Top = 313
    Width = 59
    Height = 13
    Caption = #29615#20445#26631#35782':'
  end
  object DBText4: TDBText
    Left = 311
    Top = 157
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'CRITICAL_MATL'
    DataSource = DM.DataSource2
  end
  object Label9: TLabel
    Left = 246
    Top = 158
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #37325#35201#26631#35782':'
  end
  object Label10: TLabel
    Left = 253
    Top = 261
    Width = 106
    Height = 13
    Caption = 'IQC'#26469#26009#26816#26597#26631#35782':'
  end
  object DBText5: TDBText
    Left = 365
    Top = 261
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'avl_flag'
    DataSource = DM.DataSource2
  end
  object Label15: TLabel
    Left = 41
    Top = 236
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #19981#21547#31246#20215':'
  end
  object Label20: TLabel
    Left = 263
    Top = 313
    Width = 41
    Height = 13
    Caption = #32784'CAF:'
  end
  object Label21: TLabel
    Left = 43
    Top = 77
    Width = 59
    Height = 13
    Caption = #29305#21035#35201#27714':'
  end
  object DBText6: TDBText
    Left = 112
    Top = 76
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'extra_req'
    DataSource = DM.DataSource2
  end
  object Label22: TLabel
    Left = 42
    Top = 339
    Width = 59
    Height = 13
    Caption = #35831#36141#32534#21495':'
  end
  object Label23: TLabel
    Left = 247
    Top = 339
    Width = 59
    Height = 13
    Caption = #35831#36141#37096#38376':'
  end
  object Label24: TLabel
    Left = 41
    Top = 364
    Width = 59
    Height = 13
    Caption = #35831#36141#20154#21592':'
  end
  object Button2: TButton
    Left = 233
    Top = 396
    Width = 75
    Height = 25
    Cancel = True
    Caption = #20851#38381
    ModalResult = 2
    TabOrder = 8
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 109
    Top = 100
    Width = 79
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 109
    Top = 126
    Width = 79
    Height = 21
    Enabled = False
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    MaxLength = 5
    ParentFont = False
    TabOrder = 1
    OnClick = Edit2Click
  end
  object BitBtn1: TBitBtn
    Left = 196
    Top = 125
    Width = 25
    Height = 25
    Enabled = False
    TabOrder = 2
    TabStop = False
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
    Left = 109
    Top = 153
    Width = 79
    Height = 21
    Color = cl3DLight
    DataField = 'CONVERSION_FACTOR'
    DataSource = DM.DataSource2
    ReadOnly = True
    TabOrder = 3
  end
  object DBEdit2: TDBEdit
    Left = 109
    Top = 208
    Width = 121
    Height = 21
    Color = cl3DLight
    DataField = 'tax_price'
    DataSource = DM.DataSource2
    ReadOnly = True
    TabOrder = 5
    OnClick = DBEdit2Click
    OnExit = DBEdit2Exit
  end
  object MaskEdit1: TMaskEdit
    Left = 109
    Top = 256
    Width = 122
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 6
  end
  object DBEdit5: TDBEdit
    Left = 109
    Top = 282
    Width = 62
    Height = 21
    Color = cl3DLight
    DataField = 'TAX_2'
    DataSource = DM.DataSource2
    ReadOnly = True
    TabOrder = 7
    OnClick = DBEdit5Click
    OnExit = DBEdit5Exit
  end
  object DBEdit6: TDBEdit
    Left = 109
    Top = 180
    Width = 121
    Height = 21
    Color = cl3DLight
    DataField = 'QUAN_ORD'
    DataSource = DM.DataSource2
    ReadOnly = True
    TabOrder = 4
    OnClick = DBEdit6Click
    OnExit = DBEdit6Exit
  end
  object DBEdit7: TDBEdit
    Left = 309
    Top = 180
    Width = 105
    Height = 21
    Color = cl3DLight
    DataField = 'quantity_stock'
    DataSource = DM.DataSource2
    ReadOnly = True
    TabOrder = 9
    OnClick = DBEdit6Click
    OnExit = DBEdit6Exit
  end
  object DBEdit8: TDBEdit
    Left = 309
    Top = 205
    Width = 105
    Height = 21
    Color = cl3DLight
    DataField = 'quantity_zaitu'
    DataSource = DM.DataSource2
    ReadOnly = True
    TabOrder = 10
    OnClick = DBEdit6Click
    OnExit = DBEdit6Exit
  end
  object DBEdit9: TDBEdit
    Left = 109
    Top = 310
    Width = 61
    Height = 21
    Color = cl3DLight
    DataField = 'rohs'
    DataSource = DM.DataSource2
    ReadOnly = True
    TabOrder = 11
  end
  object DBEdit3: TDBEdit
    Left = 109
    Top = 232
    Width = 121
    Height = 21
    Color = cl3DLight
    DataField = 'PRICE'
    DataSource = DM.DataSource2
    ReadOnly = True
    TabOrder = 12
    OnClick = DBEdit2Click
    OnExit = DBEdit2Exit
  end
  object DBCheckBox1: TDBCheckBox
    Left = 313
    Top = 288
    Width = 78
    Height = 17
    Caption = #32039#24613#29289#26009
    DataField = 'IF_urgency'
    DataSource = DM.DataSource2
    Enabled = False
    TabOrder = 13
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object DBEdit4: TDBEdit
    Left = 314
    Top = 309
    Width = 51
    Height = 21
    DataField = 'IF_CAF'
    DataSource = DM.DataSource2
    Enabled = False
    TabOrder = 14
  end
  object DBEdit10: TDBEdit
    Left = 109
    Top = 336
    Width = 121
    Height = 21
    DataField = 'PO_REQ_NUMBER'
    DataSource = DM.DataSource2
    ReadOnly = True
    TabOrder = 15
  end
  object DBEdit11: TDBEdit
    Left = 314
    Top = 336
    Width = 121
    Height = 21
    DataField = 'DEPT_NAME'
    DataSource = DM.DataSource2
    ReadOnly = True
    TabOrder = 16
  end
  object DBEdit12: TDBEdit
    Left = 108
    Top = 361
    Width = 121
    Height = 21
    DataField = 'EMPLOYEE_NAME'
    DataSource = DM.DataSource2
    ReadOnly = True
    TabOrder = 17
  end
end
