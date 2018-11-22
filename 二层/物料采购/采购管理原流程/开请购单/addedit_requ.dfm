object Form3: TForm3
  Left = 309
  Top = 224
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #22686#21152'/'#32534#36753#29983#20135#29289#26009#39033#30446
  ClientHeight = 279
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
    Left = 86
    Top = 34
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #24037#21378':'
  end
  object Label2: TLabel
    Left = 73
    Top = 66
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = #21407#26448#26009':'
  end
  object Label4: TLabel
    Left = 60
    Top = 212
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #37319#36141#21333#20301':'
  end
  object Label5: TLabel
    Left = 60
    Top = 148
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #37319#36141#25968#37327':'
  end
  object Label7: TLabel
    Left = 239
    Top = 147
    Width = 85
    Height = 13
    Alignment = taRightJustify
    Caption = #35201#27714#21040#36135#26085#26399':'
  end
  object Label8: TLabel
    Left = 73
    Top = 92
    Width = 7
    Height = 13
  end
  object DBText1: TDBText
    Left = 200
    Top = 211
    Width = 49
    Height = 13
    AutoSize = True
    DataField = 'unit_name'
    DataSource = DM.DataSource3
  end
  object Label10: TLabel
    Left = 270
    Top = 212
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = #23384#36135'/'#37319#36141':'
  end
  object Label3: TLabel
    Left = 60
    Top = 178
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #35831#36141#21407#22240':'
  end
  object Label6: TLabel
    Left = 60
    Top = 120
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #29305#21035#35201#27714':'
  end
  object Edit1: TEdit
    Left = 127
    Top = 31
    Width = 289
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 128
    Top = 62
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
  end
  object BitBtn3: TBitBtn
    Left = 293
    Top = 59
    Width = 30
    Height = 29
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
  object DBEdit1: TDBEdit
    Left = 128
    Top = 144
    Width = 84
    Height = 21
    DataField = 'QUANTITY'
    DataSource = DM.DataSource3
    TabOrder = 4
    OnExit = DBEdit1Exit
    OnKeyDown = DBEdit1KeyDown
    OnKeyPress = DBEdit2KeyPress
  end
  object MaskEdit1: TMaskEdit
    Left = 333
    Top = 142
    Width = 156
    Height = 21
    TabOrder = 5
    OnExit = MaskEdit1Exit
    OnKeyDown = MaskEdit1KeyDown
  end
  object Button1: TButton
    Left = 176
    Top = 240
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 7
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 256
    Top = 240
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 8
    OnClick = Button2Click
  end
  object DBEdit3: TDBEdit
    Left = 128
    Top = 207
    Width = 65
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'unit_code'
    DataSource = DM.DataSource3
    ReadOnly = True
    TabOrder = 9
  end
  object DBEdit4: TDBEdit
    Left = 341
    Top = 207
    Width = 76
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'CONVERSION_FACTOR'
    DataSource = DM.DataSource3
    ReadOnly = True
    TabOrder = 10
  end
  object DBEdit2: TDBEdit
    Left = 128
    Top = 174
    Width = 290
    Height = 21
    DataField = 'reason'
    DataSource = DM.DataSource3
    TabOrder = 6
    OnKeyDown = DBEdit2KeyDown
  end
  object Button3: TButton
    Left = 216
    Top = 240
    Width = 75
    Height = 25
    Caption = #20851#38381
    ModalResult = 1
    TabOrder = 11
    Visible = False
  end
  object DBEdit5: TDBEdit
    Left = 128
    Top = 115
    Width = 162
    Height = 21
    DataField = 'extra_req'
    DataSource = DM.DataSource3
    TabOrder = 3
  end
  object Button4: TButton
    Left = 336
    Top = 60
    Width = 75
    Height = 25
    Caption = #24211#23384#26597#35810
    TabOrder = 12
    OnClick = Button4Click
  end
end
