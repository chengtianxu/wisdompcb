inherited frmSeleIQC: TfrmSeleIQC
  Caption = #36873#25321'IQC'#20837#24211#21333#21495
  ClientHeight = 360
  ClientWidth = 605
  ExplicitWidth = 613
  ExplicitHeight = 387
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 605
    Height = 360
    ExplicitWidth = 605
    ExplicitHeight = 360
    inherited pnl1: TPanel
      Width = 603
      ExplicitWidth = 603
      inherited btnSave: TBitBtn
        Visible = False
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Width = 603
      Height = 325
      ExplicitWidth = 603
      ExplicitHeight = 325
      object DBGridEh1: TDBGridEh
        Left = 1
        Top = 1
        Width = 601
        Height = 323
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
