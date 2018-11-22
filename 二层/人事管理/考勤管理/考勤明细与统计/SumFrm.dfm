object frmSum: TfrmSum
  Left = 276
  Top = 138
  Width = 837
  Height = 582
  Caption = #37096#38376#20986#21220#32479#35745
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object tvDepart: TTreeView
    Left = 0
    Top = 0
    Width = 249
    Height = 544
    Align = alLeft
    Indent = 19
    TabOrder = 0
    OnDblClick = tvDepartDblClick
  end
  object pnl1: TPanel
    Left = 249
    Top = 0
    Width = 572
    Height = 544
    Align = alClient
    TabOrder = 1
    object pnl2: TPanel
      Left = 1
      Top = 1
      Width = 570
      Height = 41
      Align = alTop
      TabOrder = 0
      object lbl1: TLabel
        Left = 111
        Top = 15
        Width = 12
        Height = 13
        Caption = #33267
      end
      object lbl2: TLabel
        Left = 400
        Top = 12
        Width = 60
        Height = 13
        Caption = #22270#34920#26174#31034#65306
      end
      object dtpBegin: TDateTimePicker
        Left = 14
        Top = 11
        Width = 89
        Height = 21
        Date = 41309.429836030090000000
        Time = 41309.429836030090000000
        TabOrder = 0
      end
      object dtpEnd: TDateTimePicker
        Left = 134
        Top = 11
        Width = 89
        Height = 21
        Date = 41309.429836030090000000
        Time = 41309.429836030090000000
        TabOrder = 1
      end
      object btnSearch: TButton
        Left = 256
        Top = 8
        Width = 75
        Height = 25
        Caption = #26597#35810
        TabOrder = 2
        OnClick = btnSearchClick
      end
      object cbb1: TComboBox
        Left = 464
        Top = 10
        Width = 97
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 3
        Text = #20986#21220#20154#25968
        OnChange = cbb1Change
        Items.Strings = (
          #20986#21220#20154#25968
          #24037#26102)
      end
    end
    object eh1: TDBGridEh
      Left = 1
      Top = 377
      Width = 570
      Height = 166
      Align = alBottom
      DataSource = dsSum
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      PopupMenu = pm1
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = #37096#38376#21517#31216
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = #26085#26399
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = #20986#21220#20154#25968
          Footers = <>
        end
        item
          DisplayFormat = '0.00'
          EditButtons = <>
          FieldName = #27491#29677
          Footers = <>
        end
        item
          DisplayFormat = '0.00'
          EditButtons = <>
          FieldName = #21152#29677
          Footers = <>
        end>
    end
    object cht1: TChart
      Left = 1
      Top = 42
      Width = 570
      Height = 335
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      Title.Text.Strings = (
        'TChart')
      Align = alClient
      TabOrder = 2
      object sr1: TBarSeries
        Marks.ArrowLength = 20
        Marks.Visible = True
        SeriesColor = clRed
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1.000000000000000000
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1.000000000000000000
        YValues.Order = loNone
      end
      object sr2: TBarSeries
        Marks.ArrowLength = 20
        Marks.Visible = True
        SeriesColor = clGreen
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1.000000000000000000
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1.000000000000000000
        YValues.Order = loNone
      end
    end
  end
  object dsSum: TDataSource
    DataSet = qrySum
    Left = 736
    Top = 504
  end
  object qrySum: TADOQuery
    Parameters = <>
    Left = 696
    Top = 504
    object strngfldfieldbm: TStringField
      FieldName = #37096#38376#21517#31216
    end
    object dtfld1: TDateField
      FieldName = #26085#26399
    end
    object intgrfld1: TIntegerField
      FieldName = #20986#21220#20154#25968
    end
    object fltfld1: TFloatField
      FieldName = #27491#29677
    end
    object fltfld2: TFloatField
      FieldName = #21152#29677
    end
  end
  object pm1: TPopupMenu
    Left = 272
    Top = 416
    object EXCEL1: TMenuItem
      Caption = #23548#20986#21040'EXCEL'
      OnClick = EXCEL1Click
    end
  end
end
