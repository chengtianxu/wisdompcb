inherited MultiDataSet_f: TMultiDataSet_f
  Left = 342
  Top = 190
  Width = 864
  Height = 604
  Caption = 'MultiDataSet_f'
  KeyPreview = True
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
      Height = 498
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Panel4: TPanel
        Left = 736
        Top = 0
        Width = 120
        Height = 498
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 0
        object RzToolbar1: TRzToolbar
          Left = 0
          Top = 0
          Width = 120
          Height = 498
          Align = alClient
          AutoStyle = False
          RowHeight = 28
          BorderInner = fsNone
          BorderOuter = fsNone
          BorderSides = [sdTop]
          BorderWidth = 0
          TabOrder = 0
          VisualStyle = vsClassic
          ToolbarControls = (
            Button1)
          object Button1: TButton
            Left = 4
            Top = 5
            Width = 110
            Height = 23
            Caption = 'Button1'
            TabOrder = 0
            Visible = False
          end
        end
      end
      object cxPageControl1: TcxPageControl
        Left = 5
        Top = 0
        Width = 731
        Height = 498
        ActivePage = cxTabSheetMain2
        Align = alClient
        TabOrder = 1
        ClientRectBottom = 498
        ClientRectRight = 731
        ClientRectTop = 23
        object cxTabSheetMain1: TcxTabSheet
          Caption = #27010#35272
          ImageIndex = 0
          object ToolBar2: TToolBar
            Left = 0
            Top = 0
            Width = 0
            Height = 475
            Align = alLeft
            Caption = 'ToolBar1'
            TabOrder = 0
            Transparent = True
          end
          object DghMain: TDBGridEh
            Left = 0
            Top = 0
            Width = 731
            Height = 475
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
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking]
            PopupMenu = MainGrid_PopupMenu
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
            OnTitleClick = DghMainTitleClick
          end
        end
        object cxTabSheetMain2: TcxTabSheet
          Caption = #26126#32454
          ImageIndex = 0
          OnMouseDown = cxTabSheetMain2MouseDown
          object dghChild: TDBGridEh
            Left = 0
            Top = 0
            Width = 731
            Height = 475
            Align = alClient
            DataSource = dsChild
            EditActions = [geaCopyEh]
            FooterColor = clWindow
            FooterFont.Charset = GB2312_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -12
            FooterFont.Name = #23435#20307
            FooterFont.Style = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
            TabOrder = 0
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = #23435#20307
            TitleFont.Style = []
            OnDrawColumnCell = dghChildDrawColumnCell
            OnEnter = dghChildEnter
            OnGetCellParams = dghChildGetCellParams
            OnKeyPress = dghChildKeyPress
            OnTitleClick = dghChildTitleClick
          end
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 5
        Height = 498
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 2
      end
    end
    object Panel5: TPanel
      Left = 0
      Top = 503
      Width = 856
      Height = 6
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
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
    BeforeOpen = cdsMainBeforeOpen
    BeforeClose = cdsMainBeforeClose
    AfterClose = cdsMainAfterClose
    BeforeInsert = cdsMainBeforeInsert
    AfterInsert = cdsMainAfterInsert
    BeforeCancel = cdsMainBeforeCancel
    AfterCancel = cdsMainAfterCancel
    BeforeScroll = cdsMainBeforeScroll
    AfterScroll = cdsMainAfterScroll
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
    BeforeOpen = cdsChildBeforeOpen
    BeforeClose = cdsChildBeforeClose
    BeforeInsert = cdsChildBeforeInsert
    AfterInsert = cdsChildAfterInsert
    BeforeEdit = cdsChildBeforeEdit
    AfterScroll = cdsChildAfterScroll
    OnReconcileError = cdsChildReconcileError
    F_UKSaveNotEdit = False
    F_AutoNumb = False
    F_AutoSave = False
    Left = 693
    Top = 65524
  end
  object MainGrid_PopupMenu: TPopupMenu
    Left = 293
    Top = 186
  end
end
