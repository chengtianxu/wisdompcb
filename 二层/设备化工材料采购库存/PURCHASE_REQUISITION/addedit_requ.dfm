object Form3: TForm3
  Left = 324
  Top = 163
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #22686#21152'/'#32534#36753#26631#20934#35831#27714#39033#30446
  ClientHeight = 438
  ClientWidth = 515
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
    Left = 90
    Top = 18
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #24037#21378':'
  end
  object Label2: TLabel
    Left = 77
    Top = 50
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = #21407#26448#26009':'
  end
  object Label3: TLabel
    Left = 77
    Top = 139
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = #20379#24212#21830':'
  end
  object Label4: TLabel
    Left = 64
    Top = 301
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #37319#36141#21333#20301':'
  end
  object Label5: TLabel
    Left = 65
    Top = 244
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #37319#36141#25968#37327':'
  end
  object Label6: TLabel
    Left = 65
    Top = 273
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #37319#36141#20215#26684':'
  end
  object Label7: TLabel
    Left = 134
    Top = 192
    Width = 85
    Height = 13
    Alignment = taRightJustify
    Caption = #35201#27714#21040#36135#26085#26399':'
  end
  object Label8: TLabel
    Left = 116
    Top = 75
    Width = 7
    Height = 13
  end
  object Label9: TLabel
    Left = 254
    Top = 139
    Width = 7
    Height = 13
  end
  object Label10: TLabel
    Left = 4
    Top = 362
    Width = 119
    Height = 13
    Alignment = taRightJustify
    Caption = #23384#36135'/'#37319#36141'('#36716#25442#29575'):'
  end
  object Label11: TLabel
    Left = 84
    Top = 168
    Width = 38
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '   '#36135#24065':'
  end
  object DBText2: TDBText
    Left = 132
    Top = 166
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'curr_name'
    DataSource = DM.DataSource3
  end
  object Label12: TLabel
    Left = 302
    Top = 192
    Width = 72
    Height = 13
    Alignment = taRightJustify
    Caption = #22238#22797#20132#36135#26399':'
  end
  object Label13: TLabel
    Left = 64
    Top = 335
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #35831#36141#21407#22240':'
  end
  object Label14: TLabel
    Left = 64
    Top = 108
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #29305#27530#35828#26126':'
  end
  object Label15: TLabel
    Left = 280
    Top = 273
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #35831#36141#20215#26684':'
  end
  object Label16: TLabel
    Left = 198
    Top = 168
    Width = 47
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#31246#29575'%:'
  end
  object DBText3: TDBText
    Left = 255
    Top = 168
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'tax'
    DataSource = DM.DataSource3
  end
  object Label17: TLabel
    Left = 281
    Top = 244
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #35831#36141#25968#37327':'
  end
  object Label18: TLabel
    Left = 280
    Top = 301
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #35831#36141#21333#20301':'
  end
  object Edit1: TEdit
    Left = 131
    Top = 15
    Width = 289
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 132
    Top = 46
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
    Left = 298
    Top = 44
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
    Left = 132
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
    Left = 220
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
    Left = 133
    Top = 240
    Width = 107
    Height = 21
    DataField = 'QUANTITY'
    DataSource = DM.DataSource3
    TabOrder = 8
    OnExit = DBEdit1Exit
    OnKeyDown = DBEdit1KeyDown
    OnKeyPress = DBEdit2KeyPress
  end
  object DBEdit2: TDBEdit
    Left = 133
    Top = 269
    Width = 107
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
    Left = 133
    Top = 209
    Width = 154
    Height = 21
    TabOrder = 5
    OnExit = MaskEdit1Exit
    OnKeyDown = MaskEdit1KeyDown
  end
  object Button1: TButton
    Left = 180
    Top = 402
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 12
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 260
    Top = 402
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 13
    OnClick = Button2Click
  end
  object DBEdit3: TDBEdit
    Left = 133
    Top = 297
    Width = 105
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'unit_name'
    DataSource = DM.DataSource3
    ReadOnly = True
    TabOrder = 14
  end
  object DBEdit4: TDBEdit
    Left = 133
    Top = 359
    Width = 84
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'CONVERSION_FACTOR'
    DataSource = DM.DataSource3
    ReadOnly = True
    TabOrder = 15
  end
  object DBRadioGroup1: TDBRadioGroup
    Left = 376
    Top = 96
    Width = 111
    Height = 38
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
    Left = 300
    Top = 209
    Width = 154
    Height = 21
    TabOrder = 6
    OnExit = MaskEdit2Exit
    OnKeyDown = MaskEdit2KeyDown
  end
  object DBEdit5: TDBEdit
    Left = 132
    Top = 330
    Width = 290
    Height = 21
    DataField = 'reason'
    DataSource = DM.DataSource3
    TabOrder = 11
    OnKeyDown = DBEdit5KeyDown
  end
  object Button3: TButton
    Left = 220
    Top = 402
    Width = 75
    Height = 25
    Caption = #20851#38381
    ModalResult = 1
    TabOrder = 17
    Visible = False
  end
  object BitBtn1: TBitBtn
    Left = 335
    Top = 43
    Width = 72
    Height = 25
    Caption = #21382#21490#20215#26684
    TabOrder = 18
    OnClick = BitBtn1Click
  end
  object DBEdit6: TDBEdit
    Left = 132
    Top = 104
    Width = 240
    Height = 21
    DataField = 'extra_req'
    DataSource = DM.DataSource3
    TabOrder = 3
  end
  object Button4: TButton
    Left = 415
    Top = 43
    Width = 71
    Height = 25
    Caption = #24211#23384#26597#35810
    TabOrder = 19
    OnClick = Button4Click
  end
  object DBEdit7: TDBEdit
    Left = 348
    Top = 269
    Width = 107
    Height = 21
    DataField = 'tax_price'
    DataSource = DM.DataSource3
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 10
    OnExit = DBEdit7Exit
    OnKeyDown = DBEdit7KeyDown
    OnKeyPress = DBEdit2KeyPress
  end
  object DBEdit8: TDBEdit
    Left = 348
    Top = 240
    Width = 107
    Height = 21
    DataField = 'req_quantity'
    DataSource = DM.DataSource3
    ReadOnly = True
    TabOrder = 20
    OnKeyPress = DBEdit2KeyPress
  end
  object DBEdit9: TDBEdit
    Left = 349
    Top = 297
    Width = 105
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'req_unitname'
    DataSource = DM.DataSource3
    ReadOnly = True
    TabOrder = 21
  end
end
