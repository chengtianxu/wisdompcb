object FrmQue: TFrmQue
  Left = 454
  Top = 297
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'FrmQue'
  ClientHeight = 310
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 326
    Top = 280
    Width = 13
    Height = 13
    Caption = #21040
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 168
    Top = 280
    Width = 65
    Height = 13
    Caption = #30003#35831#26085#26399#20174
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object grp1: TGroupBox
    Left = 1
    Top = 15
    Width = 312
    Height = 242
    Caption = #26597#35810#26465#20214#23450#20041
    TabOrder = 0
    object LblSelectName: TLabel
      Left = 143
      Top = 48
      Width = 65
      Height = 13
      Caption = #21592#24037#24037#21495#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 142
      Top = 71
      Width = 13
      Height = 13
      Caption = #20174
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 142
      Top = 95
      Width = 13
      Height = 13
      Caption = #21040
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object radiogroup1: TRadioGroup
      Tag = 1
      Left = 140
      Top = 102
      Width = 166
      Height = 64
      Caption = #26465#20214
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #31934#30830#26597#25214
        #27169#31946#26597#25214)
      TabOrder = 3
      Visible = False
    end
    object radiogroup2: TRadioGroup
      Left = 140
      Top = 102
      Width = 166
      Height = 64
      Caption = #26465#20214
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #31561#20110' ='
        #22823#20110' >'
        #23567#20110' <'
        #30456#20284' like')
      TabOrder = 2
      Visible = False
    end
    object listbox3: TListBox
      Left = 10
      Top = 40
      Width = 119
      Height = 185
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 0
      OnClick = listbox3Click
    end
    object txt1: TStaticText
      Left = 10
      Top = 23
      Width = 119
      Height = 17
      Alignment = taCenter
      AutoSize = False
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = #26465#20214#39033#30446
      Color = clGrayText
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 1
    end
    object btn1: TButton
      Left = 141
      Top = 175
      Width = 62
      Height = 25
      Caption = #22686#21152
      TabOrder = 4
      OnClick = btn1Click
    end
    object btn2: TButton
      Left = 243
      Top = 176
      Width = 62
      Height = 25
      Caption = #28165#38500
      TabOrder = 5
      OnClick = btn2Click
    end
    object edtQue: TEdit
      Left = 160
      Top = 64
      Width = 118
      Height = 21
      TabOrder = 6
    end
    object DateTimePicker3: TDateTimePicker
      Left = 156
      Top = 92
      Width = 121
      Height = 21
      Date = 41198.698937534730000000
      Time = 41198.698937534730000000
      TabOrder = 7
    end
    object DateTimePicker4: TDateTimePicker
      Left = 156
      Top = 64
      Width = 121
      Height = 21
      Date = 41198.698937534730000000
      Time = 41198.698937534730000000
      TabOrder = 8
    end
  end
  object txt2: TStaticText
    Left = 313
    Top = 21
    Width = 216
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BevelInner = bvLowered
    BevelOuter = bvNone
    Caption = #24050#23450#20041#30340#26465#20214
    Color = clGrayText
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindow
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 1
  end
  object DateTimePicker2: TDateTimePicker
    Left = 340
    Top = 276
    Width = 85
    Height = 21
    Date = 41214.645375069440000000
    Format = 'yyyy-MM-dd'
    Time = 41214.645375069440000000
    TabOrder = 2
  end
  object DateTimePicker1: TDateTimePicker
    Left = 236
    Top = 276
    Width = 85
    Height = 21
    Date = 41183.645375069440000000
    Format = 'yyyy-MM-dd'
    Time = 41183.645375069440000000
    TabOrder = 3
  end
  object btn3: TBitBtn
    Left = 536
    Top = 209
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
      F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
      000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
      338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
      45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
      3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
      F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
      000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
      338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
      4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
      8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
      333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
      0000}
    NumGlyphs = 2
  end
  object btn4: TBitBtn
    Left = 535
    Top = 133
    Width = 75
    Height = 25
    Caption = #37325#32622
    TabOrder = 5
    OnClick = btn4Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
      33333333333F8888883F33330000324334222222443333388F3833333388F333
      000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
      F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
      223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
      3338888300003AAAAAAA33333333333888888833333333330000333333333333
      333333333333333333FFFFFF000033333333333344444433FFFF333333888888
      00003A444333333A22222438888F333338F3333800003A2243333333A2222438
      F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
      22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
      33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
      3333333333338888883333330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object btn5: TBitBtn
    Left = 535
    Top = 56
    Width = 75
    Height = 25
    Caption = #26597#25214
    Default = True
    ModalResult = 1
    TabOrder = 6
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
  object SGrid1: TStringGrid
    Left = 313
    Top = 38
    Width = 216
    Height = 219
    ColCount = 3
    DefaultRowHeight = 19
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
    ScrollBars = ssHorizontal
    TabOrder = 7
    ColWidths = (
      64
      146
      72)
  end
end
