object FrmExcel: TFrmExcel
  Left = 349
  Top = 80
  BorderStyle = bsSingle
  Caption = 'ExcelFrm'
  ClientHeight = 529
  ClientWidth = 895
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 481
    Width = 895
    Height = 48
    Align = alBottom
    Anchors = [akBottom]
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      895
      48)
    object Label2: TLabel
      Left = 25
      Top = 19
      Width = 65
      Height = 13
      Caption = #26377#25928#35760#24405#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clTeal
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 217
      Top = 19
      Width = 65
      Height = 13
      Caption = #26080#25928#35760#24405#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 88
      Top = 19
      Width = 34
      Height = 15
      Caption = '0 '#31508
      Font.Charset = ANSI_CHARSET
      Font.Color = clTeal
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 280
      Top = 19
      Width = 34
      Height = 15
      Caption = '0 '#31508
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BitBtn1: TBitBtn
      Left = 716
      Top = 9
      Width = 75
      Height = 28
      Anchors = [akRight, akBottom]
      Caption = #21462#28040
      TabOrder = 1
      Kind = bkCancel
    end
    object BitBtn2: TBitBtn
      Left = 804
      Top = 9
      Width = 75
      Height = 28
      Anchors = [akRight, akBottom]
      Caption = #20445#23384
      Default = True
      TabOrder = 0
      OnClick = BitBtn2Click
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
  end
  object StringGrid1: TStringGrid
    Left = 0
    Top = 41
    Width = 895
    Height = 440
    Align = alClient
    ColCount = 11
    DefaultRowHeight = 18
    FixedCols = 0
    RowCount = 2
    TabOrder = 1
    OnDrawCell = StringGrid1DrawCell
    ColWidths = (
      74
      69
      86
      92
      104
      302
      148
      64
      64
      64
      136)
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 895
    Height = 41
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object SpeedButton1: TSpeedButton
      Left = 560
      Top = 8
      Width = 112
      Height = 25
      Caption = #33719#21462#23548#20837#27169#26495'....'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object Label4: TLabel
      Left = 683
      Top = 17
      Width = 78
      Height = 13
      Caption = #24403#21069#24635#35760#24405#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 770
      Top = 17
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
    object Button1: TButton
      Left = 320
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
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
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
      Left = 400
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
      Left = 480
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
  object StringGrid2: TStringGrid
    Left = 165
    Top = 187
    Width = 593
    Height = 191
    ColCount = 8
    DefaultRowHeight = 18
    FixedCols = 0
    RowCount = 2
    TabOrder = 3
    Visible = False
    ColWidths = (
      70
      64
      64
      64
      64
      64
      64
      63)
  end
  object OpenDialog1: TOpenDialog
    Left = 844
    Top = 3
  end
end
