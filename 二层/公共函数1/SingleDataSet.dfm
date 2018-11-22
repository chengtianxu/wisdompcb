inherited SingleDataSet_f: TSingleDataSet_f
  Left = 358
  Top = 245
  Height = 538
  Caption = 'SingleDataSet_f'
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 12
  inherited dxStatusBar1: TdxStatusBar
    Top = 482
  end
  object cxTabControl1: TcxTabControl [1]
    Left = 0
    Top = 39
    Width = 664
    Height = 443
    Align = alClient
    TabOrder = 5
    ClientRectBottom = 443
    ClientRectRight = 664
    ClientRectTop = 0
    object Panel3: TPanel
      Left = 0
      Top = 5
      Width = 664
      Height = 438
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object Panel2: TPanel
        Left = 544
        Top = 0
        Width = 120
        Height = 434
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 0
        object RzToolbar1: TRzToolbar
          Left = 0
          Top = 0
          Width = 120
          Height = 434
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
            Top = 4
            Width = 110
            Height = 25
            Caption = 'Button1'
            TabOrder = 0
            Visible = False
          end
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 544
        Height = 434
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Panel5: TPanel
          Left = 0
          Top = 428
          Width = 544
          Height = 6
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
        end
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 5
          Height = 428
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
        end
        object cxPageControl2: TcxPageControl
          Left = 5
          Top = 0
          Width = 539
          Height = 428
          ActivePage = cxTabSheet0
          Align = alClient
          TabOrder = 2
          ClientRectBottom = 428
          ClientRectRight = 539
          ClientRectTop = 23
          object cxTabSheet0: TcxTabSheet
            Caption = #27010#35272
            ImageIndex = 0
            object ToolBar2: TToolBar
              Left = 0
              Top = 0
              Width = 0
              Height = 405
              Align = alLeft
              Caption = 'ToolBar1'
              TabOrder = 0
              Transparent = True
            end
            object DghMain: TDBGridEh
              Left = 0
              Top = 0
              Width = 539
              Height = 405
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
              PopupMenu = PopupMenu1
              SortLocal = True
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
          object cxTabSheet1: TcxTabSheet
            Caption = #26126#32454
            ImageIndex = 0
          end
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 434
        Width = 664
        Height = 4
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 664
      Height = 5
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
    end
  end
  inherited ActionList: TActionList
    Left = 128
    Top = 65528
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
  end
  inherited Images: TImageList
    Top = 65528
  end
  inherited dxBarManager: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 224
    Top = 65528
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
    BeforeClose = cdsMainBeforeClose
    AfterInsert = cdsMainAfterInsert
    BeforeCancel = cdsMainBeforeCancel
    AfterCancel = cdsMainAfterCancel
    AfterDelete = cdsMainAfterDelete
    BeforeScroll = cdsMainBeforeScroll
    AfterScroll = cdsMainAfterScroll
    OnReconcileError = cdsMainReconcileError
    F_AutoSave = True
  end
  inherited pp_DBPipeline1: TppDBPipeline
    Left = 706
  end
  inherited pp_Report1: TppReport
    Left = 756
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
  inherited pp_Designer1: TppDesigner
    Left = 810
  end
  object dlgOpen1: TOpenDialog
    Left = 84
    Top = 109
  end
  object PopupMenu1: TPopupMenu
    Left = 293
    Top = 176
    object N_SeeLog: TMenuItem
      Caption = #26597#30475#26085#24535
      Visible = False
      OnClick = N_SeeLogClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object N1: TMenuItem
      Caption = #34920#26684#21015#35774#32622
      OnClick = N1Click
    end
    object N3: TMenuItem
      Caption = #20923#32467#21015
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #21462#28040#20923#32467
      OnClick = N4Click
    end
  end
end
