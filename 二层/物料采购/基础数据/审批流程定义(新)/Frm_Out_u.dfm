object Frm_out: TFrm_out
  Left = 291
  Top = 244
  BorderStyle = bsDialog
  Caption = #23457#25209#37329#39069
  ClientHeight = 201
  ClientWidth = 350
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
    Left = 64
    Top = 19
    Width = 52
    Height = 13
    Caption = #20154#21592#20195#30721
  end
  object Label2: TLabel
    Left = 63
    Top = 47
    Width = 52
    Height = 13
    Caption = #20154#21592#21517#31216
  end
  object Edit1: TEdit
    Left = 120
    Top = 15
    Width = 113
    Height = 21
    Color = clScrollBar
    ReadOnly = True
    TabOrder = 3
  end
  object Edit2: TEdit
    Left = 120
    Top = 44
    Width = 112
    Height = 21
    Color = clScrollBar
    ReadOnly = True
    TabOrder = 4
  end
  object BitBtn1: TBitBtn
    Left = 256
    Top = 152
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 2
    Kind = bkCancel
  end
  object BitBtn2: TBitBtn
    Left = 256
    Top = 72
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
    Top = 80
    Width = 217
    Height = 105
    Caption = #23457#25209#37329#39069
    TabOrder = 0
    object Label6: TLabel
      Left = 32
      Top = 27
      Width = 26
      Height = 13
      Caption = #19979#38480
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 30
      Top = 66
      Width = 26
      Height = 13
      Caption = #19978#38480
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Edit6: TEdit
      Left = 66
      Top = 64
      Width = 100
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '0'
      OnKeyPress = Edit5KeyPress
    end
    object Edit5: TEdit
      Left = 67
      Top = 21
      Width = 100
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '0'
      OnKeyPress = Edit5KeyPress
    end
  end
end
