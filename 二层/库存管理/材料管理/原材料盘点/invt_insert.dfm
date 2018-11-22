object Form5: TForm5
  Left = 495
  Top = 289
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #22312#30424#28857#28165#21333#25554#20837#20013#26448#26009
  ClientHeight = 290
  ClientWidth = 517
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 69
    Top = 14
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #24037#21378#20195#30721':'
  end
  object Label2: TLabel
    Left = 69
    Top = 45
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #24211#23384#26448#26009':'
  end
  object Label3: TLabel
    Left = 95
    Top = 118
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #22320#28857':'
  end
  object Label4: TLabel
    Left = 69
    Top = 143
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #20837#20179#22791#27880':'
  end
  object Label5: TLabel
    Left = 35
    Top = 172
    Width = 93
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#29616#25345#26377#25968#37327':'
  end
  object Label6: TLabel
    Left = 56
    Top = 200
    Width = 72
    Height = 13
    Alignment = taRightJustify
    Caption = #23454#38469#30424#28857#25968':'
  end
  object Label7: TLabel
    Left = 69
    Top = 228
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #28165#28857#20154#21592':'
  end
  object Label8: TLabel
    Left = 248
    Top = 227
    Width = 126
    Height = 13
    Caption = '                  '
  end
  object rkey05: TLabel
    Left = 16
    Top = 227
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object Label9: TLabel
    Left = 138
    Top = 68
    Width = 70
    Height = 13
    Caption = '          '
  end
  object Label10: TLabel
    Left = 74
    Top = 90
    Width = 54
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#31867#21035':'
  end
  object Label11: TLabel
    Left = 205
    Top = 89
    Width = 70
    Height = 13
    Caption = '          '
  end
  object rkey17: TLabel
    Left = 16
    Top = 72
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object rkey16: TLabel
    Left = 16
    Top = 104
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object rkey22: TLabel
    Left = 16
    Top = 48
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object DBEdit1: TDBEdit
    Left = 136
    Top = 11
    Width = 57
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'warehouse_code'
    DataSource = DM.DataSource1
    ReadOnly = True
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 201
    Top = 11
    Width = 153
    Height = 21
    TabStop = False
    Color = cl3DLight
    DataField = 'warehouse_name'
    DataSource = DM.DataSource1
    ReadOnly = True
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 136
    Top = 41
    Width = 193
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 2
  end
  object Edit2: TEdit
    Left = 136
    Top = 113
    Width = 58
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 3
  end
  object Edit3: TEdit
    Left = 201
    Top = 113
    Width = 153
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 4
  end
  object Edit4: TEdit
    Left = 136
    Top = 140
    Width = 153
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 5
  end
  object Edit5: TEdit
    Left = 136
    Top = 168
    Width = 97
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 6
  end
  object Edit6: TEdit
    Left = 136
    Top = 195
    Width = 97
    Height = 21
    TabOrder = 7
    Text = '0.0000'
    OnExit = Edit6Exit
    OnKeyPress = Edit6KeyPress
  end
  object Edit7: TEdit
    Left = 136
    Top = 224
    Width = 73
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = Edit7Click
    OnExit = Edit7Exit
  end
  object BitBtn1: TBitBtn
    Left = 182
    Top = 259
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 9
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 262
    Top = 259
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 10
  end
  object BitBtn3: TBitBtn
    Left = 336
    Top = 39
    Width = 25
    Height = 25
    TabOrder = 11
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
    Left = 215
    Top = 222
    Width = 25
    Height = 25
    TabOrder = 12
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
  object Edit8: TEdit
    Left = 136
    Top = 86
    Width = 58
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 13
  end
end
