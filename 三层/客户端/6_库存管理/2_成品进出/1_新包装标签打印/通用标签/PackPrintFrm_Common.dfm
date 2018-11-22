inherited frmPackPrint_Common: TfrmPackPrint_Common
  Caption = 'frmPackPrint_Common'
  ClientHeight = 503
  ClientWidth = 729
  ExplicitWidth = 745
  ExplicitHeight = 542
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlDisplay: TPanel
    Width = 729
    Height = 503
    ExplicitWidth = 729
    ExplicitHeight = 503
    inherited pnl2: TPanel
      Width = 335
      Height = 501
      ExplicitWidth = 335
      ExplicitHeight = 501
      inherited pnl4: TPanel
        Width = 333
        ExplicitWidth = 333
      end
    end
    inherited pnl1: TPanel
      Height = 501
      ExplicitHeight = 501
      inherited vePackInfo: TValueListEditor
        Height = 404
        ExplicitHeight = 404
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
