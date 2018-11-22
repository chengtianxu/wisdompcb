object FrmMain: TFrmMain
  Left = 348
  Top = 244
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #32467#36716#25104#26412#36153#29992
  ClientHeight = 212
  ClientWidth = 405
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 118
    Width = 86
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #24403#21069#20250#35745#24180#24230':'
  end
  object Label2: TLabel
    Left = 224
    Top = 118
    Width = 86
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #24403#21069#20250#35745#26399#38388':'
  end
  object BitBtn1: TBitBtn
    Left = 96
    Top = 158
    Width = 75
    Height = 25
    Caption = #24320#22987
    Default = True
    TabOrder = 0
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
    Left = 232
    Top = 158
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 1
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
  object Edit1: TEdit
    Left = 113
    Top = 114
    Width = 56
    Height = 21
    Color = clScrollBar
    Enabled = False
    TabOrder = 2
  end
  object Edit2: TEdit
    Left = 312
    Top = 114
    Width = 47
    Height = 21
    Color = clScrollBar
    Enabled = False
    TabOrder = 3
  end
  object RichEdit1: TRichEdit
    Left = 0
    Top = 0
    Width = 405
    Height = 75
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Color = clScrollBar
    Font.Charset = GB2312_CHARSET
    Font.Color = clGreen
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = [fsBold, fsUnderline]
    Lines.Strings = (
      #25552#31034#65306#26412#39033#22788#29702#26159#22312#25152#26377#30340#20973#35777#30331#24080#21518#65292#23558#25104#26412#31867#31185
      #30446#30340#26412#26399#20313#39069#32467#36716#21040#23545#24212#31185#30446#65292#21516#26102#33258#21160#29983#25104#36716#24080#20973#35777
      #24182#33258#21160#23436#25104#30331#36134#12290)
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 4
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 196
    Width = 405
    Height = 16
    Align = alBottom
    TabOrder = 5
  end
end
