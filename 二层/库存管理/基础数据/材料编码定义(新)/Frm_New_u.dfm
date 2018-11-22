object Frm_New: TFrm_New
  Left = 381
  Top = 213
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #26032#22686#21407#26448#26009
  ClientHeight = 482
  ClientWidth = 575
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 37
    Top = 65
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #26448#26009#32534#30721':'
  end
  object Label2: TLabel
    Left = 30
    Top = 93
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#26448#26009#21517#31216':'
  end
  object Label3: TLabel
    Left = 31
    Top = 21
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#26448#26009#31867#21035':'
  end
  object Label4: TLabel
    Left = 29
    Top = 147
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#23384#36135#21333#20301':'
  end
  object Label5: TLabel
    Left = 30
    Top = 179
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#37319#36141#21333#20301':'
  end
  object Label7: TLabel
    Left = 225
    Top = 19
    Width = 7
    Height = 13
  end
  object Label8: TLabel
    Left = 230
    Top = 149
    Width = 21
    Height = 13
    Caption = '   '
  end
  object Label9: TLabel
    Left = 228
    Top = 179
    Width = 28
    Height = 13
    Caption = '    '
  end
  object ctype: TLabel
    Left = 107
    Top = 42
    Width = 56
    Height = 13
    Caption = '        '
  end
  object Label12: TLabel
    Tag = 5
    Left = 30
    Top = 118
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#26448#26009#35268#26684':'
  end
  object Edit1: TEdit
    Left = 105
    Top = 16
    Width = 83
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Edit1Click
    OnExit = Edit1Exit
  end
  object Edit2: TEdit
    Left = 102
    Top = 145
    Width = 83
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = Edit2Click
    OnExit = Edit2Exit
  end
  object Edit3: TEdit
    Left = 102
    Top = 175
    Width = 83
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = Edit3Click
    OnExit = Edit3Exit
  end
  object BitBtn1: TBitBtn
    Left = 193
    Top = 16
    Width = 25
    Height = 24
    TabOrder = 0
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
  object BitBtn2: TBitBtn
    Left = 190
    Top = 143
    Width = 25
    Height = 25
    TabOrder = 7
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
  object BitBtn3: TBitBtn
    Left = 190
    Top = 174
    Width = 25
    Height = 25
    TabOrder = 8
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
  object BtnOk: TButton
    Left = 211
    Top = 451
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 9
    OnClick = BtnOkClick
  end
  object Button2: TButton
    Left = 291
    Top = 450
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 10
    OnClick = Button2Click
  end
  object MaskEdit1: TMaskEdit
    Left = 104
    Top = 61
    Width = 276
    Height = 21
    MaxLength = 25
    TabOrder = 2
  end
  object Edit4: TEdit
    Left = 104
    Top = 115
    Width = 446
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    MaxLength = 70
    ParentFont = False
    TabOrder = 4
    OnClick = Edit2Click
    OnExit = Edit2Exit
  end
  object Edit5: TEdit
    Left = 104
    Top = 88
    Width = 323
    Height = 21
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    MaxLength = 30
    ParentFont = False
    TabOrder = 3
    OnClick = Edit2Click
    OnExit = Edit2Exit
  end
  object StringGrid1: TStringGrid
    Left = 36
    Top = 212
    Width = 469
    Height = 229
    ColCount = 8
    DefaultRowHeight = 19
    FixedCols = 2
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing]
    TabOrder = 11
    OnKeyPress = StringGrid1KeyPress
    OnSelectCell = StringGrid1SelectCell
    ColWidths = (
      79
      152
      146
      47
      64
      64
      64
      64)
    RowHeights = (
      19
      19)
  end
  object ComboBox1: TComboBox
    Tag = 11
    Left = 270
    Top = 233
    Width = 150
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 12
    Visible = False
    OnChange = ComboBox1Change
    OnExit = ComboBox1Exit
  end
  object ComboBox2: TComboBox
    Tag = 12
    Left = 270
    Top = 253
    Width = 150
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 13
    Visible = False
    OnChange = ComboBox2Change
    OnExit = ComboBox2Exit
  end
  object ComboBox3: TComboBox
    Tag = 13
    Left = 270
    Top = 273
    Width = 150
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 14
    Visible = False
    OnChange = ComboBox3Change
    OnExit = ComboBox3Exit
  end
  object ComboBox4: TComboBox
    Tag = 14
    Left = 270
    Top = 293
    Width = 150
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 15
    Visible = False
    OnChange = ComboBox4Change
    OnExit = ComboBox4Exit
  end
  object ComboBox5: TComboBox
    Tag = 15
    Left = 270
    Top = 313
    Width = 150
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 16
    Visible = False
    OnChange = ComboBox5Change
    OnExit = ComboBox5Exit
  end
  object ComboBox6: TComboBox
    Tag = 16
    Left = 270
    Top = 333
    Width = 150
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 17
    Visible = False
    OnChange = ComboBox6Change
    OnExit = ComboBox6Exit
  end
  object ComboBox7: TComboBox
    Tag = 17
    Left = 270
    Top = 353
    Width = 150
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 18
    Visible = False
    OnChange = ComboBox7Change
    OnExit = ComboBox7Exit
  end
  object ComboBox8: TComboBox
    Tag = 18
    Left = 270
    Top = 374
    Width = 150
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 19
    Visible = False
    OnChange = ComboBox8Change
    OnExit = ComboBox8Exit
  end
  object ComboBox9: TComboBox
    Tag = 19
    Left = 270
    Top = 394
    Width = 150
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 20
    Visible = False
    OnChange = ComboBox9Change
    OnExit = ComboBox9Exit
  end
  object ComboBox10: TComboBox
    Tag = 20
    Left = 270
    Top = 414
    Width = 150
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 21
    Visible = False
    OnChange = ComboBox10Change
  end
  object ComboBox11: TComboBox
    Tag = 21
    Left = 189
    Top = 233
    Width = 73
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 22
    Visible = False
    OnChange = ComboBox1Change
    OnExit = ComboBox1Exit
  end
  object ComboBox12: TComboBox
    Tag = 22
    Left = 189
    Top = 253
    Width = 73
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 23
    Visible = False
    OnChange = ComboBox1Change
    OnExit = ComboBox2Exit
  end
  object ComboBox13: TComboBox
    Tag = 23
    Left = 189
    Top = 273
    Width = 73
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 24
    Visible = False
    OnChange = ComboBox1Change
    OnExit = ComboBox3Exit
  end
  object ComboBox14: TComboBox
    Tag = 24
    Left = 189
    Top = 293
    Width = 73
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 25
    Visible = False
    OnChange = ComboBox1Change
    OnExit = ComboBox4Exit
  end
  object ComboBox15: TComboBox
    Tag = 25
    Left = 189
    Top = 313
    Width = 73
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 26
    Visible = False
    OnChange = ComboBox1Change
    OnExit = ComboBox5Exit
  end
  object ComboBox16: TComboBox
    Tag = 26
    Left = 189
    Top = 333
    Width = 73
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 27
    Visible = False
    OnChange = ComboBox1Change
    OnExit = ComboBox6Exit
  end
  object ComboBox17: TComboBox
    Tag = 27
    Left = 189
    Top = 353
    Width = 73
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 28
    Visible = False
    OnChange = ComboBox1Change
    OnExit = ComboBox7Exit
  end
  object ComboBox18: TComboBox
    Tag = 28
    Left = 189
    Top = 374
    Width = 73
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 29
    Visible = False
    OnChange = ComboBox1Change
    OnExit = ComboBox8Exit
  end
  object ComboBox19: TComboBox
    Tag = 29
    Left = 189
    Top = 394
    Width = 73
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 30
    Visible = False
    OnChange = ComboBox1Change
    OnExit = ComboBox9Exit
  end
  object ComboBox20: TComboBox
    Tag = 30
    Left = 189
    Top = 414
    Width = 73
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 31
    Visible = False
    OnChange = ComboBox1Change
  end
end
