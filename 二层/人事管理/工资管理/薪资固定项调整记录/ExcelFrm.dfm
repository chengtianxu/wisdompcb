object FrmExcel: TFrmExcel
  Left = 356
  Top = 229
  Width = 839
  Height = 481
  Caption = #35843#34218#35760#24405#25209#37327#23548#20837
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  DesignSize = (
    831
    447)
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid2: TStringGrid
    Left = 13
    Top = 224
    Width = 940
    Height = 130
    ColCount = 11
    DefaultRowHeight = 18
    FixedCols = 0
    RowCount = 2
    TabOrder = 2
    Visible = False
    ColWidths = (
      70
      64
      64
      64
      64
      64
      64
      63
      64
      64
      64)
  end
  object StringGrid1: TStringGrid
    Left = 0
    Top = 41
    Width = 831
    Height = 358
    Align = alClient
    ColCount = 17
    DefaultRowHeight = 18
    FixedCols = 0
    RowCount = 2
    TabOrder = 1
    OnDrawCell = StringGrid1DrawCell
    ColWidths = (
      60
      55
      74
      58
      59
      90
      48
      48
      80
      78
      86
      2
      12
      386
      2
      2
      2)
  end
  object Panel2: TPanel
    Left = 0
    Top = 399
    Width = 831
    Height = 48
    Align = alBottom
    Anchors = [akBottom]
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    DesignSize = (
      831
      48)
    object Label2: TLabel
      Left = 177
      Top = 19
      Width = 91
      Height = 13
      Cursor = crHandPoint
      Caption = #23548#20986#26377#25928#35760#24405#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clTeal
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = Label2Click
    end
    object Label3: TLabel
      Left = 321
      Top = 19
      Width = 91
      Height = 13
      Cursor = crHandPoint
      Caption = #23548#20986#26080#25928#35760#24405#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = Label3Click
    end
    object Label6: TLabel
      Left = 264
      Top = 19
      Width = 27
      Height = 13
      Caption = '0 '#31508
      Font.Charset = ANSI_CHARSET
      Font.Color = clTeal
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 408
      Top = 19
      Width = 27
      Height = 13
      Caption = '0 '#31508
      Font.Charset = ANSI_CHARSET
      Font.Color = clTeal
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 19
      Top = 18
      Width = 104
      Height = 13
      Cursor = crHandPoint
      Caption = #23548#20986#24403#21069#24635#35760#24405#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = Label4Click
    end
    object Label5: TLabel
      Left = 120
      Top = 18
      Width = 27
      Height = 13
      Caption = '0 '#31508
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 489
      Top = 19
      Width = 65
      Height = 13
      Caption = #29983#25928#24180#26376#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object BitBtn1: TBitBtn
      Left = 659
      Top = 10
      Width = 75
      Height = 28
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
      OnClick = BitBtn1Click
      NumGlyphs = 2
    end
    object BitBtn2: TBitBtn
      Left = 744
      Top = 9
      Width = 75
      Height = 28
      Anchors = [akRight, akBottom]
      Caption = #20445#23384
      TabOrder = 0
      OnClick = BitBtn2Click
      NumGlyphs = 2
    end
    object DateTimePicker1: TDateTimePicker
      Left = 553
      Top = 15
      Width = 81
      Height = 21
      Date = 41348.431253865740000000
      Format = 'yyyy-MM'
      Time = 41348.431253865740000000
      DateMode = dmUpDown
      TabOrder = 2
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 831
    Height = 41
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 551
      Top = 8
      Width = 97
      Height = 25
      Caption = #33719#21462#23548#20837#27169#26495
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object Button1: TButton
      Left = 311
      Top = 8
      Width = 75
      Height = 25
      Caption = #24320#22987#23548#20837
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Button1Click
    end
    object EdtFilename: TEdit
      Left = 84
      Top = 12
      Width = 223
      Height = 21
      Color = clMoneyGreen
      ReadOnly = True
      TabOrder = 4
    end
    object BitBtn3: TBitBtn
      Left = 5
      Top = 8
      Width = 75
      Height = 25
      Caption = #25171#24320#25991#20214
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn3Click
    end
    object Button2: TButton
      Left = 391
      Top = 8
      Width = 75
      Height = 25
      Caption = #24320#22987#39564#35777
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 471
      Top = 8
      Width = 75
      Height = 25
      Caption = #28165#31354#25968#25454
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = Button3Click
    end
  end
  object ProgressBar1: TProgressBar
    Left = 656
    Top = 10
    Width = 167
    Height = 20
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 4
  end
  object OpenDialog1: TOpenDialog
    Left = 36
    Top = 3
  end
end
