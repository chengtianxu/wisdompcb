inherited frmBaseDBGridEhList: TfrmBaseDBGridEhList
  Caption = 'frmBaseDBGridEhList'
  ClientHeight = 702
  ClientWidth = 983
  ExplicitWidth = 999
  ExplicitHeight = 741
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 983
    Height = 702
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pnlDisplayMain: TPanel
      Left = 0
      Top = 0
      Width = 983
      Height = 702
      Align = alClient
      TabOrder = 0
      object pnlChildMain: TPanel
        Left = 1
        Top = 1
        Width = 981
        Height = 700
        Align = alClient
        TabOrder = 0
        object pnlEhMainDisplay: TPanel
          Left = 1
          Top = 1
          Width = 979
          Height = 698
          Align = alClient
          TabOrder = 0
          object ehMain: TDBGridEh
            Left = 1
            Top = 1
            Width = 977
            Height = 696
            Align = alClient
            DataSource = dsMain
            DynProps = <>
            ReadOnly = True
            SelectionDrawParams.SelectionStyle = gsdsGridThemedEh
            TabOrder = 0
            OnTitleClick = ehMainTitleClick
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
        end
      end
    end
  end
  object cdsMain: TClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    Left = 392
    Top = 200
  end
  object dsMain: TDataSource
    DataSet = cdsMain
    Left = 448
    Top = 200
  end
end
