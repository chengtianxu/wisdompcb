inherited frmReport8: TfrmReport8
  Caption = 'frmReport8'
  OldCreateOrder = True
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
          FieldName = 'unit_code'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'group_name'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'group_desc'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'MANUFACTURER_NAME'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'quan_alloc'
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
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'STOCK_BASE'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'CONSIGN_ONHAND_QTY'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'STD_COST'
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
          FieldName = 'STOP_PURCH'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'ANALYSIS_CODE1'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'ANALYSIS_CODE2'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'ANALYSIS_CODE3'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'ANALYSIS_CODE4'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'ANALYSIS_CODE5'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'IES_PARAMETER_VALUE1'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'IES_PARAMETER_VALUE2'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'IES_PARAMETER_VALUE3'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'IES_PARAMETER_VALUE4'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'IES_PARAMETER_VALUE5'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'IES_PARAMETER_VALUE6'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'IES_PARAMETER_VALUE7'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'IES_PARAMETER_VALUE8'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'IES_PARAMETER_VALUE9'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'IES_PARAMETER_VALUE10'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'FacName'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end>
    end
  end
  inherited aqQuery: TADOQuery
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
      end
      item
        Name = 'CHSName'
        Attributes = [paNullable, paLong]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 2147483647
        Value = Null
      end>
    SQL.Strings = (
      'Exec SP_GroupReports;8 :Servers, :Condition, :OrderBy, :CHSName')
    Top = 63
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
    object aqQueryunit_code: TStringField
      DisplayLabel = #37319#36141#21333#20301
      DisplayWidth = 10
      FieldName = 'unit_code'
      Size = 5
    end
    object aqQuerygroup_name: TStringField
      DisplayLabel = #31867#21035#20195#30721
      FieldName = 'group_name'
      Size = 10
    end
    object aqQuerygroup_desc: TStringField
      DisplayLabel = #31867#21035#21517#31216
      DisplayWidth = 12
      FieldName = 'group_desc'
      Size = 30
    end
    object aqQueryMANUFACTURER_NAME: TStringField
      DisplayLabel = #29305#21029#35201#27714
      DisplayWidth = 15
      FieldName = 'MANUFACTURER_NAME'
    end
    object aqQueryquan_alloc: TFloatField
      DisplayLabel = #26377#25928#24211#23384
      FieldName = 'quan_alloc'
      ReadOnly = True
    end
    object aqQuerySTOCK_SELL: TFloatField
      DisplayLabel = #21333#20301#38754#31215
      FieldName = 'STOCK_SELL'
    end
    object aqQuerySTOCK_BASE: TFloatField
      DisplayLabel = #21333#20301#37325#37327
      FieldName = 'STOCK_BASE'
    end
    object aqQueryCONSIGN_ONHAND_QTY: TFloatField
      DisplayLabel = #23433#20840#24211#23384
      FieldName = 'CONSIGN_ONHAND_QTY'
    end
    object aqQuerySTD_COST: TFloatField
      DisplayLabel = #26631#20934#25104#26412
      FieldName = 'STD_COST'
    end
    object aqQueryREPORT_VALUE1: TFloatField
      DisplayLabel = #26631#20934#20135#20986
      FieldName = 'REPORT_VALUE1'
    end
    object aqQuerySTOP_PURCH: TStringField
      DisplayLabel = #20572#27490#37319#36141
      DisplayWidth = 8
      FieldName = 'STOP_PURCH'
      Size = 4
    end
    object aqQueryANALYSIS_CODE1: TStringField
      DisplayLabel = #25511#21046#32773
      DisplayWidth = 12
      FieldName = 'ANALYSIS_CODE1'
      FixedChar = True
      Size = 100
    end
    object aqQueryANALYSIS_CODE2: TStringField
      DisplayLabel = #20998#26512#20195#30721'2'
      DisplayWidth = 12
      FieldName = 'ANALYSIS_CODE2'
      FixedChar = True
      Size = 100
    end
    object aqQueryANALYSIS_CODE3: TStringField
      DisplayLabel = #20998#26512#20195#30721'3'
      DisplayWidth = 12
      FieldName = 'ANALYSIS_CODE3'
      FixedChar = True
      Size = 100
    end
    object aqQueryANALYSIS_CODE4: TStringField
      DisplayLabel = #20998#26512#20195#30721'4'
      DisplayWidth = 12
      FieldName = 'ANALYSIS_CODE4'
      FixedChar = True
      Size = 100
    end
    object aqQueryANALYSIS_CODE5: TStringField
      DisplayLabel = #20998#26512#20195#30721'5'
      DisplayWidth = 12
      FieldName = 'ANALYSIS_CODE5'
      FixedChar = True
      Size = 100
    end
    object aqQueryIES_PARAMETER_VALUE1: TStringField
      DisplayLabel = 'IES'#21442#25968'1'
      DisplayWidth = 12
      FieldName = 'IES_PARAMETER_VALUE1'
      Visible = False
      Size = 30
    end
    object aqQueryIES_PARAMETER_VALUE2: TStringField
      DisplayLabel = 'IES'#21442#25968'2'
      DisplayWidth = 12
      FieldName = 'IES_PARAMETER_VALUE2'
      Visible = False
      Size = 30
    end
    object aqQueryIES_PARAMETER_VALUE3: TStringField
      DisplayLabel = 'IES'#21442#25968'3'
      DisplayWidth = 12
      FieldName = 'IES_PARAMETER_VALUE3'
      Visible = False
      Size = 30
    end
    object aqQueryIES_PARAMETER_VALUE4: TStringField
      DisplayLabel = 'IES'#21442#25968'4'
      DisplayWidth = 12
      FieldName = 'IES_PARAMETER_VALUE4'
      Visible = False
      Size = 30
    end
    object aqQueryIES_PARAMETER_VALUE5: TStringField
      DisplayLabel = 'IES'#21442#25968'5'
      DisplayWidth = 12
      FieldName = 'IES_PARAMETER_VALUE5'
      Visible = False
      Size = 30
    end
    object aqQueryIES_PARAMETER_VALUE6: TStringField
      DisplayLabel = 'IES'#21442#25968'6'
      DisplayWidth = 12
      FieldName = 'IES_PARAMETER_VALUE6'
      Visible = False
      Size = 30
    end
    object aqQueryIES_PARAMETER_VALUE7: TStringField
      DisplayLabel = 'IES'#21442#25968'7'
      DisplayWidth = 12
      FieldName = 'IES_PARAMETER_VALUE7'
      Visible = False
      Size = 30
    end
    object aqQueryIES_PARAMETER_VALUE8: TStringField
      DisplayLabel = 'IES'#21442#25968'8'
      DisplayWidth = 12
      FieldName = 'IES_PARAMETER_VALUE8'
      Visible = False
      Size = 30
    end
    object aqQueryIES_PARAMETER_VALUE9: TStringField
      DisplayLabel = 'IES'#21442#25968'9'
      DisplayWidth = 12
      FieldName = 'IES_PARAMETER_VALUE9'
      Visible = False
      Size = 30
    end
    object aqQueryIES_PARAMETER_VALUE10: TStringField
      DisplayLabel = 'IES'#21442#25968'10'
      DisplayWidth = 12
      FieldName = 'IES_PARAMETER_VALUE10'
      Visible = False
      Size = 30
    end
    object aqQueryFacName: TStringField
      DisplayLabel = #24037#21378
      DisplayWidth = 10
      FieldName = 'FacName'
      ReadOnly = True
      Size = 8
    end
  end
end
