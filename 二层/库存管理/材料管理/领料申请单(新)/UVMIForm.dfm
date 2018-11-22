object VMIForm: TVMIForm
  Left = 376
  Top = 215
  Width = 1020
  Height = 479
  Caption = #30003#39046#26126#32454#26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 995
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 267
      Top = 18
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #39046#26009#21333#21495
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clDefault
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object BtClose: TBitBtn
      Left = 3
      Top = 8
      Width = 57
      Height = 30
      Hint = #36864#20986#31995#32479
      Caption = #20851#38381
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BtCloseClick
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
    object BtBrush: TBitBtn
      Left = 60
      Top = 8
      Width = 57
      Height = 30
      Hint = #21047#26032#24403#21069#25968#25454
      Caption = #21047#26032
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BtBrushClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADABFBFBDADADADADADDADADBFADADADADAADADAD000DADADADDADAD0FBF0DA
        DADAADAD0F7FBF0DADADDAD0F7F87BF0DADAAD0F7F87BFB70DADD0F7F87BFB78
        80DA000F87BFB78880ADDAD00BFB78880ADAADADA0B7888740ADDADADA088804
        440AADADADA000A04440DADADADADADA0440ADADADADADADA00D}
    end
    object Edit1: TEdit
      Left = 336
      Top = 13
      Width = 121
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnChange = Edit1Change
    end
    object BitBtn4: TBitBtn
      Left = 118
      Top = 8
      Width = 57
      Height = 30
      Hint = #23548#20986#25968#25454'Excel'
      Caption = #23548#20986
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BitBtn4Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DADADADADADA
        DADAADADADADADADADADDADADADADAD00000000000000006666007777777706E
        EF0AA0E6666606EEF0ADDA0E66606EEF060AADA0E606EEF0000DDADA006EEF0A
        DADAADAD06EEF00DADADDAD06EEF0670DADAAD06EEF0E6670DADD06EEF0A0E66
        70DA0FFFF0ADA0EEEE0D00000ADADA00000AADADADADADADADAD}
    end
    object GroupBox2: TGroupBox
      Left = 732
      Top = 0
      Width = 263
      Height = 49
      Align = alRight
      Caption = #26085#26399#33539#22260
      TabOrder = 4
      object Label8: TLabel
        Left = 9
        Top = 20
        Width = 20
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #20174':'
      end
      object Label9: TLabel
        Left = 136
        Top = 20
        Width = 21
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #21040':'
      end
      object DTPK1: TDateTimePicker
        Left = 32
        Top = 16
        Width = 97
        Height = 21
        Date = 37600.000000000000000000
        Time = 37600.000000000000000000
        TabOrder = 0
        OnClick = DTPK1Click
        OnExit = DTPK1Click
      end
      object DTPk2: TDateTimePicker
        Left = 158
        Top = 16
        Width = 97
        Height = 21
        Date = 37600.000000000000000000
        Time = 37600.000000000000000000
        TabOrder = 1
        OnClick = DTPK1Click
        OnExit = DTPK1Click
      end
    end
  end
  object Grd1: TDBGridEh
    Left = 0
    Top = 49
    Width = 995
    Height = 400
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DM.DS4
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyDown = Grd1KeyDown
    OnTitleClick = Grd1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = #39046#26009#21333#21495
        Footers = <>
        Width = 88
      end
      item
        EditButtons = <>
        FieldName = #30003#39046#20154#21592
        Footers = <>
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = #37096#38376
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #26448#26009#32534#30721
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #26448#26009#21517#31216
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #26448#26009#35268#26684
        Footers = <>
        Width = 212
      end
      item
        EditButtons = <>
        FieldName = #20379#24212#21830
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #21333#20301
        Footers = <>
        Width = 43
      end
      item
        EditButtons = <>
        FieldName = #30003#39046#25968#37327
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #24050#21457#25918#25968#37327
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #30003#39046#26085#26399
        Footers = <>
        Width = 78
      end
      item
        EditButtons = <>
        FieldName = #22791#27880
        Footers = <>
        Width = 198
      end
      item
        EditButtons = <>
        FieldName = #24037#21378#31616#31216
        Footers = <>
        Width = 76
      end
      item
        EditButtons = <>
        FieldName = #24037#21378#20195#30721
        Footers = <>
        Visible = False
        Width = 69
      end>
  end
end
