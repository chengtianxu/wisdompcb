object Form3: TForm3
  Left = 204
  Top = 155
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #22686#21152'/'#32534#36753#26631#20934#35831#27714#39033#30446
  ClientHeight = 460
  ClientWidth = 513
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 97
    Top = 24
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #24037#21378':'
  end
  object Label2: TLabel
    Left = 84
    Top = 56
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = #21407#26448#26009':'
  end
  object Label3: TLabel
    Left = 84
    Top = 139
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = #20379#24212#21830':'
  end
  object Label4: TLabel
    Left = 59
    Top = 353
    Width = 71
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '   '#37319#36141#21333#20301':'
  end
  object Label5: TLabel
    Left = 71
    Top = 243
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #37319#36141#25968#37327':'
  end
  object Label6: TLabel
    Left = 37
    Top = 272
    Width = 93
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#20215#26684'('#19981#21547#31246'):'
  end
  object Label7: TLabel
    Left = 45
    Top = 189
    Width = 85
    Height = 13
    Alignment = taRightJustify
    Caption = #35201#27714#21040#36135#26085#26399':'
  end
  object Label8: TLabel
    Left = 123
    Top = 79
    Width = 7
    Height = 13
  end
  object Label9: TLabel
    Left = 141
    Top = 164
    Width = 7
    Height = 13
  end
  object DBText1: TDBText
    Left = 231
    Top = 354
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'unit_name'
    DataSource = DM.DataSource3
  end
  object Label10: TLabel
    Left = 11
    Top = 381
    Width = 119
    Height = 13
    Alignment = taRightJustify
    Caption = #23384#36135'/'#37319#36141'('#36716#25442#29575'):'
  end
  object Label11: TLabel
    Left = 281
    Top = 272
    Width = 38
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '   '#36135#24065':'
  end
  object DBText2: TDBText
    Left = 327
    Top = 271
    Width = 65
    Height = 17
    DataField = 'curr_name'
    DataSource = DM.DataSource3
  end
  object Label12: TLabel
    Left = 46
    Top = 215
    Width = 84
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #22238#22797#20132#36135#26399':'
  end
  object Label13: TLabel
    Left = 71
    Top = 330
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #35831#36141#21407#22240':'
  end
  object Label14: TLabel
    Left = 71
    Top = 108
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #29305#21035#35201#27714':'
  end
  object Label15: TLabel
    Left = 49
    Top = 299
    Width = 80
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#20215#26684'('#21547#31246'):'
  end
  object Label16: TLabel
    Left = 273
    Top = 300
    Width = 47
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#31246#29575'%:'
  end
  object DBText3: TDBText
    Left = 328
    Top = 299
    Width = 65
    Height = 17
    DataField = 'tax'
    DataSource = DM.DataSource3
  end
  object Label17: TLabel
    Left = 259
    Top = 244
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #29615#20445#26631#35782':'
  end
  object avl_flag: TLabel
    Left = 32
    Top = 56
    Width = 7
    Height = 13
    Hint = #20215#26684#26159#21542#21547#31246
    Caption = '1'
  end
  object Edit1: TEdit
    Left = 138
    Top = 21
    Width = 275
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 139
    Top = 52
    Width = 160
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    MaxLength = 20
    ParentFont = False
    TabOrder = 1
    OnClick = Edit2Click
    OnExit = Edit2Exit
    OnKeyDown = Edit2KeyDown
  end
  object BitBtn3: TBitBtn
    Left = 305
    Top = 50
    Width = 25
    Height = 25
    TabOrder = 2
    TabStop = False
    OnClick = BitBtn3Click
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
  object Edit3: TEdit
    Left = 139
    Top = 135
    Width = 81
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    TabOrder = 4
    OnClick = Edit3Click
    OnExit = Edit3Exit
    OnKeyDown = Edit3KeyDown
    OnKeyPress = Edit3KeyPress
  end
  object BitBtn4: TBitBtn
    Left = 227
    Top = 133
    Width = 25
    Height = 25
    TabOrder = 7
    TabStop = False
    OnClick = BitBtn4Click
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
    Left = 139
    Top = 239
    Width = 112
    Height = 21
    DataField = 'QUANTITY'
    DataSource = DM.DataSource3
    TabOrder = 8
    OnExit = DBEdit1Exit
    OnKeyDown = DBEdit1KeyDown
    OnKeyPress = DBEdit2KeyPress
  end
  object DBEdit2: TDBEdit
    Left = 139
    Top = 268
    Width = 112
    Height = 21
    DataField = 'UNIT_PRICE'
    DataSource = DM.DataSource3
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    OnExit = DBEdit2Exit
    OnKeyDown = DBEdit2KeyDown
    OnKeyPress = DBEdit2KeyPress
  end
  object MaskEdit1: TMaskEdit
    Left = 139
    Top = 186
    Width = 154
    Height = 21
    TabOrder = 5
    OnExit = MaskEdit1Exit
    OnKeyDown = MaskEdit1KeyDown
  end
  object Button1: TButton
    Left = 172
    Top = 417
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 12
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 252
    Top = 417
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 13
    OnClick = Button2Click
  end
  object DBEdit3: TDBEdit
    Left = 138
    Top = 350
    Width = 85
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'unit_code'
    DataSource = DM.DataSource3
    ReadOnly = True
    TabOrder = 14
  end
  object DBEdit4: TDBEdit
    Left = 138
    Top = 377
    Width = 86
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'CONVERSION_FACTOR'
    DataSource = DM.DataSource3
    ReadOnly = True
    TabOrder = 15
  end
  object DBRadioGroup1: TDBRadioGroup
    Left = 321
    Top = 193
    Width = 125
    Height = 42
    Caption = #37319#36141#22320#28857
    Columns = 2
    DataField = 'o_i_flag'
    DataSource = DM.DataSource3
    Items.Strings = (
      #22269#20869
      #22269#22806)
    TabOrder = 16
    Values.Strings = (
      '0'
      '1')
  end
  object MaskEdit2: TMaskEdit
    Left = 139
    Top = 212
    Width = 154
    Height = 21
    TabOrder = 6
    OnExit = MaskEdit2Exit
    OnKeyDown = MaskEdit2KeyDown
  end
  object DBEdit5: TDBEdit
    Left = 138
    Top = 326
    Width = 290
    Height = 21
    DataField = 'reason'
    DataSource = DM.DataSource3
    TabOrder = 11
    OnKeyDown = DBEdit5KeyDown
  end
  object Button3: TButton
    Left = 212
    Top = 417
    Width = 75
    Height = 25
    Caption = #20851#38381
    ModalResult = 1
    TabOrder = 17
    Visible = False
  end
  object BitBtn1: TBitBtn
    Left = 342
    Top = 49
    Width = 72
    Height = 25
    Caption = #21382#21490#20215#26684
    TabOrder = 18
    OnClick = BitBtn1Click
  end
  object DBEdit6: TDBEdit
    Left = 139
    Top = 104
    Width = 162
    Height = 21
    DataField = 'extra_req'
    DataSource = DM.DataSource3
    TabOrder = 3
  end
  object Button4: TButton
    Left = 422
    Top = 49
    Width = 71
    Height = 25
    Caption = #24211#23384#26597#35810
    TabOrder = 19
    OnClick = Button4Click
  end
  object DBEdit7: TDBEdit
    Left = 139
    Top = 295
    Width = 112
    Height = 21
    DataField = 'tax_price'
    DataSource = DM.DataSource3
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    OnExit = DBEdit7Exit
    OnKeyDown = DBEdit7KeyDown
    OnKeyPress = DBEdit2KeyPress
  end
  object DBEdit8: TDBEdit
    Left = 324
    Top = 240
    Width = 85
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'rohs'
    DataSource = DM.DataSource3
    ReadOnly = True
    TabOrder = 20
  end
end
