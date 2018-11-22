object frmReqView: TfrmReqView
  Left = 382
  Top = 346
  Width = 698
  Height = 390
  Caption = #30003#35831#32479#35745
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
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 682
    Height = 33
    Align = alTop
    TabOrder = 0
    object lbl1: TLabel
      Left = 8
      Top = 10
      Width = 24
      Height = 13
      Caption = #26102#38388
    end
    object lbl2: TLabel
      Left = 125
      Top = 10
      Width = 12
      Height = 13
      Caption = #33267
    end
    object btnSearch: TSpeedButton
      Left = 408
      Top = 5
      Width = 41
      Height = 22
      Caption = #26126#32454
      OnClick = btnSearchClick
    end
    object btnHZ: TSpeedButton
      Left = 464
      Top = 5
      Width = 33
      Height = 22
      Caption = #24635#25968
      OnClick = btnHZClick
    end
    object dtp1: TDateTimePicker
      Left = 38
      Top = 6
      Width = 81
      Height = 21
      Date = 41064.648465138890000000
      Time = 41064.648465138890000000
      TabOrder = 0
    end
    object dtp2: TDateTimePicker
      Left = 143
      Top = 6
      Width = 81
      Height = 21
      Date = 41064.648465138890000000
      Time = 41064.648465138890000000
      TabOrder = 1
    end
    object edtGX: TLabeledEdit
      Left = 264
      Top = 6
      Width = 65
      Height = 21
      EditLabel.Width = 24
      EditLabel.Height = 13
      EditLabel.Caption = #24037#21495
      LabelPosition = lpLeft
      TabOrder = 2
    end
    object cbxType: TComboBox
      Left = 335
      Top = 6
      Width = 57
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 3
      Text = #34917#21345
      Items.Strings = (
        #34917#21345
        #35831#20551
        #20462#25913#24037#26102)
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 33
    Width = 682
    Height = 319
    Align = alClient
    TabOrder = 1
    object dbgrd1: TDBGridEh
      Left = 1
      Top = 1
      Width = 680
      Height = 317
      Align = alClient
      DataSource = ds1
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      PopupMenu = pm1
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnTitleClick = dbgrd1TitleClick
      Columns = <
        item
          EditButtons = <>
          FieldName = #37096#38376
          Footers = <>
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = #24037#21495
          Footers = <>
          Width = 63
        end
        item
          EditButtons = <>
          FieldName = #22995#21517
          Footers = <>
          Width = 61
        end
        item
          EditButtons = <>
          FieldName = #31867#22411
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = #29366#24577
          Footers = <>
          Width = 47
        end
        item
          EditButtons = <>
          FieldName = #25552#20132#20154
          Footers = <>
          Width = 67
        end
        item
          EditButtons = <>
          FieldName = #25552#20132#26102#38388
          Footers = <>
          Width = 87
        end
        item
          EditButtons = <>
          FieldName = #26102#38388
          Footers = <>
          Width = 69
        end
        item
          EditButtons = <>
          FieldName = #22987
          Footers = <>
          Width = 69
        end
        item
          EditButtons = <>
          FieldName = #32456
          Footers = <>
          Width = 55
        end
        item
          EditButtons = <>
          FieldName = #27491#29677
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = #21152#29677
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = #21463#29702#20154
          Footers = <>
          Width = 68
        end
        item
          EditButtons = <>
          FieldName = #21463#29702#26102#38388
          Footers = <>
          Width = 98
        end
        item
          EditButtons = <>
          FieldName = #22791#27880
          Footers = <>
          Width = 215
        end>
    end
    object dbgrd2: TDBGridEh
      Left = 1
      Top = 1
      Width = 680
      Height = 317
      Align = alClient
      DataSource = ds2
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
      Visible = False
      OnTitleClick = dbgrd1TitleClick
    end
  end
  object ds1: TDataSource
    DataSet = dsReqView
    Left = 72
    Top = 48
  end
  object dsReqView: TADODataSet
    Connection = DM1.con1
    CursorType = ctStatic
    Parameters = <>
    Left = 24
    Top = 48
  end
  object qrySum: TADOQuery
    Connection = DM1.con1
    Parameters = <>
    Left = 24
    Top = 104
  end
  object ds2: TDataSource
    DataSet = qrySum
    Left = 72
    Top = 104
  end
  object pm1: TPopupMenu
    Left = 136
    Top = 48
    object Excel1: TMenuItem
      Caption = #23548#20986#21040'Excel'
      OnClick = Excel1Click
    end
  end
end
