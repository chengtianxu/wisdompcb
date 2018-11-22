object Form7: TForm7
  Left = 798
  Top = 166
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26434#39033#29289#26009#30452#25509#20837#20179#26126#32454
  ClientHeight = 362
  ClientWidth = 361
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label8: TLabel
    Left = 38
    Top = 13
    Width = 59
    Height = 13
    Caption = #29289#26009#21517#31216':'
  end
  object Label1: TLabel
    Left = 38
    Top = 40
    Width = 59
    Height = 13
    Caption = #29289#26009#35268#26684':'
  end
  object Label2: TLabel
    Left = 38
    Top = 65
    Width = 59
    Height = 13
    Caption = #29289#26009#31867#21035':'
  end
  object Label3: TLabel
    Left = 38
    Top = 121
    Width = 59
    Height = 13
    Caption = #23384#36135#21333#20301':'
  end
  object Label4: TLabel
    Left = 38
    Top = 150
    Width = 33
    Height = 13
    Caption = #25968#37327':'
  end
  object Label5: TLabel
    Left = 38
    Top = 178
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #21547#31246#20215#26684':'
  end
  object Label6: TLabel
    Left = 38
    Top = 206
    Width = 40
    Height = 13
    Caption = #31246#29575'%:'
  end
  object Label7: TLabel
    Left = 38
    Top = 235
    Width = 33
    Height = 13
    Caption = #22791#27880':'
  end
  object Label9: TLabel
    Left = 284
    Top = 122
    Width = 7
    Height = 13
  end
  object Label11: TLabel
    Left = 38
    Top = 263
    Width = 59
    Height = 13
    Caption = #29615#20445#26631#35782':'
  end
  object Label12: TLabel
    Left = 38
    Top = 292
    Width = 59
    Height = 13
    Caption = #21046#36896#26085#26399':'
  end
  object Label10: TLabel
    Left = 38
    Top = 94
    Width = 59
    Height = 13
    Caption = #20179#24211#20301#32622':'
  end
  object rkey16: TLabel
    Left = 21
    Top = 95
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object rkey02: TLabel
    Left = 21
    Top = 122
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object Label13: TLabel
    Left = 226
    Top = 120
    Width = 7
    Height = 13
  end
  object Edit1: TEdit
    Left = 100
    Top = 10
    Width = 129
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 100
    Top = 36
    Width = 244
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 100
    Top = 117
    Width = 89
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 2
    OnExit = Edit3Exit
  end
  object Edit4: TEdit
    Left = 100
    Top = 146
    Width = 121
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 3
    Text = '0.0000'
    OnExit = Edit4Exit
    OnKeyPress = Edit4KeyPress
  end
  object Edit5: TEdit
    Left = 100
    Top = 174
    Width = 121
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 4
    Text = '0.0000'
    OnExit = Edit5Exit
  end
  object Edit6: TEdit
    Left = 100
    Top = 202
    Width = 49
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 5
    Text = '0.00'
    OnExit = Edit6Exit
  end
  object Edit7: TEdit
    Left = 100
    Top = 231
    Width = 121
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    MaxLength = 50
    TabOrder = 6
  end
  object Button1: TButton
    Left = 112
    Top = 319
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 7
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 215
    Top = 319
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 8
  end
  object BitBtn1: TBitBtn
    Left = 193
    Top = 114
    Width = 25
    Height = 25
    TabOrder = 9
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
  object ComboBox2: TComboBox
    Left = 100
    Top = 260
    Width = 123
    Height = 21
    Hint = 'F2'#38190#19979#25289#36873#39033#26694
    Style = csDropDownList
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    ItemHeight = 13
    ItemIndex = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    Text = 'ROSH'
    OnKeyDown = ComboBox2KeyDown
    Items.Strings = (
      'ROSH'
      #38750'ROSH')
  end
  object dtpk1: TDateTimePicker
    Left = 100
    Top = 288
    Width = 105
    Height = 21
    Date = 40015.000000000000000000
    Time = 40015.000000000000000000
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 11
  end
  object ComboBox1: TComboBox
    Left = 100
    Top = 89
    Width = 169
    Height = 21
    Hint = 'F2'#38190#19979#25289#36873#39033#26694
    Style = csDropDownList
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    OnChange = ComboBox1Change
    OnKeyDown = ComboBox1KeyDown
  end
  object ComboBox3: TComboBox
    Left = 100
    Top = 62
    Width = 169
    Height = 21
    Hint = 'F2'#38190#19979#25289#36873#39033#26694
    Style = csDropDownList
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    ItemHeight = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
    OnKeyDown = ComboBox3KeyDown
  end
end
