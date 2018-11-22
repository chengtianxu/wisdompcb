object Frm_CF: TFrm_CF
  Left = 321
  Top = 245
  BorderStyle = bsDialog
  Caption = #37329#39069#25286#20998
  ClientHeight = 227
  ClientWidth = 296
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
    Width = 39
    Height = 13
    Caption = #21457#31080#21495
  end
  object Label2: TLabel
    Left = 48
    Top = 51
    Width = 52
    Height = 13
    Caption = #25910#27454#26085#26399
  end
  object Label3: TLabel
    Left = 48
    Top = 83
    Width = 52
    Height = 13
    Caption = #25910#27454#37329#39069
  end
  object Label4: TLabel
    Left = 48
    Top = 149
    Width = 52
    Height = 13
    Caption = #25286#20998#37329#39069
  end
  object Label5: TLabel
    Left = 48
    Top = 113
    Width = 52
    Height = 13
    Caption = #25552#25104#22522#25968
  end
  object Shape1: TShape
    Left = 41
    Top = 140
    Width = 207
    Height = 2
  end
  object BitBtn1: TBitBtn
    Left = 40
    Top = 184
    Width = 75
    Height = 25
    Caption = #30830#23450
    Default = True
    TabOrder = 1
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
    Left = 184
    Top = 184
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 2
    Kind = bkCancel
  end
  object Edit1: TEdit
    Left = 112
    Top = 16
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 3
  end
  object Edit2: TEdit
    Left = 112
    Top = 48
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 4
  end
  object Edit3: TEdit
    Left = 112
    Top = 80
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 5
  end
  object Edit4: TEdit
    Left = 112
    Top = 146
    Width = 121
    Height = 21
    TabOrder = 0
    OnKeyPress = Edit4KeyPress
    OnKeyUp = Edit4KeyUp
  end
  object Edit5: TEdit
    Left = 112
    Top = 110
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 6
  end
end
