inherited frmAllOldVersion: TfrmAllOldVersion
  Caption = 'ECN'#21464#26356#21069#29256#26412#22312#32447#29366#20917
  ClientHeight = 404
  ClientWidth = 756
  ExplicitWidth = 764
  ExplicitHeight = 431
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 363
    Width = 756
    Height = 41
    Align = alBottom
    TabOrder = 0
    object Button1: TButton
      Left = 352
      Top = 6
      Width = 69
      Height = 27
      Caption = #20851' '#38381
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 756
    Height = 363
    Align = alClient
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 754
      Height = 361
      Align = alClient
      DataSource = dsOldECN
      DynProps = <>
      TabOrder = 0
      Columns = <
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'MANU_PART_NUMBER'
          Footers = <>
          Title.Caption = #26412#21378#32534#21495
          Width = 100
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'WORK_ORDER_NUMBER'
          Footers = <>
          Title.Caption = #20316#19994#21333#21495
          Width = 120
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'CUT_NO'
          Footers = <>
          Title.Caption = #37197#26009#21333#21495
          Width = 100
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'PO_NUMBER'
          Footers = <>
          Title.Caption = #23458#25143#35746#21333#21495
          Width = 150
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'DEPT_NAME'
          Footers = <>
          Title.Caption = #24403#21069#24037#24207
          Width = 80
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'QTY_BACKLOG'
          Footers = <>
          Title.Caption = #22312#32447'PCS'#25968
          Width = 70
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'PANELS'
          Footers = <>
          Title.Caption = #22312#32447'PNL'#25968
          Width = 70
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object dsOldECN: TDataSource
    DataSet = cdsOldECN
    Left = 392
    Top = 104
  end
  object cdsOldECN: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select Data0025.MANU_PART_NUMBER,Data0006.WORK_ORDER_NUMBER,'#13#10'Da' +
      'ta0006.CUT_NO,Data0056.PO_NUMBER,Data0034.DEPT_NAME,'#13#10'Data0056.Q' +
      'TY_BACKLOG,Data0056.PANELS'#13#10'from Data0056 inner join'#13#10'Data0006 o' +
      'n Data0056.WO_PTR = Data0006.RKEY inner join'#13#10'Data0025 on Data00' +
      '06.BOM_PTR = Data0025.RKEY left join'#13#10'Data0034 on Data0056.DEPT_' +
      'PTR = Data0034.RKEY'#13#10'where 1=1'
    Params = <>
    Left = 488
    Top = 104
  end
end
