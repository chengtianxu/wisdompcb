object Frm_YS: TFrm_YS
  Left = 335
  Top = 250
  BorderStyle = bsDialog
  Caption = #39564#25910#35780#20215
  ClientHeight = 203
  ClientWidth = 342
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
  object Label3: TLabel
    Left = 14
    Top = 20
    Width = 52
    Height = 13
    Caption = #39564#25910#26085#26399
  end
  object Label4: TLabel
    Left = 14
    Top = 53
    Width = 52
    Height = 13
    Caption = #39564#25910#20154#21592
  end
  object Label5: TLabel
    Left = 14
    Top = 86
    Width = 52
    Height = 13
    Caption = #39564#25910#35780#20215
  end
  object Label1: TLabel
    Left = 14
    Top = 119
    Width = 52
    Height = 13
    Caption = #39564#25910#24847#35265
  end
  object PDValiDate: TDateTimePicker
    Left = 72
    Top = 16
    Width = 105
    Height = 21
    Date = 40105.000000000000000000
    Time = 40105.000000000000000000
    TabOrder = 0
  end
  object EdtValMan: TEdit
    Left = 72
    Top = 49
    Width = 105
    Height = 21
    ReadOnly = True
    TabOrder = 1
  end
  object CBAppr: TComboBox
    Left = 72
    Top = 83
    Width = 265
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    Items.Strings = (
      #39564#25910#36890#36807
      #38750#24120#28385#24847)
  end
  object BitBtn1: TBitBtn
    Left = 72
    Top = 168
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 3
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
    Left = 192
    Top = 168
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 4
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
  object Memo1: TMemo
    Left = 72
    Top = 117
    Width = 265
    Height = 44
    TabOrder = 5
  end
end
