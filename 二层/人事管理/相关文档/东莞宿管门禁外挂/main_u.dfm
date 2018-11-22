object frm_main: Tfrm_main
  Left = 276
  Top = 158
  Width = 944
  Height = 654
  Caption = #38376#31105#25509#21475
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pgc1: TPageControl
    Left = 0
    Top = 0
    Width = 936
    Height = 627
    ActivePage = ts1
    Align = alClient
    TabOrder = 0
    object ts1: TTabSheet
      Caption = #22522#26412#25805#20316
      object pb1: TProgressBar
        Left = 0
        Top = 583
        Width = 928
        Height = 16
        Align = alBottom
        TabOrder = 0
      end
      object pnl1: TPanel
        Left = 0
        Top = 41
        Width = 297
        Height = 542
        Align = alLeft
        TabOrder = 1
        object lbl1: TLabel
          Left = 96
          Top = 18
          Width = 97
          Height = 20
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbl2: TLabel
          Left = 181
          Top = 88
          Width = 24
          Height = 13
          Caption = #24037#21495
        end
        object btn1: TBitBtn
          Left = 8
          Top = 16
          Width = 75
          Height = 25
          Caption = #27979#35797#32593#32476
          TabOrder = 0
          OnClick = btn1Click
        end
        object btn2: TBitBtn
          Left = 8
          Top = 40
          Width = 161
          Height = 25
          Caption = #38376#31105#36719#20214#33719#21462#21517#21333
          Enabled = False
          TabOrder = 1
          OnClick = btn2Click
        end
        object txt1: TStaticText
          Left = 4
          Top = 112
          Width = 253
          Height = 17
          AutoSize = False
          TabOrder = 2
        end
        object BitBtn1: TBitBtn
          Left = 8
          Top = 82
          Width = 161
          Height = 25
          Caption = #33719#21462#19977#20010#30340#21306#22495'ID'#21345#21517#21333
          Enabled = False
          TabOrder = 3
          OnClick = btn2Click
        end
        object btn3: TBitBtn
          Left = 8
          Top = 106
          Width = 161
          Height = 24
          Caption = #23548#20986'ID'#21345#21517#21333
          TabOrder = 4
          OnClick = btn3Click
        end
        object edt1: TEdit
          Left = 218
          Top = 83
          Width = 78
          Height = 21
          TabOrder = 5
          OnChange = edt1Change
        end
        object btnUpLoad: TBitBtn
          Left = 8
          Top = 152
          Width = 161
          Height = 25
          Caption = #19978#20256#21517#21333#21040#38376#31105
          TabOrder = 6
          OnClick = btnUpLoadClick
        end
      end
      object pnl2: TPanel
        Left = 0
        Top = 0
        Width = 928
        Height = 41
        Align = alTop
        TabOrder = 2
        object Label1: TLabel
          Left = 8
          Top = 8
          Width = 257
          Height = 24
          Caption = #38376#31105#26356#26032#20197#21450'ID'#21345#21495#23548#20986#25509#21475
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
      end
      object pnl3: TPanel
        Left = 297
        Top = 41
        Width = 631
        Height = 542
        Align = alClient
        TabOrder = 3
        object dbgrdh1: TDBGridEh
          Left = 1
          Top = 1
          Width = 629
          Height = 540
          Align = alClient
          DataSource = ds1
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
    end
    object ts2: TTabSheet
      Caption = #38376#31105#25968#25454#26597#35810
      ImageIndex = 1
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 41
        Width = 928
        Height = 558
        Align = alClient
        DataSource = ds2
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnTitleClick = DBGridEh1TitleClick
        Columns = <
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = #20301#32622
            Footers = <>
            Width = 81
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = #38376#31105#21345#21495
            Footers = <>
            Width = 57
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = #38376#31105#24037#21495
            Footers = <>
            Width = 51
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = #38376#31105#22995#21517
            Footers = <>
            Width = 52
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = #38376#31105#37096#38376
            Footers = <>
            Width = 54
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = #25171#21345#26102#38388
            Footers = <>
            Width = 108
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = #31867#22411
            Footers = <>
            Width = 28
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = #29366#24577
            Footers = <>
            Width = 58
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = #24037#21495
            Footers = <>
            Width = 47
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = #22995#21517
            Footers = <>
            Width = 48
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = #37096#38376
            Footers = <>
            Width = 70
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = #32844#21153
            Footers = <>
            Width = 68
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = #24037#21378
            Footers = <>
            Width = 82
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 928
        Height = 41
        Align = alTop
        TabOrder = 1
        object Label2: TLabel
          Left = 90
          Top = 10
          Width = 95
          Height = 29
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbl3: TLabel
          Left = 604
          Top = 19
          Width = 11
          Height = 14
          AutoSize = False
          Caption = #33267
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = 10
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbl4: TLabel
          Left = 272
          Top = 16
          Width = 51
          Height = 16
          AutoSize = False
          Caption = #24037#21495
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = 12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 848
          Top = 24
          Width = 51
          Height = 16
          AutoSize = False
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = 12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object BitBtn2: TBitBtn
          Left = 8
          Top = 8
          Width = 75
          Height = 33
          Caption = #27979#35797#32593#32476
          TabOrder = 0
          OnClick = btn1Click
        end
        object dtp1: TDateTimePicker
          Left = 456
          Top = 16
          Width = 81
          Height = 21
          Date = 42023.000000000000000000
          Format = 'yyyy-MM-dd HH:mm:ss'
          Time = 42023.000000000000000000
          TabOrder = 1
        end
        object dtp2: TDateTimePicker
          Left = 624
          Top = 16
          Width = 81
          Height = 21
          Date = 42023.999988425930000000
          Format = 'yyyy-MM-dd HH:mm:ss'
          Time = 42023.999988425930000000
          TabOrder = 2
        end
        object edt2: TEdit
          Left = 328
          Top = 13
          Width = 121
          Height = 21
          TabOrder = 3
          OnChange = edt2Change
        end
        object btn4: TButton
          Left = 763
          Top = 14
          Width = 75
          Height = 25
          Caption = #26597#35810
          Enabled = False
          TabOrder = 4
          OnClick = btn4Click
        end
        object Button1: TButton
          Left = 189
          Top = 7
          Width = 75
          Height = 30
          Caption = #23548#20986
          Enabled = False
          TabOrder = 5
          OnClick = Button1Click
        end
        object dtp3: TDateTimePicker
          Left = 536
          Top = 16
          Width = 65
          Height = 21
          Date = 42023.000000000000000000
          Format = 'HH:mm:ss'
          Time = 42023.000000000000000000
          Kind = dtkTime
          TabOrder = 6
        end
        object dtp4: TDateTimePicker
          Left = 704
          Top = 16
          Width = 65
          Height = 21
          Date = 42023.999988425930000000
          Format = 'HH:mm:ss'
          Time = 42023.999988425930000000
          Kind = dtkTime
          TabOrder = 7
        end
      end
    end
  end
  object con_door: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=62ddf8f60269678;Persist Security In' +
      'fo=True;User ID=wzpcbconnect;Initial Catalog=KK2006;Data Source=' +
      '172.18.3.89'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 120
    Top = 328
  end
  object con_erp: TADOConnection
    CommandTimeout = 90
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=62ddf8f60269678;Persist Security In' +
      'fo=True;User ID=wzpcbconnect;Initial Catalog=wisdompcb;Data Sour' +
      'ce=172.18.0.8'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 120
    Top = 278
  end
  object qry1: TADOQuery
    Connection = con_erp
    CommandTimeout = 90
    Parameters = <>
    SQL.Strings = (
      'exec dbo.hrsp_door_list')
    Left = 59
    Top = 273
  end
  object ds1: TDataSource
    DataSet = qry2
    Left = 16
    Top = 297
  end
  object qry2: TADOQuery
    Connection = con_erp
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      
        'select '#39#19996#33694#39' as ['#21378#21306'], employeecode as ['#24037#21495'],chinesename as ['#22995#21517'],ca' +
        'rdno as ['#32771#21220#21345#21495']'
      'from employeemsg where status=1 and len(cardno)=10'
      'union all'
      
        'select  '#39#28145#22323#39' as ['#21378#21306'],employeecode as ['#24037#21495'],chinesename as ['#22995#21517'],ca' +
        'rdno as ['#32771#21220#21345#21495']'
      
        'from [172.16.0.8].SJ_V20_LIVE.dbo.employeemsg  where status=1 an' +
        'd len(cardno)=10'
      'union all'
      
        'select  '#39#26757#24030#39' as ['#21378#21306'],employeecode as ['#24037#21495'],chinesename as ['#22995#21517'],ca' +
        'rdno as ['#32771#21220#21345#21495'] '
      
        'from [172.17.0.187].WISDOMPCB.dbo.employeemsg  where status=1 an' +
        'd len(cardno)=10'
      '')
    Left = 59
    Top = 321
  end
  object qry3: TADOQuery
    Connection = con_door
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    Left = 763
    Top = 257
    object qry3DSDesigner: TStringField
      FieldName = #20301#32622
      Size = 50
    end
    object qry3DSDesigner2: TStringField
      FieldName = #38376#31105#21345#21495
      Size = 8
    end
    object qry3DSDesigner3: TStringField
      FieldName = #38376#31105#24037#21495
      Size = 12
    end
    object qry3DSDesigner4: TStringField
      FieldName = #38376#31105#22995#21517
      Size = 50
    end
    object qry3DSDesigner5: TStringField
      FieldName = #38376#31105#37096#38376
      Size = 50
    end
    object qry3DSDesigner6: TStringField
      FieldName = #25171#21345#26102#38388
      Size = 19
    end
    object qry3DSDesigner7: TStringField
      FieldName = #31867#22411
      FixedChar = True
      Size = 2
    end
    object qry3DSDesigner8: TStringField
      FieldName = #29366#24577
    end
    object qry3DSDesigner9: TWideStringField
      FieldName = #24037#21495
    end
    object qry3DSDesigner10: TWideStringField
      FieldName = #22995#21517
    end
    object qry3DSDesigner11: TWideStringField
      FieldName = #37096#38376
    end
    object qry3DSDesigner12: TWideStringField
      FieldName = #32844#21153
    end
    object qry3DSDesigner13: TWideStringField
      FieldName = #24037#21378
    end
  end
  object ds2: TDataSource
    DataSet = qry3
    Left = 708
    Top = 264
  end
end
