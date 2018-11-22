object frmMain: TfrmMain
  Left = 269
  Top = 147
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20381#26102#21033'ID'#21345#26426#22120#25511#21046
  ClientHeight = 644
  ClientWidth = 788
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ehDevList: TDBGridEh
    Left = 0
    Top = 0
    Width = 788
    Height = 273
    Align = alTop
    DataSource = DM1.dsDevList
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    PopupMenu = pm1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'selected'
        Footers = <>
        Title.Caption = #36873
        Width = 24
      end
      item
        EditButtons = <>
        FieldName = 'devip'
        Footers = <>
        ReadOnly = True
        Title.Caption = #35774#22791'IP'
        Width = 150
      end
      item
        EditButtons = <>
        FieldName = 'devid'
        Footers = <>
        ReadOnly = True
        Title.Caption = #35774#22791'ID'
      end
      item
        EditButtons = <>
        FieldName = 'devtime'
        Footers = <>
        ReadOnly = True
        Title.Caption = #35774#22791#26102#38388
      end
      item
        EditButtons = <>
        FieldName = 'constatue'
        Footers = <>
        ReadOnly = True
        Title.Caption = #36830#25509#29366#24577
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'note'
        Footers = <>
        ReadOnly = True
        Title.Caption = #25805#20316#29366#24577
        Width = 120
      end>
  end
  object pgc1: TPageControl
    Left = 0
    Top = 273
    Width = 788
    Height = 352
    ActivePage = ts1
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object ts1: TTabSheet
      Caption = #32771#21220#37319#38598
      object btnDownCard: TButton
        Left = 8
        Top = 16
        Width = 75
        Height = 25
        Caption = #37319#21345
        TabOrder = 0
        OnClick = btnDownCardClick
      end
      object btnOpenXMLFile: TButton
        Left = 8
        Top = 130
        Width = 75
        Height = 25
        Caption = #25171#24320#25991#20214
        TabOrder = 1
        OnClick = btnOpenXMLFileClick
      end
      object tv1: TTreeView
        Left = 262
        Top = 0
        Width = 518
        Height = 324
        Align = alRight
        Indent = 19
        TabOrder = 2
      end
      object btnXMLToDB: TButton
        Left = 8
        Top = 168
        Width = 105
        Height = 25
        Caption = #25991#20214'TO'#25968#25454#24211
        TabOrder = 3
        OnClick = btnXMLToDBClick
      end
      object btnDeleCardData: TButton
        Left = 8
        Top = 54
        Width = 75
        Height = 25
        Caption = #21024#38500#35760#24405
        TabOrder = 4
        OnClick = btnDeleCardDataClick
      end
      object btnSetDevTime: TButton
        Left = 8
        Top = 92
        Width = 75
        Height = 25
        Caption = #21516#27493#26102#38388
        TabOrder = 5
        OnClick = btnSetDevTimeClick
      end
    end
    object ts2: TTabSheet
      Caption = #21516#27493#21517#21333
      ImageIndex = 1
      object pnl3: TPanel
        Left = 0
        Top = 0
        Width = 297
        Height = 324
        Align = alLeft
        Caption = 'pnl3'
        TabOrder = 0
        object lbl1: TLabel
          Left = 1
          Top = 1
          Width = 39
          Height = 13
          Align = alTop
          Caption = #25968#25454#24211
        end
        object dbgrdData: TDBGrid
          Left = 1
          Top = 14
          Width = 295
          Height = 278
          Align = alClient
          DataSource = DM1.dsMD
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = #24037#21495
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = #22995#21517
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = #21345#21495
              Width = 110
              Visible = True
            end>
        end
        object pnl7: TPanel
          Left = 1
          Top = 292
          Width = 295
          Height = 31
          Align = alBottom
          TabOrder = 1
          object lbl9: TLabel
            Left = 16
            Top = 8
            Width = 39
            Height = 13
            Caption = #24037#21495#65306
          end
          object btn5: TSpeedButton
            Left = 184
            Top = 3
            Width = 23
            Height = 22
            Caption = #26597
            OnClick = btn5Click
          end
          object lbl10: TLabel
            Left = 216
            Top = 8
            Width = 7
            Height = 13
          end
          object edtDBGX: TEdit
            Left = 55
            Top = 5
            Width = 121
            Height = 21
            TabOrder = 0
          end
        end
      end
      object btnGetDBNameList: TButton
        Left = 304
        Top = 31
        Width = 25
        Height = 209
        Caption = #35835#21462#25968#25454#24211#21517#21333'<<'
        TabOrder = 1
        WordWrap = True
        OnClick = btnGetDBNameListClick
      end
      object pnl4: TPanel
        Left = 477
        Top = 0
        Width = 303
        Height = 324
        Align = alRight
        TabOrder = 2
        object lbl2: TLabel
          Left = 1
          Top = 1
          Width = 39
          Height = 13
          Align = alTop
          Caption = #32771#21220#26426
        end
        object pnl6: TPanel
          Left = 1
          Top = 292
          Width = 301
          Height = 31
          Align = alBottom
          TabOrder = 0
          object lbl8: TLabel
            Left = 16
            Top = 8
            Width = 39
            Height = 13
            Caption = #24037#21495#65306
          end
          object btn4: TSpeedButton
            Left = 180
            Top = 3
            Width = 23
            Height = 22
            Caption = #26597
            OnClick = btn4Click
          end
          object edtDevGX: TEdit
            Left = 52
            Top = 4
            Width = 121
            Height = 21
            TabOrder = 0
          end
        end
        object eh1: TDBGridEh
          Left = 1
          Top = 14
          Width = 301
          Height = 278
          Align = alClient
          DataSource = ds1
          FooterColor = clWindow
          FooterFont.Charset = ANSI_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -13
          FooterFont.Name = #23435#20307
          FooterFont.Style = []
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          OnTitleClick = eh1TitleClick
          Columns = <
            item
              EditButtons = <>
              FieldName = 'id'
              Footers = <>
              Title.Caption = #24037#21495
              Width = 50
            end
            item
              EditButtons = <>
              FieldName = 'name'
              Footers = <>
              Title.Caption = #22995#21517
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'Cardno'
              Footers = <>
              Title.Caption = #21345#21495
              Width = 120
            end>
        end
      end
      object btnGetDevNameList: TButton
        Left = 432
        Top = 32
        Width = 25
        Height = 209
        Caption = #35835#21462#32771#21220#26426#21517#21333'>>'
        TabOrder = 3
        WordWrap = True
        OnClick = btnGetDevNameListClick
      end
      object btnDBToDev: TButton
        Left = 345
        Top = 120
        Width = 75
        Height = 25
        Caption = #21516#27493
        TabOrder = 4
        OnClick = btnDBToDevClick
      end
    end
    object ts3: TTabSheet
      Caption = #26426#22120#37096#38376#35774#32622
      ImageIndex = 2
      object lbl6: TLabel
        Left = 8
        Top = 8
        Width = 52
        Height = 13
        Caption = #37096#38376#21015#34920
      end
      object lbl7: TLabel
        Left = 470
        Top = 9
        Width = 52
        Height = 13
        Caption = #26426#22120#21015#34920
      end
      object lvDepart: TListView
        Left = 8
        Top = 32
        Width = 250
        Height = 241
        Checkboxes = True
        Columns = <
          item
            Caption = #36873
            Width = 30
          end
          item
            Caption = #37096#38376#21517#23383
            Width = 180
          end>
        GridLines = True
        MultiSelect = True
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
      object cbx1: TCheckBox
        Left = 8
        Top = 280
        Width = 57
        Height = 17
        Caption = #20840#36873
        TabOrder = 1
        OnClick = cbx1Click
      end
      object lvDev: TListView
        Left = 472
        Top = 32
        Width = 250
        Height = 241
        Checkboxes = True
        Columns = <
          item
            Caption = #36873
            Width = 30
          end
          item
            Caption = 'ID'
            Width = 45
          end
          item
            Caption = #35774#22791'IP'
            Width = 110
          end>
        GridLines = True
        MultiSelect = True
        ReadOnly = True
        RowSelect = True
        TabOrder = 2
        ViewStyle = vsReport
      end
      object cbx2: TCheckBox
        Left = 472
        Top = 279
        Width = 57
        Height = 17
        Caption = #20840#36873
        TabOrder = 3
        OnClick = cbx2Click
      end
      object btn2: TButton
        Left = 288
        Top = 64
        Width = 169
        Height = 41
        Caption = #35774#32622#21040#32771#21220#26426'->'
        TabOrder = 4
        WordWrap = True
        OnClick = btn2Click
      end
      object btnAddToDev: TButton
        Left = 288
        Top = 136
        Width = 169
        Height = 25
        Caption = #28155#21152#21040#32771#21220#26426'>>'
        TabOrder = 5
        OnClick = btnAddToDevClick
      end
      object btn3: TButton
        Left = 288
        Top = 176
        Width = 169
        Height = 25
        Caption = #20174#32771#21220#26426#21024#38500'<<'
        TabOrder = 6
        Visible = False
      end
      object btnShowDevDepartment: TButton
        Left = 288
        Top = 224
        Width = 169
        Height = 25
        Caption = #26597#30475#32771#21220#26426#37096#38376
        TabOrder = 7
        OnClick = btnShowDevDepartmentClick
      end
    end
    object ts4: TTabSheet
      Caption = #24555#25463#19978#20256
      ImageIndex = 3
      object Panel1: TPanel
        Left = 464
        Top = 0
        Width = 316
        Height = 324
        Align = alRight
        TabOrder = 0
        object Label1: TLabel
          Left = 5
          Top = 7
          Width = 65
          Height = 13
          Caption = #35774#22791#21015#34920#65306
        end
        object lvMDev: TListView
          Left = 1
          Top = 30
          Width = 314
          Height = 273
          Align = alCustom
          Checkboxes = True
          Columns = <
            item
              Caption = #36873
              Width = 25
            end
            item
              Caption = 'ID'
            end
            item
              AutoSize = True
              Caption = #35774#22791'IP'
            end>
          GridLines = True
          MultiSelect = True
          ReadOnly = True
          RowSelect = True
          TabOrder = 0
          ViewStyle = vsReport
        end
        object chkAll: TCheckBox
          Left = 8
          Top = 304
          Width = 97
          Height = 17
          Caption = #20840#36873
          TabOrder = 1
          OnClick = chkAllClick
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 409
        Height = 324
        Align = alLeft
        TabOrder = 1
        object lbFilter: TLabel
          Left = 10
          Top = 10
          Width = 39
          Height = 13
          Alignment = taRightJustify
          Caption = #24037#21495#65306
        end
        object Label3: TLabel
          Left = 232
          Top = 11
          Width = 91
          Height = 13
          Caption = #24403#21069#35760#24405#26465#25968#65306
        end
        object lbCount: TLabel
          Left = 319
          Top = 12
          Width = 49
          Height = 13
          Caption = 'lbCount'
        end
        object edtEmployeeCode: TEdit
          Left = 54
          Top = 6
          Width = 103
          Height = 21
          TabOrder = 0
          OnKeyPress = edtEmployeeCodeKeyPress
        end
        object dbEmployee: TDBGridEh
          Left = 1
          Top = 32
          Width = 407
          Height = 291
          Align = alBottom
          DataSource = DM1.DataSource1
          FooterColor = clWindow
          FooterFont.Charset = ANSI_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -13
          FooterFont.Name = #23435#20307
          FooterFont.Style = []
          TabOrder = 1
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          OnTitleClick = dbEmployeeTitleClick
          Columns = <
            item
              EditButtons = <>
              FieldName = 'employeecode'
              Footers = <>
              Title.Color = clRed
              Width = 58
            end
            item
              EditButtons = <>
              FieldName = 'chinesename'
              Footers = <>
              Width = 66
            end
            item
              EditButtons = <>
              FieldName = 'departmentname'
              Footers = <>
              Width = 101
            end
            item
              EditButtons = <>
              FieldName = 'ondutytime'
              Footers = <>
              Width = 80
            end
            item
              EditButtons = <>
              FieldName = 'Cardno'
              Footers = <>
              Width = 81
            end>
        end
        object btnSearch: TBitBtn
          Left = 161
          Top = 4
          Width = 64
          Height = 25
          Caption = #31934#30830#26597#25214
          TabOrder = 2
          OnClick = btnSearchClick
        end
      end
      object btnUpLoad: TBitBtn
        Left = 420
        Top = 113
        Width = 33
        Height = 121
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = btnUpLoadClick
      end
    end
  end
  object stat1: TStatusBar
    Left = 0
    Top = 625
    Width = 788
    Height = 19
    Panels = <
      item
        Text = #26426#22120#21495#65306
        Width = 80
      end
      item
        Width = 50
      end
      item
        Text = #35760#24405#24635#25968#65306
        Width = 80
      end
      item
        Width = 70
      end
      item
        Text = #24050#37319#38598#65306
        Width = 50
      end
      item
        Width = 70
      end
      item
        Width = 50
      end>
  end
  object pm1: TPopupMenu
    Left = 176
    Top = 64
    object N1: TMenuItem
      Caption = #25195#25551#22312#32447#35774#22791
    end
  end
  object cds1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 464
    Top = 432
  end
  object ds1: TDataSource
    DataSet = cds1
    Left = 521
    Top = 433
  end
end
