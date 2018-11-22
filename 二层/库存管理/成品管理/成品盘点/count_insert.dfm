object Form5: TForm5
  Left = 242
  Top = 196
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #22312#30424#28857#28165#21333#20013#25554#20837#23458#25143#37096#20214
  ClientHeight = 305
  ClientWidth = 536
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 107
    Top = 25
    Width = 40
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#23458#25143':'
  end
  object Label2: TLabel
    Left = 81
    Top = 53
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#23458#25143#37096#20214':'
  end
  object Label4: TLabel
    Left = 107
    Top = 131
    Width = 40
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#20301#32622':'
  end
  object Label5: TLabel
    Left = 81
    Top = 159
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#38468#21152#21442#32771':'
  end
  object Label6: TLabel
    Left = 81
    Top = 187
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#30424#28857#25968#37327':'
  end
  object Label7: TLabel
    Left = 81
    Top = 216
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#28165#28857#20154#21592':'
  end
  object Label8: TLabel
    Left = 156
    Top = 75
    Width = 49
    Height = 13
    Caption = '       '
  end
  object rkey10: TLabel
    Left = 33
    Top = 25
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object Label9: TLabel
    Left = 312
    Top = 24
    Width = 42
    Height = 13
    Caption = '      '
  end
  object rkey50: TLabel
    Left = 33
    Top = 52
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object Label10: TLabel
    Left = 259
    Top = 130
    Width = 56
    Height = 13
    Caption = '        '
  end
  object Label11: TLabel
    Left = 258
    Top = 215
    Width = 63
    Height = 13
    Caption = '         '
  end
  object rkey16: TLabel
    Left = 32
    Top = 131
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object rkey05: TLabel
    Left = 32
    Top = 216
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object Label12: TLabel
    Left = 81
    Top = 245
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#21046#36896#26085#26399':'
  end
  object Button1: TButton
    Left = 192
    Top = 274
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 11
    OnClick = Button1Click
    OnEnter = Button1Enter
  end
  object Button2: TButton
    Left = 277
    Top = 274
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 12
  end
  object Edit1: TEdit
    Left = 152
    Top = 21
    Width = 121
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Edit1Click
    OnExit = Edit1Exit
  end
  object Edit2: TEdit
    Left = 152
    Top = 48
    Width = 197
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Edit2Click
    OnExit = Edit2Exit
  end
  object Edit4: TEdit
    Left = 152
    Top = 126
    Width = 66
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Edit4Click
    OnExit = Edit4Exit
  end
  object Edit5: TEdit
    Left = 152
    Top = 182
    Width = 121
    Height = 21
    TabOrder = 4
    Text = '0'
    OnExit = Edit5Exit
    OnKeyPress = Edit5KeyPress
  end
  object Edit6: TEdit
    Left = 152
    Top = 212
    Width = 66
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = Edit6Click
    OnExit = Edit6Exit
  end
  object BitBtn1: TBitBtn
    Left = 281
    Top = 19
    Width = 25
    Height = 25
    TabOrder = 6
    TabStop = False
    OnClick = BitBtn1Click
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
  object BitBtn2: TBitBtn
    Left = 356
    Top = 46
    Width = 25
    Height = 25
    TabOrder = 7
    TabStop = False
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
  object BitBtn3: TBitBtn
    Left = 226
    Top = 125
    Width = 25
    Height = 25
    TabOrder = 8
    TabStop = False
    OnClick = BitBtn3Click
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
  object BitBtn4: TBitBtn
    Left = 225
    Top = 210
    Width = 25
    Height = 25
    TabOrder = 9
    TabStop = False
    OnClick = BitBtn4Click
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
  object Edit7: TEdit
    Left = 152
    Top = 152
    Width = 196
    Height = 21
    MaxLength = 20
    TabOrder = 3
  end
  object MaskEdit1: TMaskEdit
    Left = 152
    Top = 240
    Width = 96
    Height = 21
    EditMask = '!0000-!90-90;1;_'
    MaxLength = 10
    TabOrder = 10
    Text = '    -  -  '
  end
end
