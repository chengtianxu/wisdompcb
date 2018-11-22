object Frm_Search: TFrm_Search
  Left = 403
  Top = 262
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #26597#35810#26465#20214#35774#32622
  ClientHeight = 257
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 257
    Height = 201
    Caption = #26597#35810#26465#20214#23450#20041
    TabOrder = 0
    object Label1: TLabel
      Left = 120
      Top = 48
      Width = 42
      Height = 13
      Caption = 'Label1'
    end
    object Label4: TLabel
      Left = 120
      Top = 102
      Width = 13
      Height = 13
      Caption = #21040
    end
    object ListBox1: TListBox
      Left = 8
      Top = 40
      Width = 100
      Height = 153
      ItemHeight = 13
      Items.Strings = (
        #35843#25320#21333#21495
        #35774#22791#32534#30721
        #35774#22791#31867#21035
        #35843#20986#24037#21378
        #35843#20986#37096#38376
        #35843#20837#24037#21378
        #35843#20837#37096#38376
        #21019#24314#26085#26399)
      TabOrder = 1
      OnClick = ListBox1Click
    end
    object StaticText1: TStaticText
      Left = 8
      Top = 24
      Width = 100
      Height = 17
      Caption = '   '#26465#20214#39033#30446'  '
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 2
    end
    object Button1: TButton
      Left = 144
      Top = 160
      Width = 75
      Height = 25
      Caption = #22686#21152
      TabOrder = 3
      OnClick = Button1Click
    end
    object Edit1: TEdit
      Left = 120
      Top = 72
      Width = 121
      Height = 21
      TabOrder = 0
      OnKeyPress = Edit1KeyPress
    end
    object dtpk1: TDateTimePicker
      Left = 120
      Top = 72
      Width = 120
      Height = 21
      Date = 41013.436106770830000000
      Time = 41013.436106770830000000
      TabOrder = 4
    end
    object dtpk2: TDateTimePicker
      Left = 121
      Top = 122
      Width = 120
      Height = 21
      Date = 41013.436610416670000000
      Time = 41013.436610416670000000
      TabOrder = 5
    end
  end
  object SGrd: TStringGrid
    Left = 272
    Top = 24
    Width = 320
    Height = 185
    ColCount = 3
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    PopupMenu = Popup1
    TabOrder = 1
    ColWidths = (
      76
      236
      2)
  end
  object StaticText2: TStaticText
    Left = 272
    Top = 8
    Width = 320
    Height = 17
    Caption = '               '#24050#23450#20041#30340#26465#20214'              '
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 2
  end
  object Button2: TButton
    Left = 200
    Top = 224
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 312
    Top = 224
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 4
    OnClick = Button3Click
  end
  object Popup1: TPopupMenu
    Left = 376
    Top = 72
    object N1: TMenuItem
      Caption = #21024#38500#26465#20214
      OnClick = N1Click
    end
  end
end
