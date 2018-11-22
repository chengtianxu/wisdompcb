object Frm_out: TFrm_out
  Left = 314
  Top = 219
  BorderStyle = bsDialog
  Caption = #20135#21697
  ClientHeight = 280
  ClientWidth = 401
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 12
    Width = 52
    Height = 13
    Caption = #20135#21697#32534#30721
  end
  object Label2: TLabel
    Left = 40
    Top = 40
    Width = 52
    Height = 13
    Caption = #20135#21697#21517#31216
  end
  object Label4: TLabel
    Left = 36
    Top = 101
    Width = 56
    Height = 14
    Caption = #24403#21069#24211#23384
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 17
    Top = 146
    Width = 56
    Height = 13
    Caption = #19979#21333#25968#37327
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 40
    Top = 72
    Width = 52
    Height = 13
    Caption = #20135#21697#35268#26684
  end
  object Label3: TLabel
    Left = 145
    Top = 146
    Width = 28
    Height = 13
    Caption = #21333#20215
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 249
    Top = 146
    Width = 36
    Height = 13
    Caption = #31246#29575'%'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 41
    Top = 208
    Width = 28
    Height = 13
    Caption = #22791#27880
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 17
    Top = 181
    Width = 56
    Height = 13
    Caption = #23436#24037#26085#26399
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Shape1: TShape
    Left = 22
    Top = 127
    Width = 334
    Height = 2
  end
  object Edit1: TEdit
    Left = 96
    Top = 8
    Width = 217
    Height = 21
    Color = clScrollBar
    ReadOnly = True
    TabOrder = 7
  end
  object Edit2: TEdit
    Left = 96
    Top = 37
    Width = 217
    Height = 21
    Color = clScrollBar
    ReadOnly = True
    TabOrder = 8
  end
  object Edit4: TEdit
    Left = 96
    Top = 95
    Width = 81
    Height = 22
    Color = clScrollBar
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 9
  end
  object BitBtn1: TBitBtn
    Left = 224
    Top = 240
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 6
    Kind = bkCancel
  end
  object BitBtn2: TBitBtn
    Left = 88
    Top = 240
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 5
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
  object Edit5: TEdit
    Left = 74
    Top = 143
    Width = 66
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
  object Edit3: TEdit
    Left = 96
    Top = 69
    Width = 217
    Height = 21
    Color = clScrollBar
    ReadOnly = True
    TabOrder = 10
  end
  object Edit6: TEdit
    Left = 178
    Top = 143
    Width = 66
    Height = 21
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnKeyPress = Edit5KeyPress
  end
  object Edit7: TEdit
    Left = 290
    Top = 143
    Width = 66
    Height = 21
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnKeyPress = Edit5KeyPress
  end
  object Edit8: TEdit
    Left = 74
    Top = 205
    Width = 283
    Height = 21
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object DateTimePicker1: TDateTimePicker
    Left = 76
    Top = 177
    Width = 100
    Height = 21
    Date = 40302.599336111110000000
    Time = 40302.599336111110000000
    TabOrder = 3
  end
end
