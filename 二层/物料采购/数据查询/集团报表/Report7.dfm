inherited frmReport7: TfrmReport7
  Caption = 'frmReport7'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel2: TPanel
    inherited DBGridEh1: TDBGridEh
      Columns = <
        item
          EditButtons = <>
          FieldName = 'code'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'supplier_name'
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
        end
        item
          EditButtons = <>
          FieldName = 'status'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'brother_flag'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'ttype'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'suppier_ent_date'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'contact_name_1'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'cont_phone_1'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'phone'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'fax'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'telex'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'curr_name'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'country_name'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'employee_name'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'update_date'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'billing_address_1'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'tax_id_number'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'analysis_code1'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'developer'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'invalid_explain'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
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
      'Exec SP_GroupReports;7 :Servers, :Condition, :OrderBy, :CHSName')
    Top = 60
    object aqQuerycode: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'code'
      Size = 10
    end
    object aqQuerysupplier_name: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      DisplayWidth = 18
      FieldName = 'supplier_name'
      Size = 100
    end
    object aqQueryabbr_name: TStringField
      DisplayLabel = #21517#31216#32553#20889
      DisplayWidth = 12
      FieldName = 'abbr_name'
      Size = 16
    end
    object aqQuerystatus: TStringField
      DisplayLabel = #29366#24577
      DisplayWidth = 6
      FieldName = 'status'
      ReadOnly = True
      Size = 4
    end
    object aqQuerybrother_flag: TStringField
      DisplayLabel = #20851#32852#20844#21496
      DisplayWidth = 10
      FieldName = 'brother_flag'
      ReadOnly = True
      Size = 2
    end
    object aqQueryttype: TStringField
      DisplayLabel = #21512#20316#31867#22411
      FieldName = 'ttype'
      ReadOnly = True
      Size = 10
    end
    object aqQuerysuppier_ent_date: TDateTimeField
      DisplayLabel = #21512#20316#26085#26399
      FieldName = 'suppier_ent_date'
    end
    object aqQuerycontact_name_1: TStringField
      DisplayLabel = #19994#21153#32852#31995#20154
      DisplayWidth = 10
      FieldName = 'contact_name_1'
    end
    object aqQuerycont_phone_1: TStringField
      DisplayLabel = #32852#31995#20154#30005#35805
      FieldName = 'cont_phone_1'
      FixedChar = True
      Size = 14
    end
    object aqQueryphone: TStringField
      DisplayLabel = #20379#24212#21830#30005#35805
      FieldName = 'phone'
    end
    object aqQueryfax: TStringField
      DisplayLabel = #20256#30495#21495#30721
      FieldName = 'fax'
    end
    object aqQuerytelex: TStringField
      DisplayLabel = #24320#25143#38134#34892
      DisplayWidth = 20
      FieldName = 'telex'
      Size = 40
    end
    object aqQuerycurr_name: TStringField
      DisplayLabel = #24065#31181
      DisplayWidth = 8
      FieldName = 'curr_name'
    end
    object aqQuerycountry_name: TStringField
      DisplayLabel = #22269#23478
      DisplayWidth = 10
      FieldName = 'country_name'
      Size = 30
    end
    object aqQueryemployee_name: TStringField
      DisplayLabel = #20462#25913#29992#25143
      DisplayWidth = 10
      FieldName = 'employee_name'
      Size = 16
    end
    object aqQueryupdate_date: TDateTimeField
      DisplayLabel = #20462#25913#26085#26399
      FieldName = 'update_date'
    end
    object aqQuerybilling_address_1: TStringField
      DisplayLabel = #35814#32454#22320#22336
      DisplayWidth = 25
      FieldName = 'billing_address_1'
      Size = 100
    end
    object aqQuerytax_id_number: TStringField
      DisplayLabel = #20184#27454#26041#24335
      DisplayWidth = 15
      FieldName = 'tax_id_number'
    end
    object aqQuerydeveloper: TWideStringField
      DisplayLabel = #20379#24212#21830#24320#21457#20154#21592
      DisplayWidth = 15
      FieldName = 'developer'
      Size = 50
    end
    object aqQueryinvalid_explain: TWideStringField
      DisplayLabel = #20379#24212#21830#26080#25928#35828#26126
      DisplayWidth = 20
      FieldName = 'invalid_explain'
      Size = 50
    end
    object aqQueryanalysis_code1: TStringField
      DisplayLabel = #31080#25454#31181#31867
      DisplayWidth = 10
      FieldName = 'analysis_code1'
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
