object Frm_out: TFrm_out
  Left = 314
  Top = 219
  BorderStyle = bsDialog
  Caption = #21457#25918
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
    Left = 77
    Top = 14
    Width = 52
    Height = 13
    Caption = #23458#25143#22411#21495
  end
  object Label2: TLabel
    Left = 77
    Top = 42
    Width = 52
    Height = 13
    Caption = #26412#21378#32534#21495
  end
  object Label4: TLabel
    Left = 51
    Top = 74
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
  object Edit1: TEdit
    Left = 133
    Top = 10
    Width = 121
    Height = 21
    Color = clScrollBar
    ReadOnly = True
    TabOrder = 3
  end
  object Edit2: TEdit
    Left = 133
    Top = 39
    Width = 121
    Height = 21
    Color = clScrollBar
    ReadOnly = True
    TabOrder = 4
  end
  object Edit4: TEdit
    Left = 133
    Top = 68
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
    Top = 112
    Width = 241
    Height = 137
    Caption = #21457#25918#20449#24687
    TabOrder = 0
    object Label3: TLabel
      Left = 9
      Top = 87
      Width = 39
      Height = 13
      Caption = #21442#32771#21495
    end
    object Label6: TLabel
      Left = 20
      Top = 111
      Width = 26
      Height = 13
      Caption = #22791#27880
    end
    object Label5: TLabel
      Left = 6
      Top = 29
      Width = 56
      Height = 13
      Caption = #26412#27425#21457#25918
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 8
      Top = 50
      Width = 56
      Height = 13
      Caption = #21457#25918#21333#20215
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit3: TEdit
      Left = 50
      Top = 84
      Width = 143
      Height = 21
      TabOrder = 2
    end
    object Edit6: TEdit
      Left = 50
      Top = 108
      Width = 185
      Height = 21
      TabOrder = 3
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
      TabOrder = 1
      OnKeyPress = Edit5KeyPress
    end
    object Edit7: TEdit
      Left = 71
      Top = 47
      Width = 121
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnKeyPress = Edit7KeyPress
    end
  end
end
