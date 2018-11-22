object Form4: TForm4
  Left = 390
  Top = 249
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #22686#21152'/'#32534#36753#26434#39033#35831#27714#39033#30446
  ClientHeight = 358
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 73
    Top = 29
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = #20379#24212#21830':'
  end
  object Label2: TLabel
    Left = 60
    Top = 78
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
    Left = 44
    Top = 177
    Width = 75
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #37319#36141#25968#37327':'
  end
  object Label7: TLabel
    Left = 20
    Top = 239
    Width = 99
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '    '#35201#27714#21040#36135#26085#26399':'
  end
  object Label8: TLabel
    Left = 312
    Top = 207
    Width = 107
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#20215#26684'('#19981#21547#31246'):'
  end
  object Label4: TLabel
    Left = 359
    Top = 172
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #36135#24065':'
  end
  object DBText1: TDBText
    Left = 396
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
    Top = 268
    Width = 65
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #37319#36141#21333#20301':'
  end
  object Label10: TLabel
    Left = 252
    Top = 266
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
  object Label12: TLabel
    Left = 278
    Top = 239
    Width = 86
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #22238#22797#20132#36135#26399':'
  end
  object Label13: TLabel
    Left = 60
    Top = 294
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #35831#36141#21407#22240':'
  end
  object Label14: TLabel
    Left = 25
    Top = 207
    Width = 94
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#20215#26684'('#21547#31246'):'
  end
  object Label15: TLabel
    Left = 242
    Top = 208
    Width = 40
    Height = 13
    Alignment = taRightJustify
    Caption = #31246#29575'%:'
  end
  object Label16: TLabel
    Left = 286
    Top = 141
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #29615#20445#31561#32423':'
  end
  object lbl1: TLabel
    Left = 200
    Top = 177
    Width = 103
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #35831#36141#26102#38656#27714#25968#37327':'
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
    TabOrder = 3
    OnClick = Edit1Click
    OnExit = Edit1Exit
    OnKeyDown = Edit1KeyDown
  end
  object BitBtn1: TBitBtn
    Left = 208
    Top = 22
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
    Left = 128
    Top = 74
    Width = 278
    Height = 21
    DataField = 'DESCRIPTION_1'
    DataSource = DM.DataSource4
    TabOrder = 5
    OnKeyDown = DBEdit1KeyDown
  end
  object DBEdit3: TDBEdit
    Left = 128
    Top = 174
    Width = 65
    Height = 21
    DataField = 'QUANTITY_REQUIRED'
    DataSource = DM.DataSource4
    TabOrder = 10
    OnExit = DBEdit3Exit
    OnKeyDown = DBEdit3KeyDown
    OnKeyPress = DBEdit4KeyPress
  end
  object DBEdit4: TDBEdit
    Left = 423
    Top = 203
    Width = 83
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'UNIT_PRICE'
    DataSource = DM.DataSource4
    ReadOnly = True
    TabOrder = 13
    OnKeyPress = DBEdit4KeyPress
  end
  object MaskEdit1: TMaskEdit
    Left = 128
    Top = 235
    Width = 144
    Height = 21
    TabOrder = 16
    OnExit = MaskEdit1Exit
    OnKeyDown = MaskEdit1KeyDown
  end
  object Button1: TButton
    Left = 199
    Top = 323
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 20
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 279
    Top = 323
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 22
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
    TabOrder = 7
    OnKeyDown = DBComboBox1KeyDown
    OnKeyPress = DBComboBox1KeyPress
  end
  object Edit2: TEdit
    Left = 128
    Top = 264
    Width = 85
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 18
    OnClick = Edit2Click
    OnExit = Edit2Exit
    OnKeyDown = Edit2KeyDown
  end
  object BitBtn3: TBitBtn
    Left = 218
    Top = 261
    Width = 25
    Height = 25
    Hint = #26597#25214#21333#20301
    ParentShowHint = False
    ShowHint = True
    TabOrder = 17
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
    TabOrder = 6
    OnKeyDown = DBEdit2KeyDown
  end
  object DBRadioGroup1: TDBRadioGroup
    Left = 287
    Top = 6
    Width = 150
    Height = 41
    Caption = #37319#36141#35746#21333#26684#24335
    Columns = 2
    DataField = 'o_i_flag'
    DataSource = DM.DataSource4
    Items.Strings = (
      #26684#24335#19968
      #26684#24335#20108)
    TabOrder = 1
    Values.Strings = (
      '0'
      '1')
  end
  object MaskEdit2: TMaskEdit
    Left = 369
    Top = 234
    Width = 137
    Height = 21
    TabOrder = 15
    OnExit = MaskEdit2Exit
    OnKeyDown = MaskEdit2KeyDown
  end
  object DBEdit5: TDBEdit
    Left = 128
    Top = 290
    Width = 301
    Height = 21
    DataField = 'reason'
    DataSource = DM.DataSource4
    TabOrder = 19
    OnKeyDown = DBEdit5KeyDown
  end
  object Button3: TButton
    Left = 241
    Top = 323
    Width = 75
    Height = 25
    Caption = #20851#38381
    ModalResult = 1
    TabOrder = 21
    Visible = False
  end
  object BitBtn2: TBitBtn
    Left = 424
    Top = 72
    Width = 75
    Height = 25
    Caption = #21382#21490#20215#26684
    TabOrder = 4
    OnClick = BitBtn2Click
  end
  object Button4: TButton
    Left = 458
    Top = 166
    Width = 75
    Height = 25
    Caption = #26356#25913#36135#24065
    TabOrder = 9
    OnClick = Button4Click
  end
  object DBEdit6: TDBEdit
    Left = 128
    Top = 203
    Width = 83
    Height = 21
    DataField = 'tax_price'
    DataSource = DM.DataSource4
    TabOrder = 12
    OnExit = DBEdit6Exit
    OnKeyDown = DBEdit6KeyDown
    OnKeyPress = DBEdit4KeyPress
  end
  object DBEdit7: TDBEdit
    Left = 286
    Top = 204
    Width = 40
    Height = 21
    DataField = 'tax'
    DataSource = DM.DataSource4
    ParentColor = True
    TabOrder = 14
    OnExit = DBEdit7Exit
    OnKeyDown = DBEdit7KeyDown
    OnKeyPress = DBEdit4KeyPress
  end
  object DBComboBox2: TDBComboBox
    Left = 348
    Top = 137
    Width = 104
    Height = 21
    Ctl3D = True
    DataField = 'rohs'
    DataSource = DM.DataSource4
    ItemHeight = 13
    Items.Strings = (
      #8544#32423
      #8545#32423)
    ParentCtl3D = False
    TabOrder = 8
    OnKeyDown = DBComboBox1KeyDown
    OnKeyPress = DBComboBox1KeyPress
  end
  object dbedtQUANTITY_REQUIRED: TDBEdit
    Left = 304
    Top = 174
    Width = 49
    Height = 21
    Color = cl3DLight
    DataField = 'req_quantity'
    DataSource = DM.DataSource4
    Enabled = False
    TabOrder = 11
  end
  object dbchkIF_urgency: TDBCheckBox
    Left = 128
    Top = 3
    Width = 97
    Height = 17
    Caption = #26159#21542#32039#24613#29289#26009
    DataField = 'IF_urgency'
    DataSource = DM.DataSource4
    TabOrder = 0
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
end
