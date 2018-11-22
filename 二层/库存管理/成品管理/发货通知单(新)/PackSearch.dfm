object Form_PackSearch: TForm_PackSearch
  Left = 182
  Top = 94
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #35013#36816#25351#27966#26126#32454#26597#25214
  ClientHeight = 529
  ClientWidth = 924
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 347
    Top = 8
    Width = 52
    Height = 13
    Alignment = taRightJustify
    Caption = #38144#21806#35746#21333
  end
  object Label2: TLabel
    Left = 613
    Top = 8
    Width = 77
    Height = 13
    Caption = 'SALES_ORDER'
    Visible = False
  end
  object Label4: TLabel
    Left = 4
    Top = 8
    Width = 79
    Height = 13
    Caption = #25351#27966#26085#26399' '#20174':'
  end
  object Label3: TLabel
    Left = 187
    Top = 8
    Width = 20
    Height = 13
    Caption = #21040':'
  end
  object Label5: TLabel
    Left = 727
    Top = 9
    Width = 158
    Height = 13
    Caption = #25552#31034#65306#25353'Ctrl'#38190#21487#20197#22810#36873#65281
    Font.Charset = ANSI_CHARSET
    Font.Color = clFuchsia
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 404
    Top = 4
    Width = 177
    Height = 21
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = Edit1KeyDown
  end
  object Panel1: TPanel
    Left = 0
    Top = 488
    Width = 924
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 389
      Top = 9
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 473
      Top = 8
      Width = 75
      Height = 26
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
    object CheckBox1: TCheckBox
      Left = 12
      Top = 11
      Width = 57
      Height = 17
      Caption = #20840#36873
      TabOrder = 2
      OnClick = CheckBox1Click
    end
  end
  object BtnBrush: TBitBtn
    Left = 582
    Top = 3
    Width = 26
    Height = 22
    Hint = #21047#26032#25968#25454
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
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
  object dtpk1: TDateTimePicker
    Left = 85
    Top = 3
    Width = 96
    Height = 21
    Date = 38847.000000000000000000
    Time = 38847.000000000000000000
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 3
    OnCloseUp = dtpk1Exit
    OnExit = dtpk1Exit
  end
  object dtpk2: TDateTimePicker
    Left = 211
    Top = 3
    Width = 96
    Height = 21
    Date = 38847.000000000000000000
    Time = 38847.000000000000000000
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 4
    OnCloseUp = dtpk1Exit
    OnExit = dtpk1Exit
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 31
    Width = 924
    Height = 457
    Align = alBottom
    DataSource = DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 5
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'SALES_ORDER'
        Title.Caption = #38144#21806#35746#21333
        Title.Color = clRed
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'delivery_no'
        Title.Caption = #35013#31665#21333#21495' '
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_NUMBER'
        Title.Caption = #26412#21378#32534#21495
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Title.Caption = #23458#25143#22411#21495
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORIG_CUSTOMER'
        Title.Caption = #21407#20851#32852#23458#25143
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        Title.Caption = #35746#21333#21495
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cartons_no'
        Title.Caption = #31665#25968
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_SHIPPED'
        Title.Caption = #35013#36816#25968#37327
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rkey529_ptr'
        Title.Caption = #24050#25253#20851#25968#37327
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21487#25253#20851#25968#37327
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PART_PRICE'
        Title.Caption = #20215#26684
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'weigth'
        Title.Caption = #37325#37327
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_name'
        Title.Caption = #24037#21378
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_CODE'
        Title.Caption = #36135#24065
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHIPMENT_NO'
        Title.Caption = #35013#36816#21495#30721
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DATE_SHIPPED'
        Title.Caption = #25351#27966#26085#26399
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'assigntype'
        Title.Caption = #25351#27966
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'rkey64'
        Title.Caption = #26631#35782#21015
        Visible = False
      end>
  end
  object DataSource1: TDataSource
    DataSet = ads64
    Left = 240
    Top = 200
  end
  object ads64: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT'#13#10'      Data0060.SALES_ORDER,Data0060.COMMISION_ON_TOOLING' +
      ','#13#10'      Data0060.SCH_DATE, Data0060.ITEM_NBR,Data0064.cust_decl' +
      ','#13#10'      Data0010.COD_FLAG,Data0060.RKEY AS rkey60,'#13#10'      Data0' +
      '060.PARTS_ORDERED, Data0060.PARTS_SHIPPED,'#13#10'      Data0060.PARTS' +
      '_RETURNED,Data0060.SHIPPING_METHOD,'#13#10'      Data0060.CURRENCY_PTR' +
      ',Data0060.PART_PRICE,'#13#10'      Data0060.STATUS,data0060.fob,data00' +
      '60.REFERENCE_NUMBER,'#13#10'      Data0060.CUST_SHIP_ADDR_PTR,Data0060' +
      '.CUSTOMER_PTR,'#13#10'      Data0060.PURCHASE_ORDER_PTR,Data0060.CUST_' +
      'PART_PTR,data0015.rkey rkey15,data0015.WAREHOUSE_CODE,data0015.a' +
      'bbr_name, '#13#10'      Data0025.MANU_PART_NUMBER,Data0025.MANU_PART_D' +
      'ESC,Data0025.ANALYSIS_CODE_2,Data0025.ORIG_CUSTOMER,'#13#10'      Data' +
      '0010.CUST_CODE,Data0010.CUSTOMER_NAME,data0010.DO_SMOOTHING,'#13#10'  ' +
      '    data0010.INVOICE_NOTE_PAD_PTR,data0010.CUSTOMER_TYPE,'#13#10'     ' +
      ' Data0064.SHIPMENT_NO, Data0064.QUAN_SHIPPED,Data0064.cartons_no' +
      ','#13#10'      Data0064.DATE_ASSIGN, data0064.ovsh_discount,'#13#10'      Da' +
      'ta0064.DATE_SHIPPED,Data0064.PACKING_SLIP_FLAG,'#13#10'       (Data006' +
      '4.quan_shipped-isnull(data0064.rkey529_ptr,0) ) * Data0060.PART_' +
      'PRICE AS total_case,'#13#10'      Data0064.RKEY AS rkey64,Data0064.pac' +
      'king_list_ptr,isnull(Data0064.rkey529_ptr,0) as rkey529_ptr,'#13#10'  ' +
      '    Data0064.quan_shipped-isnull(data0064.rkey529_ptr,0) as '#39#21487#25253#20851 +
      #25968#37327#39','#13#10'      Data0064.REPORT_UNIT_VALUE1*0.001 as pcs_weight,'#13#10' (' +
      'Data0064.quan_shipped-isnull(data0064.rkey529_ptr,0) )*data0064.' +
      'REPORT_UNIT_VALUE1*0.001 as weigth,'#13#10'case data0064.assign_type  ' +
      'when 0 then '#39#27491#24120#39' when 1 then '#39#36864#36135#39#13#10'end as assigntype,'#13#10'      Dat' +
      'a0012.SHIP_TO_ADDRESS_1,Data0012.SHIP_TO_CONTACT,Data0012.ZIP,'#13#10 +
      '      Data0012.SHIP_TO_PHONE,Data0012.LOCATION,Data0012.STATE,Da' +
      'ta0012.rkey as rkey12,'#13#10'      Data0012.LOCNAME_FOR_FORM,Data0012' +
      '.MISC_BARCODE_LABLE,Data0012.SHP_ADDR1_FOR_FORM,'#13#10'      Data0012' +
      '.COFC_FORMAT_FILENAME,Data0012.S3_BARCODE_LABLE,Data0012.S4_BARC' +
      'ODE_LABLE,Data0012.PACKGE_BARCODE_LABLE,'#13#10'      Data0097.OPEN_SO' +
      'S,Data0097.PO_DATE,Data0097.PO_NUMBER,'#13#10'      Data0001.CURR_CODE' +
      ',Data0001.CURR_NAME,'#13#10'      Data0005.EMPLOYEE_NAME,Data0439.deli' +
      'very_no'#13#10'FROM Data0064 INNER JOIN'#13#10'      Data0060 ON Data0064.SO' +
      '_PTR = Data0060.RKEY INNER JOIN'#13#10'      Data0025 ON Data0060.CUST' +
      '_PART_PTR = Data0025.RKEY INNER JOIN'#13#10'      Data0010 ON Data0060' +
      '.CUSTOMER_PTR = Data0010.RKEY INNER JOIN'#13#10'      Data0005 ON Data' +
      '0064.ENT_EMPL_PTR = Data0005.RKEY INNER JOIN'#13#10'      Data0097 ON ' +
      'Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY INNER JOIN'#13#10'      Da' +
      'ta0001 ON Data0060.CURRENCY_PTR = Data0001.RKEY INNER JOIN'#13#10'    ' +
      '  Data0012 ON Data0060.CUST_SHIP_ADDR_PTR = Data0012.RKEY inner ' +
      'join data0015 on data0060.SHIP_REG_TAX_ID=data0015.rkey'#13#10'     le' +
      'ft outer join data0439 on data0064.packing_list_ptr=data0439.rke' +
      'y'#13#10'WHERE'#13#10'      (Data0064.PACKING_SLIP_FLAG = '#39'1'#39')  and (data006' +
      '4.quan_shipped-ISNULL(rkey529_ptr,0))>0 '#13#10'      and  (data0060.c' +
      'ustomer_ptr=:rkey10)'#13#10'      and  (data0064.DATE_ASSIGN>=:dtpk1) ' +
      'and(data0064.DATE_ASSIGN<=:dtpk2)'#13#10#13#10
    IndexFieldNames = 'SALES_ORDER'
    Parameters = <
      item
        Name = 'rkey10'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    Prepared = True
    Left = 327
    Top = 204
    object ads64SALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ads64COMMISION_ON_TOOLING: TStringField
      FieldName = 'COMMISION_ON_TOOLING'
      FixedChar = True
      Size = 1
    end
    object ads64SCH_DATE: TDateTimeField
      FieldName = 'SCH_DATE'
    end
    object ads64ITEM_NBR: TStringField
      FieldName = 'ITEM_NBR'
      FixedChar = True
      Size = 5
    end
    object ads64COD_FLAG: TStringField
      FieldName = 'COD_FLAG'
      FixedChar = True
      Size = 1
    end
    object ads64rkey60: TIntegerField
      FieldName = 'rkey60'
      ReadOnly = True
    end
    object ads64PARTS_ORDERED: TFloatField
      FieldName = 'PARTS_ORDERED'
    end
    object ads64PARTS_SHIPPED: TFloatField
      FieldName = 'PARTS_SHIPPED'
    end
    object ads64PARTS_RETURNED: TFloatField
      FieldName = 'PARTS_RETURNED'
    end
    object ads64SHIPPING_METHOD: TStringField
      FieldName = 'SHIPPING_METHOD'
      FixedChar = True
    end
    object ads64CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object ads64PART_PRICE: TFloatField
      FieldName = 'PART_PRICE'
    end
    object ads64STATUS: TWordField
      FieldName = 'STATUS'
    end
    object ads64fob: TStringField
      FieldName = 'fob'
      Size = 50
    end
    object ads64REFERENCE_NUMBER: TStringField
      FieldName = 'REFERENCE_NUMBER'
      Size = 100
    end
    object ads64CUST_SHIP_ADDR_PTR: TIntegerField
      FieldName = 'CUST_SHIP_ADDR_PTR'
    end
    object ads64CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object ads64PURCHASE_ORDER_PTR: TIntegerField
      FieldName = 'PURCHASE_ORDER_PTR'
    end
    object ads64CUST_PART_PTR: TIntegerField
      FieldName = 'CUST_PART_PTR'
    end
    object ads64rkey15: TIntegerField
      FieldName = 'rkey15'
      ReadOnly = True
    end
    object ads64WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ads64abbr_name: TStringField
      FieldName = 'abbr_name'
      Size = 10
    end
    object ads64MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ads64MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ads64ANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      Size = 80
    end
    object ads64CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ads64CUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object ads64DO_SMOOTHING: TWordField
      FieldName = 'DO_SMOOTHING'
    end
    object ads64INVOICE_NOTE_PAD_PTR: TIntegerField
      FieldName = 'INVOICE_NOTE_PAD_PTR'
    end
    object ads64CUSTOMER_TYPE: TIntegerField
      FieldName = 'CUSTOMER_TYPE'
    end
    object ads64SHIPMENT_NO: TSmallintField
      FieldName = 'SHIPMENT_NO'
    end
    object ads64QUAN_SHIPPED: TIntegerField
      FieldName = 'QUAN_SHIPPED'
    end
    object ads64cartons_no: TIntegerField
      FieldName = 'cartons_no'
    end
    object ads64DATE_ASSIGN: TDateTimeField
      FieldName = 'DATE_ASSIGN'
    end
    object ads64ovsh_discount: TBCDField
      FieldName = 'ovsh_discount'
      Precision = 5
      Size = 2
    end
    object ads64DATE_SHIPPED: TDateTimeField
      FieldName = 'DATE_SHIPPED'
    end
    object ads64PACKING_SLIP_FLAG: TStringField
      FieldName = 'PACKING_SLIP_FLAG'
      FixedChar = True
      Size = 1
    end
    object ads64total_case: TFloatField
      FieldName = 'total_case'
      ReadOnly = True
    end
    object ads64rkey64: TIntegerField
      FieldName = 'rkey64'
      ReadOnly = True
    end
    object ads64packing_list_ptr: TIntegerField
      FieldName = 'packing_list_ptr'
    end
    object ads64rkey529_ptr: TIntegerField
      FieldName = 'rkey529_ptr'
      ReadOnly = True
    end
    object ads64DSDesigner: TIntegerField
      FieldName = #21487#25253#20851#25968#37327
      ReadOnly = True
    end
    object ads64weigth: TBCDField
      FieldName = 'weigth'
      ReadOnly = True
      Precision = 24
      Size = 7
    end
    object ads64assigntype: TStringField
      FieldName = 'assigntype'
      ReadOnly = True
      Size = 4
    end
    object ads64SHIP_TO_ADDRESS_1: TStringField
      FieldName = 'SHIP_TO_ADDRESS_1'
      Size = 100
    end
    object ads64SHIP_TO_CONTACT: TStringField
      FieldName = 'SHIP_TO_CONTACT'
    end
    object ads64ZIP: TStringField
      FieldName = 'ZIP'
      Size = 10
    end
    object ads64SHIP_TO_PHONE: TStringField
      FieldName = 'SHIP_TO_PHONE'
    end
    object ads64LOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 80
    end
    object ads64STATE: TStringField
      FieldName = 'STATE'
      Size = 10
    end
    object ads64rkey12: TIntegerField
      FieldName = 'rkey12'
      ReadOnly = True
    end
    object ads64LOCNAME_FOR_FORM: TStringField
      FieldName = 'LOCNAME_FOR_FORM'
      Size = 100
    end
    object ads64MISC_BARCODE_LABLE: TStringField
      FieldName = 'MISC_BARCODE_LABLE'
      Size = 100
    end
    object ads64SHP_ADDR1_FOR_FORM: TStringField
      FieldName = 'SHP_ADDR1_FOR_FORM'
      Size = 100
    end
    object ads64COFC_FORMAT_FILENAME: TStringField
      FieldName = 'COFC_FORMAT_FILENAME'
      Size = 100
    end
    object ads64S3_BARCODE_LABLE: TStringField
      FieldName = 'S3_BARCODE_LABLE'
      Size = 100
    end
    object ads64S4_BARCODE_LABLE: TStringField
      FieldName = 'S4_BARCODE_LABLE'
      Size = 100
    end
    object ads64PACKGE_BARCODE_LABLE: TStringField
      FieldName = 'PACKGE_BARCODE_LABLE'
      Size = 100
    end
    object ads64OPEN_SOS: TSmallintField
      FieldName = 'OPEN_SOS'
    end
    object ads64PO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object ads64PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ads64CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ads64CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object ads64EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ads64delivery_no: TStringField
      FieldName = 'delivery_no'
      Size = 10
    end
    object ads64cust_decl: TStringField
      FieldName = 'cust_decl'
      Size = 50
    end
    object ads64pcs_weight: TBCDField
      FieldName = 'pcs_weight'
      ReadOnly = True
      Precision = 13
      Size = 7
    end
    object ads64ORIG_CUSTOMER: TStringField
      FieldName = 'ORIG_CUSTOMER'
      Size = 30
    end
  end
end
