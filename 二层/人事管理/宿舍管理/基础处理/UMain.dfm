object frmMain: TfrmMain
  Left = 407
  Top = 214
  Width = 1088
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
    Width = 1080
    Height = 520
    Align = alClient
    TabOrder = 0
    object pgc1: TPageControl
      Left = 1
      Top = 1
      Width = 1078
      Height = 518
      ActivePage = ts3
      Align = alClient
      TabOrder = 0
      object ts1: TTabSheet
        Caption = #25490#29677
        object pnl2: TPanel
          Left = 0
          Top = 0
          Width = 1070
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
          Width = 1070
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
          Width = 1070
          Height = 490
          Align = alClient
          TabOrder = 0
          object pnl8: TPanel
            Left = 1
            Top = 1
            Width = 759
            Height = 488
            Align = alClient
            TabOrder = 0
            object pnl11: TPanel
              Left = 1
              Top = 1
              Width = 757
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
              object btn_Check2: TButton
                Left = 176
                Top = 8
                Width = 75
                Height = 25
                Caption = #26597#26816
                TabOrder = 2
                Visible = False
              end
              object btn_import2: TButton
                Left = 256
                Top = 8
                Width = 75
                Height = 25
                Caption = #23548#20837
                TabOrder = 3
                OnClick = btn_import2Click
              end
              object edt_YM2: TEdit
                Left = 384
                Top = 8
                Width = 121
                Height = 21
                TabOrder = 4
              end
            end
            object pnl13: TPanel
              Left = 1
              Top = 42
              Width = 757
              Height = 445
              Align = alClient
              TabOrder = 1
              object StringGrid2: TStringGrid
                Left = 1
                Top = 1
                Width = 755
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
            Left = 760
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
          Left = 112
          Top = 24
          Width = 26
          Height = 13
          Caption = #26085#26399
        end
        object lbl6: TLabel
          Left = 120
          Top = 80
          Width = 21
          Height = 13
          Caption = '-->'
        end
        object lbl7: TLabel
          Left = 142
          Top = 79
          Width = 130
          Height = 13
          Caption = #23548#20837#25490#29677#12289#36718#29677#12289#35831#20551
        end
        object lbl8: TLabel
          Left = 275
          Top = 79
          Width = 21
          Height = 13
          Caption = '-->'
        end
        object btn1: TButton
          Left = 40
          Top = 72
          Width = 75
          Height = 25
          Caption = #21021#22987#21270
          TabOrder = 0
          OnClick = btn1Click
        end
        object dtp1: TDateTimePicker
          Left = 144
          Top = 17
          Width = 97
          Height = 21
          Date = 42919.678189849540000000
          Format = 'yyyy-MM-dd'
          Time = 42919.678189849540000000
          TabOrder = 1
        end
        object dtp2: TDateTimePicker
          Left = 248
          Top = 17
          Width = 97
          Height = 21
          Date = 42919.678189849540000000
          Format = 'yyyy-MM-dd'
          Time = 42919.678189849540000000
          TabOrder = 2
        end
        object btn2: TButton
          Left = 296
          Top = 72
          Width = 75
          Height = 25
          Caption = #29983#25104#32771#21220
          TabOrder = 3
          OnClick = btn2Click
        end
      end
    end
  end
  object pnl17: TPanel
    Left = 0
    Top = 520
    Width = 1080
    Height = 26
    Align = alBottom
    TabOrder = 1
    object pb1: TProgressBar
      Left = 1
      Top = 1
      Width = 1078
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
    Left = 758
    Top = 99
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
    Left = 798
    Top = 107
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
    Left = 758
    Top = 171
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
    Left = 798
    Top = 179
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
    Left = 758
    Top = 259
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
    Left = 814
    Top = 259
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
    Left = 910
    Top = 179
    object mniN1: TMenuItem
      Caption = #20462#25913
      OnClick = mniN1Click
    end
  end
  object pm2: TPopupMenu
    Left = 950
    Top = 275
    object mniedit2: TMenuItem
      Caption = #20462#25913
      OnClick = mniedit2Click
    end
  end
end
