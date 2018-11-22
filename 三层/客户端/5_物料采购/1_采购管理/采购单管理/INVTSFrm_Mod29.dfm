inherited frmINVTS_Mod29: TfrmINVTS_Mod29
  Left = 429
  Top = 173
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #29983#20135#29289#26009#36873#25321
  ClientHeight = 567
  ClientWidth = 657
  ExplicitWidth = 663
  ExplicitHeight = 596
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 65
    Top = 130
    Width = 60
    Height = 13
    Caption = #26368#39640#24211#23384#65306
  end
  object Label3: TLabel
    Left = 274
    Top = 132
    Width = 60
    Height = 13
    Caption = #23433#20840#24211#23384#65306
  end
  object Label4: TLabel
    Left = 65
    Top = 165
    Width = 60
    Height = 13
    Caption = #29305#27530#35201#27714#65306
  end
  object Label5: TLabel
    Left = 477
    Top = 165
    Width = 60
    Height = 13
    Caption = #29615#20445#26631#35782#65306
  end
  object Label6: TLabel
    Left = 65
    Top = 201
    Width = 60
    Height = 13
    Caption = #37319#36141#21333#20301#65306
  end
  object Label7: TLabel
    Left = 493
    Top = 132
    Width = 44
    Height = 13
    Caption = #32784'CAF'#65306
  end
  object Label8: TLabel
    Left = 77
    Top = 236
    Width = 48
    Height = 13
    Caption = #20379#24212#21830#65306
  end
  object Label9: TLabel
    Left = 89
    Top = 271
    Width = 36
    Height = 13
    Caption = #24037#21378#65306
  end
  object Label10: TLabel
    Left = 65
    Top = 306
    Width = 60
    Height = 13
    Caption = #20132#36135#26085#26399#65306
  end
  object Label11: TLabel
    Left = 283
    Top = 304
    Width = 60
    Height = 13
    Caption = #37325#35201#26631#35782#65306
  end
  object Label12: TLabel
    Left = 65
    Top = 341
    Width = 60
    Height = 13
    Caption = #20132#36135#25209#27425#65306
  end
  object Label13: TLabel
    Left = 477
    Top = 271
    Width = 60
    Height = 13
    Caption = #29615#20445#35748#21487#65306
  end
  object Label14: TLabel
    Left = 307
    Top = 339
    Width = 36
    Height = 13
    Caption = #38388#38548#65306
  end
  object Label15: TLabel
    Left = 422
    Top = 338
    Width = 24
    Height = 13
    Caption = #22825#25968
  end
  object Label16: TLabel
    Left = 89
    Top = 372
    Width = 36
    Height = 13
    Caption = #25968#37327#65306
  end
  object Label17: TLabel
    Left = 53
    Top = 409
    Width = 72
    Height = 13
    Caption = #19981#21547#31246#20215#26684#65306
  end
  object Label18: TLabel
    Left = 65
    Top = 446
    Width = 60
    Height = 13
    Caption = #21547#31246#20215#26684#65306
  end
  object Label19: TLabel
    Left = 307
    Top = 372
    Width = 36
    Height = 13
    Caption = #31246#29575#65306
  end
  object Label20: TLabel
    Left = 489
    Top = 201
    Width = 48
    Height = 13
    Caption = #36716#25442#29575#65306
  end
  object Label21: TLabel
    Left = 385
    Top = 372
    Width = 11
    Height = 13
    Caption = '%'
  end
  object Label22: TLabel
    Left = 65
    Top = 63
    Width = 60
    Height = 13
    Caption = #24211#23384#26448#26009#65306
  end
  object Label23: TLabel
    Left = 65
    Top = 98
    Width = 60
    Height = 13
    Caption = #26448#26009#35268#26684#65306
  end
  object Label24: TLabel
    Left = 274
    Top = 198
    Width = 60
    Height = 13
    Caption = #23384#36135#21333#20301#65306
  end
  object Label25: TLabel
    Left = 283
    Top = 409
    Width = 60
    Height = 13
    Caption = #35831#36141#32534#21495#65306
  end
  object Label26: TLabel
    Left = 477
    Top = 409
    Width = 60
    Height = 13
    Caption = #35831#36141#37096#38376#65306
  end
  object Label27: TLabel
    Left = 477
    Top = 372
    Width = 60
    Height = 13
    Caption = #35831#36141#20154#21592#65306
  end
  object Label1: TLabel
    Left = 422
    Top = 372
    Width = 11
    Height = 13
    Caption = '%'
  end
  object Label28: TLabel
    Left = 283
    Top = 446
    Width = 60
    Height = 13
    Caption = #35831#36141#21407#22240#65306
  end
  object Label29: TLabel
    Left = 283
    Top = 236
    Width = 3
    Height = 13
  end
  object rkyINVT: TRKeyRzBtnEdit
    Left = 131
    Top = 58
    Width = 188
    Height = 21
    Text = ''
    TabOrder = 1
    OnExit = rkyINVTExit
    ButtonKind = bkFind
    AltBtnWidth = 15
    ButtonWidth = 15
    OnButtonClick = rkyINVTButtonClick
    DataSource = dsINVT
    DataSourceField = 'INVT_PTR'
    DispalyTableName = 'DATA0017'
    DisplaytextField = 'INV_PART_NUMBER'
    DisplayRetKeyField = 'rkey'
    DisplayPickID = '8'
    DisplayModID = 29
    ForceOnFocus = True
  end
  object rgRule: TRzRadioGroup
    Left = 253
    Top = 8
    Width = 147
    Height = 44
    Caption = #37319#36141#35746#21333#26684#24335
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #26684#24335#19968
      #26684#24335#20108)
    StartXPos = 15
    TabOrder = 0
  end
  object btnStore: TBitBtn
    Left = 325
    Top = 55
    Width = 75
    Height = 25
    Caption = #24211#23384#26597#35810
    TabOrder = 2
    OnClick = btnStoreClick
  end
  object rkyMax: TRKeyRzBtnEdit
    Left = 131
    Top = 129
    Width = 109
    Height = 21
    Text = ''
    Color = clBtnFace
    Enabled = False
    TabOrder = 3
    ButtonKind = bkFind
    ButtonVisible = False
    AltBtnWidth = 15
    ButtonWidth = 15
    DataSource = dsINVT
    DataSourceField = 'REPORT_VALUE2'
    DisplayModID = 0
    ForceOnFocus = True
  end
  object rkySafe: TRKeyRzBtnEdit
    Left = 340
    Top = 130
    Width = 106
    Height = 21
    Text = ''
    Color = clBtnFace
    Enabled = False
    TabOrder = 4
    ButtonKind = bkFind
    ButtonVisible = False
    AltBtnWidth = 15
    ButtonWidth = 15
    DataSource = dsINVT
    DataSourceField = 'CONSIGN_ONHAND_QTY'
    DisplayModID = 0
    ForceOnFocus = True
  end
  object rkyExtra: TRKeyRzBtnEdit
    Left = 131
    Top = 162
    Width = 315
    Height = 21
    Text = ''
    TabOrder = 5
    ButtonKind = bkFind
    ButtonVisible = False
    AltBtnWidth = 15
    ButtonWidth = 15
    DataSource = dsINVT
    DataSourceField = 'extra_req'
    DisplayModID = 0
    ForceOnFocus = True
  end
  object cbxRoSH: TRzComboBox
    Left = 543
    Top = 161
    Width = 67
    Height = 21
    Style = csDropDownList
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 6
    Items.Strings = (
      'RoSH'
      #38750'RoSH')
  end
  object rkyUnit: TRKeyRzBtnEdit
    Left = 131
    Top = 196
    Width = 78
    Height = 21
    Text = ''
    TabOrder = 7
    ButtonKind = bkFind
    AltBtnWidth = 15
    ButtonWidth = 15
    DataSource = dsINVT
    DataSourceField = 'PURCHASE_UNIT_PTR'
    DispalyTableName = 'DATA0002'
    DisplaytextField = 'UNIT_CODE'
    DisplayRetKeyField = 'rkey'
    DisplayNoteField = 'UNIT_NAME'
    DisplayPickID = '6'
    DisplayModID = 29
    ForceOnFocus = True
  end
  object rkyCAF: TRKeyRzBtnEdit
    Left = 542
    Top = 129
    Width = 67
    Height = 21
    Text = ''
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 8
    ButtonKind = bkFind
    ButtonVisible = False
    AltBtnWidth = 15
    ButtonWidth = 15
    DataSource = dsINVT
    DataSourceField = 'IF_CAF'
    DisplayModID = 0
    ForceOnFocus = True
  end
  object rkySupplier: TRKeyRzBtnEdit
    Left = 131
    Top = 233
    Width = 109
    Height = 21
    Text = ''
    TabOrder = 9
    OnExit = rkySupplierExit
    ButtonKind = bkFind
    ButtonVisible = False
    AltBtnWidth = 15
    ButtonWidth = 15
    DataSource = dsINVT
    DataSourceField = 'SUPPLIER_POINTER'
    DispalyTableName = 'DATA0023'
    DisplaytextField = 'CODE'
    DisplayRetKeyField = 'RKEY'
    DisplayNoteField = 'SUPPLIER_NAME'
    DisplayPickID = '1'
    DisplayModID = 29
    ForceOnFocus = True
    OnDataFieldValueChange = rkySupplierDataFieldValueChange
  end
  object rkyQuan: TRKeyRzBtnEdit
    Left = 131
    Top = 370
    Width = 109
    Height = 21
    Text = ''
    TabOrder = 12
    OnExit = rkyQuanExit
    OnKeyPress = rkyQuanKeyPress
    ButtonKind = bkFind
    ButtonVisible = False
    AltBtnWidth = 15
    ButtonWidth = 15
    DataSource = dsINVT
    DataSourceField = 'QUAN_ORD'
    DisplayModID = 0
    ForceOnFocus = True
  end
  object rkyIMP: TRKeyRzBtnEdit
    Left = 349
    Top = 301
    Width = 97
    Height = 21
    Text = ''
    TabOrder = 10
    ButtonKind = bkFind
    ButtonVisible = False
    AltBtnWidth = 15
    ButtonWidth = 15
    DisplayModID = 0
    ForceOnFocus = True
  end
  object rkyTaxRate: TRKeyRzBtnEdit
    Left = 349
    Top = 369
    Width = 67
    Height = 21
    Text = ''
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 13
    ButtonKind = bkFind
    ButtonVisible = False
    AltBtnWidth = 15
    ButtonWidth = 15
    DataSource = dsINVT
    DataSourceField = 'TAX_2'
    DisplayModID = 0
    ForceOnFocus = True
  end
  object rkyExChang: TRKeyRzBtnEdit
    Left = 542
    Top = 196
    Width = 67
    Height = 21
    Text = ''
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 14
    ButtonKind = bkFind
    ButtonVisible = False
    AltBtnWidth = 15
    ButtonWidth = 15
    DataSource = dsINVT
    DataSourceField = 'CONVERSION_FACTOR'
    DisplayModID = 0
    ForceOnFocus = True
  end
  object rkyIQC: TRKeyRzBtnEdit
    Left = 543
    Top = 268
    Width = 64
    Height = 21
    Text = ''
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 11
    ButtonKind = bkFind
    ButtonVisible = False
    AltBtnWidth = 15
    ButtonWidth = 15
    DataSource = dsINVT
    DataSourceField = 'CATALOG_NUM'
    DisplayModID = 0
    ForceOnFocus = True
  end
  object btnCommit: TBitBtn
    Left = 212
    Top = 508
    Width = 75
    Height = 25
    Caption = #30830#35748
    TabOrder = 15
    OnClick = btnCommitClick
  end
  object btnCancel: TBitBtn
    Left = 401
    Top = 508
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 16
  end
  object rkyUnit2: TRKeyRzBtnEdit
    Left = 338
    Top = 196
    Width = 75
    Height = 21
    Text = ''
    Color = clBtnFace
    Enabled = False
    TabOrder = 17
    ButtonKind = bkFind
    AltBtnWidth = 15
    ButtonWidth = 15
    DataSource = dsINVT
    DataSourceField = 'WO_PTR'
    DispalyTableName = 'DATA0002'
    DisplaytextField = 'UNIT_CODE'
    DisplayRetKeyField = 'rkey'
    DisplayNoteField = 'UNIT_NAME'
    DisplayPickID = '6'
    DisplayModID = 29
    ForceOnFocus = True
  end
  object rkyReqNo: TRKeyRzBtnEdit
    Left = 349
    Top = 406
    Width = 97
    Height = 21
    Text = ''
    Color = clBtnFace
    Enabled = False
    TabOrder = 18
    ButtonKind = bkFind
    ButtonVisible = False
    AltBtnWidth = 15
    ButtonWidth = 15
    DisplayModID = 0
    ForceOnFocus = True
  end
  object rkyUser: TRKeyRzBtnEdit
    Left = 543
    Top = 369
    Width = 69
    Height = 21
    Text = ''
    Color = clBtnFace
    Enabled = False
    TabOrder = 19
    ButtonKind = bkFind
    ButtonVisible = False
    AltBtnWidth = 15
    ButtonWidth = 15
    DisplayModID = 0
    ForceOnFocus = True
  end
  object rkyDepName: TRKeyRzBtnEdit
    Left = 542
    Top = 409
    Width = 70
    Height = 21
    Text = ''
    Color = clBtnFace
    Enabled = False
    TabOrder = 20
    ButtonKind = bkFind
    ButtonVisible = False
    AltBtnWidth = 15
    ButtonWidth = 15
    DisplayModID = 0
    ForceOnFocus = True
  end
  object edtBatch: TEdit
    Left = 131
    Top = 337
    Width = 109
    Height = 21
    TabOrder = 21
    Text = '1'
    OnExit = edtBatchExit
    OnKeyPress = edtBatchKeyPress
  end
  object edtDays: TEdit
    Left = 349
    Top = 334
    Width = 68
    Height = 21
    Enabled = False
    TabOrder = 22
    Text = '0'
    OnKeyPress = edtBatchKeyPress
  end
  object cbxFactory: TRzComboBox
    Left = 133
    Top = 268
    Width = 310
    Height = 21
    Style = csDropDownList
    TabOrder = 23
  end
  object edtDate: TEdit
    Left = 131
    Top = 301
    Width = 109
    Height = 21
    TabOrder = 24
    OnExit = edtDateExit
  end
  object btnSupplier: TBitBtn
    Left = 243
    Top = 232
    Width = 25
    Height = 25
    Glyph.Data = {
      EE000000424DEE000000000000007600000028000000100000000F0000000100
      04000000000078000000130B0000130B00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      888800000888880000080F000888880F00080F000888880F0008000000080000
      000800F000000F00000800F000800F00000800F000800F000008800000000000
      0088880F00080F000888880000080000088888800088800088888880F08880F0
      888888800088800088888888888888888888}
    TabOrder = 25
    OnClick = btnSupplierClick
  end
  object dbchk1: TDBCheckBox
    Left = 477
    Top = 305
    Width = 97
    Height = 17
    Caption = #32039#24613#29289#26009
    DataField = 'IF_urgency'
    DataSource = dsINVT
    TabOrder = 26
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object rkyReason: TRKeyRzBtnEdit
    Left = 349
    Top = 443
    Width = 263
    Height = 21
    Text = ''
    TabOrder = 27
    ButtonKind = bkFind
    ButtonVisible = False
    AltBtnWidth = 15
    ButtonWidth = 15
    DataSource = dsINVT
    DataSourceField = 'reason'
    DisplayModID = 0
    ForceOnFocus = True
  end
  object btn1: TBitBtn
    Left = 401
    Top = 55
    Width = 75
    Height = 25
    Caption = #22312#36884#26597#35810
    TabOrder = 28
    OnClick = btn1Click
  end
  object btnOldPrice: TBitBtn
    Left = 475
    Top = 55
    Width = 75
    Height = 25
    Caption = #21382#21490#20215#26684
    TabOrder = 29
    OnClick = btnOldPriceClick
  end
  object edtUnTax: TEdit
    Left = 132
    Top = 406
    Width = 107
    Height = 21
    Enabled = False
    TabOrder = 30
    Text = '0'
    OnExit = edtUnTaxExit
    OnKeyPress = edtUnTaxKeyPress
  end
  object edtTax: TEdit
    Left = 133
    Top = 444
    Width = 104
    Height = 21
    TabOrder = 31
    Text = '0'
    OnExit = edtTaxExit
    OnKeyPress = edtUnTaxKeyPress
  end
  object edtDesc: TEdit
    Left = 131
    Top = 91
    Width = 315
    Height = 21
    Enabled = False
    TabOrder = 32
  end
  object cdsINVT: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT     dbo.Data0017.INV_PART_NUMBER'#13#10#13#9#9',CRITICAL_MATL_FLAG,' +
      'dbo.Data0017.CATALOG_NUM'#13#10#13#9#9', dbo.Data0017.REPORT_VALUE2,dbo.Da' +
      'ta0017.CONSIGN_ONHAND_QTY'#13#9#9#13#10#13#9#9', dbo.Data0017.INV_NAME,dbo.Dat' +
      'a0017.INV_PART_DESCRIPTION'#13#10#13#9#9',dbo.Data0017.PREF_SUPPLIER_PTR'#13#10 +
      #13#9#9', dbo.Data0017.INV_DESCRIPTION,dbo.Data0071.INVT_PTR'#13#10#9#9',dbo.' +
      'Data0071.PRICE,dbo.Data0071.tax_price'#13#10#13#9#9',dbo.Data0071.TAX_2,db' +
      'o.Data0071.WO_PTR'#13#10#13#9#9',dbo.Data0071.PURCHASE_UNIT_PTR,dbo.Data00' +
      '71.CONVERSION_FACTOR'#13#10#13#9#9',dbo.Data0071.extra_req,dbo.Data0071.av' +
      'l_flag,dbo.Data0071.REQ_DATE'#13#10#13#9#9',dbo.Data0071.rohs,dbo.Data0071' +
      '.IF_CAF,dbo.Data0071.rkey69'#13#10#9#9',dbo.Data0071.IF_urgency,dbo.Data' +
      '0071.QUAN_ORD,dbo.Data0070.SUPPLIER_POINTER'#13#10'                   ' +
      '             ,dbo.Data0070.WAREHOUSE_POINTER,dbo.Data0071.reason' +
      #13#10'                                ,ANALYSIS_CODE_2'#13#10' '#13'FROM      ' +
      'dbo.Data0071 INNER JOIN'#13#10'   '#13'            dbo.Data0017 ON dbo.Dat' +
      'a0071.INVT_PTR = dbo.Data0017.RKEY  INNER JOIN'#13#10'               d' +
      'bo.Data0070 ON dbo.Data0070.rkey = dbo.Data0071.PO_ptr'#13#10
    Params = <>
    ProviderName = 'dtstprvdr1'
    Left = 48
    Top = 488
    object cdsINVTINV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object cdsINVTCRITICAL_MATL_FLAG: TSmallintField
      FieldName = 'CRITICAL_MATL_FLAG'
    end
    object cdsINVTCATALOG_NUM: TStringField
      FieldName = 'CATALOG_NUM'
      FixedChar = True
      Size = 10
    end
    object cdsINVTREPORT_VALUE2: TFloatField
      FieldName = 'REPORT_VALUE2'
    end
    object cdsINVTCONSIGN_ONHAND_QTY: TFloatField
      FieldName = 'CONSIGN_ONHAND_QTY'
    end
    object cdsINVTINV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object cdsINVTINV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object cdsINVTPREF_SUPPLIER_PTR: TIntegerField
      FieldName = 'PREF_SUPPLIER_PTR'
    end
    object cdsINVTINV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object cdsINVTINVT_PTR: TIntegerField
      FieldName = 'INVT_PTR'
    end
    object cdsINVTPRICE: TFMTBCDField
      FieldName = 'PRICE'
      Precision = 15
      Size = 6
    end
    object cdsINVTtax_price: TBCDField
      FieldName = 'tax_price'
      Precision = 13
    end
    object cdsINVTTAX_2: TBCDField
      FieldName = 'TAX_2'
      DisplayFormat = '#0.00'
      Precision = 4
      Size = 2
    end
    object cdsINVTWO_PTR: TIntegerField
      FieldName = 'WO_PTR'
    end
    object cdsINVTPURCHASE_UNIT_PTR: TIntegerField
      FieldName = 'PURCHASE_UNIT_PTR'
    end
    object cdsINVTCONVERSION_FACTOR: TFloatField
      FieldName = 'CONVERSION_FACTOR'
    end
    object cdsINVTextra_req: TStringField
      FieldName = 'extra_req'
      Size = 50
    end
    object cdsINVTavl_flag_1: TStringField
      FieldName = 'avl_flag'
      FixedChar = True
      Size = 1
    end
    object cdsINVTREQ_DATE: TDateTimeField
      FieldName = 'REQ_DATE'
    end
    object cdsINVTrohs: TStringField
      FieldName = 'rohs'
      Size = 10
    end
    object cdsINVTIF_CAF: TWideStringField
      FieldName = 'IF_CAF'
      FixedChar = True
      Size = 2
    end
    object cdsINVTrkey69: TIntegerField
      FieldName = 'rkey69'
    end
    object cdsINVTIF_urgency: TBooleanField
      FieldName = 'IF_urgency'
    end
    object cdsINVTQUAN_ORD: TBCDField
      FieldName = 'QUAN_ORD'
      DisplayFormat = '#,0.0000'
      Precision = 13
    end
    object cdsINVTSUPPLIER_POINTER: TIntegerField
      FieldName = 'SUPPLIER_POINTER'
    end
    object cdsINVTWAREHOUSE_POINTER: TIntegerField
      FieldName = 'WAREHOUSE_POINTER'
    end
    object cdsINVTreason: TStringField
      FieldName = 'reason'
      Size = 60
    end
    object cdsINVTANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
    end
  end
  object dsINVT: TDataSource
    DataSet = cdsINVT
    Left = 104
    Top = 488
  end
end
