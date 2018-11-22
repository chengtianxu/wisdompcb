object FrmAssigQty4: TFrmAssigQty4
  Left = 307
  Top = 263
  Width = 396
  Height = 252
  Caption = #26448#26009#25968#37327#20998#37197
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 45
    Top = 64
    Width = 96
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #26448#26009#20195#21495':'
  end
  object Label2: TLabel
    Left = 61
    Top = 89
    Width = 80
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #26377#25928#26399':'
  end
  object Label3: TLabel
    Left = 53
    Top = 115
    Width = 88
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #21487#29992#25968#37327':'
  end
  object Label4: TLabel
    Left = 52
    Top = 147
    Width = 88
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #21457#25918#25968#37327':'
  end
  object Label5: TLabel
    Left = 45
    Top = 38
    Width = 96
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Barcode '#21495':'
  end
  object Label6: TLabel
    Left = 8
    Top = 11
    Width = 133
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #36710#38388#20928#23384#37327':'
  end
  object Edit1: TEdit
    Left = 146
    Top = 60
    Width = 193
    Height = 21
    Color = clScrollBar
    Enabled = False
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 146
    Top = 86
    Width = 89
    Height = 21
    Color = clScrollBar
    Enabled = False
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 146
    Top = 112
    Width = 89
    Height = 21
    Color = clScrollBar
    Enabled = False
    TabOrder = 2
  end
  object Edit4: TEdit
    Left = 146
    Top = 146
    Width = 89
    Height = 21
    TabOrder = 3
    Text = '0'
    OnKeyPress = Edit4KeyPress
  end
  object BitBtn1: TBitBtn
    Left = 122
    Top = 185
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 4
    OnClick = BitBtn1Click
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
  object BitBtn2: TBitBtn
    Left = 218
    Top = 185
    Width = 75
    Height = 25
    TabOrder = 5
    Kind = bkCancel
  end
  object Edit5: TEdit
    Left = 146
    Top = 34
    Width = 110
    Height = 21
    Color = clScrollBar
    Enabled = False
    TabOrder = 6
  end
  object Edit6: TEdit
    Left = 146
    Top = 7
    Width = 110
    Height = 21
    Color = clScrollBar
    Enabled = False
    TabOrder = 7
  end
end
