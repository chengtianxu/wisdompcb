object Form2: TForm2
  Left = 118
  Top = 189
  Width = 1198
  Height = 638
  Caption = #25104#21697#20837#20179#26126#32454
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 465
    Top = 29
    Width = 179
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#37329#39069#21512#35745'('#26412#20301#24065','#19981#21547#31246'):'
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 49
    Width = 1182
    Height = 551
    Align = alClient
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'WORK_ORDER_NUMBER'
        Title.Caption = #20316#19994#21333#21495
        Width = 136
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_NUMBER'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANALYSIS_CODE_2'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        Title.Caption = #23458#25143#35746#21333#21495
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROD_CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUCT_NAME'
        Title.Caption = #20135#21697#31867#21035#21517#31216
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUST_CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_name'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORIG_CUSTOMER'
        Title.Caption = #20851#32852#21407#23458#25143
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WAREHOUSE_CODE'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCATION'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTITY'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'so_mianqi'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTY_ON_HAND'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MFG_DATE'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFERENCE_NUMBER'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'LATEST_ORIG_PRICE'
        Title.Caption = #19981#21547#31246#20215#26684'('#21407#24065')'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAXLATEST_ORIG_PRICE'
        Title.Caption = #21547#31246#20215#26684'('#21407#24065')'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LATEST_PRICE'
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAXLATEST_PRICE'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total_cost'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SO_NO'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SCH_DATE'
        Title.Caption = #35745#21010#22238#22797#20132#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'exch_rate'
        Title.Caption = #21407#24065#27719#29575
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'curr_code'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'number'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'c_type'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inweight'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'zhuanchang'
        Title.Caption = #26159#21542#36716#21378
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'so_REFERENCE_NUMBER'
        Title.Caption = #35746#21333#21442#32771
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'employee_name'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'layers'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'abbr_name23'
        Title.Caption = #22806#21327#21378#23478
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SAMPLE_NR'
        Title.Caption = #27979#24335#25104#22411#22791#27880
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'spec_place'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ischaban'
        Title.Caption = #22909#26495#21449#26495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'zhouqi'
        Title.Caption = #21608#26399
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PR_GRP_CODE'
        Title.Caption = #32452#21035#20195#30721
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUCT_GROUP_NAME'
        Title.Caption = #32452#21035#21517#31216
        Width = 90
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1182
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 377
      Top = 6
      Width = 113
      Height = 13
      Alignment = taRightJustify
      Caption = '    '#20837#20179#25968#37327#21512#35745':'
    end
    object Label2: TLabel
      Left = 569
      Top = 6
      Width = 179
      Height = 13
      Alignment = taRightJustify
      Caption = '   '#37329#39069#21512#35745'('#26412#20301#24065','#19981#21547#31246'):'
    end
    object Label3: TLabel
      Left = 377
      Top = 29
      Width = 113
      Height = 13
      Alignment = taRightJustify
      Caption = '    '#20837#20179#38754#31215#21512#35745':'
    end
    object Label5: TLabel
      Left = 582
      Top = 29
      Width = 166
      Height = 13
      Alignment = taRightJustify
      Caption = '   '#37329#39069#21512#35745'('#26412#20301#24065','#21547#31246'):'
    end
    object Button1: TButton
      Left = 9
      Top = 12
      Width = 65
      Height = 25
      Caption = #36864#20986
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 78
      Top = 12
      Width = 65
      Height = 25
      Caption = #23548#20986'Excel'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 146
      Top = 12
      Width = 65
      Height = 25
      Caption = #25171#21360#25253#34920
      TabOrder = 2
      OnClick = Button3Click
    end
    object Edit1: TEdit
      Left = 493
      Top = 2
      Width = 89
      Height = 21
      TabStop = False
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 3
      Text = '0.00'
    end
    object Edit2: TEdit
      Left = 752
      Top = 2
      Width = 121
      Height = 21
      TabStop = False
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 4
      Text = '0.0000'
    end
    object Edit3: TEdit
      Left = 493
      Top = 25
      Width = 89
      Height = 21
      TabStop = False
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 5
      Text = '0.00'
    end
    object Button4: TButton
      Left = 214
      Top = 12
      Width = 65
      Height = 25
      Hint = #29992#25143#33258#23450#20041#26174#31034#23383#27573
      Caption = #23383#27573
      ParentShowHint = False
      PopupMenu = PopupMenu1
      ShowHint = True
      TabOrder = 6
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 285
      Top = 12
      Width = 75
      Height = 25
      Hint = #26174#31034#25253#34920#35774#35745
      Caption = #35774#35745#25253#34920
      TabOrder = 7
      OnClick = Button5Click
    end
  end
  object Edit4: TEdit
    Left = 752
    Top = 25
    Width = 121
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 2
    Text = '0.0000'
  end
  object ADO53: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = ADO53CalcFields
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      
        'SELECT     TOP (100) PERCENT dbo.Data0006.WORK_ORDER_NUMBER, dbo' +
        '.Data0008.PROD_CODE, dbo.Data0008.PRODUCT_NAME, dbo.Data0015.WAR' +
        'EHOUSE_CODE,'
      
        '                      dbo.Data0016.LOCATION, dbo.Data0053.QUANTI' +
        'TY, dbo.data0416.number, dbo.Data0005.EMPLOYEE_NAME, dbo.data041' +
        '6.type, '
      
        '                      ROUND(dbo.Data0053.QUANTITY * dbo.Data0025' +
        '.unit_sq, 4) AS so_mianqi, dbo.Data0053.QTY_ON_HAND, dbo.Data005' +
        '3.MFG_DATE, '
      
        '                      dbo.Data0053.REFERENCE_NUMBER, dbo.Data005' +
        '3.RMA_PTR,dbo.data0053.spec_place, dbo.Data0053.QUANTITY * dbo.D' +
        'ata0025.REPORT_UNIT_VALUE1 / 1000 AS inweight, '
      
        '                      dbo.Data0025.MANU_PART_NUMBER, dbo.Data002' +
        '5.MANU_PART_DESC, dbo.Data0025.ANALYSIS_CODE_2, dbo.Data0025.SAM' +
        'PLE_NR,'
      
        '                      CASE WHEN Data0060_2.part_price >= 0 THEN ' +
        'ROUND(Data0060_2.PARTS_ALLOC, 6) ELSE Data0025.LATEST_PRICE END ' +
        'AS LATEST_ORIG_PRICE, '
      
        '                      CASE WHEN Data0060_2.part_price >= 0 THEN ' +
        'ROUND(Data0060_2.PARTS_ALLOC  / Data0060_2.EXCH_RATE, 6) '
      
        '                      ELSE Data0025.LATEST_PRICE END AS LATEST_P' +
        'RICE,dbo.Data0007.PR_GRP_CODE,dbo.Data0007.PRODUCT_GROUP_NAME,  '
      
        '                      CASE WHEN Data0060_2.part_price >= 0 THEN ' +
        'ROUND(Data0060_2.PARTS_ALLOC * (1 + Data0060_2.RUSH_CHARGE * 0.0' +
        '1), 6) '
      
        '                      ELSE Data0025.LATEST_PRICE END AS TAXLATES' +
        'T_ORIG_PRICE, '
      
        '                      CASE WHEN Data0060_2.part_price >= 0 THEN ' +
        'ROUND(Data0060_2.PARTS_ALLOC * (1 + Data0060_2.RUSH_CHARGE * 0.0' +
        '1)  / Data0060_2.EXCH_RATE, 6) '
      
        '                     ELSE Data0025.LATEST_PRICE END AS TAXLATEST' +
        '_PRICE, '
      
        '                     case when data0053.barcode_ptr is not null ' +
        'then data0060_2.ORIG_CUSTOMER else data0025.ORIG_CUSTOMER end as' +
        ' ORIG_CUSTOMER,'
      
        '                      CASE WHEN Data0060_2.PART_PRICE >= 0 THEN ' +
        ' Data0060_2.EXCH_RATE ELSE 1 END AS exch_rate, Data0060_2.SALES_' +
        'ORDER AS so_no, '
      
        '                      Data0060_2.REFERENCE_NUMBER AS so_REFERENC' +
        'E_NUMBER, dbo.Data0025.LAYERS, dbo.Data0001.CURR_CODE AS curr_co' +
        'de, '
      
        '                      CASE WHEN Data0060_2.PART_PRICE >= 0 THEN ' +
        'Data0010_1.cust_code ELSE data0010_2.cust_code END AS cust_code,' +
        ' '
      
        '                      CASE WHEN Data0060_2.PART_PRICE >= 0 THEN ' +
        'Data0010_1.ABBR_NAME ELSE data0010_2.ABBR_NAME END AS ABBR_NAME,' +
        ' '
      
        '                      CASE WHEN Data0060_2.PART_PRICE >= 0 THEN ' +
        'CASE data0060_2.COMMISION_ON_TOOLING WHEN '#39'N'#39' THEN '#39#20869#38144#39' WHEN '#39'Y'#39 +
        ' THEN '#39#36716#21378#39' END ELSE CASE data0010_2.EDI_FLAG_FOR_SOACK'
      
        '                       WHEN 0 THEN '#39#20869#38144#39' WHEN 1 THEN '#39#36716#21378#39' END END' +
        ' AS zhuanchang, dbo.Data0023.ABBR_NAME AS abbr_name23, '
      
        '                      CASE WHEN data0053.work_order_ptr > 0 THEN' +
        ' round(Data0053.QUANTITY * Data0006.panel_ln * Data0006.panel_wd' +
        ' * 0.000001 / Data0006.PARTS_PER_PANEL, 4) '
      
        '                      ELSE ROUND(dbo.Data0053.QUANTITY * dbo.Dat' +
        'a0025.unit_sq, 4) END AS total_sq, dbo.Data0097.PO_NUMBER,Data00' +
        '60_2.SCH_DATE,'
      
        'ROUND(Data0053.QUANTITY * (Data0053.cost_pcs+Data0053.matl_ovhd_' +
        'pcs+Data0053.OVHD_COST+Data0053.PLANNED_QTY+data0053.ovhd1_pcs+d' +
        'ata0053.outsource_pcs), 4) AS total_cost,'
      'data0053.ischaban,data0053.zhouqi'
      'FROM         dbo.Data0097 RIGHT OUTER JOIN'
      '                      dbo.Data0023 RIGHT OUTER JOIN'
      
        '                      dbo.Data0060 AS Data0060_2 ON dbo.Data0023' +
        '.RKEY = Data0060_2.supplier_ptr LEFT OUTER JOIN'
      
        '                      dbo.Data0001 ON Data0060_2.CURRENCY_PTR = ' +
        'dbo.Data0001.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0010 AS Data0010_1 ON Data0060_2.C' +
        'USTOMER_PTR = Data0010_1.RKEY ON '
      
        '                      dbo.Data0097.RKEY = Data0060_2.PURCHASE_OR' +
        'DER_PTR RIGHT OUTER JOIN'
      '                      dbo.data0416 INNER JOIN'
      
        '                      dbo.Data0005 ON dbo.data0416.empl_ptr = db' +
        'o.Data0005.RKEY INNER JOIN'
      '                      dbo.Data0008 INNER JOIN'
      
        '                      dbo.Data0025 ON dbo.Data0008.RKEY = dbo.Da' +
        'ta0025.PROD_CODE_PTR INNER JOIN'
      
        '                      dbo.Data0010 AS Data0010_2 ON dbo.Data0025' +
        '.CUSTOMER_PTR = Data0010_2.RKEY INNER JOIN'
      '                      dbo.Data0053 INNER JOIN'
      
        '                      dbo.Data0015 ON dbo.Data0053.WHSE_PTR = db' +
        'o.Data0015.RKEY INNER JOIN'
      
        '                      dbo.Data0016 ON dbo.Data0053.LOC_PTR = dbo' +
        '.Data0016.RKEY ON dbo.Data0025.RKEY = dbo.Data0053.CUST_PART_PTR' +
        ' ON '
      
        '                      dbo.data0416.rkey = dbo.Data0053.NPAD_PTR ' +
        'LEFT OUTER JOIN'
      
        '                      dbo.Data0006 ON dbo.Data0053.WORK_ORDER_PT' +
        'R = dbo.Data0006.RKEY ON Data0060_2.RKEY = dbo.Data0053.barcode_' +
        'ptr inner join'
      
        '                     dbo.data0007 ON dbo.data0008.PR_GRP_POINTER' +
        '=dbo.data0007.rkey'
      'WHERE     (dbo.Data0053.QUANTITY > 0) '
      'ORDER BY Data0010_2.CUST_CODE, dbo.Data0025.MANU_PART_NUMBER')
    Left = 248
    Top = 480
    object ADO53WORK_ORDER_NUMBER: TStringField
      DisplayLabel = #24037#20316#23450#21333
      DisplayWidth = 22
      FieldName = 'WORK_ORDER_NUMBER'
      FixedChar = True
      Size = 22
    end
    object ADO53PROD_CODE: TStringField
      DisplayLabel = #20135#21697#31867#21035
      DisplayWidth = 10
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object ADO53CUST_CODE: TStringField
      DisplayLabel = #23458#25143#31616#31216
      DisplayWidth = 15
      FieldName = 'abbr_name'
      Size = 10
    end
    object ADO53WAREHOUSE_CODE: TStringField
      DisplayLabel = #24037#21378
      DisplayWidth = 12
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ADO53LOCATION: TStringField
      DisplayLabel = #20179#24211
      DisplayWidth = 18
      FieldName = 'LOCATION'
    end
    object ADO53QUANTITY: TFloatField
      DisplayLabel = #20837#20179#25968#37327
      DisplayWidth = 13
      FieldName = 'QUANTITY'
    end
    object ADO53QTY_ON_HAND: TFloatField
      DisplayLabel = #24211#23384#25968#37327
      DisplayWidth = 16
      FieldName = 'QTY_ON_HAND'
    end
    object ADO53MFG_DATE: TDateTimeField
      DisplayLabel = #20837#20179#26085#26399
      DisplayWidth = 19
      FieldName = 'MFG_DATE'
    end
    object ADO53REFERENCE_NUMBER: TStringField
      DisplayLabel = #22791#27880
      DisplayWidth = 30
      FieldName = 'REFERENCE_NUMBER'
      FixedChar = True
    end
    object ADO53spec_place: TStringField
      DisplayLabel = #20855#20307#20301#32622
      FieldName = 'spec_place'
    end
    object ADO53LATEST_PRICE: TFloatField
      DisplayLabel = #19981#21547#31246#20215#26684'('#26412#20301#24065')'
      DisplayWidth = 23
      FieldName = 'LATEST_PRICE'
    end
    object ADO53number: TStringField
      DisplayLabel = #20837#20179#21333#21495
      FieldName = 'number'
      Size = 15
    end
    object ADO53c_type: TStringField
      DisplayLabel = #20837#20179#31867#22411
      DisplayWidth = 16
      FieldKind = fkCalculated
      FieldName = 'c_type'
      Size = 16
      Calculated = True
    end
    object ADO53type: TWordField
      FieldName = 'type'
    end
    object ADO53so_mianqi: TFloatField
      DisplayLabel = #20837#24211#38754#31215
      FieldName = 'so_mianqi'
      ReadOnly = True
    end
    object ADO53SO_NO: TStringField
      DisplayLabel = #38144#21806#35746#21333
      FieldName = 'SO_NO'
      FixedChar = True
      Size = 12
    end
    object ADO53SCH_DATE: TDateTimeField
      FieldName = 'SCH_DATE'
    end
    object ADO53inweight: TFloatField
      DisplayLabel = #20837#20179#37325#37327'(KG)'
      FieldName = 'inweight'
      ReadOnly = True
    end
    object ADO53rma_ptr: TIntegerField
      FieldName = 'rma_ptr'
    end
    object ADO53TAXLATEST_PRICE: TFloatField
      DisplayLabel = #21547#31246#20215#26684'('#26412#20301#24065')'
      FieldName = 'TAXLATEST_PRICE'
      ReadOnly = True
    end
    object ADO53zhuanchang: TStringField
      FieldName = 'zhuanchang'
      ReadOnly = True
      Size = 4
    end
    object ADO53ANALYSIS_CODE_2: TStringField
      DisplayLabel = #23458#25143#29289#26009#21495
      FieldName = 'ANALYSIS_CODE_2'
      Size = 50
    end
    object ADO53MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADO53MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADO53so_REFERENCE_NUMBER: TStringField
      FieldName = 'so_REFERENCE_NUMBER'
      Size = 30
    end
    object ADO53PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADO53LATEST_ORIG_PRICE: TFloatField
      FieldName = 'LATEST_ORIG_PRICE'
      ReadOnly = True
    end
    object ADO53TAXLATEST_ORIG_PRICE: TFloatField
      FieldName = 'TAXLATEST_ORIG_PRICE'
      ReadOnly = True
    end
    object ADO53employee_name: TStringField
      DisplayLabel = #20837#24211#20154#21592
      FieldName = 'employee_name'
      Size = 16
    end
    object ADO53CUST_CODE2: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADO53layers: TWordField
      DisplayLabel = #23618#25968
      FieldName = 'layers'
    end
    object ADO53PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ADO53curr_code: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'curr_code'
      ReadOnly = True
      Size = 5
    end
    object ADO53abbr_name23: TStringField
      FieldName = 'abbr_name23'
      Size = 16
    end
    object ADO53total_sq: TFloatField
      DisplayLabel = #20837#24211#38754#31215
      FieldName = 'total_sq'
      ReadOnly = True
    end
    object ADO53exch_rate: TFloatField
      DisplayLabel = #27719#29575
      FieldName = 'exch_rate'
      ReadOnly = True
    end
    object ADO53SAMPLE_NR: TStringField
      FieldName = 'SAMPLE_NR'
      Size = 50
    end
    object ADO53total_cost: TFloatField
      DisplayLabel = #25104#26412
      FieldName = 'total_cost'
      ReadOnly = True
    end
    object intgrfldADO53ischaban: TIntegerField
      FieldName = 'ischaban'
    end
    object strngfldADO53zhouqi: TStringField
      FieldName = 'zhouqi'
      Size = 200
    end
    object ADO53PR_GRP_CODE: TStringField
      FieldName = 'PR_GRP_CODE'
      Size = 5
    end
    object ADO53PRODUCT_GROUP_NAME: TStringField
      FieldName = 'PRODUCT_GROUP_NAME'
      Size = 30
    end
    object ADO53ORIG_CUSTOMER: TStringField
      FieldName = 'ORIG_CUSTOMER'
      ReadOnly = True
      Size = 10
    end
  end
  object DataSource1: TDataSource
    DataSet = ADO53
    Left = 184
    Top = 488
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    OnPopup = PopupMenu1Popup
    Left = 240
    Top = 88
  end
end
