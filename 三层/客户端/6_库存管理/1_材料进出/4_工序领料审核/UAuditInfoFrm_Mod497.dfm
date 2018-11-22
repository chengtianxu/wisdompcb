inherited FrmAuditInfo_Mod497: TFrmAuditInfo_Mod497
  Caption = 'FrmAuditInfo_Mod497'
  ClientHeight = 351
  ClientWidth = 608
  ExplicitWidth = 624
  ExplicitHeight = 389
  PixelsPerInch = 96
  TextHeight = 13
  object eh368: TDBGridEh
    Left = 0
    Top = 0
    Width = 608
    Height = 351
    Align = alClient
    DataSource = ds368
    DynProps = <>
    TabOrder = 0
    Columns = <
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'USER_FULL_NAME'
        Footers = <>
        Title.Caption = #21407#23457#25209#20154
        Width = 60
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'RPL_USER_FULL_NAME'
        Footers = <>
        Title.Caption = #25480#26435#23457#25209#20154
        Width = 71
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'auth_date'
        Footers = <>
        Title.Caption = #23457#25209#26085#26399
        Width = 129
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'ranking'
        Footers = <>
        Title.Caption = #23457#25209#39034#24207
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'auth_flag'
        Footers = <>
        Title.Caption = #24403#21069#23457#25209
        Width = 57
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'remark'
        Footers = <>
        Title.Caption = #22791#27880
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object cds368: TClientDataSet
    Aggregates = <>
    Params = <>
    ReadOnly = True
    Left = 216
    Top = 64
  end
  object ds368: TDataSource
    DataSet = cds368
    Left = 336
    Top = 96
  end
end
