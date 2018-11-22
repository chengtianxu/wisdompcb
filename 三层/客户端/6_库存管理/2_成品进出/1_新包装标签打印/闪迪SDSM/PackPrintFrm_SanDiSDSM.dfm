inherited frmPackPrint_SanDiSDSM: TfrmPackPrint_SanDiSDSM
  Caption = 'frmPackPrint_SanDiSDSM'
  ClientHeight = 633
  ClientWidth = 893
  ExplicitWidth = 909
  ExplicitHeight = 672
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlDisplay: TPanel
    Width = 893
    Height = 633
    ExplicitWidth = 893
    ExplicitHeight = 633
    inherited pnl2: TPanel
      Width = 499
      Height = 631
      ExplicitWidth = 499
      ExplicitHeight = 631
      inherited pnl4: TPanel
        Width = 497
        ExplicitWidth = 497
      end
    end
    inherited pnl1: TPanel
      Height = 631
      ExplicitHeight = 631
      inherited vePackInfo: TValueListEditor
        Height = 534
        ExplicitHeight = 534
      end
      inherited pnl3: TPanel
        inherited lbl1: TLabel
          Top = 7
          ExplicitTop = 7
        end
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
