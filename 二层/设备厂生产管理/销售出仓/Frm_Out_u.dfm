object Frm_out: TFrm_out
  Left = 443
  Top = 279
  BorderStyle = bsDialog
  Caption = #20135#21697
  ClientHeight = 277
  ClientWidth = 380
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
    Left = 38
    Top = 132
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
    Top = 177
    Width = 56
    Height = 13
    Caption = #20986#24211#25968#37327
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
  object Label8: TLabel
    Left = 177
    Top = 176
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
  object Shape1: TShape
    Left = 22
    Top = 158
    Width = 334
    Height = 2
  end
  object Label10: TLabel
    Left = 39
    Top = 101
    Width = 56
    Height = 14
    Caption = #20986#24211#20179#24211
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 210
    Top = 133
    Width = 56
    Height = 14
    Caption = #35746#21333#27424#25968
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 17
    Top = 209
    Width = 112
    Height = 13
    Caption = #20986#24211#21333#20215#65288#21547#31246#65289
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 254
    Top = 209
    Width = 28
    Height = 13
    Caption = #31246#29575
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 96
    Top = 8
    Width = 153
    Height = 21
    Color = clScrollBar
    ReadOnly = True
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 96
    Top = 37
    Width = 217
    Height = 21
    Color = clScrollBar
    ReadOnly = True
    TabOrder = 1
  end
  object Edit4: TEdit
    Left = 97
    Top = 127
    Width = 80
    Height = 22
    Color = clScrollBar
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
  end
  object BitBtn1: TBitBtn
    Left = 216
    Top = 248
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 11
    Kind = bkCancel
  end
  object BitBtn2: TBitBtn
    Left = 104
    Top = 248
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 10
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
    Top = 174
    Width = 66
    Height = 21
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnKeyPress = Edit5KeyPress
  end
  object Edit3: TEdit
    Left = 96
    Top = 69
    Width = 217
    Height = 21
    Color = clScrollBar
    ReadOnly = True
    TabOrder = 2
  end
  object Edit8: TEdit
    Left = 208
    Top = 173
    Width = 153
    Height = 21
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
  end
  object Edit9: TEdit
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
    TabOrder = 3
  end
  object Edit6: TEdit
    Left = 268
    Top = 129
    Width = 80
    Height = 22
    Color = clScrollBar
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
  end
  object Edit7: TEdit
    Left = 127
    Top = 206
    Width = 74
    Height = 21
    Color = cl3DLight
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnKeyPress = Edit5KeyPress
  end
  object Edit10: TEdit
    Left = 288
    Top = 206
    Width = 73
    Height = 21
    Color = cl3DLight
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnKeyPress = Edit5KeyPress
  end
end
