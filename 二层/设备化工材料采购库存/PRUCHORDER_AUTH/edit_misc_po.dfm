object Form10: TForm10
  Left = 291
  Top = 207
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26434#39033#37319#36141#32454#30446
  ClientHeight = 305
  ClientWidth = 553
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
    Left = 94
    Top = 43
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#29289#21697#21517#31216':'
  end
  object Label2: TLabel
    Left = 343
    Top = 244
    Width = 73
    Height = 13
    Alignment = taRightJustify
    Caption = '  '#24635#24080#24080#30446':'
    Visible = False
  end
  object Label3: TLabel
    Left = 427
    Top = 267
    Width = 112
    Height = 13
    Caption = '                '
    Visible = False
  end
  object Label4: TLabel
    Left = 73
    Top = 123
    Width = 87
    Height = 13
    Alignment = taRightJustify
    Caption = '    '#37319#36141#21333#20301':'
  end
  object Label5: TLabel
    Left = 106
    Top = 150
    Width = 54
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#25968#37327':'
  end
  object Label6: TLabel
    Left = 86
    Top = 177
    Width = 74
    Height = 13
    Alignment = taRightJustify
    Caption = '    '#21547#31246#20215':'
  end
  object Label7: TLabel
    Left = 73
    Top = 204
    Width = 87
    Height = 13
    Alignment = taRightJustify
    Caption = '    '#20986#36135#26085#26399':'
  end
  object Label8: TLabel
    Left = 93
    Top = 232
    Width = 67
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#22686#20540#31246':'
  end
  object Label9: TLabel
    Left = 233
    Top = 231
    Width = 7
    Height = 13
    Caption = '%'
  end
  object Label10: TLabel
    Left = 281
    Top = 122
    Width = 7
    Height = 13
  end
  object Label11: TLabel
    Left = 89
    Top = 70
    Width = 71
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #29289#21697#35268#26684':'
  end
  object Label12: TLabel
    Left = 89
    Top = 94
    Width = 71
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #29289#21697#31867#21035':'
  end
  object DBEdit1: TDBEdit
    Left = 167
    Top = 90
    Width = 186
    Height = 21
    Color = cl3DLight
    DataField = 'DESCRIPTION2'
    DataSource = DM.DataSource3
    ReadOnly = True
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 167
    Top = 39
    Width = 269
    Height = 21
    Color = cl3DLight
    DataField = 'DESCRIPTION'
    DataSource = DM.DataSource3
    ReadOnly = True
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 423
    Top = 240
    Width = 90
    Height = 21
    Enabled = False
    MaxLength = 30
    TabOrder = 2
    Visible = False
  end
  object BitBtn1: TBitBtn
    Left = 519
    Top = 238
    Width = 25
    Height = 25
    Enabled = False
    TabOrder = 3
    TabStop = False
    Visible = False
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
  object Edit2: TEdit
    Left = 167
    Top = 119
    Width = 77
    Height = 21
    Enabled = False
    MaxLength = 5
    TabOrder = 4
    OnClick = Edit2Click
  end
  object BitBtn2: TBitBtn
    Left = 251
    Top = 117
    Width = 25
    Height = 25
    Enabled = False
    TabOrder = 5
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
  object DBEdit3: TDBEdit
    Left = 167
    Top = 146
    Width = 121
    Height = 21
    Color = cl3DLight
    DataField = 'QUAN_ORD'
    DataSource = DM.DataSource3
    ReadOnly = True
    TabOrder = 6
    OnClick = DBEdit3Click
    OnExit = DBEdit3Exit
  end
  object DBEdit4: TDBEdit
    Left = 167
    Top = 173
    Width = 121
    Height = 21
    Color = cl3DLight
    DataField = 'tax_price'
    DataSource = DM.DataSource3
    ReadOnly = True
    TabOrder = 7
    OnClick = DBEdit4Click
    OnExit = DBEdit4Exit
  end
  object MaskEdit1: TMaskEdit
    Left = 168
    Top = 200
    Width = 121
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 8
  end
  object DBEdit5: TDBEdit
    Left = 168
    Top = 227
    Width = 55
    Height = 21
    Color = cl3DLight
    DataField = 'STATE_TAX'
    DataSource = DM.DataSource3
    ReadOnly = True
    TabOrder = 9
    OnClick = DBEdit5Click
    OnExit = DBEdit5Exit
  end
  object Button2: TButton
    Left = 250
    Top = 261
    Width = 75
    Height = 25
    Caption = #20851#38381
    ModalResult = 2
    TabOrder = 10
  end
  object DBEdit6: TDBEdit
    Left = 167
    Top = 66
    Width = 269
    Height = 21
    Color = cl3DLight
    DataField = 'GUI_GE'
    DataSource = DM.DataSource3
    ReadOnly = True
    TabOrder = 11
  end
end
