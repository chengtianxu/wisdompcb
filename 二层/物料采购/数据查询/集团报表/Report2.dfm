inherited frmReport2: TfrmReport2
  Caption = 'frmReport2'
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel2: TPanel
    inherited DBGridEh1: TDBGridEh
      Columns = <
        item
          EditButtons = <>
          FieldName = 'INV_PART_NUMBER'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'INV_PART_DESCRIPTION'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'UNIT_NAME'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'GROUP_DESC'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'put_total'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'STOCK_SELL'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'put_price'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'REPORT_VALUE1'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'put_notax'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'total_weigth'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'total_area'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'WAREHOUSE_NAME'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end>
    end
  end
  inherited aqQuery: TADOQuery
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Servers'
        Attributes = [paNullable, paLong]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 2147483647
        Value = Null
      end
      item
        Name = 'Condition'
        Attributes = [paNullable, paLong]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 2147483647
        Value = Null
      end
      item
        Name = 'OrderBy'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end>
    SQL.Strings = (
      'Exec SP_GroupReports;2 :Servers, :Condition, :OrderBy')
    object aqQueryINV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object aqQueryINV_PART_DESCRIPTION: TStringField
      DisplayLabel = #21697#21517#35268#26684
      DisplayWidth = 38
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object aqQueryUNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      DisplayWidth = 6
      FieldName = 'UNIT_NAME'
    end
    object aqQueryGROUP_DESC: TStringField
      DisplayLabel = #26448#26009#31867#22411
      DisplayWidth = 15
      FieldName = 'GROUP_DESC'
      Size = 30
    end
    object aqQueryput_total: TBCDField
      DisplayLabel = #21457#25918#25968#37327
      DisplayWidth = 10
      FieldName = 'put_total'
      ReadOnly = True
      Precision = 32
    end
    object aqQuerySTOCK_SELL: TFloatField
      DisplayLabel = #21333#20301#38754#31215
      FieldName = 'STOCK_SELL'
    end
    object aqQueryput_price: TBCDField
      DisplayLabel = #37329#39069'('#26412#24065#21547#31246')'
      DisplayWidth = 15
      FieldName = 'put_price'
      ReadOnly = True
      Precision = 32
      Size = 8
    end
    object aqQueryREPORT_VALUE1: TFloatField
      DisplayLabel = #26631#20934#20135#20986'('#24179#31859')'
      DisplayWidth = 15
      FieldName = 'REPORT_VALUE1'
    end
    object aqQueryput_notax: TBCDField
      DisplayLabel = #37329#39069'('#26412#24065#19981#21547#31246')'
      DisplayWidth = 15
      FieldName = 'put_notax'
      ReadOnly = True
      Precision = 32
      Size = 6
    end
    object aqQuerytotal_weigth: TBCDField
      DisplayLabel = #21457#25918#37325#37327'(Kg)'
      DisplayWidth = 15
      FieldName = 'total_weigth'
      ReadOnly = True
      Precision = 32
      Size = 8
    end
    object aqQuerytotal_area: TFloatField
      DisplayLabel = #21457#25918#38754#31215
      DisplayWidth = 10
      FieldName = 'total_area'
      ReadOnly = True
    end
    object aqQueryWAREHOUSE_NAME: TStringField
      DisplayLabel = #39046#26009#24037#21378
      FieldName = 'WAREHOUSE_NAME'
      Size = 10
    end
  end
end
