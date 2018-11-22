object Form_SoPrint: TForm_SoPrint
  Left = 272
  Top = 172
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #39044#22788#29702#22810#26465#35760#24405#25171#21360
  ClientHeight = 416
  ClientWidth = 689
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 689
    Height = 47
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label4: TLabel
      Left = 75
      Top = 7
      Width = 72
      Height = 13
      Caption = #36755#20837#26085#26399#20174':'
    end
    object Label3: TLabel
      Left = 174
      Top = 7
      Width = 20
      Height = 13
      Caption = #21040':'
    end
    object Label1: TLabel
      Left = 281
      Top = 27
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = #23458#25143#65306
    end
    object Button1: TButton
      Left = 446
      Top = 20
      Width = 51
      Height = 24
      Caption = #26597#35810
      TabOrder = 0
      OnClick = Button1Click
    end
    object dtpk1: TDateTimePicker
      Left = 73
      Top = 23
      Width = 96
      Height = 21
      Date = 38847.000000000000000000
      Time = 38847.000000000000000000
      TabOrder = 1
    end
    object dtpk2: TDateTimePicker
      Left = 172
      Top = 23
      Width = 96
      Height = 21
      Date = 38847.000000000000000000
      Time = 38847.000000000000000000
      TabOrder = 2
    end
    object BitBtn3: TBitBtn
      Left = 412
      Top = 19
      Width = 25
      Height = 25
      TabOrder = 3
      TabStop = False
      OnClick = BitBtn3Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADA000000000000ADAD0FFFFFFFFFF0DADA0F00F00000F0ADAD0FFFFFFFFFF0
        DADA0F00F00000F0ADAD0FFFFFFFFFF0DADA0FFFFFFF0FF0ADAD0FF0FFF080F0
        DAD40F080F0808000D440FF08080808880440000080808888844DADAD0808888
        8844ADADAD0888888044DADADAD000000A44ADADADADADADADAD}
    end
    object Edit1: TEdit
      Left = 318
      Top = 22
      Width = 90
      Height = 21
      MaxLength = 5
      TabOrder = 4
      OnExit = Edit1Exit
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 375
    Width = 689
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Button2: TButton
      Left = 346
      Top = 11
      Width = 75
      Height = 25
      Caption = #20851#38381
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 268
      Top = 11
      Width = 75
      Height = 25
      Caption = #25171#21360
      Enabled = False
      TabOrder = 1
      OnClick = Button3Click
    end
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 47
    Width = 689
    Height = 328
    Hint = #21452#20987#21024#38500#19968#26465#35760#24405
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid2DblClick
    OnKeyDown = DBGrid2KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'CUST_CODE'
        Title.Caption = #23458#25143#20195#21495
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_NUMBER'
        Title.Caption = #26412#21378#32534#21495
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Title.Caption = #23458#25143#22411#21495
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANALYSIS_CODE_2'
        Title.Caption = #23458#25143#29289#26009#21495
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        Title.Caption = #23458#25143#35746#21333#21495
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORIG_SCHED_SHIP_DATE'
        Title.Caption = #20132#26399
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PARTS_ORDERED'
        Title.Caption = #25968#37327
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PART_PRICE'
        Title.Caption = #20215#26684
        Visible = True
      end>
  end
  object DataSource2: TDataSource
    DataSet = DM.AQ0493
    Left = 408
    Top = 97
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource2
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 448
    Top = 113
    object ppDBPipeline2ppField1: TppField
      FieldAlias = 'Company_Name'
      FieldName = 'Company_Name'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline2ppField2: TppField
      FieldAlias = 'ship_address'
      FieldName = 'ship_address'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline2ppField3: TppField
      FieldAlias = 'Company_Icon'
      FieldName = 'Company_Icon'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline2ppField4: TppField
      FieldAlias = 'SITE_INFO_ADD_1'
      FieldName = 'SITE_INFO_ADD_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline2ppField5: TppField
      FieldAlias = 'SITE_INFO_ADD_2'
      FieldName = 'SITE_INFO_ADD_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline2ppField6: TppField
      FieldAlias = 'SITE_INFO_ADD_3'
      FieldName = 'SITE_INFO_ADD_3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline2ppField7: TppField
      FieldAlias = 'SITE_INFO_PHONE'
      FieldName = 'SITE_INFO_PHONE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline2ppField8: TppField
      FieldAlias = 'Company_name2'
      FieldName = 'Company_name2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline2ppField9: TppField
      FieldAlias = 'Company_name3'
      FieldName = 'Company_name3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <
      item
        Name = 'dtpk1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'dtpk2'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'rkey10'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      
        'SELECT  data0213.RKEY,data0213.MANU_PART_NUMBER,data0213. PO_NUM' +
        'BER,data0213. ANALYSIS_CODE_2,'
      
        '              data0213.MANU_PART_DESC, data0213.ORIG_SCHED_SHIP_' +
        'DATE,data0213. ORIG_REQUEST_DATE, '
      
        '              data0213.PARTS_ORDERED, data0213.PART_PRICE,data02' +
        '13. CURR_CODE, data0213.PO_DATE,'
      
        '              data0213. status,data0213. user_ptr, data0213.subm' +
        'it_date,data0213.Parts_ordered*data0213.part_price as total_case' +
        ','
      
        '              data0213.audit_ptr,data0213.audit_date,data0213.so' +
        '_oldnew,data0213.is_alter,data0213.lis_num,'
      
        '              data0010.CUST_CODE,data0010.CUSTOMER_NAME,data0010' +
        '.ABBR_NAME,D05_1.employee_name as sales_rep_name,data0005.employ' +
        'ee_name,'
      
        '               case data0213.status when 0 then '#39#26410#25552#20132#39' when 1 the' +
        'n '#39#24050#25552#20132#39' when 2 then '#39#24050#19979#21333' '#39' when 3 then '#39#24050#23457#26680#39'  end as sstatus'
      
        'FROM      DATA0213 inner join data0010 on data0213.cust_code=dat' +
        'a0010.cust_code'
      
        '                left join data0005 D05_1 on data0010.SALES_REP_P' +
        'TR=D05_1.rkey'
      
        '                left join data0005 on data0213.audit_ptr=data000' +
        '5.rkey'
      'WHERE   Data0213.status=3'
      '      AND  Data0213.submit_date >=:dtpk1'
      '      AND  Data0213.submit_date <=:dtpk2'
      '      AND  Data0010.RKEY=:rkey10'
      '')
    Left = 344
    Top = 136
    object ADOQuery1RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQuery1MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOQuery1PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ADOQuery1ANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      Size = 80
    end
    object ADOQuery1MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ADOQuery1ORIG_SCHED_SHIP_DATE: TDateTimeField
      FieldName = 'ORIG_SCHED_SHIP_DATE'
    end
    object ADOQuery1ORIG_REQUEST_DATE: TDateTimeField
      FieldName = 'ORIG_REQUEST_DATE'
    end
    object ADOQuery1PARTS_ORDERED: TIntegerField
      FieldName = 'PARTS_ORDERED'
    end
    object ADOQuery1PART_PRICE: TFloatField
      FieldName = 'PART_PRICE'
    end
    object ADOQuery1CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADOQuery1PO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object ADOQuery1status: TWordField
      FieldName = 'status'
    end
    object ADOQuery1user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object ADOQuery1submit_date: TDateTimeField
      FieldName = 'submit_date'
    end
    object ADOQuery1total_case: TFloatField
      FieldName = 'total_case'
      ReadOnly = True
    end
    object ADOQuery1audit_ptr: TIntegerField
      FieldName = 'audit_ptr'
    end
    object ADOQuery1audit_date: TDateTimeField
      FieldName = 'audit_date'
    end
    object ADOQuery1so_oldnew: TStringField
      FieldName = 'so_oldnew'
      Size = 50
    end
    object ADOQuery1is_alter: TWordField
      FieldName = 'is_alter'
    end
    object ADOQuery1lis_num: TStringField
      FieldName = 'lis_num'
      Size = 50
    end
    object ADOQuery1sstatus: TStringField
      FieldName = 'sstatus'
      ReadOnly = True
      Size = 7
    end
    object ADOQuery1CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADOQuery1CUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object ADOQuery1ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOQuery1isNew: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'isNew'
      Calculated = True
    end
    object ADOQuery1isOld: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'isOld'
      Calculated = True
    end
    object ADOQuery1noalter: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'noalter'
      Calculated = True
    end
    object ADOQuery1isalter: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'isalter'
      Calculated = True
    end
    object ADOQuery1sales_rep_name: TStringField
      FieldName = 'sales_rep_name'
    end
    object ADOQuery1employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 408
    Top = 192
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB213
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    SaveAsTemplate = True
    Template.FileName = 'D:\SJSYS\NIERP\Report\much_soprint.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 482
    Top = 113
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB213'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 36513
      mmPrintPosition = 0
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'Company_Name'
        DataPipeline = ppDB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 4826
        mmLeft = 35983
        mmTop = 3175
        mmWidth = 55584
        BandType = 1
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #35746#21333#29983#20135#30003#35831#21333
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 18
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 7144
        mmLeft = 76200
        mmTop = 15081
        mmWidth = 44715
        BandType = 1
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'Company_Icon'
        DataPipeline = ppDB493
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDB493'
        mmHeight = 14552
        mmLeft = 1588
        mmTop = 1852
        mmWidth = 29633
        BandType = 1
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'Company_name3'
        DataPipeline = ppDB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 4826
        mmLeft = 35983
        mmTop = 8996
        mmWidth = 84201
        BandType = 1
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Order manufacture application form'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 57150
        mmTop = 23019
        mmWidth = 83079
        BandType = 1
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'TO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 2381
        mmTop = 30427
        mmWidth = 6350
        BandType = 1
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 9790
        mmTop = 31221
        mmWidth = 46567
        BandType = 1
      end
    end
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        ParentWidth = True
        mmHeight = 6879
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = #23458#25143#20195#30721
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4445
        mmLeft = 2926
        mmTop = 1058
        mmWidth = 15579
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #23458#25143#22411#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4826
        mmLeft = 29898
        mmTop = 1058
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = #35746#21333#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4826
        mmLeft = 64294
        mmTop = 1058
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #25968#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 94456
        mmTop = 1058
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = #20132#26399
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 114036
        mmTop = 1058
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = #36164#26009#29366#20917
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 150548
        mmTop = 1058
        mmWidth = 16933
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6879
        mmLeft = 20902
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6879
        mmLeft = 53711
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6879
        mmLeft = 88900
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6879
        mmLeft = 108744
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLine40: TppLine
        UserName = 'Line40'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6879
        mmLeft = 129382
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 17992
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'MANU_PART_DESC'
        DataPipeline = ppDB213
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDB213'
        mmHeight = 10033
        mmLeft = 23019
        mmTop = 4498
        mmWidth = 28321
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'CUST_CODE'
        DataPipeline = ppDB213
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDB213'
        mmHeight = 10033
        mmLeft = 1323
        mmTop = 4498
        mmWidth = 18246
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'PARTS_ORDERED'
        DataPipeline = ppDB213
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB213'
        mmHeight = 3598
        mmLeft = 90223
        mmTop = 5292
        mmWidth = 28152
        BandType = 4
      end
      object ppLine12: TppLine
        UserName = 'Line11'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 17992
        mmLeft = 0
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 17992
        mmLeft = 20902
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 17992
        mmLeft = 53711
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 17992
        mmLeft = 88900
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine17: TppLine
        UserName = 'Line17'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 17992
        mmLeft = 108744
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = 'PO_NUMBER'
        DataPipeline = ppDB213
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDB213'
        mmHeight = 10033
        mmLeft = 55038
        mmTop = 4498
        mmWidth = 32004
        BandType = 4
      end
      object ppLine41: TppLine
        UserName = 'Line41'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 17992
        mmLeft = 129382
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        AutoSize = True
        DataField = 'ORIG_REQUEST_DATE'
        DataPipeline = ppDB213
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB213'
        mmHeight = 3979
        mmLeft = 109273
        mmTop = 5027
        mmWidth = 27517
        BandType = 4
      end
      object myDBCheckBox1: TmyDBCheckBox
        UserName = 'DBCheckBox1'
        BooleanFalse = 'False'
        BooleanTrue = 'True'
        DataPipeline = ppDB213
        DataField = 'isNew'
        Transparent = True
        DataPipelineName = 'ppDB213'
        mmHeight = 6350
        mmLeft = 132027
        mmTop = 1323
        mmWidth = 6350
        BandType = 4
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = #26032#21333', '#24517#39035#38468#35748#21487#20070','#21495#30721':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 137848
        mmTop = 2381
        mmWidth = 35729
        BandType = 4
      end
      object myDBCheckBox2: TmyDBCheckBox
        UserName = 'DBCheckBox2'
        BooleanFalse = 'False'
        BooleanTrue = 'True'
        DataPipeline = ppDB213
        DataField = 'isOld'
        Transparent = True
        DataPipelineName = 'ppDB213'
        mmHeight = 6350
        mmLeft = 132027
        mmTop = 6350
        mmWidth = 6350
        BandType = 4
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = #26087#21333
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 137848
        mmTop = 7673
        mmWidth = 6350
        BandType = 4
      end
      object myDBCheckBox3: TmyDBCheckBox
        UserName = 'DBCheckBox3'
        BooleanFalse = 'False'
        BooleanTrue = 'True'
        DataPipeline = ppDB213
        DataField = 'noalter'
        Transparent = True
        DataPipelineName = 'ppDB213'
        mmHeight = 6350
        mmLeft = 145786
        mmTop = 6350
        mmWidth = 6350
        BandType = 4
      end
      object myDBCheckBox4: TmyDBCheckBox
        UserName = 'DBCheckBox4'
        BooleanFalse = 'False'
        BooleanTrue = 'True'
        DataPipeline = ppDB213
        DataField = 'isalter'
        Transparent = True
        DataPipelineName = 'ppDB213'
        mmHeight = 6350
        mmLeft = 145786
        mmTop = 11642
        mmWidth = 6350
        BandType = 4
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = #25353#20197#21069#36164#26009
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 151342
        mmTop = 7673
        mmWidth = 16087
        BandType = 4
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = #26377#23569#37327#26356#25913','#25353#38468#20214#25913#21160#36164#26009
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 151342
        mmTop = 12965
        mmWidth = 39423
        BandType = 4
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentHeight = True
        ParentWidth = True
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 17992
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'lis_num'
        DataPipeline = ppDB213
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB213'
        mmHeight = 3683
        mmLeft = 174096
        mmTop = 2381
        mmWidth = 17187
        BandType = 4
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        ParentHeight = True
        ParentWidth = True
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 17992
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 39423
      mmPrintPosition = 0
      object ppLine8: TppLine
        UserName = 'Line8'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = #20197#19978#36164#26009#24050#20132#25509#28165#26970#65292#20855#20307#20132#36135#26102#38388'24'#23567#26102#20869#20250#22238#22797#20320','#35874#35874'!'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4826
        mmLeft = 41408
        mmTop = 2117
        mmWidth = 114300
        BandType = 8
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = #36164#26009#25307#25910#20154':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 794
        mmTop = 8731
        mmWidth = 23283
        BandType = 8
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = #25509#25910#26102#38388':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 109009
        mmTop = 8731
        mmWidth = 19050
        BandType = 8
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = #20854#20182#35828#26126':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 794
        mmTop = 15081
        mmWidth = 19050
        BandType = 8
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = #21463#25511'No:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 138907
        mmTop = 27781
        mmWidth = 12361
        BandType = 8
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = #20445#23384#26399#38480':'#36710#36733#26495'16'#24180','#38750#36733#26495'3'#24180
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 138642
        mmTop = 32015
        mmWidth = 51054
        BandType = 8
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'ZH-WT-MT-001-01/00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 150548
        mmTop = 27517
        mmWidth = 34883
        BandType = 8
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 25135
        mmTop = 9525
        mmWidth = 46302
        BandType = 8
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 129117
        mmTop = 9525
        mmWidth = 46302
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'status'
      DataPipeline = ppDB213
      KeepTogether = True
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDB213'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 25929
        mmPrintPosition = 0
        object ppLabel17: TppLabel
          UserName = 'Label17'
          Caption = #22791#27880':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 3175
          mmTop = 5027
          mmWidth = 9790
          BandType = 5
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = #19994#21153'('#36319#21333')'#21592':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 12
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4826
          mmLeft = 1191
          mmTop = 19315
          mmWidth = 27517
          BandType = 5
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label11'
          Caption = #25209#20934#20154':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 12
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4826
          mmLeft = 74348
          mmTop = 19315
          mmWidth = 14817
          BandType = 5
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          Caption = #26085#26399':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 12
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4826
          mmLeft = 137716
          mmTop = 19315
          mmWidth = 10583
          BandType = 5
          GroupNo = 0
        end
        object ppLine11: TppLine
          UserName = 'Line12'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 15610
          mmLeft = 0
          mmTop = 0
          mmWidth = 1852
          BandType = 5
          GroupNo = 0
        end
        object ppLine16: TppLine
          UserName = 'Line16'
          ParentWidth = True
          Position = lpBottom
          Weight = 0.750000000000000000
          mmHeight = 3969
          mmLeft = 0
          mmTop = 11642
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object ppLine18: TppLine
          UserName = 'Line18'
          Position = lpBottom
          Weight = 0.750000000000000000
          mmHeight = 3969
          mmLeft = 29369
          mmTop = 20373
          mmWidth = 37042
          BandType = 5
          GroupNo = 0
        end
        object ppLine19: TppLine
          UserName = 'Line19'
          Position = lpBottom
          Weight = 0.750000000000000000
          mmHeight = 3969
          mmLeft = 149490
          mmTop = 20373
          mmWidth = 37042
          BandType = 5
          GroupNo = 0
        end
        object ppLine20: TppLine
          UserName = 'Line20'
          Position = lpBottom
          Weight = 0.750000000000000000
          mmHeight = 3969
          mmLeft = 89959
          mmTop = 20373
          mmWidth = 37042
          BandType = 5
          GroupNo = 0
        end
        object ppLine21: TppLine
          UserName = 'Line21'
          ParentWidth = True
          Position = lpRight
          Weight = 0.750000000000000000
          mmHeight = 15610
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object ppDBText6: TppDBText
          UserName = 'DBText6'
          AutoSize = True
          DataField = 'sales_rep_name'
          DataPipeline = ppDB213
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDB213'
          mmHeight = 3979
          mmLeft = 34925
          mmTop = 19579
          mmWidth = 17187
          BandType = 5
          GroupNo = 0
        end
        object ppDBText8: TppDBText
          UserName = 'DBText8'
          AutoSize = True
          DataField = 'employee_name'
          DataPipeline = ppDB213
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDB213'
          mmHeight = 3979
          mmLeft = 96044
          mmTop = 19579
          mmWidth = 17187
          BandType = 5
          GroupNo = 0
        end
        object ppSystemVariable1: TppSystemVariable
          UserName = 'SystemVariable1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 153194
          mmTop = 19579
          mmWidth = 17992
          BandType = 5
          GroupNo = 0
        end
      end
    end
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
    Left = 496
    Top = 192
  end
  object ppDB213: TppDBPipeline
    DataSource = DataSource1
    UserName = 'DB213'
    Left = 448
    Top = 192
  end
end
