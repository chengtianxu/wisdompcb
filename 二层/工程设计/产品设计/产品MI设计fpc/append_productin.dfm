object Form_append: TForm_append
  Left = 287
  Top = 187
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26032#24314#22810#23618#26495#20869#23618
  ClientHeight = 423
  ClientWidth = 533
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 125
    Top = 70
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #20869#23618#32534#21495':'
  end
  object Label2: TLabel
    Left = 125
    Top = 94
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #23458#25143#22411#21495':'
  end
  object Label4: TLabel
    Left = 151
    Top = 118
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #23618#25968':'
  end
  object Label12: TLabel
    Left = 125
    Top = 148
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #22823#26009#35268#26684':'
  end
  object Label3: TLabel
    Left = 125
    Top = 171
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #20135#21697#31867#22411':'
  end
  object Label9: TLabel
    Left = 131
    Top = 196
    Width = 53
    Height = 13
    Alignment = taRightJustify
    Caption = #25253#24223#29575'%:'
  end
  object Label6: TLabel
    Left = 98
    Top = 221
    Width = 86
    Height = 13
    Alignment = taRightJustify
    Caption = #29983#20135#21608#26399'('#22825'):'
  end
  object Label7: TLabel
    Left = 85
    Top = 245
    Width = 99
    Height = 13
    Alignment = taRightJustify
    Caption = #21046#36896#25552#20132#26399'('#22825'):'
  end
  object Label10: TLabel
    Left = 98
    Top = 270
    Width = 86
    Height = 13
    Alignment = taRightJustify
    Caption = #26377#25928#23384#26399'('#22825'):'
  end
  object Label8: TLabel
    Left = 64
    Top = 295
    Width = 120
    Height = 13
    Alignment = taRightJustify
    Caption = #26368#20339#27969#36716#25209#37327'(PNL):'
  end
  object Label34: TLabel
    Left = 125
    Top = 320
    Width = 59
    Height = 13
    Caption = #27969#31243#27169#22411':'
  end
  object Label5: TLabel
    Left = 352
    Top = 172
    Width = 28
    Height = 13
    Caption = '    '
  end
  object Label11: TLabel
    Left = 350
    Top = 320
    Width = 21
    Height = 13
    Caption = '   '
  end
  object rkey08: TLabel
    Left = 33
    Top = 171
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object rkey504: TLabel
    Left = 33
    Top = 321
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object Label13: TLabel
    Left = 125
    Top = 43
    Width = 59
    Height = 13
    Caption = #22806#23618#32534#21495':'
  end
  object Edit1: TEdit
    Left = 193
    Top = 65
    Width = 121
    Height = 21
    MaxLength = 20
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 193
    Top = 90
    Width = 157
    Height = 21
    Color = cl3DLight
    MaxLength = 40
    ReadOnly = True
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 193
    Top = 114
    Width = 58
    Height = 21
    MaxLength = 2
    TabOrder = 2
    Text = '1'
    OnKeyPress = Edit3KeyPress
    OnKeyUp = Edit3KeyUp
  end
  object Edit4: TEdit
    Left = 193
    Top = 144
    Width = 176
    Height = 21
    MaxLength = 50
    TabOrder = 3
  end
  object Edit5: TEdit
    Left = 193
    Top = 168
    Width = 121
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 4
  end
  object Edit6: TEdit
    Left = 193
    Top = 192
    Width = 64
    Height = 21
    ReadOnly = True
    TabOrder = 5
    Text = 'Edit6'
    OnKeyPress = Edit6KeyPress
  end
  object Edit7: TEdit
    Left = 193
    Top = 216
    Width = 64
    Height = 21
    TabOrder = 6
    Text = 'Edit7'
    OnKeyPress = Edit3KeyPress
  end
  object Edit8: TEdit
    Left = 193
    Top = 240
    Width = 64
    Height = 21
    TabOrder = 7
    Text = 'Edit8'
    OnKeyPress = Edit3KeyPress
  end
  object Edit9: TEdit
    Left = 193
    Top = 265
    Width = 64
    Height = 21
    TabOrder = 8
    Text = 'Edit9'
    OnKeyPress = Edit3KeyPress
  end
  object Edit10: TEdit
    Left = 193
    Top = 291
    Width = 64
    Height = 21
    TabOrder = 9
    Text = 'Edit10'
    OnKeyPress = Edit3KeyPress
  end
  object Edit11: TEdit
    Left = 193
    Top = 316
    Width = 121
    Height = 21
    TabOrder = 10
    OnExit = Edit11Exit
  end
  object BitBtn1: TBitBtn
    Left = 319
    Top = 166
    Width = 25
    Height = 25
    TabOrder = 11
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
  object BitBtn2: TBitBtn
    Left = 319
    Top = 313
    Width = 25
    Height = 25
    TabOrder = 12
    OnClick = BitBtn2Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
      333333777777777F33333330B00000003333337F7777777F3333333000000000
      333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
      333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
      03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
      03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
      3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
      333333333377F7F33333333333330F03333333333337F7F33333333333330B03
      3333333333373733333333333333303333333333333373333333}
    NumGlyphs = 2
  end
  object Button1: TButton
    Left = 184
    Top = 376
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 13
    OnClick = Button1Click
    OnEnter = Button1Enter
  end
  object Button2: TButton
    Left = 272
    Top = 376
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 14
  end
  object Edit12: TEdit
    Left = 193
    Top = 40
    Width = 121
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 15
  end
end
