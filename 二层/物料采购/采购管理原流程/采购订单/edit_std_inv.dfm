object Form9: TForm9
  Left = 305
  Top = 173
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #32534#36753#26631#20934#37319#36141
  ClientHeight = 383
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
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 29
    Width = 68
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #26448#26009#21517#31216':'
  end
  object Label2: TLabel
    Left = 24
    Top = 48
    Width = 68
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #26448#26009#35268#26684':'
  end
  object DBText1: TDBText
    Left = 101
    Top = 28
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'inv_part_number'
    DataSource = DM.DataSource3
  end
  object DBText2: TDBText
    Left = 101
    Top = 47
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'inv_part_description'
    DataSource = DM.DataSource3
  end
  object Label3: TLabel
    Left = 136
    Top = 101
    Width = 68
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #23384#36135#21333#20301':'
  end
  object Label4: TLabel
    Left = 136
    Top = 128
    Width = 68
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #37319#36141#21333#20301':'
  end
  object Label5: TLabel
    Left = 300
    Top = 101
    Width = 7
    Height = 13
  end
  object Label6: TLabel
    Left = 333
    Top = 129
    Width = 7
    Height = 13
  end
  object Label8: TLabel
    Left = 138
    Top = 156
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = #23384#36135'/'#37319#36141':'
  end
  object Label7: TLabel
    Left = 111
    Top = 209
    Width = 93
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#21333#20215'('#19981#21547#31246'):'
  end
  object Label11: TLabel
    Left = 136
    Top = 289
    Width = 68
    Height = 14
    Alignment = taRightJustify
    AutoSize = False
    Caption = #20132#36135#26085#26399':'
  end
  object Label13: TLabel
    Left = 152
    Top = 263
    Width = 52
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #22686#20540#31246':'
  end
  object Label14: TLabel
    Left = 171
    Top = 181
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #25968#37327':'
  end
  object Label16: TLabel
    Left = 278
    Top = 261
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
    Left = 34
    Top = 70
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #29305#21035#35201#27714':'
  end
  object SpeedButton1: TSpeedButton
    Left = 37
    Top = 94
    Width = 78
    Height = 24
    Caption = #24211#23384#26597#35810
    Flat = True
    OnClick = SpeedButton1Click
  end
  object Label12: TLabel
    Left = 124
    Top = 235
    Width = 80
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#21333#20215'('#21547#31246'):'
  end
  object Label18: TLabel
    Left = 24
    Top = 10
    Width = 68
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #26448#26009#32534#30721':'
  end
  object DBText3: TDBText
    Left = 101
    Top = 9
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'inv_number'
    DataSource = DM.DataSource3
  end
  object Label19: TLabel
    Left = 145
    Top = 321
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #29615#20445#26631#35782':'
  end
  object Button1: TButton
    Left = 185
    Top = 353
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 9
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 262
    Top = 353
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 10
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 213
    Top = 97
    Width = 79
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 213
    Top = 123
    Width = 79
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
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
    Left = 300
    Top = 122
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
    Left = 213
    Top = 150
    Width = 79
    Height = 21
    DataField = 'CONVERSION_FACTOR'
    DataSource = DM.DataSource3
    TabOrder = 3
    OnKeyPress = DBEdit1KeyPress
  end
  object DBEdit2: TDBEdit
    Left = 213
    Top = 205
    Width = 121
    Height = 21
    DataField = 'PRICE'
    DataSource = DM.DataSource3
    TabOrder = 5
    OnClick = DBEdit2Click
    OnExit = DBEdit2Exit
    OnKeyPress = DBEdit1KeyPress
  end
  object MaskEdit1: TMaskEdit
    Left = 213
    Top = 284
    Width = 152
    Height = 21
    TabOrder = 7
    OnExit = MaskEdit1Exit
  end
  object DBEdit5: TDBEdit
    Left = 213
    Top = 259
    Width = 60
    Height = 21
    TabStop = False
    DataField = 'TAX_2'
    DataSource = DM.DataSource3
    Enabled = False
    TabOrder = 8
    OnClick = DBEdit5Click
    OnExit = DBEdit5Exit
    OnKeyPress = DBEdit1KeyPress
  end
  object DBEdit6: TDBEdit
    Left = 213
    Top = 177
    Width = 121
    Height = 21
    DataField = 'QUAN_ORD'
    DataSource = DM.DataSource3
    TabOrder = 4
    OnClick = DBEdit6Click
    OnExit = DBEdit6Exit
    OnKeyPress = DBEdit1KeyPress
  end
  object DBEdit7: TDBEdit
    Left = 101
    Top = 65
    Width = 133
    Height = 21
    DataField = 'extra_req'
    DataSource = DM.DataSource3
    TabOrder = 11
  end
  object DBEdit8: TDBEdit
    Left = 213
    Top = 231
    Width = 121
    Height = 21
    DataField = 'tax_price'
    DataSource = DM.DataSource3
    TabOrder = 6
    OnExit = DBEdit8Exit
    OnKeyPress = DBEdit1KeyPress
  end
  object DBEdit9: TDBEdit
    Left = 212
    Top = 317
    Width = 66
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'rohs'
    DataSource = DM.DataSource3
    ReadOnly = True
    TabOrder = 12
  end
end
