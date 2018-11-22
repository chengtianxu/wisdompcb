object Form10: TForm10
  Left = 358
  Top = 228
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26434#39033#37319#36141#32454#30446
  ClientHeight = 364
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
    Left = 83
    Top = 43
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #26448#26009#21517#31216':'
  end
  object Label4: TLabel
    Left = 83
    Top = 123
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #37319#36141#21333#20301':'
  end
  object Label5: TLabel
    Left = 109
    Top = 150
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #25968#37327':'
  end
  object Label6: TLabel
    Left = 68
    Top = 177
    Width = 74
    Height = 13
    Alignment = taRightJustify
    Caption = '    '#21547#31246#20215':'
  end
  object Label7: TLabel
    Left = 83
    Top = 204
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #20986#36135#26085#26399':'
  end
  object Label8: TLabel
    Left = 96
    Top = 232
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = #22686#20540#31246':'
  end
  object Label9: TLabel
    Left = 215
    Top = 231
    Width = 7
    Height = 13
    Caption = '%'
  end
  object Label10: TLabel
    Left = 263
    Top = 122
    Width = 7
    Height = 13
  end
  object Label11: TLabel
    Left = 83
    Top = 70
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #26448#26009#35268#26684':'
  end
  object Label12: TLabel
    Left = 83
    Top = 94
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #26448#26009#31867#21035':'
  end
  object Label19: TLabel
    Left = 276
    Top = 123
    Width = 59
    Height = 13
    Caption = #29615#20445#26631#35782':'
  end
  object Label13: TLabel
    Left = 291
    Top = 177
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #19981#21547#31246#20215':'
  end
  object Label22: TLabel
    Left = 82
    Top = 259
    Width = 59
    Height = 13
    Caption = #35831#36141#32534#21495':'
  end
  object Label23: TLabel
    Left = 287
    Top = 259
    Width = 59
    Height = 13
    Caption = #35831#36141#37096#38376':'
  end
  object Label24: TLabel
    Left = 81
    Top = 284
    Width = 59
    Height = 13
    Caption = #35831#36141#20154#21592':'
  end
  object DBEdit1: TDBEdit
    Left = 149
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
    Left = 149
    Top = 39
    Width = 269
    Height = 21
    Color = cl3DLight
    DataField = 'DESCRIPTION'
    DataSource = DM.DataSource3
    ReadOnly = True
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 149
    Top = 119
    Width = 77
    Height = 21
    Enabled = False
    MaxLength = 5
    TabOrder = 2
    OnClick = Edit2Click
  end
  object BitBtn2: TBitBtn
    Left = 233
    Top = 117
    Width = 25
    Height = 25
    Enabled = False
    TabOrder = 3
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
    Left = 149
    Top = 146
    Width = 121
    Height = 21
    Color = cl3DLight
    DataField = 'QUAN_ORD'
    DataSource = DM.DataSource3
    ReadOnly = True
    TabOrder = 4
    OnClick = DBEdit3Click
    OnExit = DBEdit3Exit
  end
  object DBEdit4: TDBEdit
    Left = 149
    Top = 173
    Width = 121
    Height = 21
    Color = cl3DLight
    DataField = 'tax_price'
    DataSource = DM.DataSource3
    ReadOnly = True
    TabOrder = 5
    OnClick = DBEdit4Click
    OnExit = DBEdit4Exit
  end
  object MaskEdit1: TMaskEdit
    Left = 150
    Top = 200
    Width = 121
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 6
  end
  object DBEdit5: TDBEdit
    Left = 150
    Top = 227
    Width = 55
    Height = 21
    Color = cl3DLight
    DataField = 'STATE_TAX'
    DataSource = DM.DataSource3
    ReadOnly = True
    TabOrder = 7
    OnClick = DBEdit5Click
    OnExit = DBEdit5Exit
  end
  object Button2: TButton
    Left = 232
    Top = 325
    Width = 75
    Height = 25
    Caption = #20851#38381
    ModalResult = 2
    TabOrder = 8
  end
  object DBEdit6: TDBEdit
    Left = 149
    Top = 66
    Width = 269
    Height = 21
    Color = cl3DLight
    DataField = 'GUI_GE'
    DataSource = DM.DataSource3
    ReadOnly = True
    TabOrder = 9
  end
  object DBEdit9: TDBEdit
    Left = 339
    Top = 119
    Width = 61
    Height = 21
    Color = cl3DLight
    DataField = 'rohs'
    DataSource = DM.DataSource3
    ReadOnly = True
    TabOrder = 10
    OnClick = DBEdit3Click
    OnExit = DBEdit3Exit
  end
  object DBEdit7: TDBEdit
    Left = 349
    Top = 173
    Width = 121
    Height = 21
    Color = cl3DLight
    DataField = 'UNIT_PRICE'
    DataSource = DM.DataSource3
    ReadOnly = True
    TabOrder = 11
    OnClick = DBEdit4Click
    OnExit = DBEdit4Exit
  end
  object DBCheckBox1: TDBCheckBox
    Left = 350
    Top = 148
    Width = 76
    Height = 17
    Caption = #32039#24613#29289#26009
    DataField = 'IF_urgency'
    DataSource = DM.DataSource3
    Enabled = False
    TabOrder = 12
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object DBEdit10: TDBEdit
    Left = 149
    Top = 256
    Width = 121
    Height = 21
    DataField = 'PO_REQ_NUMBER'
    DataSource = DM.DataSource3
    ReadOnly = True
    TabOrder = 13
  end
  object DBEdit11: TDBEdit
    Left = 354
    Top = 256
    Width = 121
    Height = 21
    DataField = 'DEPT_NAME'
    DataSource = DM.DataSource3
    ReadOnly = True
    TabOrder = 14
  end
  object DBEdit12: TDBEdit
    Left = 148
    Top = 281
    Width = 121
    Height = 21
    DataField = 'EMPLOYEE_NAME'
    DataSource = DM.DataSource3
    ReadOnly = True
    TabOrder = 15
  end
end
