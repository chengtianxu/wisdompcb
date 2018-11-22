object Form_DeInEdit: TForm_DeInEdit
  Left = 320
  Top = 136
  Width = 411
  Height = 426
  Caption = #20379#24212#21830#26448#26009#30452#25509#20837#24211
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 403
    Height = 399
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 39
      Top = 15
      Width = 60
      Height = 13
      AutoSize = False
      Caption = #26448#26009#32534#30721':'
    end
    object Label2: TLabel
      Left = 39
      Top = 94
      Width = 60
      Height = 13
      AutoSize = False
      Caption = #23384#20179#20301#32622':'
    end
    object Label3: TLabel
      Left = 39
      Top = 123
      Width = 60
      Height = 13
      AutoSize = False
      Caption = #23384#36135#21333#20301':'
    end
    object Label4: TLabel
      Left = 65
      Top = 153
      Width = 30
      Height = 13
      AutoSize = False
      Caption = #25968#37327':'
    end
    object Label5: TLabel
      Left = 39
      Top = 187
      Width = 60
      Height = 13
      AutoSize = False
      Caption = #21547#31246#20215#26684':'
    end
    object Label6: TLabel
      Left = 58
      Top = 215
      Width = 45
      Height = 13
      AutoSize = False
      Caption = #31246#29575'%:'
    end
    object Label7: TLabel
      Left = 65
      Top = 241
      Width = 30
      Height = 13
      AutoSize = False
      Caption = #22791#27880':'
    end
    object Label9: TLabel
      Left = 234
      Top = 124
      Width = 7
      Height = 13
    end
    object Label8: TLabel
      Left = 37
      Top = 39
      Width = 60
      Height = 13
      AutoSize = False
      Caption = #26448#26009#21517#31216':'
    end
    object Label10: TLabel
      Left = 36
      Top = 65
      Width = 60
      Height = 13
      AutoSize = False
      Caption = #26448#26009#35268#26684':'
    end
    object Label11: TLabel
      Left = 39
      Top = 267
      Width = 60
      Height = 13
      AutoSize = False
      Caption = #29615#20445#26631#35782':'
    end
    object Label12: TLabel
      Left = 52
      Top = 294
      Width = 45
      Height = 13
      AutoSize = False
      Caption = #26377#25928#26399':'
    end
    object Edit1: TEdit
      Left = 102
      Top = 11
      Width = 171
      Height = 21
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 0
    end
    object CBLoc: TComboBox
      Left = 102
      Top = 89
      Width = 129
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnChange = CBLocChange
    end
    object Edit2: TEdit
      Left = 102
      Top = 119
      Width = 97
      Height = 21
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 2
    end
    object Edit3: TEdit
      Left = 102
      Top = 149
      Width = 121
      Height = 21
      TabOrder = 3
      Text = '0.00'
      OnKeyPress = Edit3KeyPress
    end
    object Edit4: TEdit
      Left = 102
      Top = 183
      Width = 121
      Height = 21
      TabOrder = 4
      Text = '0.000'
      OnKeyPress = Edit4KeyPress
    end
    object Edit5: TEdit
      Left = 102
      Top = 211
      Width = 49
      Height = 21
      TabOrder = 5
      Text = '0.00'
      OnKeyPress = Edit5KeyPress
    end
    object Edit6: TEdit
      Left = 102
      Top = 237
      Width = 203
      Height = 21
      MaxLength = 12
      TabOrder = 6
    end
    object Button1: TButton
      Left = 48
      Top = 335
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 7
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 207
      Top = 335
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 8
    end
    object BitBtn2: TBitBtn
      Tag = 1
      Left = 272
      Top = 10
      Width = 26
      Height = 25
      TabOrder = 9
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
    object BitBtn1: TBitBtn
      Left = 200
      Top = 118
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
      Left = 102
      Top = 36
      Width = 171
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 11
    end
    object Edit8: TEdit
      Left = 102
      Top = 61
      Width = 194
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 12
    end
    object ComboBox2: TComboBox
      Left = 102
      Top = 264
      Width = 106
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 13
      Text = 'ROSH'
      Items.Strings = (
        'ROSH'
        #38750'ROSH')
    end
    object dtpk1: TDateTimePicker
      Left = 102
      Top = 290
      Width = 105
      Height = 21
      Date = 40015.000000000000000000
      Time = 40015.000000000000000000
      TabOrder = 14
    end
  end
end
