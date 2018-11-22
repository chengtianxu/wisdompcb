inherited FrmSelAuditCode: TFrmSelAuditCode
  Caption = #36873#25321#23457#26680#20195#30721
  ClientHeight = 502
  ClientWidth = 542
  ExplicitTop = -18
  ExplicitWidth = 558
  ExplicitHeight = 541
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl1: TPanel
    Width = 542
    ExplicitWidth = 542
  end
  inherited pnl2: TPanel
    Top = 360
    Width = 542
    Height = 142
    ExplicitTop = 360
    ExplicitWidth = 542
    ExplicitHeight = 142
    inherited btnOK: TButton
      Left = 208
      Top = 118
      ExplicitLeft = 208
      ExplicitTop = 118
    end
    inherited btnCancelPick: TButton
      Left = 304
      Top = 118
      TabOrder = 2
      ExplicitLeft = 304
      ExplicitTop = 118
    end
    object eh2: TDBGridEh
      Left = 1
      Top = 5
      Width = 538
      Height = 107
      DataSource = ds275
      DynProps = <>
      TabOrder = 1
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  inherited pnl3: TPanel
    Width = 542
    Height = 319
    ExplicitWidth = 542
    ExplicitHeight = 319
    inherited eh1: TDBGridEh
      Width = 540
      Height = 317
    end
  end
  inherited cdsPick: TClientDataSet
    AfterScroll = cdsPickAfterScroll
    Left = 336
    Top = 120
  end
  inherited dsPick: TDataSource
    Left = 392
    Top = 120
  end
  object ds275: TDataSource
    DataSet = cds275
    Left = 336
    Top = 344
  end
  object cds275: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 344
  end
end
