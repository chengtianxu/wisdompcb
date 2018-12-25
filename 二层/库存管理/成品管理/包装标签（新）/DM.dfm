object DM1: TDM1
  OldCreateOrder = False
  Left = 396
  Top = 239
  Height = 360
  Width = 439
  object con1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 24
  end
  object adsFrmMain: TADODataSet
    Connection = con1
    CursorType = ctStatic
    CommandText = 
      'SELECT     dbo.DATA0698.*,data0005.employee_name,data0025.packsi' +
      'ze,'#13#10'                 dbo.Data0025.MANU_PART_NUMBER, dbo.Data002' +
      '5.MANU_PART_DESC, '#13#10'                 dbo.Data0025.ANALYSIS_CODE_' +
      '2, dbo.Data0097.PO_NUMBER,                '#13#10'                dbo.' +
      'Data0060.SALES_ORDER, dbo.Data0060.REPUT_QTY,'#13#10' dbo.Data0060.PAR' +
      'TS_ORDERED,dbo.Data0060.RKey AS RKey60,'#13#10'               dbo.Data' +
      '0010.CUST_CODE, dbo.Data0010.ABBR_NAME,data0025.set_qty,'#13#10'data00' +
      '25.CURRENT_REV,data0025.ORIG_CUSTOMER'#13#10'FROM         dbo.DATA0698' +
      ' INNER JOIN'#13#10'                      dbo.Data0005 ON dbo.DATA0698.' +
      'empl_ptr = dbo.Data0005.RKEY INNER JOIN'#13#10'                      d' +
      'bo.Data0060 ON dbo.DATA0698.so_ptr = dbo.Data0060.RKEY INNER JOI' +
      'N'#13#10'                      dbo.Data0025 ON dbo.Data0060.CUST_PART_' +
      'PTR = dbo.Data0025.RKEY INNER JOIN'#13#10'                      dbo.Da' +
      'ta0097 ON dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY IN' +
      'NER JOIN'#13#10'                      dbo.Data0010 ON dbo.Data0060.CUS' +
      'TOMER_PTR = dbo.Data0010.RKEY'#13#10
    Parameters = <>
    Left = 80
    Top = 24
    object atncfldFrmMainrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object strngfldFrmMainpack_number: TStringField
      FieldName = 'pack_number'
      Size = 10
    end
    object intgrfldFrmMainso_ptr: TIntegerField
      FieldName = 'so_ptr'
    end
    object strngfldFrmMaindescription: TStringField
      FieldName = 'description'
      Size = 50
    end
    object strngfldFrmMaincode: TStringField
      FieldName = 'code'
      Size = 15
    end
    object intgrfldFrmMainqty: TIntegerField
      FieldName = 'qty'
    end
    object strngfldFrmMainlotno: TStringField
      FieldName = 'lotno'
      Size = 50
    end
    object strngfldFrmMainnotes: TStringField
      FieldName = 'notes'
      Size = 50
    end
    object adsFrmMainv_print: TBooleanField
      FieldName = 'v_print'
    end
    object dtmfldFrmMainv_date: TDateTimeField
      FieldName = 'v_date'
    end
    object intgrfldFrmMainempl_ptr: TIntegerField
      FieldName = 'empl_ptr'
    end
    object intgrfldFrmMainpack_item: TIntegerField
      FieldName = 'pack_item'
    end
    object strngfldFrmMaintype: TStringField
      FieldName = 'type'
      Size = 4
    end
    object strngfldFrmMainsurface: TStringField
      FieldName = 'surface'
      Size = 30
    end
    object strngfldFrmMainnetWeight: TStringField
      FieldName = 'netWeight'
      Size = 15
    end
    object strngfldFrmMaingrossWeight: TStringField
      FieldName = 'grossWeight'
      Size = 15
    end
    object strngfldFrmMaincaseSpec: TStringField
      FieldName = 'caseSpec'
      Size = 30
    end
    object strngfldFrmMainemployee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object strngfldFrmMainMANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object strngfldFrmMainMANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object strngfldFrmMainANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      Size = 80
    end
    object strngfldFrmMainPO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object strngfldFrmMainSALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object intgrfldFrmMainREPUT_QTY: TIntegerField
      FieldName = 'REPUT_QTY'
    end
    object fltfldFrmMainPARTS_ORDERED: TFloatField
      FieldName = 'PARTS_ORDERED'
    end
    object atncfldFrmMainRKey60: TAutoIncField
      FieldName = 'RKey60'
      ReadOnly = True
    end
    object strngfldFrmMainCUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object strngfldFrmMainABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object intgrfldFrmMainset_qty: TIntegerField
      FieldName = 'set_qty'
    end
    object strngfldFrmMainCURRENT_REV: TStringField
      FieldName = 'CURRENT_REV'
      FixedChar = True
      Size = 1
    end
    object strngfldFrmMainORIG_CUSTOMER: TStringField
      FieldName = 'ORIG_CUSTOMER'
      Size = 10
    end
    object adsFrmMainpacksize: TStringField
      FieldName = 'packsize'
      Size = 500
    end
    object adsFrmMainflag: TBooleanField
      FieldName = 'flag'
    end
  end
  object qrytmp: TADOQuery
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    Left = 80
    Top = 80
  end
  object ppPrint: TppReport
    AutoStop = False
    DataPipeline = pdbReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 0
    PrinterSetup.mmMarginLeft = 0
    PrinterSetup.mmMarginRight = 0
    PrinterSetup.mmMarginTop = 0
    PrinterSetup.mmPaperHeight = 100000
    PrinterSetup.mmPaperWidth = 85000
    PrinterSetup.PaperSize = 256
    Template.FileName = 
      'F:\WZ\WZ_Svn\'#31243#24207#20195#30721'\'#20108#23618'ERP\'#24211#23384#31649#29702'\'#25104#21697#31649#29702'\'#21253#35013#26631#31614#65288#26032#65289'\Report\WZPR0698\DG\DG1' +
      '915I.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 320
    Top = 202
    Version = '7.01'
    mmColumnWidth = 195000
    DataPipelineName = 'pdbReport'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      ColumnTraversal = ctLeftToRight
      mmBottomOffset = 1000
      mmHeight = 86254
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label4'
        Caption = #20116#26666#31185#25216#32929#20221#26377#38480#20844#21496
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #40657#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 29369
        mmTop = 38100
        mmWidth = 35560
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = #25209#27425
        DataPipeline = pdbReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #40657#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pdbReport'
        mmHeight = 4064
        mmLeft = 29369
        mmTop = 29369
        mmWidth = 7112
        BandType = 4
      end
      object ppLabel4: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = #23458#25143#21517#31216#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #40657#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 9260
        mmTop = 3175
        mmWidth = 19500
        BandType = 4
      end
      object ppLabel21: TppLabel
        UserName = 'Label24'
        AutoSize = False
        Caption = #36135#29289#21517#31216#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #40657#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 9260
        mmTop = 7673
        mmWidth = 19500
        BandType = 4
      end
      object ppLabel24: TppLabel
        UserName = 'Label25'
        AutoSize = False
        Caption = #21326#20026#32534#21495#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #40657#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 9260
        mmTop = 11906
        mmWidth = 19500
        BandType = 4
      end
      object ppLabel25: TppLabel
        UserName = 'Label26'
        AutoSize = False
        Caption = #25968'    '#37327#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #40657#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 9260
        mmTop = 16140
        mmWidth = 19500
        BandType = 4
      end
      object ppLabel26: TppLabel
        UserName = 'Label27'
        AutoSize = False
        Caption = #23458#25143#22411#21495#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #40657#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 9260
        mmTop = 20638
        mmWidth = 19500
        BandType = 4
      end
      object ppLabel27: TppLabel
        UserName = 'Label28'
        AutoSize = False
        Caption = #21378#23478#22411#21495#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #40657#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 9260
        mmTop = 25135
        mmWidth = 19500
        BandType = 4
      end
      object ppLabel28: TppLabel
        UserName = 'Label29'
        AutoSize = False
        Caption = #29983#20135#21608#26399#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #40657#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 9260
        mmTop = 29369
        mmWidth = 19500
        BandType = 4
      end
      object ppLabel29: TppLabel
        UserName = 'Label30'
        AutoSize = False
        Caption = 'LOT'#21495'   '#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #40657#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 9525
        mmTop = 33602
        mmWidth = 19579
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = #26412#21378#32534#21495
        DataPipeline = pdbReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #40657#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pdbReport'
        mmHeight = 4064
        mmLeft = 29369
        mmTop = 25400
        mmWidth = 17780
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = #23458#25143#22411#21495
        DataPipeline = pdbReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #40657#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pdbReport'
        mmHeight = 4064
        mmLeft = 29369
        mmTop = 12171
        mmWidth = 14224
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'PCS'#25968#37327
        DataPipeline = pdbReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #40657#20307
        Font.Size = 10
        Font.Style = [fsUnderline]
        Transparent = True
        DataPipelineName = 'pdbReport'
        mmHeight = 4064
        mmLeft = 29369
        mmTop = 16140
        mmWidth = 1778
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = #23458#25143#29289#26009#21495
        DataPipeline = pdbReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #40657#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pdbReport'
        mmHeight = 4064
        mmLeft = 29369
        mmTop = 20638
        mmWidth = 24892
        BandType = 4
      end
      object ppLabel30: TppLabel
        UserName = 'Label1'
        Caption = 'PCS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #40657#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 42069
        mmTop = 16140
        mmWidth = 5334
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText37'
        AutoSize = True
        DataField = #31665#21495
        DataPipeline = pdbReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #40657#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pdbReport'
        mmHeight = 4064
        mmLeft = 29633
        mmTop = 33602
        mmWidth = 12446
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText49'
        AutoSize = True
        DataField = #23458#25143#21517#31216
        DataPipeline = pdbReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #40657#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pdbReport'
        mmHeight = 4064
        mmLeft = 29369
        mmTop = 3175
        mmWidth = 28448
        BandType = 4
      end
      object ppDBText37: TppDBText
        UserName = 'DBText40'
        AutoSize = True
        DataField = #20135#21697#25551#36848
        DataPipeline = pdbReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #40657#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pdbReport'
        mmHeight = 4064
        mmLeft = 29369
        mmTop = 7673
        mmWidth = 10668
        BandType = 4
      end
      object ppLabel31: TppLabel
        UserName = 'Label67'
        AutoSize = False
        Caption = #20135'    '#22320#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #40657#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 9260
        mmTop = 47096
        mmWidth = 19500
        BandType = 4
      end
      object ppLabel72: TppLabel
        UserName = 'Label68'
        AutoSize = False
        Caption = #20379#24212#21830#20195#30721#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #40657#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 9260
        mmTop = 42598
        mmWidth = 23368
        BandType = 4
      end
      object ppDBText40: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = #23458#20379#20195#30721
        DataPipeline = pdbReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #40657#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pdbReport'
        mmHeight = 4064
        mmLeft = 33602
        mmTop = 42598
        mmWidth = 10668
        BandType = 4
      end
      object ppDBBarCode1: TppDBBarCode
        UserName = 'DBBarCode3'
        AutoEncode = True
        AutoSizeFont = False
        BarCodeType = bcCode128
        BarColor = clWindowText
        CalcCheckDigit = False
        DataField = 'P'#23458#25143#22411#21495
        DataPipeline = pdbReport
        PrintHumanReadable = False
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pdbReport'
        mmHeight = 3175
        mmLeft = 50536
        mmTop = 12171
        mmWidth = 28800
        BandType = 4
        mmBarWidth = 168
        mmWideBarRatio = 50800
      end
      object ppDBBarCode24: TppDBBarCode
        UserName = 'DBBarCode9'
        AutoEncode = True
        AutoSizeFont = False
        BarCodeType = bcCode128
        BarColor = clWindowText
        CalcCheckDigit = False
        DataField = 'QPCS'#25968#37327
        DataPipeline = pdbReport
        PrintHumanReadable = False
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pdbReport'
        mmHeight = 3440
        mmLeft = 50536
        mmTop = 16669
        mmWidth = 28840
        BandType = 4
        mmBarWidth = 168
        mmWideBarRatio = 50800
      end
      object ppDBBarCode26: TppDBBarCode
        UserName = 'DBBarCode101'
        AutoEncode = True
        AutoSizeFont = False
        BarCodeType = bcCode128
        BarColor = clWindowText
        CalcCheckDigit = False
        DataField = '9D'#21608#26399
        DataPipeline = pdbReport
        PrintHumanReadable = False
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pdbReport'
        mmHeight = 3969
        mmLeft = 43656
        mmTop = 29369
        mmWidth = 28800
        BandType = 4
        mmBarWidth = 168
        mmWideBarRatio = 50800
      end
      object ppDBBarCode27: TppDBBarCode
        UserName = 'DBBarCode12'
        AutoEncode = True
        AutoSizeFont = False
        BarCodeType = bcCode128
        BarColor = clWindowText
        CalcCheckDigit = False
        DataField = '1TLotNo'
        DataPipeline = pdbReport
        PrintHumanReadable = False
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pdbReport'
        mmHeight = 3704
        mmLeft = 43656
        mmTop = 33867
        mmWidth = 28800
        BandType = 4
        mmBarWidth = 168
        mmWideBarRatio = 50800
      end
      object ppDBBarCode28: TppDBBarCode
        UserName = 'DBBarCode13'
        AutoEncode = True
        AutoSizeFont = False
        BarCodeType = bcCode128
        BarColor = clWindowText
        CalcCheckDigit = False
        DataField = 'V'#23458#20379#20195#30721
        DataPipeline = pdbReport
        PrintHumanReadable = False
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pdbReport'
        mmHeight = 4233
        mmLeft = 50271
        mmTop = 42333
        mmWidth = 28840
        BandType = 4
        mmBarWidth = 168
        mmWideBarRatio = 50800
      end
      object ppDBBarCode29: TppDBBarCode
        UserName = 'DBBarCode19'
        AutoEncode = True
        AutoSizeFont = False
        BarCodeType = bcCode128
        BarColor = clWindowText
        CalcCheckDigit = False
        DataField = 'psn'
        DataPipeline = pdbReport
        Alignment = taCenter
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        DataPipelineName = 'pdbReport'
        mmHeight = 6879
        mmLeft = 9790
        mmTop = 60325
        mmWidth = 56356
        BandType = 4
        mmBarWidth = 168
        mmWideBarRatio = 76200
      end
      object ppLabel93: TppLabel
        UserName = 'Label20'
        AutoSize = False
        Caption = '(PSN)Package S/N'#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #40657#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 9260
        mmTop = 56092
        mmWidth = 38365
        BandType = 4
      end
      object ppLabel108: TppLabel
        UserName = 'Label105'
        Caption = #22791#27880#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #40657#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 8731
        mmTop = 68263
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText49: TppDBText
        UserName = 'DBText89'
        DataField = #22791#27880
        DataPipeline = pdbReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #40657#20307
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'pdbReport'
        mmHeight = 12700
        mmLeft = 7938
        mmTop = 72496
        mmWidth = 37306
        BandType = 4
      end
      object lbl1: TppLabel
        UserName = 'lbl1'
        Caption = #20013#22269' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #40657#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 29369
        mmTop = 47361
        mmWidth = 8890
        BandType = 4
      end
      object lbl2: TppLabel
        UserName = 'lbl2'
        Caption = #20379#24212#21830'  '#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #40657#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 9260
        mmTop = 38100
        mmWidth = 17780
        BandType = 4
      end
      object lbl3: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = #21019#24314#26085#26399
        DataPipeline = pdbReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #40657#20307
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pdbReport'
        mmHeight = 3217
        mmLeft = 55563
        mmTop = 47890
        mmWidth = 14393
        BandType = 4
      end
      object ppDBBarCode30: TppDBBarCode
        UserName = 'DBBarCode30'
        AutoEncode = True
        AutoSizeFont = False
        BarCodeType = bcCode128
        BarColor = clWindowText
        CalcCheckDigit = False
        DataField = #21807#19968#26631#35782
        DataPipeline = pdbReport
        PrintHumanReadable = False
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pdbReport'
        mmHeight = 3175
        mmLeft = 43921
        mmTop = 7408
        mmWidth = 17103
        BandType = 4
        mmBarWidth = 168
        mmWideBarRatio = 50800
      end
      object ppImage1: TppImage
        UserName = 'Image1'
        AutoSize = True
        MaintainAspectRatio = False
        mmHeight = 17463
        mmLeft = 47890
        mmTop = 66146
        mmWidth = 19050
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = #21807#19968#26631#35782
        DataPipeline = pdbReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pdbReport'
        mmHeight = 3006
        mmLeft = 62706
        mmTop = 7938
        mmWidth = 17198
        BandType = 4
      end
      object ppLabel2: TppLabel
        UserName = 'Label201'
        AutoSize = False
        Caption = '(25B)X Board'#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #40657#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 9260
        mmTop = 51858
        mmWidth = 19579
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = 'xBrode'
        DataPipeline = pdbReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #40657#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pdbReport'
        mmHeight = 3979
        mmLeft = 30692
        mmTop = 51858
        mmWidth = 10583
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
  end
  object adsReport: TADODataSet
    Connection = con1
    CursorType = ctStatic
    OnCalcFields = adsReportCalcFields
    CommandText = 
      'SELECT '#13#10'D699.order_no as '#24207#21495','#13#10'd699.LotOrder,'#13#10'D10.customer_name' +
      ' as '#23458#25143#21517#31216','#13#10'D699.MANU_PART_NUMBER as '#26412#21378#32534#21495','#13#10'D699.MANU_PART_DESC a' +
      's '#23458#25143#22411#21495','#13#10'D699.PO_NUMBER as '#23458#25143#35746#21333#21495','#13#10'D699.ANALYSIS_CODE_2 as '#23458#25143#29289#26009#21495 +
      ','#13#10#39'P'#39' + D699.ANALYSIS_CODE_2 as P'#23458#25143#29289#26009#21495','#13#10#39'Q'#39' + cast(D699.qty as' +
      ' varchar(20)) as QPCS'#25968#37327','#13#10#39'M'#39' + D699.MANU_PART_NUMBER as M'#26412#21378#32534#21495','#13 +
      #10#39'M'#39' + LEFT(D699.MANU_PART_NUMBER,len(D699.MANU_PART_NUMBER)-1) ' +
      'as M'#26412#21378#32534#21495'_1,'#13#10'LEFT(D699.MANU_PART_NUMBER,len(D699.MANU_PART_NUMBE' +
      'R)-1) as M'#26412#21378#32534#21495'_2,'#13#10#39'D'#39' + D699.lotno as D'#25209#27425','#13#10#39'L'#39' + D698.surface ' +
      'as L'#34920#38754#22788#29702','#13#10#39'S'#39' + D699.barcode_id as S'#26465#24418#30721','#13#10'D699.qty as PCS'#25968#37327','#13#10'D' +
      '699.code as '#23458#20379#20195#30721','#13#10'D699.lotno as '#25209#27425','#13#10'D699.barcode_id as '#26465#24418#30721','#13#10'D' +
      '699.description as '#20135#21697#25551#36848','#13#10'D699.notes as '#22791#27880','#13#10'D699.caseNo as '#31665#21495','#13 +
      #10'D699.param1 AS '#38468#21152#21442#25968'1,'#13#10'd699.param1,'#13#10'd699.xBrode,'#13#10'd699.psn,'#13#10'(' +
      'convert(varchar(10),getdate(),120)) AS '#21019#24314#26085#26399','#13#10'D698.surface as '#34920#38754 +
      #22788#29702','#13#10'd698.flag as flag698,'#13#10'D698.netweight as '#20928#37325','#13#10'D698.grosswei' +
      'ght as '#27611#37325','#13#10'D698.caseSpec as '#32440#31665#35268#26684','#13#10'D698.notes AS '#22791#27880'698,'#13#10'd699.p' +
      'aram2,'#13#10'd25.CURRENT_REV,'#13#10'd25.manu_part_number,'#13#10'd25.ANALYSIS_CO' +
      'DE_2,'#13#10'cast(D699.pack_ptr as varchar(20)) + '#39'-'#39' + cast(D699.orde' +
      'r_no as varchar(10)) AS '#21807#19968#26631#35782','#13#10'D15.WAREHOUSE_CODE AS '#24037#21378#20195#30721','#13#10'D15.' +
      'WAREHOUSE_NAME AS '#24037#21378#20013#25991#21517','#13#10'D15.ENG_NAME AS '#24037#21378#33521#25991#21517','#13#10'D15.ADDRESS_LI' +
      'NE_1 AS '#24037#21378#22320#22336','#13#10'(select count(pack_ptr) from data0699 where pack_' +
      'ptr = d698.rkey) as '#24635#31665#25968','#13#10'D25.set_qty as PCS'#27599'SETS,'#13#10'd25.ANALYSIS' +
      '_CODE_5 as PCS'#21333#21482#23610#23544','#13#10'D12.SHIP_TO_ADDRESS_1 AS '#36135#36816#30446#30340#22320','#13#10'd60.SALES_' +
      'ORDER,'#13#10'getdate() as '#28023#24605#19987#29992'_DN,'#13#10'CASE WHEN CHARINDEX('#39'-'#39',D699.PO_N' +
      'UMBER) > 0 THEN LEFT(D699.PO_NUMBER,CHARINDEX('#39'-'#39',D699.PO_NUMBER' +
      ')-1) WHEN CHARINDEX('#39'-'#39',D699.PO_NUMBER) = 0 THEN D699.PO_NUMBER ' +
      'END AS '#28023#24605#19987#29992'_'#35746#21333#22836','#13#10'CASE WHEN CHARINDEX('#39'-'#39',D699.PO_NUMBER) > 0 TH' +
      'EN RIGHT(D699.PO_NUMBER,LEN(D699.PO_NUMBER)-CHARINDEX('#39'-'#39',D699.P' +
      'O_NUMBER)) WHEN CHARINDEX('#39'-'#39',D699.PO_NUMBER) = 0 THEN RIGHT(D69' +
      '9.PO_NUMBER,1) END AS '#28023#24605#19987#29992'_'#35746#21333#23614','#13#10'CAST(D699.lotno AS VARCHAR) + '#39 +
      ':'#39' + CAST(D699.qty AS VARCHAR) AS '#28023#24605#19987#29992'_'#21608#26399#25968#37327','#13#10'CAST(D699.order_no' +
      ' AS VARCHAR) + '#39'/'#39' + (SELECT CAST(COUNT(*) AS VARCHAR) FROM Data' +
      '0699 WHERE data0699.pack_ptr = D698.RKey) AS '#28023#24605#19987#29992'_'#31665#21495','#13#10#13#10'(D699.l' +
      'otno+'#39'-'#39'+D699.MANU_PART_NUMBER) as '#21451#35759#26412#21378#32534#21495#13#10#13#10'FROM Data0698 D698 ' +
      #13#10'INNER JOIN Data0699 D699 ON D699.pack_Ptr = D698.RKey'#13#10'INNER J' +
      'OIN Data0060 D60 ON D698.so_ptr = D60.Rkey'#13#10'INNER JOIN Data0010 ' +
      'D10 ON D60.CUSTOMER_PTR = D10.RKey'#13#10'INNER JOIN Data0025 D25 ON D' +
      '25.MANU_PART_NUMBER = D699.MANU_PART_NUMBER'#13#10'INNER JOIN Data0015' +
      ' D15 ON D60.SHIP_REG_TAX_ID = D15.RKey'#13#10'INNER JOIN Data0012 D12 ' +
      'ON D60.CUST_SHIP_ADDR_PTR = D12.RKey'#13#10'Where D698.Rkey = :param1'#13 +
      #10
    Parameters = <
      item
        Name = 'param1'
        Size = -1
        Value = Null
      end>
    Left = 24
    Top = 179
    object adsReportDSDesigner: TSmallintField
      FieldName = #24207#21495
    end
    object adsReportDSDesigner2: TStringField
      FieldName = #23458#25143#21517#31216
      Size = 100
    end
    object adsReportDSDesigner3: TStringField
      FieldName = #26412#21378#32534#21495
    end
    object adsReportDSDesigner4: TStringField
      FieldName = #23458#25143#22411#21495
      Size = 40
    end
    object adsReportDSDesigner5: TStringField
      FieldName = #23458#25143#35746#21333#21495
      Size = 25
    end
    object adsReportDSDesigner6: TStringField
      FieldName = #23458#25143#29289#26009#21495
      Size = 50
    end
    object adsReportPCS: TIntegerField
      FieldName = 'PCS'#25968#37327
    end
    object adsReportDSDesigner7: TStringField
      FieldName = #23458#20379#20195#30721
      Size = 15
    end
    object adsReportDSDesigner8: TStringField
      FieldName = #25209#27425
      Size = 50
    end
    object adsReportDSDesigner9: TStringField
      FieldName = #26465#24418#30721
      Size = 80
    end
    object adsReportDSDesigner10: TStringField
      FieldName = #20135#21697#25551#36848
      Size = 50
    end
    object adsReportDSDesigner11: TStringField
      FieldName = #22791#27880
      Size = 50
    end
    object adsReportDSDesigner12: TStringField
      FieldName = #31665#21495
      Size = 7
    end
    object adsReportDSDesigner13: TStringField
      FieldName = #21019#24314#26085#26399
      ReadOnly = True
      Size = 10
    end
    object adsReportDSDesigner14: TStringField
      FieldName = #34920#38754#22788#29702
      Size = 30
    end
    object adsReportDSDesigner15: TStringField
      FieldName = #20928#37325
      Size = 15
    end
    object adsReportDSDesigner16: TStringField
      FieldName = #27611#37325
      Size = 15
    end
    object adsReportDSDesigner17: TStringField
      FieldName = #32440#31665#35268#26684
      Size = 30
    end
    object adsReportDSDesigner698: TStringField
      FieldName = #22791#27880'698'
      Size = 50
    end
    object adsReportDSDesigner18: TStringField
      FieldName = #21807#19968#26631#35782
      ReadOnly = True
      Size = 31
    end
    object adsReportDSDesigner19: TStringField
      FieldName = #24037#21378#20195#30721
      Size = 5
    end
    object adsReportDSDesigner20: TStringField
      FieldName = #24037#21378#20013#25991#21517
      Size = 70
    end
    object adsReportDSDesigner21: TStringField
      FieldName = #24037#21378#33521#25991#21517
      Size = 70
    end
    object adsReportDSDesigner22: TStringField
      FieldName = #24037#21378#22320#22336
      Size = 70
    end
    object adsReportPCSSETS: TIntegerField
      FieldName = 'PCS'#27599'SETS'
    end
    object adsReportDSDesigner23: TStringField
      FieldName = #36135#36816#30446#30340#22320
      Size = 100
    end
    object adsReport_DN: TDateTimeField
      FieldName = #28023#24605#19987#29992'_DN'
      ReadOnly = True
    end
    object adsReport_: TStringField
      FieldName = #28023#24605#19987#29992'_'#35746#21333#22836
      ReadOnly = True
      Size = 25
    end
    object adsReport_2: TStringField
      FieldName = #28023#24605#19987#29992'_'#35746#21333#23614
      ReadOnly = True
      Size = 25
    end
    object adsReport_3: TStringField
      FieldName = #28023#24605#19987#29992'_'#21608#26399#25968#37327
      ReadOnly = True
      Size = 61
    end
    object adsReport_4: TStringField
      FieldName = #28023#24605#19987#29992'_'#31665#21495
      ReadOnly = True
      Size = 61
    end
    object adsReportDSDesigner24: TStringField
      FieldName = #21451#35759#26412#21378#32534#21495
      ReadOnly = True
      Size = 31
    end
    object strngfldReportDSDesigner1: TStringField
      FieldName = #38468#21152#21442#25968'1'
      Size = 80
    end
    object adsReportDSDesigner25: TIntegerField
      FieldName = #24635#31665#25968
      ReadOnly = True
    end
    object adsReportPCS2: TStringField
      FieldName = 'PCS'#21333#21482#23610#23544
      Size = 30
    end
    object adsReportCURRENT_REV: TStringField
      FieldName = 'CURRENT_REV'
      FixedChar = True
      Size = 1
    end
    object adsReportmanu_part_number: TStringField
      FieldName = 'manu_part_number'
    end
    object adsReportANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      Size = 80
    end
    object adsReportparam1: TStringField
      FieldName = 'param1'
      Size = 80
    end
    object adsReportCut_no: TStringField
      FieldKind = fkCalculated
      FieldName = 'Cut_NO'
      Calculated = True
    end
    object adsReportCut_NO_Head: TStringField
      FieldKind = fkCalculated
      FieldName = 'Cut_NO_Head'
      Calculated = True
    end
    object adsReportSALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object adsReportparam2: TStringField
      FieldName = 'param2'
      Size = 150
    end
    object adsReportflag698: TBooleanField
      FieldName = 'flag698'
    end
    object strngfldReportP: TStringField
      FieldName = 'P'#23458#25143#29289#26009#21495
      ReadOnly = True
      Size = 51
    end
    object strngfldReportQPCS: TStringField
      FieldName = 'QPCS'#25968#37327
      ReadOnly = True
      Size = 21
    end
    object strngfldReportM: TStringField
      FieldName = 'M'#26412#21378#32534#21495
      ReadOnly = True
      Size = 21
    end
    object strngfldReportD: TStringField
      FieldName = 'D'#25209#27425
      ReadOnly = True
      Size = 11
    end
    object strngfldReportL: TStringField
      FieldName = 'L'#34920#38754#22788#29702
      ReadOnly = True
      Size = 31
    end
    object strngfldReportS: TStringField
      FieldName = 'S'#26465#24418#30721
      ReadOnly = True
      Size = 81
    end
    object strngfldReportM_1: TStringField
      FieldName = 'M'#26412#21378#32534#21495'_1'
      ReadOnly = True
      Size = 22
    end
    object strngfldReportM_3: TStringField
      FieldName = 'M'#26412#21378#32534#21495'_2'
      ReadOnly = True
      Size = 21
    end
    object strngfldReportLotOrder: TStringField
      FieldName = 'LotOrder'
      Size = 128
    end
    object adsReportxBrode: TIntegerField
      FieldName = 'xBrode'
    end
    object adsReportpsn: TStringField
      FieldName = 'psn'
      Size = 50
    end
  end
  object dsReport: TDataSource
    DataSet = cdsReport
    Left = 224
    Top = 202
  end
  object pdbReport: TppDBPipeline
    DataSource = dsReport
    UserName = 'pdbReport'
    OnNext = pdbReportNext
    Left = 272
    Top = 202
    object pdbReportppField1: TppField
      Alignment = taRightJustify
      FieldAlias = #24207#21495
      FieldName = #24207#21495
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 0
    end
    object pdbReportppField2: TppField
      FieldAlias = #23458#25143#21517#31216
      FieldName = #23458#25143#21517#31216
      FieldLength = 100
      DisplayWidth = 100
      Position = 1
    end
    object pdbReportppField3: TppField
      FieldAlias = #26412#21378#32534#21495
      FieldName = #26412#21378#32534#21495
      FieldLength = 20
      DisplayWidth = 20
      Position = 2
    end
    object pdbReportppField4: TppField
      FieldAlias = #23458#25143#22411#21495
      FieldName = #23458#25143#22411#21495
      FieldLength = 40
      DisplayWidth = 40
      Position = 3
    end
    object pdbReportppField5: TppField
      FieldAlias = #23458#25143#35746#21333#21495
      FieldName = #23458#25143#35746#21333#21495
      FieldLength = 25
      DisplayWidth = 25
      Position = 4
    end
    object pdbReportppField6: TppField
      FieldAlias = #23458#25143#29289#26009#21495
      FieldName = #23458#25143#29289#26009#21495
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object pdbReportppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'PCS'#25968#37327
      FieldName = 'PCS'#25968#37327
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 6
    end
    object pdbReportppField8: TppField
      FieldAlias = #23458#20379#20195#30721
      FieldName = #23458#20379#20195#30721
      FieldLength = 15
      DisplayWidth = 15
      Position = 7
    end
    object pdbReportppField9: TppField
      FieldAlias = #25209#27425
      FieldName = #25209#27425
      FieldLength = 50
      DisplayWidth = 50
      Position = 8
    end
    object pdbReportppField10: TppField
      FieldAlias = #26465#24418#30721
      FieldName = #26465#24418#30721
      FieldLength = 80
      DisplayWidth = 80
      Position = 9
    end
    object pdbReportppField11: TppField
      FieldAlias = #20135#21697#25551#36848
      FieldName = #20135#21697#25551#36848
      FieldLength = 50
      DisplayWidth = 50
      Position = 10
    end
    object pdbReportppField12: TppField
      FieldAlias = #22791#27880
      FieldName = #22791#27880
      FieldLength = 50
      DisplayWidth = 50
      Position = 11
    end
    object pdbReportppField13: TppField
      FieldAlias = #31665#21495
      FieldName = #31665#21495
      FieldLength = 7
      DisplayWidth = 7
      Position = 12
    end
    object pdbReportppField14: TppField
      FieldAlias = #21019#24314#26085#26399
      FieldName = #21019#24314#26085#26399
      FieldLength = 10
      DisplayWidth = 10
      Position = 13
    end
    object pdbReportppField15: TppField
      FieldAlias = #34920#38754#22788#29702
      FieldName = #34920#38754#22788#29702
      FieldLength = 30
      DisplayWidth = 30
      Position = 14
    end
    object pdbReportppField16: TppField
      FieldAlias = #20928#37325
      FieldName = #20928#37325
      FieldLength = 15
      DisplayWidth = 15
      Position = 15
    end
    object pdbReportppField17: TppField
      FieldAlias = #27611#37325
      FieldName = #27611#37325
      FieldLength = 15
      DisplayWidth = 15
      Position = 16
    end
    object pdbReportppField18: TppField
      FieldAlias = #32440#31665#35268#26684
      FieldName = #32440#31665#35268#26684
      FieldLength = 30
      DisplayWidth = 30
      Position = 17
    end
    object pdbReportppField19: TppField
      FieldAlias = #22791#27880'698'
      FieldName = #22791#27880'698'
      FieldLength = 50
      DisplayWidth = 50
      Position = 18
    end
    object pdbReportppField20: TppField
      FieldAlias = #21807#19968#26631#35782
      FieldName = #21807#19968#26631#35782
      FieldLength = 31
      DisplayWidth = 31
      Position = 19
    end
    object pdbReportppField21: TppField
      FieldAlias = #24037#21378#20195#30721
      FieldName = #24037#21378#20195#30721
      FieldLength = 5
      DisplayWidth = 5
      Position = 20
    end
    object pdbReportppField22: TppField
      FieldAlias = #24037#21378#20013#25991#21517
      FieldName = #24037#21378#20013#25991#21517
      FieldLength = 70
      DisplayWidth = 70
      Position = 21
    end
    object pdbReportppField23: TppField
      FieldAlias = #24037#21378#33521#25991#21517
      FieldName = #24037#21378#33521#25991#21517
      FieldLength = 70
      DisplayWidth = 70
      Position = 22
    end
    object pdbReportppField24: TppField
      FieldAlias = #24037#21378#22320#22336
      FieldName = #24037#21378#22320#22336
      FieldLength = 70
      DisplayWidth = 70
      Position = 23
    end
    object pdbReportppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'PCS'#27599'SETS'
      FieldName = 'PCS'#27599'SETS'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 24
    end
    object pdbReportppField26: TppField
      FieldAlias = #36135#36816#30446#30340#22320
      FieldName = #36135#36816#30446#30340#22320
      FieldLength = 100
      DisplayWidth = 100
      Position = 25
    end
    object pdbReportppField27: TppField
      FieldAlias = #28023#24605#19987#29992'_DN'
      FieldName = #28023#24605#19987#29992'_DN'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 26
    end
    object pdbReportppField28: TppField
      FieldAlias = #28023#24605#19987#29992'_'#35746#21333#22836
      FieldName = #28023#24605#19987#29992'_'#35746#21333#22836
      FieldLength = 25
      DisplayWidth = 25
      Position = 27
    end
    object pdbReportppField29: TppField
      FieldAlias = #28023#24605#19987#29992'_'#35746#21333#23614
      FieldName = #28023#24605#19987#29992'_'#35746#21333#23614
      FieldLength = 25
      DisplayWidth = 25
      Position = 28
    end
    object pdbReportppField30: TppField
      FieldAlias = #28023#24605#19987#29992'_'#21608#26399#25968#37327
      FieldName = #28023#24605#19987#29992'_'#21608#26399#25968#37327
      FieldLength = 61
      DisplayWidth = 61
      Position = 29
    end
    object pdbReportppField31: TppField
      FieldAlias = #28023#24605#19987#29992'_'#31665#21495
      FieldName = #28023#24605#19987#29992'_'#31665#21495
      FieldLength = 61
      DisplayWidth = 61
      Position = 30
    end
    object pdbReportppField32: TppField
      FieldAlias = #21451#35759#26412#21378#32534#21495
      FieldName = #21451#35759#26412#21378#32534#21495
      FieldLength = 31
      DisplayWidth = 31
      Position = 31
    end
    object pdbReportppField33: TppField
      FieldAlias = #38468#21152#21442#25968'1'
      FieldName = #38468#21152#21442#25968'1'
      FieldLength = 80
      DisplayWidth = 80
      Position = 32
    end
    object pdbReportppField34: TppField
      Alignment = taRightJustify
      FieldAlias = #24635#31665#25968
      FieldName = #24635#31665#25968
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 33
    end
    object pdbReportppField35: TppField
      FieldAlias = 'PCS'#21333#21482#23610#23544
      FieldName = 'PCS'#21333#21482#23610#23544
      FieldLength = 30
      DisplayWidth = 30
      Position = 34
    end
    object pdbReportppField36: TppField
      FieldAlias = 'CURRENT_REV'
      FieldName = 'CURRENT_REV'
      FieldLength = 1
      DisplayWidth = 1
      Position = 35
    end
    object pdbReportppField37: TppField
      FieldAlias = 'manu_part_number'
      FieldName = 'manu_part_number'
      FieldLength = 20
      DisplayWidth = 20
      Position = 36
    end
    object pdbReportppField38: TppField
      FieldAlias = 'ANALYSIS_CODE_2'
      FieldName = 'ANALYSIS_CODE_2'
      FieldLength = 80
      DisplayWidth = 80
      Position = 37
    end
    object pdbReportppField39: TppField
      FieldAlias = 'param1'
      FieldName = 'param1'
      FieldLength = 80
      DisplayWidth = 80
      Position = 38
    end
    object pdbReportppField40: TppField
      FieldAlias = 'Cut_NO'
      FieldName = 'Cut_NO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 39
    end
    object pdbReportppField41: TppField
      FieldAlias = 'Cut_NO_Head'
      FieldName = 'Cut_NO_Head'
      FieldLength = 20
      DisplayWidth = 20
      Position = 40
    end
    object pdbReportppField42: TppField
      FieldAlias = 'SALES_ORDER'
      FieldName = 'SALES_ORDER'
      FieldLength = 12
      DisplayWidth = 12
      Position = 41
    end
    object pdbReportppField43: TppField
      FieldAlias = 'param2'
      FieldName = 'param2'
      FieldLength = 150
      DisplayWidth = 150
      Position = 42
    end
    object pdbReportppField44: TppField
      FieldAlias = 'flag698'
      FieldName = 'flag698'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 43
    end
    object pdbReportppField45: TppField
      FieldAlias = 'P'#23458#25143#29289#26009#21495
      FieldName = 'P'#23458#25143#29289#26009#21495
      FieldLength = 51
      DisplayWidth = 51
      Position = 44
    end
    object pdbReportppField46: TppField
      FieldAlias = 'QPCS'#25968#37327
      FieldName = 'QPCS'#25968#37327
      FieldLength = 21
      DisplayWidth = 21
      Position = 45
    end
    object pdbReportppField47: TppField
      FieldAlias = 'M'#26412#21378#32534#21495
      FieldName = 'M'#26412#21378#32534#21495
      FieldLength = 21
      DisplayWidth = 21
      Position = 46
    end
    object pdbReportppField48: TppField
      FieldAlias = 'D'#25209#27425
      FieldName = 'D'#25209#27425
      FieldLength = 11
      DisplayWidth = 11
      Position = 47
    end
    object pdbReportppField49: TppField
      FieldAlias = 'L'#34920#38754#22788#29702
      FieldName = 'L'#34920#38754#22788#29702
      FieldLength = 31
      DisplayWidth = 31
      Position = 48
    end
    object pdbReportppField50: TppField
      FieldAlias = 'S'#26465#24418#30721
      FieldName = 'S'#26465#24418#30721
      FieldLength = 81
      DisplayWidth = 81
      Position = 49
    end
    object pdbReportppField51: TppField
      FieldAlias = 'M'#26412#21378#32534#21495'_1'
      FieldName = 'M'#26412#21378#32534#21495'_1'
      FieldLength = 22
      DisplayWidth = 22
      Position = 50
    end
    object pdbReportppField52: TppField
      FieldAlias = 'M'#26412#21378#32534#21495'_2'
      FieldName = 'M'#26412#21378#32534#21495'_2'
      FieldLength = 21
      DisplayWidth = 21
      Position = 51
    end
    object pdbReportppField53: TppField
      FieldAlias = 'LotOrder'
      FieldName = 'LotOrder'
      FieldLength = 128
      DisplayWidth = 128
      Position = 52
    end
    object pdbReportppField54: TppField
      FieldAlias = '1P'#26412#21378#32534#21495
      FieldName = '1P'#26412#21378#32534#21495
      FieldLength = 20
      DisplayWidth = 20
      Position = 53
    end
    object pdbReportppField55: TppField
      FieldAlias = 'V'#23458#20379#20195#30721
      FieldName = 'V'#23458#20379#20195#30721
      FieldLength = 20
      DisplayWidth = 20
      Position = 54
    end
    object pdbReportppField56: TppField
      FieldAlias = '9D'#21608#26399
      FieldName = '9D'#21608#26399
      FieldLength = 20
      DisplayWidth = 20
      Position = 55
    end
    object pdbReportppField57: TppField
      FieldAlias = '1TLotNo'
      FieldName = '1TLotNo'
      FieldLength = 20
      DisplayWidth = 20
      Position = 56
    end
    object pdbReportppField58: TppField
      FieldAlias = 'P'#23458#25143#22411#21495
      FieldName = 'P'#23458#25143#22411#21495
      FieldLength = 20
      DisplayWidth = 20
      Position = 57
    end
    object pdbReportppField59: TppField
      Alignment = taRightJustify
      FieldAlias = 'xBrode'
      FieldName = 'xBrode'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 58
    end
    object pdbReportppField60: TppField
      FieldAlias = 'psn'
      FieldName = 'psn'
      FieldLength = 50
      DisplayWidth = 50
      Position = 59
    end
  end
  object cdsReport: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspReport'
    OnCalcFields = cdsReportCalcFields
    Left = 136
    Top = 176
    object cdsReportCDSDesigner: TSmallintField
      FieldName = #24207#21495
    end
    object strngfldReportCDSDesigner2: TStringField
      FieldName = #23458#25143#21517#31216
      Size = 100
    end
    object strngfldReportCDSDesigner3: TStringField
      FieldName = #26412#21378#32534#21495
    end
    object strngfldReportCDSDesigner4: TStringField
      FieldName = #23458#25143#22411#21495
      Size = 40
    end
    object strngfldReportCDSDesigner5: TStringField
      FieldName = #23458#25143#35746#21333#21495
      Size = 25
    end
    object strngfldReportCDSDesigner6: TStringField
      FieldName = #23458#25143#29289#26009#21495
      Size = 50
    end
    object intgrfldReportPCS: TIntegerField
      FieldName = 'PCS'#25968#37327
    end
    object strngfldReportCDSDesigner7: TStringField
      FieldName = #23458#20379#20195#30721
      Size = 15
    end
    object strngfldReportCDSDesigner8: TStringField
      FieldName = #25209#27425
      Size = 50
    end
    object strngfldReportCDSDesigner9: TStringField
      FieldName = #26465#24418#30721
      Size = 80
    end
    object strngfldReportCDSDesigner10: TStringField
      FieldName = #20135#21697#25551#36848
      Size = 50
    end
    object strngfldReportCDSDesigner11: TStringField
      FieldName = #22791#27880
      Size = 50
    end
    object strngfldReportCDSDesigner12: TStringField
      FieldName = #31665#21495
      Size = 7
    end
    object strngfldReportCDSDesigner13: TStringField
      FieldName = #21019#24314#26085#26399
      ReadOnly = True
      Size = 10
    end
    object strngfldReportCDSDesigner14: TStringField
      FieldName = #34920#38754#22788#29702
      Size = 30
    end
    object strngfldReportCDSDesigner15: TStringField
      FieldName = #20928#37325
      Size = 15
    end
    object strngfldReportCDSDesigner16: TStringField
      FieldName = #27611#37325
      Size = 15
    end
    object strngfldReportCDSDesigner17: TStringField
      FieldName = #32440#31665#35268#26684
      Size = 30
    end
    object strngfldReportCDSDesigner698: TStringField
      FieldName = #22791#27880'698'
      Size = 50
    end
    object strngfldReportCDSDesigner18: TStringField
      FieldName = #21807#19968#26631#35782
      ReadOnly = True
      Size = 31
    end
    object strngfldReportCDSDesigner19: TStringField
      FieldName = #24037#21378#20195#30721
      Size = 5
    end
    object strngfldReportCDSDesigner20: TStringField
      FieldName = #24037#21378#20013#25991#21517
      Size = 70
    end
    object strngfldReportCDSDesigner21: TStringField
      FieldName = #24037#21378#33521#25991#21517
      Size = 70
    end
    object strngfldReportCDSDesigner22: TStringField
      FieldName = #24037#21378#22320#22336
      Size = 70
    end
    object intgrfldReportPCSSETS: TIntegerField
      FieldName = 'PCS'#27599'SETS'
    end
    object strngfldReportCDSDesigner23: TStringField
      FieldName = #36135#36816#30446#30340#22320
      Size = 100
    end
    object cdsReport_DN: TDateTimeField
      FieldName = #28023#24605#19987#29992'_DN'
      ReadOnly = True
    end
    object strngfldReport_1: TStringField
      FieldName = #28023#24605#19987#29992'_'#35746#21333#22836
      ReadOnly = True
      Size = 25
    end
    object strngfldReport_2: TStringField
      FieldName = #28023#24605#19987#29992'_'#35746#21333#23614
      ReadOnly = True
      Size = 25
    end
    object strngfldReport_3: TStringField
      FieldName = #28023#24605#19987#29992'_'#21608#26399#25968#37327
      ReadOnly = True
      Size = 61
    end
    object strngfldReport_4: TStringField
      FieldName = #28023#24605#19987#29992'_'#31665#21495
      ReadOnly = True
      Size = 61
    end
    object strngfldReportCDSDesigner24: TStringField
      FieldName = #21451#35759#26412#21378#32534#21495
      ReadOnly = True
      Size = 31
    end
    object strngfldReportCDSDesigner1: TStringField
      FieldName = #38468#21152#21442#25968'1'
      Size = 80
    end
    object cdsReportCDSDesigner2: TIntegerField
      FieldName = #24635#31665#25968
      ReadOnly = True
    end
    object cdsReportPCS: TStringField
      FieldName = 'PCS'#21333#21482#23610#23544
      Size = 30
    end
    object cdsReportCURRENT_REV: TStringField
      FieldName = 'CURRENT_REV'
      FixedChar = True
      Size = 1
    end
    object cdsReportmanu_part_number: TStringField
      FieldName = 'manu_part_number'
    end
    object cdsReportANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      Size = 80
    end
    object cdsReportparam1: TStringField
      FieldName = 'param1'
      Size = 80
    end
    object cdsReportCut_NO: TStringField
      FieldName = 'Cut_NO'
      ReadOnly = True
    end
    object cdsReportCut_NO_Head: TStringField
      FieldName = 'Cut_NO_Head'
      ReadOnly = True
    end
    object cdsReportSALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object cdsReportparam2: TStringField
      FieldName = 'param2'
      Size = 150
    end
    object cdsReportflag698: TBooleanField
      FieldName = 'flag698'
    end
    object strngfldReportP1: TStringField
      FieldName = 'P'#23458#25143#29289#26009#21495
      ReadOnly = True
      Size = 51
    end
    object strngfldReportQPCS1: TStringField
      FieldName = 'QPCS'#25968#37327
      ReadOnly = True
      Size = 21
    end
    object strngfldReportM1: TStringField
      FieldName = 'M'#26412#21378#32534#21495
      ReadOnly = True
      Size = 21
    end
    object strngfldReportD1: TStringField
      FieldName = 'D'#25209#27425
      ReadOnly = True
      Size = 11
    end
    object strngfldReportL1: TStringField
      FieldName = 'L'#34920#38754#22788#29702
      ReadOnly = True
      Size = 31
    end
    object strngfldReportS1: TStringField
      FieldName = 'S'#26465#24418#30721
      ReadOnly = True
      Size = 81
    end
    object strngfldReportM_2: TStringField
      FieldName = 'M'#26412#21378#32534#21495'_1'
      ReadOnly = True
      Size = 22
    end
    object strngfldReportM_4: TStringField
      FieldName = 'M'#26412#21378#32534#21495'_2'
      ReadOnly = True
      Size = 21
    end
    object strngfldReportLotOrder1: TStringField
      FieldName = 'LotOrder'
      Size = 128
    end
    object cdsReportField1P: TStringField
      FieldKind = fkCalculated
      FieldName = '1P'#26412#21378#32534#21495
      Calculated = True
    end
    object cdsReportV: TStringField
      FieldKind = fkCalculated
      FieldName = 'V'#23458#20379#20195#30721
      Calculated = True
    end
    object cdsReportField9D: TStringField
      FieldKind = fkCalculated
      FieldName = '9D'#21608#26399
      Calculated = True
    end
    object cdsReportField1TLotNo: TStringField
      FieldKind = fkCalculated
      FieldName = '1TLotNo'
      Calculated = True
    end
    object cdsReportP: TStringField
      FieldKind = fkCalculated
      FieldName = 'P'#23458#25143#22411#21495
      Calculated = True
    end
    object cdsReportxBrode: TIntegerField
      FieldName = 'xBrode'
    end
    object cdsReportpsn: TStringField
      FieldName = 'psn'
      Size = 50
    end
  end
  object dspReport: TDataSetProvider
    DataSet = adsReport
    Left = 80
    Top = 176
  end
  object ppDesigner1: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = ppPrint
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 312
    Top = 136
  end
  object temp: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 208
    Top = 80
  end
  object spDecToAbc36: TADOStoredProc
    Connection = con1
    ProcedureName = 'DecToABC36'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@Dec'
        Attributes = [paNullable]
        DataType = ftLargeint
        Precision = 19
        Value = Null
      end
      item
        Name = '@out_ABC36'
        Attributes = [paNullable]
        DataType = ftString
        Direction = pdInputOutput
        Size = 50
        Value = Null
      end
      item
        Name = '@ret'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 192
    Top = 152
  end
end
