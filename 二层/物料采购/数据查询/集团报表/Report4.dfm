inherited frmReport4: TfrmReport4
  Caption = 'frmReport4'
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
          FieldName = 'QUAN_ON_HAND'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'quan_total'
          Footer.ValueType = fvtSum
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
          FieldName = 'tax_price'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'PRICE'
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
          FieldName = 'L_no_taxprice'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'L_tax_price'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'amount_notax'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'amount_tax'
          Footer.ValueType = fvtSum
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
          FieldName = 'spec_place'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'code_23'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'code23'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'po_emplname'
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
          FieldName = 'GRN_NUMBER'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'ReqName'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'RecName'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'ship_DATE'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'EXPIRE_DATE'
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
          FieldName = 'huoling'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'dqts'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'type'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'FactoryName'
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
      'Exec SP_GroupReports;4 :Servers, :Condition, :OrderBy')
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
    object aqQueryLOCATION: TStringField
      DisplayLabel = #20179#24211
      DisplayWidth = 10
      FieldName = 'LOCATION'
    end
    object aqQueryspec_place: TStringField
      DisplayLabel = #20855#20307#20301#32622
      DisplayWidth = 10
      FieldName = 'spec_place'
    end
    object aqQuerycode_23: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'code_23'
      Size = 10
    end
    object aqQuerycode23: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      DisplayWidth = 10
      FieldName = 'code23'
      Size = 16
    end
    object aqQueryQUAN_ON_HAND: TBCDField
      DisplayLabel = #29616#26377#24211#23384
      DisplayWidth = 10
      FieldName = 'QUAN_ON_HAND'
      Precision = 19
    end
    object aqQueryquan_total: TBCDField
      DisplayLabel = #26377#25928#24211#23384
      DisplayWidth = 10
      FieldName = 'quan_total'
      ReadOnly = True
      Precision = 22
      Size = 6
    end
    object aqQueryCURR_CODE: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object aqQuerytax_price: TBCDField
      DisplayLabel = #21547#31246#21333#20215'('#21407#24065')'
      DisplayWidth = 12
      FieldName = 'tax_price'
      Precision = 13
    end
    object aqQueryPRICE: TBCDField
      DisplayLabel = #19981#21547#31246#21333#20215'('#21407#24065')'
      DisplayWidth = 12
      FieldName = 'PRICE'
      Precision = 15
      Size = 6
    end
    object aqQueryTAX_2: TBCDField
      DisplayLabel = #31246#29575'%'
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object aqQueryL_no_taxprice: TBCDField
      DisplayLabel = #19981#21547#31246#21333#20215'('#26412#24065')'
      DisplayWidth = 12
      FieldName = 'L_no_taxprice'
      ReadOnly = True
      Precision = 28
      Size = 14
    end
    object aqQueryL_tax_price: TBCDField
      DisplayLabel = #21547#31246#21333#20215'('#26412#24065')'
      DisplayWidth = 12
      FieldName = 'L_tax_price'
      ReadOnly = True
      Precision = 26
      Size = 12
    end
    object aqQueryamount_notax: TBCDField
      DisplayLabel = #19981#21547#31246#37329#39069'('#26412#24065')'
      DisplayWidth = 15
      FieldName = 'amount_notax'
      ReadOnly = True
      Precision = 32
      Size = 8
    end
    object aqQueryamount_tax: TBCDField
      DisplayLabel = #21547#31246#37329#39069'('#26412#24065')'
      DisplayWidth = 15
      FieldName = 'amount_tax'
      ReadOnly = True
      Precision = 32
      Size = 8
    end
    object aqQueryPO_NUMBER: TStringField
      DisplayLabel = #37319#36141#21333#21495
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object aqQuerypo_emplname: TStringField
      DisplayLabel = #37319#36141#21592
      DisplayWidth = 8
      FieldName = 'po_emplname'
      Size = 16
    end
    object aqQueryGRN_NUMBER: TStringField
      DisplayLabel = #20837#24211#21333#21495
      DisplayWidth = 15
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object aqQueryship_DATE: TDateTimeField
      DisplayLabel = #25910#36135#26085#26399
      FieldName = 'ship_DATE'
    end
    object aqQueryEXPIRE_DATE: TDateTimeField
      DisplayLabel = #26377#25928#26399
      FieldName = 'EXPIRE_DATE'
    end
    object aqQueryTDATE: TDateTimeField
      DisplayLabel = #21046#36896#26085#26399
      FieldName = 'TDATE'
    end
    object aqQueryhuoling: TIntegerField
      DisplayLabel = #36135#40836
      DisplayWidth = 8
      FieldName = 'huoling'
      ReadOnly = True
    end
    object aqQuerydqts: TIntegerField
      DisplayLabel = #21040#26399#22825#25968
      DisplayWidth = 8
      FieldName = 'dqts'
      ReadOnly = True
    end
    object aqQueryANALYSIS_CODE1: TStringField
      DisplayLabel = #25511#21046#32773
      DisplayWidth = 10
      FieldName = 'ANALYSIS_CODE1'
      FixedChar = True
    end
    object aqQueryUNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      DisplayWidth = 5
      FieldName = 'UNIT_NAME'
    end
    object aqQueryReqName: TStringField
      DisplayLabel = #35831#36141#20154
      DisplayWidth = 10
      FieldName = 'ReqName'
      Size = 16
    end
    object aqQueryRecName: TStringField
      DisplayLabel = #25910#36135#20154
      DisplayWidth = 10
      FieldName = 'RecName'
      Size = 16
    end
    object aqQuerytype: TStringField
      DisplayLabel = #35746#21333#31867#22411
      DisplayWidth = 10
      FieldName = 'type'
      ReadOnly = True
      Size = 8
    end
    object aqQueryFactoryName: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'FactoryName'
      Size = 10
    end
  end
end
