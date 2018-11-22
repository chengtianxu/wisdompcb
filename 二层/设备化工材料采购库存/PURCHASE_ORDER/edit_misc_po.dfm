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
  Font.Name = #23435#20307
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
    Left = 43
    Top = 25
    Width = 73
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '   '#29289#21697#21517#31216':'
  end
  object Label4: TLabel
    Left = 45
    Top = 115
    Width = 71
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '    '#37319#36141#21333#20301':'
  end
  object Label5: TLabel
    Left = 83
    Top = 144
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #25968#37327':'
  end
  object Label6: TLabel
    Left = 76
    Top = 174
    Width = 40
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#20215#26684':'
  end
  object Label7: TLabel
    Left = 57
    Top = 228
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #20132#36135#26085#26399':'
  end
  object Label8: TLabel
    Left = 70
    Top = 202
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = #22686#20540#31246':'
  end
  object Label9: TLabel
    Left = 191
    Top = 201
    Width = 7
    Height = 13
    Caption = '%'
  end
  object Label10: TLabel
    Left = 236
    Top = 114
    Width = 7
    Height = 13
  end
  object Label15: TLabel
    Left = 73
    Top = 83
    Width = 43
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '   '#31867#21035':'
  end
  object Label2: TLabel
    Left = 57
    Top = 51
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #29289#21697#35268#26684':'
  end
  object DBEdit2: TDBEdit
    Left = 122
    Top = 21
    Width = 269
    Height = 21
    DataField = 'DESCRIPTION'
    DataSource = DM.DataSource4
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 122
    Top = 111
    Width = 77
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    MaxLength = 5
    ParentFont = False
    TabOrder = 3
    OnClick = Edit2Click
    OnExit = Edit2Exit
  end
  object BitBtn2: TBitBtn
    Left = 207
    Top = 109
    Width = 25
    Height = 25
    TabOrder = 4
    TabStop = False
    OnExit = BitBtn2Exit
    OnMouseDown = BitBtn2MouseDown
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
    Left = 121
    Top = 140
    Width = 109
    Height = 21
    DataField = 'QUAN_ORD'
    DataSource = DM.DataSource4
    TabOrder = 5
    OnClick = DBEdit3Click
    OnExit = DBEdit3Exit
    OnKeyPress = DBEdit5KeyPress
  end
  object DBEdit4: TDBEdit
    Left = 121
    Top = 170
    Width = 109
    Height = 21
    TabStop = False
    DataField = 'UNIT_PRICE'
    DataSource = DM.DataSource4
    TabOrder = 6
  end
  object MaskEdit1: TMaskEdit
    Left = 122
    Top = 224
    Width = 167
    Height = 21
    TabOrder = 8
    OnExit = MaskEdit1Exit
  end
  object DBEdit5: TDBEdit
    Left = 122
    Top = 197
    Width = 63
    Height = 21
    DataField = 'STATE_TAX'
    DataSource = DM.DataSource4
    TabOrder = 7
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
    Left = 122
    Top = 80
    Width = 161
    Height = 21
    Style = csDropDownList
    DataField = 'DESCRIPTION2'
    DataSource = DM.DataSource4
    ItemHeight = 13
    TabOrder = 2
  end
  object DBEdit1: TDBEdit
    Left = 123
    Top = 48
    Width = 406
    Height = 21
    DataField = 'GUI_GE'
    DataSource = DM.DataSource4
    TabOrder = 1
  end
end
