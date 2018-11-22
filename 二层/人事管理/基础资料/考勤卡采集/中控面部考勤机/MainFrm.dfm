object frmMain: TfrmMain
  Left = 477
  Top = 191
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #38754#37096#32771#21220#37319#38598
  ClientHeight = 619
  ClientWidth = 850
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lvDev: TListView
    Left = 0
    Top = 0
    Width = 850
    Height = 241
    Align = alTop
    Checkboxes = True
    Columns = <
      item
        Caption = #36873
        Width = 30
      end
      item
        Caption = #35774#22791#21495
        Width = 80
      end
      item
        Caption = #35774#22791'IP'
        Width = 120
      end
      item
        Caption = #35774#22791#21517#31216
        Width = 120
      end
      item
        Caption = #35774#22791#26102#38388
        Width = 120
      end
      item
        Caption = #35774#22791#29366#24577
        Width = 120
      end>
    GridLines = True
    ReadOnly = True
    RowSelect = True
    PopupMenu = PopupMenu1
    TabOrder = 0
    ViewStyle = vsReport
  end
  object stat1: TStatusBar
    Left = 0
    Top = 591
    Width = 850
    Height = 28
    Panels = <
      item
        Text = #27880#20876#26426'IP'#65306
        Width = 65
      end
      item
        Width = 120
      end
      item
        Text = #27880#20876#26426#26426#22120#21495#65306
        Width = 90
      end
      item
        Width = 65
      end
      item
        Text = #36827#24230#65306
        Width = 50
      end
      item
        Width = 250
      end
      item
        Text = #33719#21462#25968#30446#65306
        Width = 65
      end
      item
        Width = 120
      end>
  end
  object pgc1: TPageControl
    Left = 0
    Top = 241
    Width = 850
    Height = 350
    ActivePage = ts3
    Align = alClient
    TabOrder = 1
    OnChange = pgc1Change
    object ts1: TTabSheet
      Caption = #37319#21345
      object btnSearch: TButton
        Left = 7
        Top = 6
        Width = 105
        Height = 25
        Caption = #36830#25509#25152#26377#35774#22791
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = btnSearchClick
      end
      object btnReaddata: TButton
        Left = 116
        Top = 6
        Width = 140
        Height = 25
        Caption = #37319#38598#36873#20013#35774#22791#32771#21220#35760#24405
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnReaddataClick
      end
      object tv1: TTreeView
        Left = 0
        Top = 72
        Width = 842
        Height = 250
        Align = alBottom
        Indent = 19
        TabOrder = 3
      end
      object pnl5: TPanel
        Left = 0
        Top = 40
        Width = 842
        Height = 32
        Align = alBottom
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 2
        object btnFileToDB: TSpeedButton
          Left = 730
          Top = 5
          Width = 70
          Height = 22
          Caption = #23548#20837
          OnClick = btnFileToDBClick
        end
        object lbl3: TLabel
          Left = 10
          Top = 10
          Width = 48
          Height = 13
          Caption = #25991#20214#21517#65306
        end
        object lbl4: TLabel
          Left = 2
          Top = 2
          Width = 3
          Height = 13
          Align = alLeft
        end
      end
    end
    object ts2: TTabSheet
      Caption = #20174#36873#20013#35774#22791#20013#21024#38500#31163#32844#20154#21592#20449#24687
      ImageIndex = 1
      object pnl1: TPanel
        Left = 0
        Top = 0
        Width = 842
        Height = 322
        Align = alClient
        TabOrder = 0
        object pnl2: TPanel
          Left = 1
          Top = 1
          Width = 840
          Height = 41
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object lbl1: TLabel
            Left = 4
            Top = 15
            Width = 63
            Height = 13
            Caption = #31163#32844#26085#26399#65306' '
          end
          object lbl2: TLabel
            Left = 169
            Top = 16
            Width = 12
            Height = 13
            Caption = #21040
          end
          object dtp1: TDateTimePicker
            Left = 74
            Top = 11
            Width = 91
            Height = 21
            Date = 41460.361826377320000000
            Time = 41460.361826377320000000
            TabOrder = 0
          end
          object dtp2: TDateTimePicker
            Left = 187
            Top = 12
            Width = 99
            Height = 21
            Date = 41460.361826377320000000
            Time = 41460.361826377320000000
            TabOrder = 1
          end
          object btnViewLZ: TButton
            Left = 290
            Top = 10
            Width = 111
            Height = 25
            Caption = #26597#30475#31163#32844#20154#21592
            TabOrder = 2
            OnClick = btnViewLZClick
          end
          object btnDeleLZ: TButton
            Left = 404
            Top = 10
            Width = 173
            Height = 25
            Caption = #23558#31163#32844#20154#21592#20174#36873#20013#32771#21220#26426#21024#38500
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            OnClick = btnDeleLZClick
          end
        end
        object grd1: TDBGrid
          Left = 1
          Top = 42
          Width = 840
          Height = 279
          Align = alClient
          DataSource = ds1
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'employeecode'
              Title.Caption = #24037#21495
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'chinesename'
              Title.Caption = #22995#21517
              Width = 112
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'outdutytime'
              Title.Caption = #31163#32844#26085#26399
              Width = 149
              Visible = True
            end>
        end
      end
    end
    object ts4: TTabSheet
      Caption = #26032#21592#24037#36164#26009#19978#20256#21040#27880#20876#26426
      ImageIndex = 3
      object grp2: TGroupBox
        Left = 0
        Top = 0
        Width = 842
        Height = 322
        Align = alClient
        Caption = 'ERP'#20154#21592#21517#21333#21015#34920
        TabOrder = 0
        object Label2: TLabel
          Left = 9
          Top = 20
          Width = 26
          Height = 13
          Caption = #37096#38376
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label13: TLabel
          Left = 140
          Top = 22
          Width = 42
          Height = 12
          Caption = 'Label13'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label17: TLabel
          Left = 645
          Top = 21
          Width = 12
          Height = 12
          Caption = #33267
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label18: TLabel
          Left = 485
          Top = 21
          Width = 60
          Height = 12
          Caption = #20837#32844#26085#26399#20174
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object edt2: TEdit
          Left = 41
          Top = 16
          Width = 96
          Height = 21
          TabOrder = 2
          OnChange = edt2Change
        end
        object dbgrideh2: TDBGridEh
          Left = 2
          Top = 45
          Width = 838
          Height = 275
          Align = alBottom
          DataSource = ds2
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          PopupMenu = PopupMenu2
          TabOrder = 6
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnTitleClick = dbgrideh2TitleClick
          Columns = <
            item
              EditButtons = <>
              FieldName = 'departmentname'
              Footers = <>
              Title.Caption = #37096#38376
              Width = 117
            end
            item
              EditButtons = <>
              FieldName = 'employeecode'
              Footers = <>
              Title.Caption = #24037#21495
              Width = 102
            end
            item
              EditButtons = <>
              FieldName = 'chinesename'
              Footers = <>
              Title.Caption = #22995#21517
              Width = 103
            end
            item
              EditButtons = <>
              FieldName = 'ondutytime'
              Footers = <>
              Title.Caption = #20837#32844#26085#26399
              Width = 142
            end
            item
              EditButtons = <>
              FieldName = 'faceflag'
              Footers = <>
              Title.Caption = #25968#25454#26631#35782
            end>
        end
        object btn1: TButton
          Left = 290
          Top = 13
          Width = 191
          Height = 25
          Caption = #23558#19979#21015#26174#31034#21517#21333#19979#36733#21040#27880#20876#26426'>>>'
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btn1Click
        end
        object btn18: TButton
          Left = 200
          Top = 14
          Width = 89
          Height = 25
          Caption = #21047#26032'ERP'#21517#21333
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btn18Click
        end
        object DateTimePicker1: TDateTimePicker
          Left = 553
          Top = 16
          Width = 89
          Height = 20
          Date = 41590.460285185190000000
          Time = 41590.460285185190000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnChange = DateTimePicker1Change
        end
        object DateTimePicker2: TDateTimePicker
          Left = 659
          Top = 16
          Width = 89
          Height = 20
          Date = 41590.460285185190000000
          Time = 41590.460285185190000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnChange = DateTimePicker1Change
        end
        object CheckBox2: TCheckBox
          Left = 750
          Top = 18
          Width = 97
          Height = 17
          Caption = #21253#28085#26377#25968#25454
          Checked = True
          State = cbChecked
          TabOrder = 5
          OnClick = CheckBox2Click
        end
      end
    end
    object ts5: TTabSheet
      Caption = #20174#27880#20876#26426#19979#36733#21040#26412#22320
      ImageIndex = 4
      object Label3: TLabel
        Left = 392
        Top = 40
        Width = 2
        Height = 312
        Caption = 
          '|'#13#10'|'#13#10'|'#13#10'|'#13#10'|'#13#10'|'#13#10'|'#13#10'|'#13#10'|'#13#10'|'#13#10'|'#13#10'|'#13#10'|'#13#10'|'#13#10'|'#13#10'|'#13#10'|'#13#10'|'#13#10'|'#13#10'|'#13#10'|'#13#10'|' +
          #13#10'|'#13#10'|'
      end
      object Label7: TLabel
        Left = 635
        Top = 301
        Width = 90
        Height = 12
        Caption = #24403#21069#26174#31034#25968#25454#20849':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 730
        Top = 301
        Width = 6
        Height = 12
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 400
        Top = 301
        Width = 24
        Height = 12
        Caption = #24037#21495
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 168
        Top = 280
        Width = 24
        Height = 12
        Caption = #24037#21495
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object dbgrideh4: TDBGridEh
        Left = 399
        Top = 48
        Width = 408
        Height = 241
        DataSource = ds4
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnTitleClick = dbgrideh4TitleClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'employeecode'
            Footers = <>
            Title.Caption = #24037#21495
            Width = 52
          end
          item
            EditButtons = <>
            FieldName = 'chinesename'
            Footers = <>
            Title.Caption = #22995#21517
            Width = 55
          end
          item
            EditButtons = <>
            FieldName = 'departmentname'
            Footers = <>
            Title.Caption = #37096#38376
            Width = 78
          end
          item
            EditButtons = <>
            FieldName = 'ondutytime'
            Footers = <>
            Title.Caption = #20837#32844#26085#26399
            Width = 82
          end
          item
            EditButtons = <>
            FieldName = 'faceTag'
            Footers = <>
            Title.Caption = #20154#33080
            Width = 40
          end
          item
            EditButtons = <>
            FieldName = 'fingerTag'
            Footers = <>
            Title.Caption = #25351#32441
            Width = 41
          end>
      end
      object pnl4: TPanel
        Left = 0
        Top = 0
        Width = 842
        Height = 41
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object Label1: TLabel
          Left = 392
          Top = 2
          Width = 2
          Height = 39
          Caption = '|'#13#10'|'#13#10'|'
        end
        object Label5: TLabel
          Left = 112
          Top = 17
          Width = 264
          Height = 12
          Caption = #26597#30475#26426#22120#21517#21333#36807#31243#27604#36739#32531#24930','#35831#24744#32784#24515#31561#24453#32467#26524'...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 527
          Top = 17
          Width = 240
          Height = 12
          Caption = #19979#36733#21517#21333#36807#31243#27604#36739#32531#24930','#35831#24744#32784#24515#31561#24453#32467#26524'...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object btn3: TButton
          Left = 401
          Top = 7
          Width = 120
          Height = 25
          Caption = #20174#27880#20876#26426#19979#36733#21040#26412#22320
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btn3Click
        end
        object btn5: TButton
          Left = 2
          Top = 8
          Width = 101
          Height = 25
          Caption = #26597#30475#27880#20876#26426#21517#21333' '
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btn5Click
        end
      end
      object lv3: TListView
        Left = 0
        Top = 40
        Width = 385
        Height = 229
        Checkboxes = True
        Columns = <
          item
            Caption = #24037#21495
            Width = 65
          end
          item
            Caption = #22995#21517
            Width = 80
          end
          item
            Caption = #20154#33080
          end
          item
            Caption = #25351#32441
          end>
        GridLines = True
        MultiSelect = True
        ReadOnly = True
        RowSelect = True
        TabOrder = 1
        ViewStyle = vsReport
        OnColumnClick = lv1ColumnClick
        OnCompare = lv1Compare
        OnCustomDrawItem = lv3CustomDrawItem
      end
      object btn6: TButton
        Left = 0
        Top = 296
        Width = 153
        Height = 25
        Caption = #21024#38500#27880#20876#26426#25152#36873#20154#21592#20449#24687
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        OnClick = btn6Click
      end
      object btn12: TButton
        Left = 0
        Top = 273
        Width = 75
        Height = 20
        Caption = #20840#36873
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = btn12Click
      end
      object btn13: TButton
        Left = 86
        Top = 273
        Width = 75
        Height = 20
        Caption = #20840#21462#28040
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = btn13Click
      end
      object btn10: TButton
        Left = 530
        Top = 294
        Width = 89
        Height = 25
        Caption = #26597#30475#25152#26377#21517#21333
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnClick = btn10Click
      end
      object edt3: TEdit
        Left = 440
        Top = 296
        Width = 89
        Height = 21
        TabOrder = 9
        OnChange = edt3Change
      end
      object edt4: TEdit
        Left = 202
        Top = 273
        Width = 87
        Height = 21
        TabOrder = 5
      end
      object btn14: TButton
        Left = 295
        Top = 274
        Width = 45
        Height = 20
        Caption = #26597#30475
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnClick = btn14Click
      end
    end
    object ts3: TTabSheet
      Caption = #20174#26412#22320#21516#27493#21040#30446#26631#32771#21220#26426
      ImageIndex = 2
      object pnl6: TPanel
        Left = 0
        Top = 0
        Width = 842
        Height = 322
        Align = alClient
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object Label4: TLabel
          Left = 118
          Top = 17
          Width = 24
          Height = 12
          Caption = #37096#38376
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 229
          Top = 19
          Width = 6
          Height = 12
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 434
          Top = 16
          Width = 6
          Height = 12
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label23: TLabel
          Left = 616
          Top = 16
          Width = 6
          Height = 12
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object btnViewDevUser: TButton
          Left = 498
          Top = 8
          Width = 115
          Height = 25
          Caption = '3.'#26597#30475#24453#28155#21152#21517#21333
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 3
          OnClick = btnViewDevUserClick
        end
        object dbgrideh3: TDBGridEh
          Left = 2
          Top = 34
          Width = 271
          Height = 281
          DataSource = ds3
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          PopupMenu = pm1
          ReadOnly = True
          TabOrder = 8
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnTitleClick = dbgrideh3TitleClick
          Columns = <
            item
              EditButtons = <>
              FieldName = 'employeecode'
              Footers = <>
              Title.Caption = #24037#21495
              Width = 44
            end
            item
              EditButtons = <>
              FieldName = 'chinesename'
              Footers = <>
              Title.Caption = #22995#21517
              Width = 43
            end
            item
              EditButtons = <>
              FieldName = 'departmentname'
              Footers = <>
              Title.Caption = #37096#38376
              Width = 70
            end
            item
              EditButtons = <>
              FieldName = 'ondutytime'
              Footers = <>
              Title.Caption = #20837#32844#26085#26399
              Width = 75
            end>
        end
        object lvUser: TListView
          Left = 480
          Top = 33
          Width = 177
          Height = 256
          Columns = <
            item
              Caption = #24037#21495
              Width = 80
            end
            item
              Caption = #22995#21517
              Width = 55
            end>
          GridLines = True
          ReadOnly = True
          TabOrder = 6
          ViewStyle = vsReport
          OnColumnClick = lv1ColumnClick
          OnCompare = lv1Compare
        end
        object edt1: TEdit
          Left = 143
          Top = 10
          Width = 81
          Height = 21
          TabOrder = 5
          OnChange = edt1Change
        end
        object lv1: TListView
          Left = 277
          Top = 34
          Width = 196
          Height = 255
          Columns = <
            item
              Caption = #24037#21495
              Width = 55
            end
            item
              Caption = #22995#21517
              Width = 55
            end
            item
              Caption = #20154#33080
              Width = 40
            end
            item
              Caption = #25351#32441
              Width = 40
            end>
          GridLines = True
          MultiSelect = True
          ReadOnly = True
          RowSelect = True
          TabOrder = 9
          ViewStyle = vsReport
          OnColumnClick = lv1ColumnClick
          OnCompare = lv1Compare
        end
        object btn8: TButton
          Left = 355
          Top = 8
          Width = 75
          Height = 25
          Caption = '2.'#31934#30830#26597#25214' '
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 2
          OnClick = btn8Click
        end
        object btn9: TButton
          Left = 4
          Top = 7
          Width = 109
          Height = 25
          Caption = '1.'#26597#30475#38236#20687#21517#21333
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 0
          OnClick = btn9Click
        end
        object btn2: TButton
          Left = 664
          Top = 8
          Width = 115
          Height = 25
          Caption = '5.'#26597#30475#24453#31227#38500#21517#21333
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 4
          OnClick = btn2Click
        end
        object lv2: TListView
          Left = 664
          Top = 33
          Width = 169
          Height = 256
          Checkboxes = True
          Columns = <
            item
              Caption = #24037#21495
              Width = 80
            end
            item
              Caption = #22995#21517
              Width = 55
            end>
          GridLines = True
          ReadOnly = True
          TabOrder = 7
          ViewStyle = vsReport
          OnColumnClick = lv1ColumnClick
          OnCompare = lv1Compare
        end
        object btn7: TButton
          Left = 665
          Top = 291
          Width = 118
          Height = 25
          Caption = '6.'#21024#38500#24453#31227#38500#21517#21333'>>>'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 12
          OnClick = btn7Click
        end
        object btn15: TButton
          Left = 278
          Top = 8
          Width = 75
          Height = 25
          Caption = '2.'#24555#36895#26597#25214
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 1
          OnClick = btn15Click
        end
        object btn19: TBitBtn
          Left = 784
          Top = 291
          Width = 52
          Height = 25
          Caption = #23548#20986
          TabOrder = 13
          OnClick = btn19Click
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            04000000000080000000120B0000120B00001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DADADADADADA
            DADAADADADADADADADADDADADADADAD00000000000000006666007777777706E
            EF0AA0E6666606EEF0ADDA0E66606EEF060AADA0E606EEF0000DDADA006EEF0A
            DADAADAD06EEF00DADADDAD06EEF0670DADAAD06EEF0E6670DADD06EEF0A0E66
            70DA0FFFF0ADA0EEEE0D00000ADADA00000AADADADADADADADAD}
        end
        object btn20: TBitBtn
          Left = 603
          Top = 291
          Width = 53
          Height = 25
          Caption = #23548#20986
          TabOrder = 11
          OnClick = btn20Click
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            04000000000080000000120B0000120B00001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DADADADADADA
            DADAADADADADADADADADDADADADADAD00000000000000006666007777777706E
            EF0AA0E6666606EEF0ADDA0E66606EEF060AADA0E606EEF0000DDADA006EEF0A
            DADAADAD06EEF00DADADDAD06EEF0670DADAAD06EEF0E6670DADD06EEF0A0E66
            70DA0FFFF0ADA0EEEE0D00000ADADA00000AADADADADADADADAD}
        end
        object btn21: TBitBtn
          Left = 406
          Top = 291
          Width = 66
          Height = 25
          Caption = #23548#20986
          TabOrder = 10
          OnClick = btn21Click
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            04000000000080000000120B0000120B00001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DADADADADADA
            DADAADADADADADADADADDADADADADAD00000000000000006666007777777706E
            EF0AA0E6666606EEF0ADDA0E66606EEF060AADA0E606EEF0000DDADA006EEF0A
            DADAADAD06EEF00DADADDAD06EEF0670DADAAD06EEF0E6670DADD06EEF0A0E66
            70DA0FFFF0ADA0EEEE0D00000ADADA00000AADADADADADADADAD}
        end
      end
      object btn4: TButton
        Left = 482
        Top = 292
        Width = 121
        Height = 25
        Caption = '4.'#28155#21152#24453#28155#21152#21517#21333'>>>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = [fsUnderline]
        ParentFont = False
        TabOrder = 1
        OnClick = btn4Click
      end
    end
    object ts6: TTabSheet
      Caption = #24555#25463#19978#20256
      ImageIndex = 5
      object Label14: TLabel
        Left = 8
        Top = 12
        Width = 24
        Height = 12
        Caption = #24037#21495
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 235
        Top = 303
        Width = 90
        Height = 12
        Caption = #24403#21069#26174#31034#25968#25454#20849':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 338
        Top = 293
        Width = 6
        Height = 12
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label19: TLabel
        Left = 331
        Top = 303
        Width = 42
        Height = 12
        Caption = 'Label19'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Image1: TImage
        Left = 370
        Top = 4
        Width = 31
        Height = 27
        Picture.Data = {
          055449636F6E0000010001002020040000000000E80200001600000028000000
          2000000040000000010004000000000000020000000000000000000000000000
          0000000000000000000080000080000000808000800000008000800080800000
          80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
          FFFFFF00000000000000000000000000000000000000000000000040B3000000
          0000000000000000000044444B3000700000000000000000004444444B300777
          70000000000000004444444444B3077777700000000000444444444444B30777
          7777700000004444444444424440007777700000000844444444444244481077
          70000000000704444444442A2444810000000000000074444444746A24448100
          00000000000084444447746AA6444810000000000000704444774AAAAA644810
          000000000000074447774AAAAA6474400000000000000844477426A46CC77444
          0000000000000707774667477777777440000000000000777466777777777774
          400000000000008774A7777777777774440000000000007046AAAA7777777774
          44000000000000074AAAAA7777777774444000000000000844AAAAA777777754
          4440000000000007042A677777777754444700000000000074C2277777777754
          4770000000000000877777777777775770000000000000007077777777777770
          0000000000000000077777777777700000000000000000000877777777700000
          0000000000000000070777777000000000000000000000000077777000000000
          0000000000000000008770000000000000000000000000000070000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000FFFC1FFFFFF007FFFFC001FFFF00007FFC00001FF0000007E000001F
          C000007FC00001FFE00001FFE00000FFE00000FFF000007FF000007FF000003F
          F800003FF800001FF800001FFC00000FFC00000FFC000007FE000007FE00001F
          FE00007FFF0001FFFF0007FFFF001FFFFF807FFFFF81FFFFFF87FFFFFFDFFFFF
          FFFFFFFF}
      end
      object Label21: TLabel
        Left = 236
        Top = 15
        Width = 120
        Height = 12
        Caption = #21047#26032#21518#25353#37096#38376#26435#38480#36807#28388
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object dbgrideh5: TDBGridEh
        Left = 0
        Top = 32
        Width = 401
        Height = 262
        DataSource = ds5
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
        OnTitleClick = dbgrideh5TitleClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'employeecode'
            Footers = <>
            Title.Caption = #24037#21495
            Width = 52
          end
          item
            EditButtons = <>
            FieldName = 'chinesename'
            Footers = <>
            Title.Caption = #22995#21517
            Width = 55
          end
          item
            EditButtons = <>
            FieldName = 'departmentname'
            Footers = <>
            Title.Caption = #37096#38376
            Width = 78
          end
          item
            EditButtons = <>
            FieldName = 'ondutytime'
            Footers = <>
            Title.Caption = #20837#32844#26085#26399
            Width = 82
          end
          item
            EditButtons = <>
            FieldName = 'faceTag'
            Footers = <>
            Title.Caption = #20154#33080
            Width = 40
          end
          item
            EditButtons = <>
            FieldName = 'fingerTag'
            Footers = <>
            Title.Caption = #25351#32441
            Width = 41
          end>
      end
      object btn16: TButton
        Left = 415
        Top = 101
        Width = 27
        Height = 123
        Caption = #24320'  '#22987'  '#19978'  '#20256
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        WordWrap = True
        OnClick = btn16Click
      end
      object edt5: TEdit
        Left = 35
        Top = 7
        Width = 102
        Height = 21
        TabOrder = 2
        OnChange = edt5Change
      end
      object btn17: TButton
        Left = -3
        Top = 299
        Width = 84
        Height = 20
        Caption = #21047#26032#21517#21333
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = btn17Click
      end
      object GroupBox1: TGroupBox
        Left = 462
        Top = 0
        Width = 380
        Height = 322
        Align = alRight
        Caption = #24403#21069#25152#26377#35774#22791#27010#35272
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        object lv4: TListView
          Left = 2
          Top = 14
          Width = 376
          Height = 306
          Align = alClient
          Checkboxes = True
          Columns = <
            item
              Caption = #36873
              Width = 30
            end
            item
              Caption = #35774#22791#21495
              Width = 60
            end
            item
              Caption = #35774#22791'IP'
              Width = 100
            end
            item
              Caption = #35774#22791#21517#31216
              Width = 150
            end>
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          GridLines = True
          ReadOnly = True
          RowSelect = True
          ParentFont = False
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
      object Button6: TButton
        Left = 142
        Top = 5
        Width = 76
        Height = 24
        Caption = #31934#30830#26597#25214
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnClick = Button6Click
      end
    end
    object TabSheet1: TTabSheet
      Caption = #24555#25463#21024#38500
      ImageIndex = 6
      object Label20: TLabel
        Left = 754
        Top = 12
        Width = 6
        Height = 12
        Caption = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 370
        Height = 322
        Align = alLeft
        Caption = #24403#21069#25152#26377#35774#22791#27010#35272
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object ListView1: TListView
          Left = 2
          Top = 14
          Width = 366
          Height = 306
          Align = alClient
          Checkboxes = True
          Columns = <
            item
              Caption = #36873
              Width = 30
            end
            item
              Caption = #35774#22791#21495
              Width = 60
            end
            item
              Caption = #35774#22791'IP'
              Width = 100
            end
            item
              Caption = #35774#22791#21517#31216
              Width = 150
            end>
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          GridLines = True
          ReadOnly = True
          RowSelect = True
          ParentFont = False
          TabOrder = 0
          ViewStyle = vsReport
          OnColumnClick = lv1ColumnClick
          OnCompare = lv1Compare
        end
      end
      object ListView2: TListView
        Left = 400
        Top = 30
        Width = 418
        Height = 289
        Checkboxes = True
        Columns = <
          item
            Caption = #24037#21495
            Width = 90
          end
          item
            Caption = #22995#21517
            Width = 90
          end
          item
            Caption = #37096#38376
            Width = 100
          end
          item
            Caption = #20837#32844#26085#26399
            Width = 120
          end>
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        GridLines = True
        ReadOnly = True
        RowSelect = True
        ParentFont = False
        TabOrder = 5
        ViewStyle = vsReport
        OnColumnClick = lv1ColumnClick
        OnCompare = lv1Compare
      end
      object Button1: TButton
        Left = 553
        Top = 3
        Width = 95
        Height = 25
        Caption = #35835#21462#35774#22791#21517#21333
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 654
        Top = 3
        Width = 95
        Height = 25
        Caption = #21024#38500#36873#20013#21517#21333
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = Button2Click
      end
      object CheckBox1: TCheckBox
        Left = 392
        Top = 8
        Width = 49
        Height = 17
        Caption = #20840#36873
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = CheckBox1Click
      end
      object Button3: TButton
        Left = 442
        Top = 3
        Width = 105
        Height = 25
        Caption = #24555#36895#35835#21462#35774#22791#21517#21333
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = Button3Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = #20854#23427#25805#20316
      ImageIndex = 7
      object lblDevTime: TLabel
        Left = 173
        Top = 79
        Width = 84
        Height = 12
        Caption = #35774#22791#24403#21069#26102#38388#65306
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lblLocalTime: TLabel
        Left = 264
        Top = 119
        Width = 84
        Height = 12
        Caption = #26412#26426#24403#21069#26102#38388#65306
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Button4: TButton
        Left = 136
        Top = 158
        Width = 100
        Height = 25
        Caption = #37325#21551#36873#20013#26426#22120
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = Button4Click
      end
      object Button5: TButton
        Left = 24
        Top = 158
        Width = 100
        Height = 25
        Caption = #20851#38381#36873#20013#26426#22120
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = Button5Click
      end
      object Button7: TButton
        Left = 248
        Top = 158
        Width = 100
        Height = 25
        Caption = #20851#38381#27880#20876#26426
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = Button7Click
      end
      object Button8: TButton
        Left = 360
        Top = 158
        Width = 100
        Height = 25
        Caption = #37325#21551#27880#20876#26426
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = Button8Click
      end
      object Button9: TButton
        Left = 24
        Top = 112
        Width = 229
        Height = 25
        Caption = #23558#36873#20013#26426#22120#26102#38388#21516#27493#20026#26412#26426#24403#21069#26102#38388
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 4
        WordWrap = True
        OnClick = Button9Click
      end
      object Button10: TButton
        Left = 24
        Top = 72
        Width = 145
        Height = 25
        Caption = #35835#21462#36873#20013#35774#22791#24403#21069#26102#38388
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnClick = Button10Click
      end
      object btn11: TButton
        Left = 24
        Top = 30
        Width = 140
        Height = 25
        Caption = #27979#35797#36873#20013#35774#22791#36830#25509#29366#20917
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnClick = btn11Click
      end
    end
  end
  object pb5: TProgressBar
    Left = 392
    Top = 594
    Width = 249
    Height = 22
    TabOrder = 3
  end
  object sp1: TADOStoredProc
    Connection = con1
    ProcedureName = 'hrsp_card_analysis;1'
    Parameters = <>
    Prepared = True
    Left = 36
    Top = 57
  end
  object adslz: TADODataSet
    Connection = con1
    CommandText = 
      'select employeecode, chinesename,outdutytime'#13#10'from employeemsg '#13 +
      #10'where status=2'#13#10'and outdutytime between  :dtp1 and  :dtp2'#13#10
    Parameters = <
      item
        Name = 'dtp1'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'dtp2'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    Left = 4
    Top = 57
    object adslzemployeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object adslzchinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object adslzoutdutytime: TDateTimeField
      FieldName = 'outdutytime'
      DisplayFormat = 'yyyy-MM-dd'
    end
  end
  object ds1: TDataSource
    DataSet = adslz
    Left = 67
    Top = 89
  end
  object qrytmp: TADOQuery
    Connection = con1
    Parameters = <>
    SQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 99
    Top = 25
  end
  object ds2: TDataSource
    DataSet = qry2
    Left = 99
    Top = 89
  end
  object qry2: TADOQuery
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'declare @isSelect bit'
      
        'select @isSelect as isSelect, employeecode,chinesename,departmen' +
        'tname,ondutytime,'
      
        'isnull((select  ( case when face_data is not null then 1 else 0 ' +
        'end)  from employee_facedata where employeeid=v_employeemsg.rkey' +
        '),0)'
      'as faceflag'
      'from v_employeemsg where (status=0 or status=1)   ')
    Left = 67
    Top = 25
    object qry2isSelect: TBooleanField
      DisplayLabel = #36873#25321
      FieldName = 'isSelect'
    end
    object wdstrngfldqry2employeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object wdstrngfldqry2chinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object wdstrngfldqry2departmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object qry2ondutytime: TDateTimeField
      FieldName = 'ondutytime'
    end
    object qry2faceflag: TIntegerField
      FieldName = 'faceflag'
      ReadOnly = True
    end
  end
  object ds3: TDataSource
    DataSet = qry3
    Left = 4
    Top = 89
  end
  object qry3: TADOQuery
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select departmentname,employeecode,chinesename, ondutytime, '
      'case when face_length > 0 then '#39#26377#39' '
      'else '#39#26080#39' end faceTag,'
      'case when finger_1_length > 0 then '#39#26377#39' '
      'else '#39#26080#39' end fingerTag'
      
        'from v_employeemsg a join employee_facedata b on a.rkey=b.employ' +
        'eeid '
      'where (status=1 or status=0)')
    Left = 36
    Top = 25
    object wdstrngfldqry3departmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object wdstrngfldqry3employeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object wdstrngfldqry3chinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object qry3ondutytime: TDateTimeField
      FieldName = 'ondutytime'
    end
    object qry3faceTag: TStringField
      FieldName = 'faceTag'
      ReadOnly = True
      Size = 2
    end
    object qry3fingerTag: TStringField
      FieldName = 'fingerTag'
      ReadOnly = True
      Size = 2
    end
  end
  object con1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 4
    Top = 25
  end
  object qry4: TADOQuery
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select departmentname,employeecode,chinesename, ondutytime, '
      'case when face_length > 0 then '#39#26377#39' '
      'else '#39#26080#39' end faceTag,'
      'case when finger_1_length > 0 then '#39#26377#39' '
      'else '#39#26080#39' end fingerTag'
      
        'from v_employeemsg a join employee_facedata b on a.rkey=b.employ' +
        'eeid '
      'where (status=1 or status=0)')
    Left = 99
    Top = 57
    object wdstrngfld1: TWideStringField
      FieldName = 'departmentname'
    end
    object wdstrngfld2: TWideStringField
      FieldName = 'employeecode'
    end
    object wdstrngfld3: TWideStringField
      FieldName = 'chinesename'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'ondutytime'
    end
    object StringField1: TStringField
      FieldName = 'faceTag'
      ReadOnly = True
      Size = 2
    end
    object StringField2: TStringField
      FieldName = 'fingerTag'
      ReadOnly = True
      Size = 2
    end
  end
  object ds4: TDataSource
    DataSet = qry4
    Left = 36
    Top = 89
  end
  object pm1: TPopupMenu
    Left = 36
    Top = 120
    object N1: TMenuItem
      Caption = #22797#21046#21040#24453#28155#21152#21517#21333
      OnClick = N1Click
    end
  end
  object qry5: TADOQuery
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select departmentname,employeecode,chinesename, ondutytime, '
      'case when face_length > 0 then '#39#26377#39' '
      'else '#39#26080#39' end faceTag,'
      'case when finger_1_length > 0 then '#39#26377#39' '
      'else '#39#26080#39' end fingerTag'
      
        'from v_employeemsg a join employee_facedata b on a.rkey=b.employ' +
        'eeid '
      'where (status=1  or status=0)')
    Left = 67
    Top = 57
    object wdstrngfldqry5departmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object wdstrngfldqry5employeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object wdstrngfldqry5chinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object qry5ondutytime: TDateTimeField
      FieldName = 'ondutytime'
    end
    object qry5faceTag: TStringField
      FieldName = 'faceTag'
      ReadOnly = True
      Size = 2
    end
    object qry5fingerTag: TStringField
      FieldName = 'fingerTag'
      ReadOnly = True
      Size = 2
    end
  end
  object ds5: TDataSource
    DataSet = qry5
    Left = 4
    Top = 120
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 67
    Top = 120
  end
  object PopupMenu1: TPopupMenu
    Left = 763
    Top = 33
    object N3: TMenuItem
      Caption = '-'
    end
    object N2: TMenuItem
      Caption = #35774#32622#20026#27880#20876#26426
      OnClick = N2Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N5: TMenuItem
      Caption = #21462#28040#27880#20876#26426#26631#35782
      OnClick = N5Click
    end
  end
  object qry_set_reg: TADOQuery
    Connection = con1
    Parameters = <
      item
        Name = 'dev_ip1'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'dev_ip2'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'dev_ip3'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'dev_ip4'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'update dev_detail'
      'set purpose='#39'facekq_reg'#39','
      'position=position+'#39'('#27880#20876#26426')'#39
      'from dev_detail'
      'where dev_ip=:dev_ip1'
      ''
      'update dev_detail'
      'set purpose='#39'facekq'#39','
      'position=replace(position,'#39'('#27880#20876#26426')'#39','#39#39')'
      'from dev_detail'
      'where dev_ip<>:dev_ip2'
      
        'and substring(dev_ip,1,charindex('#39'.'#39',dev_ip,8)-1)=substring(:dev' +
        '_ip3,1,charindex('#39'.'#39',:dev_ip4,8)-1)'
      'and purpose like '#39'facekq%'#39)
    Left = 767
    Top = 100
  end
  object qry_cancel_reg: TADOQuery
    Connection = con1
    Parameters = <
      item
        Name = 'dev_ip1'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'update dev_detail'
      'set purpose='#39'facekq'#39','
      'position=replace(position,'#39'('#27880#20876#26426')'#39','#39#39')'
      'from dev_detail'
      'where dev_ip=:dev_ip1')
    Left = 765
    Top = 161
  end
  object PopupMenu2: TPopupMenu
    Left = 223
    Top = 378
    object N6: TMenuItem
      Caption = #23548#20986
      OnClick = N6Click
    end
  end
  object qry_createtable: TADOQuery
    Connection = con1
    Parameters = <>
    SQL.Strings = (
      ''
      'if object_id('#39'tempdb..#lvdbgrideh'#39')is not null'
      'drop table #lvdbgrideh'
      
        'create table #lvdbgrideh(employeecode nvarchar(20),chinesename n' +
        'varchar(20))'
      ''
      'if object_id('#39'tempdb..#lv1'#39')is not null'
      'drop table #lv1'
      
        'create table #lv1(employeecode nvarchar(20),chinesename nvarchar' +
        '(20),faceflag nvarchar(20),fingerflag nvarchar(20))'
      ''
      'if object_id('#39'tempdb..#lvuser'#39')is not null'
      'drop table #lvuser'
      
        'create table #lvuser(employeecode nvarchar(20),chinesename nvarc' +
        'har(20))'
      ''
      'if object_id('#39'tempdb..#lv2'#39')is not null'
      'drop table #lv2'
      
        'create table #lv2(employeecode nvarchar(20),chinesename nvarchar' +
        '(20))')
    Left = 448
    Top = 208
  end
  object qry_droptable: TADOQuery
    Connection = con1
    Parameters = <>
    SQL.Strings = (
      ''
      'if object_id('#39'tempdb..#lvdbgrideh'#39')is not null'
      'drop table #lvdbgrideh'
      ''
      ''
      'if object_id('#39'tempdb..#lv1'#39')is not null'
      'drop table #lv1'
      ''
      'if object_id('#39'tempdb..#lvuser'#39')is not null'
      'drop table #lvuser'
      ''
      ''
      'if object_id('#39'tempdb..#lv2'#39')is not null'
      'drop table #lv2'
      '')
    Left = 488
    Top = 208
  end
end
