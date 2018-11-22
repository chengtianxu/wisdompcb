object Form5: TForm5
  Left = 339
  Top = 236
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #30452#25509#20837#20179#26126#32454
  ClientHeight = 345
  ClientWidth = 455
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 89
    Top = 29
    Width = 59
    Height = 13
    Caption = #26448#26009#32534#30721':'
  end
  object Label2: TLabel
    Left = 89
    Top = 108
    Width = 59
    Height = 13
    Caption = #23384#20179#20301#32622':'
  end
  object Label3: TLabel
    Left = 89
    Top = 137
    Width = 59
    Height = 13
    Caption = #23384#36135#21333#20301':'
  end
  object Label4: TLabel
    Left = 115
    Top = 167
    Width = 33
    Height = 13
    Caption = #25968#37327':'
  end
  object Label5: TLabel
    Left = 115
    Top = 201
    Width = 33
    Height = 13
    Caption = #20215#26684':'
  end
  object Label6: TLabel
    Left = 108
    Top = 234
    Width = 40
    Height = 13
    Caption = #31246#29575'%:'
  end
  object Label7: TLabel
    Left = 115
    Top = 268
    Width = 33
    Height = 13
    Caption = #22791#27880':'
  end
  object rkey17: TLabel
    Left = 40
    Top = 46
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object rkey16: TLabel
    Left = 40
    Top = 103
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object rkey02: TLabel
    Left = 39
    Top = 136
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object Label9: TLabel
    Left = 284
    Top = 138
    Width = 7
    Height = 13
  end
  object Label8: TLabel
    Left = 87
    Top = 53
    Width = 59
    Height = 13
    Caption = #26448#26009#21517#31216':'
  end
  object Label10: TLabel
    Left = 86
    Top = 79
    Width = 59
    Height = 13
    Caption = #26448#26009#35268#26684':'
  end
  object SHELF_LIFE: TLabel
    Left = 40
    Top = 160
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object Edit1: TEdit
    Left = 152
    Top = 25
    Width = 129
    Height = 21
    TabOrder = 0
    OnExit = Edit1Exit
  end
  object ComboBox1: TComboBox
    Left = 152
    Top = 103
    Width = 129
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
    OnChange = ComboBox1Change
  end
  object Edit2: TEdit
    Left = 152
    Top = 133
    Width = 89
    Height = 21
    TabOrder = 2
    OnExit = Edit2Exit
  end
  object Edit3: TEdit
    Left = 152
    Top = 163
    Width = 121
    Height = 21
    TabOrder = 3
    Text = '0.00'
    OnExit = Edit3Exit
    OnKeyPress = Edit3KeyPress
  end
  object Edit4: TEdit
    Left = 152
    Top = 197
    Width = 121
    Height = 21
    TabOrder = 4
    Text = '0.000'
    OnExit = Edit4Exit
    OnKeyPress = Edit3KeyPress
  end
  object Edit5: TEdit
    Left = 152
    Top = 230
    Width = 49
    Height = 21
    TabOrder = 5
    Text = '0.00'
    OnExit = Edit5Exit
    OnKeyPress = Edit3KeyPress
  end
  object Edit6: TEdit
    Left = 152
    Top = 264
    Width = 257
    Height = 21
    MaxLength = 50
    TabOrder = 6
  end
  object Button1: TButton
    Left = 154
    Top = 298
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 7
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 233
    Top = 298
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 8
  end
  object BitBtn2: TBitBtn
    Left = 287
    Top = 24
    Width = 25
    Height = 25
    TabOrder = 9
    OnClick = BitBtn2Click
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
  object BitBtn1: TBitBtn
    Left = 250
    Top = 132
    Width = 25
    Height = 25
    TabOrder = 10
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
  object Edit7: TEdit
    Left = 152
    Top = 50
    Width = 130
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 11
  end
  object Edit8: TEdit
    Left = 152
    Top = 75
    Width = 194
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 12
  end
end
