inherited frmTagOperator_SumPackColumn: TfrmTagOperator_SumPackColumn
  BorderStyle = bsDialog
  Caption = #21512#24182#36873#39033
  ClientHeight = 445
  ClientWidth = 255
  OnCreate = FormCreate
  ExplicitWidth = 261
  ExplicitHeight = 474
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 404
    Width = 255
    Height = 41
    Align = alBottom
    TabOrder = 0
    ExplicitLeft = 32
    ExplicitTop = 328
    ExplicitWidth = 185
    object btn1: TButton
      Left = 31
      Top = 8
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = btn1Click
    end
    object btn2: TButton
      Left = 136
      Top = 8
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      OnClick = btn2Click
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 0
    Width = 255
    Height = 404
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 16
    ExplicitTop = 192
    ExplicitWidth = 185
    ExplicitHeight = 41
    object eh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 253
      Height = 402
      Align = alClient
      DataSource = ds1
      DynProps = <>
      TabOrder = 0
      Columns = <
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'Checked'
          Footers = <>
          Title.Caption = #36873
          Width = 25
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'SumColumn'
          Footers = <>
          ReadOnly = True
          Title.Caption = #21512#24182#39033#30446
          Width = 150
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object cds1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 72
    Top = 144
    object cds1Checked: TBooleanField
      FieldName = 'Checked'
    end
    object cds1SumColumn: TStringField
      FieldName = 'SumColumn'
      Size = 50
    end
  end
  object ds1: TDataSource
    DataSet = cds1
    Left = 136
    Top = 144
  end
end
