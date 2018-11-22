object frmMain: TfrmMain
  Left = 312
  Top = 211
  Width = 804
  Height = 577
  Caption = 'frmMain'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 796
    Height = 520
    Align = alClient
    TabOrder = 0
    object pgc1: TPageControl
      Left = 1
      Top = 1
      Width = 794
      Height = 518
      ActivePage = ts3
      Align = alClient
      TabOrder = 0
      object ts1: TTabSheet
        Caption = #25490#29677
        object pnl2: TPanel
          Left = 0
          Top = 0
          Width = 786
          Height = 41
          Align = alTop
          TabOrder = 0
          object lbl1: TLabel
            Left = 352
            Top = 12
            Width = 33
            Height = 13
            Caption = #24180#26376':'
          end
          object lbl_field1: TLabel
            Left = 857
            Top = 12
            Width = 26
            Height = 13
            Caption = #24037#21495
          end
          object btn_model: TButton
            Left = 16
            Top = 8
            Width = 75
            Height = 25
            Caption = #23548#20986#27169#29256'1'
            TabOrder = 0
            OnClick = btn_modelExport1Click
          end
          object btn_import1: TButton
            Left = 256
            Top = 8
            Width = 75
            Height = 25
            Caption = #23548#20837
            TabOrder = 1
            OnClick = btn_import1Click
          end
          object btn_SelExcel1: TButton
            Left = 96
            Top = 8
            Width = 75
            Height = 25
            Caption = #25171#24320#25991#20214
            TabOrder = 2
            OnClick = btn_SelExcel1Click
          end
          object btn_Check1: TButton
            Left = 176
            Top = 8
            Width = 75
            Height = 25
            Caption = #26597#26816
            TabOrder = 3
            Visible = False
          end
          object btn_qry1: TButton
            Left = 1016
            Top = 6
            Width = 43
            Height = 25
            Caption = #26597#35810
            TabOrder = 4
            OnClick = btn_qry1Click
          end
          object edt_value: TEdit
            Left = 888
            Top = 8
            Width = 97
            Height = 21
            TabOrder = 5
            OnChange = edt_valueChange
          end
          object edt_YM: TEdit
            Left = 384
            Top = 8
            Width = 121
            Height = 21
            TabOrder = 6
          end
        end
        object pnl3: TPanel
          Left = 0
          Top = 41
          Width = 786
          Height = 449
          Align = alClient
          TabOrder = 1
          object pnl4: TPanel
            Left = 1
            Top = 1
            Width = 848
            Height = 447
            Align = alLeft
            TabOrder = 0
            object StringGrid1: TStringGrid
              Left = 1
              Top = 1
              Width = 846
              Height = 445
              Align = alClient
              ColCount = 33
              DefaultColWidth = 20
              DefaultRowHeight = 20
              FixedCols = 0
              TabOrder = 0
            end
          end
          object pnl5: TPanel
            Left = 849
            Top = 1
            Width = 220
            Height = 447
            Align = alClient
            TabOrder = 1
            object eh1: TDBGridEh
              Left = 1
              Top = 1
              Width = 218
              Height = 445
              Align = alClient
              DataSource = ds1
              FooterColor = clWindow
              FooterFont.Charset = DEFAULT_CHARSET
              FooterFont.Color = clWindowText
              FooterFont.Height = -13
              FooterFont.Name = #23435#20307
              FooterFont.Style = []
              PopupMenu = pm1
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -13
              TitleFont.Name = #23435#20307
              TitleFont.Style = []
              OnTitleClick = eh1TitleClick
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'employeecode'
                  Footers = <>
                  Title.Caption = #24037#21495
                  Width = 41
                end
                item
                  EditButtons = <>
                  FieldName = 'chinesename'
                  Footers = <>
                  Title.Caption = #22995#21517
                  Width = 54
                end
                item
                  EditButtons = <>
                  FieldName = 'checkdate'
                  Footers = <>
                  Title.Caption = #26085#26399
                  Width = 67
                end
                item
                  EditButtons = <>
                  FieldName = 'classname'
                  Footers = <>
                  Title.Caption = #29677#27425
                  Width = 91
                end>
            end
          end
        end
      end
      object TabSheet1: TTabSheet
        Caption = #36718#29677
        ImageIndex = 1
        object pnl7: TPanel
          Left = 0
          Top = 0
          Width = 786
          Height = 490
          Align = alClient
          TabOrder = 0
          object pnl8: TPanel
            Left = 1
            Top = 1
            Width = 475
            Height = 488
            Align = alClient
            TabOrder = 0
            object pnl11: TPanel
              Left = 1
              Top = 1
              Width = 473
              Height = 41
              Align = alTop
              TabOrder = 0
              object lbl2: TLabel
                Left = 352
                Top = 10
                Width = 33
                Height = 13
                Caption = #24180#26376':'
              end
              object lblCount: TLabel
                Left = 608
                Top = 16
                Width = 21
                Height = 13
                Caption = '000'
              end
              object btn_Model2: TButton
                Left = 16
                Top = 8
                Width = 75
                Height = 25
                Caption = #23548#20986#27169#29256'2'
                TabOrder = 0
                OnClick = btn_Model2Click
              end
              object btn_OpenFile2: TButton
                Left = 96
                Top = 8
                Width = 75
                Height = 25
                Caption = #25171#24320#25991#20214
                TabOrder = 1
                OnClick = btn_OpenFile2Click
              end
              object btn_import2: TButton
                Left = 256
                Top = 8
                Width = 75
                Height = 25
                Caption = #23548#20837
                TabOrder = 2
                OnClick = btn_import2Click
              end
              object edt_YM2: TEdit
                Left = 384
                Top = 8
                Width = 121
                Height = 21
                TabOrder = 3
              end
            end
            object pnl13: TPanel
              Left = 1
              Top = 42
              Width = 473
              Height = 445
              Align = alClient
              TabOrder = 1
              object StringGrid2: TStringGrid
                Left = 1
                Top = 1
                Width = 471
                Height = 443
                Align = alClient
                ColCount = 33
                DefaultColWidth = 20
                DefaultRowHeight = 20
                FixedCols = 0
                TabOrder = 0
                RowHeights = (
                  20
                  20
                  20
                  20
                  13)
              end
            end
          end
          object pnl10: TPanel
            Left = 476
            Top = 1
            Width = 309
            Height = 488
            Align = alRight
            TabOrder = 1
            object pnl12: TPanel
              Left = 1
              Top = 1
              Width = 307
              Height = 41
              Align = alTop
              TabOrder = 0
              object lbl4: TLabel
                Left = 281
                Top = 12
                Width = 26
                Height = 13
                Caption = #22995#21517
              end
              object lbl5: TLabel
                Left = 281
                Top = 20
                Width = 26
                Height = 13
                Caption = #22995#21517
              end
              object lbl_field2: TLabel
                Left = 33
                Top = 12
                Width = 26
                Height = 13
                Caption = #24037#21495
              end
              object edt_value2: TEdit
                Left = 74
                Top = 8
                Width = 121
                Height = 21
                TabOrder = 0
                OnChange = edt_value2Change
              end
              object btn_Qry2: TButton
                Left = 232
                Top = 6
                Width = 75
                Height = 25
                Caption = #26597#35810
                TabOrder = 1
                OnClick = btn_Qry2Click
              end
            end
            object pnl14: TPanel
              Left = 1
              Top = 42
              Width = 307
              Height = 445
              Align = alClient
              TabOrder = 1
              object eh2: TDBGridEh
                Left = 1
                Top = 1
                Width = 305
                Height = 443
                Align = alClient
                DataSource = ds2
                FooterColor = clWindow
                FooterFont.Charset = DEFAULT_CHARSET
                FooterFont.Color = clWindowText
                FooterFont.Height = -13
                FooterFont.Name = #23435#20307
                FooterFont.Style = []
                PopupMenu = pm2
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -13
                TitleFont.Name = #23435#20307
                TitleFont.Style = []
                OnTitleClick = eh2TitleClick
                Columns = <
                  item
                    EditButtons = <>
                    FieldName = 'employeecode'
                    Footers = <>
                    Title.Caption = #24037#21495
                    Width = 63
                  end
                  item
                    EditButtons = <>
                    FieldName = 'chinesename'
                    Footers = <>
                    Title.Caption = #22995#21517
                    Width = 47
                  end
                  item
                    EditButtons = <>
                    FieldName = 'checkdate'
                    Footers = <>
                    Title.Caption = #26085#26399
                    Width = 72
                  end
                  item
                    EditButtons = <>
                    FieldName = 'resttype'
                    Footers = <>
                    Title.Caption = #31867#22411
                    Width = 33
                  end>
              end
            end
          end
        end
      end
      object ts2: TTabSheet
        Caption = #35831#20551
        ImageIndex = 2
        object pnl15: TPanel
          Left = 0
          Top = 0
          Width = 1070
          Height = 41
          Align = alTop
          TabOrder = 0
          object lbl_YM3: TLabel
            Left = 352
            Top = 12
            Width = 33
            Height = 13
            Caption = #24180#26376':'
            Visible = False
          end
          object btn_model3: TButton
            Left = 16
            Top = 8
            Width = 75
            Height = 25
            Caption = #23548#20986#27169#29256'3'
            TabOrder = 0
            OnClick = btn_model3Click
          end
          object btn_OpenFile3: TButton
            Left = 96
            Top = 8
            Width = 75
            Height = 25
            Caption = #25171#24320#25991#20214
            TabOrder = 1
            OnClick = btn_OpenFile3Click
          end
          object btn_check3: TButton
            Left = 176
            Top = 8
            Width = 75
            Height = 25
            Caption = #26597#26816
            TabOrder = 2
            Visible = False
          end
          object btn_import3: TButton
            Left = 256
            Top = 8
            Width = 75
            Height = 25
            Caption = #23548#20837
            TabOrder = 3
            OnClick = btn_import3Click
          end
          object edt_YM3: TEdit
            Left = 384
            Top = 8
            Width = 121
            Height = 21
            TabOrder = 4
            Visible = False
          end
          object edt_Value3: TEdit
            Left = 808
            Top = 8
            Width = 121
            Height = 21
            TabOrder = 5
            Visible = False
          end
          object btn_Qry3: TButton
            Left = 984
            Top = 6
            Width = 75
            Height = 25
            Caption = #26597#35810
            TabOrder = 6
            Visible = False
            OnClick = btn_qry1Click
          end
        end
        object pnl16: TPanel
          Left = 0
          Top = 41
          Width = 1070
          Height = 449
          Align = alClient
          TabOrder = 1
          object pnl18: TPanel
            Left = 1032
            Top = 1
            Width = 37
            Height = 447
            Align = alRight
            TabOrder = 0
            object eh3: TDBGridEh
              Left = 1
              Top = 1
              Width = 35
              Height = 445
              Align = alClient
              DataSource = ds3
              FooterColor = clWindow
              FooterFont.Charset = DEFAULT_CHARSET
              FooterFont.Color = clWindowText
              FooterFont.Height = -13
              FooterFont.Name = #23435#20307
              FooterFont.Style = []
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -13
              TitleFont.Name = #23435#20307
              TitleFont.Style = []
            end
          end
          object pnl19: TPanel
            Left = 1
            Top = 1
            Width = 1031
            Height = 447
            Align = alClient
            TabOrder = 1
            object StringGrid3: TStringGrid
              Left = 1
              Top = 1
              Width = 1029
              Height = 445
              Align = alClient
              ColCount = 8
              DefaultColWidth = 20
              DefaultRowHeight = 20
              FixedCols = 0
              TabOrder = 0
            end
          end
        end
      end
      object ts3: TTabSheet
        Caption = #35774#32622
        ImageIndex = 3
        object lbl3: TLabel
          Left = 109
          Top = 226
          Width = 26
          Height = 13
          Caption = #26085#26399
        end
        object lbl6: TLabel
          Left = 184
          Top = 346
          Width = 21
          Height = 13
          Caption = '-->'
        end
        object lbl7: TLabel
          Left = 318
          Top = 345
          Width = 91
          Height = 13
          Caption = #23548#20837#36718#29677#12289#35831#20551
        end
        object lbl8: TLabel
          Left = 414
          Top = 345
          Width = 21
          Height = 13
          Caption = '-->'
        end
        object Label1: TLabel
          Left = 296
          Top = 346
          Width = 21
          Height = 13
          Caption = '-->'
        end
        object lbl9: TLabel
          Left = 208
          Top = 345
          Width = 91
          Height = 13
          Caption = #32771#21220#26126#32454#21021#22987#21270
        end
        object Label2: TLabel
          Left = 208
          Top = 306
          Width = 210
          Height = 21
          Caption = #35831#20005#26684#25353#20197#19979#39034#24207#26469#65306
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -21
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object lbl10: TLabel
          Left = 223
          Top = 102
          Width = 343
          Height = 13
          Caption = '------------------------------------------------>'
        end
        object lbl11: TLabel
          Left = 226
          Top = 93
          Width = 347
          Height = 13
          Caption = #21483#36164#35759#22791#20221#26368#26032#30340#25968#25454#21040'eicc,'#37325#26032#23548#20837#21069#27492#31383#21475#19981#33021#20851#38381#65281
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object lbl12: TLabel
          Left = 144
          Top = 61
          Width = 26
          Height = 13
          Caption = #26376#20221
        end
        object btn1: TButton
          Left = 104
          Top = 338
          Width = 75
          Height = 25
          Caption = '3.'#21021#22987#21270
          TabOrder = 0
          OnClick = btn1Click
        end
        object dtp1: TDateTimePicker
          Left = 141
          Top = 222
          Width = 97
          Height = 21
          Date = 42919.678189849540000000
          Format = 'yyyy-MM-dd'
          Time = 42919.678189849540000000
          TabOrder = 1
        end
        object dtp2: TDateTimePicker
          Left = 245
          Top = 222
          Width = 97
          Height = 21
          Date = 42919.678189849540000000
          Format = 'yyyy-MM-dd'
          Time = 42919.678189849540000000
          TabOrder = 2
        end
        object btn2: TButton
          Left = 435
          Top = 338
          Width = 75
          Height = 25
          Caption = '4.'#29983#25104#32771#21220
          TabOrder = 3
          OnClick = btn2Click
        end
        object btn_BakData: TButton
          Left = 80
          Top = 91
          Width = 140
          Height = 25
          Caption = '1.'#22791#20221#24050#22788#29702#22909#30340#25968#25454
          TabOrder = 4
          OnClick = btn_BakDataClick
        end
        object btn_ReInsert: TButton
          Left = 571
          Top = 89
          Width = 75
          Height = 25
          Caption = '2.'#37325#26032#23548#20837
          TabOrder = 5
          OnClick = btn_ReInsertClick
        end
        object BDate: TDateTimePicker
          Left = 176
          Top = 57
          Width = 78
          Height = 21
          Date = 42491.678189849540000000
          Format = 'yyyy-MM'
          Time = 42491.678189849540000000
          TabOrder = 6
        end
        object EDate: TDateTimePicker
          Left = 256
          Top = 57
          Width = 77
          Height = 21
          Date = 43009.678189849540000000
          Format = 'yyyy-MM'
          Time = 43009.678189849540000000
          TabOrder = 7
        end
        object edt1: TEdit
          Left = 104
          Top = 144
          Width = 121
          Height = 21
          TabOrder = 8
        end
        object edt2: TEdit
          Left = 240
          Top = 144
          Width = 121
          Height = 21
          TabOrder = 9
        end
        object edt3: TEdit
          Left = 368
          Top = 144
          Width = 225
          Height = 21
          TabOrder = 10
        end
        object chk1: TCheckBox
          Left = 120
          Top = 267
          Width = 177
          Height = 17
          Caption = #29983#25104#25351#23450#26085#26399#19978#21322#22825#30340#21345
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 11
          OnClick = chk1Click
        end
        object NDate1: TDateTimePicker
          Left = 301
          Top = 261
          Width = 100
          Height = 21
          Date = 43066.669256631950000000
          Format = 'yyyy-MM-dd '
          Time = 43066.669256631950000000
          TabOrder = 12
        end
        object NTime: TDateTimePicker
          Left = 397
          Top = 261
          Width = 82
          Height = 21
          Date = 42266.333333333340000000
          Time = 42266.333333333340000000
          Kind = dtkTime
          TabOrder = 13
        end
      end
    end
  end
  object pnl17: TPanel
    Left = 0
    Top = 520
    Width = 796
    Height = 26
    Align = alBottom
    TabOrder = 1
    object pb1: TProgressBar
      Left = 1
      Top = 1
      Width = 794
      Height = 24
      Align = alClient
      TabOrder = 0
    end
  end
  object dlgOpen1: TOpenDialog
    Left = 672
  end
  object ds1: TDataSource
    DataSet = qry_class
    Left = 598
    Top = 155
  end
  object qry_class: TADOQuery
    Connection = DM.con1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'YM'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 7
        Value = Null
      end>
    SQL.Strings = (
      
        'select   a.rkey, c.chinesename, c.employeecode, a.checkdate, b.c' +
        'lassname,a.classid'
      'from  onoffdutydata a '
      'left  join class b on a.classid=b.rkey'
      'inner join  employeemsg c on a.employeeid=c.rkey'
      'where  convert(varchar(7),checkdate,120)=:YM'
      '')
    Left = 638
    Top = 147
    object qry_classchinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object qry_classemployeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object qry_classcheckdate: TDateTimeField
      FieldName = 'checkdate'
    end
    object qry_classclassname: TWideStringField
      FieldName = 'classname'
    end
    object qry_classrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object qry_classclassid: TIntegerField
      FieldName = 'classid'
    end
  end
  object ds2: TDataSource
    DataSet = qry_Lclass
    Left = 598
    Top = 187
  end
  object qry_Lclass: TADOQuery
    Connection = DM.con1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'YM'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 7
        Value = Null
      end>
    SQL.Strings = (
      
        'select   a.rkey,  c.chinesename, c.employeecode, a.checkdate, a.' +
        'resttype,a.classid'
      'from  onoffdutydata a '
      'inner join  employeemsg c on a.employeeid=c.rkey'
      'where  convert(varchar(7),checkdate,120)=:YM')
    Left = 638
    Top = 187
    object qry_Lclasschinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object qry_Lclassemployeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object qry_Lclasscheckdate: TDateTimeField
      FieldName = 'checkdate'
    end
    object qry_Lclassresttype: TIntegerField
      FieldName = 'resttype'
    end
    object qry_Lclassrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object qry_Lclassclassid: TIntegerField
      FieldName = 'classid'
    end
  end
  object ds3: TDataSource
    DataSet = qry_Holiday
    Left = 598
    Top = 227
  end
  object qry_Holiday: TADOQuery
    Connection = DM.con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select   c.chinesename, c.employeecode, a.checkdate, b.classname'
      'from  onoffdutydata a '
      'inner join class b on a.classid=b.rkey'
      'inner join  employeemsg c on a.employeeid=c.rkey'
      'where  convert(varchar(7),checkdate,120)='#39'-1'#39)
    Left = 718
    Top = 291
    object WideStringField4: TWideStringField
      FieldName = 'chinesename'
    end
    object WideStringField5: TWideStringField
      FieldName = 'employeecode'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'checkdate'
    end
    object WideStringField6: TWideStringField
      FieldName = 'classname'
    end
  end
  object pm1: TPopupMenu
    Left = 710
    Top = 139
    object mniN1: TMenuItem
      Caption = #20462#25913
      OnClick = mniN1Click
    end
  end
  object pm2: TPopupMenu
    Left = 726
    Top = 219
    object mniedit2: TMenuItem
      Caption = #20462#25913
      OnClick = mniedit2Click
    end
  end
  object qrytemp: TADOQuery
    Connection = DM.con1
    CommandTimeout = 0
    Parameters = <>
    Left = 661
    Top = 313
  end
  object qry_UpdateView: TADOQuery
    Connection = DM.con1
    CommandTimeout = 0
    Parameters = <>
    SQL.Strings = (
      'alter         VIEW [dbo].[v_onoffduty_report]    '
      ' AS    '
      'SELECT TOP 100 PERCENT      '
      '     case when datepart(weekday,checkdate) in (1,7) then '#39'*'#39'    '
      '     when  resttype in (2) then '#39#20241#39'    '
      '  when isnull(resttype,0) in (3) then '#39#33410#39'    '
      '  else '#39#39' end     '
      '  as flag, ----'#26174#31034#26631#35782'    '
      ' DAY(CheckDate)AS dy,      '
      ' YEAR(CheckDate) AS '#24180',     '
      ' MONTH(CheckDate) AS '#26376',     '
      ' DAY(CheckDate) as '#26085',    '
      ' ChineseName,--------'#22995#21517'    '
      ' employeeid,    '
      ' position,-----'#32844#21153'ID    '
      'position_item,----'#32844#21153#21517#31216'     '
      
        ' SUBSTRING(CONVERT(nvarchar(20), OffDutyTime1, 120), 12, 5) AS o' +
        'ut1,-----------    '
      
        ' SUBSTRING(CONVERT(nvarchar(20), ondutytime1, 120), 12, 5) AS in' +
        '1,-------------    '
      
        ' SUBSTRING(CONVERT(nvarchar(20), ondutytime2, 120), 12, 5) AS in' +
        '2,-------------    '
      
        ' SUBSTRING(CONVERT(nvarchar(20), OffDutyTime2, 120), 12, 5) AS o' +
        'ut2,------------    '
      
        ' SUBSTRING(CONVERT(nvarchar(20), ondutytime3, 120), 12, 5) AS in' +
        '3,--------------    '
      
        ' SUBSTRING(CONVERT(nvarchar(20), OffDutyTime3, 120), 12, 5) AS o' +
        'ut3,-------------    '
      
        ' SUBSTRING(CONVERT(nvarchar(20), OnDutyTime4, 120), 12, 5) AS in' +
        '4,    '
      
        ' SUBSTRING(CONVERT(nvarchar(20), OffDutyTime4, 120), 12, 5) AS o' +
        'ut4,    '
      'DepartmentName, ----'#37096#38376#21517#31216'    '
      'EmployeeCode,-----'#24037#21495'    '
      'ondutytime,    '
      'outdutytime,------'#31163#32844#26085#26399'    '
      
        'case when outdutytime is not null then 1 else 0 end as outduty_f' +
        'lag,    '
      'ClassName,------'#29677#27425#21517#31216'    '
      'CheckDate,------'#32771#21220#26085#26399'    '
      'd.accountname,    '
      'SumCN,     '
      'SumCT, ----'#36831#21040#20998#38047'    '
      'SumZN,    '
      'SumZT,----'#26089#36864#20998#38047'    '
      'SumKN,     '
      'isnull(SumKT,0)/15/4.0/8.0 as sumkt,----- '#26103#24037#22825'     '
      'SumWN,    '
      'SumWT, -----    '
      'SumJN,     '
      'SumJT,-----     '
      'SumEN,     '
      'SumET, -----    '
      'SumLN,    '
      ' case when ln1 not in (9)     '
      ' and ln2 not in (9) then     '
      
        ' round(isnull(SumLT,0)/10.00,0)*10/30/2.0 else 0 end as SumLT ,-' +
        '-----'#35831#20551#23567#26102'    '
      ' YTnote,     '
      ' ClassGroupID,    '
      ' RestType,------'#20551#26085#31867#22411',0 '#26159#24037#20316#26085'    '
      ' OWT,    '
      ' SWT,    '
      ' NCN,    '
      '---select * from resttypemsg    '
      
        ' (case when isnull(resttype,0)<>4 then  isnull(RWT,0)  else 0 en' +
        'd )  as RWT ,-----'#24403#22825#20027#24037#26102'    '
      
        ' (case when isnull(resttype,0)<>4  then  isnull(ROT,0)  else 0 e' +
        'nd ) as ROT, -----'#24403#22825#38468#24037#26102'    '
      '    '
      
        ' case when isnull(resttype,0)<>4  then ( round((isnull(RWT,0)+is' +
        'null(ROT,0)),2)) else 0 end as RWTROT,----'#24403#22825#24635#24037#26102'    '
      '    '
      
        'case when isnull(resttype,0)=0  then round(isnull(rwt,0),2) else' +
        ' 0 end    '
      ' as work1,--'#27491#29677'('#21608#19968#33267#21608#20116#26080#33394')    '
      '    '
      
        'case when isnull(resttype,0)=0 and c.isoverzero=0 and isnull(rwt' +
        ',0)>=4 then     '
      ' round(isnull(rwt,0)/8.0,2) else 0 end    '
      '    '
      'as work1_day, --'#27491#29677#30333#29677'    '
      
        'case when isnull(resttype,0)=0 and c.isoverzero=1 and isnull(rwt' +
        ',0)>=4 then     '
      ' round(isnull(rwt,0)/8.0,2) else 0 end    '
      '    '
      'as work1_night,---'#27491#29677#22812#29677'    '
      'case when isnull(resttype,0)=0 then round(isnull(rot,0),2)     '
      
        '  when isnull(resttype,0)=1 then round((isnull(rot,0)+isnull(rwt' +
        ',0)),2)    '
      
        '  when isnull(resttype,0)=3 then round((isnull(rot,0)+isnull(rwt' +
        ',0)),2) else 0 end    '
      ' as work2,--'#21152#29677',    '
      '    '
      
        'case when isnull(resttype,0)=0  then round(isnull(rot,0),2) else' +
        ' 0 end     '
      ' as work3,--'#24179#26102#21152#29677#65288#28784#33394#21152#29677#65289'    '
      '    '
      
        '  case   when isnull(resttype,0)=1     then      round((isnull(r' +
        'ot,0)+isnull(rwt,0)),2)    --- else 0 end     '
      ' else  0 end  as work4,--'#21608#20845#26085#21152#29677#65288#32511#33394#21152#29677#65289'      '
      '     '
      
        'case    when isnull(resttype,0)=1   and owtflag=0   then round((' +
        'isnull(rot,0)+isnull(rwt,0)),2)    '
      
        '        when isnull(resttype,0)=1   and owtflag=1  and isnull(nr' +
        'wt,0)>0    then      round(isnull(rot,0)+isnull(nrwt,0),2)    --' +
        '- else 0 end     '
      'else  0 end  as work44,--'#21608#20845#26085#27809#26377#30003#35831#30340#21152#29677'      '
      '    '
      '    '
      
        '  case   when isnull(resttype,0)=3    then      round((isnull(ro' +
        't,0)+isnull(rwt,0)),2)    --- else 0 end     '
      ' else  0 end  as work10,--'#33410#20551#21152#29677#65288#32511#33394#21152#29677#65289'    '
      '  '
      
        'case    when isnull(resttype,0)=3   and owtflag=0   then round((' +
        'isnull(rot,0)+isnull(rwt,0)),2)    '
      
        '        when isnull(resttype,0)=3   and owtflag=1  and isnull(nr' +
        'wt,0)>0    then      round(isnull(rot,0)+isnull(nrwt,0),2)    --' +
        '- else 0 end     '
      'else  0 end  as work40,--'#33410#20551#27809#26377#30003#35831#30340#21152#29677'     '
      '  '
      '  '
      '    '
      '(case when a.locked=1 and isnull(rwt,0)=4.0      '
      '      then 0.50      ---'#24050#38145'    '
      
        '   when a.locked=1 and isnull(rot,0)>0 and isnull(rwt,0)<=8.0   ' +
        '   '
      '      then (8.0-isnull(rwt,0))/8.0 ---'#24050#38145'    '
      
        '   when isnull(resttype,0) in (0,2,4) and isnull(rwt,0)=0 then 1' +
        '.00  -----'#28145#22323#21306#22495#29305#23450'rkey    '
      '   when isnull(resttype,0)=0 and rwt=4.0 and    '
      '  (isnull(ln1,0)=3 or isnull(ln2,0)=3 or isnull(ln3,0)=3)     '
      '      then 0.50    '
      
        '      when isnull(resttype,0)=0 and  (swt=4) and (rwt between 0 ' +
        'and 4) then 0.50    '
      
        '   when isnull(resttype,0)=0 and  (swt=6) and (rwt between 4 and' +
        ' 6) then 0.25       '
      ' else 0 end )     '
      'as restday,--'#35843#20241#22825#25968', '#20248#20808#21028#26029#31532#19968#20010#26465#20214'    '
      '    '
      
        'case when isnull(resttype,0)=0  then round(isnull(rwt,0)/8.0,2) ' +
        '    '
      '  else 0 end    '
      'as workday,--'#27491#29677#20986#21220#22825'('#21608#19968#33267#21608#20116#26080#33394')    '
      '    '
      
        'case when  isnull(resttype,0) in (0,1) and  isnull(rwt,0)>7.0 th' +
        'en 1     '
      
        'else (case when  isnull(resttype,0) in (0,1) and  isnull(rwt,0)>' +
        '=3.5 then 0.5 else 0 end ) end    '
      '      '
      'as orginal_workday,--'#21407#20986#21220#22825'    '
      '    '
      '    '
      '    '
      '    '
      
        'case when   isnull(resttype,0)=1     and isnull(rwt,0)>7.0 then ' +
        '1     '
      
        'else (case when isnull(resttype,0)=1 and isnull(rwt,0)>=3.5 then' +
        ' 0.5 else 0 end )    '
      'end      '
      'as week_workday,--'#26631#35782#21608#26411#20986#21220#22825'    '
      '    '
      '    '
      'case when isnull(resttype,0)=3 then 1.0     '
      '  else 0 end    '
      'as festival ,--'#27861#23450#20551#22825'('#22825#34013#33394')    '
      '    '
      '    '
      '    '
      'case when     '
      '(    '
      '(case when isnull(resttype,0)=0 and (isnull(ln1,0)=6 )     '
      'then   round(isnull(lt1,0)/10,0)*10 else 0 end    '
      '+case when isnull(resttype,0)=0 and (isnull(ln2,0)=6 )    '
      ' then  round(isnull(lt2,0)/10,0)*10  else 0 end    '
      '+ case when isnull(resttype,0)=0 and (isnull(ln3,0)=6 )     '
      'then  round(isnull(lt3,0)/10,0)*10 else 0 end    '
      ')/15/4    '
      ')>8 then 8     '
      'else (    '
      '(case when isnull(resttype,0)=0 and (isnull(ln1,0)=6 )     '
      'then  round(isnull(lt1,0)/10,0)*10 else 0 end    '
      '+case when isnull(resttype,0)=0 and (isnull(ln2,0)=6 )     '
      'then  round(isnull(lt2,0)/10,0)*10 else 0 end    '
      '+ case when isnull(resttype,0)=0 and (isnull(ln3,0)=6 )    '
      ' then  round(isnull(lt3,0)/10,0)*10 else 0 end    '
      ')/15/4    '
      ') end  as qj, ---'#35831#20551#23567#26102'    '
      '    '
      'round(    '
      '    '
      '(case when     '
      '(    '
      '(case when isnull(resttype,0)=0 and (isnull(ln1,0)=11 )     '
      ' then   round(isnull(lt1,0)/10,0)*10 else 0 end    '
      '+case when isnull(resttype,0)=0 and (isnull(ln2,0)=11 )     '
      ' then  round(isnull(lt2,0)/10,0)*10  else 0 end    '
      '+ case when isnull(resttype,0)=0 and (isnull(ln3,0)=11 )     '
      'then  round(isnull(lt3,0)/10,0)*10 else 0 end    '
      ')/15/4 )>8 then 8    '
      'else     '
      '(    '
      '(case when isnull(resttype,0)=0 and (isnull(ln1,0)=11 )     '
      'then  round(isnull(lt1,0)/10,0)*10 else 0 end    '
      '+case when isnull(resttype,0)=0 and (isnull(ln2,0)=11 )    '
      ' then  round(isnull(lt2,0)/10,0)*10 else 0 end    '
      '+ case when isnull(resttype,0)=0 and (isnull(ln3,0)=11 )    '
      ' then  round(isnull(lt3,0)/10,0)*10 else 0 end    '
      ')/15/4) end     '
      '),2)  as yearj ---'#24180#20551#23567#26102'    '
      ' FROM dbo.onoffdutydata a    '
      'left join v_employeemsg b on a.employeeid=b.rkey     '
      'left join class c on a.classid=c.rkey     '
      'left join salaryaccount d on d.rkey=a.editmode     '
      '    '
      'order by employeecode,checkdate     ')
    Left = 629
    Top = 425
  end
end
