object FrmMain: TFrmMain
  Left = 260
  Top = 208
  Width = 671
  Height = 458
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #29992#25143#26435#38480#31649#29702
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowMenu = edit
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 404
    Top = 60
    Width = 74
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #29992#25143#20195#21495':'
  end
  object Label2: TLabel
    Left = 404
    Top = 87
    Width = 74
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #29992#25143#21517#31216':'
  end
  object Label3: TLabel
    Left = 440
    Top = 116
    Width = 38
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #32452':'
  end
  object Label4: TLabel
    Left = 428
    Top = 143
    Width = 50
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #35821#35328':'
  end
  object Splitter1: TSplitter
    Left = 0
    Top = 0
    Width = 657
    Height = 36
    Cursor = crArrow
    Align = alTop
  end
  object Label5: TLabel
    Left = 104
    Top = 13
    Width = 39
    Height = 13
    AutoSize = False
    Caption = #32452#21035#65306
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 36
    Width = 381
    Height = 348
    Hint = #28857#20987#26631#39064#34892#21487#25913#21464#25490#24207'/'#26597#25214#30340#26041#24335
    Align = alLeft
    DataSource = DM.DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ReadOnly = True
    ShowHint = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyPress = FormKeyPress
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'USER_ID'
        Title.Caption = #29992#25143#20195#21495
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USER_FULL_NAME'
        Title.Caption = #29992#25143#21517#31216
        Width = 138
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TTYPE'
        Title.Caption = #31867#21035
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TGROUP'
        Title.Caption = #32452#21035
        Width = 93
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 8
    Width = 25
    Height = 25
    Hint = #36864#20986
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = BitBtn1Click
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
  object DBEdit1: TDBEdit
    Left = 481
    Top = 56
    Width = 83
    Height = 21
    Color = cl3DLight
    DataField = 'USER_ID'
    DataSource = DM.DataSource1
    ReadOnly = True
    TabOrder = 2
    OnKeyPress = FormKeyPress
  end
  object DBEdit2: TDBEdit
    Left = 481
    Top = 84
    Width = 176
    Height = 21
    Color = cl3DLight
    DataField = 'USER_FULL_NAME'
    DataSource = DM.DataSource1
    ReadOnly = True
    TabOrder = 3
    OnKeyPress = FormKeyPress
  end
  object DBEdit3: TDBEdit
    Left = 481
    Top = 112
    Width = 83
    Height = 21
    Color = cl3DLight
    DataField = 'tgroup'
    DataSource = DM.DataSource1
    ReadOnly = True
    TabOrder = 4
    OnKeyPress = FormKeyPress
  end
  object DBEdit4: TDBEdit
    Left = 481
    Top = 140
    Width = 27
    Height = 21
    Color = cl3DLight
    DataField = 'LANGUAGE_FLAG'
    DataSource = DM.DataSource1
    ReadOnly = True
    TabOrder = 5
    OnKeyPress = FormKeyPress
  end
  object Edit1: TEdit
    Left = 144
    Top = 9
    Width = 82
    Height = 21
    TabOrder = 6
    OnExit = Edit1Exit
  end
  object BitBtn2: TBitBtn
    Left = 230
    Top = 8
    Width = 24
    Height = 24
    TabOrder = 7
    OnClick = BitBtn2Click
    Glyph.Data = {
      66010000424D6601000000000000760000002800000014000000140000000100
      040000000000F0000000130B0000130B00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
      FFFFFFFFC0C0FFFFFFFFFFFFFFFFFFFFC0C0FFFFFFF000FFFFF000FFC0C0FFFF
      FFF080FFFFF080FFC0C0FFFFFFF0007FFF7000FFC0C0FFFFFFF00000000000FF
      C0C0FF0000008000080000FFC0C0FF0FFFF08000080000FFC0C0FF0F00F00000
      000000FFC0C0FF0FFFFF0000F0000FFFC0C0FF0CCCCCC00CCC00FFFFC0C0FFFC
      FFFFF00FFF00FFFFC0C0FFFCF00F00080F00FFFFC0C0FFFCFFFFFFFFFFCFFFFF
      C0C0FFFCCCCCCCCCCCCFFFFFC0C0FFFC8CC8CC8CC8CFFFFFC0C0FFFCCCCCCCCC
      CCCFFFFFC0C0FFFFFFFFFFFFFFFFFFFFC0C0FFFFFFFFFFFFFFFFFFFFC0C0FFFF
      FFFFFFFFFFFFFFFFC0C0}
  end
  object Bar1: TStatusBar
    Left = 0
    Top = 384
    Width = 657
    Height = 19
    Panels = <
      item
        Text = #24403#21069#25490#24207#26041#24335#65306#29992#25143#20195#21495
        Width = 150
      end
      item
        Width = 400
      end
      item
        Width = 50
      end>
    SimpleText = 'Searching:'
  end
  object RadioGroup1: TRadioGroup
    Left = 455
    Top = 194
    Width = 185
    Height = 83
    Caption = #26174#31034#31867#21035
    ItemIndex = 1
    Items.Strings = (
      #26080#25928#29992#25143
      #26377#25928#29992#25143
      #20840'    '#37096)
    TabOrder = 9
    OnClick = RadioGroup1Click
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    Left = 184
    Top = 144
    object add: TMenuItem
      Caption = #22686#21152
      object N1: TMenuItem
        Caption = #32452#21035
        OnClick = N1Click
      end
      object N2: TMenuItem
        Caption = #29992#25143
        OnClick = N2Click
      end
    end
    object edit: TMenuItem
      Caption = #32534#36753
      OnClick = editClick
    end
    object delete: TMenuItem
      Caption = #21024#38500
      OnClick = deleteClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object N4: TMenuItem
      Caption = #22797#21046#21040
      OnClick = N4Click
    end
  end
end
