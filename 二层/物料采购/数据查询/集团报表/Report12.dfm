inherited frmReport12: TfrmReport12
  Caption = 'frmReport12'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel2: TPanel
    inherited DBGridEh1: TDBGridEh
      Columns = <
        item
          EditButtons = <>
          FieldName = 'PO_NUMBER'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'PO_DATE'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'DATE_EDITED'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'EXPIRED_DATE'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'DESCRIPTION'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'GUI_GE'
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
          FieldName = 'FOB'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'PO_REV_NO'
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
          FieldName = 'V_STATUS'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'ABBR_NAME'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'Tag'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'ZSJFL'
          Footers = <>
          ReadOnly = False
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'DESCRIPTION2'
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
          FieldName = 'QUAN_ORD'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'QUANTITY_RECEIVED'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'no_recd'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
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
          FieldName = 'total'
          Footer.ValueType = fvtSum
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
          FieldName = 'DEL_DATE'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'recd_date'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
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
          FieldName = 'wh_abb_name'
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
        end>
    end
  end
  inherited dsQuery: TDataSource
    DataSet = cds1
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
      'Exec SP_GroupReports;12 :Servers, :Condition, :OrderBy')
    object aqQueryPO_NUMBER: TStringField
      DisplayLabel = #37319#36141#32534#21495
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object aqQueryFOB: TStringField
      DisplayLabel = #35831#36141#32534#21495
      FieldName = 'FOB'
      Size = 15
    end
    object aqQueryPO_DATE: TDateTimeField
      DisplayLabel = #37319#36141#26085#26399
      FieldName = 'PO_DATE'
    end
    object aqQueryDATE_EDITED: TDateTimeField
      DisplayLabel = #25552#20132#23457#25209#26085#26399
      FieldName = 'DATE_EDITED'
    end
    object aqQueryEMPLOYEE_NAME: TStringField
      DisplayLabel = #37319#36141#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object aqQueryABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object aqQueryCURR_CODE: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object aqQueryDESCRIPTION: TStringField
      DisplayLabel = #29289#21697#21517#31216
      DisplayWidth = 15
      FieldName = 'DESCRIPTION'
      Size = 60
    end
    object aqQueryDESCRIPTION2: TStringField
      DisplayLabel = #29289#21697#31867#21035
      FieldName = 'DESCRIPTION2'
      FixedChar = True
    end
    object aqQueryGUI_GE: TStringField
      DisplayLabel = #29289#21697#35268#26684
      DisplayWidth = 30
      FieldName = 'GUI_GE'
      Size = 200
    end
    object aqQueryPM_GG: TStringField
      DisplayLabel = #21697#21517#35268#26684
      DisplayWidth = 50
      FieldName = 'PM_GG'
      Size = 261
    end
    object aqQueryQUAN_ORD: TFloatField
      DisplayLabel = #35746#36141#25968#37327
      FieldName = 'QUAN_ORD'
    end
    object aqQuerytax_price: TFloatField
      DisplayLabel = #21547#31246#20215
      FieldName = 'tax_price'
    end
    object aqQueryPO_REV_NO: TStringField
      DisplayLabel = #35831#36141#37096#38376#20195#30721
      FieldName = 'PO_REV_NO'
      Size = 10
    end
    object aqQueryDEPT_NAME: TStringField
      DisplayLabel = #35831#36141#37096#38376#21517#31216
      DisplayWidth = 15
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object aqQueryQUANTITY_RECEIVED: TFloatField
      DisplayLabel = #24050#25910#25968#37327
      FieldName = 'QUANTITY_RECEIVED'
    end
    object aqQueryno_recd: TFloatField
      DisplayLabel = #26410#25910#25968#37327
      FieldName = 'no_recd'
      ReadOnly = True
    end
    object aqQuerytotal: TFloatField
      DisplayLabel = #24635#35745#37329#39069'('#26412#20301#24065')'
      DisplayWidth = 15
      FieldName = 'total'
      ReadOnly = True
    end
    object aqQueryUNIT_NAME: TStringField
      DisplayLabel = #37319#36141#21333#20301
      DisplayWidth = 8
      FieldName = 'UNIT_NAME'
    end
    object aqQueryV_STATUS: TStringField
      DisplayLabel = #37319#36141#35746#21333#29366#24577
      DisplayWidth = 12
      FieldName = 'V_STATUS'
      ReadOnly = True
      Size = 6
    end
    object aqQueryEXPIRED_DATE: TDateTimeField
      DisplayLabel = #26368#21518#23457#25209#26085#26399
      FieldName = 'EXPIRED_DATE'
    end
    object aqQueryDEL_DATE: TDateTimeField
      DisplayLabel = #35201#27714#21040#36135#26085#26399
      FieldName = 'DEL_DATE'
    end
    object aqQueryrecd_date: TDateTimeField
      DisplayLabel = #26368#21518#25910#36135#26085#26399
      FieldName = 'recd_date'
    end
    object aqQueryTag: TStringField
      DisplayLabel = #20934#26102#20132#20184
      FieldName = 'Tag'
      ReadOnly = True
      Size = 4
    end
    object aqQueryZSJFL: TFloatField
      DisplayLabel = #20934#26102#20132#20184#29575'(%)'
      FieldName = 'ZSJFL'
    end
    object aqQueryrohs: TStringField
      DisplayLabel = #29615#20445#26631#35782
      FieldName = 'rohs'
      Size = 10
    end
    object aqQuerywh_abb_name: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'wh_abb_name'
      Size = 10
    end
    object aqQueryreason: TStringField
      DisplayLabel = #35831#36141#21407#22240
      FieldName = 'reason'
      Size = 60
    end
  end
  object dsp1: TDataSetProvider
    DataSet = aqQuery
    Left = 720
    Top = 221
  end
  object cds1: TClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    ProviderName = 'dsp1'
    Left = 720
    Top = 165
    object cds1PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#32534#21495
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object cds1FOB: TStringField
      DisplayLabel = #35831#36141#32534#21495
      FieldName = 'FOB'
      Size = 15
    end
    object cds1PO_DATE: TDateTimeField
      DisplayLabel = #37319#36141#26085#26399
      FieldName = 'PO_DATE'
    end
    object cds1DATE_EDITED: TDateTimeField
      DisplayLabel = #25552#20132#23457#25209#26085#26399
      FieldName = 'DATE_EDITED'
    end
    object cds1EMPLOYEE_NAME: TStringField
      DisplayLabel = #37319#36141#21592#24037
      DisplayWidth = 10
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object cds1ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object cds1CURR_CODE: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object cds1DESCRIPTION: TStringField
      DisplayLabel = #29289#21697#21517#31216
      DisplayWidth = 15
      FieldName = 'DESCRIPTION'
      Size = 60
    end
    object cds1DESCRIPTION2: TStringField
      DisplayLabel = #29289#21697#31867#21035
      FieldName = 'DESCRIPTION2'
      FixedChar = True
    end
    object cds1GUI_GE: TStringField
      DisplayLabel = #29289#21697#35268#26684
      DisplayWidth = 30
      FieldName = 'GUI_GE'
      Size = 200
    end
    object cds1PM_GG: TStringField
      DisplayLabel = #21697#21517#35268#26684
      DisplayWidth = 50
      FieldName = 'PM_GG'
      Size = 261
    end
    object cds1QUAN_ORD: TFloatField
      DisplayLabel = #35746#36141#25968#37327
      FieldName = 'QUAN_ORD'
    end
    object cds1tax_price: TFloatField
      DisplayLabel = #21547#31246#20215
      FieldName = 'tax_price'
    end
    object cds1PO_REV_NO: TStringField
      DisplayLabel = #35831#36141#37096#38376#20195#30721
      FieldName = 'PO_REV_NO'
      Size = 10
    end
    object cds1DEPT_NAME: TStringField
      DisplayLabel = #35831#36141#37096#38376#21517#31216
      DisplayWidth = 15
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object cds1QUANTITY_RECEIVED: TFloatField
      DisplayLabel = #24050#25910#25968#37327
      FieldName = 'QUANTITY_RECEIVED'
    end
    object cds1no_recd: TFloatField
      DisplayLabel = #26410#25910#25968#37327
      FieldName = 'no_recd'
      ReadOnly = True
    end
    object cds1total: TFloatField
      DisplayLabel = #24635#35745#37329#39069'('#26412#20301#24065')'
      DisplayWidth = 16
      FieldName = 'total'
      ReadOnly = True
    end
    object cds1UNIT_NAME: TStringField
      DisplayLabel = #37319#36141#21333#20301
      DisplayWidth = 8
      FieldName = 'UNIT_NAME'
    end
    object cds1V_STATUS: TStringField
      DisplayLabel = #37319#36141#35746#21333#29366#24577
      DisplayWidth = 12
      FieldName = 'V_STATUS'
      ReadOnly = True
      Size = 6
    end
    object cds1EXPIRED_DATE: TDateTimeField
      DisplayLabel = #26368#21518#23457#25209#26085#26399
      FieldName = 'EXPIRED_DATE'
    end
    object cds1DEL_DATE: TDateTimeField
      DisplayLabel = #35201#27714#21040#36135#26085#26399
      FieldName = 'DEL_DATE'
    end
    object cds1recd_date: TDateTimeField
      DisplayLabel = #26368#21518#25910#36135#26085#26399
      FieldName = 'recd_date'
    end
    object cds1Tag: TStringField
      DisplayLabel = #20934#26102#20132#20184
      DisplayWidth = 8
      FieldName = 'Tag'
      ReadOnly = True
      Size = 4
    end
    object cds1ZSJFL: TFloatField
      DisplayLabel = #20934#26102#20132#20184#29575'(%)'
      DisplayWidth = 15
      FieldName = 'ZSJFL'
      DisplayFormat = '#0.##'
    end
    object cds1rohs: TStringField
      DisplayLabel = #29615#20445#26631#35782
      FieldName = 'rohs'
      Size = 10
    end
    object cds1wh_abb_name: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'wh_abb_name'
      Size = 10
    end
    object cds1reason: TStringField
      DisplayLabel = #35831#36141#21407#22240
      DisplayWidth = 20
      FieldName = 'reason'
      Size = 60
    end
  end
end
