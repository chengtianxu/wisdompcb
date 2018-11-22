object frmMain1: TfrmMain1
  Left = 141
  Top = 34
  Caption = #20116#27954'PCB'#25340#29256#35774#35745
  ClientHeight = 770
  ClientWidth = 1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl2: TPanel
    Left = 888
    Top = 47
    Width = 215
    Height = 704
    Align = alRight
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    object lbl31: TLabel
      Left = 1
      Top = 391
      Width = 213
      Height = 16
      Align = alTop
      Caption = 'B'#26495#22270
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = #40657#20307
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      ExplicitWidth = 43
    end
    object lbl32: TLabel
      Left = 1
      Top = 1
      Width = 213
      Height = 16
      Align = alTop
      Caption = #22823#26009#22270
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = #40657#20307
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      ExplicitWidth = 51
    end
    object lbl33: TLabel
      Left = 1
      Top = 196
      Width = 213
      Height = 16
      Align = alTop
      Caption = 'A'#26495#22270
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = #40657#20307
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      ExplicitWidth = 43
    end
    object pnl9: TPanel
      Left = 1
      Top = 407
      Width = 213
      Height = 179
      Align = alTop
      Color = clWindow
      ParentBackground = False
      TabOrder = 0
      object pbPnl_B: TPaintBox
        Left = 1
        Top = 1
        Width = 211
        Height = 177
        Align = alClient
        ParentColor = False
        OnClick = pbPnl_BClick
        OnPaint = pbPnl_BPaint
      end
    end
    object pnl11: TPanel
      Left = 1
      Top = 212
      Width = 213
      Height = 179
      Align = alTop
      Color = clWindow
      ParentBackground = False
      TabOrder = 1
      object pbPnl_A: TPaintBox
        Left = 1
        Top = 1
        Width = 211
        Height = 177
        Align = alClient
        ParentColor = False
        OnClick = pbPnl_AClick
        OnPaint = pbPnl_APaint
      end
    end
    object pnl10: TPanel
      Left = 1
      Top = 17
      Width = 213
      Height = 179
      Align = alTop
      Color = clWindow
      ParentBackground = False
      TabOrder = 2
      object pbSheet: TPaintBox
        Left = 1
        Top = 1
        Width = 211
        Height = 177
        Align = alClient
        ParentColor = False
        OnClick = pbSheetClick
        OnPaint = pbSheetPaint
      end
    end
  end
  object pnl3: TPanel
    Left = 226
    Top = 47
    Width = 662
    Height = 704
    Align = alClient
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 1
      Top = 550
      Width = 660
      Height = 5
      Cursor = crVSplit
      Align = alBottom
      ExplicitTop = 469
      ExplicitWidth = 621
    end
    object pnl5: TPanel
      Left = 1
      Top = 555
      Width = 660
      Height = 148
      Align = alBottom
      TabOrder = 0
      object lvRet: TListView
        Left = 1
        Top = 1
        Width = 658
        Height = 146
        Align = alClient
        Color = clSilver
        Columns = <
          item
            Caption = #24207#21495
          end
          item
            Caption = 'A '#26495#38271
            Width = 70
          end
          item
            Caption = 'A '#26495#23485
            Width = 70
          end
          item
            Caption = 'A'#19978#19979#36793#23485
            Width = 80
          end
          item
            Caption = 'A'#24038#21491#36793#23485
            Width = 80
          end
          item
            Caption = #24320#26009#25968'PNL'
            Width = 80
          end
          item
            Caption = 'SHEET'#21033#29992#29575
            Width = 80
          end
          item
            Caption = #22823#26009#38271
            Width = 70
          end
          item
            Caption = #22823#26009#23485
            Width = 70
          end
          item
            Caption = 'B '#26495#38271
            Width = 80
          end
          item
            Caption = 'B '#26495#23485
            Width = 80
          end
          item
            Caption = 'B '#26495#19978#19979#36793#23485
            Width = 80
          end
          item
            Caption = 'B '#26495#24038#21491#36793#23485
            Width = 80
          end>
        GridLines = True
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
        OnAdvancedCustomDrawItem = lvRetAdvancedCustomDrawItem
        OnAdvancedCustomDrawSubItem = lvRetAdvancedCustomDrawSubItem
        OnClick = lvRetClick
        OnColumnClick = lvRetColumnClick
        OnDblClick = lvRetDblClick
        OnKeyDown = lvRetKeyDown
        OnMouseDown = lvRetMouseDown
      end
    end
    object pnl6: TPanel
      Left = 1
      Top = 1
      Width = 660
      Height = 549
      Align = alClient
      Color = clWindow
      ParentBackground = False
      TabOrder = 1
      object pbMain: TPaintBox
        Left = 1
        Top = 1
        Width = 658
        Height = 547
        Align = alClient
        OnPaint = pbMainPaint
        ExplicitLeft = 10
        ExplicitTop = 97
      end
    end
  end
  object pnl4: TPanel
    Left = 0
    Top = 47
    Width = 226
    Height = 704
    Align = alLeft
    TabOrder = 2
    object pgc1: TPageControl
      Left = 1
      Top = 1
      Width = 224
      Height = 702
      ActivePage = ts1
      Align = alClient
      TabOrder = 0
      object ts1: TTabSheet
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Caption = #21442#25968
        object lbl1: TLabel
          Left = 0
          Top = 545
          Width = 216
          Height = 16
          Align = alTop
          Caption = #38459#25239#26465
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = #40657#20307
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = False
          ExplicitWidth = 51
        end
        object Label1: TLabel
          Left = 0
          Top = 233
          Width = 216
          Height = 16
          Align = alTop
          Caption = #25340#29256#32467#26524
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = #40657#20307
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = False
          ExplicitWidth = 68
        end
        object pnl7: TPanel
          Left = 0
          Top = 249
          Width = 216
          Height = 296
          Align = alTop
          ParentBackground = False
          TabOrder = 0
          object lbl13: TLabel
            Left = 2
            Top = 10
            Width = 72
            Height = 13
            Align = alCustom
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'A '#26495#23610#23544#65306
            Transparent = True
          end
          object lbl19: TLabel
            Left = 2
            Top = 35
            Width = 72
            Height = 13
            Align = alCustom
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'A '#26495#36793#23485#65306
            Transparent = True
          end
          object lbl20: TLabel
            Left = 71
            Top = 32
            Width = 14
            Height = 26
            Caption = #24038#21491
            Color = clWhite
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = #40657#20307
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = False
            WordWrap = True
          end
          object lbl21: TLabel
            Left = 142
            Top = 32
            Width = 14
            Height = 26
            Caption = #19978#19979
            Color = clWhite
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = #40657#20307
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = False
            WordWrap = True
          end
          object lbl22: TLabel
            Left = 2
            Top = 60
            Width = 72
            Height = 13
            Align = alCustom
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'A '#26495'Set'#25968#65306
            Transparent = True
          end
          object lbl23: TLabel
            Left = 145
            Top = 61
            Width = 54
            Height = 13
            Align = alCustom
            Caption = 'Sets/Panel '
            Transparent = True
          end
          object lbl24: TLabel
            Left = 2
            Top = 161
            Width = 72
            Height = 13
            Align = alCustom
            Alignment = taRightJustify
            AutoSize = False
            Caption = #22823#26009#21033#29992#29575#65306
            Transparent = True
          end
          object lbl25: TLabel
            Left = 144
            Top = 161
            Width = 14
            Height = 13
            Align = alCustom
            Caption = '% '
            Transparent = True
          end
          object lbl26: TLabel
            Left = 2
            Top = 111
            Width = 72
            Height = 13
            Align = alCustom
            Alignment = taRightJustify
            AutoSize = False
            Caption = #22823#26009#23610#23544#65306
            Transparent = True
          end
          object lbl27: TLabel
            Left = 144
            Top = 108
            Width = 8
            Height = 16
            Align = alCustom
            Caption = 'X'
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = #40657#20307
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object lbl28: TLabel
            Left = 2
            Top = 85
            Width = 72
            Height = 13
            Align = alCustom
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'A '#26495#25968#37327#65306
            Transparent = True
          end
          object lbl29: TLabel
            Left = 145
            Top = 85
            Width = 58
            Height = 13
            Align = alCustom
            Caption = 'Panel/Sheet'
            Transparent = True
          end
          object lbl30: TLabel
            Left = 2
            Top = 136
            Width = 72
            Height = 13
            Align = alCustom
            Alignment = taRightJustify
            AutoSize = False
            Caption = #22823#26009'Set'#25968#65306
            Transparent = True
          end
          object lbl39: TLabel
            Left = 2
            Top = 302
            Width = 72
            Height = 13
            Align = alCustom
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Pcs'#23610#23544#65306
            Transparent = True
            Visible = False
          end
          object lbl41: TLabel
            Left = 6
            Top = 376
            Width = 72
            Height = 13
            Align = alCustom
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Pcs'#25968'/Set'#65306
            Transparent = True
          end
          object lbl42: TLabel
            Left = 2
            Top = 198
            Width = 72
            Height = 13
            Align = alCustom
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'B '#26495#23610#23544#65306
            Transparent = True
          end
          object lbl43: TLabel
            Left = 2
            Top = 223
            Width = 72
            Height = 13
            Align = alCustom
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'B '#26495#36793#23485#65306
            Transparent = True
          end
          object lbl44: TLabel
            Left = 72
            Top = 219
            Width = 14
            Height = 26
            Caption = #24038#21491
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = #40657#20307
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = False
            WordWrap = True
          end
          object lbl45: TLabel
            Left = 142
            Top = 219
            Width = 14
            Height = 26
            Caption = #19978#19979
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = #40657#20307
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = False
            WordWrap = True
          end
          object lbl46: TLabel
            Left = 2
            Top = 248
            Width = 72
            Height = 13
            Align = alCustom
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'B '#26495'Set'#25968#65306
            Transparent = True
          end
          object lbl47: TLabel
            Left = 145
            Top = 251
            Width = 54
            Height = 13
            Align = alCustom
            Caption = 'Sets/Panel '
            Transparent = True
          end
          object lbl48: TLabel
            Left = 2
            Top = 274
            Width = 72
            Height = 13
            Align = alCustom
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'B '#26495#25968#37327#65306
            Transparent = True
          end
          object lbl49: TLabel
            Left = 145
            Top = 274
            Width = 58
            Height = 13
            Align = alCustom
            Caption = 'Panel/Sheet'
            Transparent = True
          end
          object lbl40: TLabel
            Left = 145
            Top = 301
            Width = 8
            Height = 16
            Align = alCustom
            Caption = 'X'
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = #40657#20307
            Font.Style = []
            ParentFont = False
            Transparent = True
            Visible = False
          end
          object lbl50: TLabel
            Left = 144
            Top = 9
            Width = 8
            Height = 16
            Align = alCustom
            Caption = 'X'
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = #40657#20307
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object lbl51: TLabel
            Left = 145
            Top = 196
            Width = 8
            Height = 16
            Align = alCustom
            Caption = 'X'
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = #40657#20307
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object bvl1: TBevel
            Left = 2
            Top = 184
            Width = 224
            Height = 2
          end
          object edtPnlW_A: TEdit
            Left = 88
            Top = 5
            Width = 52
            Height = 21
            TabOrder = 0
            Text = '0'
            OnEnter = edtDouble_Enter
            OnExit = edtDouble_Exit
          end
          object edtPnlH_A: TEdit
            Left = 157
            Top = 5
            Width = 52
            Height = 21
            TabOrder = 1
            Text = '0'
            OnEnter = edtDouble_Enter
            OnExit = edtDouble_Exit
          end
          object edtPnlLeftRightBorderW_A: TEdit
            Left = 88
            Top = 30
            Width = 52
            Height = 21
            TabOrder = 2
            Text = '0'
            OnEnter = edtDouble_Enter
            OnExit = edtDouble_Exit
          end
          object edtPnlTopBottomBorderW_A: TEdit
            Left = 157
            Top = 30
            Width = 52
            Height = 21
            TabOrder = 3
            Text = '0'
            OnEnter = edtDouble_Enter
            OnExit = edtDouble_Exit
          end
          object edtSetPerPnl_A: TEdit
            Left = 88
            Top = 55
            Width = 52
            Height = 21
            TabOrder = 4
            Text = '0'
            OnEnter = edtDouble_Enter
            OnExit = edtDouble_Exit
          end
          object edtSheetUseage: TEdit
            Left = 88
            Top = 157
            Width = 52
            Height = 21
            TabOrder = 9
            Text = '0'
            OnEnter = edtDouble_Enter
            OnExit = edtDouble_Exit
          end
          object edtSheetW: TEdit
            Left = 88
            Top = 106
            Width = 52
            Height = 21
            TabOrder = 6
            Text = '0'
            OnEnter = edtDouble_Enter
            OnExit = edtDouble_Exit
          end
          object edtSheetH: TEdit
            Left = 157
            Top = 106
            Width = 52
            Height = 21
            TabOrder = 7
            Text = '0'
            OnEnter = edtDouble_Enter
            OnExit = edtDouble_Exit
          end
          object edtPnlCount_A: TEdit
            Left = 88
            Top = 81
            Width = 52
            Height = 21
            TabOrder = 5
            Text = '0'
            OnEnter = edtDouble_Enter
            OnExit = edtDouble_Exit
          end
          object edtSheetSetCount: TEdit
            Left = 88
            Top = 132
            Width = 52
            Height = 21
            TabOrder = 8
            Text = '0'
            OnEnter = edtDouble_Enter
            OnExit = edtDouble_Exit
          end
          object edtPcsW_A: TEdit
            Left = 88
            Top = 298
            Width = 52
            Height = 21
            TabOrder = 10
            Text = '0'
            Visible = False
            OnEnter = edtDouble_Enter
            OnExit = edtDouble_Exit
          end
          object edtPcsH_A: TEdit
            Left = 164
            Top = 298
            Width = 52
            Height = 21
            TabOrder = 11
            Text = '0'
            Visible = False
            OnEnter = edtDouble_Enter
            OnExit = edtDouble_Exit
          end
          object edtPcsPerSet_A: TEdit
            Left = 92
            Top = 372
            Width = 52
            Height = 21
            TabOrder = 12
            Text = '0'
            Visible = False
            OnEnter = edtDouble_Enter
            OnExit = edtDouble_Exit
          end
          object edtPnlW_B: TEdit
            Left = 88
            Top = 194
            Width = 52
            Height = 21
            TabOrder = 13
            Text = '0'
            OnEnter = edtDouble_Enter
            OnExit = edtDouble_Exit
          end
          object edtPnlH_B: TEdit
            Left = 157
            Top = 194
            Width = 52
            Height = 21
            TabOrder = 14
            Text = '0'
            OnEnter = edtDouble_Enter
            OnExit = edtDouble_Exit
          end
          object edtPnlLeftRightBorderW_B: TEdit
            Left = 88
            Top = 220
            Width = 52
            Height = 21
            TabOrder = 15
            Text = '0'
            OnEnter = edtDouble_Enter
            OnExit = edtDouble_Exit
          end
          object edtPnlTopBottomBorderW_B: TEdit
            Left = 157
            Top = 220
            Width = 52
            Height = 21
            TabOrder = 16
            Text = '0'
            OnEnter = edtDouble_Enter
            OnExit = edtDouble_Exit
          end
          object edtSetPerPnl_B: TEdit
            Left = 88
            Top = 245
            Width = 52
            Height = 21
            TabOrder = 17
            Text = '0'
            OnEnter = edtDouble_Enter
            OnExit = edtDouble_Exit
          end
          object edtPnlCount_B: TEdit
            Left = 88
            Top = 271
            Width = 52
            Height = 21
            TabOrder = 18
            Text = '0'
            OnEnter = edtDouble_Enter
            OnExit = edtDouble_Exit
          end
        end
        object pnl8: TPanel
          Left = 0
          Top = 0
          Width = 216
          Height = 233
          Align = alTop
          ParentBackground = False
          TabOrder = 1
          object lbl9: TLabel
            Left = 3
            Top = 148
            Width = 60
            Height = 13
            Align = alCustom
            Alignment = taRightJustify
            AutoSize = False
            Caption = #38271#23485#27604#65306
            Transparent = True
          end
          object lbl10: TLabel
            Left = 3
            Top = 173
            Width = 60
            Height = 13
            Align = alCustom
            Alignment = taRightJustify
            AutoSize = False
            Caption = #21033#29992#29575#65306
            Transparent = True
          end
          object lbl15: TLabel
            Left = 115
            Top = 174
            Width = 14
            Height = 13
            Caption = '% '
            Transparent = True
          end
          object lbl3: TLabel
            Left = 3
            Top = 23
            Width = 60
            Height = 13
            Align = alCustom
            Alignment = taRightJustify
            AutoSize = False
            Caption = #25104#21697#23610#23544#65306
            Transparent = True
          end
          object lbl4: TLabel
            Left = 134
            Top = 23
            Width = 8
            Height = 16
            Align = alCustom
            Caption = 'X'
            Color = clWhite
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = #40657#20307
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object lbl5: TLabel
            Left = 3
            Top = 48
            Width = 60
            Height = 13
            Align = alCustom
            Alignment = taRightJustify
            AutoSize = False
            Caption = #25340#29256#38388#36317#65306
            Transparent = True
          end
          object lbl16: TLabel
            Left = 62
            Top = 42
            Width = 12
            Height = 26
            Caption = #24038#21491
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = False
            WordWrap = True
          end
          object lbl17: TLabel
            Left = 132
            Top = 42
            Width = 12
            Height = 26
            Caption = #19978#19979
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = False
            WordWrap = True
          end
          object lbl6: TLabel
            Left = 3
            Top = 73
            Width = 60
            Height = 13
            Align = alCustom
            Alignment = taRightJustify
            AutoSize = False
            Caption = #26368#23567#26495#36793#65306
            Transparent = True
          end
          object lbl14: TLabel
            Left = 62
            Top = 69
            Width = 12
            Height = 26
            Caption = #24038#21491
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = False
            WordWrap = True
          end
          object lbl18: TLabel
            Left = 132
            Top = 70
            Width = 12
            Height = 26
            Caption = #19978#19979
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = False
            WordWrap = True
          end
          object lbl7: TLabel
            Left = 3
            Top = 98
            Width = 60
            Height = 13
            Align = alCustom
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Panel'#38271#65306
            Transparent = True
          end
          object lbl12: TLabel
            Left = 131
            Top = 95
            Width = 14
            Height = 27
            Align = alCustom
            Caption = '-'
            Color = clWhite
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -27
            Font.Name = #40657#20307
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object lbl54: TLabel
            Left = 3
            Top = 123
            Width = 60
            Height = 13
            Align = alCustom
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Panel'#23485#65306
            Transparent = True
          end
          object lbl11: TLabel
            Left = 131
            Top = 121
            Width = 14
            Height = 27
            Align = alCustom
            Caption = '-'
            Color = clWhite
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -27
            Font.Name = #40657#20307
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object lbl2: TLabel
            Left = 1
            Top = 1
            Width = 214
            Height = 16
            Align = alTop
            Caption = #25340#29256#21442#25968
            Color = clNavy
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = #40657#20307
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Transparent = False
            ExplicitWidth = 68
          end
          object cbxPnlRotate_A: TCheckBox
            Left = 6
            Top = 201
            Width = 71
            Height = 17
            Caption = 'Panel'#24322#21521
            TabOrder = 2
          end
          object cbxSetRotate_A: TCheckBox
            Left = 147
            Top = 171
            Width = 62
            Height = 17
            Caption = 'Set'#24322#21521
            TabOrder = 3
          end
          object edtMinUseage: TEdit
            Left = 76
            Top = 171
            Width = 37
            Height = 21
            TabOrder = 1
            Text = '70'
            OnEnter = edtDouble_Enter
            OnExit = edtDouble_Exit
          end
          object edtWDivH: TEdit
            Left = 76
            Top = 146
            Width = 52
            Height = 21
            TabOrder = 0
            Text = '1.7'
            OnEnter = edtDouble_Enter
            OnExit = edtDouble_Exit
          end
          object cbxDoubleCut: TCheckBox
            Left = 147
            Top = 148
            Width = 62
            Height = 17
            Caption = 'AB'#21452#25340
            TabOrder = 4
          end
          object cbxManuCut: TCheckBox
            Left = 82
            Top = 201
            Width = 84
            Height = 17
            Caption = #27880':'#25163#24037#24320#26009' '
            TabOrder = 5
            OnClick = lvRetClick
          end
          object edtSetW_A: TEdit
            Left = 76
            Top = 21
            Width = 52
            Height = 21
            TabOrder = 6
            Text = '120.121'
            OnEnter = edtDouble_Enter
            OnExit = edtDouble_Exit
          end
          object edtSetH_A: TEdit
            Left = 147
            Top = 21
            Width = 52
            Height = 21
            TabOrder = 7
            OnEnter = edtDouble_Enter
            OnExit = edtDouble_Exit
          end
          object edtSetSpaceX_A: TEdit
            Left = 76
            Top = 44
            Width = 52
            Height = 21
            TabOrder = 8
            OnEnter = edtDouble_Enter
            OnExit = edtDouble_Exit
          end
          object edtSetSpaceY_A: TEdit
            Left = 147
            Top = 44
            Width = 52
            Height = 21
            TabOrder = 9
            OnEnter = edtDouble_Enter
            OnExit = edtDouble_Exit
          end
          object edtPnlLeftRightW_A: TEdit
            Left = 76
            Top = 71
            Width = 52
            Height = 21
            TabOrder = 10
            OnEnter = edtDouble_Enter
            OnExit = edtDouble_Exit
          end
          object edtPnlTopBottomW_A: TEdit
            Left = 147
            Top = 71
            Width = 52
            Height = 21
            TabOrder = 11
            OnEnter = edtDouble_Enter
            OnExit = edtDouble_Exit
          end
          object edtPnlMinW_A: TEdit
            Left = 76
            Top = 97
            Width = 52
            Height = 21
            TabOrder = 12
            OnEnter = edtDouble_Enter
            OnExit = edtDouble_Exit
          end
          object edtPnlMaxW_A: TEdit
            Left = 147
            Top = 97
            Width = 52
            Height = 21
            TabOrder = 13
            OnEnter = edtDouble_Enter
            OnExit = edtDouble_Exit
          end
          object edtPnlMinH_A: TEdit
            Left = 76
            Top = 121
            Width = 52
            Height = 21
            TabOrder = 14
            OnEnter = edtDouble_Enter
            OnExit = edtDouble_Exit
          end
          object edtPnlMaxH_A: TEdit
            Left = 147
            Top = 121
            Width = 52
            Height = 21
            TabOrder = 15
            OnEnter = edtDouble_Enter
            OnExit = edtDouble_Exit
          end
        end
        object pnl12: TPanel
          Left = 0
          Top = 561
          Width = 216
          Height = 128
          Align = alTop
          ParentBackground = False
          TabOrder = 2
          object lbl35: TLabel
            Left = 48
            Top = 8
            Width = 46
            Height = 13
            Align = alCustom
            Caption = ' X 3mm'#65306
            Color = clWhite
            ParentColor = False
            Transparent = False
          end
          object lbl36: TLabel
            Left = 48
            Top = 40
            Width = 46
            Height = 13
            Align = alCustom
            Caption = ' X 6mm'#65306
            Color = clWhite
            ParentColor = False
            Transparent = False
          end
          object lbl37: TLabel
            Left = 149
            Top = 6
            Width = 18
            Height = 13
            Align = alCustom
            Caption = ' '#32452' '
            Transparent = True
          end
          object lbl38: TLabel
            Left = 149
            Top = 40
            Width = 18
            Height = 13
            Align = alCustom
            Caption = ' '#32452' '
            Transparent = True
          end
          object se3mm: TSpinEdit
            Left = 93
            Top = 5
            Width = 50
            Height = 22
            MaxValue = 999
            MinValue = 0
            TabOrder = 0
            Value = 0
            OnChange = se3mmChange
          end
          object se6mm: TSpinEdit
            Left = 93
            Top = 37
            Width = 50
            Height = 22
            MaxValue = 999
            MinValue = 0
            TabOrder = 1
            Value = 0
            OnChange = se3mmChange
          end
          object rgZKPos: TRadioGroup
            Left = 4
            Top = 64
            Width = 194
            Height = 46
            Caption = #20301#32622
            Color = clBtnFace
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              #27700#24179#38459#25239
              #22402#30452#38459#25239)
            ParentBackground = False
            ParentColor = False
            TabOrder = 2
            Visible = False
            OnClick = lvRetClick
          end
          object edtZK3mmLength: TEdit
            Left = 11
            Top = 7
            Width = 33
            Height = 21
            TabOrder = 3
            Text = '100'
            OnEnter = edtDouble_Enter
            OnExit = edtDouble_Exit
          end
          object edtZK6mmLength: TEdit
            Left = 11
            Top = 37
            Width = 33
            Height = 21
            TabOrder = 4
            Text = '100'
            OnEnter = edtDouble_Enter
            OnExit = edtDouble_Exit
          end
        end
      end
      object ts2: TTabSheet
        Caption = #38459#25239#26465
        ImageIndex = 1
        TabVisible = False
        object lbl34: TLabel
          Left = 0
          Top = 0
          Width = 216
          Height = 16
          Align = alTop
          Caption = #38459#25239#26465
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = #40657#20307
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = False
          ExplicitWidth = 51
        end
      end
      object ts3: TTabSheet
        Caption = #25340#29256#26041#21521
        ImageIndex = 2
        object pnl14: TPanel
          Left = 0
          Top = 0
          Width = 216
          Height = 265
          Align = alTop
          ParentBackground = False
          TabOrder = 0
          object lbl52: TLabel
            Left = 18
            Top = 52
            Width = 48
            Height = 13
            Align = alCustom
            Caption = #27700#24179#26495#65306
            Transparent = True
          end
          object lbl53: TLabel
            Left = 18
            Top = 105
            Width = 48
            Height = 13
            Align = alCustom
            Caption = #22402#30452#26495#65306
            Transparent = True
          end
          object cbbHoZCB: TComboBoxEx
            Left = 88
            Top = 43
            Width = 65
            Height = 31
            ItemsEx = <
              item
                Caption = #26080
              end
              item
                ImageIndex = 0
                SelectedImageIndex = 0
              end
              item
                ImageIndex = 1
                SelectedImageIndex = 1
              end
              item
                ImageIndex = 2
                SelectedImageIndex = 2
              end
              item
                ImageIndex = 3
                SelectedImageIndex = 3
              end
              item
                ImageIndex = 4
                SelectedImageIndex = 4
              end
              item
                ImageIndex = 5
                SelectedImageIndex = 5
              end
              item
                ImageIndex = 6
                SelectedImageIndex = 6
              end
              item
                ImageIndex = 7
                SelectedImageIndex = 7
              end>
            Style = csExDropDownList
            TabOrder = 0
            OnChange = lvRetClick
            Images = il2
          end
          object cbbVerCB: TComboBoxEx
            Left = 88
            Top = 97
            Width = 65
            Height = 31
            ItemsEx = <
              item
                Caption = #26080
              end
              item
                ImageIndex = 0
                SelectedImageIndex = 0
              end
              item
                ImageIndex = 1
                SelectedImageIndex = 1
              end
              item
                ImageIndex = 2
                SelectedImageIndex = 2
              end
              item
                ImageIndex = 3
                SelectedImageIndex = 3
              end
              item
                Caption = '4'
                ImageIndex = 4
                SelectedImageIndex = 4
              end
              item
                Caption = '5'
                ImageIndex = 5
                SelectedImageIndex = 5
              end
              item
                ImageIndex = 6
                SelectedImageIndex = 6
              end
              item
                ImageIndex = 7
                SelectedImageIndex = 7
              end>
            Style = csExDropDownList
            TabOrder = 1
            OnChange = lvRetClick
            Images = il2
          end
          object rgCB_AB: TRadioGroup
            Left = 11
            Top = 134
            Width = 193
            Height = 52
            Caption = 'AB'#26495
            Columns = 3
            ItemIndex = 0
            Items.Strings = (
              'AB'
              'A'
              'B')
            TabOrder = 2
            OnClick = lvRetClick
          end
          object seCBSelect: TSpinEdit
            Left = 88
            Top = 5
            Width = 54
            Height = 22
            Enabled = False
            MaxValue = 99999
            MinValue = 0
            TabOrder = 3
            Value = 0
            OnChange = lvRetClick
          end
          object cbxCBSelect: TCheckBox
            Left = 11
            Top = 7
            Width = 71
            Height = 17
            Caption = #36873#25321'SET'#21495
            TabOrder = 4
            OnClick = cbxCBSelectClick
          end
        end
      end
      object ts4: TTabSheet
        Caption = #23450#20301#23380
        ImageIndex = 3
        object pnl13: TPanel
          Left = 0
          Top = 0
          Width = 216
          Height = 129
          Align = alTop
          ParentBackground = False
          TabOrder = 0
          object grp1: TGroupBox
            Left = 9
            Top = 16
            Width = 232
            Height = 97
            Caption = #23450#20301#23380
            TabOrder = 0
            object cbxBB: TCheckBox
              Left = 22
              Top = 24
              Width = 52
              Height = 17
              Caption = #38774#26631
              TabOrder = 0
              OnClick = lvRetClick
            end
            object cbxXD: TCheckBox
              Left = 119
              Top = 24
              Width = 66
              Height = 17
              Caption = #38144#38025#23380
              TabOrder = 1
              OnClick = lvRetClick
            end
            object cbxPXGG: TCheckBox
              Left = 22
              Top = 58
              Width = 83
              Height = 17
              Caption = #21943#38177#25346#38057#23380
              TabOrder = 2
              OnClick = lvRetClick
            end
            object cbxJDK: TCheckBox
              Left = 119
              Top = 58
              Width = 66
              Height = 17
              Caption = #26657#23545#23380
              TabOrder = 3
              OnClick = lvRetClick
            end
          end
        end
      end
    end
  end
  object stat1: TStatusBar
    Left = 0
    Top = 751
    Width = 1103
    Height = 19
    Panels = <
      item
        Text = #29992#25143#21517#65306
        Width = 60
      end
      item
        Width = 120
      end
      item
        Text = #25968#25454#24211#65306
        Width = 60
      end
      item
        Width = 150
      end>
  end
  object pnl15: TPanel
    Left = 0
    Top = 0
    Width = 1103
    Height = 47
    Align = alTop
    TabOrder = 4
    object btnSet: TBitBtn
      Left = 1
      Top = 1
      Width = 45
      Height = 45
      Align = alLeft
      Caption = #35774#32622
      DoubleBuffered = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF898989535353919191FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9888885F5F5FB59595CC
        99999376766767679C8C8C5E5E5E808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFCDA0A0CC9999886F6FB38A8ACC9999B28989917474CC9999BB8F8F6E6E
        6EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF797979BB9292CC9999CC9999CC9999CC
        9999CC9999CC9999CC9999B288884F4F4F6D6D6D797979FFFFFFFFFFFFCC9C9C
        B78D8DB28989CC9999CC9999CC9999D0AAAACC9999CC9999CC9999C59696B288
        88C39494635F5FFFFFFFFFFFFFCC9999CC9999CC9999CC9999B7A0A0FFFFFFFF
        FFFFFFFFFFFFFFFFCC9999CC9999CC9999CC9999A49191FFFFFFFFFFFFB39696
        CC9999CC9999927B7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC9999CC99
        99897070656565828282CEA8A8BA9090CC9999C39494737373FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFCE9E9ECC9999B28989A38080535353CC9999CC9999
        CC9999AB8585646464FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCEA8A8CC99
        99CC9999CC9999989898CEA8A8CEA8A8CC9999C494944D4D4D9F9F9FFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFCC9999CC9999AB8585A78D8DFFFFFFFFFFFFC5A5A5
        CC9999CC9999886E6E565656989898FFFFFFFFFFFFFFFFFFB19898CC9999CC99
        999A7B7B625E5EFFFFFFFFFFFFCC9999CC9999CC9999CC99998F7373524E4E56
        5656676161987A7ACC9999CC9999CC9999CC9999A69090FFFFFFFFFFFFD6ACAC
        CEA8A8CDA0A0CC9999CC9999CC9999CC9999CC9999CC9999CC9999BA8E8EA787
        87CC9999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0A3A3CC9999CC9999CC9999CC
        9999CC9999CC9999CC9999BF9393838383FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFD6ACACCC9999CEA8A8D3ACACCC9999B58F8FB8A4A4CC9999CC9999FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6ACACCC
        9999CC9999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphTop
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = btnSetClick
    end
    object btnSave: TBitBtn
      Left = 91
      Top = 1
      Width = 45
      Height = 45
      Align = alLeft
      Caption = #20445#23384
      DoubleBuffered = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000B16520BE6E16
        A57148BD8A5BB88557B88657B88556B88556B88556B88556B88556B88556BC8A
        5BA57249BD6A11AE5C17C78A42F7B42595A4C5E6EDF1E3EBF1E5EDF2E8EFF5EA
        F1F7ECF3F9EDF5FBF0F6FCF1F7FDEFF5F996A6C8F3A40CBE741DCA914CF2AF2F
        A6AEC5D0CAC9A4969A9C8F948D8488857A7E796E7471666B675D63564D52A39E
        9FACB4CEEEA21AC57A26CE9450F2B239AAB0C7EDEDEBE7E9E7EAEBE8ECEBEAED
        EDEBECEDEAEDEEEBEFF0EDEEEEEDF1F2EFABB1CBEFA922C67E2BD09753F3B945
        B5BCD2D6D1D1A395999E919792878A8A7E837B7377776C716D63695C5359A9A3
        A6BCC3DAF1B030CA8231D39B56F4BC4CB7BCD3FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7BDD6F2B436CD8934D6A15BF5C156
        C5C9DEE2DFDEBBB1B3B7AEAFADA6A9A69FA1A0989C9A919794898F877C80C7C3
        C3C8CEE4F4B940D18E3AD8A35EF7C65DBBC5E4FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBC6E6F6BD4AD4953EDCA963FAD27C
        BB9159916F53907156907155907155907155907155907055907055907156916F
        53BB915BF7CA6BD79842DDAC65F3CF82FFCD61B9A285D1CDCACCC6C0CDC6C1CD
        C6C1CCC6C0D3CDC7D4D0CBD6D3D0B9A185FFCE63F2C86FDA9F46E1B169F4D38A
        F7CA68BFB09EDFE0E3DAD9D9DAD9D9DAD9D9E1E1E1ACA7A8A89C94B9B4B7C4B6
        A3F7CB6AF1CC78DEA54BE6B86EF5D690F8CD6CC3B4A3E5E5E6DFDEDDDFDEDDDF
        DEDDE9EBEE9C856EF0C2659D8E83D1C4B3F8CD6EF3D17DE1AB50E8BA70F6DA95
        FAD074C9BBA9EAEDEEE6E5E4E6E5E4E6E5E4EEF1F5AE9780FFE87EB0A492D6C8
        BBFAD175F6D587E5AE55E9BD72F7DB94F9D477CFC1ADF1F2F3EBEAE9EBEBEAEA
        EAE9F6F8FB9B8671F6C864A49687DBD0C0F9D57BF6D584E0A646ECC47BFCEEC7
        FCDE90D7D0C8FAFFFFF5FAFFF5FAFFF5FAFFFBFFFFCFD3E1AEB5CBD9DEEDDDD8
        D2FBDA87E2A643FCF7F1E6AE4AEFC97EF1C977E7C586EDCE92EECE91EECE91EE
        CE91EECE91F4D495F7D697F3D396E4BD7EEAB553FCF6F0FFFFFF}
      Layout = blGlyphTop
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = btnSaveClick
    end
    object btnAutoCut: TBitBtn
      Left = 46
      Top = 1
      Width = 45
      Height = 45
      Align = alLeft
      Caption = #25340#29256
      DoubleBuffered = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FBFBFBCCC9CB
        CFCCCECFCDCECFCED2CED0D8CFCDCECFCDCECFCDCECFCDCECED0D8CFCED2CFCD
        CECFCDCECAC7C9FBFAFBAEA8ABACA8A8A8A2A3A8A4A6A89D92AB8542A6A8B2A8
        A3A3A8A3A3A6A8B2AB8542A89D92A8A4A6A8A3A3ACA6A8979192A0999ADDDCD9
        D3D1CFD3D2D3D5CBB8D9AB51D3D8E3D3D1CFD3D1CFD3D8E3D9AB51D5CBB9D3D2
        D3D3D1CFDFDEDB888183A39FABDCE3F4D1D8E8D1D8EAD3CFCED6AF65D0DCF6D1
        D4E1D1D4E0CFDAF2D6AC5FD0CBC6CFD3DFCFD1DBDADDE78C858DA49383E0AA45
        D8A74DDBAC58DEAD5DE1A747DFBC78E3BE75E5C07DE6C68AEBBC66EACA8AEBD1
        94EBD197FAE0A096887EABA7B0E4E9F4DADFEADADFECDBD7D3DDBA7CD8E1F6D9
        DCE4D9DCE4D8E0F4DDB777D9D3CDD8DBE4D7D9E0E3E5EB969098B0A9ABE6E6E3
        DDDCDADDDDDDDED7CBE2BF7EDDE1EADDDCDADDDDDADDE1EAE2BF7EDED8CBDDDE
        DEDDDCDBE9E8E69E9798B4B1BDEBF4FFE1E9FBE1EAFBE2E2E4E6C995DFEAFFE1
        E6F2E1E5F1DFE9FEE3C590DFDDDCDFE4F0DEE1ECE8EDF6A09AA4B19F8DE0A737
        DBA442DDAA4EE0AE56E2AA47E5BC6FE7BD6EE8C077EAC683EEC16BEFCA87EFD1
        90F0D393FDE09CAB9B8CBAB6BDF0F1F1E8E8E9E8E8EBE8E2DBEACD9AE7EBF4E8
        E7E8E8E7E8E7EBF4EACD9AE9E2D9E8E8EAE7E7E7F0F1F1AFA7AAC0BCBDF2F2F2
        E8E9E9E9EAEBEAE5DCEDD4A1E8ECF4E9E9E9E9E9E9E8ECF4EDD4A0EAE5DBE8E9
        EBE8E8E8F1F4F3B2ABACCFC1C7FFFDFFFFF5FFFFF6FFFFF0FAFFDBB5FFF9FFFF
        F5FFFFF5FFFFF9FFFFDBB7FFF0FAFFF6FFFFF5FFFFFFFFC8B3BEA9BEBB1FCE60
        0EBE3C0FC04018C14597C86000BE3E12C04011C04006BF3E5BC55820C1460FC0
        4011C04005C43984A389ABBCB931D77F23C86624C9692ACA69AACE720FC96926
        C96925C9691AC8686ECD6F33CA6A23C96925C96918CE6488A492BDC9C588DABC
        91DAC191DAC18FDAC183D9C192DAC191DAC191DAC192DAC189DAC18FDAC191DA
        C191DAC18CDCC1B9C0BFFFFEFFFAE9F0FDEBF2FCEBF2FCEBF2FAEBF2FCEBF2FC
        EBF2FCEBF2FDEBF2FBEBF2FCEBF2FCEBF2FCEBF2FBE9F0FFFFFF}
      Layout = blGlyphTop
      ParentDoubleBuffered = False
      TabOrder = 2
      OnClick = btnAutoCutClick
      ExplicitLeft = 40
      ExplicitTop = -3
    end
    object btnHT: TBitBtn
      Left = 136
      Top = 1
      Width = 45
      Height = 45
      Align = alLeft
      Caption = #30011#22270
      DoubleBuffered = True
      Glyph.Data = {
        F6030000424DF603000000000000360000002800000010000000140000000100
        180000000000C0030000C40E0000C40E00000000000000000000C8D0D4C8D0D4
        C8D0D4C8D0D4C6CED2C0C6C8ACAEAFA2A1A09B9A98A3A1A1B6BABBC2C9CCC7CF
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4BBBFC2A4A3A1AEA39EA6
        9B979A90887E7169756B65A19F9DC4CBCEC8CFD3C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C3CBD0BBBAB7D7D3CDC7CBABEEE1BEFFEBC6FFE8BFA298866A5E55B1B3
        B4C6CDD1C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4B9BFC4DFD2C4D5D1AE2F8A36A6
        B167B9B7C71456FCFFE6A77D7367969290C1C8CBC8D0D4C8D0D4C8D0D4C8D0D4
        C6CDD2B7B9B8EBD6AAB8C2941A7C1A0E88979DA4B3005CFFC0AEBCB9AC8D786F
        6BBCC1C3C9D1D6C8D0D4C8D0D4C8D0D4C1C8CFC8BFADDAB37E54A05A2E763200
        93C67E8B7E338BFB375AD9E9CCA660544BAAAAAAC8D0D4C8D0D4C8D0D4C7CFD4
        BDC2C8DFD6C5D6C89C3391372C7D7000A1DC9B926B60A3E80A4FFEBCB9CE8072
        60979290C7D0D2C8D0D3C8D0D4C7CFD4BDC3C4EEE7E194C19223832025899500
        ADEC85A0858AB4D70055FF3E71F9B3A58B7F7673C5CBCEC8D0D4C8D0D4C7CFD4
        C0C5C4F3F2F3A4C6A19AC27B98C9A75CD5E89DBDAAE7ECC695B6D65076E2C4C0
        BA6F635BBEC4C6C8CFD4C8D0D4C4CCD1C8C6C3ECCEA84FC66200690009737E00
        B3F349585EDC83477D7DAB8485BBBAAC9F7D7471B6BABDC7CFD3C8D0D4C3CBD2
        D6C5B997EC9B15AF3E006600198BB100C1FB3B6678F79D4E6581CA002FFF4D4F
        A8827568B1B6B8C7CFD2C8D0D4C5CED4CBC3B8E5B787C5444E9D462E49C7D400
        C0FB356B7FFDB067A0B1C52364FD0E28C25C4B50A3A3A8C4CBD1C8D0D4C8D2D7
        B3B2B1D9C7BDB6564CE2865244DFFF00C7FD2D7188F5C390B1CCE1357BFA0034
        F53A2C5E908C8FBFC5CCC8D0D4C6D0D4B2AEAFC9A3A5BC553EBE805E66C5D800
        C7FA1E7394B0957CC1CBCE3080FA003DFF19219888817CBDC3C9C7CFD3C0C6C8
        B9B0AECA837CD37F4F73483E7F9FA01DD0F91082B75A616DB7B7B06682DCA9C1
        F46166AA74675FB4B8BBC6CFD4ABACADE9BDB2D57E75B7695E6F5A4BA5A6ACEE
        E5ECA0B6D8838384C1C8CBC5C9C1EEDCD4DA9990765A5187827FC3CACF95ADC2
        1031862B2A80333C825F575CB4B5B89AC4D851B5E5AAA39FC4CCD0BFC5C8F1E2
        E2CD8B8B8B5D4B999491BDC6CD7C9EC0082990133DA61E45985D5B62B6BCBFC2
        CDD198C6DCC4C7C8C7CFD3C5CED3D1C8C8B7887F867A75B1B4B6BCC7C54D8ED4
        093AA71460CF2D70C983878EBEC5C7C8CFD3CCD0D2C7D0D4C8D0D4C8D0D4C3CF
        D5C9A494B7BBBCC3CBCECAD3CDAAC0D897ABCB99B3D3ABC4DBD1D9DCCAD2D5C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D4DAC9D3D7C8D1D5}
      Layout = blGlyphTop
      ParentDoubleBuffered = False
      TabOrder = 3
      OnClick = btnHTClick
    end
    object btnGX: TBitBtn
      Left = 181
      Top = 1
      Width = 45
      Height = 45
      Align = alLeft
      Caption = #26356#26032
      DoubleBuffered = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFE5F3DF93D5841BAE001DA5001FA40019A50016B5004EBE38C8DCC1FFFF
        FFFFFFFFFCFDFBBFE9B8FFFFFFFFFFFFE9EEE614970003BA0012C50015D80016
        DE0018F40019F40113E90000C8009ECB91FFFFFF2DC31800C100FFFFFFE9EFE6
        008C000CC70017D4001CD60022E90024F80230FA0D37F9153FFE1D3FFF2223E6
        0209BA002FFE1B24E411F0F6ED1998000ECD0013CF001AD9001BEC001EEE001E
        EE0021F3002BFF123CFF1F4FFF2F5AFF435AFF455FFF4F29E8160C87000CCD00
        14CF0016D40017E8000CD90079C25774D14E73C75A36AD117BF26677FF6C6CFF
        5E76FF6D77FF6F2CEA1C2094000BCE000CDD000DF40007D40086CE6BFFFFFFFF
        FFFFF3F9F231CA115BFE4858FF4570FF6478FF767FFF7E2FEE207AD85F74EF62
        46D82F00DF006DBB48FFFFFFFFFFFFFFFFFF2ACB062DE0168AEE858AFC888FFF
        8F91FF8C7CFF7D29FA1DC9785ABC593FFFFFFFC0F5C4D9FFE0FFFFFFFFFFFFFF
        FFFFF7FCF7B1E8A8BDEEB537E52721E8183EF43380FF6F2DFD25D98521FFF38D
        DC842ECA671CE28433F0D0B5EEC7A5FCF8F7FFFFFFFFFFFFFFFFFFFFEDE6FFE2
        CCFFFCFF3EFF4653FF5DC76500EDA308FABB3FFFD565FBD791EEC195EFAA40E9
        8D13FFFFFFFFFFFFFFFFFFF2A848FCC94BFEC653FFC86BFFCE7BCB6A00F29E00
        F8A201F9A90CFBAF18FFB817ED9B22F9F1F1FFFFFFFFFFFFF6C078FCCA54FFE9
        93FFE790FFF6D9FFC64ECE6E00F5A200F9A60AFAAF1AFBB92AFFCA3EDA731DEA
        A45BF2B157EFAB56FBC03DFFE07DFFE488FFE692FFF2D8FFBD2DD67200F9A601
        FAAC12FDB41FFCB92DFEC239FFD652FFD457FFD358FFD055FFE382FFE180FFE5
        91FFF7E0FFBA21FFF7E9DC7800FFAF01CF5B00F09E18FFC432FEC237FFCA49FF
        CE55FFD566FFDA71FFDC71FFE28AFFF7E1FEC446FFF3DDFFFFFFD46500D97D21
        FFFFFFEAB993EA8F11FBC651FFD765FFDB77FFE284FFE695FFE9B2FEE1AAFFBD
        27FFF3DEFFFFFFFFFFFFEFD1BAFDFAFBFFFFFFFFFFFFF7DEC3F0AD56F0A130F3
        AB40FABD50FABC58FDBA35FDD98DFFF5E1FFFFFFFFFFFFFFFFFF}
      Layout = blGlyphTop
      ParentDoubleBuffered = False
      TabOrder = 4
      OnClick = btnGXClick
    end
    object btnManuCut: TBitBtn
      Left = 316
      Top = 1
      Width = 45
      Height = 45
      Align = alLeft
      Caption = #25163#21160
      DoubleBuffered = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF927C698F7966
        8F79668F79668F79668F79668F79668F79668F79668F79668F79668F7966FFFF
        FFFFFFFFFFFFFFFFFFFFC9B4A1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF8F7966FFFFFFFFFFFFFFFFFFFFFFFFD1BDA9FFFFFF
        F9F0E7F9F0E7F9F0E7F9F0E7F9F0E7F9F0E7F9F0E7F9F0E7FFFFFF8F7966FFFF
        FFFFFFFFFFFFFFFFFFFFD1BDA9FFFFFFFAF2EAFAF2EAFAF2EAFAF2EAF3EEE8FA
        F2EAFAF2EAFAF2EAFFFFFF8F7966FFFFFFFFFFFFFFFFFFFFFFFFD1BDA9FFFFFF
        FAF2EAE1E6E4B6D0D799C6D587BBCDC4CAC6F7F1EAFAF2EAFFFFFF8F7966FFFF
        FFFFFFFFFFFFFFFFFFFFD1BDA9F5FAFCB3D5DF8CC6DDAEE0F096CFE4A3DBF173
        9DA9B7ADA0F2EBE4FFFFFF8F7966FFFFFFFFFFFFFFFFFFFFFFFFD1BDA9EEF7FA
        C1E8F390CFE8A3DBF186C9E698D7F185C4DF6E7F7F9A8A7BC1B5AB77604EFFFF
        FFFFFFFFFFFFFFFFFFFFD1BDA9C2E5F199D0E4AAE4FB86C9E6A4E0F879C0DD9C
        DBF479C0DD6399AB5A91A448656BC1D3DAFFFFFF80CC80FFFFFFD1BDA9CAEBF5
        AEE0F08DCEE89CDBF492D2ED9CDBF478BFDD9CDBF489D0F079C9EF61BEE957B8
        E429905815A41515A415D1BDA9C9BAA7AFD4DAA3DBF19CDBF49CDBF49CDBF49C
        DBF4A3DBF1AAE4FB9FDCF889D0F075C6ED3CAA8220A9210DA00DFFFFFFFFFFFF
        FFFFFFB6E7F9A4E0F8A4E0F895D6F3AAE4FBAAE4FB9FDCF8AAE4FBAAE4FBA8E0
        F47BD29667CC672EB02EFFFFFFFFFFFFFFFFFFFFFFFFC1E8F3AAE4FBAAE4FBA3
        DBF1AAE4FBB1E5F9BAE8F8B1E5F9A8E0F4B8F4C3B6F4B75AC65BFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFCDEBF6B1E5F9AAE4FBAEE1F6AEE1F6AEE1F6AEE1F690D8
        DC77E29498EDAA5BC962FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4EC05C1FB43820A921}
      Layout = blGlyphTop
      ParentDoubleBuffered = False
      TabOrder = 5
      OnClick = btnManuCutClick
    end
    object btnLoadPicture: TBitBtn
      Left = 271
      Top = 1
      Width = 45
      Height = 45
      Align = alLeft
      Caption = #23548#20837
      DoubleBuffered = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000C9C6C79E9B99
        AEAAA9ADAAA8ADAAA8ADAAA8ADAAA8ADAAA8ADAAA8ADAAA8ADAAA8ADAAA8ADAA
        A8ADAAA9A19E9CCDCBCA96908EE3E2E09E9997A6A2A0A6A2A0A6A2A0A6A2A0A6
        A2A0A6A2A0A6A2A0A6A2A0A6A2A0A6A2A0A19E9BD7D4D2A5A19FA6A3A0F3F2F2
        D8D7D7DCDADADCDADADCDADADCDADADCDADADCDADADCDADADCDADADCDADAE4DD
        E0DFD5D9F4F0F3BBB8B6B0ACA8FEFEFEF5F5F3F5F5F4F5F5F4F5F5F4F5F5F4F5
        F5F4F5F5F4F5F5F4F5F5F4FFFAFDAED2B31D9E39D0DAC8CDC9CABAB7B4FFFFFF
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFBEE7
        C926C969BED9B9DCD6D8B4AFADF0F0F0EFF0EFEFF0EFEFF0EFEFF0EFEFEFEFEF
        EFEFEFEFEFEFEFEFEFEFEFEFEFEFF1EFF0E5EAE4DEE7DEC3BEBEF5F5F4BDB9B7
        C1BDBABDBAB8CDC3C7C4BDBEC1BEBBC1BDBBC1BDBBC1BDBBC1BDBBC1BDBBC1BE
        BBC4BEBDBEB9B8F4F3F3FFFFFFFFFFFFFFFFFFFFFFFF3B7437E2F5E4FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FEFBFC5787545CE986007400E7E6E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5790555DD88518B43E2BC450198E28E6
        E5E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5FA16A
        67F1A010B84030C25A2DBE552BD059009316E9F1E7FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF287E2E1C7C2E2E904349D37A2BC25A2DC65D27A1400D
        6B14004F00CCD9CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        2D88394FDC8F2AC6612ECD6915942ECFD4C9FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF319C414FDC9328C9692DCF6F169C33BD
        CDB9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        38AB4E4DE1A31FD07422D67D11A43ABED2B8FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1EAC3A5BD38A4DC7764EC77832AA4BBA
        D8BAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphTop
      ParentDoubleBuffered = False
      TabOrder = 6
      OnClick = btnLoadPictureClick
    end
    object btnWeiTiao: TBitBtn
      Left = 226
      Top = 1
      Width = 45
      Height = 45
      Align = alLeft
      Caption = #24494#35843
      DoubleBuffered = True
      Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B0040000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFEEECECC8C3C3A99B9AA99B9AA99B9AA99B9ACDCBCA
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFD6D4D4B8ABA9C68485C68485D68785DD7677C96F6CB65B5AB865699F817FC7
        C5C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9D3D3C69B98
        E7AAA4FFBDB6FFB4B1FFB4B1FFADABFF9E9EFD9292EA7B7ECD5F5FA55352B8AB
        A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDCDCDABDBDFDCAC4FFCFC7FF
        C5C0FDCAC4FACEC7FBD5CDFACFC9FDC0BCF2ABA7EB8D8CD96A6AA55352B8ABA9
        FFFFFFFFFFFFFFFFFFFFFFFFE8E6E7DABDBDFBD5CDFDCAC4FFCAC1FFCAC1FACE
        C7FBD5CDFBD5CDF6D5CDF8DDD4F8DDD4F6D5CDE7AAA4CD5F5FAA5E60D2CECDFF
        FFFFFFFFFFFFFFFFD2CECDF7CCC7FFBCBAFFB4B1FFBDB6FFBCBAFDC0BCFFC5C0
        FFC5C0FDCAC4FFCFC7FACEC7FBD5CDF8DDD4E7AAA4BA4E4EA18482FFFFFFFFFF
        FFFFFFFFE1C9C5FFB8B3FFA5A5FFADABFFB0ADFFB0ADFFB4B1FFB8B3FFB9B7FF
        BDB6FDC0BCFFC5C0FFCAC1FDCAC4FBD5CDE39A96A55352D2CECDFFFFFFFFFFFF
        E6C5C3FFA2A2FFA09EFFA5A3FFA2A2FFAAA6FFADABFFADABFFB0ADFFB4B1FFB4
        B1FFB8B3FFBDB6FFBCBAFFC5C0FFBDB6B65B5AA99B9AEEECECD6D4D4E8B3B5FF
        9999FF9999FF9B9CFF9E9EFFA2A2FFA2A2FFA5A3FFAAA6FFA5A5FFAAA6FFB0AD
        FFB0ADFFB0ADFFB8B3FFB9B7B86569A99B9ACA9576BA6328DD7677EA7B7EEA7B
        7EEB7F82EB7F82EB7F82EE8588F18787F58C8CFF9D9CFFA2A2FFA2A2FFA5A3FF
        AAA6FFADABFFB0ADC68485CDCBCACE7B3ED87316D36E2ED36E2ED36E2ED36E2E
        D36E2ED36E2EBA63289F8688D9BAB9F49D9DFF9999FF9999FF9D9CFF9E9EFFA0
        9EFFA5A3D4ADAFF2F3F3DB9C81FFCB8DFEC382FEC382FEC382FEC382FEC382FE
        C986D48C4DB4A297F1F0F0E28E8EFD9292FD9292FD9292FD9292FF9999FFA5A5
        D9D3D3FFFFFFD1AA9AF4B26EFBC07CF9BB78F9BB78F9BB78F9BB78FBC07CEFA3
        59B4A297F6F6F6D3B6B6F18787F18787F58C8CF98C8CFF9D9CE2CBCBF2F3F3FF
        FFFFEBDDDED08853F1A65BF1A65BEFA359F1A65BEFA359F1A65BF3A14FAE7F5E
        F1F0F0DCCCCCDD7677EC8080EC8080F59191E2CBCBF2F3F3FFFFFFFFFFFFFFFF
        FFDCC5C2D48C4DEB9541E79242E79242E79242E79242EB9541BA6328D9D3D3ED
        E7E8D19595EC7273D68785DABDBDF2F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        D9BAB9CC8146DA7E24DD8127DD8127DD8127E18327BA6328D7D8D8FFFFFFCBB8
        B8C3A6A7DFDCDCF2F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0
        E0D8CA9576CA7226CE6D16CC670BD36702CC670BD1C3B7FFFFFFFAFAFAFCFBFB
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFECD7CCEACFBDDDBDADD1AA9AD1AA9AF3DAC6FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphTop
      ParentDoubleBuffered = False
      TabOrder = 7
      OnClick = btnWeiTiaoClick
    end
  end
  object pmSet: TPopupMenu
    Left = 16
    Top = 8
    object mniN1: TMenuItem
      Caption = #26495#26448#35774#23450
      OnClick = mniN1Click
    end
    object mniN2: TMenuItem
      Caption = #40664#35748#20540#35774#23450
      OnClick = mniN2Click
    end
  end
  object il2: TImageList
    Height = 25
    Left = 320
    Top = 216
    Bitmap = {
      494C010108001000C80010001900FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004B0000000100200000000000004B
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000FFFFFF00FFFFFF000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000FFFFFF00FFFFFF000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00424D3E000000000000003E000000
      28000000400000004B0000000100010000000000580200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000}
  end
  object pmInportImg: TPopupMenu
    OnPopup = pmInportImgPopup
    Left = 288
    Top = 8
    object mniInportSheetImg: TMenuItem
      Tag = 1
      Caption = #23548#20837#22823#26009#22270
      OnClick = mniInportSheetImgClick
    end
    object mniInportPnlAImg: TMenuItem
      Tag = 2
      Caption = #23548#20837'A'#26495#22270
      OnClick = mniInportSheetImgClick
    end
    object mniInportPnlBImg: TMenuItem
      Tag = 3
      Caption = #23548#20837'B'#26495#22270
      OnClick = mniInportSheetImgClick
    end
  end
  object il1: TImageList
    Left = 392
    Top = 104
    Bitmap = {
      494C010109001800700010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000300000000000000000000000000000000000000000000
      000000000000}
  end
end
