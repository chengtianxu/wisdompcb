object frmClose: TfrmClose
  Left = 268
  Top = 281
  Width = 422
  Height = 229
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #26032#30340#25130#25968#22788#29702
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 17
    Top = 43
    Width = 91
    Height = 13
    Alignment = taRightJustify
    Caption = #36130#21153#32467#31639#26085#26399#65306
  end
  object Label2: TLabel
    Left = 9
    Top = 92
    Width = 144
    Height = 13
    Alignment = taRightJustify
    Caption = #32467#31639#26102#38388'('#26381#21153#22120#26102#38388')'#65306
  end
  object Label3: TLabel
    Left = 34
    Top = 124
    Width = 111
    Height = 13
    Alignment = taRightJustify
    Caption = #12288' '#19978#26399#25130#25968#26102#38388#65306
  end
  object DateTimePicker1: TDateTimePicker
    Left = 149
    Top = 38
    Width = 108
    Height = 21
    Date = 37517.000000000000000000
    Time = 37517.000000000000000000
    Enabled = False
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 149
    Top = 88
    Width = 180
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 104
    Top = 152
    Width = 75
    Height = 25
    Caption = #30830#23450
    Default = True
    TabOrder = 2
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
    Left = 200
    Top = 152
    Width = 75
    Height = 25
    TabOrder = 3
    Kind = bkCancel
  end
  object Edit2: TEdit
    Left = 149
    Top = 120
    Width = 180
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
  end
  object BitBtn3: TBitBtn
    Left = 328
    Top = 120
    Width = 75
    Height = 25
    Caption = #26597#25214
    TabOrder = 5
    OnClick = BitBtn3Click
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 16
    Top = 8
  end
end
