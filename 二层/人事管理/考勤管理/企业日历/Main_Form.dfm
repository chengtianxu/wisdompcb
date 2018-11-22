object FRM_Date: TFRM_Date
  Left = 147
  Top = 45
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #24037#21378#26085#21382
  ClientHeight = 644
  ClientWidth = 799
  Color = clWhite
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 799
    Height = 644
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 0
    object Image2: TImage
      Left = 54
      Top = 112
      Width = 76
      Height = 74
      PopupMenu = MenuYear
    end
    object Image1: TImage
      Left = 25
      Top = 92
      Width = 746
      Height = 493
    end
    object Shape1: TShape
      Left = 0
      Top = 0
      Width = 799
      Height = 644
      Align = alClient
    end
    object image_today: TImage
      Left = 303
      Top = 8
      Width = 65
      Height = 40
      OnClick = image_todayClick
    end
    object Label20: TLabel
      Left = 264
      Top = 192
      Width = 257
      Height = 72
      Alignment = taCenter
      AutoSize = False
      Caption = '2002'
      Font.Charset = ANSI_CHARSET
      Font.Color = 14543103
      Font.Height = -64
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Layout = tlCenter
    end
    object Label16: TLabel
      Left = 240
      Top = 282
      Width = 313
      Height = 134
      Alignment = taCenter
      AutoSize = False
      Caption = '6'
      Font.Charset = ANSI_CHARSET
      Font.Color = 15461355
      Font.Height = -120
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Layout = tlCenter
    end
    object shp1: TShape
      Left = 10
      Top = 586
      Width = 312
      Height = 52
      Brush.Color = clSkyBlue
    end
    object Shape2: TShape
      Left = 54
      Top = 112
      Width = 77
      Height = 74
      Brush.Color = 8512126
      Pen.Color = clGreen
    end
    object image_month: TImage
      Left = 208
      Top = 8
      Width = 95
      Height = 40
      PopupMenu = MenuMonth
    end
    object image_year: TImage
      Left = 54
      Top = 8
      Width = 154
      Height = 40
      PopupMenu = MenuYear
    end
    object Bevel2: TBevel
      Left = 9
      Top = 78
      Width = 779
      Height = 10
      Shape = bsBottomLine
    end
    object Label1: TLabel
      Left = 86
      Top = 7
      Width = 76
      Height = 41
      Alignment = taCenter
      Caption = '2002'
      Color = 15268607
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -29
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      PopupMenu = MenuYear
      ShowHint = False
      Transparent = True
      Layout = tlCenter
    end
    object Label2: TLabel
      Left = 64
      Top = 61
      Width = 60
      Height = 20
      Alignment = taCenter
      Caption = #26143#26399#26085
      Font.Charset = GB2312_CHARSET
      Font.Color = clRed
      Font.Height = -20
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object Label3: TLabel
      Left = 160
      Top = 61
      Width = 60
      Height = 20
      Alignment = taCenter
      Caption = #26143#26399#19968
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -20
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object Label4: TLabel
      Left = 264
      Top = 61
      Width = 60
      Height = 20
      Alignment = taCenter
      Caption = #26143#26399#20108
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -20
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object Label5: TLabel
      Left = 454
      Top = 61
      Width = 60
      Height = 20
      Alignment = taCenter
      Caption = #26143#26399#22235
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -20
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object Label6: TLabel
      Left = 360
      Top = 61
      Width = 60
      Height = 20
      Alignment = taCenter
      Caption = #26143#26399#19977
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -20
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object Label7: TLabel
      Left = 656
      Top = 61
      Width = 60
      Height = 20
      Alignment = taCenter
      Caption = #26143#26399#20845
      Font.Charset = GB2312_CHARSET
      Font.Color = clRed
      Font.Height = -20
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object Label8: TLabel
      Left = 558
      Top = 61
      Width = 60
      Height = 20
      Alignment = taCenter
      Caption = #26143#26399#20116
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -20
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object Cnday: TLabel
      Left = 55
      Top = 158
      Width = 75
      Height = 28
      Alignment = taCenter
      AutoSize = False
      Caption = #21021#19968
      Font.Charset = GB2312_CHARSET
      Font.Color = 16384
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Transparent = True
      Layout = tlCenter
      Visible = False
      OnClick = CndayClick
    end
    object Label17: TLabel
      Left = 226
      Top = 10
      Width = 36
      Height = 37
      Alignment = taCenter
      Caption = '12'
      Font.Charset = ANSI_CHARSET
      Font.Color = 12615808
      Font.Height = -32
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      PopupMenu = MenuMonth
      Transparent = True
    end
    object Label18: TLabel
      Left = 276
      Top = 27
      Width = 15
      Height = 14
      Caption = #26376
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      PopupMenu = MenuMonth
    end
    object Label19: TLabel
      Left = 178
      Top = 25
      Width = 15
      Height = 14
      Caption = #24180
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      PopupMenu = MenuYear
    end
    object Label21: TLabel
      Left = 235
      Top = 622
      Width = 36
      Height = 12
      Alignment = taCenter
      Caption = #30002#26411#40857
      Color = clFuchsia
      Font.Charset = GB2312_CHARSET
      Font.Color = clFuchsia
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label22: TLabel
      Left = 156
      Top = 622
      Width = 24
      Height = 12
      Alignment = taCenter
      Caption = #26411#40857
      Color = clFuchsia
      Font.Charset = GB2312_CHARSET
      Font.Color = clFuchsia
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object lbl1: TLabel
      Left = 29
      Top = 592
      Width = 24
      Height = 12
      Alignment = taCenter
      Caption = 'lbl1'
      Color = clFuchsia
      Font.Charset = GB2312_CHARSET
      Font.Color = clFuchsia
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object lbl2: TLabel
      Left = 25
      Top = 622
      Width = 24
      Height = 12
      Alignment = taCenter
      Caption = 'lbl2'
      Color = clFuchsia
      Font.Charset = GB2312_CHARSET
      Font.Color = clFuchsia
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object lbl3: TLabel
      Left = 235
      Top = 592
      Width = 24
      Height = 12
      Alignment = taCenter
      Caption = 'lbl3'
      Color = clFuchsia
      Font.Charset = GB2312_CHARSET
      Font.Color = clFuchsia
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object lbl4: TLabel
      Left = 319
      Top = 23
      Width = 24
      Height = 12
      Alignment = taCenter
      Caption = #20170#22825
      OnClick = lbl4Click
    end
    object day1: TLabel
      Left = 55
      Top = 112
      Width = 75
      Height = 50
      Alignment = taCenter
      AutoSize = False
      Caption = '22'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
      PopupMenu = PopupMenu1
      Transparent = True
      Layout = tlCenter
      Visible = False
    end
  end
  object MenuMonth: TPopupMenu
    Left = 259
    Top = 157
    object MenuMonth_1: TMenuItem
      Tag = 1
      Caption = #19968#26376
      OnClick = MenuMonth_1Click
    end
    object MenuMonth_2: TMenuItem
      Tag = 2
      Caption = #19968#26376
      OnClick = MenuMonth_1Click
    end
    object MenuMonth_3: TMenuItem
      Tag = 3
      Caption = #19968#26376
      OnClick = MenuMonth_1Click
    end
    object MenuMonth_4: TMenuItem
      Tag = 4
      Caption = #19968#26376
      OnClick = MenuMonth_1Click
    end
    object MenuMonth_5: TMenuItem
      Tag = 5
      Caption = #19968#26376
      OnClick = MenuMonth_1Click
    end
    object MenuMonth_6: TMenuItem
      Tag = 6
      Caption = #19968#26376
      OnClick = MenuMonth_1Click
    end
    object MenuMonth_7: TMenuItem
      Tag = 7
      Caption = #19968#26376
      OnClick = MenuMonth_1Click
    end
    object MenuMonth_8: TMenuItem
      Tag = 8
      Caption = #19968#26376
      OnClick = MenuMonth_1Click
    end
    object MenuMonth_9: TMenuItem
      Tag = 9
      Caption = #19968#26376
      OnClick = MenuMonth_1Click
    end
    object MenuMonth_10: TMenuItem
      Tag = 10
      Caption = #19968#26376
      OnClick = MenuMonth_1Click
    end
    object MenuMonth_11: TMenuItem
      Tag = 11
      Caption = #19968#26376
      OnClick = MenuMonth_1Click
    end
    object MenuMonth_12: TMenuItem
      Tag = 12
      Caption = #19968#26376
      OnClick = MenuMonth_1Click
    end
  end
  object MenuYear: TPopupMenu
    Left = 259
    Top = 125
  end
  object PopupMenu1: TPopupMenu
    Left = 256
    Top = 192
    object N11: TMenuItem
      Caption = '1'
      OnClick = N11Click
    end
    object N21: TMenuItem
      Caption = '2'
      OnClick = N21Click
    end
  end
end
