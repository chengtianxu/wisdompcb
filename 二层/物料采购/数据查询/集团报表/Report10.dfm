inherited frmReport10: TfrmReport10
  Caption = 'frmReport10'
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
          FieldName = 'DESCRIPTION_1'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'gui_ge'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'PM_GG'
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
          Visible = False
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
          FieldName = 'DESCRIPTION_2'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'abbr_name'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'QUANTITY_REQUIRED'
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
          FieldName = 'CURR_CODE'
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
          FieldName = 'total'
          Footer.ValueType = fvtSum
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
          FieldName = 'warehouse_name'
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
      'Exec SP_GroupReports;10 :Servers, :Condition, :OrderBy')
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
    object aqQuerywarehouse_name: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'warehouse_name'
      Size = 10
    end
    object aqQueryDESCRIPTION_1: TStringField
      DisplayLabel = #29289#26009#21517#31216
      DisplayWidth = 25
      FieldName = 'DESCRIPTION_1'
      Size = 60
    end
    object aqQueryDESCRIPTION_2: TStringField
      DisplayLabel = #29289#26009#31867#21035
      DisplayWidth = 12
      FieldName = 'DESCRIPTION_2'
      FixedChar = True
    end
    object aqQueryabbr_name: TStringField
      DisplayLabel = #20379#24212#21830
      DisplayWidth = 10
      FieldName = 'abbr_name'
      Size = 16
    end
    object aqQueryAUTH_DATE: TDateTimeField
      DisplayLabel = #25552#20132#37319#36141#26085#26399
      FieldName = 'AUTH_DATE'
    end
    object aqQueryQUANTITY_REQUIRED: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'QUANTITY_REQUIRED'
    end
    object aqQuerytax_PRICE: TFloatField
      DisplayLabel = #21547#31246#20215
      FieldName = 'tax_PRICE'
    end
    object aqQueryrohs: TStringField
      DisplayLabel = #29615#20445#26631#35782
      FieldName = 'rohs'
      Size = 10
    end
    object aqQueryCURR_CODE: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object aqQuerygui_ge: TStringField
      DisplayLabel = #29289#26009#35268#26684
      DisplayWidth = 38
      FieldName = 'gui_ge'
      Size = 200
    end
    object aqQueryPM_GG: TStringField
      DisplayLabel = #21697#21517#35268#26684
      DisplayWidth = 50
      FieldName = 'PM_GG'
      Size = 261
    end
    object aqQueryreason: TStringField
      DisplayLabel = #35831#36141#21407#22240
      DisplayWidth = 20
      FieldName = 'reason'
      Size = 60
    end
    object aqQuerytotal: TFloatField
      DisplayLabel = #24635#35745#37329#39069
      FieldName = 'total'
      ReadOnly = True
    end
    object aqQueryENT_DATE: TDateTimeField
      DisplayLabel = #25552#20132#23457#25209#26085#26399
      FieldName = 'ENT_DATE'
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
    object aqQueryunit_name: TStringField
      DisplayLabel = #21333#20301
      DisplayWidth = 6
      FieldName = 'unit_name'
    end
    object aqQueryBackReason: TStringField
      DisplayLabel = #36864#22238#21407#22240
      DisplayWidth = 25
      FieldName = 'BackReason'
      Size = 283
    end
  end
end
