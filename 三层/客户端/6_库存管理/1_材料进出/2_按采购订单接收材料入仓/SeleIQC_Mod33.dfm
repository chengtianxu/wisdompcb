inherited frmSeleIQC_Mod33: TfrmSeleIQC_Mod33
  Caption = #36873#25321'IQC'#20837#24211#21333#21495
  ClientHeight = 393
  ClientWidth = 635
  ExplicitWidth = 643
  ExplicitHeight = 420
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 635
    Height = 393
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 591
    ExplicitHeight = 363
    inherited pnl1: TPanel
      Width = 633
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 589
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Width = 633
      Height = 358
      ExplicitLeft = 1
      ExplicitTop = 34
      ExplicitWidth = 589
      ExplicitHeight = 328
      object DBGridEh1: TDBGridEh
        Left = 1
        Top = 1
        Width = 631
        Height = 356
        Align = alClient
        DataSource = ds391
        DynProps = <>
        TabOrder = 0
        OnDblClick = DBGridEh1DblClick
        Columns = <
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'iqc_number'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #26816#27979#32534#21495
            Width = 80
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'barch_no'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #25209#27425#21495
            Width = 80
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'supplier_model'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #20379#24212#21830#22411#21495
            Width = 100
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'rece_qty'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #26816#27979#25968#37327
            Width = 60
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'auth_date'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #26816#27979#26085#26399
            Width = 90
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'manufacture_TDATE'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #21046#36896#26085#26399
            Width = 90
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  object cds391: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 208
    Top = 296
  end
  object ds391: TDataSource
    DataSet = cds391
    Left = 256
    Top = 296
  end
end
