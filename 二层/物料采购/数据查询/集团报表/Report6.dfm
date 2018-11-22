inherited frmReport6: TfrmReport6
  Caption = 'frmReport6'
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    inherited Panel4: TPanel
      inherited edtFilter: TEdit
        Height = 21
      end
    end
  end
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
          FieldName = 'GROUP_DESC'
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
          FieldName = 'zaitu'
          Footer.ValueType = fvtSum
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
          FieldName = 'tax_price'
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
          FieldName = 'PO_DATE'
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
          FieldName = 'PO_NUMBER'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'vType'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'ANALYSIS_CODE_1'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'EMPLOYEE_NAME'
          Footers = <>
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'reason'
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
        end
        item
          EditButtons = <>
          FieldName = 'ComNm'
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
      'Exec SP_GroupReports;6 :Servers, :Condition, :OrderBy')
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
    object aqQueryGROUP_DESC: TStringField
      DisplayLabel = #26448#26009#31867#22411
      DisplayWidth = 15
      FieldName = 'GROUP_DESC'
      Size = 30
    end
    object aqQueryABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      DisplayWidth = 10
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object aqQueryzaitu: TFloatField
      DisplayLabel = #22312#36884#25968#37327
      FieldName = 'zaitu'
      ReadOnly = True
    end
    object aqQueryUNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      DisplayWidth = 6
      FieldName = 'UNIT_NAME'
    end
    object aqQuerytax_price: TFloatField
      DisplayLabel = #21547#31246#21333#20215
      FieldName = 'tax_price'
    end
    object aqQueryTAX_2: TBCDField
      DisplayLabel = #31246#29575'%'
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object aqQueryPO_DATE: TDateTimeField
      DisplayLabel = #19979#21333#26085#26399
      FieldName = 'PO_DATE'
    end
    object aqQueryREQ_DATE: TDateTimeField
      DisplayLabel = #38656#27714#26085#26399
      FieldName = 'REQ_DATE'
    end
    object aqQueryPO_NUMBER: TStringField
      DisplayLabel = #37319#36141#21333#21495
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object aqQueryANALYSIS_CODE_1: TStringField
      DisplayLabel = #35831#36141#20154
      DisplayWidth = 10
      FieldName = 'ANALYSIS_CODE_1'
    end
    object aqQueryreason: TStringField
      DisplayLabel = #22791#27880
      DisplayWidth = 20
      FieldName = 'reason'
      Size = 60
    end
    object aqQueryrohs: TStringField
      DisplayLabel = #29615#20445#26631#35782
      FieldName = 'rohs'
      Size = 10
    end
    object aqQueryComNm: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'ComNm'
      Size = 10
    end
    object aqQueryANALYSIS_CODE1: TStringField
      DisplayLabel = #25511#21046#32773
      DisplayWidth = 10
      FieldName = 'ANALYSIS_CODE1'
      Visible = False
      FixedChar = True
    end
    object aqQueryEMPLOYEE_NAME: TStringField
      DisplayLabel = #37319#36141#21592
      DisplayWidth = 10
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object aqQueryvType: TStringField
      DisplayLabel = #35746#21333#31867#22411
      DisplayWidth = 10
      FieldName = 'vType'
      ReadOnly = True
      Size = 4
    end
  end
end
