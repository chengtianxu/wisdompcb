object FrmMain: TFrmMain
  Left = 334
  Top = 230
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #21453#35745#25552#25240#26087
  ClientHeight = 207
  ClientWidth = 405
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 19
    Top = 98
    Width = 75
    Height = 13
    Alignment = taRightJustify
    Caption = #24403#21069#20250#35745#24180#24230':'
  end
  object Label2: TLabel
    Left = 230
    Top = 98
    Width = 75
    Height = 13
    Alignment = taRightJustify
    Caption = #24403#21069#20250#35745#26399#38388':'
  end
  object BitBtn1: TBitBtn
    Left = 104
    Top = 152
    Width = 75
    Height = 25
    Caption = #24320#22987
    TabOrder = 0
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 240
    Top = 152
    Width = 75
    Height = 25
    Cancel = True
    Caption = #36864#20986
    TabOrder = 1
    OnClick = BitBtn2Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object Edit1: TEdit
    Left = 97
    Top = 94
    Width = 47
    Height = 21
    Color = clScrollBar
    Enabled = False
    TabOrder = 2
  end
  object Edit2: TEdit
    Left = 307
    Top = 94
    Width = 47
    Height = 21
    Color = clScrollBar
    Enabled = False
    TabOrder = 3
  end
  object RichEdit1: TRichEdit
    Left = 8
    Top = 8
    Width = 393
    Height = 47
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Color = clBtnFace
    Font.Charset = GB2312_CHARSET
    Font.Color = clGreen
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = [fsUnderline]
    Lines.Strings = (
      #25552#31034#65306#26412#39033#22788#29702#23558#25226#26412#26399#35745#25552#25240#26087#30340#20973#35777#20316#24223#65292#24182#23558#30456#20851#22266
      #23450#36164#20135#24080#30446#24674#22797#21040#35745#25552#25240#26087#21069#30340#29366#24577#12290)
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
  end
end
