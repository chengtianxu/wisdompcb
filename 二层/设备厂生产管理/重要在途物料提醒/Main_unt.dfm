object Form1: TForm1
  Left = 287
  Top = 189
  Width = 864
  Height = 563
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object RzToolbar1: TRzToolbar
    Left = 0
    Top = 0
    Width = 856
    Height = 70
    AutoStyle = False
    Images = Images
    RowHeight = 37
    ButtonWidth = 39
    ButtonHeight = 37
    TextOptions = ttoCustom
    AutoSize = True
    BorderInner = fsNone
    BorderOuter = fsNone
    BorderSides = [sdTop]
    BorderWidth = 0
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ToolbarControls = (
      tblAdd
      tblEdit
      tblSave
      tblCancel
      tblDelete
      RzSpacer1
      tblRefresh
      tblfind
      tblExport
      tblFilter
      tblCancelFilter
      tblPrint
      tblDesign
      RzSpacer2
      tblFirst
      tblPrior
      tblNext
      tblLast
      RzSpacer3
      Panel4)
    object tblAdd: TRzToolButton
      Left = 4
      Top = 0
      ImageIndex = 0
      Images = Images
      Layout = blGlyphTop
      ShowCaption = True
      UseToolbarButtonLayout = False
      UseToolbarShowCaption = False
      Caption = #26032#22686
      Visible = False
    end
    object tblEdit: TRzToolButton
      Left = 43
      Top = 0
      ImageIndex = 2
      Images = Images
      Layout = blGlyphTop
      ShowCaption = True
      UseToolbarButtonLayout = False
      UseToolbarShowCaption = False
      Caption = #32534#36753
      Visible = False
    end
    object tblSave: TRzToolButton
      Left = 82
      Top = 0
      ImageIndex = 4
      Images = Images
      Layout = blGlyphTop
      ShowCaption = True
      UseToolbarButtonLayout = False
      UseToolbarShowCaption = False
      Caption = #20445#23384
      Visible = False
    end
    object tblCancel: TRzToolButton
      Left = 121
      Top = 0
      ImageIndex = 6
      Images = Images
      Layout = blGlyphTop
      ShowCaption = True
      UseToolbarButtonLayout = False
      UseToolbarShowCaption = False
      Caption = #21462#28040
      Visible = False
    end
    object tblDelete: TRzToolButton
      Left = 160
      Top = 0
      ImageIndex = 8
      Images = Images
      Layout = blGlyphTop
      ShowCaption = True
      UseToolbarButtonLayout = False
      UseToolbarShowCaption = False
      Caption = #21024#38500
      Visible = False
    end
    object RzSpacer1: TRzSpacer
      Left = 199
      Top = 6
    end
    object tblRefresh: TRzToolButton
      Left = 207
      Top = 0
      ImageIndex = 10
      Images = Images
      Layout = blGlyphTop
      ShowCaption = True
      UseToolbarButtonLayout = False
      UseToolbarShowCaption = False
      Caption = #21047#26032
      OnClick = tblRefreshClick
    end
    object tblfind: TRzToolButton
      Left = 246
      Top = 0
      ImageIndex = 12
      Images = Images
      Layout = blGlyphTop
      ShowCaption = True
      UseToolbarButtonLayout = False
      UseToolbarShowCaption = False
      Caption = #26597#25214
      OnClick = tblfindClick
    end
    object tblExport: TRzToolButton
      Left = 285
      Top = 0
      ImageIndex = 14
      Images = Images
      Layout = blGlyphTop
      ShowCaption = True
      UseToolbarButtonLayout = False
      UseToolbarShowCaption = False
      Caption = #23548#20986
      OnClick = tblExportClick
    end
    object tblFilter: TRzToolButton
      Left = 324
      Top = 0
      ImageIndex = 16
      Images = Images
      Layout = blGlyphTop
      ShowCaption = True
      UseToolbarButtonLayout = False
      UseToolbarShowCaption = False
      Caption = #36807#28388
      Visible = False
    end
    object tblCancelFilter: TRzToolButton
      Left = 363
      Top = 0
      Width = 56
      Height = 37
      ImageIndex = 18
      Images = Images
      Layout = blGlyphTop
      ShowCaption = True
      UseToolbarButtonLayout = False
      UseToolbarShowCaption = False
      Caption = #21462#28040#36807#28388
      Visible = False
    end
    object tblPrint: TRzToolButton
      Left = 419
      Top = 0
      ImageIndex = 20
      Images = Images
      Layout = blGlyphTop
      ShowCaption = True
      UseToolbarButtonLayout = False
      UseToolbarShowCaption = False
      Caption = #25171#21360
      Visible = False
    end
    object tblDesign: TRzToolButton
      Left = 458
      Top = 0
      Width = 56
      Height = 37
      ImageIndex = 22
      Images = Images
      Layout = blGlyphTop
      ShowCaption = True
      UseToolbarButtonLayout = False
      UseToolbarShowCaption = False
      Caption = #25253#34920#35774#35745
      Visible = False
    end
    object RzSpacer2: TRzSpacer
      Left = 514
      Top = 6
    end
    object tblFirst: TRzToolButton
      Left = 522
      Top = 0
      ImageIndex = 24
      Images = Images
      Layout = blGlyphTop
      ShowCaption = True
      UseToolbarButtonLayout = False
      UseToolbarShowCaption = False
      Caption = #39318#31508
      OnClick = tblFirstClick
    end
    object tblPrior: TRzToolButton
      Left = 561
      Top = 0
      ImageIndex = 26
      Images = Images
      Layout = blGlyphTop
      ShowCaption = True
      UseToolbarButtonLayout = False
      UseToolbarShowCaption = False
      Caption = #21521#21069
      OnClick = tblPriorClick
    end
    object tblNext: TRzToolButton
      Left = 600
      Top = 0
      ImageIndex = 28
      Images = Images
      Layout = blGlyphTop
      ShowCaption = True
      UseToolbarButtonLayout = False
      UseToolbarShowCaption = False
      Caption = #21521#21518
      OnClick = tblNextClick
    end
    object tblLast: TRzToolButton
      Left = 639
      Top = 0
      ImageIndex = 30
      Images = Images
      Layout = blGlyphTop
      ShowCaption = True
      UseToolbarButtonLayout = False
      UseToolbarShowCaption = False
      Caption = #26411#31508
      OnClick = tblLastClick
    end
    object RzSpacer3: TRzSpacer
      Left = 678
      Top = 6
    end
    object Panel4: TPanel
      Left = 4
      Top = 40
      Width = 392
      Height = 30
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object Label3: TLabel
        Left = 200
        Top = 8
        Width = 48
        Height = 12
        Caption = #23383#20307#23610#23544
      end
      object CheckBox2: TCheckBox
        Left = 104
        Top = 6
        Width = 81
        Height = 17
        Caption = #33258#21160#21047#26032
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = CheckBox2Click
      end
      object RzSpinEdit1: TRzSpinEdit
        Left = 271
        Top = 4
        Width = 40
        Height = 20
        Max = 25.000000000000000000
        Min = 9.000000000000000000
        Value = 9.000000000000000000
        TabOrder = 1
        OnChange = RzSpinEdit1Change
      end
      object CheckBox1: TCheckBox
        Left = 8
        Top = 6
        Width = 89
        Height = 17
        Caption = #33258#21160#28378#21160
        TabOrder = 2
        OnClick = CheckBox1Click
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 510
    Width = 856
    Height = 19
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    Panels = <
      item
        Width = 180
      end
      item
        Width = 220
      end
      item
        Width = 240
      end
      item
        Width = 50
      end>
    ParentColor = True
    UseSystemFont = False
  end
  object Panel_right: TPanel
    Left = 850
    Top = 70
    Width = 6
    Height = 440
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 2
  end
  object Panel_Left: TPanel
    Left = 0
    Top = 70
    Width = 6
    Height = 440
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 3
  end
  object Panel_Main: TPanel
    Left = 6
    Top = 70
    Width = 844
    Height = 440
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel3'
    TabOrder = 4
    object Panel5: TPanel
      Left = 0
      Top = 8
      Width = 844
      Height = 402
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel5'
      TabOrder = 0
      object Panel7: TPanel
        Left = 844
        Top = 0
        Width = 0
        Height = 402
        Align = alRight
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 0
        object RzToolbar2: TRzToolbar
          Left = 3
          Top = 0
          Width = 117
          Height = 402
          Align = alClient
          AutoStyle = False
          RowHeight = 31
          BorderInner = fsNone
          BorderOuter = fsNone
          BorderSides = [sdTop]
          BorderWidth = 0
          ParentColor = True
          TabOrder = 0
          VisualStyle = vsClassic
          ToolbarControls = (
            btn1)
          object btn1: TButton
            Left = 4
            Top = 5
            Width = 112
            Height = 25
            Caption = 'btn1'
            TabOrder = 0
            Visible = False
          end
        end
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 3
          Height = 402
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
        end
      end
      object PageControl_M: TPageControl
        Left = 0
        Top = 0
        Width = 844
        Height = 402
        ActivePage = TabSheet1
        Align = alClient
        TabOrder = 1
        object TabSheet1: TTabSheet
          Caption = #27010#35272
          object DghMain: TDBGridEh
            Left = 0
            Top = 0
            Width = 836
            Height = 375
            Align = alClient
            DataSource = DataSource1
            EditActions = [geaCopyEh, geaSelectAllEh]
            FooterColor = clWindow
            FooterFont.Charset = GB2312_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -12
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            OnGetCellParams = DghMainGetCellParams
            OnKeyDown = DghMainKeyDown
            OnTitleClick = DghMainTitleClick
            Columns = <
              item
                EditButtons = <>
                FieldName = 'IF_urgency'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = #26448#26009#32534#30721
                Footers = <>
                Width = 133
              end
              item
                EditButtons = <>
                FieldName = #26448#26009#25551#36848
                Footers = <>
                Width = 313
              end
              item
                EditButtons = <>
                FieldName = #21333#20301
                Footers = <>
                Width = 27
              end
              item
                EditButtons = <>
                FieldName = #37319#36141#25968#37327
                Footers = <>
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = #24050#25509#25910#25968#37327
                Footers = <>
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = #27424#36135#25968#37327
                Footers = <>
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = #35201#27714#26085#26399
                Footers = <>
                Width = 65
              end
              item
                EditButtons = <>
                FieldName = #35831#36141#21407#22240
                Footers = <>
                Width = 198
              end
              item
                EditButtons = <>
                FieldName = #37319#36141#32534#21495
                Footers = <>
                Width = 71
              end
              item
                EditButtons = <>
                FieldName = #20351#29992#32773
                Footers = <>
                Width = 41
              end
              item
                EditButtons = <>
                FieldName = #20351#29992#32773#30005#35805
                Footers = <>
                Width = 71
              end
              item
                EditButtons = <>
                FieldName = #35831#36141#37096#38376
                Footers = <>
                Width = 66
              end
              item
                EditButtons = <>
                FieldName = #35831#36141#20154#21592
                Footers = <>
                Width = 51
              end>
          end
          object Memo1: TMemo
            Left = 56
            Top = 272
            Width = 577
            Height = 89
            Lines.Strings = (
              'SELECT     TOP (100) PERCENT '
              
                'dbo.Data0071.rkey,dbo.Data0071.IF_urgency,dbo.Data0017.INV_PART_' +
                'NUMBER as '#26448#26009#32534#30721', '
              
                'dbo.Data0017.INV_PART_DESCRIPTION as '#26448#26009#25551#36848', dbo.Data0002.UNIT_NAM' +
                'E as '#21333#20301', '
              'dbo.Data0071.QUAN_ORD as '#37319#36141#25968#37327',dbo.Data0071.QUAN_RECD as '#24050#25509#25910#25968#37327','
              'dbo.Data0071.QUAN_ORD - dbo.Data0071.QUAN_RECD AS  '#27424#36135#25968#37327','
              ' dbo.Data0071.REQ_DATE as '#35201#27714#26085#26399', dbo.Data0071.reason as '#35831#36141#21407#22240','
              'dbo.Data0070.PO_NUMBER as '#37319#36141#32534#21495','
              'dbo.Data0068.user_name as '#20351#29992#32773', '
              'dbo.Data0068.user_phone as '#20351#29992#32773#30005#35805', '
              'dbo.Data0034.DEPT_NAME as '#35831#36141#37096#38376', '
              'dbo.Data0005.EMPLOYEE_NAME AS '#35831#36141#20154#21592
              'FROM         dbo.Data0071 INNER JOIN'
              
                '      dbo.Data0070 ON dbo.Data0071.PO_PTR = dbo.Data0070.RKEY IN' +
                'NER JOIN'
              
                '      dbo.Data0017 ON dbo.Data0071.INVT_PTR = dbo.Data0017.RKEY ' +
                'INNER JOIN'
              
                '      dbo.Data0002 ON dbo.Data0071.PURCHASE_UNIT_PTR = dbo.Data0' +
                '002.RKEY INNER JOIN'
              
                '      dbo.Data0068 ON dbo.Data0070.FOB = dbo.Data0068.PO_REQ_NUM' +
                'BER INNER JOIN'
              
                '      dbo.Data0034 ON dbo.Data0068.DEPARTMENT_NAME = dbo.Data003' +
                '4.DEPT_CODE INNER JOIN'
              '      dbo.Data0005 ON dbo.Data0068.REQ_BY = dbo.Data0005.RKEY')
            TabOrder = 1
            Visible = False
          end
          object Memo2: TMemo
            Left = 64
            Top = 296
            Width = 529
            Height = 89
            Lines.Strings = (
              'WHERE     (dbo.Data0071.IF_urgency = 1) AND '
              '(dbo.Data0070.STATUS IN (1, 5)) AND '
              '(dbo.Data0071.QUAN_ORD - dbo.Data0071.QUAN_RECD > 0)')
            TabOrder = 2
            Visible = False
          end
          object Memo3: TMemo
            Left = 88
            Top = 280
            Width = 433
            Height = 89
            Lines.Strings = (
              'ORDER BY dbo.Data0071.REQ_DATE ')
            TabOrder = 3
            Visible = False
          end
        end
        object TabSheet2: TTabSheet
          Caption = #26126#32454
          ImageIndex = 1
          object Panel8: TPanel
            Left = 0
            Top = 0
            Width = 836
            Height = 375
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label4: TLabel
              Left = 24
              Top = 47
              Width = 48
              Height = 12
              Caption = #26448#26009#32534#30721
              FocusControl = DBEdit1
            end
            object Label5: TLabel
              Left = 24
              Top = 87
              Width = 48
              Height = 12
              Caption = #26448#26009#25551#36848
              FocusControl = DBEdit2
            end
            object Label6: TLabel
              Left = 24
              Top = 127
              Width = 24
              Height = 12
              Caption = #21333#20301
              FocusControl = DBEdit3
            end
            object Label7: TLabel
              Left = 24
              Top = 167
              Width = 48
              Height = 12
              Caption = #37319#36141#25968#37327
              FocusControl = DBEdit4
            end
            object Label8: TLabel
              Left = 24
              Top = 207
              Width = 60
              Height = 12
              Caption = #24050#25509#25910#25968#37327
              FocusControl = DBEdit5
            end
            object Label9: TLabel
              Left = 24
              Top = 247
              Width = 48
              Height = 12
              Caption = #27424#36135#25968#37327
              FocusControl = DBEdit6
            end
            object Label10: TLabel
              Left = 24
              Top = 287
              Width = 48
              Height = 12
              Caption = #35201#27714#26085#26399
              FocusControl = DBEdit7
            end
            object Label11: TLabel
              Left = 24
              Top = 327
              Width = 48
              Height = 12
              Caption = #35831#36141#21407#22240
              FocusControl = DBEdit8
            end
            object Label12: TLabel
              Left = 24
              Top = 367
              Width = 48
              Height = 12
              Caption = #37319#36141#32534#21495
              FocusControl = DBEdit9
            end
            object Label13: TLabel
              Left = 24
              Top = 407
              Width = 36
              Height = 12
              Caption = #20351#29992#32773
              FocusControl = DBEdit10
            end
            object Label14: TLabel
              Left = 24
              Top = 447
              Width = 60
              Height = 12
              Caption = #20351#29992#32773#30005#35805
              FocusControl = DBEdit11
            end
            object Label15: TLabel
              Left = 24
              Top = 487
              Width = 48
              Height = 12
              Caption = #35831#36141#37096#38376
              FocusControl = DBEdit12
            end
            object Label16: TLabel
              Left = 24
              Top = 527
              Width = 48
              Height = 12
              Caption = #35831#36141#20154#21592
              FocusControl = DBEdit13
            end
            object DBEdit1: TDBEdit
              Left = 93
              Top = 44
              Width = 200
              Height = 20
              DataField = #26448#26009#32534#30721
              DataSource = DataSource1
              TabOrder = 0
            end
            object DBEdit2: TDBEdit
              Left = 93
              Top = 84
              Width = 300
              Height = 20
              DataField = #26448#26009#25551#36848
              DataSource = DataSource1
              TabOrder = 1
            end
            object DBEdit3: TDBEdit
              Left = 93
              Top = 124
              Width = 121
              Height = 20
              DataField = #21333#20301
              DataSource = DataSource1
              TabOrder = 2
            end
            object DBEdit4: TDBEdit
              Left = 93
              Top = 164
              Width = 121
              Height = 20
              DataField = #37319#36141#25968#37327
              DataSource = DataSource1
              TabOrder = 3
            end
            object DBEdit5: TDBEdit
              Left = 93
              Top = 204
              Width = 121
              Height = 20
              DataField = #24050#25509#25910#25968#37327
              DataSource = DataSource1
              TabOrder = 4
            end
            object DBEdit6: TDBEdit
              Left = 93
              Top = 244
              Width = 121
              Height = 20
              DataField = #27424#36135#25968#37327
              DataSource = DataSource1
              TabOrder = 5
            end
            object DBEdit7: TDBEdit
              Left = 93
              Top = 284
              Width = 121
              Height = 20
              DataField = #35201#27714#26085#26399
              DataSource = DataSource1
              TabOrder = 6
            end
            object DBEdit8: TDBEdit
              Left = 93
              Top = 324
              Width = 300
              Height = 20
              DataField = #35831#36141#21407#22240
              DataSource = DataSource1
              TabOrder = 7
            end
            object DBEdit9: TDBEdit
              Left = 93
              Top = 364
              Width = 121
              Height = 20
              DataField = #37319#36141#32534#21495
              DataSource = DataSource1
              TabOrder = 8
            end
            object DBEdit10: TDBEdit
              Left = 93
              Top = 404
              Width = 121
              Height = 20
              DataField = #20351#29992#32773
              DataSource = DataSource1
              TabOrder = 9
            end
            object DBEdit11: TDBEdit
              Left = 93
              Top = 444
              Width = 121
              Height = 20
              DataField = #20351#29992#32773#30005#35805
              DataSource = DataSource1
              TabOrder = 10
            end
            object DBEdit12: TDBEdit
              Left = 93
              Top = 484
              Width = 121
              Height = 20
              DataField = #35831#36141#37096#38376
              DataSource = DataSource1
              TabOrder = 11
            end
            object DBEdit13: TDBEdit
              Left = 93
              Top = 524
              Width = 121
              Height = 20
              DataField = #35831#36141#20154#21592
              DataSource = DataSource1
              TabOrder = 12
            end
            object DBCheckBox1: TDBCheckBox
              Left = 93
              Top = 12
              Width = 98
              Height = 17
              Caption = #32039#24613
              DataField = 'IF_urgency'
              DataSource = DataSource1
              TabOrder = 13
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
          end
        end
      end
    end
    object Panel6: TPanel
      Left = 0
      Top = 0
      Width = 844
      Height = 8
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
    end
    object Panel_Bottom: TPanel
      Left = 0
      Top = 410
      Width = 844
      Height = 30
      Align = alBottom
      BevelOuter = bvNone
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object Panel1: TPanel
        Left = 196
        Top = 0
        Width = 618
        Height = 30
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object Label1: TLabel
          Left = 4
          Top = 9
          Width = 48
          Height = 12
          Caption = #35831#36141#37096#38376
        end
        object Label2: TLabel
          Left = 314
          Top = 9
          Width = 48
          Height = 12
          Caption = #35831#36141#20154#21592
        end
        object Label_DEPT_NAME: TLabel
          Left = 232
          Top = 9
          Width = 6
          Height = 12
        end
        object Label_EMPLOYEE_NAME: TLabel
          Left = 536
          Top = 9
          Width = 6
          Height = 12
        end
        object btn_Find: TSpeedButton
          Left = 593
          Top = 4
          Width = 24
          Height = 23
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000
            00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FF0000CE0094FF0000CE000000FF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000CE0094FF0000
            FF0000CE000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FF0000CE0094FF0000FF0000CE000000FF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FF0000000000000000000000000000000094FF0000FF0000CE0000
            00FF00FFFF00FFFF00FFFF00FFFF00FF848484000000CE9400CE9400CE940094
            63299463290000000000CE000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
            ADB5ADFFCE29FFCE29FFCE29FFCE29CE9400CE9400946329000000FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FF848484FFFF94FFFF94FFFF94FFCE94FFCE29FF
            CE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484FFCE94
            FFFF94FFFF94FFFF94FFFF94FFFF94FFCE29FFCE29CE9400946329000000FF00
            FFFF00FFFF00FFFF00FF848484FFCE94FFFFCEFFFFCEFFFFCEFFFF94FFFF94FF
            FF94FFCE29CE9400CE9400000000FF00FFFF00FFFF00FFFF00FF848484FFCE94
            FFFFFFFFFFFFFFFFCEFFFFCEFFFF94FFFF94FFCE94FFCE29CE9400000000FF00
            FFFF00FFFF00FFFF00FF848484ADB5ADFFFFFFFFFFFFFFFFFFFFFFCEFFFFCEFF
            FF94FFFF94FFCE29CE9400000000FF00FFFF00FFFF00FFFF00FFFF00FF848484
            FFCE94FFFFFFFFFFFFFFFFFFFFFFCEFFFF94FFFF94FFCE29000000FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FF848484ADB5ADFFCE94FFFFFFFFFFFFFFFFCEFF
            FF94FFCE94CE9429000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            848484848484ADB5ADFFCE94FFCE94FFCE94848484848484FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF84848484848484848484
            8484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          OnClick = btn_FindClick
        end
        object edt_DEPT_CODE: TEdit
          Left = 60
          Top = 4
          Width = 100
          Height = 20
          TabOrder = 0
          OnChange = edt_DEPT_CODEChange
        end
        object Edt_EMPL_CODE: TEdit
          Left = 370
          Top = 4
          Width = 100
          Height = 20
          TabOrder = 1
          OnChange = Edt_EMPL_CODEChange
        end
        object BitBtn1: TBitBtn
          Left = 162
          Top = 2
          Width = 26
          Height = 26
          TabOrder = 2
          OnClick = BitBtn1Click
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            04000000000080000000120B0000120B00001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
            DADA000000000000ADAD0FFFFFFFFFF0DADA0F00F00000F0ADAD0FFFFFFFFFF0
            DADA0F00F00000F0ADAD0FFFFFFFFFF0DADA0FFFFFFF0FF0ADAD0FF0FFF080F0
            DAD40F080F0808000D440FF08080808880440000080808888844DADAD0808888
            8844ADADAD0888888044DADADAD000000A44ADADADADADADADAD}
        end
        object BitBtn2: TBitBtn
          Left = 471
          Top = 1
          Width = 26
          Height = 26
          TabOrder = 3
          OnClick = BitBtn2Click
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            04000000000080000000120B0000120B00001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
            DADA000000000000ADAD0FFFFFFFFFF0DADA0F00F00000F0ADAD0FFFFFFFFFF0
            DADA0F00F00000F0ADAD0FFFFFFFFFF0DADA0FFFFFFF0FF0ADAD0FF0FFF080F0
            DAD40F080F0808000D440FF08080808880440000080808888844DADAD0808888
            8844ADADAD0888888044DADADAD000000A44ADADADADADADADAD}
        end
      end
      object Panel3: TPanel
        Left = 814
        Top = 0
        Width = 300
        Height = 30
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
      end
      object Panel9: TPanel
        Left = 0
        Top = 0
        Width = 196
        Height = 30
        Align = alLeft
        BevelOuter = bvNone
        Caption = 'Panel9'
        TabOrder = 2
        object RadioGroup1: TRadioGroup
          Left = 0
          Top = 0
          Width = 185
          Height = 30
          Align = alLeft
          Columns = 3
          ItemIndex = 0
          Items.Strings = (
            #32039#24613
            #38750#32039#24613
            #20840#37096)
          TabOrder = 0
          OnClick = RadioGroup1Click
        end
      end
    end
  end
  object Images: TImageList
    Left = 688
    Top = 65528
    Bitmap = {
      494C010135003700040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000E0000000010020000000000000E0
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000076000000570000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000512500000C720000265400005900000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004D2700000B9700002FDD2F007FA47B002556000059000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004929
      00000D97000000CD220008AE540040E3400080A37C0024560000590000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000452A00000F97
      000000C92400218F6E0048685A00000000003FE33F0080A37C00245600005900
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001097000000EC
      000022D12D004B5F5F000000000000000000000000003FE33F0081A47C002555
      0000590000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000EA000024D9
      240069944800745616005E00000045000000000000000000000029EB290010CD
      0B00735555000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000061360000245A0000324200004600000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000461E00001B7E000025C825006A9460003243000045000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000431F
      00001D7E000000C51A0013BC4D0052D7520069945F0034420000440000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000412000001E7E
      000000C21B0019A05D0037765A000000000053D7530067945E00354100004300
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001F7E000000DD
      00001AD12D004367670000000000000000000000000056D7560065955D003740
      0000420000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000DC00001AE3
      1A00418B4100000000000000000000000000000000000000000048DD480010B4
      0800733F3F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003399CC00006699000066990000669900006699000066
      9900006699000066990000669900000000000000000000000000000000000000
      0000000000000000000099999900999999009999990099999900999999009999
      9900999999009999990099999900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003399CC0099FFFF0099FFFF0099FFFF0099FFFF0099FF
      FF0099FFFF0099FFFF0000669900000000000000000000000000000000000000
      0000000000000000000099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC0099999900000000000000000000000000000000000000
      0000CECECE00CECECE00CECECE00CECECE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE000000000000000000000000000000000000000000000000000000
      000000000000000000003399CC0099FFFF0099FFFF0099FFFF0099FFFF0099FF
      FF0099FFFF0099FFFF0000669900000000000000000000000000000000000000
      0000000000000000000099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC009999990000000000000000000000000000000000CECE
      CE00292929003131290031312900CECECE00CECECE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CECECE00292929003129290031292900CECECE0029292900313129003131
      2900CECECE000000000000000000000000000000000000000000000000000000
      000000000000000000003399CC0099FFFF0099FFFF0099FFFF0099FFFF0099FF
      FF0099FFFF0099FFFF0000669900000000000000000000000000000000000000
      0000000000000000000099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC0099999900000000000000000000000000292929002929
      29002929290039B573002994630029292900CECECE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002929
      29002929290029292900B59C310094842900292929002929290039B573002994
      630029292900CECECE0000000000000000000000000000000000000000000000
      000000000000000000003399CC0099FFFF0099FFFF0099FFFF0099FFFF0099FF
      FF0099FFFF0099FFFF0000669900000000000000000000000000000000000000
      0000000000000000000099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00999999000000000000000000000000002931290063CE
      94002929290039B573002994630029312900CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00000000000000000000000000000000003129
      2900CEB5630029292900B59C310094842900312929002929290039B573002994
      630029312900CECECE00000000000000000000000000CC996600CC996600CC99
      6600CC996600CC9966003399CC0099FFFF0099FFFF0099FFFF0099FFFF0099FF
      FF0099FFFF0099FFFF0000669900000000000000000099999900999999009999
      9900999999009999990099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC0099999900000000000000000000000000292929005ACE
      94002929290039B5730029946300292929002929290029292900292929002929
      29002929290029292900CECECE00CECECE000000000000000000000000002929
      2900CEB55A0029292900B59C310094842900292929002929290039B573002994
      630029292900CECECE00000000000000000000000000CC996600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF003399CC0099FFFF0099FFFF0099FFFF0099FFFF0099FF
      FF0099FFFF0099FFFF0000669900000000000000000099999900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00999999000000000000000000CECECE002931290063CE
      94002929290039B573002994630029312900CEB56300CEB56300CEB56300CEB5
      6300CEB56300CEB5630029292900CECECE000000000000000000CECECE003129
      2900CEB5630029292900B59C310094842900312929002929290039B573002994
      630029312900CECECE00000000000000000000000000CC996600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF003399CC0099FFFF0099FFFF0099FFFF0099FFFF003399
      CC003399CC003399CC003399CC00000000000000000099999900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC009999
      9900999999009999990099999900000000000000000029292900292929005ACE
      940063CE9C005ACE9400292929002994630029292900FFF78C00292929002929
      290029292900CEB5630029292900CECECE000000000000000000292929002929
      2900CEB55A00CEC66300CEB55A002929290094842900292929005ACE94002929
      29002994630029292900CECECE000000000000000000CC996600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF003399CC0099FFFF0099FFFF0099FFFF0099FFFF003399
      CC00CCFFFF000066990000000000000000000000000099999900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC009999
      9900CCCCCC00999999000000000000000000000000002931290063CE94002929
      290063CE940063CE9400292929002994630029312900FFF78C00FFF78C00FFF7
      8C00FFF78C00CEB5630029292900CECECE00000000000000000031292900CEB5
      630029292900CEB56300CEB5630029292900948429003129290063CE94002929
      29002994630029312900CECECE000000000000000000CC996600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF003399CC0099FFFF0099FFFF0099FFFF0099FFFF003399
      CC00006699000000000000000000000000000000000099999900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC009999
      990099999900000000000000000000000000000000002929290063CE9C002929
      290063CE94005ACE9400292929002994630029292900FFF78C00292929002929
      290029292900CEB5630029292900CECECE00000000000000000029292900CEC6
      630029292900CEB56300CEB55A002929290094842900292929005ACE94002929
      29002994630029292900CECECE000000000000000000CC996600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF003399CC003399CC003399CC003399CC003399CC003399
      CC00000000000000000000000000000000000000000099999900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0099999900999999009999990099999900999999009999
      990000000000000000000000000000000000000000002931290063CE940094FF
      CE0094FFCE0094FFCE0094FFCE0094FFCE0029312900FFF78C00FFF78C00FFF7
      8C00FFF78C00CEB5630029292900CECECE00000000000000000031292900CEB5
      6300FFF78C00FFF78C00FFF78C00FFF78C00FFF78C003129290094FFCE0094FF
      CE0094FFCE0029312900CECECE000000000000000000CC996600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CC996600000000000000
      0000000000000000000000000000000000000000000099999900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0099999900000000000000
      000000000000000000000000000000000000000000002929290094FFCE002929
      290029292900292929002929290029292900FFF78C0029292900292929002929
      290029292900CEB5630029292900CECECE00000000000000000029292900FFF7
      8C00292929002929290029292900292929002929290029292900292929002929
      290029292900CECECE00000000000000000000000000CC996600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CC996600CC996600CC996600CC996600000000000000
      0000000000000000000000000000000000000000000099999900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0099999900999999009999990099999900000000000000
      00000000000000000000000000000000000000000000000000002931290063CE
      940094FFCE0094FFCE0029312900FFF78C00FFF78C00FFF78C00FFF78C00FFF7
      8C00FFF78C00CEB5630029292900CECECE000000000000000000000000003129
      2900CEB56300FFF78C00FFF78C003129290063CE940094FFCE0094FFCE002931
      2900CECECE0000000000000000000000000000000000CC996600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CC996600E5E5E500CC99660000000000000000000000
      0000000000000000000000000000000000000000000099999900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0099999900000000009999990000000000000000000000
      00000000000000000000000000000000000000000000000000002929290063CE
      940094FFCE0094FFCE0029292900292929002929290029292900292929002929
      29002929290029292900CECECE00000000000000000000000000000000002929
      2900CEB56300FFF78C00FFF78C002929290063CE940094FFCE0094FFCE002929
      2900CECECE0000000000000000000000000000000000CC996600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CC996600CC9966000000000000000000000000000000
      0000000000000000000000000000000000000000000099999900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0099999900999999000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002929290063CE
      940063CE940063CE940029312900CECECE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002929
      2900CEB56300CEB56300CEB563003129290063CE940063CE940063CE94002931
      2900CECECE0000000000000000000000000000000000CC996600CC996600CC99
      6600CC996600CC996600CC996600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099999900999999009999
      9900999999009999990099999900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002929
      29002929290029292900CECECE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000292929002929290029292900CECECE002929290029292900292929000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009933000099330000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009999990099999900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000099330000CC66000099330000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000099999900CCCCCC0099999900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000009933
      0000CC660000CC66000099330000CC996600CC996600CC996600CC996600CC99
      6600CC996600CC996600CC996600CC9966000000000000000000000000009999
      9900CCCCCC00CCCCCC0099999900999999009999990099999900999999009999
      99009999990099999900999999009999990000000000FFFCF900FFFCF900FFFC
      F900FFFCF900FFFCF900FFFCF900FFFCF900FFFCF900FFE1B100000000000000
      000000000000000000000000000000000000C0C0C000FFFCF900FFFCF900FFFC
      F900FFFCF900FFFCF900FFFCF900FFFCF900FFFCF900C0C0C000C0C0C0000000
      000000000000000000000000000000000000000000000000000099330000CC66
      0000CC660000CC66000099330000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CC996600000000000000000099999900CCCC
      CC00CCCCCC00CCCCCC0099999900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009999990000000000FFF8EE0073000000FFB0
      3400FFB03400FFB03400FFB03400FFB03400FFB03400FFE1B100000000000000
      000000000000000000000000000000000000C0C0C000FFF8EE0080808000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      0000000000000000000000000000000000000000000099330000CC660000CC66
      0000CC660000CC66000099330000E5E5E500E5E5E500E5E5E500E5E5E500E5E5
      E500E5E5E500E5E5E500FFFFFF00CC9966000000000099999900CCCCCC00CCCC
      CC00CCCCCC00CCCCCC0099999900E5E5E500E5E5E500E5E5E500E5E5E500E5E5
      E500E5E5E500E5E5E500FFFFFF009999990000000000FFF8EE0073000000FFB0
      3400FFB03400FFB03400FFB03400FFB03400FFFAF300FFE1B100000000000000
      000000000000000000000000000000000000C0C0C000FFF8EE0080808000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000FFFAF300C0C0C000C0C0C0000000
      00000000000000000000000000000000000099330000CC660000CC660000CC66
      0000CC660000CC66000099330000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CC99660099999900CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC0099999900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009999990000000000FFF8EE00FFF8EE00FFF8
      EE00FFF8EE00FFF8EE00FFF8EE00FFF8EE00FFF8EE00FFCE8200000000000000
      000000000000000000000000000000000000C0C0C000FFF8EE00FFF8EE00FFF8
      EE00FFF8EE00FFF8EE00FFF8EE00FFF8EE00FFF8EE0080808000C0C0C0000000
      0000000000000000000000000000000000000000000099330000CC660000CC66
      0000CC660000CC66000099330000E5E5E500E5E5E500E5E5E500E5E5E500E5E5
      E500E5E5E500E5E5E500FFFFFF00CC9966000000000099999900CCCCCC00CCCC
      CC00CCCCCC00CCCCCC0099999900E5E5E500E5E5E500E5E5E500E5E5E500E5E5
      E500E5E5E500E5E5E500FFFFFF009999990000000000FFF4E200FFF4E200FFF4
      E200FFF4E200FFF4E200FFF4E200FFF4E200FFF4E2000000FF000000FF000000
      000000000000000000000000000000000000C0C0C000FFF4E200FFF4E200FFF4
      E200FFF4E200FFF4E200FFF4E200FFF4E200FFF4E200C0C0C000C0C0C0008080
      800000000000000000000000000000000000000000000000000099330000CC66
      0000CC660000CC66000099330000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CC996600000000000000000099999900CCCC
      CC00CCCCCC00CCCCCC0099999900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009999990000000000FFF2DD00FFF2DD00FFF2
      DD00FFF2DD00FFF2DD00FFF2DD00FFF2DD00FFF2DD000000FF000000FF000000
      000000000000000000000000000000000000C0C0C000FFF2DD00FFF2DD00FFF2
      DD00FFF2DD00FFF2DD00FFF2DD00FFF2DD00FFF2DD00C0C0C000C0C0C0008080
      8000000000000000000000000000000000000000000000000000000000009933
      0000CC660000CC66000099330000E5E5E500E5E5E500E5E5E500E5E5E500E5E5
      E500E5E5E500E5E5E500FFFFFF00CC9966000000000000000000000000009999
      9900CCCCCC00CCCCCC0099999900E5E5E500E5E5E500E5E5E500E5E5E500E5E5
      E500E5E5E500E5E5E500FFFFFF009999990000000000FFDEAB00FFF0D700FFF0
      D700FFF0D700FFF0D7000000000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000C0C0C000C0C0C000FFF0D700FFF0
      D700FFF0D700FFF0D700808080008080800080808000C0C0C000C0C0C0008080
      8000808080008080800080808000000000000000000000000000000000000000
      000099330000CC66000099330000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CC9966000000000000000000000000000000
      000099999900CCCCCC0099999900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009999990000000000FFC15E00FFD08500FFEE
      D200FFEED200FFEED200000000000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000000000000000C0C0C00080808000C0C0C000FFEE
      D200FFEED200FFEED20080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00080808000000000000000000000000000000000000000
      0000CC9966009933000099330000E5E5E500E5E5E500E5E5E500E5E5E500E5E5
      E500E5E5E500E5E5E500FFFFFF00CC9966000000000000000000000000000000
      0000999999009999990099999900E5E5E500E5E5E500E5E5E500E5E5E500E5E5
      E500E5E5E500E5E5E500FFFFFF009999990000000000FFEAC700FFEAC700FFEA
      C700FFEAC700FFEAC700000000000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000000000000000C0C0C000FFEAC700FFEAC700FFEA
      C700FFEAC700FFEAC70080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00080808000000000000000000000000000000000000000
      0000CC996600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CC9966000000000000000000000000000000
      000099999900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00999999000000000000000000FFE8C100FFC7
      6B00FFD79400FFE8C1000000000000000000000000000000FF000000FF000000
      00000000000000000000000000000000000000000000C0C0C000FFE8C1008080
      8000C0C0C000FFE8C100808080008080800080808000C0C0C000C0C0C0008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000CC996600FFFFFF00E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5
      E500E5E5E500E5E5E500FFFFFF00CC9966000000000000000000000000000000
      000099999900FFFFFF00E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5
      E500E5E5E500E5E5E500FFFFFF00999999000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000808080008080
      80008080800080808000808080008080800000000000C0C0C000C0C0C0008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000CC996600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CC9966000000000000000000000000000000
      000099999900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00999999000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C0008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000CC996600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CC9966000000000000000000000000000000
      000099999900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00999999000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CC996600CC996600CC996600CC996600CC996600CC996600CC996600CC99
      6600CC996600CC996600CC996600CC9966000000000000000000000000000000
      0000999999009999990099999900999999009999990099999900999999009999
      9900999999009999990099999900999999000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080000000
      0000000000000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      0000FFFFFF0000FFFF0000000000848484000000000000000000FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600000000000000
      0000FFFFFF00C6C6C600000000008484840000000000FFFCF900FFFCF900FFFC
      F900FFFCF900FFFCF900FFFCF900FFFCF900FFFCF900FFE1B100000000000000
      00000000000000000000000000000000000080808000FFFCF900FFFCF900FFFC
      F900FFFCF900FFFCF900FFFCF900FFFCF900FFFCF900C0C0C000808080000000
      000000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000C6C6
      C60000000000FFFFFF0000000000848484000000000000000000C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF0000000000C6C6
      C60000000000FFFFFF00000000008484840000000000FFF8EE0073000000FFB0
      3400FFB03400FFB03400FFB03400FFB03400FFB03400FFE1B100000000000000
      00000000000000000000000000000000000080808000FFF8EE00C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000808080000000
      0000000000000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000000FF
      FF00C6C6C6000000000000000000848484000000000000000000FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C60000000000C6C6
      C600C6C6C60000000000000000008484840000000000FFF8EE0073000000FFB0
      3400FFB03400FFB03400FFB03400FFB03400FFFAF300FFE1B100000000000000
      00000000000000000000000000000000000080808000FFF8EE00C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000FFFAF300C0C0C000808080000000
      000000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      0000000000000000000000000000848484000000000000000000C6C6C600FFFF
      FF00FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00000000000000
      00000000000000000000000000008484840000000000FFF8EE00FFF8EE00FFF8
      EE00FFF8EE00FFF8EE00FFF8EE00FFF8EE00FFF8EE00FFCE8200000000000000
      00000000000000000000000000000000000080808000FFF8EE00FFF8EE00FFF8
      EE00FFF8EE00FFF8EE00FFF8EE00FFF8EE00FFF8EE00C0C0C000808080000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF0084000000FFFFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000848484000000000000000000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600000000008484840000000000FFF4E200FFF4E200FFF4
      E200FFF4E200FFF4E200FFF4E200FFF4E200FFF4E200FFCE8200000000000000
      00000000000000000000000000000000000080808000FFF4E200FFF4E200FFF4
      E200FFF4E200FFF4E200FFF4E200FFF4E200FFF4E200C0C0C000808080000000
      0000000000000000000000000000000000000000000000000000FFFFFF008400
      000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000848484000000000000000000FFFFFF00C6C6
      C600C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00000000008484840000000000FFF2DD00FFF2DD00FFF2
      DD00FFF2DD00FFF2DD00FFF2DD00FFF2DD00FFF2DD00FFCE8200000000000000
      00000000000000000000000000000000000080808000FFF2DD00FFF2DD00FFF2
      DD00FFF2DD00FFF2DD00FFF2DD00FFF2DD00FFF2DD00C0C0C000808080000000
      00000000000000000000000000000000000000000000FFFFFF00840000008400
      00008400000084000000840000008400000084000000FFFFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00000000008484840000000000FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00FFFFFF00C6C6
      C600FFFFFF00C6C6C600000000008484840000000000FFDEAB00FFF0D700FFF0
      D700FFF0D700FFF0D70000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000FFDEAB00FFF0D700FFF0
      D700FFF0D700FFF0D70080808000808080008080800080808000808080008080
      800080808000808080008080800000000000FFFFFF0084000000840000008400
      00008400000084000000840000008400000084000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF000000000084848400FFFFFF00C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00000000008484840000000000FFC15E00FFD08500FFEE
      D200FFEED200FFEED200000000000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF00000000000000000080808000C0C0C000C0C0C000FFEE
      D200FFEED200FFEED20080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00080808000000000008400000084000000840000008400
      00008400000084000000840000008400000084000000FFFFFF00000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00000000000000
      00000000000000000000000000000000000000000000FFEAC700FFEAC700FFEA
      C700FFEAC700FFEAC700000000000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF00000000000000000080808000FFEAC700FFEAC700FFEA
      C700FFEAC700FFEAC70080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00080808000000000000000000084000000840000008400
      00008400000084000000840000008400000084000000FFFFFF00000000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000FFE8C100FFC7
      6B00FFD79400FFE8C10000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000FFE8C100C0C0
      C000C0C0C000FFE8C10080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000840000008400
      00008400000084000000840000008400000084000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000808080008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000634A1000FFF7D600FFE78C00F7D6
      7300313910000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000634A1000FFF7D600C6C6C600C6C6
      C600313910000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000634A1000FFF7D600FFE78C00F7D6
      7300FFDE94002921210000000000000000000000000000000000000000000000
      000000000000000000000000000000000000634A1000FFF7D600C6C6C600C6C6
      C600C6C6C6002921210000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484003139100031391000313910003139
      10003139100031391000639CA500000000006B5A2100FFF7E700FFE78C00F7D6
      7300F7D67300F7D6730029212100313910003139100031391000313910003139
      10003139100031391000639CA500000000006B5A2100FFF7E700C6C6C600C6C6
      C600C6C6C600C6C6C60029212100313910000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000007331100063949400ADADA5006B5A2100FFF7D600FFE78C00F7D6
      7300F7D67300F7D673005A6B2900733110000000000000000000000000000000
      0000000000007331100063949400ADADA5006B5A2100FFF7D600C6C6C600C6C6
      C600C6C6C600C6C6C6005A6B2900733110000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      0000FFFFFF0000FFFF0000000000848484000000000000000000FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600000000000000
      0000FFFFFF00C6C6C60000000000848484000000000000000000000000002173
      5200000000005221180031391000313910008C7B3100FFF7D600FFE78C00C69C
      5200F7D67300F7C663009C633100313910000000000000000000000000002173
      5200000000005221180031391000313910008C7B3100FFF7D600C6C6C600C69C
      5200C6C6C600C6C6C6009C63310031391000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000C6C6
      C60000000000FFFFFF0000000000848484000000000000000000C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF0000000000C6C6
      C60000000000FFFFFF0000000000848484000000000000000000000000001852
      3100185231003139100063A5B500639CA5008C7B3100FFF7E700C6B57B006B5A
      2100F7C66300EFBD6B005A6B2900313910000000000000000000000000001852
      3100185231003139100063A5B500C6C6C6008C7B3100FFF7E700C6B57B006B5A
      2100C6C6C600C6C6C6005A6B2900313910000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000000FF
      FF00C6C6C6000000000000000000848484000000000000000000FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C60000000000C6C6
      C600C6C6C6000000000000000000848484000000000000000000000000001852
      310063B5420018523100A59C8C0063A5B5008C7B3100FFF7D600FFDE94006B5A
      2100CEB55A00CEB55A009C633100313910000000000000000000000000001852
      3100C6C6C60018523100A59C8C0063A5B5008C7B3100FFF7D600C6C6C6006B5A
      2100C6C6C600C6C6C6009C63310031391000000000000000000000FFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      0000000000000000000000000000848484000000000000000000C6C6C600FFFF
      FF00FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00000000000000
      0000000000000000000000000000848484001852310018523100185231000873
      310042FFA50063B5420018523100949CB5008C7B3100FFF7E700FFE78C00CEB5
      5A00F7C66300CEB55A009C633100313910001852310018523100185231000873
      3100C6C6C600C6C6C60018523100C6C6C6008C7B3100FFF7E700C6C6C600C6C6
      C600C6C6C600C6C6C6009C633100313910000000000000000000FFFFFF00FFFF
      FF0084000000FFFFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000848484000000000000000000FFFFFF00FFFF
      FF00C6C6C600FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600000000008484840063B5420063AD390063B5420031B5
      6B0042FFA50042FFA50063B54200185231008C7B3100FFF7E700FFE78C00CEB5
      5A00CEB55A00CEB55A009C63310031391000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600185231008C7B3100FFF7E700C6C6C600C6C6
      C600C6C6C600C6C6C6009C63310031391000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008400000084000000FFFFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600C6C6C600FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00000000008484840042FFA50042FFA50042FFA50042FF
      A50042FFA50042FFA50042FFA50063B54200C6943900FFF7E700FFE78C00CEB5
      5A00DEAD5200D6A531005A6B290063391800C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6943900FFF7E700C6C6C600C6C6
      C600C6C6C600C6C6C6005A6B2900633918008400000084000000840000008400
      0000840000008400000084000000FFFFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF000000000084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C6000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0042FFA500185231007B6B4A00FFF7E700FFDE9400DEAD
      5200CEB55A00D6A531009C63310031391000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600185231007B6B4A00FFF7E700C6C6C600C6C6
      C600C6C6C600C6C6C6009C633100313910008400000084000000840000008400
      000084000000840000008400000084000000FFFFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF000000000084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF0000000000848484002994630018845200188452002994
      6300FFFFFF0042FFA5001852310063A5B50063A5B50031391000FFF7E700FFE7
      8C00DEAD5200C69C52005A6B2900733110002994630018845200188452002994
      6300FFFFFF00C6C6C6001852310063A5B50063A5B50031391000FFF7E700C6C6
      C600C6C6C600C6C6C6005A6B2900733110008400000084000000840000008400
      00008400000084000000840000008400000084000000FFFFFF00000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000001884
      520042FFA50021735200639CA50063A5B50063A5B50063A5B50031391000FFFF
      FF00FFE78C00D6A531009C63310031391000000000000000000000000000C6C6
      C600C6C6C60021735200639CA50063A5B50063A5B50063A5B50031391000FFFF
      FF00C6C6C600C6C6C6009C633100313910008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002994
      63002994630031391000ADADA500639CA50063A5B50063A5B5005AB5BD006339
      1800FFF7E700FFDE94005A6B290063391800000000000000000000000000C6C6
      C600C6C6C60031391000ADADA500639CA50063A5B500C6C6C6005AB5BD006339
      1800FFF7E700C6C6C6005A6B2900633918008400000084000000840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000031B5
      6B0000000000634A1000639CA500949CB500ADADA50063A5B50063A5B50063A5
      B50031391000FFF7E7009C63310031391000000000000000000000000000C6C6
      C60000000000634A1000639CA500949CB500ADADA50063A5B50063A5B50063A5
      B50031391000FFF7E7009C633100313910000000000000000000000000000000
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000073521000634A100073521000634A1000734A2100634A1000734A
      2100634A100031391000634A1000313910000000000000000000000000000000
      00000000000073521000634A100073521000634A1000734A2100634A1000734A
      2100634A100031391000634A1000313910000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000094CE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000094CE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000636300006363000094CE000094
      CE00007B7B000094CE00007B7B000094CE00007B7B000094CE00007B7B000000
      000000000000000000000000000000000000848484005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000094CE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000063630094FFFF00006363000094
      CE000094CE000094CE000094CE00007B7B000094CE00007B7B000094CE00007B
      7B000000000000000000000000000000000084848400FFFFFF005A5A5A008484
      8400848484008484840084848400848484008484840084848400848484005A5A
      5A00000000000000000000000000000000000000000000000000000000000000
      00000094CE000000000000000000000000000000000000000000FF632900FFCE
      2900000000000000000000000000000000000000000000000000000000008484
      8400848484000000000000000000000000000000000000000000848484008484
      8400000000000000000000000000000000000063630094FFFF0000CEFF000063
      63000094CE000094CE000094CE000094CE000094CE000094CE00007B7B000094
      CE00007B7B0000000000000000000000000084848400FFFFFF00CECECE005A5A
      5A00848484008484840084848400848484008484840084848400848484008484
      84005A5A5A000000000000000000000000000094CE0000000000000000000094
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000063630094FFFF00FFFFFF0000CE
      FF00006363000094CE000094CE000094CE000094CE000094CE000094CE00007B
      7B000094CE00007B7B00000000000000000084848400FFFFFF00DEE7DE00CECE
      CE005A5A5A008484840084848400848484008484840084848400848484008484
      8400848484005A5A5A0000000000000000000094CE0094FFFF00000000000094
      CE00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000063630094FFFF0000CEFF00FFFF
      FF0000CEFF000063630000636300006363000063630000636300006363000063
      63000063630000636300006363000000000084848400FFFFFF00DEE7DE00CECE
      CE00CECECE005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A005A5A5A005A5A5A005A5A5A005A5A5A000094CE0094FFFF0000CEFF0000CE
      FF000094CE000000000000000000000000000000000000000000FF632900FF94
      29000000000000000000000000000000000084848400FFFFFF00DEDEDE00CECE
      CE0000000000000000000000000000000000000000000000000084848400CECE
      CE00000000000000000000000000000000000063630094FFFF00FFFFFF0000CE
      FF00FFFFFF0000CEFF0000CEFF0000CEFF0000CEFF0000CEFF00000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00DEE7
      DE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00000000000000
      0000000000000000000000000000000000000094CE0094FFFF0094FFFF0000CE
      FF0000CEFF000094CE000000000000000000000000000000000000000000FF63
      2900FF94290000000000000000000000000084848400FFFFFF00DEDEDE00CECE
      CE00ADB5AD008484840000000000000000000000000000000000000000008484
      8400CECECE000000000000000000000000000063630094FFFF0000CEFF00FFFF
      FF0094FFFF0094FFFF0094FFFF0094FFFF0094FFFF0094FFFF00000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00DEE7DE00DEE7DE00DEE7DE00DEE7DE00DEE7DE00DEE7DE00000000000000
      0000000000000000000000000000000000000094CE0094FFFF0063CEFF0000CE
      FF000094CE000000000000000000000000000000000000000000000000000000
      0000FF632900FF942900000000000000000084848400DEDEDE00CECECE00ADB5
      AD00848484000000000000000000000000000000000000000000000000000000
      000084848400CECECE00000000000000000000636300FFFFFF0094FFFF0094CE
      CE00006363000063630000636300006363000063630000636300006363000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00848484008484840084848400848484008484840084848400737373000000
      0000000000000000000000000000000000000094CE0063CEFF0094FFFF000094
      CE00000000000000000000000000000000000000000000000000000000000000
      000000000000FF632900FF9429000000000084848400CECECE00ADB5AD008484
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000084848400CECECE00000000000000000000636300006363000063
      6300000000000000000000000000000000000000000000000000000000000000
      0000633100006331000063310000000000000000000084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000094CE0094FFFF000094CE000000
      0000000000000000000000000000FF632900FFCE290000000000000000000000
      000000000000FF632900FFCE29000000000084848400ADB5AD00848484000000
      000000000000000000000000000084848400CECECE0000000000000000000000
      00000000000084848400CECECE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009431000063310000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002931290000000000000000000094CE0063CEFF00000000000000
      0000000000000000000000000000FF632900FFCE290000000000000000000000
      000000000000FF632900FFCE2900000000008484840084848400000000000000
      000000000000000000000000000084848400CECECE0000000000000000000000
      00000000000084848400CECECE00000000000000000000000000000000000000
      0000000000000000000000000000000000009431000000000000000000000000
      0000943100000000000063310000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000094CE0000000000000000000000
      000000000000000000000000000000000000FF632900FFCE2900000000000000
      000000000000FF942900FF632900000000008484840000000000000000000000
      00000000000000000000000000000000000084848400CECECE00000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000094310000943100009431
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000094CE0000000000000000000000
      00000000000000000000000000000000000000000000FF632900FF632900FF63
      2900FF632900FF63290000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008CB57300318410008CB573000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008CB573003184
      10008CB573000000000000000000000000008CB57300318410008CB573000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484000000000000000000000000008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003184100084D65200318410008CB5730000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400C6C6C600C6C6C6008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000318410007BDE
      4A00318410008CB573000000000000000000318410007BDE4A00318410008CB5
      730000000000000000000000000000000000000000000000000084848400C6C6
      C600C6C6C60084848400000000000000000084848400C6C6C600C6C6C6008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000003184100084D6520084D65200318410008CB57300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400C6C6C600C6C6C600C6C6C60084848400000000000000
      0000000000000000000000000000000000000000000000000000318410007BDE
      4A007BDE4A00318410008CB5730000000000318410007BDE4A007BDE4A003184
      10008CB57300000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600848484000000000084848400C6C6C600C6C6C600C6C6
      C600848484000000000000000000000000000000000000000000000000000000
      0000000000003184100084D6520084D6520084D65200318410008CB573000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400C6C6C600C6C6C600C6C6C600C6C6C600848484000000
      0000000000000000000000000000000000000000000000000000318410008CD6
      63007BDE4A007BDE4A00318410008CB57300318410008CD663007BDE4A007BDE
      4A00318410008CB573000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C6008484840084848400C6C6C600C6C6C600C6C6
      C600C6C6C6008484840000000000000000000000000000000000000000000000
      0000000000003184100084D6520084D6520094DE730084D65200318410008CB5
      7300000000000000000000000000000000000000000000000000000000000000
      00000000000084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008484
      8400000000000000000000000000000000000000000000000000318410008CD6
      63008CD66300A5DE84008CD6630031841000318410008CD663008CD66300A5DE
      84008CD66300318410008CB5730000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400000000000000000000000000000000000000
      0000000000003184100084D65200A5E78C00FFFFFF00EFEFEF0094DE73003184
      1000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400C6C6C600C6C6C600FFFFFF00EFEFEF00C6C6C6008484
      8400848484000000000000000000000000000000000000000000318410008CD6
      6300A5DE8400FFFFFF00D6FFC600A5DE8400318410008CD66300A5DE8400FFFF
      FF00D6FFC600A5DE84003184100000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600EFEFEF00C6C6C600C6C6C600C6C6C600C6C6C600FFFF
      FF00EFEFEF00C6C6C60084848400000000000000000000000000000000000000
      00000000000031841000A5E78C00A5E78C00D6F7BD00D6F7BD00318410008CB5
      7300000000000000000000000000000000000000000000000000000000000000
      00000000000084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008484
      840000000000000000000000000000000000000000000000000031841000A5DE
      8400A5DE8400D6FFC600D6FFC6003184100031841000A5DE8400A5DE8400D6FF
      C600D6FFC600318410008CB5730000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400000000000000000000000000000000000000
      0000000000003184100094DE730094DE730094DE7300318410008CB573000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400C6C6C600C6C6C600C6C6C600C6C6C600848484000000
      000000000000000000000000000000000000000000000000000031841000A5DE
      84008CD66300A5DE8400318410008CB5730031841000A5DE84008CD66300A5DE
      8400318410008CB573000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C6008484840084848400C6C6C600C6C6C600C6C6
      C600C6C6C6008484840000000000000000000000000000000000000000000000
      0000000000003184100094DE730094DE7300318410008CB57300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400C6C6C600C6C6C600C6C6C60084848400000000000000
      0000000000000000000000000000000000000000000000000000318410008CD6
      63008CD66300318410008CB5730000000000318410008CD663008CD663003184
      10008CB57300000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600848484000000000084848400C6C6C600C6C6C600C6C6
      C600848484000000000000000000000000000000000000000000000000000000
      0000000000003184100094DE7300318410008CB5730000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400C6C6C600C6C6C6008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000318410008CD6
      6300318410008CB573000000000000000000318410008CD66300318410008CB5
      730000000000000000000000000000000000000000000000000084848400C6C6
      C600C6C6C60084848400000000000000000084848400C6C6C600C6C6C6008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000008CB57300318410008CB573000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008CB573003184
      10008CB573000000000000000000000000008CB57300318410008CB573000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484000000000000000000000000008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008CB57300318410008CB573000000000000000000000000008CB5
      7300318410008CB5730000000000000000000000000000000000000000000000
      0000000000008484840084848400848484000000000000000000000000008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008CB57300318410008CB573000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008CB57300318410007BDE4A003184100000000000000000008CB573003184
      10007BDE4A003184100000000000000000000000000000000000000000000000
      000084848400C6C6C600C6C6C60084848400000000000000000084848400C6C6
      C600C6C6C6008484840000000000000000000000000000000000000000000000
      00000000000000000000000000008CB573003184100084D65200318410000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C600C6C6C600848484000000
      0000000000000000000000000000000000000000000000000000000000008CB5
      7300318410007BDE4A007BDE4A0031841000000000008CB57300318410007BDE
      4A007BDE4A003184100000000000000000000000000000000000000000008484
      8400C6C6C600C6C6C600C6C6C600848484000000000084848400C6C6C600C6C6
      C600C6C6C6008484840000000000000000000000000000000000000000000000
      000000000000000000008CB573003184100084D6520084D65200318410000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400C6C6C600C6C6C600C6C6C600848484000000
      00000000000000000000000000000000000000000000000000008CB573003184
      10007BDE4A007BDE4A007BDE4A00318410008CB57300318410007BDE4A007BDE
      4A008CD66300318410000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C60084848400C6C6C600C6C6C600C6C6
      C600C6C6C6008484840000000000000000000000000000000000000000000000
      0000000000008CB573003184100084D6520084D6520084D65200318410000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400C6C6C600C6C6C600C6C6C60084848400848484000000
      000000000000000000000000000000000000000000008CB57300318410008CD6
      6300A5DE84008CD663008CD6630031841000318410008CD66300A5DE84008CD6
      63008CD663003184100000000000000000000000000084848400C6C6C600FFFF
      FF00FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00C6C6
      C600C6C6C6008484840000000000000000000000000000000000000000000000
      00008CB573003184100084D6520094DE730084D6520084D65200318410000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400C6C6C600C6C6C600C6C6C600C6C6C60084848400848484000000
      0000000000000000000000000000000000000000000031841000A5DE8400D6FF
      C600FFFFFF00A5DE84008CD6630031841000A5DE8400D6FFC600FFFFFF00A5DE
      84008CD663003184100000000000000000000000000084848400C6C6C600FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00FFFF
      FF00C6C6C6008484840000000000000000000000000000000000000000000000
      00003184100094DE7300EFEFEF00FFFFFF00A5E78C0084D65200318410000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400C6C6C600C6C6C600FFFFFF00C6C6C60084848400848484000000
      000000000000000000000000000000000000000000008CB5730031841000D6FF
      C600D6FFC600A5DE8400A5DE84003184100031841000D6FFC600D6FFC600A5DE
      8400A5DE84003184100000000000000000000000000084848400C6C6C600FFFF
      FF00FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C6008484840000000000000000000000000000000000000000000000
      00008CB5730031841000D6F7BD00D6F7BD00A5E78C00A5E78C00318410000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400C6C6C600C6C6C600C6C6C600C6C6C60084848400848484000000
      00000000000000000000000000000000000000000000000000008CB573003184
      1000A5DE84008CD66300A5DE8400318410008CB5730031841000A5DE84008CD6
      6300A5DE8400318410000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C6008484840084848400C6C6C600FFFFFF00C6C6
      C600C6C6C6008484840000000000000000000000000000000000000000000000
      0000000000008CB573003184100094DE730094DE730094DE7300318410000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400C6C6C600C6C6C600C6C6C60084848400848484000000
      0000000000000000000000000000000000000000000000000000000000008CB5
      7300318410008CD66300A5DE840031841000000000008CB57300318410008CD6
      6300A5DE84003184100000000000000000000000000000000000000000008484
      8400C6C6C600C6C6C600C6C6C600848484000000000084848400C6C6C600C6C6
      C600C6C6C6008484840000000000000000000000000000000000000000000000
      000000000000000000008CB573003184100094DE730094DE7300318410000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400C6C6C600C6C6C600C6C6C600848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008CB57300318410008CD663003184100000000000000000008CB573003184
      10008CD663003184100000000000000000000000000000000000000000000000
      000084848400C6C6C600C6C6C60084848400000000000000000084848400C6C6
      C600C6C6C6008484840000000000000000000000000000000000000000000000
      00000000000000000000000000008CB573003184100094DE7300318410000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C600C6C6C600848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008CB57300318410008CB573000000000000000000000000008CB5
      7300318410008CB5730000000000000000000000000000000000000000000000
      0000000000008484840084848400848484000000000000000000000000008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008CB57300318410008CB573000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CC666600CC666600CC666600CC66
      6600CC666600CC666600CC666600CC666600CC666600CC666600CC666600CC66
      6600CC666600CC666600CC666600CC6666009999990099999900999999009999
      9900999999009999990099999900999999009999990099999900999999009999
      9900999999009999990099999900999999000000000000000000FFFFFF00FFFF
      FF00FFFFFF00DEDEDE00DEDEDE00CECECE00CECECE00ADB5AD00ADB5AD000000
      00005A5A5A000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00DEDEDE00DEDEDE00CECECE00CECECE00ADB5AD00ADB5AD000000
      00005A5A5A00000000000000000000000000CC666600FFFFFF00FFFFFF00FFCC
      CC00FFFFFF00FFFFFF00FFCCCC00FFFFFF00FFFFFF00FFCCCC00FFFFFF00FFFF
      FF00FFCCCC00FFFFFF00FFFFFF00CC66660099999900FFFFFF00FFFFFF00CCCC
      CC00FFFFFF00FFFFFF00CCCCCC00FFFFFF00FFFFFF00CCCCCC00FFFFFF00FFFF
      FF00CCCCCC00FFFFFF00FFFFFF00999999000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005A5A5A000000000000000000CC666600FFFFFF00FFFFFF00FFCC
      CC00FFFFFF00FFFFFF00FFCCCC00FFFFFF00FFFFFF00FFCCCC00FFFFFF00FFFF
      FF00FFCCCC00FFFFFF00FFFFFF00CC66660099999900FFFFFF00FFFFFF00CCCC
      CC00FFFFFF00FFFFFF00CCCCCC00FFFFFF00FFFFFF00CCCCCC00FFFFFF00FFFF
      FF00CCCCCC00FFFFFF00FFFFFF009999990084848400FFFFFF00FFFFFF00DEDE
      DE00CECECE00CECECE00CECECE0000FF000000FF000000FF0000CECECE00CECE
      CE000000000000000000000000000000000084848400FFFFFF00FFFFFF00DEDE
      DE00CECECE00CECECE00CECECE00FFFFFF00FFFFFF00FFFFFF00CECECE00CECE
      CE0000000000000000000000000000000000CC666600FFCCCC00FFCCCC00FFCC
      CC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCC
      CC00FFCCCC00FFCCCC00FFCCCC00CC66660099999900CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC009999990084848400FFFFFF00FFFFFF00FFFF
      FF00DEDEDE00CECECE00CECECE00007B0000007B0000007B0000CECECE00CECE
      CE000000000084848400000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00DEDEDE00CECECE00CECECE00848484008484840084848400CECECE00CECE
      CE0000000000848484000000000000000000CC666600FFFFFF00FFFFFF00FFCC
      CC00FFFFFF00FFFFFF00FFCCCC00FFFFFF00FFFFFF00FFCCCC00FFFFFF00FFFF
      FF00FFCCCC00FFFFFF00FFFFFF00CC66660099999900FFFFFF00FFFFFF00CCCC
      CC00FFFFFF00FFFFFF00CCCCCC00FFFFFF00FFFFFF00CCCCCC00FFFFFF00FFFF
      FF00CCCCCC00FFFFFF00FFFFFF00999999008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000008484840084848400000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840000000000848484008484840000000000CC666600FFFFFF00FFFFFF00FFCC
      CC00FFFFFF00FFFFFF00FFCCCC00FFFFFF00FFFFFF00FFCCCC00FFFFFF00FFFF
      FF00FFCCCC00FFFFFF00FFFFFF00CC66660099999900FFFFFF00FFFFFF00CCCC
      CC00FFFFFF00FFFFFF00CCCCCC00FFFFFF00FFFFFF00CCCCCC00FFFFFF00FFFF
      FF00CCCCCC00FFFFFF00FFFFFF009999990084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DEDEDE00DEDEDE00CECECE00CECECE00CECECE000000
      00008484840000000000848484000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DEDEDE00DEDEDE00CECECE00CECECE00CECECE000000
      000084848400000000008484840000000000CC666600FFCCCC00FFCCCC000000
      9900000099000000990000009900FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCC
      CC00FFCCCC00FFCCCC00FFCCCC00CC66660099999900CCCCCC00CCCCCC009999
      9900999999009999990099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00999999000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000008484840000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840000000000848484000000000000000000CC666600FFFFFF00FFFFFF000000
      9900FFFFFF00FFFFFF0000009900FFFFFF00FFFFFF00FFCCCC00FFFFFF00FFFF
      FF00FFCCCC00FFFFFF00FFFFFF00CC66660099999900FFFFFF00FFFFFF009999
      9900FFFFFF00FFFFFF0099999900FFFFFF00FFFFFF00CCCCCC00FFFFFF00FFFF
      FF00CCCCCC00FFFFFF00FFFFFF0099999900000000000000000084848400CECE
      CE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000084848400000000008484840000000000000000000000000084848400CECE
      CE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000084848400000000008484840000000000CC666600FFFFFF00FFFFFF000000
      9900FFFFFF00FFFFFF0000009900FFFFFF00FFFFFF00FFCCCC00FFFFFF00FFFF
      FF00FFCCCC00FFFFFF00FFFFFF00CC66660099999900FFFFFF00FFFFFF009999
      9900FFFFFF00FFFFFF0099999900FFFFFF00FFFFFF00CCCCCC00FFFFFF00FFFF
      FF00CCCCCC00FFFFFF00FFFFFF00999999000000000000000000000000008484
      8400FFFFFF00FF312900FF312900FF312900FF312900FF312900FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF008484840084848400848484008484840084848400FFFFFF000000
      000000000000000000000000000000000000CC666600FFCCCC00FFCCCC000000
      9900000099000000990000009900FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCC
      CC00FFCCCC00FFCCCC00FFCCCC00CC66660099999900CCCCCC00CCCCCC009999
      9900999999009999990099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00999999000000000000000000000000008484
      8400CECECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CECE
      CE00000000000000000000000000000000000000000000000000000000008484
      8400CECECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CECE
      CE0000000000000000000000000000000000CC666600FFFFFF00FFFFFF00FFCC
      CC00FFFFFF00FFFFFF00FFCCCC00FFFFFF00FFFFFF00FFCCCC00FFFFFF00FFFF
      FF00FFCCCC00FFFFFF00FFFFFF00CC66660099999900FFFFFF00FFFFFF00CCCC
      CC00FFFFFF00FFFFFF00CCCCCC00FFFFFF00FFFFFF00CCCCCC00FFFFFF00FFFF
      FF00CCCCCC00FFFFFF00FFFFFF00999999000000000000000000000000000000
      000084848400FFFFFF00FF632900FF632900FF632900FF632900FF632900FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF008484840084848400848484008484840084848400FFFF
      FF0000000000000000000000000000000000CC666600FFFFFF00FFFFFF00FFCC
      CC00FFFFFF00FFFFFF00FFCCCC00FFFFFF00FFFFFF00FFCCCC00FFFFFF00FFFF
      FF00FFCCCC00FFFFFF00FFFFFF00CC66660099999900FFFFFF00FFFFFF00CCCC
      CC00FFFFFF00FFFFFF00CCCCCC00FFFFFF00FFFFFF00CCCCCC00FFFFFF00FFFF
      FF00CCCCCC00FFFFFF00FFFFFF00999999000000000000000000000000000000
      000084848400CECECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CECECE000000000000000000000000000000000000000000000000000000
      000084848400CECECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CECECE00000000000000000000000000CC666600FFCCCC00CC666600CC66
      6600FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCCCC00FFCC
      CC00CC666600CC666600FFCCCC00CC66660099999900CCCCCC00999999009999
      9900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC009999990099999900CCCCCC00999999000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484008484
      840084848400848484000000000000000000CC666600FFCCCC00FFCCCC00FFCC
      CC00FFCCCC00FFCCCC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFCCCC00FFCC
      CC00FFCCCC00FFCCCC00FFCCCC00CC66660099999900CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00999999000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CC666600CC666600CC666600CC66
      6600CC666600CC666600CC666600CC666600CC666600CC666600CC666600CC66
      6600CC666600CC666600CC666600CC6666009999990099999900999999009999
      9900999999009999990099999900999999009999990099999900999999009999
      9900999999009999990099999900999999000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000993300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000999999000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009933000099330000993300009933000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009999990099999900999999009999990099999900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099330000CC6600009933000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099999900CCCCCC009999990000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC0099999900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC0099999900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC0099999900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000099330000CC660000CC660000CC660000CC660000CC660000993300000000
      0000000000000000000000000000000000000000000000000000000000000000
      000099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00999999000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC0099999900000000000000
      0000000000000000000000000000000000000000000000000000000000009933
      0000CC660000CC660000CC660000CC660000CC660000CC660000CC6600009933
      0000000000000000000000000000000000000000000000000000000000009999
      9900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC009999
      9900000000000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC0099999900000000000000
      000000000000000000000000000000000000000000000000000099330000CC66
      0000CC660000CC660000CC660000CC660000CC660000CC660000CC660000CC66
      000099330000000000000000000000000000000000000000000099999900CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00999999000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC0099999900000000000000
      000000000000000000000000000000000000000000000000000099330000CC66
      0000CC660000CC660000CC660000CC660000CC660000CC660000CC660000CC66
      000099330000000000000000000000000000000000000000000099999900CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00999999000000000000000000000000000000000000000000993300009933
      00009933000099330000CC660000CC660000CC66000099330000993300009933
      0000993300000000000000000000000000000000000000000000999999009999
      99009999990099999900CCCCCC00CCCCCC00CCCCCC0099999900999999009999
      9900999999000000000000000000000000000000000000000000993300009933
      00009933000099330000CC660000CC660000CC66000099330000993300009933
      0000993300000000000000000000000000000000000000000000999999009999
      99009999990099999900CCCCCC00CCCCCC00CCCCCC0099999900999999009999
      990099999900000000000000000000000000000000000000000099330000CC66
      0000CC660000CC660000CC660000CC660000CC660000CC660000CC660000CC66
      000099330000000000000000000000000000000000000000000099999900CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00999999000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC0099999900000000000000
      000000000000000000000000000000000000000000000000000099330000CC66
      0000CC660000CC660000CC660000CC660000CC660000CC660000CC660000CC66
      000099330000000000000000000000000000000000000000000099999900CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00999999000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC0099999900000000000000
      0000000000000000000000000000000000000000000000000000000000009933
      0000CC660000CC660000CC660000CC660000CC660000CC660000CC6600009933
      0000000000000000000000000000000000000000000000000000000000009999
      9900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC009999
      9900000000000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC0099999900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000099330000CC660000CC660000CC660000CC660000CC660000993300000000
      0000000000000000000000000000000000000000000000000000000000000000
      000099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00999999000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC0099999900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC0099999900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC0099999900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099330000CC6600009933000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099999900CCCCCC009999990000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009933000099330000993300009933000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009999990099999900999999009999990099999900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000993300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000999999000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A58C7B004A2918004A29
      18004A2918004A2918004A2918004A2918004A2918004A2918004A2918004A29
      18004A2918004A291800000000000000000000000000A58C7B004A2918004A29
      18004A2918004A2918004A2918004A2918004A2918004A2918004A2918004A29
      18004A2918004A29180000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      CE000094FF000000CE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004A4A
      4A00CECECE005A5A5A00000000000000000000000000A58C7B00EFDEDE00A58C
      7B00A58C7B00A58C7B00A58C7B00186B1800186B1800186B1800186B1800186B
      1800186B1800186B1800186B1800186B180000000000A58C7B00EFDEDE00A58C
      7B00A58C7B00A58C7B00A58C7B00A58C7B00A58C7B00A58C7B00A58C7B00A58C
      7B00A58C7B00A58C7B00A58C7B00A58C7B000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000CE000094
      FF000000FF000000CE0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004A4A4A00CECE
      CE00848484005A5A5A00000000000000000000000000A58C7B00EFE7DE00EFDE
      DE00E7DED600E7D6CE00DECEC600186B1800FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00186B180000000000A58C7B00EFE7DE00EFDE
      DE00E7DED600E7D6CE00DECEC600A58C7B00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A58C7B000000000000000000000000000000
      000000000000000000000000000000000000000000000000CE000094FF000000
      FF000000CE000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004A4A4A00CECECE008484
      84005A5A5A0000000000000000000000000000000000A58C7B00F7EFE700EFE7
      DE00EFDEDE00E7DED600E7D6CE00186B1800FFFFFF00186B1800186B1800FFFF
      FF0029843900186B1800186B1800186B180000000000A58C7B00F7EFE700EFE7
      DE00EFDEDE00E7DED600E7D6CE00A58C7B00FFFFFF00A58C7B00A58C7B00FFFF
      FF00A58C7B00A58C7B00A58C7B00A58C7B000000000000000000000000000000
      000000000000000000000000000000000000000000000094FF000000FF000000
      CE00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CECECE00848484005A5A
      5A000000000000000000000000000000000000000000A58C7B00F7EFEF00F7EF
      E700EFE7DE00EFDEDE00E7DED600186B1800FFFFFF0029843900186B1800186B
      1800186B1800186B1800FFFFFF00186B180000000000A58C7B00F7EFEF00F7EF
      E700EFE7DE00EFDEDE00E7DED600A58C7B00FFFFFF00A58C7B00A58C7B00A58C
      7B00A58C7B00A58C7B00FFFFFF00A58C7B000000000000000000848484000000
      0000CE940000CE940000CE9400009463290094632900000000000000CE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000ADB5AD00ADB5AD00ADB5AD008484840084848400000000005A5A5A000000
      00000000000000000000000000000000000000000000A58C7B00F7F7F700F7EF
      EF00F7EFE700EFE7DE00EFDEDE00186B1800FFFFFF00FFFFFF0029843900186B
      1800186B1800FFFFFF00FFFFFF00186B180000000000A58C7B00F7F7F700F7EF
      EF00F7EFE700EFE7DE00EFDEDE00A58C7B00FFFFFF00FFFFFF00A58C7B00A58C
      7B00A58C7B00FFFFFF00FFFFFF00A58C7B000000000084848400ADB5AD00FFCE
      2900FFCE2900FFCE2900FFCE2900CE940000CE94000094632900000000000000
      0000000000000000000000000000000000000000000084848400ADB5AD00BDBD
      BD00BDBDBD00BDBDBD00ADB5AD00ADB5AD00ADB5AD0084848400000000000000
      00000000000000000000000000000000000000000000A58C7B00FFFFFF00F7F7
      F700F7EFEF00F7EFE700EFE7DE00186B1800FFFFFF0029843900186B1800186B
      1800186B1800186B1800FFFFFF00186B180000000000A58C7B00FFFFFF00F7F7
      F700F7EFEF00F7EFE700EFE7DE00A58C7B00FFFFFF00A58C7B00A58C7B00A58C
      7B00A58C7B00A58C7B00FFFFFF00A58C7B000000000084848400FFFF9400FFFF
      9400FFFF9400FFCE9400FFCE2900FFCE2900CE940000CE940000000000000000
      0000000000000000000000000000000000000000000084848400CECECE00CECE
      CE00CECECE00CECECE00BDBDBD00ADB5AD00ADB5AD00ADB5AD00000000000000
      00000000000000000000000000000000000000000000A58C7B00FFFFFF00FFFF
      FF00F7F7F700F7EFEF00F7EFE700186B1800FFFFFF00186B1800186B1800FFFF
      FF0029843900186B1800186B1800186B180000000000A58C7B00FFFFFF00FFFF
      FF00F7F7F700F7EFEF00F7EFE700A58C7B00FFFFFF00A58C7B00A58C7B00FFFF
      FF00A58C7B00A58C7B00A58C7B00A58C7B0084848400FFCE9400FFFF9400FFFF
      9400FFFF9400FFFF9400FFFF9400FFCE2900FFCE2900CE940000946329000000
      00000000000000000000000000000000000084848400ADB5AD00DEDEDE00DEDE
      DE00DEDEDE00CECECE00CECECE00BDBDBD00ADB5AD00ADB5AD00848484000000
      00000000000000000000000000000000000000000000A58C7B00FFFFFF00FFFF
      FF00FFFFFF00FFF7F700F7F7EF00186B1800FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00186B180000000000A58C7B00FFFFFF00FFFF
      FF00FFFFFF00FFF7F700F7F7EF00A58C7B00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A58C7B0084848400FFCE9400FFFFCE00FFFF
      CE00FFFFCE00FFFF9400FFFF9400FFFF9400FFCE2900CE940000CE9400000000
      00000000000000000000000000000000000084848400CECECE00FFFFFF00FFFF
      FF00DEDEDE00DEDEDE00CECECE00CECECE00BDBDBD00ADB5AD00ADB5AD000000
      00000000000000000000000000000000000000000000A58C7B00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF7F700186B1800186B1800186B1800186B1800186B
      1800186B1800186B1800186B1800186B180000000000A58C7B00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF7F700A58C7B00A58C7B00A58C7B00A58C7B00A58C
      7B00A58C7B00A58C7B00A58C7B00A58C7B0084848400FFCE9400FFFFFF00FFFF
      FF00FFFFCE00FFFFCE00FFFF9400FFFF9400FFCE9400FFCE2900CE9400000000
      00000000000000000000000000000000000084848400CECECE00FFFFFF00FFFF
      FF00FFFFFF00DEDEDE00DEDEDE00CECECE00CECECE00BDBDBD00ADB5AD000000
      00000000000000000000000000000000000000000000A58C7B00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7F700F7F7EF00F7EFEF00EFE7E700A58C
      7B00A58C7B004A291800000000000000000000000000A58C7B00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7F700F7F7EF00F7EFEF00EFE7E700A58C
      7B00A58C7B004A291800000000000000000084848400ADB5AD00FFFFFF00FFFF
      FF00FFFFFF00FFFFCE00FFFFCE00FFFF9400FFFF9400FFCE2900CE9400000000
      00000000000000000000000000000000000084848400ADB5AD00CECECE00FFFF
      FF00FFFFFF00FFFFFF00DEDEDE00DEDEDE00CECECE00BDBDBD00848484000000
      00000000000000000000000000000000000000000000A58C7B00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700F7F7EF00A58C7B004A29
      18004A2918004A291800000000000000000000000000A58C7B00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700F7F7EF00A58C7B004A29
      18004A2918004A29180000000000000000000000000084848400FFCE9400FFFF
      FF00FFFFFF00FFFFFF00FFFFCE00FFFF9400FFFF9400FFCE2900000000000000
      0000000000000000000000000000000000000000000084848400CECECE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DEDEDE00CECECE00ADB5AD00000000000000
      00000000000000000000000000000000000000000000A58C7B00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700A58C7B00EFE7
      DE00D6BDAD004A291800000000000000000000000000A58C7B00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700A58C7B00EFE7
      DE00D6BDAD004A29180000000000000000000000000084848400ADB5AD00FFCE
      9400FFFFFF00FFFFFF00FFFFCE00FFFF9400FFCE9400CE942900000000000000
      0000000000000000000000000000000000000000000084848400ADB5AD00CECE
      CE00CECECE00FFFFFF00FFFFFF00DEDEDE00ADB5AD0084848400000000000000
      00000000000000000000000000000000000000000000A58C7B00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A58C7B00D6BD
      AD004A29180000000000000000000000000000000000A58C7B00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A58C7B00D6BD
      AD004A2918000000000000000000000000000000000000000000848484008484
      8400ADB5AD00FFCE9400FFCE9400FFCE94008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400ADB5AD00CECECE00CECECE00CECECE008484840000000000000000000000
      00000000000000000000000000000000000000000000A58C7B00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A58C7B004A29
      18000000000000000000000000000000000000000000A58C7B00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A58C7B004A29
      1800000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484000000000000000000000000000000
      00000000000000000000000000000000000000000000A58C7B00A58C7B00A58C
      7B00A58C7B00A58C7B00A58C7B00A58C7B00A58C7B00A58C7B00A58C7B000000
      00000000000000000000000000000000000000000000A58C7B00A58C7B00A58C
      7B00A58C7B00A58C7B00A58C7B00A58C7B00A58C7B00A58C7B00A58C7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CEB5A5006B42
      31006B4231006B4231006B4231006B4231006B4231006B4231006B4231006B42
      31006B4231006B4231006B423100000000000000000000000000CEB5A5006B42
      31006B4231006B4231006B4231006B4231006B4231006B4231006B4231006B42
      31006B4231006B4231006B423100000000000000000000000000000094000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A0000000000000000000000000000000000CEB5A500EFE7
      E700B5A59400B5A59400B5A59400B5A59400B5A59400B5A59400B5A59400B5A5
      9400B5A59400B5A594006B423100000000000000000000000000CEB5A500EFE7
      E700B5A59400B5A59400B5A59400B5A59400B5A59400B5A59400B5A59400B5A5
      9400B5A59400B5A594006B42310000000000000000002931CE000000FF000000
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CEB5A500F7EF
      E700EFE7E700EFE7DE00EFDEDE00E7DED600E7D6CE00E7D6CE00DECEC600DECE
      BD00DECEBD00B5A594006B423100000000000000000000000000CEB5A500F7EF
      E700EFE7E700EFE7DE00EFDEDE00E7DED600E7D6CE00E7D6CE00DECEC600DECE
      BD00DECEBD00B5A594006B42310000000000000000002931CE002994FF000000
      FF00000094000000000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000084848400FFFFFF008484
      8400000000000000000000000000000000000000000000000000000000000000
      00004A4A4A000000000000000000000000000000000000000000CEB5A500F7EF
      EF00F7EFE700009C0000EFE7DE0042B5390042B5390073C66B00E7D6CE00DECE
      C600DECEBD00B5A594006B423100000000000000000000000000CEB5A500F7EF
      EF00F7EFE700C6C6C600EFE7DE00C6C6C600C6C6C600C6C6C600E7D6CE00DECE
      C600DECEBD00B5A594006B4231000000000000000000000000002931CE000063
      FF000000CE000000000000000000000000000000000000000000000000000000
      FF0000000000000000000000000000000000000000000000000084848400CECE
      CE00000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000CEB5A500F7F7
      F700F7EFEF00009C0000009C0000009C0000009C0000009C000073C66B00E7D6
      CE00DECEC600B5A594006B423100000000000000000000000000CEB5A500F7F7
      F700F7EFEF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600E7D6
      CE00DECEC600B5A594006B423100000000000000000000000000000000000000
      CE000000FF0000009400000000000000000000000000000000000000FF000000
      9400000000000000000000000000000000000000000000000000000000008484
      8400CECECE000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000CEB5A500FFF7
      F700F7F7F700009C00004ACE8400009C0000EFE7DE00EFDEDE00009C000073C6
      6B00E7D6CE00B5A594006B423100000000000000000000000000CEB5A500FFF7
      F700F7F7F700C6C6C600C6C6C600C6C6C600EFE7DE00EFDEDE00C6C6C600C6C6
      C600E7D6CE00B5A594006B423100000000000000000000000000000000000000
      00000000CE000000FF000000940000000000000000000000FF00000094000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000CEB5A500FFFF
      FF00FFF7F700009C0000009C0000009C0000009C0000EFE7DE00EFDEDE00009C
      0000E7D6CE00B5A594006B423100000000000000000000000000CEB5A500FFFF
      FF00FFF7F700C6C6C600C6C6C600C6C6C600C6C6C600EFE7DE00EFDEDE00C6C6
      C600E7D6CE00B5A594006B423100000000000000000000000000000000000000
      0000000000000000CE000000FF00000094000000FF0000009400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000CEB5A500FFFF
      FF00FFFFFF00FFF7F700F7F7F700F7EFEF00F7EFE700EFE7E700EFE7DE00EFDE
      DE00E7DED600B5A594006B423100000000000000000000000000CEB5A500FFFF
      FF00FFFFFF00FFF7F700F7F7F700F7EFEF00F7EFE700EFE7E700EFE7DE00EFDE
      DE00E7DED600B5A594006B423100000000000000000000000000000000000000
      000000000000000000000000CE000000FF000000940000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CEB5A500FFFF
      FF00009C0000FFFFFF00FFFFFF00009C0000009C0000009C0000009C0000EFE7
      DE00EFE7DE00B5A594006B423100000000000000000000000000CEB5A500FFFF
      FF00C6C6C600FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600EFE7
      DE00EFE7DE00B5A594006B423100000000000000000000000000000000000000
      0000000000000000CE000000FF00000094000000CE0000009400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000CEB5A500FFFF
      FF00BDDEB500009C0000FFFFFF00FFFFFF00009C00004ACE8400009C0000EFEF
      E700EFE7DE00B5A594006B423100000000000000000000000000CEB5A500FFFF
      FF00C6C6C600C6C6C600FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C600EFEF
      E700EFE7DE00B5A594006B423100000000000000000000000000000000000000
      00000000CE000000FF000000940000000000000000000000CE00000094000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400CECECE0000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000CEB5A500FFFF
      FF00FFFFFF00BDDEB500009C0000009C0000009C0000009C0000009C0000F7EF
      EF00D6BDB500B5A594006B423100000000000000000000000000CEB5A500FFFF
      FF00FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600F7EF
      EF00D6BDB500B5A594006B4231000000000000000000000000000000CE000000
      FF000000FF0000009400000000000000000000000000000000000000CE000000
      9400000000000000000000000000000000000000000000000000848484008484
      8400CECECE000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000CEB5A500FFFF
      FF00FFFFFF00FFFFFF00BDDEB50042B5390042B53900FFFFFF00009C0000CEB5
      A5006B4231006B4231006B423100000000000000000000000000CEB5A500FFFF
      FF00FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C600FFFFFF00C6C6C600CEB5
      A5006B4231006B4231006B42310000000000000000000000CE002994FF000000
      FF00000094000000000000000000000000000000000000000000000000000000
      CE00000094000000000000000000000000000000000084848400FFFFFF00CECE
      CE00000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000CEB5A500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CEB5
      A500F7EFE700DECEBD006B423100000000000000000000000000CEB5A500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CEB5
      A500F7EFE700DECEBD006B4231000000000000000000636394000000CE006363
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000CE0000000000000000000000000084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A0000000000000000000000000000000000CEB5A500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CEB5
      A500DECEBD006B42310000000000000000000000000000000000CEB5A500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CEB5
      A500DECEBD006B42310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CEB5A500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CEB5
      A5006B4231000000000000000000000000000000000000000000CEB5A500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CEB5
      A5006B4231000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CEB5A500CEB5
      A500CEB5A500CEB5A500CEB5A500CEB5A500CEB5A500CEB5A500CEB5A500CEB5
      A500000000000000000000000000000000000000000000000000CEB5A500CEB5
      A500CEB5A500CEB5A500CEB5A500CEB5A500CEB5A500CEB5A500CEB5A500CEB5
      A500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600000000000084840000000000000000000000000084848400848484008484
      84004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A00ADB5AD00ADB5
      AD004A4A4A008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000C6C6C600C6C6
      C60000000000008484000000000000000000000000008484840084848400ADB5
      AD0063636300636363004A4A4A004A4A4A004A4A4A004A4A4A00CECECE00ADB5
      AD004A4A4A008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600000000000084840000000000000000000000000084848400ADB5AD00ADB5
      AD00636363006363630063636300636363004A4A4A004A4A4A00FFFFFF00ADB5
      AD004A4A4A008484840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF63
      2900FFFF94000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400CECECE000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000084848400ADB5AD00ADB5
      AD00636363006363630063636300636363006363630063636300636363006363
      63004A4A4A00848484000000000000000000FF632900FFCE2900FFCE2900FFCE
      2900FFCE2900000000000000000000000000000000000000000000000000FF63
      2900FFFF9400FFCE2900000000000000000084848400ADB5AD00ADB5AD00ADB5
      AD00ADB5AD000000000000000000000000000000000000000000000000008484
      8400CECECE00ADB5AD0000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000000084848400CECECE00ADB5
      AD00ADB5AD00ADB5AD00ADB5AD00ADB5AD00ADB5AD00ADB5AD00ADB5AD00ADB5
      AD00ADB5AD00848484000000000000000000FF632900FFFFCE00FFFFCE00FFCE
      2900000000000000000000000000000000000000000000000000000000000000
      0000FF632900FFFF9400000000000000000084848400DEE7DE00CECECE00CECE
      CE00000000000000000000000000000000000000000000000000000000000000
      000084848400CECECE0000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000008484000084840000000000000000000000000084848400CECECE00ADB5
      AD005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A
      5A00ADB5AD00ADB5AD000000000000000000FF632900FFFFCE00FFFFCE00FFFF
      9400000000000000000000000000000000000000000000000000000000000000
      0000FF632900FFFF9400000000000000000084848400FFFFFF00FFFFFF00CECE
      CE00000000000000000000000000000000000000000000000000000000000000
      000084848400CECECE0000000000000000000000000000000000008484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600000000000084840000000000000000000000000084848400CECECE008484
      8400DEDEDE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE005A5A5A00ADB5AD000000000000000000FF632900FFFFFF0000000000FFFF
      9400FFCE29000000000000000000000000000000000000000000000000000000
      0000FF632900FFFF9400000000000000000084848400FFFFFF0000000000FFFF
      FF00ADB5AD000000000000000000000000000000000000000000000000000000
      000084848400CECECE0000000000000000000000000000000000008484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600000000000084840000000000000000000000000084848400CECECE008484
      8400DEE7DE00DEDEDE00DEDEDE00CECECE00CECECE00CECECE00CECECE00CECE
      CE005A5A5A00ADB5AD000000000000000000FF6329000000000000000000FF63
      2900FFFF9400FFCE290000000000000000000000000000000000000000000000
      0000FFCE2900FFFF940000000000000000008484840000000000000000008484
      8400FFFFFF00ADB5AD0000000000000000000000000000000000000000000000
      0000BDBDBD00ADB5AD0000000000000000000000000000000000008484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600000000000084840000000000000000000000000084848400DEE7DE008484
      8400FFFFFF00DEE7DE00DEE7DE00DEDEDE00DEDEDE00DEDEDE00CECECE00CECE
      CE005A5A5A00ADB5AD000000000000000000FF63290000000000000000000000
      0000FF632900FFFF9400FFFF9400FFCE2900000000000000000000000000FFCE
      2900FFFF94000000000000000000000000008484840000000000000000000000
      000084848400FFFFFF00CECECE00ADB5AD00000000000000000000000000ADB5
      AD00CECECE000000000000000000000000000000000000000000008484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600000000000084840000000000000000000000000084848400DEE7DE008484
      8400FFFFFF00FFFFFF00FFFFFF00DEE7DE00DEE7DE00DEE7DE00DEDEDE00CECE
      CE005A5A5A00ADB5AD0000000000000000000000000000000000000000000000
      000000000000FF632900FF632900FFFF9400FFFF9400FFFF9400FFFF9400FFFF
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400DEE7DE00FFFFFF00FFFFFF00DEE7DE00CECE
      CE00000000000000000000000000000000000000000000000000008484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600000000000000000000000000000000000000000084848400FFFFFF008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEE7DE00DEE7DE00DEDE
      DE005A5A5A008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000FF632900FF632900FF632900FF632900FF63
      2900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000008484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C60000000000C6C6C60000000000000000000000000084848400FFFFFF008484
      8400CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE005A5A5A00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE000000000000000000000000000000000000000000000000008484
      8400CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE0000000000000000000000000084848400CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE000000
      00000000000000000000000000000000000084848400CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400CEFFFF00FFFFFF0094FFFF00FFFFFF0094FFFF00FFFFFF0094FFFF00FFFF
      FF00CECECE000000000000000000000000000000000000000000000000008484
      8400FFFFFF00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00CECECE0000000000000000000000000084848400FFFFFF00FF000000FF00
      000094FFFF00FF000000FF000000FF000000FF000000FF000000CECECE000000
      00000000000000000000000000000000000084848400FFFFFF00636363006363
      6300DEDEDE006363630063636300636363006363630063636300CECECE000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF0094FFFF00FFFFFF0094FFFF00FFFFFF0094FFFF00FFFFFF0094FF
      FF00CECECE000000000000000000000000000000000000000000000000008484
      8400FFFFFF00DEE7DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00CECECE0000000000000000000000000084848400FFFFFF00FFFFFF0094FF
      FF00FFFFFF0094FFFF00FFFFFF0094FFFF00FFFFFF0094FFFF00CECECE000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00CECECE000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF0094FFFF00FFFFFF0094FFFF00FFFFFF0094FFFF00FFFF
      FF00CECECE000000000000000000000000000000000000000000000000008484
      8400FFFFFF00DEE7DE00DEE7DE00DEE7DE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00CECECE0000000000000000000000000084848400FFFFFF00FF632900FF63
      290094FFFF00FF632900FF632900FF632900FF632900FF632900CECECE000000
      00000000000000000000000000000000000084848400FFFFFF00636363006363
      6300FFFFFF006363630063636300636363006363630063636300CECECE000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF0094FFFF00FFFFFF0094FFFF00FFFFFF0094FFFF00FFFFFF0094FF
      FF00CECECE000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00DEE7DE00DEE7DE00DEE7DE00DEDEDE00DEDEDE00DEDE
      DE00CECECE0000000000000000000000000084848400FFFFFF00FFFFFF0094FF
      FF00FFFFFF0094FFFF00FFFFFF0094FFFF00FFFFFF0094FFFF00CECECE000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDE00DEDEDE00CECECE000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF0094FFFF00FFFFFF0094FFFF00FFFFFF0094FFFF00FFFF
      FF00CECECE000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEE7DE00DEE7DE00DEDEDE00DEDE
      DE00CECECE0000000000000000000000000084848400FFFFFF00CECECE00CECE
      CE0094FFFF00FFFFFF0094FFFF00CECECE0000000000CECECE00CECECE000000
      00000000000000000000000000000000000084848400FFFFFF00CECECE00CECE
      CE00FFFFFF00FFFFFF00FFFFFF00CECECE0000000000CECECE00CECECE000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF0094FFFF00FFFFFF0094FFFF00FFFFFF0094FF
      FF00CECECE000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEE7DE00DEE7DE00DEDE
      DE00CECECE0000000000000000000000000084848400FFFFFF00000000000000
      0000CECECE0094FFFF00CECECE000000000094CECE0000000000CECECE000000
      00000000000000000000000000000000000084848400FFFFFF00000000000000
      0000CECECE00FFFFFF00CECECE0000000000BDBDBD0000000000CECECE000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF0094FFFF00FFFFFF0094FFFF00CECE
      CE00CECECE000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEE7DE00CECE
      CE00CECECE0000000000000000000000000084848400FFFFFF0063949400CEFF
      FF0000000000CECECE000000000094CECE002963630094CECE00000000000000
      00000000000000000000000000000000000084848400FFFFFF0084848400BDBD
      BD0000000000CECECE0000000000BDBDBD0084848400BDBDBD00000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0094FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF006394
      9400CEFFFF000000000094CECE002963630094CECE0029636300639494006394
      94006394940000000000FF632900FF63290084848400FFFFFF00FFFFFF008484
      8400BDBDBD0000000000BDBDBD0084848400BDBDBD0084848400848484008484
      8400848484000000000084848400848484000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFF
      FF00000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FFFF
      FF00000000000000000000000000000000008484840084848400848484008484
      840063949400CEFFFF000000000094CECE002963630094CECE0094CECE0094CE
      CE006394940063949400FF942900FF9429008484840084848400848484008484
      840084848400BDBDBD0000000000BDBDBD0084848400CECECE00CECECE00CECE
      CE008484840084848400ADB5AD00ADB5AD000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000063949400CEFFFF0000000000CEFFFF00CEFFFF0094CECE0094CE
      CE0094CECE0094CECE00FFCE2900FFCE29000000000000000000000000000000
      00000000000084848400BDBDBD0000000000DEDEDE00DEDEDE00DEDEDE00CECE
      CE00CECECE00ADB5AD00DEDEDE00DEDEDE000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000063949400FFFFFF00FFFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF0063949400FFFF9400FFFF94000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE0084848400FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000639494006394940063949400639494006394
      94006394940000000000FF632900FF6329000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400848484008484
      8400848484000000000084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000E00000000100010000000000000700000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FFFF000000000000
      FCFF000000000000F87F000000000000F03F000000000000E01F000000000000
      C10F000000000000C387000000000000C0C7000000000000F87F000000000000
      F03F000000000000E01F000000000000C10F000000000000C387000000000000
      C7C7000000000000FFFF000000000000FC01FC01FFFFFFFFFC01FC01F0FFF807
      FC01FC01E07FF007FC01FC01C07FE003FC01FC01C001E00380018001C000E003
      800180018000C003800180018000C001800380038000C001800780078000C001
      800F800F8000C001803F803F8000C003803F803FC000E007807F817FC001E007
      80FF80FFC0FFE00781FF81FFE1FFF01FFFFFFFFFF9FFF9FFFFFFFFFFF1FFF1FF
      001F001FE000E000001F001FC000C000001F001F80008000001F001F00000000
      001F001F80008000000F000FC000C000000F000FE000E00000010001F000F000
      00010001F000F00000010001F000F00080018001F000F000C08FC08FF000F000
      FF8FFF8FF000F000FFFFFFFFF000F000FFFFFFFFFFFFFFFFC000C000FFFFFFFF
      80008000001F001F80008000001F001F80008000001F001F80008000001F001F
      80008000001F001F80008000001F001F80008000001F001F8000800000010001
      00000000000100010001000100010001803F803F80018001C03FC03FC0FFC0FF
      E7FFE7FFFFFFFFFFF7FFF7FFFFFFFFFFFF07FF07FFFFFFFFFF03FF03C000C000
      0100010080008000F800F80080008000E800E80080008000E000E00080008000
      E000E00080008000000000008000800000000000000000000000000000000000
      00000000000000000000000000010001E000E00000FF00FFE000E00001FF01FF
      E800E800F3FFF3FFF800F800F7FFF7FFFFFFFFFFFFFFFFFFF9FFF1FF001F001F
      F9FFF1FF000F000FF3C7F3C70007000773C763C70003000327FF27FF00010001
      07C707C70000000000C700C7001F001F01E301E3001F001F03F103F1001F001F
      063806388FF18FF10E380E38FFF9FFF91E381E38FF75FF753F013F01FF8FFF8F
      7F837F83FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      F8FFF8FFC71FC71FF87FF87FC30FC30FF83FF83FC107C107F81FF81FC003C003
      F80FF80FC001C001F80FF807C001C001F80FF80FC001C001F81FF81FC003C003
      F83FF83FC107C107F87FF87FC30FC30FF8FFF8FFC71FC71FFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      F8E3F8E3FF1FFF1FF0C3F0C3FE1FFE1FE083E083FC1FFC1FC003C003F81FF81F
      80038003F01FF01F80038003F01FF01F80038003F01FF01FC003C003F81FF81F
      E083E083FC1FFC1FF0C3F0C3FE1FFE1FF8E3F8E3FF1FFF1FFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC007C00700000000
      8003800300000000000100010000000000010001000000000001000100000000
      000000000000000000000000000000008000800000000000C000C00000000000
      E001E00100000000E007E00700000000F007F00700000000F003F00300000000
      F803F80300000000FFFFFFFF00000000FFFFFFFFFFFFFFFFFEFFFEFFF83FF83F
      FC7FFC7FF83FF83FF83FF83FF83FF83FF01FF01FF83FF83FE00FE00FF83FF83F
      C007C007F83FF83FC007C007C007C007C007C007C007C007F83FF83FC007C007
      F83FF83FE00FE00FF83FF83FF01FF01FF83FF83FF83FF83FF83FF83FFC7FFC7F
      F83FF83FFEFFFEFFFFFFFFFFFFFFFFFFFFF3FFF380038003FFE1FFE180008000
      FFC1FFC180008000FF83FF8380008000F007F00780008000C00FC00F80008000
      801F801F80008000801F801F80008000000F000F80008000000F000F80008000
      000F000F80038003000F000F80038003801F801F80038003801F801F80078007
      C03FC03F800F800FF0FFF0FF801F801FFFFFFFFFC001C001DFFBDFFBC001C001
      8FFF8FFFC001C00187F787F7C001C001C7EFC7EFC001C001E3CFE3CFC001C001
      F19FF19FC001C001F83FF83FC001C001FC7FFC7FC001C001F83FF83FC001C001
      F19FF19FC001C001C3CFC3CFC001C00187E787E7C001C0018FFB8FFBC003C003
      FFFFFFFFC007C007FFFFFFFFC00FC00FFFFFFFFFFFFFFFFFC001C001FFFFFFFF
      80018001FFFFFFFF80018001FFE3FFE38001800101E301E38001800103E103E1
      8001800107F107F18001800107F107F18001800103F103F18001800120E120E1
      800180017003700380018001F807F80780018001FE0FFE0F80018001FFFFFFFF
      80018001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE003E003000F000F
      E003E003000F000FE003E003000F000FE003E003000F000FE003E003000F000F
      E003E003000F000FE003E003000F000FE003E003000F000FE003E00300000004
      E003E00300000000E007E00700000000E00FE00FF800F800E01FE01FFC00FC00
      FFFFFFFFFE04FE04FFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object DataSource1: TDataSource
    DataSet = dtMain
    Left = 146
    Top = 337
  end
  object dtMain: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    BeforeClose = dtMainBeforeClose
    AfterScroll = dtMainAfterScroll
    OnFilterRecord = dtMainFilterRecord
    CommandText = 
      'SELECT     TOP (100) PERCENT dbo.Data0071.rkey,dbo.Data0071.IF_u' +
      'rgency,dbo.Data0017.INV_PART_NUMBER as '#26448#26009#32534#30721', '#13#10'dbo.Data0017.INV_' +
      'PART_DESCRIPTION as '#26448#26009#25551#36848', dbo.Data0002.UNIT_NAME as '#21333#20301', '#13#10'dbo.Da' +
      'ta0071.QUAN_ORD as '#37319#36141#25968#37327',dbo.Data0071.QUAN_RECD as '#24050#25509#25910#25968#37327','#13#10'dbo.Da' +
      'ta0071.QUAN_ORD - dbo.Data0071.QUAN_RECD AS  '#27424#36135#25968#37327','#13#10' dbo.Data007' +
      '1.REQ_DATE as '#35201#27714#26085#26399', dbo.Data0071.reason as '#35831#36141#21407#22240','#13#10'dbo.Data0070.P' +
      'O_NUMBER as '#37319#36141#32534#21495','#13#10'dbo.Data0068.user_name as '#20351#29992#32773', '#13#10'dbo.Data0068' +
      '.user_phone as '#20351#29992#32773#30005#35805', '#13#10'dbo.Data0034.DEPT_NAME as '#35831#36141#37096#38376', '#13#10'dbo.Da' +
      'ta0005.EMPLOYEE_NAME AS '#35831#36141#20154#21592#13#10'FROM         dbo.Data0071 INNER JO' +
      'IN'#13#10'      dbo.Data0070 ON dbo.Data0071.PO_PTR = dbo.Data0070.RKE' +
      'Y INNER JOIN'#13#10'      dbo.Data0017 ON dbo.Data0071.INVT_PTR = dbo.' +
      'Data0017.RKEY INNER JOIN'#13#10'      dbo.Data0002 ON dbo.Data0071.PUR' +
      'CHASE_UNIT_PTR = dbo.Data0002.RKEY INNER JOIN'#13#10'      dbo.Data006' +
      '8 ON dbo.Data0070.FOB = dbo.Data0068.PO_REQ_NUMBER INNER JOIN'#13#10' ' +
      '     dbo.Data0034 ON dbo.Data0068.DEPARTMENT_NAME = dbo.Data0034' +
      '.DEPT_CODE INNER JOIN'#13#10'      dbo.Data0005 ON dbo.Data0068.REQ_BY' +
      ' = dbo.Data0005.RKEY'#13#10'WHERE     (dbo.Data0017.CRITICAL_MATL_FLAG' +
      ' = 1) '#13#10'AND (dbo.Data0070.STATUS IN (1, 5)) AND '#13#10'(dbo.Data0071.' +
      'QUAN_ORD - dbo.Data0071.QUAN_RECD > 0)'#13#10'ORDER BY dbo.Data0071.RE' +
      'Q_DATE '#13#10
    Parameters = <>
    Left = 146
    Top = 289
    object dtMainrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object dtMainIF_urgency: TBooleanField
      DisplayLabel = #32039#24613
      FieldName = 'IF_urgency'
    end
    object dtMainDSDesigner: TStringField
      FieldName = #26448#26009#32534#30721
      ReadOnly = True
      Size = 25
    end
    object dtMainDSDesigner2: TStringField
      FieldName = #26448#26009#25551#36848
      ReadOnly = True
      Size = 100
    end
    object dtMainDSDesigner3: TStringField
      FieldName = #21333#20301
      ReadOnly = True
    end
    object dtMainDSDesigner4: TBCDField
      FieldName = #37319#36141#25968#37327
      ReadOnly = True
      Precision = 13
    end
    object dtMainDSDesigner5: TBCDField
      FieldName = #24050#25509#25910#25968#37327
      ReadOnly = True
      Precision = 13
    end
    object dtMainDSDesigner6: TBCDField
      FieldName = #27424#36135#25968#37327
      ReadOnly = True
      Precision = 14
    end
    object dtMainDSDesigner7: TDateTimeField
      FieldName = #35201#27714#26085#26399
      ReadOnly = True
    end
    object dtMainDSDesigner8: TStringField
      FieldName = #35831#36141#21407#22240
      ReadOnly = True
      Size = 60
    end
    object dtMainDSDesigner9: TStringField
      FieldName = #37319#36141#32534#21495
      ReadOnly = True
      Size = 15
    end
    object dtMainDSDesigner10: TStringField
      FieldName = #20351#29992#32773
      ReadOnly = True
      Size = 50
    end
    object dtMainDSDesigner11: TStringField
      FieldName = #20351#29992#32773#30005#35805
      ReadOnly = True
    end
    object dtMainDSDesigner12: TStringField
      FieldName = #35831#36141#37096#38376
      ReadOnly = True
      Size = 30
    end
    object dtMainDSDesigner13: TStringField
      FieldName = #35831#36141#20154#21592
      ReadOnly = True
      Size = 16
    end
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 146
    Top = 241
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 650
    Top = 121
  end
  object Timer2: TTimer
    Interval = 600000
    OnTimer = Timer2Timer
    Left = 650
    Top = 193
  end
  object qry0034: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select RKEY,DEPT_CODE,DEPT_NAME from data0034'
      'where ttype in (4)')
    Left = 130
    Top = 388
    object qry0034RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object qry0034DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object qry0034DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
  end
  object qry0005: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select RKEY,EMPL_CODE,EMPLOYEE_NAME from data0005')
    Left = 202
    Top = 388
    object qry0005RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object qry0005EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object qry0005EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
  end
  object dtRead: TADODataSet
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    Left = 666
    Top = 292
  end
  object qry0017: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select INV_PART_NUMBER,INV_PART_DESCRIPTION from data0017'
      'order by INV_PART_NUMBER')
    Left = 298
    Top = 388
    object qry0017INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object qry0017INV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
  end
end
