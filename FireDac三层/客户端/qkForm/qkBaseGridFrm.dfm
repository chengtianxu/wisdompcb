inherited frmqkbaseGrid: TfrmqkbaseGrid
  ClientHeight = 337
  ClientWidth = 650
  ExplicitWidth = 666
  ExplicitHeight = 376
  PixelsPerInch = 96
  TextHeight = 13
  object pnlbase: TPanel
    Left = 0
    Top = 0
    Width = 650
    Height = 337
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 635
    ExplicitHeight = 299
    object pnlbaseforGrid: TPanel
      Left = 1
      Top = 1
      Width = 648
      Height = 335
      Align = alClient
      Caption = 'pnlbaseforGrid'
      TabOrder = 0
      ExplicitLeft = 224
      ExplicitTop = 128
      ExplicitWidth = 185
      ExplicitHeight = 41
      object pnlbaseGrid: TPanel
        Left = 1
        Top = 1
        Width = 646
        Height = 333
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 648
        ExplicitHeight = 335
        object eh1: TDBGridEh
          Left = 1
          Top = 1
          Width = 644
          Height = 331
          Align = alClient
          ColumnDefValues.Title.TitleButton = True
          Ctl3D = False
          DataSource = ds1
          DynProps = <>
          EditActions = [geaCopyEh]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
          ParentCtl3D = False
          ReadOnly = True
          SearchPanel.Enabled = True
          SearchPanel.Location = splExternal
          SearchPanel.SearchScope = gssCurrentColumnEh
          SelectionDrawParams.DrawFocusFrame = True
          SelectionDrawParams.DrawFocusFrameStored = True
          EditButtonsShowOptions = [sebShowOnlyWhenDataEditingEh]
          SortLocal = True
          STFilter.Location = stflInTitleFilterEh
          TabOrder = 0
          TitleParams.MultiTitle = True
          OnCellClick = eh1CellClick
          OnColumnMoved = eh1ColumnMoved
          OnKeyDown = eh1KeyDown
          OnTitleClick = eh1TitleClick
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
  end
  object ds1: TDataSource
    Left = 608
    Top = 440
  end
  object mtCustomerCol: TFDMemTable
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 152
    Top = 72
  end
end
