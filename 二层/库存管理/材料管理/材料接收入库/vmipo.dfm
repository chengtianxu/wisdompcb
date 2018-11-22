object Form9: TForm9
  Left = 260
  Top = 171
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'VMI'#25209#27425#26126#32454
  ClientHeight = 570
  ClientWidth = 959
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid2: TDBGrid
    Left = 0
    Top = 281
    Width = 959
    Height = 239
    Align = alClient
    DataSource = DataSource2
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'INV_PART_NUMBER'
        Title.Caption = #26448#26009#32534#30721
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_NAME'
        Title.Caption = #26448#26009#21517#31216
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_DESCRIPTION'
        Title.Caption = #26448#26009#35268#26684
        Width = 137
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTITY'
        Title.Caption = #24050#25509#25910#25968#37327
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_ON_HAND'
        Title.Caption = #21487#29992#25968#37327
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'location'
        Title.Caption = #20179#24211
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Title.Caption = #21333#20301
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rohs'
        Title.Caption = #29615#20445
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'price'
        Title.Caption = #20215#26684#19981#21547#31246
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAX_PRICE'
        Title.Caption = #20215#26684#21547#31246
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAX_2'
        Title.Caption = #31246#29575
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_DATE'
        Title.Caption = #21046#36896#26085#26399
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXPIRE_DATE'
        Title.Caption = #26377#25928#26399
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUPPLIER2'
        Title.Caption = #29289#26009#25209#27425
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BARCODE_ID'
        Title.Caption = #22791#27880
        Width = 149
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORIG_ABBRNAME'
        Visible = True
      end>
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 32
    Width = 959
    Height = 249
    Align = alTop
    DataSource = DataSource1
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'GRN_NUMBER'
        Title.Caption = 'VMI'#20837#24211#21333#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'stype'
        Title.Caption = #20837#24211#31867#22411
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        Title.Caption = #37319#36141#35746#21333#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'deliver_number'
        Title.Caption = #36865#36135#21333#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUPPLIER_NAME'
        Title.Caption = #20379#24212#21830
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WAREHOUSE_NAME'
        Title.Caption = #24037#21378
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        Title.Caption = #36135#24065
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXCH_RATE'
        Title.Caption = #27719#29575
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REF_NUMBER'
        Title.Caption = #22791#27880
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CREATE_DATE'
        Title.Caption = #21019#24314#26085#26399
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 959
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 54
      Top = 9
      Width = 108
      Height = 13
      Alignment = taRightJustify
      Caption = '    VMI'#20837#24211#21333#21495':'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 40
      Top = 9
      Width = 26
      Height = 13
      Caption = #25628#32034
    end
    object Label3: TLabel
      Left = 392
      Top = 9
      Width = 52
      Height = 13
      Caption = #26448#26009#32534#30721
    end
    object Edit1: TEdit
      Left = 165
      Top = 5
      Width = 157
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 0
      OnChange = Edit1Change
    end
    object BitBtn1: TBitBtn
      Left = 329
      Top = 3
      Width = 25
      Height = 25
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
    object Edit2: TEdit
      Left = 447
      Top = 5
      Width = 146
      Height = 21
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 2
    end
    object BitBtn2: TBitBtn
      Left = 622
      Top = 3
      Width = 25
      Height = 25
      TabOrder = 3
      TabStop = False
      Visible = False
      OnClick = BitBtn2Click
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
    object BitBtn4: TBitBtn
      Left = 597
      Top = 3
      Width = 25
      Height = 25
      TabOrder = 4
      OnClick = BitBtn4Click
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        04000000000078000000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888800000888880000080F000888880F00080F000888880F0008000000080000
        000800F000000F00000800F000800F00000800F000800F000008800000000000
        0088880F00080F000888880000080000088888800088800088888880F08880F0
        888888800088800088888888888888888888}
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 520
    Width = 959
    Height = 50
    Align = alBottom
    TabOrder = 3
    DesignSize = (
      959
      50)
    object Button1: TButton
      Left = 376
      Top = 16
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 578
      Top = 16
      Width = 75
      Height = 25
      Anchors = [akTop]
      Cancel = True
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = ADS133
    Left = 328
    Top = 120
  end
  object DataSource2: TDataSource
    DataSet = ADO134
    Left = 344
    Top = 368
  end
  object ADS133: TADODataSet
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT Data0133.RKEY,Data0133.GRN_NUMBER,Data0070.PO_NUMBER,Data' +
      '0070.SECOND_WHSE_PTR,'#13#10'      Data0070.CONFIRMATION_NUMBER, Data0' +
      '070.PO_DATE,data0133.deliver_number,'#13#10'      Data0023.CODE, Data0' +
      '023.SUPPLIER_NAME,Data0023.ABBR_NAME AS abbr_suppname,'#13#10'      Da' +
      'ta0015.ABBR_NAME AS abbr_warename,Data0133.WAREHOUSE_PTR,data013' +
      '3.supp_ptr,'#13#10'      Data0015.WAREHOUSE_CODE,Data0015.WAREHOUSE_NA' +
      'ME,data0133.po_ptr,'#13#10'      Data0133.CURRENCY_PTR,Data0001.CURR_C' +
      'ODE, Data0001.CURR_NAME,'#13#10'      Data0133.EXCH_RATE, Data0133.REF' +
      '_NUMBER,DATA0133.SHIP_BY,'#13#10'      DATA0133.SHIP_DATE,DATA0133.CRE' +
      'ATE_DATE,DATA0133.TTYPE,'#13#10'      CASE'#13#10'      WHEN DATA0133.TTYPE=' +
      '3 THEN '#39#30452#25509#20837#24211#39#13#10'      WHEN DATA0133.TTYPE=1 THEN '#39#32534#30721#20837#24211#39' end as st' +
      'ype'#13#10'FROM dbo.Data0133 INNER JOIN'#13#10'      dbo.Data0023 ON '#13#10'     ' +
      ' dbo.Data0133.SUPP_PTR = dbo.Data0023.RKEY INNER JOIN'#13#10'      dbo' +
      '.Data0015 ON '#13#10'      dbo.Data0133.WAREHOUSE_PTR = dbo.Data0015.R' +
      'KEY INNER JOIN'#13#10'      dbo.Data0001 ON '#13#10'      dbo.Data0133.CURRE' +
      'NCY_PTR = dbo.Data0001.RKEY LEFT OUTER JOIN'#13#10'      dbo.Data0070 ' +
      'ON dbo.Data0133.PO_PTR = dbo.Data0070.RKEY'#13#10'where data0133.rkey ' +
      'in(select distinct data0133.rkey from data0133 inner join data01' +
      '34 on data0133.rkey=data0134.grn_ptr where data0134.quan_on_hand' +
      '>0)'#13#10#13#10#13#10#13#10
    IndexFieldNames = 'GRN_NUMBER'
    Parameters = <>
    Left = 360
    Top = 120
    object ADS133RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADS133GRN_NUMBER: TStringField
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object ADS133PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object ADS133CONFIRMATION_NUMBER: TStringField
      FieldName = 'CONFIRMATION_NUMBER'
    end
    object ADS133PO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object ADS133CODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object ADS133SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object ADS133abbr_suppname: TStringField
      FieldName = 'abbr_suppname'
      Size = 16
    end
    object ADS133abbr_warename: TStringField
      FieldName = 'abbr_warename'
      Size = 10
    end
    object ADS133WAREHOUSE_PTR: TIntegerField
      FieldName = 'WAREHOUSE_PTR'
    end
    object ADS133WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ADS133WAREHOUSE_NAME: TStringField
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
    object ADS133CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object ADS133CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADS133CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object ADS133EXCH_RATE: TBCDField
      FieldName = 'EXCH_RATE'
      Precision = 12
      Size = 8
    end
    object ADS133REF_NUMBER: TStringField
      FieldName = 'REF_NUMBER'
      Size = 100
    end
    object ADS133SHIP_BY: TStringField
      FieldName = 'SHIP_BY'
    end
    object ADS133SHIP_DATE: TDateTimeField
      FieldName = 'SHIP_DATE'
    end
    object ADS133CREATE_DATE: TDateTimeField
      FieldName = 'CREATE_DATE'
    end
    object ADS133TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object ADS133stype: TStringField
      FieldName = 'stype'
      ReadOnly = True
      Size = 8
    end
    object ADS133deliver_number: TStringField
      FieldName = 'deliver_number'
      Size = 15
    end
    object ADS133supp_ptr: TIntegerField
      FieldName = 'supp_ptr'
    end
    object ADS133po_ptr: TIntegerField
      FieldName = 'po_ptr'
    end
    object ADS133SECOND_WHSE_PTR: TIntegerField
      FieldName = 'SECOND_WHSE_PTR'
    end
  end
  object ADO134: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT dbo.Data0134.RKEY, dbo.Data0017.INV_NAME, dbo.Data0017.IN' +
        'V_DESCRIPTION, '
      
        '      dbo.Data0134.QUANTITY, Data0134.QUAN_ON_HAND, data0134.inv' +
        'entory_ptr, '
      
        '      dbo.Data0002.UNIT_NAME,dbo.Data0134.SOURCE_PTR, data0134.u' +
        'nit_ptr,'
      
        '      dbo.Data0017.SHELF_LIFE, Data0017.INV_PART_NUMBER, data001' +
        '7.STOCK_BASE,'
      
        '      dbo.Data0134.rohs,dbo.Data0134.price,data0134.TAX_PRICE,da' +
        'ta0134.MANU_DATE,'
      
        '      DATA0134.TAX_2,DATA0134.EXPIRE_DATE,DATA0134.SUPPLIER2,dat' +
        'a0134.cust_decl,Data0134.SUPPLIER3,'
      
        '      DATA0134.BARCODE_ID,data0016.location,data0134.RKEY391,dat' +
        'a0071.CONVERSION_FACTOR,Data0134.ORIG_ABBRNAME'
      'FROM dbo.Data0134 INNER JOIN'
      
        '       dbo.data0016 on data0134.location_ptr=data0016.rkey inner' +
        ' join'
      
        '      dbo.Data0017 ON dbo.Data0134.INVENTORY_PTR = dbo.Data0017.' +
        'RKEY INNER JOIN'
      '      dbo.Data0002 ON '
      '      dbo.Data0134.UNIT_PTR = dbo.Data0002.RKEY LEFT OUTER JOIN'
      '      DATA0071 ON DATA0134.SOURCE_PTR=DATA0071.RKEY    '
      'where data0134.quan_on_hand>0 and data0134.GRN_PTR=:rkey'
      'order by data0134.rkey')
    Left = 377
    Top = 367
    object ADO134RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO134INV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ADO134INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ADO134QUANTITY: TBCDField
      FieldName = 'QUANTITY'
      Precision = 19
    end
    object ADO134QUAN_ON_HAND: TBCDField
      FieldName = 'QUAN_ON_HAND'
      Precision = 19
    end
    object ADO134UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object ADO134SOURCE_PTR: TIntegerField
      FieldName = 'SOURCE_PTR'
    end
    object ADO134SHELF_LIFE: TSmallintField
      FieldName = 'SHELF_LIFE'
    end
    object ADO134INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADO134rohs: TStringField
      FieldName = 'rohs'
      Size = 10
    end
    object ADO134price: TBCDField
      FieldName = 'price'
      Precision = 15
      Size = 6
    end
    object ADO134TAX_PRICE: TBCDField
      FieldName = 'TAX_PRICE'
      Precision = 12
      Size = 3
    end
    object ADO134TAX_2: TBCDField
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object ADO134EXPIRE_DATE: TDateTimeField
      FieldName = 'EXPIRE_DATE'
    end
    object ADO134SUPPLIER2: TStringField
      FieldName = 'SUPPLIER2'
      Size = 30
    end
    object ADO134BARCODE_ID: TStringField
      FieldName = 'BARCODE_ID'
      Size = 50
    end
    object ADO134inventory_ptr: TIntegerField
      FieldName = 'inventory_ptr'
    end
    object ADO134unit_ptr: TIntegerField
      FieldName = 'unit_ptr'
    end
    object ADO134STOCK_BASE: TFloatField
      FieldName = 'STOCK_BASE'
    end
    object ADO134location: TStringField
      FieldName = 'location'
    end
    object ADO134MANU_DATE: TDateTimeField
      FieldName = 'MANU_DATE'
    end
    object ADO134cust_decl: TStringField
      FieldName = 'cust_decl'
      Size = 50
    end
    object ADO134RKEY391: TIntegerField
      FieldName = 'RKEY391'
    end
    object ADO134CONVERSION_FACTOR: TFloatField
      FieldName = 'CONVERSION_FACTOR'
    end
    object ADO134SUPPLIER3: TStringField
      FieldName = 'SUPPLIER3'
      Size = 30
    end
    object ADO134ORIG_ABBRNAME: TStringField
      DisplayLabel = #21697#29260#20379#24212#21830
      FieldName = 'ORIG_ABBRNAME'
      Size = 16
    end
  end
end
