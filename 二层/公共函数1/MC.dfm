inherited MC_f: TMC_f
  Left = 321
  Top = 189
  Width = 864
  Height = 604
  Caption = 'MC_f'
  PopupMenu = MainGrid_PopupMenu
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  inherited dxStatusBar1: TdxStatusBar
    Top = 548
    Width = 856
  end
  object cxTabControl1: TcxTabControl [1]
    Left = 0
    Top = 39
    Width = 856
    Height = 509
    Align = alClient
    TabOrder = 5
    ClientRectBottom = 509
    ClientRectRight = 856
    ClientRectTop = 0
    object Splitter1: TSplitter
      Left = 0
      Top = 281
      Width = 856
      Height = 7
      Cursor = crVSplit
      Align = alTop
      Beveled = True
      Color = clBtnFace
      ParentColor = False
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 856
      Height = 5
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
    end
    object Panel2: TPanel
      Left = 0
      Top = 5
      Width = 856
      Height = 276
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      object Panel4: TPanel
        Left = 736
        Top = 0
        Width = 120
        Height = 276
        Align = alRight
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 0
        object RzToolbar2: TRzToolbar
          Left = 0
          Top = 0
          Width = 120
          Height = 276
          Align = alClient
          AutoStyle = False
          RowHeight = 28
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
            Top = 4
            Width = 111
            Height = 25
            Caption = 'btn1'
            TabOrder = 0
            Visible = False
          end
        end
      end
      object cxPageControl1: TcxPageControl
        Left = 5
        Top = 0
        Width = 731
        Height = 276
        ActivePage = cxTabSheetMain1
        Align = alClient
        TabOrder = 1
        ClientRectBottom = 276
        ClientRectRight = 731
        ClientRectTop = 23
        object cxTabSheetMain1: TcxTabSheet
          Caption = #27010#35272
          ImageIndex = 0
          object ToolBar2: TToolBar
            Left = 0
            Top = 0
            Width = 0
            Height = 253
            Align = alLeft
            Caption = 'ToolBar1'
            TabOrder = 0
            Transparent = True
          end
          object DghMain: TDBGridEh
            Left = 0
            Top = 0
            Width = 731
            Height = 253
            Align = alClient
            DataSource = dsMain
            EditActions = [geaCopyEh, geaSelectAllEh]
            FooterColor = clWindow
            FooterFont.Charset = GB2312_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -12
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
            TabOrder = 1
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            OnDrawColumnCell = DghMainDrawColumnCell
            OnEnter = DghMainEnter
            OnGetCellParams = DghMainGetCellParams
            OnKeyDown = DghMainKeyDown
            OnKeyPress = DghMainKeyPress
            OnMouseUp = DghMainMouseUp
            OnTitleClick = DghMainTitleClick
          end
        end
        object cxTabSheetMain2: TcxTabSheet
          Caption = #26126#32454
          ImageIndex = 0
          OnMouseDown = cxTabSheetMain2MouseDown
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 5
        Height = 276
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 2
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 288
      Width = 856
      Height = 221
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object Panel5: TPanel
        Left = 0
        Top = 216
        Width = 856
        Height = 5
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
      end
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 856
        Height = 216
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Panel8: TPanel
          Left = 736
          Top = 0
          Width = 120
          Height = 216
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          object RzToolbar3: TRzToolbar
            Left = 0
            Top = 0
            Width = 120
            Height = 216
            Align = alClient
            AutoStyle = False
            RowHeight = 28
            BorderInner = fsNone
            BorderOuter = fsNone
            BorderSides = [sdTop]
            BorderWidth = 0
            ParentColor = True
            TabOrder = 0
            VisualStyle = vsClassic
            ToolbarControls = (
              btn2)
            object btn2: TButton
              Left = 4
              Top = 4
              Width = 111
              Height = 25
              Caption = 'btn2'
              TabOrder = 0
              Visible = False
            end
          end
        end
        object Panel9: TPanel
          Left = 0
          Top = 0
          Width = 736
          Height = 216
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object Panel10: TPanel
            Left = 0
            Top = 211
            Width = 736
            Height = 5
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 0
          end
          object Panel11: TPanel
            Left = 0
            Top = 0
            Width = 5
            Height = 211
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 1
          end
          object cxPageControl2: TcxPageControl
            Left = 5
            Top = 0
            Width = 731
            Height = 211
            ActivePage = cxTabSheetChild1
            Align = alClient
            TabOrder = 2
            ClientRectBottom = 211
            ClientRectRight = 731
            ClientRectTop = 23
            object cxTabSheetChild1: TcxTabSheet
              Caption = #27010#35272
              ImageIndex = 0
              object ToolBar1: TToolBar
                Left = 0
                Top = 0
                Width = 0
                Height = 188
                Align = alLeft
                Caption = 'ToolBar1'
                TabOrder = 0
                Transparent = True
              end
              object dghChild: TDBGridEh
                Left = 0
                Top = 0
                Width = 731
                Height = 188
                Align = alClient
                DataSource = dsChild
                EditActions = [geaCopyEh, geaSelectAllEh]
                FooterColor = clWindow
                FooterFont.Charset = GB2312_CHARSET
                FooterFont.Color = clWindowText
                FooterFont.Height = -12
                FooterFont.Name = #23435#20307
                FooterFont.Style = []
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
                TabOrder = 1
                TitleFont.Charset = GB2312_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -12
                TitleFont.Name = #23435#20307
                TitleFont.Style = []
                OnDrawColumnCell = dghChildDrawColumnCell
                OnEnter = dghChildEnter
                OnGetCellParams = dghChildGetCellParams
                OnKeyDown = dghChildKeyDown
                OnKeyPress = dghChildKeyPress
                OnMouseUp = dghChildMouseUp
              end
            end
            object cxTabSheetChild2: TcxTabSheet
              Caption = #26126#32454
              ImageIndex = 0
              OnMouseDown = cxTabSheetChild2MouseDown
            end
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actAdd: TAction
      OnExecute = actAddExecute
    end
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
    inherited actSave: TAction
      OnExecute = actSaveExecute
    end
    inherited actCancel: TAction
      OnExecute = actCancelExecute
    end
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actRefresh: TAction
      OnExecute = actRefreshExecute
    end
    inherited actFirst: TAction
      OnExecute = actFirstExecute
    end
    inherited actPrior: TAction
      OnExecute = actPriorExecute
    end
    inherited actNext: TAction
      OnExecute = actNextExecute
    end
    inherited actLast: TAction
      OnExecute = actLastExecute
    end
    inherited actExport: TAction
      OnExecute = actExportExecute
    end
    inherited actFilter: TAction
      OnExecute = actFilterExecute
    end
    inherited actCancelFilter: TAction
      OnExecute = actCancelFilterExecute
    end
  end
  inherited dxBarManager: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    DockControlHeights = (
      0
      0
      39
      0)
    inherited tblAdd: TdxBarLargeButton
      ImageIndex = 3
    end
    inherited tblEdit: TdxBarLargeButton
      ImageIndex = 4
    end
    inherited tblReject: TdxBarLargeButton
      ImageIndex = 130
    end
    inherited tblCancelFilter: TdxBarLargeButton
      ImageIndex = 129
    end
    inherited tblFilter: TdxBarLargeButton
      ImageIndex = 128
    end
    inherited tblExpand: TdxBarLargeButton
      ImageIndex = 131
    end
  end
  inherited cdsMain: Tcds
    AfterOpen = cdsMainAfterOpen
    BeforeClose = cdsMainBeforeClose
    AfterClose = cdsMainAfterClose
    AfterInsert = cdsMainAfterInsert
    BeforeCancel = cdsMainBeforeCancel
    AfterCancel = cdsMainAfterCancel
    BeforeScroll = cdsMainBeforeScroll
    AfterScroll = cdsMainAfterScroll
    OnNewRecord = cdsMainNewRecord
    OnReconcileError = cdsMainReconcileError
    F_AutoSave = True
  end
  inherited pp_Report1: TppReport
    DataPipelineName = 'pp_DBPipeline1'
    inherited ppDetailBand1: TppDetailBand
      inherited ppDBText1: TppDBText
        DataPipelineName = 'pp_DBPipeline1'
      end
      inherited ppDBText2: TppDBText
        DataPipelineName = 'pp_DBPipeline1'
      end
    end
  end
  object dspChild: TDataSetProvider
    DataSet = dtChild
    Options = [poAutoRefresh, poPropogateChanges, poAllowCommandText]
    AfterUpdateRecord = dspChildAfterUpdateRecord
    BeforeUpdateRecord = dspChildBeforeUpdateRecord
    Left = 647
    Top = 65524
  end
  object cdsChild: Tcds
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    ObjectView = False
    Params = <>
    ProviderName = 'dspChild'
    BeforeClose = cdsChildBeforeClose
    AfterInsert = cdsChildAfterInsert
    AfterScroll = cdsChildAfterScroll
    OnNewRecord = cdsChildNewRecord
    OnReconcileError = cdsChildReconcileError
    F_UKSaveNotEdit = False
    F_AutoNumb = False
    F_AutoSave = False
    Left = 693
    Top = 65524
  end
  object MainGrid_PopupMenu: TPopupMenu
    OnPopup = MainGrid_PopupMenuPopup
    Left = 293
    Top = 192
    object N_Relogin: TMenuItem
      Caption = #37325#26032#30331#38470
      Visible = False
      OnClick = N_ReloginClick
    end
    object N_SeeLog: TMenuItem
      Caption = #26597#30475#26085#24535
      Visible = False
      OnClick = N_SeeLogClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object N_ResetColumns: TMenuItem
      Caption = #34920#26684#21015#35774#32622
      Visible = False
      OnClick = N_ResetColumnsClick
    end
    object N2: TMenuItem
      Caption = #20923#32467#21015
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #21462#28040#20923#32467
      OnClick = N3Click
    end
  end
  object dtChild: TADODataSet
    Connection = DM.ADOConnection1
    Parameters = <>
    Left = 601
    Top = 65524
  end
  object dlgOpen1: TOpenDialog
    Left = 700
    Top = 252
  end
  object dsChild: TDataSource
    DataSet = cdsChild
    OnStateChange = dsMainStateChange
    Left = 740
    Top = 65524
  end
end
