object Form9: TForm9
  Left = 303
  Top = 171
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #32534#36753#26631#20934#37319#36141
  ClientHeight = 393
  ClientWidth = 535
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'ËÎÌו'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 136
    Top = 20
    Width = 68
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #26448#26009#21495#30721':'
  end
  object Label2: TLabel
    Left = 136
    Top = 47
    Width = 68
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #26448#26009#25551#36848':'
  end
  object DBText1: TDBText
    Left = 213
    Top = 19
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'inv_part_number'
    DataSource = DM.DataSource3
  end
  object DBText2: TDBText
    Left = 213
    Top = 46
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'inv_part_description'
    DataSource = DM.DataSource3
  end
  object Label3: TLabel
    Left = 136
    Top = 80
    Width = 68
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #23384#36135#21333#20301':'
  end
  object Label4: TLabel
    Left = 136
    Top = 107
    Width = 68
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #37319#36141#21333#20301':'
  end
  object Label5: TLabel
    Left = 300
    Top = 80
    Width = 7
    Height = 13
  end
  object Label6: TLabel
    Left = 333
    Top = 108
    Width = 7
    Height = 13
  end
  object Label8: TLabel
    Left = 113
    Top = 135
    Width = 91
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#23384#36135'/'#37319#36141':'
  end
  object Label7: TLabel
    Left = 148
    Top = 188
    Width = 56
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#22522#20215':'
  end
  object Label9: TLabel
    Left = 136
    Top = 214
    Width = 68
    Height = 14
    Alignment = taRightJustify
    AutoSize = False
    Caption = #20215#26684#25240#25187':'
  end
  object Label10: TLabel
    Left = 152
    Top = 241
    Width = 52
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #20928#20215#26684':'
  end
  object Label11: TLabel
    Left = 136
    Top = 269
    Width = 68
    Height = 14
    Alignment = taRightJustify
    AutoSize = False
    Caption = #20132#36135#26085#26399':'
  end
  object Label12: TLabel
    Left = 136
    Top = 296
    Width = 68
    Height = 16
    Alignment = taRightJustify
    AutoSize = False
    Caption = #35013#36816#26085#26399':'
  end
  object Label13: TLabel
    Left = 152
    Top = 323
    Width = 52
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #22686#20540#31246':'
  end
  object Label14: TLabel
    Left = 148
    Top = 160
    Width = 56
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#25968#37327':'
  end
  object Label15: TLabel
    Left = 341
    Top = 215
    Width = 7
    Height = 13
    Caption = '%'
  end
  object Label16: TLabel
    Left = 340
    Top = 321
    Width = 7
    Height = 13
    Caption = '%'
  end
  object Button1: TButton
    Left = 185
    Top = 356
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 11
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 262
    Top = 356
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 12
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 213
    Top = 76
    Width = 79
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 213
    Top = 102
    Width = 79
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'ËÎÌו'
    Font.Style = []
    MaxLength = 5
    ParentFont = False
    TabOrder = 1
    OnClick = Edit2Click
  end
  object BitBtn1: TBitBtn
    Left = 300
    Top = 101
    Width = 25
    Height = 25
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
    Top = 129
    Width = 79
    Height = 21
    DataField = 'CONVERSION_FACTOR'
    DataSource = DM.DataSource3
    TabOrder = 3
    OnKeyPress = DBEdit1KeyPress
  end
  object DBEdit2: TDBEdit
    Left = 213
    Top = 184
    Width = 121
    Height = 21
    DataField = 'PRICE'
    DataSource = DM.DataSource3
    TabOrder = 5
    OnClick = DBEdit2Click
    OnExit = DBEdit2Exit
    OnKeyPress = DBEdit1KeyPress
  end
  object DBEdit3: TDBEdit
    Left = 213
    Top = 210
    Width = 121
    Height = 21
    DataField = 'DISCOUNT'
    DataSource = DM.DataSource3
    TabOrder = 6
    OnClick = DBEdit3Click
    OnExit = DBEdit3Exit
    OnKeyPress = DBEdit1KeyPress
  end
  object DBEdit4: TDBEdit
    Left = 213
    Top = 237
    Width = 121
    Height = 21
    DataField = 'std_price'
    DataSource = DM.DataSource3
    ReadOnly = True
    TabOrder = 7
  end
  object MaskEdit1: TMaskEdit
    Left = 213
    Top = 264
    Width = 84
    Height = 21
    EditMask = '!0000-!90-90;1;_'
    MaxLength = 10
    TabOrder = 8
    Text = '    -  -  '
    OnExit = MaskEdit1Exit
  end
  object MaskEdit2: TMaskEdit
    Left = 213
    Top = 291
    Width = 84
    Height = 21
    EditMask = '!0000-!90-90;1;_'
    MaxLength = 10
    TabOrder = 9
    Text = '    -  -  '
    OnExit = MaskEdit2Exit
  end
  object DBEdit5: TDBEdit
    Left = 213
    Top = 318
    Width = 121
    Height = 21
    DataField = 'TAX_2'
    DataSource = DM.DataSource3
    TabOrder = 10
    OnClick = DBEdit5Click
    OnExit = DBEdit5Exit
    OnKeyPress = DBEdit1KeyPress
  end
  object DBEdit6: TDBEdit
    Left = 213
    Top = 156
    Width = 121
    Height = 21
    DataField = 'QUAN_ORD'
    DataSource = DM.DataSource3
    TabOrder = 4
    OnClick = DBEdit6Click
    OnExit = DBEdit6Exit
    OnKeyPress = DBEdit1KeyPress
  end
end
