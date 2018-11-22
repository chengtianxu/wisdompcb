inherited frmPackPrint_SanDiDaYan: TfrmPackPrint_SanDiDaYan
  Caption = 'frmPackPrint_SanDiDaYan'
  ClientHeight = 595
  ClientWidth = 805
  ExplicitWidth = 821
  ExplicitHeight = 634
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlDisplay: TPanel
    Width = 805
    Height = 595
    ExplicitWidth = 805
    ExplicitHeight = 595
    inherited pnl2: TPanel
      Width = 411
      Height = 593
      ExplicitWidth = 411
      ExplicitHeight = 593
      inherited pnl4: TPanel
        Width = 409
        ExplicitWidth = 409
      end
    end
    inherited pnl1: TPanel
      Height = 593
      ExplicitHeight = 593
      inherited vePackInfo: TValueListEditor
        Height = 496
        ExplicitHeight = 496
      end
      inherited pnlScanWO: TPanel
        Visible = False
      end
    end
  end
  inherited frxReport1: TfrxReport
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
  end
end
