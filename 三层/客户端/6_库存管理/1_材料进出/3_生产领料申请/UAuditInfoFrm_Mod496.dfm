inherited FrmAuditInfo_Mod496: TFrmAuditInfo_Mod496
  Caption = #23457#26680#20449#24687
  ClientHeight = 321
  ClientWidth = 572
  Position = poMainFormCenter
  ExplicitWidth = 588
  ExplicitHeight = 359
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 572
    Height = 321
    Align = alClient
    TabOrder = 0
    object eh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 570
      Height = 319
      Align = alClient
      DataSource = ds1
      DynProps = <>
      TabOrder = 0
      Columns = <
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'USER_ID'
          Footers = <>
          Title.Caption = #23457#26680#20154#20195#30721
          Width = 84
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'USER_FULL_NAME'
          Footers = <>
          Title.Caption = #23457#26680#20154#21517#31216
          Width = 85
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'auth_date'
          Footers = <>
          Title.Caption = #23457#26680#26085#26399
          Width = 103
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'auth_flag'
          Footers = <>
          Title.Caption = #23457#26680#26631#24535
          Width = 85
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'ranking'
          Footers = <>
          Title.Caption = #23457#26657#39034#24207
          Width = 78
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object ds1: TDataSource
    DataSet = cds1
    Left = 464
    Top = 152
  end
  object cds1: TClientDataSet
    Aggregates = <>
    Params = <>
    ReadOnly = True
    Left = 320
    Top = 152
  end
end
