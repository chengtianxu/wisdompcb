inherited frmOrderDetail_mod354: TfrmOrderDetail_mod354
  Caption = #38144#21806#35746#21333#32454#33410
  ClientHeight = 420
  ClientWidth = 784
  Font.Height = -13
  Font.Name = #23435#20307
  Position = poOwnerFormCenter
  ExplicitWidth = 800
  ExplicitHeight = 459
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 784
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
      Left = 86
      Top = 132
      Width = 52
      Height = 13
      Caption = #22238#22797#20132#26399
    end
    object lbl6: TLabel
      Left = 77
      Top = 293
      Width = 52
      Height = 13
      Caption = #20135#21697#31867#22411
    end
    object lbl7: TLabel
      Left = 51
      Top = 263
      Width = 78
      Height = 13
      Caption = #37319#36141#35746#21333#26085#26399
    end
    object lbl8: TLabel
      Left = 51
      Top = 238
      Width = 78
      Height = 13
      Caption = #37319#36141#35746#21333#21495#30721
    end
    object lbl9: TLabel
      Left = 77
      Top = 185
      Width = 52
      Height = 13
      Caption = #26412#21378#32534#21495
    end
    object lbl10: TLabel
      Left = 103
      Top = 158
      Width = 26
      Height = 13
      Caption = #23458#25143
    end
    object lbl11: TLabel
      Left = 103
      Top = 348
      Width = 26
      Height = 13
      Caption = #27719#29575
    end
    object lbl12: TLabel
      Left = 103
      Top = 320
      Width = 26
      Height = 13
      Caption = #36135#24065
    end
    object lbl13: TLabel
      Left = 77
      Top = 376
      Width = 52
      Height = 13
      Caption = #23558#35201#30830#35748
    end
    object lbl15: TLabel
      Left = 77
      Top = 209
      Width = 52
      Height = 13
      Caption = #23458#25143#22411#21495
    end
    object lbl24: TLabel
      Left = 309
      Top = 24
      Width = 52
      Height = 13
      Caption = #35746#21333#29366#24577
    end
    object lbl25: TLabel
      Left = 296
      Top = 51
      Width = 65
      Height = 13
      Caption = #35013#36816#32852#31995#20154
    end
    object lbl26: TLabel
      Left = 335
      Top = 79
      Width = 26
      Height = 13
      Caption = #30005#35805
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
      DataSource = dsDetail
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
      DataSource = dsDetail
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
      DataSource = dsDetail
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
      DataSource = dsDetail
      DataSourceField = 'ORIG_SCHED_SHIP_DATE'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object edt_SCH_DATE: TRKeyRzBtnEdit
      Left = 144
      Top = 127
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
      DataSource = dsDetail
      DataSourceField = 'SCH_DATE'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object edt_PRODUCT_NAME: TRKeyRzBtnEdit
      Left = 144
      Top = 290
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
      DataSource = dsDetail
      DataSourceField = 'PRODUCT_NAME'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object edt_PO_DATE: TRKeyRzBtnEdit
      Left = 144
      Top = 260
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
      DataSource = dsDetail
      DataSourceField = 'PO_DATE'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object edt_PO_NUMBER: TRKeyRzBtnEdit
      Left = 144
      Top = 233
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
      DataSource = dsDetail
      DataSourceField = 'PO_NUMBER'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object edt_MANU_PART_NUMBER: TRKeyRzBtnEdit
      Left = 144
      Top = 181
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
      DataSource = dsDetail
      DataSourceField = 'MANU_PART_NUMBER'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object edt_CUST_CODE: TRKeyRzBtnEdit
      Left = 144
      Top = 154
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
      DataSource = dsDetail
      DataSourceField = 'ABBR_NAME'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object edt_MANU_PART_DESC: TRKeyRzBtnEdit
      Left = 144
      Top = 206
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
      DataSource = dsDetail
      DataSourceField = 'MANU_PART_DESC'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object edt_TO_BE_CONFIRMED: TRKeyRzBtnEdit
      Left = 144
      Top = 370
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
      DataSource = dsDetail
      DataSourceField = 'TO_BE_CONFIRMED'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object edt_EXCH_RATE: TRKeyRzBtnEdit
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
      DataSource = dsDetail
      DataSourceField = 'EXCH_RATE'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object edt_CURR_NAME: TRKeyRzBtnEdit
      Left = 144
      Top = 317
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
      DataSource = dsDetail
      DataSourceField = 'CURR_NAME'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object pnl2: TPanel
      Left = 532
      Top = 1
      Width = 251
      Height = 418
      Align = alRight
      TabOrder = 14
      object lbl16: TLabel
        Left = 174
        Top = 33
        Width = 26
        Height = 13
        Caption = #25968#37327
      end
      object lbl17: TLabel
        Left = 32
        Top = 33
        Width = 26
        Height = 13
        Caption = #25968#37327
      end
      object lbl18: TLabel
        Left = 32
        Top = 60
        Width = 26
        Height = 13
        Caption = #20215#26684
      end
      object lbl19: TLabel
        Left = 32
        Top = 87
        Width = 26
        Height = 13
        Caption = #31246#29575
      end
      object lbl20: TLabel
        Left = 32
        Top = 117
        Width = 26
        Height = 13
        Caption = #25240#25187
      end
      object lbl21: TLabel
        Left = 12
        Top = 167
        Width = 52
        Height = 13
        Caption = #24037#20855#31246#37329
      end
      object lbl22: TLabel
        Left = 32
        Top = 195
        Width = 26
        Height = 13
        Caption = #21512#35745
      end
      object lbl23: TLabel
        Left = 6
        Top = 220
        Width = 52
        Height = 13
        Caption = #19979#21333#38754#31215
      end
      object lbl14: TLabel
        Left = 12
        Top = 6
        Width = 42
        Height = 13
        Caption = #21512#35745#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl27: TLabel
        Left = 12
        Top = 143
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = #24037#20855#36153#29992
      end
      object edt_qty: TRKeyRzBtnEdit
        Left = 77
        Top = 30
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
        DataSource = dsDetail
        DataSourceField = 'PARTS_ORDERED'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object edt_price: TRKeyRzBtnEdit
        Left = 77
        Top = 57
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
        DataSource = dsDetail
        DataSourceField = 'PART_PRICE'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object edt_tax: TRKeyRzBtnEdit
        Left = 77
        Top = 84
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
        DataSource = dsDetail
        DataSourceField = 'RUSH_CHARGE'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object edt_discount: TRKeyRzBtnEdit
        Left = 77
        Top = 111
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
        DataSource = dsDetail
        DataSourceField = 'DISCOUNT'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object edt_TaxAmount: TRKeyRzBtnEdit
        Left = 77
        Top = 163
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
        DataSourceField = 'PARTS_ORDERED'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object edt_total: TRKeyRzBtnEdit
        Left = 77
        Top = 190
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
        DataSourceField = 'PARTS_ORDERED'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object edt_Area: TRKeyRzBtnEdit
        Left = 77
        Top = 217
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
        DataSource = dsDetail
        DataSourceField = 'orders_sqft'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object edt_WorkNo1: TRKeyRzBtnEdit
        Left = 76
        Top = 137
        Width = 103
        Height = 21
        Text = ''
        Color = clBtnFace
        Enabled = False
        TabOrder = 7
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = dsDetail
        DataSourceField = 'TOTAL_ADD_L_PRICE'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object btn_qry: TButton
        Left = 177
        Top = 137
        Width = 31
        Height = 22
        Caption = '...'
        TabOrder = 8
        OnClick = btn_qryClick
      end
    end
    object edt_tel: TRKeyRzBtnEdit
      Left = 371
      Top = 75
      Width = 131
      Height = 21
      Text = ''
      Color = clBtnFace
      Enabled = False
      TabOrder = 15
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSourceField = 'ORIG_REQUEST_DATE'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object edt_man: TRKeyRzBtnEdit
      Left = 371
      Top = 48
      Width = 131
      Height = 21
      Text = ''
      Color = clBtnFace
      Enabled = False
      TabOrder = 16
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSourceField = 'ENT_DATE'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object edt_WorkNo10: TRKeyRzBtnEdit
      Left = 371
      Top = 21
      Width = 131
      Height = 21
      Text = ''
      Color = clBtnFace
      Enabled = False
      TabOrder = 17
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = dsDetail
      DataSourceField = 'STATUS'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object dbchk_tax_in_price: TDBCheckBox
      Left = 371
      Top = 114
      Width = 75
      Height = 17
      Caption = #20215#26684#21547#31246
      DataField = 'tax_in_price'
      DataSource = dsDetail
      Enabled = False
      ReadOnly = True
      TabOrder = 18
      ValueChecked = 'Y'
      ValueUnchecked = 'N'
    end
    object btn_Close: TButton
      Left = 665
      Top = 368
      Width = 75
      Height = 25
      Caption = #20851#38381
      ModalResult = 2
      TabOrder = 19
    end
  end
  object CdsDetail: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT dbo.Data0060.SALES_ORDER, dbo.Data0060.ENT_DATE,  '#13#10'     ' +
      ' dbo.Data0060.DUE_DATE, dbo.Data0060.SCH_DATE, dbo.Data0060.EXCH' +
      '_RATE,  '#13#10'      dbo.Data0060.TO_BE_CONFIRMED, dbo.Data0060.RUSH_' +
      'CHARGE,  '#13#10'      dbo.Data0060.DISCOUNT, dbo.Data0060.TOTAL_ADD_L' +
      '_PRICE, dbo.Data0060.RKEY,  '#13#10'      dbo.Data0060.PART_PRICE, dbo' +
      '.Data0060.PARTS_ORDERED,  '#13#10'      dbo.Data0060.tax_in_price, dbo' +
      '.Data0060.set_ordered, dbo.Data0097.PO_NUMBER,  '#13#10'      dbo.Data' +
      '0097.PO_DATE, dbo.Data0060.REFERENCE_NUMBER,  '#13#10'      dbo.Data00' +
      '08.PRODUCT_NAME, dbo.Data0001.CURR_NAME,  '#13#10'      dbo.Data0010.A' +
      'BBR_NAME, dbo.Data0060.ORIG_REQUEST_DATE,  '#13#10'      dbo.Data0060.' +
      'ORIG_SCHED_SHIP_DATE, dbo.Data0060.PARTS_SHIPPED,  '#13#10'      dbo.D' +
      'ata0060.PURCHASE_ORDER_PTR, dbo.Data0060.CUST_PART_PTR,  '#13#10'     ' +
      ' dbo.Data0060.RUSH_CHARGE_PCT_USED, dbo.Data0060.FOB, dbo.Data00' +
      '60.so_tp,  '#13#10'      dbo.Data0023.CODE, dbo.Data0023.SUPPLIER_NAME' +
      ',  '#13#10'      dbo.Data0060.PARTS_ORDERED * dbo.Data0025.unit_sq AS ' +
      'orders_sqft,  '#13#10'      dbo.Data0025.MANU_PART_NUMBER, dbo.Data002' +
      '5.MANU_PART_DESC,dbo.Data0025.ANALYSIS_CODE_2,  '#13#10'      dbo.Data' +
      '0025.ANALYSIS_CODE_5,dbo.Data0025.ANALYSIS_CODE_1,dbo.Data0025.m' +
      'emo_text,  '#13#10'      dbo.Data0025.set_qty,Data0060.ISSUED_QTY,Data' +
      '0060.NewZL,Data0060.so_oldnew,  '#13#10'      dbo.Data0025.set_qty_org' +
      ',CONVERT(varchar(20),set_lngth_org)+'#39'mmX'#39'+CONVERT(varchar(20),se' +
      't_width_org)+'#39'mm'#39' as Size_org,   '#13#10'      case Data0025.ttype whe' +
      'n 0 then '#39#37327#20135#39' when 1 then '#39#26679#21697#39' end as pro_type,  '#13#10'      CASE db' +
      'o.Data0060.STATUS  '#13#10'       WHEN 1 THEN '#39#26377#25928#30340#39'  '#13#10'       WHEN 2 T' +
      'HEN '#39#24050#26242#32531#39'  '#13#10'       WHEN 3 THEN '#39#24050#20851#38381#39'  '#13#10'       WHEN 4 THEN '#39#24050#23436#25104 +
      #39'  '#13#10'       WHEN 5 THEN '#39#24050#21462#28040#39'  '#13#10'       WHEN 6 THEN '#39#26410#25552#20132#39'  '#13#10'   ' +
      '   END AS STATUS,dbo.data0025.ORIG_CUSTOMER,dbo.data0015.ABBR_NA' +
      'ME as ABBR_NAME15 ,Data0010.CUST_CODE  '#13#10'FROM dbo.Data0023 RIGHT' +
      ' OUTER JOIN  '#13#10'      dbo.Data0060 INNER JOIN  '#13#10'      dbo.Data00' +
      '10 ON dbo.Data0060.CUSTOMER_PTR = dbo.Data0010.RKEY INNER JOIN  ' +
      #13#10'      dbo.Data0097 ON  '#13#10'      dbo.Data0060.PURCHASE_ORDER_PTR' +
      ' = dbo.Data0097.RKEY INNER JOIN  '#13#10'      dbo.Data0001 ON dbo.Dat' +
      'a0060.CURRENCY_PTR = dbo.Data0001.RKEY INNER JOIN  '#13#10'      dbo.D' +
      'ata0025 INNER JOIN  '#13#10'      dbo.Data0008 ON dbo.Data0025.PROD_CO' +
      'DE_PTR = dbo.Data0008.RKEY ON  '#13#10'      dbo.Data0060.CUST_PART_PT' +
      'R = dbo.Data0025.RKEY ON  '#13#10'      dbo.Data0023.RKEY = dbo.Data00' +
      '60.supplier_ptr INNER JOIN  '#13#10'      dbo.Data0015 ON dbo.Data0060' +
      '.SHIP_REG_TAX_ID = dbo.Data0015.RKEY  '#13#10'WHERE 1=1'#13#10
    Params = <>
    Left = 408
    Top = 336
  end
  object dsDetail: TDataSource
    DataSet = CdsDetail
    Left = 328
    Top = 344
  end
  object cdstemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 472
    Top = 280
  end
end
