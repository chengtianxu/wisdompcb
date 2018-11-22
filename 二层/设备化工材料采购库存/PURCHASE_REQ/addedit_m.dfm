object Form4: TForm4
  Left = 310
  Top = 221
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #22686#21152'/'#32534#36753#26434#39033#35831#27714#39033#30446
  ClientHeight = 352
  ClientWidth = 540
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 63
    Top = 27
    Width = 56
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '   '#20379#24212#21830':'
  end
  object Label2: TLabel
    Left = 60
    Top = 77
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #29289#21697#21517#31216':'
  end
  object Label3: TLabel
    Left = 130
    Top = 53
    Width = 7
    Height = 13
  end
  object Label6: TLabel
    Left = 60
    Top = 173
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #35831#36141#25968#37327':'
  end
  object Label7: TLabel
    Left = 27
    Top = 234
    Width = 92
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#35201#27714#21040#36135#26085#26399':'
  end
  object Label8: TLabel
    Left = 25
    Top = 204
    Width = 94
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#20215#26684'('#21547#31246'):'
  end
  object Label4: TLabel
    Left = 307
    Top = 172
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #36135#24065':'
  end
  object DBText1: TDBText
    Left = 344
    Top = 172
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'curr_name'
    DataSource = DM.DataSource4
  end
  object Label5: TLabel
    Left = 86
    Top = 141
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #31867#21035':'
  end
  object Label9: TLabel
    Left = 54
    Top = 262
    Width = 65
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #37319#36141#21333#20301':'
  end
  object Label10: TLabel
    Left = 252
    Top = 260
    Width = 7
    Height = 13
  end
  object Label11: TLabel
    Left = 60
    Top = 109
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #29289#21697#35268#26684':'
  end
  object Label13: TLabel
    Left = 60
    Top = 289
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #35831#36141#21407#22240':'
  end
  object Label12: TLabel
    Left = 318
    Top = 204
    Width = 107
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#20215#26684'('#19981#21547#31246'):'
  end
  object Label14: TLabel
    Left = 214
    Top = 204
    Width = 54
    Height = 13
    Alignment = taRightJustify
    Caption = '  '#31246#29575'%:'
  end
  object Edit1: TEdit
    Left = 128
    Top = 24
    Width = 73
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    TabOrder = 0
    OnClick = Edit1Click
    OnExit = Edit1Exit
    OnKeyDown = Edit1KeyDown
  end
  object BitBtn1: TBitBtn
    Left = 208
    Top = 22
    Width = 25
    Height = 25
    TabOrder = 1
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
    Left = 127
    Top = 73
    Width = 278
    Height = 21
    DataField = 'DESCRIPTION_1'
    DataSource = DM.DataSource4
    TabOrder = 2
    OnKeyDown = DBEdit1KeyDown
  end
  object DBEdit3: TDBEdit
    Left = 128
    Top = 169
    Width = 86
    Height = 21
    DataField = 'QUANTITY_REQUIRED'
    DataSource = DM.DataSource4
    TabOrder = 5
    OnExit = DBEdit3Exit
    OnKeyDown = DBEdit3KeyDown
    OnKeyPress = DBEdit4KeyPress
  end
  object DBEdit4: TDBEdit
    Left = 129
    Top = 200
    Width = 83
    Height = 21
    DataField = 'tax_price'
    DataSource = DM.DataSource4
    TabOrder = 6
    OnExit = DBEdit4Exit
    OnKeyDown = DBEdit4KeyDown
    OnKeyPress = DBEdit4KeyPress
  end
  object MaskEdit1: TMaskEdit
    Left = 128
    Top = 230
    Width = 144
    Height = 21
    TabOrder = 7
    OnExit = MaskEdit1Exit
    OnKeyDown = MaskEdit1KeyDown
  end
  object Button1: TButton
    Left = 199
    Top = 318
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 10
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 279
    Top = 318
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 11
    OnClick = Button2Click
  end
  object DBComboBox1: TDBComboBox
    Left = 128
    Top = 137
    Width = 153
    Height = 21
    Ctl3D = True
    DataField = 'DESCRIPTION_2'
    DataSource = DM.DataSource4
    ItemHeight = 13
    ParentCtl3D = False
    TabOrder = 4
    OnKeyDown = DBComboBox1KeyDown
    OnKeyPress = DBComboBox1KeyPress
  end
  object Edit2: TEdit
    Left = 127
    Top = 258
    Width = 85
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = Edit2Click
    OnExit = Edit2Exit
    OnKeyDown = Edit2KeyDown
  end
  object BitBtn3: TBitBtn
    Left = 218
    Top = 255
    Width = 25
    Height = 25
    Hint = #26597#25214#21333#20301
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    TabStop = False
    OnExit = BitBtn3Exit
    OnMouseDown = BitBtn3MouseDown
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
  object DBEdit2: TDBEdit
    Left = 128
    Top = 104
    Width = 370
    Height = 21
    DataField = 'GUI_GE'
    DataSource = DM.DataSource4
    TabOrder = 3
    OnKeyDown = DBEdit2KeyDown
  end
  object DBEdit5: TDBEdit
    Left = 128
    Top = 285
    Width = 301
    Height = 21
    DataField = 'reason'
    DataSource = DM.DataSource4
    TabOrder = 9
    OnKeyDown = DBEdit5KeyDown
  end
  object Button3: TButton
    Left = 241
    Top = 318
    Width = 75
    Height = 25
    Caption = #20851#38381
    ModalResult = 1
    TabOrder = 13
    Visible = False
  end
  object BitBtn2: TBitBtn
    Left = 420
    Top = 71
    Width = 75
    Height = 25
    Caption = #21382#21490#20215#26684
    TabOrder = 14
    OnClick = BitBtn2Click
  end
  object Button4: TButton
    Left = 421
    Top = 165
    Width = 75
    Height = 25
    Caption = #26356#25913#36135#24065
    TabOrder = 15
    OnClick = Button4Click
  end
  object DBEdit6: TDBEdit
    Left = 431
    Top = 200
    Width = 66
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'UNIT_PRICE'
    DataSource = DM.DataSource4
    ReadOnly = True
    TabOrder = 16
  end
  object DBEdit7: TDBEdit
    Left = 275
    Top = 200
    Width = 44
    Height = 21
    DataField = 'tax'
    DataSource = DM.DataSource4
    TabOrder = 17
    OnExit = DBEdit7Exit
    OnKeyDown = DBEdit7KeyDown
    OnKeyPress = DBEdit4KeyPress
  end
end
