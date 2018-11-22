object Form10: TForm10
  Left = 270
  Top = 225
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #32534#36753#26434#39033#37319#36141
  ClientHeight = 291
  ClientWidth = 553
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 88
    Top = 36
    Width = 73
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '   '#29289#21697#21517#31216':'
  end
  object Label4: TLabel
    Left = 90
    Top = 119
    Width = 71
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '    '#37319#36141#21333#20301':'
  end
  object Label5: TLabel
    Left = 115
    Top = 148
    Width = 46
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '   '#25968#37327':'
  end
  object Label6: TLabel
    Left = 118
    Top = 175
    Width = 43
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '    '#20215#26684':'
  end
  object Label7: TLabel
    Left = 89
    Top = 202
    Width = 72
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '    '#20132#36135#26085#26399':'
  end
  object Label8: TLabel
    Left = 104
    Top = 230
    Width = 57
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '   '#22686#20540#31246':'
  end
  object Label9: TLabel
    Left = 296
    Top = 229
    Width = 7
    Height = 13
    Caption = '%'
  end
  object Label10: TLabel
    Left = 281
    Top = 118
    Width = 7
    Height = 13
  end
  object Label15: TLabel
    Left = 118
    Top = 87
    Width = 43
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '   '#31867#21035':'
  end
  object Label2: TLabel
    Left = 120
    Top = 62
    Width = 41
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #35268#26684':'
  end
  object DBEdit2: TDBEdit
    Left = 167
    Top = 32
    Width = 269
    Height = 21
    DataField = 'DESCRIPTION'
    DataSource = DM.DataSource4
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 167
    Top = 115
    Width = 77
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'ËÎÌו'
    Font.Style = []
    MaxLength = 5
    ParentFont = False
    TabOrder = 3
    OnClick = Edit2Click
  end
  object BitBtn2: TBitBtn
    Left = 252
    Top = 113
    Width = 25
    Height = 25
    TabOrder = 4
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
    Top = 144
    Width = 121
    Height = 21
    DataField = 'QUAN_ORD'
    DataSource = DM.DataSource4
    TabOrder = 5
    OnClick = DBEdit3Click
    OnExit = DBEdit3Exit
    OnKeyPress = DBEdit5KeyPress
  end
  object DBEdit4: TDBEdit
    Left = 167
    Top = 171
    Width = 121
    Height = 21
    DataField = 'UNIT_PRICE'
    DataSource = DM.DataSource4
    TabOrder = 6
    OnClick = DBEdit4Click
    OnExit = DBEdit4Exit
    OnKeyPress = DBEdit5KeyPress
  end
  object MaskEdit1: TMaskEdit
    Left = 168
    Top = 198
    Width = 76
    Height = 21
    EditMask = '!0000-!90-90;1;_'
    MaxLength = 10
    TabOrder = 7
    Text = '    -  -  '
    OnExit = MaskEdit1Exit
  end
  object DBEdit5: TDBEdit
    Left = 168
    Top = 225
    Width = 121
    Height = 21
    DataField = 'STATE_TAX'
    DataSource = DM.DataSource4
    TabOrder = 8
    OnClick = DBEdit5Click
    OnExit = DBEdit5Exit
    OnKeyPress = DBEdit5KeyPress
  end
  object Button1: TButton
    Left = 193
    Top = 256
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 9
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 273
    Top = 256
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 10
    OnClick = Button2Click
  end
  object DBComboBox1: TDBComboBox
    Left = 168
    Top = 84
    Width = 161
    Height = 21
    Style = csDropDownList
    DataField = 'DESCRIPTION2'
    DataSource = DM.DataSource4
    ItemHeight = 13
    TabOrder = 2
  end
  object DBEdit1: TDBEdit
    Left = 168
    Top = 59
    Width = 268
    Height = 21
    DataField = 'GUI_GE'
    DataSource = DM.DataSource4
    TabOrder = 1
  end
end
