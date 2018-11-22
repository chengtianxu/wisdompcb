inherited frmOrderDetail_mod284: TfrmOrderDetail_mod284
  Caption = #38144#21806#35746#21333#32454#33410
  ClientHeight = 420
  ClientWidth = 516
  Font.Height = -13
  Font.Name = #23435#20307
  Position = poOwnerFormCenter
  ExplicitWidth = 532
  ExplicitHeight = 459
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 516
    Height = 420
    Align = alClient
    TabOrder = 0
    object lbl1: TLabel
      Left = 64
      Top = 24
      Width = 65
      Height = 13
      Caption = #38144#21806#35746#21495#30721
    end
    object lbl2: TLabel
      Left = 77
      Top = 51
      Width = 52
      Height = 13
      Caption = #36755#20837#26085#26399
    end
    object lbl3: TLabel
      Left = 77
      Top = 79
      Width = 52
      Height = 13
      Caption = #23458#25143#20132#26399
    end
    object lbl4: TLabel
      Left = 77
      Top = 106
      Width = 52
      Height = 13
      Caption = #35745#21010#20132#26399
    end
    object lbl5: TLabel
      Left = 293
      Top = 103
      Width = 52
      Height = 13
      Caption = #22238#22797#20132#26399
    end
    object lbl6: TLabel
      Left = 77
      Top = 267
      Width = 52
      Height = 13
      Caption = #20135#21697#31867#22411
    end
    object lbl7: TLabel
      Left = 51
      Top = 237
      Width = 78
      Height = 13
      Caption = #37319#36141#35746#21333#26085#26399
    end
    object lbl8: TLabel
      Left = 51
      Top = 212
      Width = 78
      Height = 13
      Caption = #37319#36141#35746#21333#21495#30721
    end
    object lbl9: TLabel
      Left = 77
      Top = 159
      Width = 52
      Height = 13
      Caption = #26412#21378#32534#21495
    end
    object lbl10: TLabel
      Left = 103
      Top = 132
      Width = 26
      Height = 13
      Caption = #23458#25143
    end
    object lbl11: TLabel
      Left = 103
      Top = 322
      Width = 26
      Height = 13
      Caption = #27719#29575
    end
    object lbl12: TLabel
      Left = 103
      Top = 294
      Width = 26
      Height = 13
      Caption = #36135#24065
    end
    object lbl13: TLabel
      Left = 77
      Top = 350
      Width = 52
      Height = 13
      Caption = #23558#35201#30830#35748
    end
    object lbl14: TLabel
      Left = 73
      Top = 376
      Width = 56
      Height = 13
      Caption = #21512#35745#25968#37327
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl15: TLabel
      Left = 77
      Top = 183
      Width = 52
      Height = 13
      Caption = #23458#25143#22411#21495
    end
    object edt_ENT_DATE: TRKeyRzBtnEdit
      Left = 144
      Top = 48
      Width = 131
      Height = 21
      Text = ''
      Color = clBtnFace
      Enabled = False
      TabOrder = 0
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = dsOrderDetail
      DataSourceField = 'ENT_DATE'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object edt_SALES_ORDER: TRKeyRzBtnEdit
      Left = 144
      Top = 21
      Width = 131
      Height = 21
      Text = ''
      Color = clBtnFace
      Enabled = False
      TabOrder = 1
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = dsOrderDetail
      DataSourceField = 'SALES_ORDER'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object edt_ORIG_REQUEST_DATE: TRKeyRzBtnEdit
      Left = 144
      Top = 74
      Width = 131
      Height = 21
      Text = ''
      Color = clBtnFace
      Enabled = False
      TabOrder = 2
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = dsOrderDetail
      DataSourceField = 'ORIG_REQUEST_DATE'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object edt_ORIG_SCHED_SHIP_DATE: TRKeyRzBtnEdit
      Left = 144
      Top = 101
      Width = 131
      Height = 21
      Text = ''
      Color = clBtnFace
      Enabled = False
      TabOrder = 3
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = dsOrderDetail
      DataSourceField = 'ORIG_SCHED_SHIP_DATE'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object edt_SCH_DATE: TRKeyRzBtnEdit
      Left = 351
      Top = 100
      Width = 131
      Height = 21
      Text = ''
      Color = clBtnFace
      Enabled = False
      TabOrder = 4
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = dsOrderDetail
      DataSourceField = 'SCH_DATE'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object edt_PRODUCT_NAME: TRKeyRzBtnEdit
      Left = 144
      Top = 264
      Width = 131
      Height = 21
      Text = ''
      Color = clBtnFace
      Enabled = False
      TabOrder = 5
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = dsOrderDetail
      DataSourceField = 'PRODUCT_NAME'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object edt_PO_DATE: TRKeyRzBtnEdit
      Left = 144
      Top = 234
      Width = 131
      Height = 21
      Text = ''
      Color = clBtnFace
      Enabled = False
      TabOrder = 6
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = dsOrderDetail
      DataSourceField = 'PO_DATE'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object edt_PO_NUMBER: TRKeyRzBtnEdit
      Left = 144
      Top = 207
      Width = 131
      Height = 21
      Text = ''
      Color = clBtnFace
      Enabled = False
      TabOrder = 7
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = dsOrderDetail
      DataSourceField = 'PO_NUMBER'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object edt_MANU_PART_NUMBER: TRKeyRzBtnEdit
      Left = 144
      Top = 155
      Width = 131
      Height = 21
      Text = ''
      Color = clBtnFace
      Enabled = False
      TabOrder = 8
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = dsOrderDetail
      DataSourceField = 'MANU_PART_NUMBER'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object edt_CUST_CODE: TRKeyRzBtnEdit
      Left = 144
      Top = 128
      Width = 131
      Height = 21
      Text = ''
      Color = clBtnFace
      Enabled = False
      TabOrder = 9
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = dsOrderDetail
      DataSourceField = 'CUST_CODE'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object edt_MANU_PART_DESC: TRKeyRzBtnEdit
      Left = 144
      Top = 180
      Width = 131
      Height = 21
      Text = ''
      Color = clBtnFace
      Enabled = False
      TabOrder = 10
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = dsOrderDetail
      DataSourceField = 'MANU_PART_DESC'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object edt_PARTS_ORDERED: TRKeyRzBtnEdit
      Left = 144
      Top = 371
      Width = 131
      Height = 21
      Text = ''
      Color = clBtnFace
      Enabled = False
      TabOrder = 11
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = dsOrderDetail
      DataSourceField = 'PARTS_ORDERED'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object edt_TO_BE_CONFIRMED: TRKeyRzBtnEdit
      Left = 144
      Top = 344
      Width = 131
      Height = 21
      Text = ''
      Color = clBtnFace
      Enabled = False
      TabOrder = 12
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = dsOrderDetail
      DataSourceField = 'TO_BE_CONFIRMED'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object edt_EXCH_RATE: TRKeyRzBtnEdit
      Left = 144
      Top = 318
      Width = 131
      Height = 21
      Text = ''
      Color = clBtnFace
      Enabled = False
      TabOrder = 13
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = dsOrderDetail
      DataSourceField = 'EXCH_RATE'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object edt_CURR_NAME: TRKeyRzBtnEdit
      Left = 144
      Top = 291
      Width = 131
      Height = 21
      Text = ''
      Color = clBtnFace
      Enabled = False
      TabOrder = 14
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = dsOrderDetail
      DataSourceField = 'CURR_NAME'
      DisplayModID = 0
      ForceOnFocus = True
    end
  end
  object CdsOrderDetail: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT data0060.rkey,Data0060.SALES_ORDER,Data0010.CUST_CODE as ' +
      'CUST_CODE,'#13#10' Data0025.MANU_PART_NUMBER,data0060.part_price,data0' +
      '060.tax_in_price,data0010.cust_code as custcode,'#13#10' Data0097.PO_N' +
      'UMBER,Data0005.EMPLOYEE_NAME,data0060.to_be_planned,data0010.CRE' +
      'DIT_RATING,'#13#10' Data0060.DUE_DATE,Data0060.SCH_DATE,Data0060.CUSTO' +
      'MER_PTR,data0060.RUSH_CHARGE,'#13#10' Data0060.PARTS_ORDERED,Data0060.' +
      'PARTS_SHIPPED,data0060.qty_plannned,data0010.credit_limit,'#13#10' dat' +
      'a0060.status,data0060.prod_rel,Data0060.CUST_PART_PTR,RUSH_CHARG' +
      'E_PCT_USED,'#13#10' data0025.set_qty,set_ordered,set_price,data0025.MF' +
      'G_LEAD_TIME,data0010.DAYS_EARLY_SCHEDULE,'#13#10' data0060.ORIG_REQUES' +
      'T_DATE,data0060.ORIG_SCHED_SHIP_DATE,TOTAL_ADD_L_PRICE,'#13#10' Data00' +
      '60.PURCHASE_ORDER_PTR,data0097.po_date,data0060.EXCH_RATE,data00' +
      '10.customer_name,'#13#10' data0060.REFERENCE_NUMBER,data0025.MANU_PART' +
      '_DESC,CUST_SHIP_ADDR_PTR,data0060.ISSUED_QTY'#13#10'FROM Data0005 INNE' +
      'R JOIN Data0097 INNER JOIN'#13#10'      Data0060 INNER JOIN Data0025 O' +
      'N Data0060.CUST_PART_PTR = Data0025.RKEY INNER JOIN'#13#10'      Data0' +
      '010 ON Data0060.CUSTOMER_PTR = Data0010.RKEY ON'#13#10'      Data0097.' +
      'RKEY = Data0060.PURCHASE_ORDER_PTR ON'#13#10'      Data0005.RKEY = Dat' +
      'a0060.ENTERED_BY_EMPL_PTR'#13#10'WHERE (Data0060.STATUS <> 3) and (Dat' +
      'a0060.STATUS <> 4)  '#13#10
    Params = <>
    Left = 392
    Top = 24
  end
  object dsOrderDetail: TDataSource
    DataSet = CdsOrderDetail
    Left = 312
    Top = 24
  end
  object qrySql: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'SELECT dbo.Data0060.SALES_ORDER, dbo.Data0060.ENT_DATE,'
      
        '      dbo.Data0060.DUE_DATE, dbo.Data0060.SCH_DATE, dbo.Data0060' +
        '.EXCH_RATE,'
      '      dbo.Data0060.TO_BE_CONFIRMED, dbo.Data0060.RUSH_CHARGE,'
      
        '      dbo.Data0060.DISCOUNT, dbo.Data0060.TOTAL_ADD_L_PRICE, dbo' +
        '.Data0060.RKEY,'
      '      dbo.Data0060.PART_PRICE, dbo.Data0060.PARTS_ORDERED,'
      
        '      dbo.Data0060.tax_in_price, dbo.Data0060.set_ordered, dbo.D' +
        'ata0097.PO_NUMBER,'
      '      dbo.Data0097.PO_DATE, dbo.Data0060.REFERENCE_NUMBER,'
      '      dbo.Data0008.PRODUCT_NAME, dbo.Data0001.CURR_NAME,'
      '      dbo.Data0010.ABBR_NAME, dbo.Data0060.ORIG_REQUEST_DATE,'
      
        '      dbo.Data0060.ORIG_SCHED_SHIP_DATE, dbo.Data0060.PARTS_SHIP' +
        'PED,'
      
        '      dbo.Data0060.PURCHASE_ORDER_PTR, dbo.Data0060.CUST_PART_PT' +
        'R,'
      
        '      dbo.Data0060.RUSH_CHARGE_PCT_USED, dbo.Data0060.FOB, dbo.D' +
        'ata0060.so_tp,'
      '      dbo.Data0023.CODE, dbo.Data0023.SUPPLIER_NAME,'
      
        '      dbo.Data0060.PARTS_ORDERED * dbo.Data0025.unit_sq AS order' +
        's_sqft,'
      
        '      dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC' +
        ',dbo.Data0025.ANALYSIS_CODE_2,'
      
        '      dbo.Data0025.ANALYSIS_CODE_5,dbo.Data0025.ANALYSIS_CODE_1,' +
        'dbo.Data0025.memo_text,'
      
        '      dbo.Data0025.set_qty,Data0060.ISSUED_QTY,Data0060.NewZL,Da' +
        'ta0060.so_oldnew,'
      
        '      dbo.Data0025.set_qty_org,CONVERT(varchar(20),set_lngth_org' +
        ')+'#39'mmX'#39'+CONVERT(varchar(20),set_width_org)+'#39'mm'#39' as Size_org,'
      
        '      case Data0025.ttype when 0 then '#39#37327#20135#39' when 1 then '#39#26679#21697#39' end ' +
        'as pro_type,'
      '      CASE dbo.Data0060.STATUS'
      '       WHEN 1 THEN '#39#26377#25928#30340#39
      '       WHEN 2 THEN '#39#24050#26242#32531#39
      '       WHEN 3 THEN '#39#24050#20851#38381#39
      '       WHEN 4 THEN '#39#24050#23436#25104#39
      '       WHEN 5 THEN '#39#24050#21462#28040#39
      '       WHEN 6 THEN '#39#26410#25552#20132#39
      
        '      END AS STATUS,dbo.data0025.ORIG_CUSTOMER,dbo.data0015.ABBR' +
        '_NAME as ABBR_NAME15,data0010.cust_code'
      'FROM dbo.Data0023 RIGHT OUTER JOIN'
      '      dbo.Data0060 INNER JOIN'
      
        '      dbo.Data0010 ON dbo.Data0060.CUSTOMER_PTR = dbo.Data0010.R' +
        'KEY INNER JOIN'
      '      dbo.Data0097 ON'
      
        '      dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY INNER ' +
        'JOIN'
      
        '      dbo.Data0001 ON dbo.Data0060.CURRENCY_PTR = dbo.Data0001.R' +
        'KEY INNER JOIN'
      '      dbo.Data0025 INNER JOIN'
      
        '      dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.' +
        'RKEY ON'
      '      dbo.Data0060.CUST_PART_PTR = dbo.Data0025.RKEY ON'
      '      dbo.Data0023.RKEY = dbo.Data0060.supplier_ptr INNER JOIN'
      
        '      dbo.Data0015 ON dbo.Data0060.SHIP_REG_TAX_ID = dbo.Data001' +
        '5.RKEY')
    Left = 464
    Top = 40
  end
end
