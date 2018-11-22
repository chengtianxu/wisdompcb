object form_salesorder: Tform_salesorder
  Left = 303
  Top = 128
  Width = 811
  Height = 583
  Caption = #38144#21806#23450#21333#25628#32034
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 40
    Width = 795
    Height = 458
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'SALES_ORDER'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sch_date'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_name'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_NUMBER'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'manu_part_desc'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PARTS_ORDERED'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'parts_shipped'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'weijao_qty'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_warehousename'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_status'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sotype'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ent_date'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RUSH_CHARGE'
        Width = 51
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 795
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      795
      40)
    object Label1: TLabel
      Left = 43
      Top = 17
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = #35746#21333#21495':'
    end
    object Edit1: TEdit
      Left = 98
      Top = 13
      Width = 197
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
      OnKeyDown = DBGrid1KeyDown
    end
    object BitBtn1: TBitBtn
      Left = 300
      Top = 11
      Width = 25
      Height = 25
      Hint = #21047#26032
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = False
      OnClick = BitBtn1Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADABFBFBDADADADADADDADADBFADADADADAADADAD000DADADADDADAD0FBF0DA
        DADAADAD0F7FBF0DADADDAD0F7F87BF0DADAAD0F7F87BFB70DADD0F7F87BFB78
        80DA000F87BFB78880ADDAD00BFB78880ADAADADA0B7888740ADDADADA088804
        440AADADADA000A04440DADADADADADA0440ADADADADADADA00D}
    end
    object RadioGroup1: TRadioGroup
      Left = 425
      Top = 2
      Width = 323
      Height = 35
      Anchors = [akTop]
      Caption = #25628#32034#26465#20214#13#10
      Columns = 4
      ItemIndex = 0
      Items.Strings = (
        #38144#21806#35746#21333
        #23458#25143#35746#21333
        #26412#21378#32534#21495
        #23458#25143#22411#21495)
      TabOrder = 2
      OnClick = RadioGroup1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 498
    Width = 795
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      795
      46)
    object Label2: TLabel
      Left = 35
      Top = 7
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop]
      Caption = ' '#20174':'
    end
    object Label3: TLabel
      Left = 35
      Top = 29
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop]
      Caption = ' '#21040':'
    end
    object Button1: TButton
      Left = 290
      Top = 12
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 396
      Top = 12
      Width = 75
      Height = 25
      Anchors = [akTop]
      Cancel = True
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
    object CheckBox6: TCheckBox
      Left = 517
      Top = 7
      Width = 68
      Height = 17
      Anchors = [akTop]
      Caption = #26410#25552#20132
      TabOrder = 2
      OnClick = CheckBox6Click
    end
    object CheckBox1: TCheckBox
      Left = 596
      Top = 6
      Width = 77
      Height = 17
      Anchors = [akTop]
      Caption = #26377#25928#30340
      Checked = True
      State = cbChecked
      TabOrder = 3
      OnClick = CheckBox6Click
    end
    object CheckBox2: TCheckBox
      Left = 667
      Top = 6
      Width = 71
      Height = 17
      Anchors = [akTop]
      Caption = #26242#32531
      TabOrder = 4
      OnClick = CheckBox6Click
    end
    object CheckBox3: TCheckBox
      Left = 517
      Top = 25
      Width = 68
      Height = 17
      Anchors = [akTop]
      Caption = #24050#20851#38381
      TabOrder = 5
      OnClick = CheckBox6Click
    end
    object CheckBox4: TCheckBox
      Left = 596
      Top = 24
      Width = 77
      Height = 17
      Anchors = [akTop]
      Caption = #24050#23436#25104
      Checked = True
      State = cbChecked
      TabOrder = 6
      OnClick = CheckBox6Click
    end
    object CheckBox5: TCheckBox
      Left = 667
      Top = 25
      Width = 71
      Height = 17
      Anchors = [akTop]
      Caption = #24050#21462#28040
      TabOrder = 7
      OnClick = CheckBox6Click
    end
    object dtpk1: TDateTimePicker
      Left = 70
      Top = 2
      Width = 98
      Height = 21
      Anchors = [akTop]
      Date = 38687.000000000000000000
      Time = 38687.000000000000000000
      TabOrder = 8
      OnCloseUp = dtpk1Exit
      OnExit = dtpk1Exit
    end
    object dtpk2: TDateTimePicker
      Left = 70
      Top = 25
      Width = 98
      Height = 21
      Anchors = [akTop]
      Date = 38687.000000000000000000
      Time = 38687.000000000000000000
      TabOrder = 9
      OnCloseUp = dtpk1Exit
      OnExit = dtpk1Exit
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOquery1
    OnDataChange = DataSource1DataChange
    Left = 76
    Top = 439
  end
  object ADOquery1: TADODataSet
    Connection = dm.ADOConnection1
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT'#13#10'  Data0060.RKEY ,Data0060.customer_ptr,'#13#10'  Data0060.SALE' +
      'S_ORDER,data0060.cust_part_ptr,'#13#10'  data0060.PARTS_ORDERED,Data00' +
      '60.STATUS,'#13#10'  data0060.ent_date,data0060.sch_date, data0060.RUSH' +
      '_CHARGE,'#13#10'  data0060.parts_shipped,data0060.PARTS_RETURNED,'#13#10'  D' +
      'ata0060.PARTS_ORDERED +Data0060.PARTS_RETURNED- '#13#10'  Data0060.PAR' +
      'TS_SHIPPED - data0060.returned_ship AS weijao_qty,'#13#10'  data0010.a' +
      'bbr_name,Data0010.cust_code,data0010.customer_name,'#13#10'  Data0097.' +
      'PO_NUMBER,data0015.abbr_name as abbr_warehousename,'#13#10'  data0025.' +
      'manu_part_desc,Data0025.MANU_PART_NUMBER,'#13#10'  data0025.ANALYSIS_C' +
      'ODE_1,Data0025.REPORT_UNIT_VALUE1,'#13#10' case data0060.so_tp when 0 ' +
      'then '#39#33258#21046#39' when 1 then '#39#22806#21457#39#13#10'          when 2 then '#39#21322#21046#31243#39' end as s' +
      'otype,'#13#10' case data0060.status'#13#10'        when 1 then '#39#26377#25928#30340#39' when 2 ' +
      'then '#39#26242#32531#39' when 3 then '#39#24050#20851#38381#39#13#10'       when 4 then '#39#24050#23436#25104#39' when 5 the' +
      'n '#39#24050#21462#28040#39' when 6 then '#39#26410#25552#20132#39' end as v_status'#13#10#13#10'FROM  Data0060 inne' +
      'r join Data0010 on  Data0060.CUSTOMER_PTR = Data0010.RKEY'#13#10'     ' +
      '      inner join data0097 on  Data0060.PURCHASE_ORDER_PTR = Data' +
      '0097.RKEY'#13#10'           inner join Data0025 on  Data0060.CUST_PART' +
      '_PTR = Data0025.RKEY'#13#10'           inner join data0015 on data0060' +
      '.SHIP_REG_TAX_ID = data0015.rkey'#13#10'where'#13#10' data0060.PROD_REL <> 1' +
      ' and '#13#10' data0060.ent_date >= :dtpk1 and'#13#10' data0060.ent_date <= :' +
      'dtpk2 and'#13#10' Data0060.STATUS <> :v1 AND Data0060.STATUS <> :v2 an' +
      'd'#13#10' Data0060.STATUS <> :v3 AND Data0060.STATUS <> :v4 and'#13#10' Data' +
      '0060.STATUS <> :v5 AND Data0060.STATUS <> :v6 and'#13#10' Data0060.cus' +
      'tomer_ptr = :rkey10'#13#10'ORDER BY'#13#10'  Data0060.SALES_ORDER'
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'v1'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 0
      end
      item
        Name = 'v2'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 2
      end
      item
        Name = 'v3'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 3
      end
      item
        Name = 'v4'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 0
      end
      item
        Name = 'v5'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 5
      end
      item
        Name = 'v6'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 6
      end
      item
        Name = 'rkey10'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 109
    Top = 440
    object ADOquery1RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOquery1customer_ptr: TIntegerField
      FieldName = 'customer_ptr'
    end
    object ADOquery1SALES_ORDER: TStringField
      DisplayLabel = #38144#21806#35746#21333
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ADOquery1cust_part_ptr: TIntegerField
      FieldName = 'cust_part_ptr'
    end
    object ADOquery1PARTS_ORDERED: TFloatField
      DisplayLabel = #35746#21333#25968#37327
      FieldName = 'PARTS_ORDERED'
    end
    object ADOquery1STATUS: TWordField
      FieldName = 'STATUS'
    end
    object ADOquery1sch_date: TDateTimeField
      DisplayLabel = #22238#22797#20132#26399
      FieldName = 'sch_date'
    end
    object ADOquery1parts_shipped: TFloatField
      DisplayLabel = #24050#25351#27966#25968#37327
      FieldName = 'parts_shipped'
    end
    object ADOquery1PARTS_RETURNED: TFloatField
      FieldName = 'PARTS_RETURNED'
    end
    object ADOquery1weijao_qty: TFloatField
      DisplayLabel = #27424#36135#25968#37327
      FieldName = 'weijao_qty'
      ReadOnly = True
    end
    object ADOquery1abbr_name: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'abbr_name'
      Size = 10
    end
    object ADOquery1cust_code: TStringField
      FieldName = 'cust_code'
      Size = 10
    end
    object ADOquery1customer_name: TStringField
      FieldName = 'customer_name'
      Size = 100
    end
    object ADOquery1PO_NUMBER: TStringField
      DisplayLabel = #23458#25143#35746#21333#21495
      FieldName = 'PO_NUMBER'
      Size = 100
    end
    object ADOquery1abbr_warehousename: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'abbr_warehousename'
      Size = 10
    end
    object ADOquery1manu_part_desc: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'manu_part_desc'
      Size = 80
    end
    object ADOquery1MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
      Size = 30
    end
    object ADOquery1ANALYSIS_CODE_1: TStringField
      FieldName = 'ANALYSIS_CODE_1'
      Size = 30
    end
    object ADOquery1REPORT_UNIT_VALUE1: TBCDField
      FieldName = 'REPORT_UNIT_VALUE1'
      Precision = 9
    end
    object ADOquery1sotype: TStringField
      DisplayLabel = #21152#24037#24418#24335
      FieldName = 'sotype'
      ReadOnly = True
      Size = 6
    end
    object ADOquery1v_status: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'v_status'
      ReadOnly = True
      Size = 6
    end
    object ADOquery1RUSH_CHARGE: TBCDField
      DisplayLabel = #31246#29575'%'
      FieldName = 'RUSH_CHARGE'
      Precision = 5
      Size = 2
    end
    object ADOquery1ent_date: TDateTimeField
      DisplayLabel = #19979#21333#26085#26399
      FieldName = 'ent_date'
    end
  end
end
