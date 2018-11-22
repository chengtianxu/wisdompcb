object frmQnty: TfrmQnty
  Left = 416
  Top = 286
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #30830#35748#22806#23618#25968#37327
  ClientHeight = 152
  ClientWidth = 238
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 26
    Top = 27
    Width = 57
    Height = 13
    Caption = 'PNL'#25968#37327#65306
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 27
    Top = 68
    Width = 57
    Height = 13
    Caption = 'PCS'#25968#37327#65306
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object edt_PNL: TEdit
    Left = 89
    Top = 23
    Width = 118
    Height = 21
    Color = clScrollBar
    Enabled = False
    TabOrder = 0
    OnExit = edt_PNLExit
    OnKeyPress = edt_PNLKeyPress
  end
  object edt_PCS: TEdit
    Left = 89
    Top = 65
    Width = 118
    Height = 21
    TabOrder = 1
    OnExit = edt_PNLExit
    OnKeyPress = edt_PNLKeyPress
  end
  object BitBtn1: TBitBtn
    Left = 29
    Top = 111
    Width = 75
    Height = 25
    Caption = '&OK'
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
    Left = 133
    Top = 111
    Width = 75
    Height = 25
    Caption = '&Cancel'
    TabOrder = 3
    Kind = bkCancel
  end
end
