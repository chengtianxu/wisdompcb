object Frm_Search: TFrm_Search
  Left = 478
  Top = 298
  Width = 596
  Height = 265
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #26597#35810#26465#20214#35774#32622
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
    Top = 16
    Width = 265
    Height = 161
    Caption = #26597#35810#26465#20214#23450#20041
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 128
      Top = 58
      Width = 42
      Height = 13
      Caption = 'Label1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object StaticText1: TStaticText
      Left = 8
      Top = 24
      Width = 108
      Height = 17
      Caption = '   '#26465#20214#39033#30446'   '
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 1
    end
    object ListBox1: TListBox
      Left = 8
      Top = 40
      Width = 108
      Height = 113
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ItemHeight = 13
      Items.Strings = (
        #21457#31080#21495
        #31246#31080#21495
        #35013#31665#21333#21495
        #38144#21806#35746#21333
        #25253#20851#21333#21495
        #20973#35777#32534#21495)
      ParentFont = False
      TabOrder = 2
      OnClick = ListBox1Click
    end
    object Edit1: TEdit
      Left = 128
      Top = 80
      Width = 121
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object Button1: TButton
      Left = 152
      Top = 120
      Width = 75
      Height = 25
      Caption = #22686' '#21152
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = Button1Click
    end
  end
  object StaticText2: TStaticText
    Left = 280
    Top = 16
    Width = 280
    Height = 17
    Caption = '            '#24050#23450#20041#30340#26465#20214'            '
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 1
  end
  object SGrd: TStringGrid
    Left = 280
    Top = 32
    Width = 281
    Height = 145
    ColCount = 3
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 2
    ColWidths = (
      83
      188
      2)
  end
  object Button2: TButton
    Left = 200
    Top = 190
    Width = 75
    Height = 25
    Caption = #30830' '#23450
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 296
    Top = 190
    Width = 75
    Height = 25
    Caption = #21462' '#28040
    TabOrder = 4
    OnClick = Button3Click
  end
end
