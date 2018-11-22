inherited frmMainWhere: TfrmMainWhere
  Caption = #26597#35810#26465#20214
  ClientHeight = 365
  ClientWidth = 586
  OnCreate = FormCreate
  ExplicitWidth = 602
  ExplicitHeight = 404
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBackGround: TPanel
    Left = 0
    Top = 0
    Width = 586
    Height = 365
    Align = alClient
    TabOrder = 0
    object ehDisplayWhere: TDBGridEh
      Left = 9
      Top = 6
      Width = 475
      Height = 339
      AllowedOperations = [alopUpdateEh]
      DataSource = dsDisplay
      DynProps = <>
      SelectionDrawParams.SelectionStyle = gsdsGridThemedEh
      TabOrder = 0
      Columns = <
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'FieldCaption'
          Footers = <>
          ReadOnly = True
          Title.Caption = #23383#27573#21517
          Width = 120
        end
        item
          AlwaysShowEditButton = True
          ButtonStyle = cbsDropDown
          DblClickNextVal = True
          DynProps = <>
          EditButton.Visible = True
          EditButtons = <>
          FieldName = 'Oper'
          Footers = <>
          Title.Caption = #26465#20214
          Width = 70
        end
        item
          AlwaysShowEditButton = True
          ButtonStyle = cbsEllipsis
          DynProps = <>
          EditButton.Style = ebsEllipsisEh
          EditButton.Visible = True
          EditButtons = <>
          FieldName = 'FieldValue'
          Footers = <>
          ReadOnly = True
          Title.Caption = #20540
          Width = 230
          OnEditButtonClick = eh1Columns2EditButtonClick
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object btnClear: TButton
      Left = 496
      Top = 106
      Width = 75
      Height = 25
      Caption = #28165#31354
      TabOrder = 1
      OnClick = btnClearClick
    end
    object btnClose: TButton
      Left = 496
      Top = 148
      Width = 75
      Height = 25
      Caption = #20851#38381
      TabOrder = 2
      OnClick = btnCloseClick
    end
    object btnOK: TButton
      Left = 496
      Top = 24
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 3
      OnClick = btnOKClick
    end
    object btnDelete: TButton
      Left = 496
      Top = 65
      Width = 75
      Height = 25
      Caption = #21024#38500
      TabOrder = 4
      OnClick = btnDeleteClick
    end
  end
  object cdsDisplay: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = cdsDisplayAfterScroll
    Left = 128
    Top = 200
    object intgrfldMainWhereSeqNO: TIntegerField
      FieldName = 'SeqNO'
    end
    object strngfldMainWhereFieldCaption: TStringField
      FieldName = 'FieldCaption'
      Size = 128
    end
    object strngfldMainWhereFieldName: TStringField
      FieldName = 'FieldName'
      Size = 128
    end
    object intgrfldMainWhereDataType: TIntegerField
      FieldName = 'DataType'
    end
    object intgrfldMainWhereInputType: TIntegerField
      FieldName = 'InputType'
    end
    object intgrfldMainWherePickID: TIntegerField
      FieldName = 'PickID'
    end
    object strngfldMainWherePickRetFieldName: TStringField
      FieldName = 'PickRetFieldName'
      Size = 1024
    end
    object strngfldMainWhereDropDownValues: TStringField
      FieldName = 'DropDownValues'
      Size = 1024
    end
    object strngfldMainWhereOper: TStringField
      FieldName = 'Oper'
      OnSetText = strngfldMainWhereOperSetText
    end
    object strngfldMainWhereFieldValue: TStringField
      FieldName = 'FieldValue'
      Size = 1024
    end
    object intgrfldDisplayModID: TIntegerField
      FieldName = 'ModID'
    end
    object intgrfldDisplayID: TIntegerField
      FieldName = 'ID'
    end
  end
  object dsDisplay: TDataSource
    DataSet = cdsDisplay
    Left = 200
    Top = 200
  end
  object cdsRet: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 200
    Top = 56
    object strngfldRetFieldName: TStringField
      FieldName = 'FieldName'
      Size = 128
    end
    object strngfldRetOper: TStringField
      FieldName = 'Oper'
    end
    object strngfldRetFieldValue: TStringField
      FieldName = 'FieldValue'
      Size = 1024
    end
    object intgrfldRetSeqNo: TIntegerField
      FieldName = 'SeqNo'
    end
  end
end
