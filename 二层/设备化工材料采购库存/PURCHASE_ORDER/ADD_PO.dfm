object Form2: TForm2
  Left = 425
  Top = 197
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #37319#36141#39033#30446#36755#20837
  ClientHeight = 407
  ClientWidth = 502
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #26032#23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label14: TLabel
    Left = 105
    Top = 52
    Width = 63
    Height = 13
    Alignment = taRightJustify
    Caption = #24211#23384#26448#26009':'
    Visible = False
  end
  object Label1: TLabel
    Left = 105
    Top = 52
    Width = 63
    Height = 13
    Alignment = taRightJustify
    Caption = #24211#23384#26448#26009':'
  end
  object Label2: TLabel
    Left = 180
    Top = 76
    Width = 7
    Height = 13
  end
  object Label3: TLabel
    Left = 119
    Top = 152
    Width = 49
    Height = 13
    Alignment = taRightJustify
    Caption = #20379#24212#21830':'
  end
  object Label4: TLabel
    Left = 133
    Top = 179
    Width = 35
    Height = 13
    Alignment = taRightJustify
    Caption = #24037#21378':'
  end
  object Label5: TLabel
    Left = 315
    Top = 151
    Width = 7
    Height = 13
  end
  object Label6: TLabel
    Left = 315
    Top = 179
    Width = 7
    Height = 13
  end
  object Label7: TLabel
    Left = 105
    Top = 205
    Width = 63
    Height = 13
    Alignment = taRightJustify
    Caption = #20132#36135#26085#26399':'
  end
  object Label8: TLabel
    Left = 105
    Top = 233
    Width = 63
    Height = 13
    Alignment = taRightJustify
    Caption = #20132#36135#25209#27425':'
  end
  object Label9: TLabel
    Left = 133
    Top = 259
    Width = 35
    Height = 13
    Alignment = taRightJustify
    Caption = #38388#38548':'
  end
  object Label10: TLabel
    Left = 105
    Top = 286
    Width = 63
    Height = 13
    Alignment = taRightJustify
    Caption = #37319#36141#25968#37327':'
  end
  object rkey17: TLabel
    Left = 18
    Top = 67
    Width = 7
    Height = 13
    Visible = False
  end
  object rkey23: TLabel
    Left = 18
    Top = 131
    Width = 7
    Height = 13
    Visible = False
  end
  object rkey15: TLabel
    Left = 18
    Top = 150
    Width = 7
    Height = 13
    Visible = False
  end
  object Label12: TLabel
    Left = 274
    Top = 258
    Width = 34
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '   '#22825#25968
  end
  object Label13: TLabel
    Left = 281
    Top = 284
    Width = 7
    Height = 13
  end
  object rkey02: TLabel
    Left = 18
    Top = 189
    Width = 7
    Height = 13
    Visible = False
  end
  object rkey01: TLabel
    Left = 18
    Top = 169
    Width = 7
    Height = 13
    Visible = False
  end
  object rkey103: TLabel
    Left = 18
    Top = 213
    Width = 7
    Height = 13
    Visible = False
  end
  object Label15: TLabel
    Left = 105
    Top = 101
    Width = 63
    Height = 13
    Alignment = taRightJustify
    Caption = #29305#27530#35828#26126':'
  end
  object Label16: TLabel
    Left = 104
    Top = 76
    Width = 64
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = ' '#29289#21697#35268#26684':'
    Visible = False
  end
  object Label18: TLabel
    Left = 105
    Top = 126
    Width = 63
    Height = 13
    Alignment = taRightJustify
    Caption = #37319#36141#21333#20301':'
    Visible = False
  end
  object Label19: TLabel
    Left = 291
    Top = 125
    Width = 7
    Height = 13
    Visible = False
  end
  object Label17: TLabel
    Left = 424
    Top = 309
    Width = 7
    Height = 13
    Visible = False
  end
  object Label20: TLabel
    Left = 105
    Top = 313
    Width = 63
    Height = 13
    Alignment = taRightJustify
    Caption = #37319#36141#20215#26684':'
  end
  object Label21: TLabel
    Left = 120
    Top = 339
    Width = 49
    Height = 13
    Alignment = taRightJustify
    Caption = '  '#31246#29575':'
  end
  object Label22: TLabel
    Left = 241
    Top = 336
    Width = 8
    Height = 16
    Caption = '%'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label23: TLabel
    Left = 277
    Top = 286
    Width = 140
    Height = 13
    Alignment = taRightJustify
    Caption = '  '#23384#36135'/'#37319#36141'('#36716#25442#29575'):'
  end
  object req_unitptr: TLabel
    Left = 21
    Top = 237
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object edit9: TComboBox
    Left = 176
    Top = 96
    Width = 172
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 3
    Visible = False
  end
  object Edit8: TEdit
    Left = 176
    Top = 48
    Width = 266
    Height = 21
    TabOrder = 1
    Visible = False
    OnKeyUp = Edit8KeyUp
  end
  object Edit1: TEdit
    Left = 176
    Top = 48
    Width = 169
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    MaxLength = 20
    ParentFont = False
    TabOrder = 0
    OnClick = Edit1Click
    OnExit = Edit1Exit
  end
  object BitBtn1: TBitBtn
    Left = 351
    Top = 46
    Width = 25
    Height = 25
    TabOrder = 5
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
  object Edit2: TEdit
    Left = 176
    Top = 148
    Width = 96
    Height = 21
    TabStop = False
    Color = cl3DLight
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    MaxLength = 5
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
  end
  object Edit3: TEdit
    Left = 176
    Top = 174
    Width = 96
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    MaxLength = 5
    ParentFont = False
    TabOrder = 7
    OnClick = Edit3Click
    OnExit = Edit3Exit
  end
  object BitBtn2: TBitBtn
    Left = 279
    Top = 145
    Width = 25
    Height = 25
    TabOrder = 8
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
  object BitBtn3: TBitBtn
    Left = 279
    Top = 173
    Width = 25
    Height = 25
    TabOrder = 9
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
  object Button1: TButton
    Left = 176
    Top = 375
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 16
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 256
    Top = 375
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 17
  end
  object MaskEdit1: TMaskEdit
    Left = 176
    Top = 201
    Width = 161
    Height = 21
    TabOrder = 10
    OnExit = MaskEdit1Exit
  end
  object Edit4: TEdit
    Left = 176
    Top = 228
    Width = 96
    Height = 21
    MaxLength = 3
    TabOrder = 11
    Text = '1'
    OnExit = Edit4Exit
    OnKeyPress = Edit4KeyPress
    OnKeyUp = Edit4KeyUp
  end
  object Edit5: TEdit
    Left = 176
    Top = 254
    Width = 96
    Height = 21
    Color = cl3DLight
    MaxLength = 3
    ReadOnly = True
    TabOrder = 12
    Text = '0'
    OnExit = Edit5Exit
    OnKeyPress = Edit4KeyPress
  end
  object Edit6: TEdit
    Left = 176
    Top = 281
    Width = 96
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    MaxLength = 12
    ParentFont = False
    TabOrder = 13
    Text = '0.00'
    OnClick = Edit6Click
    OnExit = Edit6Exit
    OnKeyPress = Edit6KeyPress
  end
  object Edit10: TEdit
    Left = 176
    Top = 72
    Width = 267
    Height = 21
    TabOrder = 2
    Visible = False
  end
  object Edit11: TEdit
    Left = 177
    Top = 122
    Width = 77
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    MaxLength = 5
    ParentFont = False
    TabOrder = 4
    Visible = False
    OnClick = Edit11Click
    OnExit = Edit11Exit
  end
  object BitBtn4: TBitBtn
    Left = 262
    Top = 120
    Width = 25
    Height = 25
    TabOrder = 18
    TabStop = False
    Visible = False
    OnExit = BitBtn4Exit
    OnMouseDown = BitBtn4MouseDown
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
  object RadioGroup1: TRadioGroup
    Left = 176
    Top = 5
    Width = 150
    Height = 39
    Caption = #37319#36141#22320#28857
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #22269#20869
      #22269#22806)
    TabOrder = 19
  end
  object Edit12: TEdit
    Left = 176
    Top = 96
    Width = 170
    Height = 21
    MaxLength = 20
    TabOrder = 20
  end
  object Button3: TButton
    Left = 389
    Top = 46
    Width = 75
    Height = 25
    Caption = #24211#23384#26597#35810
    TabOrder = 21
    OnClick = Button3Click
  end
  object Edit13: TEdit
    Left = 176
    Top = 308
    Width = 96
    Height = 21
    TabOrder = 14
    Text = '0.000'
    OnExit = Edit13Exit
    OnKeyPress = Edit13KeyPress
  end
  object Edit14: TEdit
    Left = 176
    Top = 335
    Width = 56
    Height = 21
    Enabled = False
    TabOrder = 15
    Text = '0.00'
    OnExit = Edit14Exit
    OnKeyPress = Edit14KeyPress
  end
  object Edit15: TEdit
    Left = 422
    Top = 282
    Width = 50
    Height = 21
    Color = cl3DLight
    Enabled = False
    ReadOnly = True
    TabOrder = 22
    Text = '1'
  end
end
