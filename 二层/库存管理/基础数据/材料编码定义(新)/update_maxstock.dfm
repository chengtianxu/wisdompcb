object frm_updatemaxstock: Tfrm_updatemaxstock
  Left = 651
  Top = 228
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26356#26032#26368#39640#24211#23384
  ClientHeight = 342
  ClientWidth = 502
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
  object Label10: TLabel
    Left = 20
    Top = 43
    Width = 59
    Height = 13
    Caption = #20215#26684#26469#28304':'
  end
  object Label1: TLabel
    Left = 25
    Top = 70
    Width = 48
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #30446#30340#22320
  end
  object Bevel1: TBevel
    Left = 22
    Top = 150
    Width = 185
    Height = 106
    Shape = bsFrame
  end
  object Label2: TLabel
    Left = 48
    Top = 171
    Width = 13
    Height = 13
    Caption = #20174
  end
  object Label3: TLabel
    Left = 48
    Top = 215
    Width = 13
    Height = 13
    Caption = #21040
  end
  object Label5: TLabel
    Left = 224
    Top = 170
    Width = 38
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #36215#22987':'
  end
  object Label6: TLabel
    Left = 224
    Top = 213
    Width = 38
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #32467#26463':'
  end
  object Bevel2: TBevel
    Left = 216
    Top = 152
    Width = 269
    Height = 104
    Shape = bsFrame
  end
  object Label4: TLabel
    Left = 45
    Top = 145
    Width = 52
    Height = 13
    Alignment = taRightJustify
    Caption = #26085#26399#33539#22260
  end
  object Label7: TLabel
    Left = 227
    Top = 145
    Width = 73
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = #21407#26448#26009#33539#22260
    ParentBiDiMode = False
  end
  object Label8: TLabel
    Left = 20
    Top = 104
    Width = 60
    Height = 13
    Caption = #30334#20998#27604'(%)'
  end
  object Label9: TLabel
    Left = 272
    Top = 192
    Width = 7
    Height = 13
  end
  object Label11: TLabel
    Left = 272
    Top = 232
    Width = 7
    Height = 13
  end
  object ComboBox1: TComboBox
    Left = 81
    Top = 40
    Width = 121
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 0
    Text = #25353#28040#32791#25968#37327
    OnChange = ComboBox1Change
    Items.Strings = (
      #25353#28040#32791#25968#37327
      #25353#37319#36141#25968#37327)
  end
  object Edit1: TEdit
    Left = 81
    Top = 67
    Width = 121
    Height = 21
    TabStop = False
    Color = cl3DLight
    TabOrder = 1
    Text = #26368#39640#24211#23384
  end
  object DTpk1: TDateTimePicker
    Left = 73
    Top = 168
    Width = 80
    Height = 21
    Date = 42430.433484490700000000
    Format = 'yyyy-MM'
    Time = 42430.433484490700000000
    DateMode = dmUpDown
    TabOrder = 2
  end
  object DTpk2: TDateTimePicker
    Left = 73
    Top = 211
    Width = 80
    Height = 21
    Date = 42522.433551597200000000
    Format = 'yyyy-MM'
    Time = 42522.433551597200000000
    DateMode = dmUpDown
    TabOrder = 3
  end
  object Edit2: TEdit
    Left = 270
    Top = 167
    Width = 157
    Height = 21
    ReadOnly = True
    TabOrder = 4
  end
  object Edit3: TEdit
    Left = 270
    Top = 209
    Width = 157
    Height = 21
    ReadOnly = True
    TabOrder = 5
  end
  object BitBtn1: TBitBtn
    Left = 434
    Top = 165
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
    Left = 433
    Top = 207
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
  object BitBtn4: TBitBtn
    Left = 160
    Top = 280
    Width = 75
    Height = 25
    Caption = #30830#23450
    Default = True
    TabOrder = 8
    OnClick = BitBtn4Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BitBtn3: TBitBtn
    Left = 264
    Top = 280
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 9
    Kind = bkCancel
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 326
    Width = 502
    Height = 16
    Align = alBottom
    TabOrder = 10
  end
  object Edit4: TEdit
    Left = 82
    Top = 102
    Width = 121
    Height = 21
    TabOrder = 11
    Text = '75'
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 384
    Top = 8
  end
  object ADOQuery2: TADOQuery
    Connection = DM.ADOConnection1
    Parameters = <>
    Left = 224
    Top = 24
  end
  object ADOQuery3: TADOQuery
    Connection = DM.ADOConnection1
    Parameters = <>
    Left = 280
    Top = 16
  end
end
