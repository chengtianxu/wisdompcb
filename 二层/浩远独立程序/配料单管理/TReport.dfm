object FrmReport: TFrmReport
  Left = 326
  Top = 245
  Width = 425
  Height = 301
  Caption = 'FrmReport'
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object vmark: TLabel
    Left = 104
    Top = 40
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object Memo1: TMemo
    Left = 16
    Top = 184
    Width = 185
    Height = 65
    TabOrder = 0
    Visible = False
    WordWrap = False
  end
  object Memo2: TMemo
    Left = 208
    Top = 184
    Width = 185
    Height = 65
    TabOrder = 1
    Visible = False
    WordWrap = False
  end
  object Adoquery5: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'vptr2'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 25
      end>
    SQL.Strings = (
      'SELECT     TOP 100 PERCENT dbo.Data0278.SEQUENCE_NO,'
      'dbo.Data0278.PARAMETER_DESC, dbo.Data0279.PARAMETER_VALUE,'
      '   dbo.Data0002.UNIT_CODE, dbo.Data0002.RKEY'
      'FROM         dbo.Data0278 INNER JOIN'
      
        '  dbo.Data0279 ON dbo.Data0279.PARAMETER_PTR = dbo.Data0278.RKEY' +
        ' INNER JOIN'
      '  dbo.Data0002 ON dbo.Data0278.UNIT_PTR = dbo.Data0002.RKEY'
      'WHERE     (dbo.Data0278.STATUS2 = 0) AND'
      ' (dbo.Data0279.IES_PROD = 1) AND'
      ' (dbo.Data0279.SOURCE_PTR = :vptr2)'
      'ORDER BY dbo.Data0279.IES_CRP'
      '')
    Left = 72
    Top = 69
  end
  object DataSource1: TDataSource
    DataSet = DM.ADOQALL2
    Left = 170
    Top = 7
  end
  object TCompanyInfo: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    EnableBCD = False
    Parameters = <>
    SQL.Strings = (
      'select * from data0493')
    Left = 135
    Top = 102
    object TCompanyInfoCompany_Name: TStringField
      FieldName = 'Company_Name'
      Size = 50
    end
    object TCompanyInfoCompany_name2: TStringField
      FieldName = 'Company_name2'
      Size = 50
    end
    object TCompanyInfoCompany_name3: TStringField
      FieldName = 'Company_name3'
      Size = 50
    end
    object TCompanyInfoship_address: TStringField
      FieldName = 'ship_address'
      Size = 50
    end
    object TCompanyInfoCompany_Icon: TBlobField
      FieldName = 'Company_Icon'
    end
    object TCompanyInfoSITE_INFO_ADD_1: TStringField
      FieldName = 'SITE_INFO_ADD_1'
      FixedChar = True
      Size = 50
    end
    object TCompanyInfoSITE_INFO_ADD_2: TStringField
      FieldName = 'SITE_INFO_ADD_2'
      FixedChar = True
      Size = 50
    end
    object TCompanyInfoSITE_INFO_ADD_3: TStringField
      FieldName = 'SITE_INFO_ADD_3'
      FixedChar = True
      Size = 50
    end
    object TCompanyInfoSITE_INFO_PHONE: TStringField
      FieldName = 'SITE_INFO_PHONE'
      FixedChar = True
      Size = 30
    end
  end
  object DataSource3: TDataSource
    DataSet = ADOQuery2
    Left = 168
    Top = 72
  end
  object DataSource4: TDataSource
    DataSet = TCompanyInfo
    Left = 168
    Top = 104
  end
  object CompanyInfo: TppDBPipeline
    DataSource = DataSource4
    UserName = 'CompanyInfo'
    Left = 208
    Top = 104
  end
  object BaseInfo: TppDBPipeline
    DataSource = DataSource1
    OpenDataSource = False
    UserName = 'BaseInfo'
    Left = 208
    Top = 8
  end
  object ADOQuery2: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    EnableBCD = False
    Parameters = <
      item
        Name = 'vptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select rkey,layers,layers_info,ENG_NOTE from data0025'
      'where rkey=:vptr')
    Left = 137
    Top = 69
    object ADOQuery2rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object WideStringField1: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'GenParam1'
      Size = 1500
      Calculated = True
    end
    object ADOQuery2GenParam2: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'GenParam2'
      Size = 1500
      Calculated = True
    end
    object ADOQuery2MI_FLOW: TStringField
      FieldKind = fkCalculated
      FieldName = 'MI_FLOW'
      Size = 800
      Calculated = True
    end
    object ADOQuery2layers: TWordField
      FieldName = 'layers'
    end
    object ADOQuery2layers_info: TMemoField
      FieldName = 'layers_info'
      BlobType = ftMemo
    end
    object ADOQuery2ENG_NOTE: TStringField
      DisplayLabel = #24037#31243#22791#27880
      FieldName = 'ENG_NOTE'
      Size = 200
    end
  end
  object GenParameters: TppDBPipeline
    DataSource = DataSource3
    OpenDataSource = False
    UserName = 'GenParameters'
    Left = 208
    Top = 72
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterOpen = Adoquery1AfterOpen
    Parameters = <
      item
        Name = 'vcut_no'
        DataType = ftString
        Size = 1
        Value = ' '
      end
      item
        Name = 'cut_no'
        DataType = ftString
        Size = 1
        Value = ' '
      end>
    SQL.Strings = (
      ''
      
        'SELECT data0034.dept_code,data0034.dept_name,data0017.inv_part_n' +
        'umber,'
      
        'data0017.inv_part_description,'#39#39' as len_size,'#39#39' as wei_size,data' +
        '0002.unit_code,data0468.step,'
      
        'data0468.quan_bom,data0468.quan_issued,data0468.status,data0468.' +
        'vendor,'
      'case data0468.invent_or'
      'when 0 then '#39#26631#20934#26009#39
      'when 1 then '#39#20313#26009#39
      'when 2 then '#39#30041#20313#26009#39
      'else '#39#39
      'end as inventor,'
      #39#39' as spec'
      'from data0468,data0017,data0034,data0002'
      'where cut_no = :vcut_no'
      'and data0468.invent_ptr=data0017.rkey'
      'and data0468.printit = '#39'Y'#39
      'and data0017.stock_unit_ptr=data0002.rkey'
      'and data0468.dept_ptr=data0034.rkey'
      'and data0468.invent_or=0'
      'union all'
      'SELECT data0034.dept_code,data0034.dept_name,data0556.mat_code,'
      
        'data0556.mat_desc,cast(data0556.len_size as varchar(15)) as len_' +
        'size,'
      
        'cast(data0556.wei_size as varchar(15)) as wei_size,data0002.unit' +
        '_code,data0468.step,'
      
        'data0468.quan_bom,data0468.quan_issued,data0468.status,data0468.' +
        'vendor,'
      'case data0468.invent_or'
      'when 0 then '#39#26631#20934#26009#39
      'when 1 then '#39#20313#26009#39
      'when 2 then '#39#30041#20313#26009#39
      'else '#39#39
      'end as inventor,'
      
        '(cast(data0556.len_size as varchar(15))+'#39'*'#39'+cast(data0556.wei_si' +
        'ze as varchar(15))) as spec'
      'from data0468,data0556,data0034,data0002,data0017'
      'where cut_no =  :cut_no'
      'and data0468.invent_ptr=data0556.rkey'
      'and data0468.invent_or=1 '
      'and data0468.printit = '#39'Y'#39
      'and data0556.rkey17=data0017.rkey'
      'and data0017.stock_unit_ptr=data0002.rkey'
      'and data0468.dept_ptr=data0034.rkey'
      ' ')
    Left = 136
    Top = 40
    object ADOQuery1dept_code: TStringField
      FieldName = 'dept_code'
      Size = 10
    end
    object ADOQuery1dept_name: TStringField
      FieldName = 'dept_name'
      Size = 30
    end
    object ADOQuery1inv_part_number: TStringField
      FieldName = 'inv_part_number'
      Size = 25
    end
    object ADOQuery1inv_part_description: TStringField
      FieldName = 'inv_part_description'
      ReadOnly = True
      Size = 100
    end
    object ADOQuery1len_size: TStringField
      FieldName = 'len_size'
      ReadOnly = True
      Size = 15
    end
    object ADOQuery1wei_size: TStringField
      FieldName = 'wei_size'
      ReadOnly = True
      Size = 15
    end
    object ADOQuery1unit_code: TStringField
      FieldName = 'unit_code'
      Size = 5
    end
    object ADOQuery1step: TSmallintField
      FieldName = 'step'
    end
    object ADOQuery1quan_bom: TFloatField
      FieldName = 'quan_bom'
    end
    object ADOQuery1quan_issued: TFloatField
      FieldName = 'quan_issued'
    end
    object ADOQuery1status: TSmallintField
      FieldName = 'status'
    end
    object ADOQuery1vendor: TStringField
      FieldName = 'vendor'
      FixedChar = True
      Size = 15
    end
    object ADOQuery1inventor: TStringField
      FieldName = 'inventor'
      ReadOnly = True
      Size = 6
    end
    object ADOQuery1spec: TStringField
      FieldName = 'spec'
      ReadOnly = True
      Size = 31
    end
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery1
    Left = 168
    Top = 40
  end
  object InventItems: TppDBPipeline
    DataSource = DataSource2
    OpenDataSource = False
    UserName = 'InventItems'
    Left = 208
    Top = 40
  end
  object DataSource5: TDataSource
    DataSet = DM.TMPADO1
    Left = 168
    Top = 136
  end
  object PCB_CUT: TppDBPipeline
    DataSource = DataSource5
    OpenDataSource = False
    UserName = 'PCB_CUT'
    Left = 208
    Top = 136
  end
  object ADOQuery3: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'vptr1'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 25
      end>
    SQL.Strings = (
      'select data0034.dept_name from data0038,data0034'
      'where data0038.dept_ptr=data0034.rkey'
      'and data0038.source_ptr=:vptr1'
      'order by data0038.step_number')
    Left = 104
    Top = 69
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
    Report = ppReport1
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 248
    Top = 80
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = InventItems
    OnPrintingComplete = ppReport1PrintingComplete
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 2540
    PrinterSetup.mmMarginLeft = 11430
    PrinterSetup.mmMarginRight = 7620
    PrinterSetup.mmMarginTop = 7620
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    SaveAsTemplate = True
    Template.FileName = 'R:\NIERP\Report\Newmoreport.rtm'
    Units = utMillimeters
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 248
    Top = 48
    Version = '7.01'
    mmColumnWidth = 196850
    DataPipelineName = 'InventItems'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 56621
      mmPrintPosition = 0
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'Company_Icon'
        DataPipeline = CompanyInfo
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'CompanyInfo'
        mmHeight = 13229
        mmLeft = 4233
        mmTop = 3175
        mmWidth = 20638
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'Company_Name'
        DataPipeline = CompanyInfo
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 16
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'CompanyInfo'
        mmHeight = 6615
        mmLeft = 49477
        mmTop = 3175
        mmWidth = 91281
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = #37197#26009#21333#65288#24320#26009#19987#29992#39046#26009#21333#65289
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5630
        mmLeft = 63765
        mmTop = 9790
        mmWidth = 62442
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = #23458#25143#20195#30721':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4763
        mmLeft = 14288
        mmTop = 18785
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = #26412#21378#32534#21495':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4763
        mmLeft = 14288
        mmTop = 23548
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = #23458#25143#22411#21495':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4699
        mmLeft = 14288
        mmTop = 28310
        mmWidth = 22225
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'cust_code'
        DataPipeline = BaseInfo
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BaseInfo'
        mmHeight = 4763
        mmLeft = 37306
        mmTop = 18785
        mmWidth = 12965
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'MANU_PART_NUMBER'
        DataPipeline = BaseInfo
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BaseInfo'
        mmHeight = 4784
        mmLeft = 37306
        mmTop = 23548
        mmWidth = 22225
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'MANU_PART_DESC'
        DataPipeline = BaseInfo
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BaseInfo'
        mmHeight = 4784
        mmLeft = 37306
        mmTop = 28310
        mmWidth = 47879
        BandType = 0
      end
      object ppLine23: TppLine
        UserName = 'Line12'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 42863
        mmWidth = 190950
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = #21152#24037#21442#25968#21517#31216
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 2381
        mmTop = 45244
        mmWidth = 26988
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = #21442#25968#20540
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 37306
        mmTop = 45244
        mmWidth = 12965
        BandType = 0
      end
      object ppLine21: TppLine
        UserName = 'Line21'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1588
        mmTop = 50006
        mmWidth = 93134
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = #21152#24037#21442#25968#21517#31216
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 97367
        mmTop = 45244
        mmWidth = 26988
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = #21442#25968#20540
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 130175
        mmTop = 45244
        mmWidth = 12965
        BandType = 0
      end
      object ppLine32: TppLine
        UserName = 'Line32'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 96573
        mmTop = 50006
        mmWidth = 92604
        BandType = 0
      end
      object ppDBMemo2: TppDBMemo
        UserName = 'DBMemo2'
        CharWrap = False
        DataField = 'GenParam1'
        DataPipeline = GenParameters
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'GenParameters'
        mmHeight = 5292
        mmLeft = 2910
        mmTop = 51065
        mmWidth = 92340
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo3: TppDBMemo
        UserName = 'DBMemo3'
        CharWrap = False
        DataField = 'GenParam2'
        DataPipeline = GenParameters
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'GenParameters'
        mmHeight = 5292
        mmLeft = 96573
        mmTop = 51065
        mmWidth = 92340
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtDateTime
        DisplayFormat = 'yyyy-MM-dd hh:mm:ss'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 159015
        mmTop = 7408
        mmWidth = 30956
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label28'
        Caption = #25171#21360#26102#38388':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 159279
        mmTop = 2910
        mmWidth = 14023
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = 'product_name'
        DataPipeline = BaseInfo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 16
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BaseInfo'
        mmHeight = 6435
        mmLeft = 152665
        mmTop = 16669
        mmWidth = 34036
        BandType = 0
      end
      object ppLabel44: TppLabel
        UserName = 'Label34'
        AutoSize = False
        Caption = #24037#33402#27969#31243
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 3175
        mmTop = 34396
        mmWidth = 14817
        BandType = 0
      end
      object ppDBMemo7: TppDBMemo
        UserName = 'DBMemo7'
        CharWrap = False
        DataField = 'MI_flow'
        DataPipeline = GenParameters
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'GenParameters'
        mmHeight = 5027
        mmLeft = 19579
        mmTop = 34131
        mmWidth = 168540
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Label8xssss'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 99748
        mmTop = 18785
        mmWidth = 19389
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        DataField = 'step'
        DataPipeline = InventItems
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'InventItems'
        mmHeight = 4699
        mmLeft = 794
        mmTop = 529
        mmWidth = 5027
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        DataField = 'dept_name'
        DataPipeline = InventItems
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'InventItems'
        mmHeight = 4763
        mmLeft = 7408
        mmTop = 529
        mmWidth = 14552
        BandType = 4
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 190765
        BandType = 4
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 5292
        mmLeft = 132821
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 5292
        mmLeft = 0
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 5292
        mmLeft = 6350
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 5292
        mmLeft = 22490
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 5292
        mmLeft = 158486
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine20: TppLine
        UserName = 'Line20'
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 5292
        mmLeft = 190765
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 5292
        mmLeft = 132821
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine26: TppLine
        UserName = 'Line26'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 5292
        mmLeft = 0
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine27: TppLine
        UserName = 'Line27'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 5292
        mmLeft = 6350
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine29: TppLine
        UserName = 'Line29'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 5292
        mmLeft = 22490
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine30: TppLine
        UserName = 'Line30'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 5292
        mmLeft = 158486
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine31: TppLine
        UserName = 'Line201'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 5292
        mmLeft = 190765
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 5292
        mmLeft = 72231
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine22: TppLine
        UserName = 'Line22'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 5292
        mmLeft = 72231
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText8'
        DataField = 'vendor'
        DataPipeline = InventItems
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'InventItems'
        mmHeight = 4763
        mmLeft = 133879
        mmTop = 529
        mmWidth = 11906
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'unit_code'
        DataPipeline = InventItems
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'InventItems'
        mmHeight = 4763
        mmLeft = 147109
        mmTop = 529
        mmWidth = 11113
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'quan_bom'
        DataPipeline = InventItems
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'InventItems'
        mmHeight = 4784
        mmLeft = 159809
        mmTop = 508
        mmWidth = 18521
        BandType = 4
      end
      object ppLine33: TppLine
        UserName = 'Line33'
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 5292
        mmLeft = 179388
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine34: TppLine
        UserName = 'Line301'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 5292
        mmLeft = 179388
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 190765
        BandType = 4
      end
      object ppLine36: TppLine
        UserName = 'Line36'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 5292
        mmLeft = 146315
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'inv_part_description'
        DataPipeline = InventItems
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'InventItems'
        mmHeight = 4763
        mmLeft = 73554
        mmTop = 529
        mmWidth = 58473
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo5: TppDBMemo
        UserName = 'DBMemo5'
        CharWrap = False
        DataField = 'inv_part_number'
        DataPipeline = InventItems
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'InventItems'
        mmHeight = 4763
        mmLeft = 23283
        mmTop = 529
        mmWidth = 47890
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 15875
      mmPrintPosition = 0
      object ppLine25: TppLine
        UserName = 'Line25'
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 0
        mmTop = 0
        mmWidth = 190765
        BandType = 8
      end
      object ppLabel25: TppLabel
        UserName = 'Label20'
        Caption = #25237#20135#21592':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 1588
        mmTop = 1059
        mmWidth = 12347
        BandType = 8
      end
      object ppLabel28: TppLabel
        UserName = 'Label25'
        Caption = #23457#26680#20154':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 39688
        mmTop = 1059
        mmWidth = 12347
        BandType = 8
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'employee_name'
        DataPipeline = BaseInfo
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BaseInfo'
        mmHeight = 3951
        mmLeft = 15081
        mmTop = 1059
        mmWidth = 17992
        BandType = 8
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = #23457#25209#20154':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 78052
        mmTop = 1059
        mmWidth = 12347
        BandType = 8
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        Caption = #21457#26009#20154':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 114300
        mmTop = 1059
        mmWidth = 12347
        BandType = 8
      end
      object ppLabel37: TppLabel
        UserName = 'Label37'
        Caption = #39046#26009#20154':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 151077
        mmTop = 1059
        mmWidth = 12347
        BandType = 8
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        mmHeight = 265
        mmLeft = 15081
        mmTop = 5556
        mmWidth = 22225
        BandType = 8
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        mmHeight = 265
        mmLeft = 53446
        mmTop = 5556
        mmWidth = 22225
        BandType = 8
      end
      object ppShape5: TppShape
        UserName = 'Shape5'
        mmHeight = 265
        mmLeft = 91017
        mmTop = 5556
        mmWidth = 22225
        BandType = 8
      end
      object ppShape6: TppShape
        UserName = 'Shape6'
        mmHeight = 265
        mmLeft = 127265
        mmTop = 5556
        mmWidth = 22225
        BandType = 8
      end
      object ppShape7: TppShape
        UserName = 'Shape7'
        mmHeight = 265
        mmLeft = 164307
        mmTop = 5556
        mmWidth = 22225
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup2: TppGroup
      BreakName = 'ppDBText14'
      BreakType = btCustomField
      OutlineSettings.CreateNode = True
      NewPage = True
      ResetPageNo = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand2: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 126736
        mmPrintPosition = 0
        object ppLabel26: TppLabel
          UserName = 'Label26'
          AutoSize = False
          Caption = #20027#35201#26448#26009#28165#21333
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4763
          mmLeft = 60590
          mmTop = 115094
          mmWidth = 65352
          BandType = 3
          GroupNo = 1
        end
        object ppLabel27: TppLabel
          UserName = 'Label27'
          AutoSize = False
          Caption = #24207
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 794
          mmTop = 121973
          mmWidth = 5027
          BandType = 3
          GroupNo = 1
        end
        object ppLabel30: TppLabel
          UserName = 'Label30'
          AutoSize = False
          Caption = #24037#24207
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 8731
          mmTop = 121973
          mmWidth = 11113
          BandType = 3
          GroupNo = 1
        end
        object ppLabel32: TppLabel
          UserName = 'Label301'
          AutoSize = False
          Caption = #26448#26009#20195#21495
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 24077
          mmTop = 121973
          mmWidth = 20108
          BandType = 3
          GroupNo = 1
        end
        object ppLabel33: TppLabel
          UserName = 'Label33'
          AutoSize = False
          Caption = #21333#20301
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 10
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 147109
          mmTop = 121973
          mmWidth = 11113
          BandType = 3
          GroupNo = 1
        end
        object ppLabel34: TppLabel
          UserName = 'Label302'
          AutoSize = False
          Caption = #20379#24212#21830
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 133879
          mmTop = 121973
          mmWidth = 10848
          BandType = 3
          GroupNo = 1
        end
        object ppLabel35: TppLabel
          UserName = 'Label35'
          AutoSize = False
          Caption = #37197#39069#25968
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 166159
          mmTop = 121973
          mmWidth = 12435
          BandType = 3
          GroupNo = 1
        end
        object ppLine11: TppLine
          UserName = 'Line101'
          Weight = 0.750000000000000000
          mmHeight = 265
          mmLeft = 0
          mmTop = 120915
          mmWidth = 190765
          BandType = 3
          GroupNo = 1
        end
        object ppLine13: TppLine
          UserName = 'Line13'
          Position = lpLeft
          StretchWithParent = True
          Weight = 0.750000000000000000
          mmHeight = 5556
          mmLeft = 0
          mmTop = 121179
          mmWidth = 265
          BandType = 3
          GroupNo = 1
        end
        object ppLine14: TppLine
          UserName = 'Line14'
          Position = lpLeft
          StretchWithParent = True
          Weight = 0.750000000000000000
          mmHeight = 5556
          mmLeft = 6350
          mmTop = 120915
          mmWidth = 265
          BandType = 3
          GroupNo = 1
        end
        object ppLine16: TppLine
          UserName = 'Line16'
          Position = lpLeft
          StretchWithParent = True
          Weight = 0.750000000000000000
          mmHeight = 5556
          mmLeft = 22490
          mmTop = 120915
          mmWidth = 265
          BandType = 3
          GroupNo = 1
        end
        object ppLine17: TppLine
          UserName = 'Line17'
          Position = lpLeft
          StretchWithParent = True
          Weight = 0.750000000000000000
          mmHeight = 5821
          mmLeft = 132821
          mmTop = 120650
          mmWidth = 265
          BandType = 3
          GroupNo = 1
        end
        object ppLine18: TppLine
          UserName = 'Line18'
          Position = lpLeft
          StretchWithParent = True
          Weight = 0.750000000000000000
          mmHeight = 5821
          mmLeft = 146315
          mmTop = 120650
          mmWidth = 265
          BandType = 3
          GroupNo = 1
        end
        object ppLine19: TppLine
          UserName = 'Line19'
          Position = lpLeft
          StretchWithParent = True
          Weight = 0.750000000000000000
          mmHeight = 5556
          mmLeft = 158486
          mmTop = 120915
          mmWidth = 265
          BandType = 3
          GroupNo = 1
        end
        object ppLine24: TppLine
          UserName = 'Line24'
          Weight = 0.750000000000000000
          mmHeight = 265
          mmLeft = 0
          mmTop = 113771
          mmWidth = 192882
          BandType = 3
          GroupNo = 1
        end
        object ppLine9: TppLine
          UserName = 'Line9'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 5556
          mmLeft = 190765
          mmTop = 120915
          mmWidth = 265
          BandType = 3
          GroupNo = 1
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          AutoSize = False
          Caption = #26448#26009#21517#31216
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 73554
          mmTop = 121709
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppLine5: TppLine
          UserName = 'Line5'
          Position = lpLeft
          StretchWithParent = True
          Weight = 0.750000000000000000
          mmHeight = 5556
          mmLeft = 72231
          mmTop = 120915
          mmWidth = 265
          BandType = 3
          GroupNo = 0
        end
        object ppLabel17: TppLabel
          UserName = 'Label17'
          AutoSize = False
          Caption = #23454#21457#25968
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 180182
          mmTop = 121973
          mmWidth = 10054
          BandType = 3
          GroupNo = 0
        end
        object ppLine28: TppLine
          UserName = 'Line28'
          Position = lpLeft
          StretchWithParent = True
          Weight = 0.750000000000000000
          mmHeight = 5556
          mmLeft = 179388
          mmTop = 120915
          mmWidth = 265
          BandType = 3
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          Caption = #35746#21333#21495':'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4022
          mmLeft = 19960
          mmTop = 79904
          mmWidth = 12319
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label11'
          Caption = #24453#35745#21010#25968':'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4022
          mmLeft = 16182
          mmTop = 91017
          mmWidth = 15833
          BandType = 3
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          Caption = #35745#21010#23436#24037#26399':'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4022
          mmLeft = 12933
          mmTop = 101600
          mmWidth = 19346
          BandType = 3
          GroupNo = 0
        end
        object ppLabel14: TppLabel
          UserName = 'Label14'
          AutoSize = False
          Caption = #25237#20135#27604#20363':'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4763
          mmLeft = 150813
          mmTop = 89959
          mmWidth = 16404
          BandType = 3
          GroupNo = 0
        end
        object ppLabel20: TppLabel
          UserName = 'Label102'
          Caption = #25237#20135#25968#37327':'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4022
          mmLeft = 89471
          mmTop = 79375
          mmWidth = 15833
          BandType = 3
          GroupNo = 0
        end
        object ppDBText10: TppDBText
          UserName = 'DBText10'
          AutoSize = True
          DataField = 'so_no'
          DataPipeline = BaseInfo
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BaseInfo'
          mmHeight = 4022
          mmLeft = 33073
          mmTop = 79904
          mmWidth = 8890
          BandType = 3
          GroupNo = 0
        end
        object ppDBText12: TppDBText
          UserName = 'DBText12'
          DataField = 'ORD_REQ_QTY'
          DataPipeline = BaseInfo
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BaseInfo'
          mmHeight = 4763
          mmLeft = 33073
          mmTop = 91017
          mmWidth = 26988
          BandType = 3
          GroupNo = 0
        end
        object ppDBText16: TppDBText
          UserName = 'DBText16'
          DataField = 'issued_qty'
          DataPipeline = BaseInfo
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BaseInfo'
          mmHeight = 4763
          mmLeft = 106363
          mmTop = 79375
          mmWidth = 20902
          BandType = 3
          GroupNo = 0
        end
        object ppDBText19: TppDBText
          UserName = 'DBText102'
          DataField = 'sch_compl_date'
          DataPipeline = BaseInfo
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BaseInfo'
          mmHeight = 4498
          mmLeft = 33073
          mmTop = 101865
          mmWidth = 26988
          BandType = 3
          GroupNo = 0
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          Caption = 'PNL'#25968'(2):'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4022
          mmLeft = 89344
          mmTop = 95779
          mmWidth = 15960
          BandType = 3
          GroupNo = 0
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          Caption = #22791#27880':'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 153194
          mmTop = 96573
          mmWidth = 8731
          BandType = 3
          GroupNo = 0
        end
        object ppLabel24: TppLabel
          UserName = 'Label24'
          Caption = #37197#26009#21333#21495':'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4022
          mmLeft = 16182
          mmTop = 107156
          mmWidth = 15833
          BandType = 3
          GroupNo = 0
        end
        object ppDBText14: TppDBText
          UserName = 'DBText14'
          AutoSize = True
          DataField = 'CUT_NO'
          DataPipeline = BaseInfo
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Name = #23435#20307
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BaseInfo'
          mmHeight = 4022
          mmLeft = 32808
          mmTop = 107156
          mmWidth = 10668
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = #21512#21516#21495':'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4022
          mmLeft = 19960
          mmTop = 85461
          mmWidth = 12319
          BandType = 3
          GroupNo = 0
        end
        object ppDBText8: TppDBText
          UserName = 'DBText103'
          AutoSize = True
          DataField = 'po_number'
          DataPipeline = BaseInfo
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BaseInfo'
          mmHeight = 4022
          mmLeft = 33073
          mmTop = 85461
          mmWidth = 16002
          BandType = 3
          GroupNo = 0
        end
        object ppLine35: TppLine
          UserName = 'Line35'
          ParentWidth = True
          Weight = 0.750000000000000000
          mmHeight = 265
          mmLeft = 0
          mmTop = 2117
          mmWidth = 190950
          BandType = 3
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'QTY_ON_HAND'
          DataPipeline = BaseInfo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BaseInfo'
          mmHeight = 4233
          mmLeft = 162454
          mmTop = 79375
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object ppLabel38: TppLabel
          UserName = 'Label29'
          Caption = #24211#23384#37327':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 149754
          mmTop = 79375
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object ppLabel39: TppLabel
          UserName = 'Label39'
          Caption = #25237#20135#38754#31215':'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4022
          mmLeft = 89471
          mmTop = 84667
          mmWidth = 15833
          BandType = 3
          GroupNo = 0
        end
        object ppLabel40: TppLabel
          UserName = 'Label40'
          Caption = #35745#21010#38754#31215':'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4022
          mmLeft = 16182
          mmTop = 96309
          mmWidth = 15833
          BandType = 3
          GroupNo = 0
        end
        object ppLabel41: TppLabel
          UserName = 'Label32'
          Caption = #21333#21482#38754#31215#65306
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4022
          mmLeft = 149754
          mmTop = 84667
          mmWidth = 17780
          BandType = 3
          GroupNo = 0
        end
        object ppDBText11: TppDBText
          UserName = 'DBText11'
          AutoSize = True
          DataField = 'unit_sq'
          DataPipeline = BaseInfo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BaseInfo'
          mmHeight = 4022
          mmLeft = 168011
          mmTop = 84667
          mmWidth = 11303
          BandType = 3
          GroupNo = 0
        end
        object ppDBMemo6: TppDBMemo
          UserName = 'DBMemo6'
          CharWrap = False
          DataField = 'layers_info'
          DataPipeline = GenParameters
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = #23435#20307
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Stretch = True
          Transparent = True
          DataPipelineName = 'GenParameters'
          mmHeight = 39688
          mmLeft = 97896
          mmTop = 3440
          mmWidth = 91811
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppImage1: TppImage
          UserName = 'Image1'
          MaintainAspectRatio = False
          Stretch = True
          mmHeight = 75142
          mmLeft = 794
          mmTop = 3440
          mmWidth = 96573
          BandType = 3
          GroupNo = 0
        end
        object ppLabel21: TppLabel
          UserName = 'Label21'
          Caption = 'PNL'#25968'(1):'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4022
          mmLeft = 89344
          mmTop = 90223
          mmWidth = 15960
          BandType = 3
          GroupNo = 0
        end
        object ppDBText6: TppDBText
          UserName = 'DBText6'
          AutoSize = True
          DataField = 'MyTTYPE'
          DataPipeline = BaseInfo
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BaseInfo'
          mmHeight = 3979
          mmLeft = 163248
          mmTop = 96573
          mmWidth = 12446
          BandType = 3
          GroupNo = 0
        end
        object ppDBText7: TppDBText
          UserName = 'DBText7'
          AutoSize = True
          DataField = #35745#21010#38754#31215
          DataPipeline = BaseInfo
          DisplayFormat = '0.000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BaseInfo'
          mmHeight = 4868
          mmLeft = 32808
          mmTop = 96309
          mmWidth = 10668
          BandType = 3
          GroupNo = 0
        end
        object ppDBText9: TppDBText
          UserName = 'DBText9'
          AutoSize = True
          DataField = #25237#20135#38754#31215
          DataPipeline = BaseInfo
          DisplayFormat = '0.000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BaseInfo'
          mmHeight = 4868
          mmLeft = 106627
          mmTop = 84402
          mmWidth = 10668
          BandType = 3
          GroupNo = 0
        end
        object ppDBText21: TppDBText
          UserName = 'DBText15'
          AutoSize = True
          DataField = #36229#25237#29575
          DataPipeline = BaseInfo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BaseInfo'
          mmHeight = 4868
          mmLeft = 168540
          mmTop = 89694
          mmWidth = 10668
          BandType = 3
          GroupNo = 0
        end
        object ppDBText22: TppDBText
          UserName = 'DBText19'
          AutoSize = True
          DataField = 'PANEL_1_QTY'
          DataPipeline = BaseInfo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BaseInfo'
          mmHeight = 4784
          mmLeft = 107929
          mmTop = 90223
          mmWidth = 4784
          BandType = 3
          GroupNo = 0
        end
        object ppDBText23: TppDBText
          UserName = 'DBText21'
          AutoSize = True
          DataField = 'UPANEL1'
          DataPipeline = BaseInfo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BaseInfo'
          mmHeight = 4784
          mmLeft = 117475
          mmTop = 89959
          mmWidth = 4784
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'X'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = []
          Transparent = True
          mmHeight = 4763
          mmLeft = 113771
          mmTop = 90223
          mmWidth = 2910
          BandType = 3
          GroupNo = 0
        end
        object ppDBText26: TppDBText
          UserName = 'DBText26'
          AutoSize = True
          DataField = 'PANEL_2_QTY'
          DataPipeline = BaseInfo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BaseInfo'
          mmHeight = 4868
          mmLeft = 110607
          mmTop = 95515
          mmWidth = 2371
          BandType = 3
          GroupNo = 0
        end
        object ppDBText27: TppDBText
          UserName = 'DBText27'
          AutoSize = True
          DataField = 'UPANEL2'
          DataPipeline = BaseInfo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BaseInfo'
          mmHeight = 4868
          mmLeft = 117740
          mmTop = 95250
          mmWidth = 2371
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'X'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = []
          Transparent = True
          mmHeight = 4763
          mmLeft = 114036
          mmTop = 95515
          mmWidth = 2910
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object ppLine12: TppLine
          UserName = 'Line102'
          Weight = 0.750000000000000000
          mmHeight = 265
          mmLeft = 0
          mmTop = 0
          mmWidth = 190765
          BandType = 5
          GroupNo = 1
        end
        object ppLabel36: TppLabel
          UserName = 'Label36'
          Caption = #22791#27880#20449#24687':'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4022
          mmLeft = 529
          mmTop = 1058
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
        end
        object ppDBMemo4: TppDBMemo
          UserName = 'DBMemo4'
          CharWrap = False
          DataField = 'remark'
          DataPipeline = BaseInfo
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          Stretch = True
          Transparent = True
          DataPipelineName = 'BaseInfo'
          mmHeight = 4233
          mmLeft = 16669
          mmTop = 1058
          mmWidth = 174361
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
      end
    end
  end
end
