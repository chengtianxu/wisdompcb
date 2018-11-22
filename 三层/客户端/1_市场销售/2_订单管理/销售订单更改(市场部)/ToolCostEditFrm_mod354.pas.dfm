inherited frmToolCostEdit_mod354: TfrmToolCostEdit_mod354
  Caption = #20462#25913#24037#20855#36153
  ClientHeight = 368
  ClientWidth = 571
  Font.Height = -13
  Font.Name = #23435#20307
  Position = poOwnerFormCenter
  ExplicitWidth = 587
  ExplicitHeight = 407
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 571
    Height = 368
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 527
    ExplicitHeight = 242
    inherited pnl1: TPanel
      Width = 569
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 525
      inherited btnSaveAll: TBitBtn
        Left = 508
        Align = alRight
      end
      inherited btnCheck: TBitBtn
        Left = 478
        Align = alRight
      end
      inherited btnPrint: TBitBtn
        Left = 538
        Align = alRight
      end
    end
    inherited pnl2: TPanel
      Width = 569
      Height = 333
      ExplicitLeft = 2
      ExplicitTop = 39
      ExplicitWidth = 525
      ExplicitHeight = 207
      object eh62: TDBGridEh
        Left = 1
        Top = 1
        Width = 567
        Height = 331
        Align = alClient
        DataSource = ds62
        DynProps = <>
        TabOrder = 0
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  object ds62: TDataSource
    Left = 160
    Top = 208
  end
  object cds62: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 248
    Top = 192
  end
end
