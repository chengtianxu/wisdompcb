object frmNatureCard: TfrmNatureCard
  Left = 353
  Top = 207
  BorderStyle = bsSingle
  Caption = #21407#22987#25171#21345#35760#24405
  ClientHeight = 372
  ClientWidth = 587
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgc1: TPageControl
    Left = 0
    Top = 0
    Width = 587
    Height = 372
    ActivePage = ts1
    Align = alClient
    Style = tsButtons
    TabOrder = 0
    object ts1: TTabSheet
      Caption = #24403#21069
      object pnl1: TPanel
        Left = 0
        Top = 0
        Width = 579
        Height = 113
        Align = alTop
        TabOrder = 0
        object grp1: TGroupBox
          Left = 14
          Top = 7
          Width = 555
          Height = 90
          Align = alCustom
          Caption = #20449#24687
          TabOrder = 0
          object lbl4: TLabel
            Left = 16
            Top = 24
            Width = 36
            Height = 13
            Caption = #22995#21517#65306
          end
          object lbl5: TLabel
            Left = 224
            Top = 24
            Width = 36
            Height = 13
            Caption = #24037#21495#65306
          end
          object lbl6: TLabel
            Left = 16
            Top = 46
            Width = 36
            Height = 13
            Caption = #29677#27425#65306
          end
          object lbl7: TLabel
            Left = 16
            Top = 67
            Width = 48
            Height = 13
            Caption = #26102#38388#27573#65306
          end
        end
      end
      object pnl2: TPanel
        Left = 0
        Top = 113
        Width = 579
        Height = 228
        Align = alClient
        TabOrder = 1
        object lbl1: TLabel
          Left = 14
          Top = 10
          Width = 48
          Height = 13
          Caption = #21407#22987#25968#25454
        end
        object lbl2: TLabel
          Left = 215
          Top = 10
          Width = 72
          Height = 13
          Caption = #33258#21160#35745#31639#32467#26524
        end
        object lbl3: TLabel
          Left = 407
          Top = 10
          Width = 84
          Height = 13
          Caption = #26410#21442#19982#35745#31639#25968#25454
        end
        object mmo1: TMemo
          Left = 14
          Top = 32
          Width = 163
          Height = 185
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object btn1: TButton
          Left = 183
          Top = 64
          Width = 26
          Height = 113
          Caption = #33258#21160#35745#31639'->'
          TabOrder = 1
          WordWrap = True
          OnClick = btn1Click
        end
        object mmo2: TMemo
          Left = 215
          Top = 32
          Width = 170
          Height = 185
          ScrollBars = ssVertical
          TabOrder = 2
        end
        object mmo3: TMemo
          Left = 407
          Top = 32
          Width = 162
          Height = 185
          ScrollBars = ssVertical
          TabOrder = 3
        end
      end
    end
    object ts2: TTabSheet
      Caption = #25152#26377#35760#24405
      ImageIndex = 1
      object dbgrdh1: TDBGridEh
        Left = 0
        Top = 33
        Width = 579
        Height = 283
        Align = alClient
        DataSource = ds1
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        ImeMode = imDisable
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnCellClick = dbgrdh1CellClick
        OnTitleClick = dbgrdh1TitleClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'rkey'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'employeecode'
            Footers = <>
            ReadOnly = True
            Title.Caption = #24037#21495
          end
          item
            EditButtons = <>
            FieldName = 'chinesename'
            Footers = <>
            ReadOnly = True
            Title.Caption = #22995#21517
          end
          item
            EditButtons = <>
            FieldName = 'card_time'
            Footers = <>
            ReadOnly = True
            Title.Caption = #25171#21345#26102#38388
            Width = 120
          end
          item
            EditButtons = <>
            FieldName = 'employeecard'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'date_e'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'time_e'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'dev_id'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'employeeid'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'ClassID'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'SignDesc'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'QuerySign'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'remark'
            Footers = <>
            Visible = False
          end>
      end
      object pnl3: TPanel
        Left = 0
        Top = 0
        Width = 579
        Height = 33
        Align = alTop
        TabOrder = 1
        object lbl8: TLabel
          Left = 360
          Top = 11
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = #24037#21495
        end
        object lbl9: TLabel
          Left = 119
          Top = 9
          Width = 12
          Height = 13
          Caption = #33267
        end
        object dtp1: TDateTimePicker
          Left = 8
          Top = 6
          Width = 97
          Height = 21
          Date = 40896.000000000000000000
          Time = 40896.000000000000000000
          TabOrder = 0
        end
        object dtp2: TDateTimePicker
          Left = 149
          Top = 6
          Width = 97
          Height = 21
          Date = 40896.999988425920000000
          Time = 40896.999988425920000000
          TabOrder = 1
        end
        object btnSearch: TButton
          Left = 252
          Top = 4
          Width = 75
          Height = 25
          Caption = #26597#35810
          TabOrder = 2
          OnClick = btnSearchClick
        end
        object edtFilter: TEdit
          Left = 389
          Top = 6
          Width = 116
          Height = 21
          TabOrder = 3
          OnChange = edtFilterChange
        end
      end
      object dbnvgr1: TDBNavigator
        Left = 0
        Top = 316
        Width = 579
        Height = 25
        DataSource = ds1
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
        Align = alBottom
        TabOrder = 2
      end
    end
  end
  object ds1: TDataSource
    DataSet = adsNatureCard
    Left = 504
    Top = 272
  end
  object adsNatureCard: TADODataSet
    Connection = DM1.con1
    CursorType = ctStatic
    CommandText = 
      'SELECT D1.*, D2.chinesename, D2.employeecode FROM OriginalCheckD' +
      'ata D1'#13#10'INNER JOIN employeemsg D2 ON D1.EmployeeID = D2.RKey'#13#10'WH' +
      'ERE D1.card_time BETWEEN :BeginTime AND :EndTime'#13#10'ORDER BY D1.ca' +
      'rd_time'
    Parameters = <
      item
        Name = 'BeginTime'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'EndTime'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    Left = 448
    Top = 264
  end
end
