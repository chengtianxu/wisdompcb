object Form_date: TForm_date
  Left = 332
  Top = 273
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #36827#20986#23384#26597#35810#26465#20214#23450#20041
  ClientHeight = 230
  ClientWidth = 323
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label17: TLabel
    Left = 70
    Top = 38
    Width = 52
    Height = 13
    Alignment = taRightJustify
    Caption = #36215#22987#26085#26399
  end
  object Label16: TLabel
    Left = 70
    Top = 87
    Width = 52
    Height = 13
    Alignment = taRightJustify
    Caption = #32456#27490#26085#26399
  end
  object Label1: TLabel
    Left = 68
    Top = 125
    Width = 52
    Height = 13
    Alignment = taRightJustify
    Caption = #36873#25321#24037#21378
  end
  object BitBtn1: TBitBtn
    Left = 64
    Top = 177
    Width = 75
    Height = 25
    Caption = #26597#25214
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
  object BitBtn3: TBitBtn
    Left = 180
    Top = 177
    Width = 75
    Height = 25
    Caption = #20851#38381
    TabOrder = 1
    Kind = bkClose
  end
  object DTpk1: TDateTimePicker
    Left = 132
    Top = 34
    Width = 97
    Height = 21
    CalAlignment = dtaLeft
    Date = 37257
    Time = 37257
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 2
  end
  object DTPk2: TDateTimePicker
    Left = 132
    Top = 83
    Width = 97
    Height = 21
    CalAlignment = dtaLeft
    Date = 37575
    Time = 37575
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 3
  end
  object ComboBox1: TComboBox
    Left = 132
    Top = 120
    Width = 124
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 4
    OnChange = ComboBox1Change
  end
  object ADOQuery1: TADOQuery
    Connection = Form1.ADOConnection1
    Parameters = <>
    Left = 280
    Top = 8
  end
  object ADO15: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select rkey,ABBR_NAME'
      'from data0015'
      'order by rkey')
    Left = 280
    Top = 48
    object ADO15rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO15ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
  end
end
