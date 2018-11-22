inherited frmPackPrint_FanGuDaDi: TfrmPackPrint_FanGuDaDi
  Caption = 'frmPackPrint_FanGuDaDi'
  ClientHeight = 551
  ClientWidth = 1024
  ExplicitWidth = 1040
  ExplicitHeight = 590
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlDisplay: TPanel
    Width = 1024
    Height = 551
    ExplicitWidth = 688
    ExplicitHeight = 397
    inherited pnl2: TPanel
      Width = 630
      Height = 549
      ExplicitWidth = 294
      ExplicitHeight = 395
      inherited pnl4: TPanel
        Width = 628
        ExplicitWidth = 292
      end
    end
    inherited pnl1: TPanel
      Height = 549
      ExplicitHeight = 395
      inherited vePackInfo: TValueListEditor
        Height = 452
        ExplicitHeight = 298
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
