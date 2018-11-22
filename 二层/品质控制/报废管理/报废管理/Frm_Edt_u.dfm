object Frm_Edt: TFrm_Edt
  Left = 326
  Top = 173
  BorderStyle = bsDialog
  Caption = #32534#36753
  ClientHeight = 457
  ClientWidth = 479
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 20
    Top = 10
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #25253#24223#21333#21495':'
  end
  object Label2: TLabel
    Left = 20
    Top = 60
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #20316#19994#21333#21495':'
  end
  object Label10: TLabel
    Left = 20
    Top = 35
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #25253#24223#26085#26399':'
  end
  object Label11: TLabel
    Left = 280
    Top = 63
    Width = 7
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label17: TLabel
    Left = 340
    Top = 115
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #26412#21378#32534#21495':'
  end
  object Label18: TLabel
    Left = 340
    Top = 155
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #23458#25143#22411#21495':'
  end
  object Label19: TLabel
    Left = 333
    Top = 132
    Width = 7
    Height = 13
  end
  object Label20: TLabel
    Left = 333
    Top = 176
    Width = 7
    Height = 13
  end
  object Label22: TLabel
    Left = 20
    Top = 84
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #25253#24223#24037#21378':'
  end
  object Label23: TLabel
    Left = 290
    Top = 85
    Width = 33
    Height = 13
    Caption = #22791#27880':'
  end
  object BtSv: TBitBtn
    Left = 362
    Top = 364
    Width = 67
    Height = 27
    Hint = #25353'F5'#20445#23384
    Caption = #20445#23384
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = BtSvClick
    Glyph.Data = {
      66010000424D6601000000000000760000002800000014000000140000000100
      040000000000F000000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
      FFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFF5AFFFFF
      0000000000000FFFF5AFFFF08B000000880B0FFF55FAFFF0B800000088080FFF
      55FAFFF08B000000880B0FFFFFFFFFF0B800000000080FFFFFFFFFF08B8B8B8B
      8B8B0FFFFFFFFFF0B800000000B80FFFFFFFFFF080888888880B0FFFFFFFFFF0
      B088888888080FFFFFFFFFF080888888880B0FFFFFFFFFF0B088888888080FFF
      FFFFFFF08088888888000FFFFFFFFFF0B088888888080FFFFFFFFFF000000000
      00000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
      FFFFFFFFFFFFFFFF0000}
  end
  object BtClose: TBitBtn
    Left = 361
    Top = 294
    Width = 67
    Height = 27
    Caption = #21462#28040
    TabOrder = 6
    TabStop = False
    OnClick = BtCloseClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
      F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
      000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
      338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
      45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
      3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
      F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
      000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
      338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
      4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
      8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
      333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
      0000}
    NumGlyphs = 2
  end
  object Edit1: TMaskEdit
    Left = 88
    Top = 7
    Width = 145
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 15
    TabOrder = 7
  end
  object Edit2: TEdit
    Left = 88
    Top = 57
    Width = 159
    Height = 21
    TabOrder = 2
    OnEnter = Edit2Enter
    OnExit = Edit2Exit
  end
  object BtWorkNo: TBitBtn
    Left = 247
    Top = 57
    Width = 22
    Height = 21
    TabOrder = 8
    TabStop = False
    OnClick = BtWorkNoClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000120B0000120B00001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
      DADA000000000000ADAD0FFFFFFFFFF0DADA0F00F00000F0ADAD0FFFFFFFFFF0
      DADA0F00F00000F0ADAD0FFFFFFFFFF0DADA0FFFFFFF0FF0ADAD0FF0FFF080F0
      DAD40F080F0808000D440FF08080808880440000080808888844DADAD0808888
      8844ADADAD0888888044DADADAD000000A44ADADADADADADADAD}
  end
  object CkBAudit: TCheckBox
    Left = 339
    Top = 24
    Width = 86
    Height = 31
    Caption = #23457#26680
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -24
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 9
  end
  object DtRej: TDateTimePicker
    Left = 88
    Top = 32
    Width = 99
    Height = 21
    Date = 39592.000000000000000000
    Time = 39592.000000000000000000
    Enabled = False
    TabOrder = 0
  end
  object TmRej: TDateTimePicker
    Left = 184
    Top = 32
    Width = 87
    Height = 21
    Date = 39592.471784965280000000
    Time = 39592.471784965280000000
    Enabled = False
    Kind = dtkTime
    TabOrder = 1
  end
  object GroupBox1: TGroupBox
    Left = 18
    Top = 108
    Width = 312
    Height = 140
    Caption = #24403#21069#22312#32447#20449#24687
    TabOrder = 10
    object Label12: TLabel
      Left = 14
      Top = 20
      Width = 93
      Height = 13
      Alignment = taRightJustify
      Caption = #29983#20135#32447#23384#25968'PCS:'
    end
    object Label15: TLabel
      Left = 51
      Top = 68
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'PCS/PNL:'
    end
    object Label14: TLabel
      Left = 14
      Top = 44
      Width = 93
      Height = 13
      Alignment = taRightJustify
      Caption = #29983#20135#32447#23384#25968'PNL:'
    end
    object Label6: TLabel
      Left = 48
      Top = 115
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = #24403#21069#24037#24207':'
    end
    object Label9: TLabel
      Left = 3
      Top = 92
      Width = 104
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #25253#24223#24050#30003#35831#25968#37327':'
    end
    object Edit5: TEdit
      Left = 107
      Top = 18
      Width = 174
      Height = 21
      Color = clScrollBar
      Enabled = False
      TabOrder = 0
    end
    object Edit10: TEdit
      Left = 107
      Top = 66
      Width = 174
      Height = 21
      Color = clScrollBar
      Enabled = False
      TabOrder = 1
    end
    object Edit9: TEdit
      Left = 107
      Top = 42
      Width = 174
      Height = 21
      Color = clScrollBar
      Enabled = False
      TabOrder = 2
    end
    object Edit7: TEdit
      Left = 107
      Top = 113
      Width = 121
      Height = 21
      Color = clScrollBar
      Enabled = False
      TabOrder = 3
    end
    object Edit11: TEdit
      Left = 107
      Top = 90
      Width = 174
      Height = 21
      Color = clScrollBar
      Enabled = False
      TabOrder = 4
    end
    object Button1: TButton
      Left = 230
      Top = 113
      Width = 79
      Height = 25
      Caption = #22312#32447'PNL'#28165#38646
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = Button1Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 17
    Top = 250
    Width = 304
    Height = 203
    Caption = #25253#24223#20449#24687
    TabOrder = 4
    object Label3: TLabel
      Left = 62
      Top = 40
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = #32570#38519#20195#21495':'
    end
    object Label16: TLabel
      Left = 62
      Top = 16
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = #30003#35831#24037#24207':'
    end
    object Label5: TLabel
      Left = 27
      Top = 149
      Width = 94
      Height = 13
      Alignment = taRightJustify
      Caption = #25253#24223#25968#37327'(PCS):'
    end
    object Label13: TLabel
      Left = 26
      Top = 172
      Width = 100
      Height = 13
      Alignment = taRightJustify
      Caption = #25253#24223#25968#37327'(PNL)'#65306
    end
    object Label7: TLabel
      Left = 64
      Top = 107
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = #36131#20219#37096#38376':'
    end
    object Label4: TLabel
      Left = 127
      Top = 62
      Width = 154
      Height = 13
      AutoSize = False
    end
    object Label8: TLabel
      Left = 128
      Top = 131
      Width = 155
      Height = 13
      AutoSize = False
    end
    object Label21: TLabel
      Left = 129
      Top = 84
      Width = 154
      Height = 13
      AutoSize = False
    end
    object BtDefault: TBitBtn
      Tag = 1
      Left = 263
      Top = 37
      Width = 22
      Height = 22
      TabOrder = 5
      TabStop = False
      OnClick = BtDefaultClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADA000000000000ADAD0FFFFFFFFFF0DADA0F00F00000F0ADAD0FFFFFFFFFF0
        DADA0F00F00000F0ADAD0FFFFFFFFFF0DADA0FFFFFFF0FF0ADAD0FF0FFF080F0
        DAD40F080F0808000D440FF08080808880440000080808888844DADAD0808888
        8844ADADAD0888888044DADADAD000000A44ADADADADADADADAD}
    end
    object Edit3: TEdit
      Left = 130
      Top = 37
      Width = 134
      Height = 21
      TabOrder = 1
      OnExit = Edit3Exit
    end
    object ComboBox1: TComboBox
      Left = 130
      Top = 11
      Width = 153
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
    end
    object Edit4: TEdit
      Left = 128
      Top = 146
      Width = 135
      Height = 21
      TabOrder = 3
      OnKeyPress = Edit4KeyPress
    end
    object Edit8: TMaskEdit
      Left = 128
      Top = 169
      Width = 135
      Height = 21
      TabOrder = 4
      OnKeyPress = Edit4KeyPress
    end
    object BitBtn3: TBitBtn
      Tag = 2
      Left = 263
      Top = 146
      Width = 24
      Height = 24
      TabOrder = 6
      TabStop = False
      OnClick = BitBtn3Click
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDD0000DDDD777777777777DDDD0000DDD00000000000007DDD0000DD0F
        EFEFEFEFEFEF07DD0000DD0E00000E00000E07DD0000DD0F88880F88880F07DD
        0000DD0EFEFEFEFEFEFE07DD0000DD0F00E00F00E00F07DD0000DD0E80F80E80
        F80E07DD0000DD0FEFEFEFEFEFEF07DD0000DD0E00F00E00F00E07DD0000DD0F
        80E80F80E80F07DD0000DD0EFEFEFEFEFEFE07DD0000DD0F00000000000F07DD
        0000DD0E08181881880E07DD0000DD0F08818818180F07DD0000DD0E00000000
        000E07DD0000DD0FEFEFEFEFEFEF0DDD0000DDD0000000000000DDDD0000DDDD
        DDDDDDDDDDDDDDDD0000}
    end
    object BtDept: TBitBtn
      Tag = 4
      Left = 263
      Top = 106
      Width = 21
      Height = 22
      TabOrder = 7
      TabStop = False
      OnClick = BtDeptClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADA000000000000ADAD0FFFFFFFFFF0DADA0F00F00000F0ADAD0FFFFFFFFFF0
        DADA0F00F00000F0ADAD0FFFFFFFFFF0DADA0FFFFFFF0FF0ADAD0FF0FFF080F0
        DAD40F080F0808000D440FF08080808880440000080808888844DADAD0808888
        8844ADADAD0888888044DADADAD000000A44ADADADADADADADAD}
    end
    object Edit6: TEdit
      Left = 128
      Top = 106
      Width = 135
      Height = 21
      TabOrder = 2
      OnExit = Edit6Exit
    end
    object BitBtn5: TBitBtn
      Tag = 3
      Left = 264
      Top = 169
      Width = 24
      Height = 24
      TabOrder = 8
      TabStop = False
      OnClick = BitBtn3Click
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDD0000DDDD777777777777DDDD0000DDD00000000000007DDD0000DD0F
        EFEFEFEFEFEF07DD0000DD0E00000E00000E07DD0000DD0F88880F88880F07DD
        0000DD0EFEFEFEFEFEFE07DD0000DD0F00E00F00E00F07DD0000DD0E80F80E80
        F80E07DD0000DD0FEFEFEFEFEFEF07DD0000DD0E00F00E00F00E07DD0000DD0F
        80E80F80E80F07DD0000DD0EFEFEFEFEFEFE07DD0000DD0F00000000000F07DD
        0000DD0E08181881880E07DD0000DD0F08818818180F07DD0000DD0E00000000
        000E07DD0000DD0FEFEFEFEFEFEF0DDD0000DDD0000000000000DDDD0000DDDD
        DDDDDDDDDDDDDDDD0000}
    end
  end
  object ComboBox2: TComboBox
    Left = 88
    Top = 80
    Width = 185
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 3
    OnChange = ComboBox2Change
  end
  object Edit12: TEdit
    Left = 328
    Top = 82
    Width = 121
    Height = 21
    MaxLength = 30
    TabOrder = 11
  end
  object ActionList1: TActionList
    Left = 544
    Top = 32
    object ActSv: TAction
      Caption = 'ActSv'
      ShortCut = 116
      OnExecute = BtSvClick
    end
    object ActClose: TAction
      Caption = 'ActClose'
      ShortCut = 27
      OnExecute = BtCloseClick
    end
  end
end
