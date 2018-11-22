object Form9: TForm9
  Left = 383
  Top = 172
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26631#20934#37319#36141#32454#30446
  ClientHeight = 397
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
    Top = 45
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #26448#26009#21517#31216':'
  end
  object Label2: TLabel
    Left = 43
    Top = 69
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #26448#26009#35268#26684':'
  end
  object DBText1: TDBText
    Left = 111
    Top = 44
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'inv_part_number'
    DataSource = DM.DataSource2
  end
  object DBText2: TDBText
    Left = 111
    Top = 68
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'inv_part_description'
    DataSource = DM.DataSource2
  end
  object Label3: TLabel
    Left = 138
    Top = 104
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#23384#36135#21333#20301':'
  end
  object Label4: TLabel
    Left = 131
    Top = 131
    Width = 73
    Height = 13
    Alignment = taRightJustify
    Caption = '  '#37319#36141#21333#20301':'
  end
  object Label5: TLabel
    Left = 300
    Top = 104
    Width = 7
    Height = 13
  end
  object Label6: TLabel
    Left = 333
    Top = 132
    Width = 7
    Height = 13
  end
  object Label8: TLabel
    Left = 124
    Top = 160
    Width = 80
    Height = 13
    Alignment = taRightJustify
    Caption = '  '#23384#36135'/'#37319#36141':'
  end
  object Label7: TLabel
    Left = 137
    Top = 212
    Width = 67
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#21547#31246#20215':'
  end
  object Label9: TLabel
    Left = 124
    Top = 237
    Width = 80
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#20215#26684#25240#25187':'
  end
  object Label11: TLabel
    Left = 145
    Top = 271
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #20986#36135#26085#26399':'
  end
  object Label13: TLabel
    Left = 137
    Top = 303
    Width = 67
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#22686#20540#31246':'
  end
  object Label14: TLabel
    Left = 124
    Top = 184
    Width = 80
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#37319#36141#25968#37327':'
  end
  object Label15: TLabel
    Left = 280
    Top = 239
    Width = 7
    Height = 13
    Caption = '%'
    Color = cl3DLight
    ParentColor = False
  end
  object Label16: TLabel
    Left = 279
    Top = 301
    Width = 7
    Height = 13
    Caption = '%'
  end
  object Label12: TLabel
    Left = 336
    Top = 183
    Width = 73
    Height = 13
    Alignment = taRightJustify
    Caption = '  '#24211#23384#25968#37327':'
  end
  object Label17: TLabel
    Left = 35
    Top = 21
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#26448#26009#32534#30721':'
  end
  object DBText3: TDBText
    Left = 110
    Top = 20
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'partnumber'
    DataSource = DM.DataSource2
  end
  object Label18: TLabel
    Left = 336
    Top = 208
    Width = 73
    Height = 13
    Alignment = taRightJustify
    Caption = '  '#22312#36884#25968#37327':'
  end
  object Button2: TButton
    Left = 238
    Top = 356
    Width = 75
    Height = 25
    Caption = #20851#38381
    ModalResult = 2
    TabOrder = 9
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 213
    Top = 100
    Width = 79
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 213
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
    Left = 300
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
    Left = 213
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
    Left = 213
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
  object DBEdit3: TDBEdit
    Left = 213
    Top = 234
    Width = 61
    Height = 21
    Color = cl3DLight
    DataField = 'DISCOUNT'
    DataSource = DM.DataSource2
    ReadOnly = True
    TabOrder = 6
    OnClick = DBEdit3Click
    OnExit = DBEdit3Exit
  end
  object MaskEdit1: TMaskEdit
    Left = 213
    Top = 267
    Width = 123
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 7
  end
  object DBEdit5: TDBEdit
    Left = 213
    Top = 298
    Width = 62
    Height = 21
    Color = cl3DLight
    DataField = 'TAX_2'
    DataSource = DM.DataSource2
    ReadOnly = True
    TabOrder = 8
    OnClick = DBEdit5Click
    OnExit = DBEdit5Exit
  end
  object DBEdit6: TDBEdit
    Left = 213
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
    Left = 413
    Top = 180
    Width = 105
    Height = 21
    Color = cl3DLight
    DataField = 'quantity_stock'
    DataSource = DM.DataSource2
    ReadOnly = True
    TabOrder = 10
    OnClick = DBEdit6Click
    OnExit = DBEdit6Exit
  end
  object DBEdit8: TDBEdit
    Left = 413
    Top = 205
    Width = 105
    Height = 21
    Color = cl3DLight
    DataField = 'quantity_zaitu'
    DataSource = DM.DataSource2
    ReadOnly = True
    TabOrder = 11
    OnClick = DBEdit6Click
    OnExit = DBEdit6Exit
  end
end
