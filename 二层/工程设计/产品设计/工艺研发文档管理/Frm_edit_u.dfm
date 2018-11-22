object Frm_edit: TFrm_edit
  Left = 195
  Top = 132
  BorderStyle = bsDialog
  Caption = #39033#30446#36755#20837
  ClientHeight = 509
  ClientWidth = 653
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 653
    Height = 33
    Align = alTop
    TabOrder = 0
    object BtnClose: TBitBtn
      Left = 3
      Top = 3
      Width = 55
      Height = 28
      Hint = #36864#20986
      Caption = #36864#20986
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TabStop = False
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
    object BtnSave: TBitBtn
      Left = 66
      Top = 3
      Width = 55
      Height = 28
      Hint = #20445#23384
      Caption = #20445#23384
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = False
      OnClick = BtnSaveClick
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
  end
  object Panel5: TPanel
    Left = 0
    Top = 33
    Width = 653
    Height = 335
    Align = alTop
    TabOrder = 1
    object Label3: TLabel
      Left = 5
      Top = 91
      Width = 56
      Height = 14
      Caption = #31435#39033#26102#38388
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 197
      Top = 91
      Width = 56
      Height = 14
      Caption = #32467#26463#26102#38388
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 5
      Top = 212
      Width = 56
      Height = 14
      Caption = #39033#30446#31616#20171
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 5
      Top = 136
      Width = 56
      Height = 14
      Caption = #39033#30446#30446#30340
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 198
      Top = 50
      Width = 56
      Height = 14
      Caption = #21442#19982#20154#21592
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 5
      Top = 14
      Width = 56
      Height = 14
      Caption = #39033#30446#32534#21495
      FocusControl = DBEdit4
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 198
      Top = 14
      Width = 56
      Height = 14
      Caption = #39033#30446#21517#31216
      FocusControl = DBEdit5
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 397
      Top = 90
      Width = 56
      Height = 14
      Caption = #39033#30446#31867#21035
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 13
      Top = 50
      Width = 42
      Height = 14
      Caption = #36127#36131#20154
      FocusControl = DBEdit2
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Shape2: TShape
      Left = 3
      Top = 3
      Width = 648
      Height = 1
      Pen.Color = clBlue
    end
    object Shape3: TShape
      Left = 3
      Top = 81
      Width = 648
      Height = 1
      Pen.Color = clBlue
    end
    object Shape4: TShape
      Left = 2
      Top = 34
      Width = 648
      Height = 1
      Pen.Color = clBlue
    end
    object Shape5: TShape
      Left = 3
      Top = 113
      Width = 648
      Height = 1
      Pen.Color = clBlue
    end
    object Shape6: TShape
      Left = 2
      Top = 175
      Width = 648
      Height = 1
      Pen.Color = clBlue
    end
    object Shape7: TShape
      Left = 3
      Top = 266
      Width = 648
      Height = 1
      Pen.Color = clBlue
    end
    object Shape8: TShape
      Left = 650
      Top = 3
      Width = 1
      Height = 330
      Pen.Color = clBlue
    end
    object Shape9: TShape
      Left = 2
      Top = 3
      Width = 1
      Height = 330
      Pen.Color = clBlue
    end
    object Shape10: TShape
      Left = 61
      Top = 3
      Width = 1
      Height = 330
      Pen.Color = clBlue
    end
    object Shape11: TShape
      Left = 188
      Top = 3
      Width = 1
      Height = 79
      Pen.Color = clBlue
    end
    object Shape12: TShape
      Left = 262
      Top = 3
      Width = 1
      Height = 79
      Pen.Color = clBlue
    end
    object Shape13: TShape
      Left = 393
      Top = 81
      Width = 1
      Height = 32
      Pen.Color = clBlue
    end
    object Shape14: TShape
      Left = 457
      Top = 81
      Width = 1
      Height = 32
      Pen.Color = clBlue
    end
    object Shape19: TShape
      Left = 188
      Top = 81
      Width = 1
      Height = 32
      Pen.Color = clBlue
    end
    object Shape20: TShape
      Left = 262
      Top = 82
      Width = 1
      Height = 32
      Pen.Color = clBlue
    end
    object Label7: TLabel
      Left = 5
      Top = 287
      Width = 56
      Height = 14
      Caption = #39033#30446#35780#20215
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Shape1: TShape
      Left = 2
      Top = 332
      Width = 648
      Height = 1
      Pen.Color = clBlue
    end
    object DBMemo2: TDBMemo
      Left = 65
      Top = 178
      Width = 581
      Height = 86
      BorderStyle = bsNone
      Color = clBtnFace
      DataField = 'PrgScript'
      DataSource = DS1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 8
    end
    object DBMemo3: TDBMemo
      Left = 65
      Top = 116
      Width = 581
      Height = 58
      BorderStyle = bsNone
      Color = clBtnFace
      DataField = 'PrgFunc'
      DataSource = DS1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 7
    end
    object DBMemo4: TDBMemo
      Left = 264
      Top = 37
      Width = 381
      Height = 42
      BorderStyle = bsNone
      Color = clBtnFace
      DataField = 'partMan'
      DataSource = DS1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 3
    end
    object DBDateTimeEditEh1: TDBDateTimeEditEh
      Left = 64
      Top = 87
      Width = 122
      Height = 21
      BorderStyle = bsNone
      Color = clBtnFace
      DataField = 'StartDate'
      DataSource = DS1
      EditButtons = <>
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      Kind = dtkDateEh
      ParentFont = False
      TabOrder = 4
      Visible = True
    end
    object DBDateTimeEditEh2: TDBDateTimeEditEh
      Left = 265
      Top = 87
      Width = 126
      Height = 21
      BorderStyle = bsNone
      Color = clBtnFace
      DataField = 'EndDate'
      DataSource = DS1
      EditButtons = <>
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      Kind = dtkDateEh
      ParentFont = False
      TabOrder = 5
      Visible = True
    end
    object DBEdit4: TDBEdit
      Left = 65
      Top = 11
      Width = 122
      Height = 21
      BorderStyle = bsNone
      Color = clBtnFace
      DataField = 'PrgID'
      DataSource = DS1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object DBEdit5: TDBEdit
      Left = 263
      Top = 11
      Width = 386
      Height = 21
      BorderStyle = bsNone
      Color = clBtnFace
      DataField = 'PrgName'
      DataSource = DS1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object DBEdit2: TDBEdit
      Left = 64
      Top = 48
      Width = 120
      Height = 21
      BorderStyle = bsNone
      Color = clBtnFace
      DataField = 'Responsor'
      DataSource = DS1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object ComboBox1: TComboBox
      Left = 462
      Top = 86
      Width = 185
      Height = 21
      BevelInner = bvNone
      BevelOuter = bvNone
      Style = csDropDownList
      Color = clBtnFace
      Ctl3D = False
      ItemHeight = 13
      ParentCtl3D = False
      TabOrder = 6
      OnChange = ComboBox1Change
    end
    object DBMemo5: TDBMemo
      Left = 65
      Top = 269
      Width = 581
      Height = 61
      BorderStyle = bsNone
      Color = clBtnFace
      DataField = 'PrgRemark'
      DataSource = DS1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 9
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 368
    Width = 653
    Height = 141
    Align = alClient
    Caption = 'Panel3'
    TabOrder = 2
    object Panel4: TPanel
      Left = 433
      Top = 1
      Width = 219
      Height = 139
      Align = alClient
      Caption = 'Panel4'
      TabOrder = 0
      object Label13: TLabel
        Left = 2
        Top = 32
        Width = 20
        Height = 76
        Caption = #25991#26723#35828#26126
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -19
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object DBMemo1: TDBMemo
        Left = 24
        Top = 1
        Width = 194
        Height = 137
        Align = alRight
        DataField = 'DocScript'
        DataSource = DS2
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object SGrid1: TStringGrid
      Left = 1
      Top = 1
      Width = 432
      Height = 139
      Align = alLeft
      ColCount = 7
      Ctl3D = False
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goTabs, goRowSelect]
      ParentCtl3D = False
      PopupMenu = PopupMenu2
      TabOrder = 1
      OnSelectCell = SGrid1SelectCell
      ColWidths = (
        161
        31
        57
        73
        52
        23
        21)
    end
  end
  object DS1: TDataSource
    DataSet = DM.ADO307
    Left = 344
    Top = 232
  end
  object DS2: TDataSource
    DataSet = DM.ADO308
    Left = 120
    Top = 436
  end
  object PopupMenu2: TPopupMenu
    OnPopup = PopupMenu2Popup
    Left = 184
    Top = 435
    object N1: TMenuItem
      Caption = #26032#22686
      OnClick = N1Click
    end
    object N2: TMenuItem
      Tag = 1
      Caption = #32534#36753
      OnClick = N1Click
    end
    object N3: TMenuItem
      Tag = 2
      Caption = #21024#38500
      OnClick = N1Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N7: TMenuItem
      Tag = 4
      Caption = #25171#24320#25991#20214
      OnClick = N1Click
    end
  end
end
