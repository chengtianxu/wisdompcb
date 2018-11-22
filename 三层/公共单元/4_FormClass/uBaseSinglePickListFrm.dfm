inherited frmSinglePickList: TfrmSinglePickList
  Caption = 'frmSinglePickList'
  ClientHeight = 578
  ClientWidth = 567
  ExplicitWidth = 583
  ExplicitHeight = 617
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 567
    Height = 41
    Align = alTop
    TabOrder = 0
    object edtFilter: TLabeledEdit
      Left = 202
      Top = 11
      Width = 177
      Height = 21
      EditLabel.Width = 40
      EditLabel.Height = 13
      EditLabel.Caption = 'edtFilter'
      LabelPosition = lpLeft
      TabOrder = 0
      OnChange = edtFilterChange
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 537
    Width = 567
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnOK: TButton
      Left = 143
      Top = 8
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancelPick: TButton
      Left = 358
      Top = 9
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      OnClick = btnCancelPickClick
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 41
    Width = 567
    Height = 496
    Align = alClient
    TabOrder = 2
    object eh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 565
      Height = 494
      Align = alClient
      DataSource = dsPick
      DynProps = <>
      ReadOnly = True
      SelectionDrawParams.SelectionStyle = gsdsGridThemedEh
      TabOrder = 0
      OnDblClick = btnOKClick
      OnKeyDown = eh1KeyDown
      OnTitleClick = eh1TitleClick
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object cdsPick: TClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ReadOnly = True
    Left = 392
    Top = 464
  end
  object dsPick: TDataSource
    DataSet = cdsPick
    Left = 448
    Top = 464
  end
end
