object Form_posearch: TForm_posearch
  Left = 257
  Top = 157
  Width = 1038
  Height = 564
  Caption = #37319#36141#35746#21333#25628#32034
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
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
  object Splitter1: TSplitter
    Left = 0
    Top = 310
    Width = 1022
    Height = 5
    Cursor = crVSplit
    HelpType = htKeyword
    Align = alBottom
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 32
    Width = 1022
    Height = 278
    Align = alClient
    DataSource = DataSource1
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
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
        FieldName = 'PO_NUMBER'
        Title.Caption = #37319#36141#35746#21333#21495#30721
        Title.Color = clRed
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_DATE'
        ReadOnly = False
        Title.Caption = #35746#21333#26085#26399
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_warename'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEPT_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANALYSIS_CODE_1'
        Title.Caption = #35831#36141#20154#21592
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONFIRMATION_NUMBER'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_suppname'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_type'
        Width = 80
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 485
    Width = 1022
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      1022
      41)
    object Button1: TButton
      Left = 383
      Top = 11
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #30830#23450
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 512
      Top = 11
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
    object CheckBox1: TCheckBox
      Left = 7
      Top = 14
      Width = 330
      Height = 17
      Caption = #21246#36873#26174#31034#25152#26377#26448#26009#65292#40664#35748#26174#31034#33021#20837#24211#30340#26448#26009
      Checked = True
      State = cbChecked
      TabOrder = 2
      OnClick = CheckBox1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1022
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 98
      Top = 9
      Width = 113
      Height = 13
      Alignment = taRightJustify
      Caption = '    '#37319#36141#35746#21333#21495#30721':'
    end
    object Edit1: TEdit
      Left = 214
      Top = 5
      Width = 157
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 0
      OnChange = Edit1Change
      OnKeyDown = DBGrid1KeyDown
    end
    object BitBtn1: TBitBtn
      Left = 378
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
  end
  object Panel3: TPanel
    Left = 0
    Top = 315
    Width = 1022
    Height = 170
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object DBGrid3: TDBGrid
      Left = 0
      Top = 0
      Width = 1022
      Height = 170
      Align = alClient
      DataSource = DataSource3
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'DESCRIPTION'
          Width = 121
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GUI_GE'
          Width = 147
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPTION2'
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUAN_ORD'
          Width = 62
          Visible = True
        end
        item
          Expanded = False
          FieldName = #27424#36135#25968#37327
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tax_price'
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATE_TAX'
          Width = 38
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIT_NAME'
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DEL_DATE'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'rohs'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DEPT_NAME'
          Title.Caption = #35831#36141#37096#38376
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMPLOYEE_NAME'
          Title.Caption = #35831#36141#20154#21592
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'reason'
          Title.Caption = #35831#36141#21407#22240
          Width = 100
          Visible = True
        end>
    end
    object DBGrid2: TDBGrid
      Left = 0
      Top = 0
      Width = 1022
      Height = 170
      Hint = #32418#33394#23383#20307#20026#37325#35201#29289#26009
      Align = alClient
      DataSource = DataSource2
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid2DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'INV_NAME'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'INV_DESCRIPTION'
          Width = 145
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUAN_ORD'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = #27424#36135#25968#37327
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tax_price'
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TAX_2'
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIT_NAME'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pr_unitname'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REQ_DATE'
          Width = 76
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'avl_flag'
          Title.Caption = #38656#35201'IQC'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUAN_IN_INSP'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'rohs'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'extra_req'
          Width = 91
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'if_caf'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DEPT_NAME'
          Title.Caption = #35831#36141#37096#38376
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMPLOYEE_NAME'
          Title.Caption = #35831#36141#20154#21592
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'reason'
          Title.Caption = #35831#36141#21407#22240
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SHELF_LIFE'
          Title.Caption = #26377#25928#26399#22825#25968
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ORIG_ABBRNAME'
          Visible = True
        end>
    end
  end
  object DataSource1: TDataSource
    DataSet = AQ70
    OnDataChange = DataSource1DataChange
    Left = 384
    Top = 288
  end
  object ADO0071: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
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
      
        'SELECT dbo.Data0071.RKEY, dbo.Data0017.INV_NAME, dbo.Data0017.IN' +
        'V_DESCRIPTION, '
      
        '      dbo.Data0071.QUAN_ORD, Data0071.QUAN_RECD, dbo.Data0071.RE' +
        'Q_DATE, '
      
        '      dbo.Data0071.extra_req, dbo.Data0002.UNIT_NAME, dbo.Data00' +
        '71.WO_PTR, '
      
        '      dbo.Data0071.PURCHASE_UNIT_PTR, dbo.Data0071.TAX_2, data00' +
        '17.STOCK_BASE,'
      
        '      dbo.Data0071.CONVERSION_FACTOR, dbo.Data0071.INVT_PTR, dat' +
        'a0017.CRITICAL_MATL_FLAG,'
      
        '      dbo.Data0017.SHELF_LIFE, Data0002_1.UNIT_NAME AS pr_unitna' +
        'me, data0071.QUAN_IN_INSP,'
      
        '      Data0017.INV_PART_NUMBER, Data0071.tax_price, data0071.avl' +
        '_flag,data0071.if_caf,'
      
        '      dbo.Data0071.rohs,Data0071.QUAN_ORD-Data0071.QUAN_RECD as ' +
        #27424#36135#25968#37327', dbo.Data0005.EMPLOYEE_NAME, dbo.Data0034.DEPT_NAME, dbo.Da' +
        'ta0005.EMPL_CODE, '
      
        '       dbo.Data0034.DEPT_CODE,Data0071.reason,Data0071.ORIG_ABBR' +
        'NAME'
      'FROM dbo.Data0017 INNER JOIN'
      
        '      dbo.Data0071 ON dbo.Data0017.RKEY = dbo.Data0071.INVT_PTR ' +
        'INNER JOIN'
      '      dbo.Data0002 ON '
      
        '      dbo.Data0071.PURCHASE_UNIT_PTR = dbo.Data0002.RKEY INNER J' +
        'OIN'
      
        '      dbo.Data0002 Data0002_1 ON dbo.Data0071.WO_PTR = Data0002_' +
        '1.RKEY LEFT OUTER JOIN'
      '      dbo.Data0068 LEFT OUTER JOIN'
      
        '      dbo.Data0034 ON dbo.Data0068.DEPARTMENT_NAME = dbo.Data003' +
        '4.DEPT_CODE LEFT OUTER JOIN'
      
        '      dbo.Data0005 ON dbo.Data0068.REQ_BY = dbo.Data0005.RKEY RI' +
        'GHT OUTER JOIN'
      
        '      dbo.Data0069 ON dbo.Data0068.RKEY = dbo.Data0069.PURCH_REQ' +
        '_PTR ON dbo.Data0071.rkey69 = dbo.Data0069.RKEY'
      'where data0071.PO_ptr=:rkey')
    Left = 416
    Top = 350
    object ADO0071rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO0071inv_part_number: TStringField
      FieldName = 'inv_part_number'
      Size = 25
    end
    object ADO0071INVT_PTR: TIntegerField
      FieldName = 'INVT_PTR'
    end
    object ADO0071INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ADO0071INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      DisplayWidth = 30
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ADO0071recd_DATE: TDateTimeField
      DisplayLabel = #38656#27714#26085#26399
      FieldName = 'REQ_DATE'
    end
    object ADO0071extra_req: TStringField
      DisplayLabel = #29305#27530#35828#26126
      FieldName = 'extra_req'
      Size = 50
    end
    object ADO0071UNIT_NAME: TStringField
      DisplayLabel = #37319#36141#21333#20301
      DisplayWidth = 10
      FieldName = 'UNIT_NAME'
    end
    object ADO0071QUAN_RECD: TBCDField
      FieldName = 'QUAN_RECD'
      Precision = 9
      Size = 3
    end
    object ADO0071WO_PTR: TIntegerField
      FieldName = 'WO_PTR'
    end
    object ADO0071PURCHASE_UNIT_PTR: TIntegerField
      FieldName = 'PURCHASE_UNIT_PTR'
    end
    object ADO0071TAX_2: TBCDField
      DisplayLabel = #31246#29575'%'
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object ADO0071CONVERSION_FACTOR: TBCDField
      FieldName = 'CONVERSION_FACTOR'
      Precision = 7
      Size = 2
    end
    object ADO0071pr_unitname: TStringField
      DisplayLabel = #23384#36135#21333#20301
      DisplayWidth = 10
      FieldName = 'pr_unitname'
    end
    object ADO0071QUAN_ORD: TBCDField
      DisplayLabel = #35746#21333#25968#37327
      FieldName = 'QUAN_ORD'
      Precision = 9
      Size = 3
    end
    object ADO0071SHELF_LIFE: TSmallintField
      FieldName = 'SHELF_LIFE'
    end
    object ADO0071tax_price: TFloatField
      DisplayLabel = #21547#31246#20215
      FieldName = 'tax_price'
    end
    object ADO0071rohs: TStringField
      DisplayLabel = #29615#20445#26631#35782
      FieldName = 'rohs'
      Size = 10
    end
    object ADO0071DSDesigner: TFloatField
      FieldName = #27424#36135#25968#37327
      ReadOnly = True
    end
    object ADO0071avl_flag: TStringField
      FieldName = 'avl_flag'
      FixedChar = True
      Size = 1
    end
    object ADO0071STOCK_BASE: TFloatField
      FieldName = 'STOCK_BASE'
    end
    object ADO0071CRITICAL_MATL_FLAG: TWordField
      DisplayLabel = #37325#35201#29289#26009
      FieldName = 'CRITICAL_MATL_FLAG'
    end
    object ADO0071QUAN_IN_INSP: TFloatField
      DisplayLabel = #36890#36807#25968#37327
      FieldName = 'QUAN_IN_INSP'
    end
    object ADO0071if_caf: TWideStringField
      DisplayLabel = #32784'CAF'
      FieldName = 'if_caf'
      FixedChar = True
      Size = 2
    end
    object ADO0071EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADO0071DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADO0071EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object ADO0071DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADO0071reason: TStringField
      FieldName = 'reason'
      Size = 60
    end
    object ADO0071ORIG_ABBRNAME: TStringField
      DisplayLabel = #21697#29260#20379#24212#21830
      FieldName = 'ORIG_ABBRNAME'
      Size = 16
    end
  end
  object DataSource2: TDataSource
    DataSet = ADO0071
    Left = 385
    Top = 351
  end
  object AQ70: TADODataSet
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT Data0070.RKEY,Data0070.PO_TYPE,Data0070.PO_NUMBER,'#13#10'     ' +
      ' Data0070.CONFIRMATION_NUMBER, Data0070.PO_DATE,'#13#10'      Data0023' +
      '.CODE, Data0023.SUPPLIER_NAME,Data0023.ABBR_NAME AS abbr_suppnam' +
      'e,'#13#10'      Data0015.ABBR_NAME AS abbr_warename,Data0070.WAREHOUSE' +
      '_POINTER,'#13#10'      Data0015.WAREHOUSE_CODE,Data0015.WAREHOUSE_NAME' +
      ','#13#10'      Data0070.CURRENCY_PTR,Data0001.CURR_CODE, Data0001.CURR' +
      '_NAME,'#13#10'      Data0001.BASE_TO_OTHER as EXCHANGE_RATE, Data0034.' +
      'DEPT_NAME,'#13#10'      Data0070.SHIPTO_ADDRESS,Data0070.SUPPLIER_POIN' +
      'TER,Data0070.ANALYSIS_CODE_1,'#13#10'case Data0070.PO_TYPE when '#39'S'#39'  t' +
      'hen '#39#29983#20135#29289#26009#39#13#10'                                           when '#39'M'#39' ' +
      'then '#39#38750#29983#20135#29289#26009#39#13#10'end as v_type, Data0070.PURCHASE_TYPE'#13#10'FROM dbo.Da' +
      'ta0070 INNER JOIN'#13#10'      dbo.Data0023 ON '#13#10'      dbo.Data0070.SU' +
      'PPLIER_POINTER = dbo.Data0023.RKEY INNER JOIN'#13#10'      dbo.Data001' +
      '5 ON '#13#10'      dbo.Data0070.WAREHOUSE_POINTER = dbo.Data0015.RKEY ' +
      'INNER JOIN'#13#10'      dbo.Data0001 ON '#13#10'      dbo.Data0070.CURRENCY_' +
      'PTR = dbo.Data0001.RKEY LEFT OUTER JOIN'#13#10'      dbo.Data0034 ON d' +
      'bo.Data0070.PO_REV_NO = dbo.Data0034.DEPT_CODE'#13#10'WHERE (dbo.Data0' +
      '070.STATUS = 5)  and (STATE_INVT_TAX_FLAG='#39'N'#39') '
    IndexFieldNames = 'PO_NUMBER'
    Parameters = <>
    Left = 416
    Top = 288
    object AQ70RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AQ70PO_TYPE: TStringField
      FieldName = 'PO_TYPE'
      FixedChar = True
      Size = 1
    end
    object AQ70PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object AQ70CONFIRMATION_NUMBER: TStringField
      DisplayLabel = #26368#21518#23457#26680#20154
      FieldName = 'CONFIRMATION_NUMBER'
    end
    object AQ70PO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object AQ70CODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object AQ70SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object AQ70abbr_suppname: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      DisplayWidth = 16
      FieldName = 'abbr_suppname'
      Size = 16
    end
    object AQ70abbr_warename: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'abbr_warename'
      Size = 10
    end
    object AQ70WAREHOUSE_POINTER: TIntegerField
      FieldName = 'WAREHOUSE_POINTER'
    end
    object AQ70WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object AQ70WAREHOUSE_NAME: TStringField
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
    object AQ70CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object AQ70CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object AQ70CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object AQ70EXCHANGE_RATE: TFloatField
      FieldName = 'EXCHANGE_RATE'
    end
    object AQ70DEPT_NAME: TStringField
      DisplayLabel = #35831#36141#37096#38376
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object AQ70SHIPTO_ADDRESS: TStringField
      FieldName = 'SHIPTO_ADDRESS'
      Size = 50
    end
    object AQ70SUPPLIER_POINTER: TIntegerField
      FieldName = 'SUPPLIER_POINTER'
    end
    object AQ70v_type: TStringField
      DisplayLabel = #31867#22411
      FieldName = 'v_type'
      ReadOnly = True
      Size = 10
    end
    object AQ70PURCHASE_TYPE: TStringField
      FieldName = 'PURCHASE_TYPE'
      Size = 10
    end
    object AQ70ANALYSIS_CODE_1: TStringField
      FieldName = 'ANALYSIS_CODE_1'
    end
  end
  object aq0072: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
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
      'SELECT Data0072.DESCRIPTION,Data0072.GUI_GE,data0072.rkey,'
      
        '      Data0072.DESCRIPTION2,Data0072.QUAN_ORD,Data0072.tax_price' +
        ', '
      '      Data0072.STATE_TAX,Data0072.DEL_DATE,Data0072.rohs, '
      
        '      Data0072.UNIT_PTR,Data0002.UNIT_NAME,data0072.QUANTITY_REC' +
        'EIVED, data0072.avl_flag,'
      
        '      Data0072.QUAN_ORD - Data0072.QUANTITY_RECEIVED AS '#27424#36135#25968#37327', db' +
        'o.Data0034.DEPT_CODE, dbo.Data0034.DEPT_NAME, '
      
        '      dbo.Data0005.EMPL_CODE, dbo.Data0005.EMPLOYEE_NAME,data007' +
        '2.reason'
      'FROM dbo.Data0072 INNER JOIN'
      
        '      dbo.Data0002 ON dbo.Data0072.UNIT_PTR = dbo.Data0002.RKEY ' +
        'LEFT OUTER JOIN'
      '      dbo.Data0068 LEFT OUTER JOIN'
      
        '      dbo.Data0034 ON dbo.Data0068.DEPARTMENT_NAME = dbo.Data003' +
        '4.DEPT_CODE LEFT OUTER JOIN'
      
        '      dbo.Data0005 ON dbo.Data0068.REQ_BY = dbo.Data0005.RKEY RI' +
        'GHT OUTER JOIN'
      
        '      dbo.Data0204 ON dbo.Data0068.RKEY = dbo.Data0204.PURCHASE_' +
        'REQ_PTR ON dbo.Data0072.rkey204 = dbo.Data0204.RKEY'
      'where data0072.poptr=:rkey')
    Left = 416
    Top = 400
    object aq0072DESCRIPTION: TStringField
      DisplayLabel = #29289#21697#21517#31216
      FieldName = 'DESCRIPTION'
      Size = 60
    end
    object aq0072GUI_GE: TStringField
      DisplayLabel = #29289#21697#35268#26684
      FieldName = 'GUI_GE'
      Size = 200
    end
    object aq0072DESCRIPTION2: TStringField
      DisplayLabel = #29289#21697#31867#21035
      FieldName = 'DESCRIPTION2'
      FixedChar = True
    end
    object aq0072QUAN_ORD: TFloatField
      DisplayLabel = #37319#36141#25968#37327
      FieldName = 'QUAN_ORD'
    end
    object aq0072tax_price: TFloatField
      DisplayLabel = #21547#31246#21333#20215
      FieldName = 'tax_price'
    end
    object aq0072STATE_TAX: TBCDField
      DisplayLabel = #31246#29575'%'
      FieldName = 'STATE_TAX'
      Precision = 4
      Size = 2
    end
    object aq0072DEL_DATE: TDateTimeField
      DisplayLabel = #38656#27714#26085#26399
      FieldName = 'DEL_DATE'
    end
    object aq0072rohs: TStringField
      DisplayLabel = #29615#20445#26631#35782
      FieldName = 'rohs'
      Size = 10
    end
    object aq0072UNIT_PTR: TIntegerField
      FieldName = 'UNIT_PTR'
    end
    object aq0072UNIT_NAME: TStringField
      DisplayLabel = #37319#36141#21333#20301
      FieldName = 'UNIT_NAME'
    end
    object aq0072DSDesigner: TFloatField
      FieldName = #27424#36135#25968#37327
      ReadOnly = True
    end
    object aq0072QUANTITY_RECEIVED: TFloatField
      FieldName = 'QUANTITY_RECEIVED'
    end
    object aq0072rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object aq0072DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object aq0072DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object aq0072EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object aq0072EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object aq0072reason: TStringField
      FieldName = 'reason'
      Size = 60
    end
    object aq0072avl_flag: TStringField
      FieldName = 'avl_flag'
      FixedChar = True
      Size = 1
    end
  end
  object DataSource3: TDataSource
    DataSet = aq0072
    Left = 384
    Top = 400
  end
end
