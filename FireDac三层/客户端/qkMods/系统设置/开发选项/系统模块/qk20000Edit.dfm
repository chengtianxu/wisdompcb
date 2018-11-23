inherited frmqk20000Edit: Tfrmqk20000Edit
  Caption = 'frmqk20000Edit'
  ClientHeight = 618
  ClientWidth = 858
  ExplicitWidth = 874
  ExplicitHeight = 657
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBase1: TPanel
    Width = 858
    Height = 618
    ExplicitWidth = 858
    ExplicitHeight = 618
    inherited pnlTop: TPanel
      Width = 856
      ExplicitWidth = 856
      inherited pnlTopTool: TPanel
        Width = 854
        ExplicitWidth = 854
      end
    end
    inherited pnlBaseForVEditGrid: TPanel
      Width = 856
      Height = 591
      ExplicitLeft = 1
      ExplicitTop = 26
      ExplicitWidth = 856
      ExplicitHeight = 591
      inherited pnlBase2: TPanel
        Width = 854
        Height = 589
        ExplicitTop = 1
        ExplicitWidth = 854
        ExplicitHeight = 589
        inherited spl1: TSplitter
          Left = 848
          Height = 587
          ExplicitLeft = 848
          ExplicitHeight = 593
        end
        inherited veh1: TDBVertGridEh
          Width = 248
          Height = 587
          Align = alLeft
        end
        object pnl1: TPanel
          Left = 249
          Top = 1
          Width = 599
          Height = 587
          Align = alClient
          Color = clWhite
          TabOrder = 1
          object pgc1: TPageControl
            Left = 1
            Top = 1
            Width = 597
            Height = 585
            ActivePage = ts1
            Align = alClient
            TabOrder = 0
            object ts1: TTabSheet
              Caption = #27169#22359#26435#38480
              object eh1: TDBGridEh
                Left = 0
                Top = 0
                Width = 589
                Height = 556
                Align = alClient
                DataSource = dsBaseRight
                DynProps = <>
                PopupMenu = pm1
                TabOrder = 0
                Columns = <
                  item
                    CellButtons = <>
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'RightID'
                    Footers = <>
                    Title.Caption = #26435#38480#32534#21495
                    Width = 70
                  end
                  item
                    CellButtons = <>
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'RightName'
                    Footers = <>
                    Title.Caption = #26435#38480#21517#31216
                    Width = 150
                  end
                  item
                    CellButtons = <>
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'Note'
                    Footers = <>
                    Title.Caption = #22791#27880
                    Width = 150
                  end>
                object RowDetailData: TRowDetailPanelControlEh
                end
              end
            end
          end
        end
      end
    end
  end
  object mtgSysMod: TFDMemTable
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 160
    Top = 377
  end
  object mtgBaseRight: TFDMemTable
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 600
    Top = 449
  end
  object dsBaseRight: TDataSource
    DataSet = mtgBaseRight
    Left = 720
    Top = 448
  end
  object pm1: TPopupMenu
    Left = 631
    Top = 261
    object mniN1: TMenuItem
      Caption = #28155#21152#40664#35748#26435#38480
      OnClick = mniN1Click
    end
  end
end
