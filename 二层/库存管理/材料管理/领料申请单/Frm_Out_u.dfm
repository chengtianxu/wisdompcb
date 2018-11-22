object Frm_out: TFrm_out
  Left = 314
  Top = 219
  BorderStyle = bsDialog
  Caption = #26448#26009
  ClientHeight = 270
  ClientWidth = 390
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 19
    Width = 52
    Height = 13
    Caption = #26448#26009#32534#30721
  end
  object Label2: TLabel
    Left = 8
    Top = 47
    Width = 85
    Height = 13
    Caption = #26448#26009#21517#31216'/'#35268#26684
  end
  object Label4: TLabel
    Left = 51
    Top = 108
    Width = 80
    Height = 19
    Caption = #26377#25928#24211#23384
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 40
    Top = 79
    Width = 52
    Height = 13
    Caption = #24211#23384#21333#20301
  end
  object Edit1: TEdit
    Left = 96
    Top = 15
    Width = 218
    Height = 21
    Color = clScrollBar
    ReadOnly = True
    TabOrder = 3
  end
  object Edit2: TEdit
    Left = 96
    Top = 44
    Width = 217
    Height = 21
    Color = clScrollBar
    ReadOnly = True
    TabOrder = 4
  end
  object Edit4: TEdit
    Left = 133
    Top = 106
    Width = 121
    Height = 27
    Color = clScrollBar
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
  end
  object BitBtn1: TBitBtn
    Left = 288
    Top = 216
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 2
    Kind = bkCancel
  end
  object BitBtn2: TBitBtn
    Left = 288
    Top = 136
    Width = 75
    Height = 25
    Caption = #30830#23450
    Default = True
    TabOrder = 1
    OnClick = BitBtn2Click
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
  object GroupBox1: TGroupBox
    Left = 16
    Top = 144
    Width = 265
    Height = 105
    Caption = #30003#35831#20449#24687
    TabOrder = 0
    object Label6: TLabel
      Left = 8
      Top = 67
      Width = 39
      Height = 13
      Caption = #20379#24212#21830
    end
    object Label5: TLabel
      Left = 6
      Top = 26
      Width = 56
      Height = 13
      Caption = #30003#35831#25968#37327
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit5: TEdit
      Left = 71
      Top = 24
      Width = 121
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnKeyPress = Edit5KeyPress
    end
    object ComboBox1: TComboBox
      Left = 51
      Top = 64
      Width = 206
      Height = 21
      ItemHeight = 13
      TabOrder = 1
    end
  end
  object Edit3: TEdit
    Left = 96
    Top = 76
    Width = 81
    Height = 21
    Color = clScrollBar
    ReadOnly = True
    TabOrder = 6
  end
end
