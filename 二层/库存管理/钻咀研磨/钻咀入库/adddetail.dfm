object Form_adddetail: TForm_adddetail
  Left = 270
  Top = 222
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26032#22686#20837#24211#38075#21632
  ClientHeight = 288
  ClientWidth = 457
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 89
    Top = 45
    Width = 59
    Height = 13
    Caption = #38075#21632#32534#30721':'
  end
  object Label2: TLabel
    Left = 89
    Top = 122
    Width = 59
    Height = 13
    Caption = #23384#20179#20301#32622':'
  end
  object Label8: TLabel
    Left = 89
    Top = 69
    Width = 59
    Height = 13
    Caption = #38075#21632#21517#31216':'
  end
  object Label10: TLabel
    Left = 89
    Top = 95
    Width = 59
    Height = 13
    Caption = #38075#21632#35268#26684':'
  end
  object Label4: TLabel
    Left = 115
    Top = 150
    Width = 33
    Height = 13
    Caption = #25968#37327':'
  end
  object Label6: TLabel
    Left = 89
    Top = 177
    Width = 59
    Height = 13
    Caption = #30740#30952#27425#25968':'
  end
  object Label7: TLabel
    Left = 115
    Top = 204
    Width = 33
    Height = 13
    Caption = #22791#27880':'
  end
  object Label3: TLabel
    Left = 110
    Top = 265
    Width = 46
    Height = 13
    Caption = #20379#24212#21830':'
    Visible = False
  end
  object Label9: TLabel
    Left = 288
    Top = 266
    Width = 56
    Height = 13
    Caption = '        '
    Visible = False
  end
  object Lab_rkey17: TLabel
    Left = 47
    Top = 43
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object Label5: TLabel
    Left = 280
    Top = 125
    Width = 49
    Height = 13
    Caption = '       '
  end
  object lab_rkey160: TLabel
    Left = 47
    Top = 122
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object lab_rkey23: TLabel
    Left = 55
    Top = 264
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object Button1: TButton
    Left = 154
    Top = 241
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 6
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 233
    Top = 241
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 7
  end
  object Edit1: TEdit
    Left = 152
    Top = 41
    Width = 129
    Height = 21
    TabOrder = 0
    OnExit = Edit1Exit
    OnKeyDown = Tab
  end
  object BitBtn2: TBitBtn
    Left = 287
    Top = 40
    Width = 25
    Height = 25
    TabOrder = 8
    TabStop = False
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
  object Edit7: TEdit
    Left = 152
    Top = 66
    Width = 130
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 9
  end
  object Edit8: TEdit
    Left = 152
    Top = 91
    Width = 194
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 10
  end
  object Edit3: TEdit
    Left = 152
    Top = 146
    Width = 89
    Height = 21
    TabOrder = 3
    Text = '0'
    OnKeyDown = Tab
    OnKeyPress = Edit3KeyPress
  end
  object Edit5: TEdit
    Left = 152
    Top = 173
    Width = 49
    Height = 21
    ReadOnly = True
    TabOrder = 11
    Text = '0'
  end
  object Edit6: TEdit
    Left = 152
    Top = 200
    Width = 241
    Height = 21
    MaxLength = 100
    TabOrder = 5
    OnKeyDown = Tab
  end
  object UpDown1: TUpDown
    Left = 201
    Top = 173
    Width = 17
    Height = 21
    Associate = Edit5
    Enabled = False
    Max = 10
    TabOrder = 4
  end
  object Edit2: TEdit
    Left = 160
    Top = 261
    Width = 89
    Height = 21
    TabOrder = 2
    Visible = False
    OnExit = Edit2Exit
    OnKeyDown = Tab
  end
  object BitBtn1: TBitBtn
    Left = 258
    Top = 260
    Width = 25
    Height = 25
    TabOrder = 12
    TabStop = False
    Visible = False
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
  object Edit4: TEdit
    Left = 152
    Top = 118
    Width = 89
    Height = 21
    TabOrder = 1
    OnExit = Edit4Exit
    OnKeyDown = Tab
  end
  object BitBtn3: TBitBtn
    Left = 250
    Top = 118
    Width = 25
    Height = 25
    TabOrder = 13
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
end
