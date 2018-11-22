object Form1: TForm1
  Left = 228
  Top = 201
  Width = 770
  Height = 588
  Caption = #20225#19994#26085#21382
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object right_pan: TPanel
    Left = 562
    Top = 0
    Width = 200
    Height = 554
    Align = alClient
    TabOrder = 0
    object rmsg_edt: TDBGrid
      Left = 1
      Top = 1
      Width = 198
      Height = 414
      Align = alClient
      DataSource = udm.dstbl
      Options = [dgTitles, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = dbg_pm
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = rmsg_edtCellClick
      OnDrawColumnCell = rmsg_edtDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'rkey'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'resttype_name'
          Title.Caption = #20551#26085#31867#22411
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'color'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'remark'
          Visible = False
        end>
    end
    object Panel2: TPanel
      Left = 1
      Top = 415
      Width = 198
      Height = 138
      Align = alBottom
      Caption = 'Panel2'
      TabOrder = 1
      object remark: TMemo
        Left = 1
        Top = 1
        Width = 196
        Height = 136
        Align = alClient
        ReadOnly = True
        TabOrder = 0
      end
    end
  end
  object left_pan: TPanel
    Left = 0
    Top = 0
    Width = 562
    Height = 554
    Align = alLeft
    TabOrder = 1
    object cal: TPanel
      Left = 1
      Top = 72
      Width = 560
      Height = 481
      Align = alClient
      Color = clWhite
      TabOrder = 0
    end
    object ltop_pan: TPanel
      Left = 1
      Top = 1
      Width = 560
      Height = 71
      Align = alTop
      Color = clWhite
      TabOrder = 1
      object yy: TLabel
        Left = 107
        Top = -1
        Width = 64
        Height = 29
        Caption = '2015'
        Color = clWindow
        Font.Charset = GB2312_CHARSET
        Font.Color = clNavy
        Font.Height = -29
        Font.Name = #24494#36719#38597#40657
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
        OnClick = buildyearpan
      end
      object mm: TLabel
        Left = 250
        Top = -1
        Width = 32
        Height = 29
        Alignment = taRightJustify
        Caption = '12'
        Font.Charset = GB2312_CHARSET
        Font.Color = clNavy
        Font.Height = -29
        Font.Name = #24494#36719#38597#40657
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        OnClick = buildmonpan
      end
      object Label4: TLabel
        Left = 291
        Top = 7
        Width = 24
        Height = 27
        Caption = #26376
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = #24494#36719#38597#40657
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label6: TLabel
        Left = 365
        Top = 7
        Width = 24
        Height = 27
        Caption = #26085
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = #24494#36719#38597#40657
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label3: TLabel
        Left = 404
        Top = 9
        Width = 34
        Height = 16
        Caption = #20170#22825
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        OnClick = Label3Click
      end
      object Label2: TLabel
        Left = 187
        Top = 5
        Width = 24
        Height = 27
        Caption = #24180
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = #24494#36719#38597#40657
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object dd: TLabel
        Left = 323
        Top = -1
        Width = 32
        Height = 34
        Caption = '12'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -29
        Font.Name = #24494#36719#38597#40657
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object medt: TEdit
        Left = 180
        Top = 9
        Width = 43
        Height = 21
        TabOrder = 1
        Text = '12'
        Visible = False
      end
      object yedt: TEdit
        Left = 47
        Top = 7
        Width = 42
        Height = 21
        TabOrder = 0
        Text = '2015'
        Visible = False
      end
      object yop: TUpDown
        Left = 88
        Top = 7
        Width = 17
        Height = 21
        Min = 1900
        Max = 2050
        Position = 2015
        TabOrder = 2
        Thousands = False
        OnChangingEx = yopChangingEx
      end
      object mop: TUpDown
        Left = 223
        Top = 9
        Width = 17
        Height = 21
        Associate = medt
        Max = 13
        Position = 12
        TabOrder = 3
        Thousands = False
        OnChangingEx = mopChangingEx
      end
      object Panel1: TPanel
        Left = 1
        Top = 65
        Width = 558
        Height = 5
        Align = alBottom
        Color = clNavy
        TabOrder = 4
      end
      object slracc: TComboBox
        Left = 464
        Top = 8
        Width = 81
        Height = 21
        ItemHeight = 13
        TabOrder = 5
        OnChange = slraccChange
      end
    end
    object sel_pan: TPanel
      Left = 114
      Top = 6
      Width = 200
      Height = 120
      Color = clWhite
      TabOrder = 2
      Visible = False
    end
  end
  object ApplicationEvents1: TApplicationEvents
    OnException = ApplicationEvents1Exception
    Left = 729
    Top = 7
  end
  object day_pmenu: TPopupMenu
    AutoHotkeys = maManual
    MenuAnimation = [maLeftToRight]
    OwnerDraw = True
    OnPopup = day_pmenuPopup
    Left = 521
    Top = 78
  end
  object dbg_pm: TPopupMenu
    OnPopup = dbg_pmPopup
    Left = 690
    Top = 8
    object N1: TMenuItem
      Tag = 1
      Caption = #26032#22686
      OnClick = dgb_pmitemclk
    end
    object N2: TMenuItem
      Tag = 2
      Caption = #20462#25913
      OnClick = dgb_pmitemclk
    end
    object N3: TMenuItem
      Tag = 3
      Caption = #21024#38500
      OnClick = dgb_pmitemclk
    end
  end
end
