inherited frmReport1: TfrmReport1
  Caption = 'frmReport1'
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel2: TPanel
    inherited DBGridEh1: TDBGridEh
      Columns = <
        item
          EditButtons = <>
          FieldName = 'REF457_NUMBER'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'GON_NUMBER'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
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
          FieldName = 'QUANTITY'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'RTN_QUANTITY'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'DEPT_NAME'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'TDATE'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'CURR_CODE'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'STANDARD_COST'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'BARCODE_ID'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'TAX_2'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'tax_price'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'total_price'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'total_notaxprice'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'VDATE'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'CODE'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'ABBR_NAME'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'EMPLOYEE_NAME'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'FL_EMPLOYEE'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'LOCATION'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'WAREHOUSE_CODE'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'WAREHOUSE_NAME'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'v_type'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
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
      'Exec SP_GroupReports :Servers, :Condition, :OrderBy')
    object aqQueryREF457_NUMBER: TStringField
      DisplayLabel = #39046#26009#21333#21495
      DisplayWidth = 12
      FieldName = 'REF457_NUMBER'
      Size = 15
    end
    object aqQueryGON_NUMBER: TStringField
      DisplayLabel = #20986#20179#21333#21495
      DisplayWidth = 12
      FieldName = 'GON_NUMBER'
      Size = 10
    end
    object aqQueryINV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      DisplayWidth = 25
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
    object aqQueryGROUP_DESC: TStringField
      DisplayLabel = #26448#26009#31867#22411
      DisplayWidth = 15
      FieldName = 'GROUP_DESC'
      Size = 30
    end
    object aqQueryDEPT_NAME: TStringField
      DisplayLabel = #21457#25918#37096#38376
      DisplayWidth = 10
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object aqQueryQUANTITY: TBCDField
      DisplayLabel = #21457#25918#25968#37327
      DisplayWidth = 10
      FieldName = 'QUANTITY'
      Precision = 19
    end
    object aqQueryRTN_QUANTITY: TFloatField
      DisplayLabel = #36864#20179#25968#37327
      FieldName = 'RTN_QUANTITY'
    end
    object aqQueryCURR_CODE: TStringField
      DisplayLabel = #36135#24065
      DisplayWidth = 8
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object aqQuerySTANDARD_COST: TBCDField
      DisplayLabel = #19981#21547#31246#20215
      DisplayWidth = 10
      FieldName = 'STANDARD_COST'
      ReadOnly = True
      Precision = 15
      Size = 6
    end
    object aqQueryBARCODE_ID: TStringField
      DisplayLabel = #22791#27880
      DisplayWidth = 20
      FieldName = 'BARCODE_ID'
      Size = 50
    end
    object aqQueryTAX_2: TBCDField
      DisplayLabel = #31246#29575'%'
      DisplayWidth = 8
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object aqQuerytax_price: TBCDField
      DisplayLabel = #21547#31246#20215
      DisplayWidth = 10
      FieldName = 'tax_price'
      Precision = 13
    end
    object aqQuerytotal_price: TBCDField
      DisplayLabel = #37329#39069'('#26412#24065#21547#31246')'
      DisplayWidth = 15
      FieldName = 'total_price'
      ReadOnly = True
      Precision = 32
      Size = 8
    end
    object aqQuerytotal_notaxprice: TBCDField
      DisplayLabel = #37329#39069'('#26412#24065#19981#21547#31246')'
      DisplayWidth = 15
      FieldName = 'total_notaxprice'
      ReadOnly = True
      Precision = 32
      Size = 6
    end
    object aqQueryCODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object aqQueryABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      DisplayWidth = 10
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object aqQueryUNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      DisplayWidth = 6
      FieldName = 'UNIT_NAME'
    end
    object aqQueryTDATE: TDateTimeField
      DisplayLabel = #21457#25918#26085#26399
      FieldName = 'TDATE'
    end
    object aqQueryEMPLOYEE_NAME: TStringField
      DisplayLabel = #39046#26009#20154#21592
      DisplayWidth = 10
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object aqQueryLOCATION: TStringField
      DisplayLabel = #20179#24211
      DisplayWidth = 15
      FieldName = 'LOCATION'
    end
    object aqQueryWAREHOUSE_CODE: TStringField
      DisplayLabel = #39046#26009#24037#21378#20195#30721
      DisplayWidth = 15
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object aqQueryWAREHOUSE_NAME: TStringField
      DisplayLabel = #39046#26009#24037#21378
      FieldName = 'WAREHOUSE_NAME'
      Size = 10
    end
    object aqQueryv_type: TStringField
      DisplayLabel = #20837#24211#31867#22411
      DisplayWidth = 10
      FieldName = 'v_type'
      ReadOnly = True
      Size = 8
    end
    object aqQueryFL_EMPLOYEE: TStringField
      DisplayLabel = #21457#26009#20154#21592
      DisplayWidth = 10
      FieldName = 'FL_EMPLOYEE'
      Size = 16
    end
    object aqQueryANALYSIS_CODE1: TStringField
      DisplayLabel = #25511#21046#32773
      DisplayWidth = 10
      FieldName = 'ANALYSIS_CODE1'
      FixedChar = True
    end
    object aqQueryANALYSIS_CODE2: TStringField
      DisplayLabel = #20998#26512#20195#30721'2'
      DisplayWidth = 10
      FieldName = 'ANALYSIS_CODE2'
      FixedChar = True
    end
    object aqQueryANALYSIS_CODE3: TStringField
      DisplayLabel = #20998#26512#20195#30721'3'
      DisplayWidth = 10
      FieldName = 'ANALYSIS_CODE3'
      FixedChar = True
    end
    object aqQueryVDATE: TDateTimeField
      DisplayLabel = #20837#24211#26085#26399
      FieldName = 'VDATE'
    end
  end
end
