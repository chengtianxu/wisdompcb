inherited frmReport9: TfrmReport9
  Caption = 'frmReport9'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel2: TPanel
    inherited DBGridEh1: TDBGridEh
      Columns = <
        item
          EditButtons = <>
          FieldName = 'PO_REQ_NUMBER'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'DEPARTMENT_NAME'
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
          FieldName = 'REQ_DATE'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'ENT_DATE'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'EDITED_DATE'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'AUTH_DATE'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'PO_Do_Hour'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'Undo_Day'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'v_status'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'BackType'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
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
          FieldName = 'Buyer'
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
          FieldName = 'INV_PART_description'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'code'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
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
          FieldName = 'unit_name'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'tax_PRICE'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
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
          FieldName = 'total'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'reason'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'BackReason'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'rohs'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'abbr_NAME'
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
      'Exec SP_GroupReports;9 :Servers, :Condition, :OrderBy')
    object aqQueryPO_REQ_NUMBER: TStringField
      DisplayLabel = #35831#36141#32534#21495
      FieldName = 'PO_REQ_NUMBER'
      Size = 15
    end
    object aqQueryDEPARTMENT_NAME: TStringField
      DisplayLabel = #35831#36141#37096#38376#20195#30721
      DisplayWidth = 15
      FieldName = 'DEPARTMENT_NAME'
      Size = 10
    end
    object aqQueryDEPT_NAME: TStringField
      DisplayLabel = #35831#36141#37096#38376#21517#31216
      DisplayWidth = 15
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object aqQueryAUTH_DATE: TDateTimeField
      DisplayLabel = #25552#20132#37319#36141#26085#26399
      FieldName = 'AUTH_DATE'
    end
    object aqQueryREQ_DATE: TDateTimeField
      DisplayLabel = #35831#36141#26085#26399
      FieldName = 'REQ_DATE'
    end
    object aqQueryEMPLOYEE_NAME: TStringField
      DisplayLabel = #35831#36141#21592#24037
      DisplayWidth = 10
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object aqQueryBuyer: TStringField
      DisplayLabel = #37319#36141#20154#21592
      DisplayWidth = 10
      FieldName = 'Buyer'
      Size = 16
    end
    object aqQueryv_status: TStringField
      DisplayLabel = #35831#36141#21333#29366#24577
      FieldName = 'v_status'
      ReadOnly = True
      Size = 12
    end
    object aqQueryBackType: TStringField
      DisplayLabel = #36864#22238#31867#22411
      DisplayWidth = 10
      FieldName = 'BackType'
      Size = 8
    end
    object aqQueryabbr_NAME: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'abbr_NAME'
      Size = 10
    end
    object aqQueryINV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#21495
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object aqQueryINV_PART_description: TStringField
      DisplayLabel = #21697#21517#35268#26684
      DisplayWidth = 38
      FieldName = 'INV_PART_description'
      ReadOnly = True
      Size = 100
    end
    object aqQueryQUANTITY: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'QUANTITY'
    end
    object aqQuerytax_PRICE: TFloatField
      DisplayLabel = #21547#31246#20215
      FieldName = 'tax_PRICE'
    end
    object aqQuerycode: TStringField
      DisplayLabel = #20379#24212#21830
      DisplayWidth = 10
      FieldName = 'code'
      Size = 16
    end
    object aqQueryCURR_CODE: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object aqQueryreason: TStringField
      DisplayLabel = #35831#36141#21407#22240
      DisplayWidth = 20
      FieldName = 'reason'
      Size = 60
    end
    object aqQueryBackReason: TStringField
      DisplayLabel = #36864#22238#21407#22240
      DisplayWidth = 25
      FieldName = 'BackReason'
      Size = 283
    end
    object aqQueryENT_DATE: TDateTimeField
      DisplayLabel = #25552#20132#23457#25209#26085#26399
      FieldName = 'ENT_DATE'
    end
    object aqQuerytotal: TFloatField
      DisplayLabel = #24635#35745#37329#39069'('#26412#20301#24065')'
      DisplayWidth = 16
      FieldName = 'total'
      ReadOnly = True
    end
    object aqQueryEDITED_DATE: TDateTimeField
      DisplayLabel = #26368#21518#23457#25209#26085#26399
      FieldName = 'EDITED_DATE'
    end
    object aqQueryPO_Do_Hour: TIntegerField
      DisplayLabel = #35746#21333#22788#29702#26102#38388'(H)'
      DisplayWidth = 15
      FieldName = 'PO_Do_Hour'
    end
    object aqQueryUndo_Day: TIntegerField
      DisplayLabel = #26410#22788#29702#22825#25968
      FieldName = 'Undo_Day'
    end
    object aqQueryrohs: TStringField
      DisplayLabel = #29615#20445#26631#35782
      FieldName = 'rohs'
      Size = 10
    end
    object aqQueryunit_name: TStringField
      DisplayLabel = #21333#20301
      DisplayWidth = 5
      FieldName = 'unit_name'
    end
    object aqQueryANALYSIS_CODE1: TStringField
      DisplayLabel = #25511#21046#32773
      DisplayWidth = 10
      FieldName = 'ANALYSIS_CODE1'
      FixedChar = True
    end
  end
end
