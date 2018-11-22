object Form_voucherreport: TForm_voucherreport
  Left = 289
  Top = 203
  BorderStyle = bsSingle
  Caption = #20973#35777#25253#34920
  ClientHeight = 299
  ClientWidth = 356
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DataSource1: TDataSource
    DataSet = AQD105
    Left = 152
    Top = 96
  end
  object DataSource2: TDataSource
    DataSet = AQD106
    Left = 152
    Top = 128
  end
  object DataSource3: TDataSource
    DataSet = AQD493
    Left = 152
    Top = 160
  end
  object AQD105: TADODataSet
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT dbo.Data0105.RKEY, dbo.Data0105.VOUCHER AS '#20973#35777#32534#21495', '#13#10'      ' +
      'dbo.Data0105.FYEAR AS '#20973#35777#24180#24230', dbo.Data0105.PERIOD AS '#20973#35777#26399#38388', '#13#10'     ' +
      ' dbo.Data0105.ATTACHED AS '#38468#20214#24352#25968', '#13#10'     dbo.Data0105.BATCH_NUMBER' +
      ' AS '#38468#21152#21442#32771', '#13#10'    dbo.Data0105.ENTERED_DT AS '#21046#21333#26085#26399', '#13#10'      dbo.Dat' +
      'a0105.POSTED_DT AS '#30331#24080#26085#26399', '#13#10'      dbo.Data0005.EMPLOYEE_NAME AS '#21046 +
      #21333#20154#21592', '#13#10'      Data0005_1.EMPLOYEE_NAME AS '#20986#32435#23457#26680#20154', '#13#10'      Data0005' +
      '_2.EMPLOYEE_NAME AS '#20250#35745#23457#26680#20154', '#13#10'      Data0005_3.EMPLOYEE_NAME AS '#20027 +
      #31649#23457#26680#20154', '#13#10'      Data0005_4.EMPLOYEE_NAME AS '#30331#24080#20154#21592','#13#10'     case Data0' +
      '105.VOU_TYPE'#13#10'  when 0 then '#39#36716#24080#20973#35777#39' when 1then '#39#20184#27454#20973#35777#39' when 2 then' +
      ' '#39#25910#27454#20973#35777#39#13#10'  when 3 then '#39#25910#20184#20973#35777#39' when 4 then '#39#29305#27530#36716#24080#20973#35777#39#13#10'    end as '#20973 +
      #35777#31867#22411','#13#10'     case data0105.status'#13#10'    when 0 then '#39#26410#23457#26680#39' when 1  t' +
      'hen '#39#20250#35745#24050#23457#39' when 2 then '#39#20027#31649#24050#23457#39#13#10'    when 3 then '#39#24050#30331#24080#39' when 4 then' +
      ' '#39#20986#32435#24050#23457#39#13#10'     end as '#20973#35777#29366#24577#13#10'FROM dbo.Data0105 INNER JOIN'#13#10'      d' +
      'bo.Data0005 ON '#13#10'      dbo.Data0105.ENTERED_BY_EMPL_PTR = dbo.Da' +
      'ta0005.RKEY LEFT OUTER JOIN'#13#10'      dbo.Data0005 Data0005_4 ON '#13#10 +
      '      dbo.Data0105.POSTED_BY_EMPL_PTR = Data0005_4.RKEY LEFT OUT' +
      'ER JOIN'#13#10'      dbo.Data0005 Data0005_3 ON '#13#10'      dbo.Data0105.s' +
      'upervisor_ptr = Data0005_3.RKEY LEFT OUTER JOIN'#13#10'      dbo.Data0' +
      '005 Data0005_2 ON '#13#10'      dbo.Data0105.AUDITED_BY_EMPL_PTR = Dat' +
      'a0005_2.RKEY LEFT OUTER JOIN'#13#10'      dbo.Data0005 Data0005_1 ON d' +
      'bo.Data0105.casher_ptr = Data0005_1.RKEY'#13#10'where data0105.rkey=:r' +
      'key'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 1000
      end>
    Left = 112
    Top = 96
    object AQD105RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AQD105DSDesigner: TStringField
      FieldName = #20973#35777#32534#21495
      FixedChar = True
      Size = 12
    end
    object AQD105DSDesigner2: TIntegerField
      FieldName = #20973#35777#24180#24230
    end
    object AQD105DSDesigner3: TSmallintField
      FieldName = #20973#35777#26399#38388
    end
    object AQD105DSDesigner4: TSmallintField
      FieldName = #38468#20214#24352#25968
    end
    object AQD105DSDesigner5: TStringField
      FieldName = #38468#21152#21442#32771
      FixedChar = True
      Size = 10
    end
    object AQD105DSDesigner6: TDateTimeField
      FieldName = #21046#21333#26085#26399
    end
    object AQD105DSDesigner7: TDateTimeField
      FieldName = #30331#24080#26085#26399
    end
    object AQD105DSDesigner8: TStringField
      FieldName = #21046#21333#20154#21592
      Size = 16
    end
    object AQD105DSDesigner9: TStringField
      FieldName = #20986#32435#23457#26680#20154
      Size = 16
    end
    object AQD105DSDesigner10: TStringField
      FieldName = #20250#35745#23457#26680#20154
      Size = 16
    end
    object AQD105DSDesigner11: TStringField
      FieldName = #20027#31649#23457#26680#20154
      Size = 16
    end
    object AQD105DSDesigner12: TStringField
      FieldName = #30331#24080#20154#21592
      Size = 16
    end
    object AQD105DSDesigner13: TStringField
      FieldName = #20973#35777#31867#22411
      ReadOnly = True
      Size = 12
    end
    object AQD105DSDesigner14: TStringField
      FieldName = #20973#35777#29366#24577
      ReadOnly = True
      Size = 8
    end
  end
  object AQD106: TADODataSet
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.Data0106.DESCRIPTION AS '#25688#35201','#13#10' dbo.Data0106.REF_NU' +
      'MBER AS '#38468#21152#21442#32771','#13#10' dbo.Data0106.D_C, dbo.Data0106.AMOUNT, '#13#10'       ' +
      'case when Data0106.EXCH_RATE>0 then'#13#10'         round(1/Data0106.E' +
      'XCH_RATE,6)  else'#13#10'        0 end as exch_rate, data0106.PRICE as' +
      ' '#21407#24065#37329#39069','#13#10'Data0001.CURR_CODE as '#36135#24065#20195#30721', '#13#10'Data0001.CURR_NAME AS '#36135#24065#21517#31216 +
      ', '#13#10'dbo.Data0103.GL_ACC_NUMBER AS '#31185#30446#20195#30721', '#13#10'(CASE WHEN data0103_3.' +
      'GL_DESCRIPTION IS NOT NULL '#13#10'                      THEN data0103' +
      '_3.GL_DESCRIPTION + '#39'-'#39' + data0103_2.GL_DESCRIPTION + '#39'-'#39' + data' +
      '0103_1.GL_DESCRIPTION + '#39'-'#39' + '#39'-'#39' + data0103.GL_DESCRIPTION ELSE' +
      ' CASE WHEN'#13#10'                       data0103_2.GL_DESCRIPTION IS ' +
      'NOT NULL '#13#10'                      THEN data0103_2.GL_DESCRIPTION ' +
      '+ '#39'-'#39' + '#39'-'#39' + data0103_1.GL_DESCRIPTION + '#39'-'#39' + data0103.GL_DESC' +
      'RIPTION ELSE CASE WHEN data0103_1.GL_DESCRIPTION IS NOT'#13#10'       ' +
      '                NULL THEN data0103_1.GL_DESCRIPTION + '#39'-'#39' + data' +
      '0103.GL_DESCRIPTION ELSE data0103.GL_DESCRIPTION END END END) AS' +
      ' '#31185#30446#21517#31216#13#10'FROM         dbo.Data0106 INNER JOIN'#13#10'                   ' +
      '   dbo.Data0103 ON dbo.Data0106.GL_ACCT_NO_PTR = dbo.Data0103.RK' +
      'EY INNER JOIN'#13#10'                      dbo.Data0001 ON dbo.Data010' +
      '6.CURR_PTR = dbo.Data0001.RKEY LEFT OUTER JOIN'#13#10'                ' +
      '      dbo.Data0103 AS Data0103_1 ON dbo.Data0103.PARENT_PTR = Da' +
      'ta0103_1.RKEY LEFT OUTER JOIN'#13#10'                      dbo.Data010' +
      '3 AS Data0103_2 LEFT OUTER JOIN'#13#10'                      dbo.Data0' +
      '103 AS data0103_3 ON Data0103_2.PARENT_PTR = data0103_3.RKEY ON ' +
      'Data0103_1.PARENT_PTR = Data0103_2.RKEY'#13#10'where GL_HEADER_PTR =:r' +
      'key'
    DataSource = DataSource1
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = 1000
      end>
    Left = 112
    Top = 128
    object AQD106DSDesigner: TStringField
      FieldName = #25688#35201
      Size = 100
    end
    object AQD106DSDesigner2: TStringField
      FieldName = #38468#21152#21442#32771
      Size = 10
    end
    object AQD106D_C: TStringField
      FieldName = 'D_C'
      FixedChar = True
      Size = 1
    end
    object AQD106AMOUNT: TBCDField
      FieldName = 'AMOUNT'
      Precision = 18
      Size = 2
    end
    object AQD106EXCH_RATE: TFloatField
      FieldName = 'EXCH_RATE'
    end
    object AQD106DSDesigner3: TStringField
      FieldName = #36135#24065#20195#30721
      Size = 5
    end
    object AQD106DSDesigner4: TStringField
      FieldName = #36135#24065#21517#31216
    end
    object AQD106DSDesigner5: TStringField
      FieldName = #31185#30446#20195#30721
      FixedChar = True
      Size = 18
    end
    object AQD106Field: TStringField
      FieldKind = fkCalculated
      FieldName = #31185#30446#21517#31216
      Size = 150
      Calculated = True
    end
    object AQD106DSDesigner6: TBCDField
      FieldName = #21407#24065#37329#39069
      Precision = 14
      Size = 2
    end
  end
  object AQD493: TADODataSet
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT Company_Name as '#20844#21496#21517#31216'1, '#13#10'Company_Name2 as '#20844#21496#21517#31216'2, '#13#10'Compan' +
      'y_Name3 as '#20844#21496#21517#31216'3, '#13#10'ship_address as '#20844#21496#22320#22336','#13#10'Company_Icon as '#20844#21496#22270#26631',' +
      ' '#13#10'SITE_INFO_ADD_1 as '#20844#21496#20301#32622'1, '#13#10'SITE_INFO_ADD_2 as '#20844#21496#20301#32622'2, '#13#10'SITE_' +
      'INFO_ADD_3 as '#20844#21496#20301#32622'3, '#13#10'SITE_INFO_PHONE as '#30005#35805#13#10'FROM DATA0493'
    Parameters = <>
    Left = 112
    Top = 160
    object AQD493DSDesigner1: TStringField
      FieldName = #20844#21496#21517#31216'1'
      Size = 50
    end
    object AQD493DSDesigner2: TStringField
      FieldName = #20844#21496#21517#31216'2'
      Size = 50
    end
    object AQD493DSDesigner33: TStringField
      FieldName = #20844#21496#21517#31216'3'
      Size = 50
    end
    object AQD493DSDesigner: TStringField
      FieldName = #20844#21496#22320#22336
      Size = 50
    end
    object AQD493DSDesigner3: TBlobField
      FieldName = #20844#21496#22270#26631
    end
    object AQD493DSDesigner12: TStringField
      FieldName = #20844#21496#20301#32622'1'
      FixedChar = True
      Size = 50
    end
    object AQD493DSDesigner22: TStringField
      FieldName = #20844#21496#20301#32622'2'
      FixedChar = True
      Size = 50
    end
    object AQD493DSDesigner32: TStringField
      FieldName = #20844#21496#20301#32622'3'
      FixedChar = True
      Size = 50
    end
    object AQD493DSDesigner4: TStringField
      FieldName = #30005#35805
      FixedChar = True
      Size = 30
    end
  end
  object DB105: TppDBPipeline
    DataSource = DataSource1
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB105'
    Left = 189
    Top = 96
    object DB105ppField1: TppField
      FieldAlias = 'RKEY'
      FieldName = 'RKEY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object DB105ppField2: TppField
      FieldAlias = #20973#35777#32534#21495
      FieldName = #20973#35777#32534#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object DB105ppField3: TppField
      FieldAlias = #20973#35777#24180#24230
      FieldName = #20973#35777#24180#24230
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object DB105ppField4: TppField
      FieldAlias = #20973#35777#26399#38388
      FieldName = #20973#35777#26399#38388
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object DB105ppField5: TppField
      FieldAlias = #38468#20214#24352#25968
      FieldName = #38468#20214#24352#25968
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object DB105ppField6: TppField
      FieldAlias = #38468#21152#21442#32771
      FieldName = #38468#21152#21442#32771
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object DB105ppField7: TppField
      FieldAlias = #21046#21333#26085#26399
      FieldName = #21046#21333#26085#26399
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object DB105ppField8: TppField
      FieldAlias = #30331#24080#26085#26399
      FieldName = #30331#24080#26085#26399
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object DB105ppField9: TppField
      FieldAlias = #21046#21333#20154#21592
      FieldName = #21046#21333#20154#21592
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object DB105ppField10: TppField
      FieldAlias = #20986#32435#23457#26680#20154
      FieldName = #20986#32435#23457#26680#20154
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object DB105ppField11: TppField
      FieldAlias = #20250#35745#23457#26680#20154
      FieldName = #20250#35745#23457#26680#20154
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object DB105ppField12: TppField
      FieldAlias = #20027#31649#23457#26680#20154
      FieldName = #20027#31649#23457#26680#20154
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object DB105ppField13: TppField
      FieldAlias = #30331#24080#20154#21592
      FieldName = #30331#24080#20154#21592
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object DB105ppField14: TppField
      FieldAlias = #20973#35777#31867#22411
      FieldName = #20973#35777#31867#22411
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object DB105ppField15: TppField
      FieldAlias = #20973#35777#29366#24577
      FieldName = #20973#35777#29366#24577
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
  end
  object DB106: TppDBPipeline
    DataSource = DataSource2
    OpenDataSource = False
    UserName = 'DB106'
    Left = 189
    Top = 128
  end
  object DB493: TppDBPipeline
    DataSource = DataSource3
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 189
    Top = 160
    object DB493ppField1: TppField
      FieldAlias = #20844#21496#21517#31216'1'
      FieldName = #20844#21496#21517#31216'1'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object DB493ppField2: TppField
      FieldAlias = #20844#21496#21517#31216'2'
      FieldName = #20844#21496#21517#31216'2'
      FieldLength = 0
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object DB493ppField3: TppField
      FieldAlias = #20844#21496#21517#31216'3'
      FieldName = #20844#21496#21517#31216'3'
      FieldLength = 0
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object DB493ppField4: TppField
      FieldAlias = #20844#21496#22320#22336
      FieldName = #20844#21496#22320#22336
      FieldLength = 0
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object DB493ppField5: TppField
      FieldAlias = #20844#21496#22270#26631
      FieldName = #20844#21496#22270#26631
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object DB493ppField6: TppField
      FieldAlias = #20844#21496#20301#32622'1'
      FieldName = #20844#21496#20301#32622'1'
      FieldLength = 0
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object DB493ppField7: TppField
      FieldAlias = #20844#21496#20301#32622'2'
      FieldName = #20844#21496#20301#32622'2'
      FieldLength = 0
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object DB493ppField8: TppField
      FieldAlias = #20844#21496#20301#32622'3'
      FieldName = #20844#21496#20301#32622'3'
      FieldLength = 0
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object DB493ppField9: TppField
      FieldAlias = #30005#35805
      FieldName = #30005#35805
      FieldLength = 0
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = DB106
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 139700
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 256
    Template.FileName = 'D:\SJSYS\NIERP\REPORT\VOUCHER_REPORT.rtm'
    Units = utMillimeters
    BeforePrint = ppReport1BeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 224
    Top = 128
    Version = '7.01'
    mmColumnWidth = 203200
    DataPipelineName = 'DB106'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 24077
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = #20844#21496#21517#31216'1'
        DataPipeline = DB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'DB493'
        mmHeight = 6604
        mmLeft = 84015
        mmTop = 3704
        mmWidth = 25908
        BandType = 1
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = #20973#35777#31867#22411
        DataPipeline = DB105
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 20
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'DB105'
        mmHeight = 8255
        mmLeft = 83190
        mmTop = 11906
        mmWidth = 28617
        BandType = 1
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = #20973#35777#32534#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4763
        mmLeft = 148432
        mmTop = 9790
        mmWidth = 17992
        BandType = 1
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = #20973#35777#32534#21495
        DataPipeline = DB105
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DB105'
        mmHeight = 4868
        mmLeft = 167482
        mmTop = 9790
        mmWidth = 26077
        BandType = 1
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = #38468#20214#24352#25968':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4763
        mmLeft = 148432
        mmTop = 16140
        mmWidth = 17992
        BandType = 1
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = #38468#20214#24352#25968
        DataPipeline = DB105
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DB105'
        mmHeight = 4868
        mmLeft = 167482
        mmTop = 16140
        mmWidth = 2371
        BandType = 1
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = #21046#21333#26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 8731
        mmTop = 9790
        mmWidth = 17992
        BandType = 1
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = #21046#21333#26085#26399
        DataPipeline = DB105
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DB105'
        mmHeight = 4868
        mmLeft = 27781
        mmTop = 9790
        mmWidth = 21759
        BandType = 1
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = #20250#35745#26399#38388':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 8731
        mmTop = 16140
        mmWidth = 17992
        BandType = 1
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = #20973#35777#24180#24230
        DataPipeline = DB105
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DB105'
        mmHeight = 4868
        mmLeft = 28882
        mmTop = 16140
        mmWidth = 9483
        BandType = 1
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #24180
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 38894
        mmTop = 16140
        mmWidth = 4233
        BandType = 1
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = #20973#35777#26399#38388
        DataPipeline = DB105
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DB105'
        mmHeight = 4868
        mmLeft = 46588
        mmTop = 16140
        mmWidth = 4741
        BandType = 1
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = #26376
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 51858
        mmTop = 16404
        mmWidth = 4233
        BandType = 1
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 2910
        mmTop = 21960
        mmWidth = 195792
        BandType = 1
      end
    end
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 8731
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        ParentHeight = True
        mmHeight = 8731
        mmLeft = 0
        mmTop = 0
        mmWidth = 203465
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = #25688#35201
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 19050
        mmTop = 1852
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = #31185#30446#20195#30721
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 53446
        mmTop = 1852
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = #31185#30446#21517#31216
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 92604
        mmTop = 1852
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = #21407#24065
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 133086
        mmTop = 1852
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = #27719#29575
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 147902
        mmTop = 1852
        mmWidth = 8731
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8731
        mmLeft = 51594
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8731
        mmLeft = 75671
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8731
        mmLeft = 130969
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8731
        mmLeft = 142875
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8731
        mmLeft = 160338
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8731
        mmLeft = 182563
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = #20511#26041
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 168011
        mmTop = 1852
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = #36151#26041
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 189971
        mmTop = 1852
        mmWidth = 8731
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 7673
      mmPrintPosition = 0
      object ppLine8: TppLine
        UserName = 'Line8'
        ParentHeight = True
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 0
        mmTop = 0
        mmWidth = 203200
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = #31185#30446#20195#30721
        DataPipeline = DB106
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DB106'
        mmHeight = 4826
        mmLeft = 52917
        mmTop = 1323
        mmWidth = 8467
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = #36135#24065#20195#30721
        DataPipeline = DB106
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'DB106'
        mmHeight = 4826
        mmLeft = 134012
        mmTop = 1323
        mmWidth = 6350
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'EXCH_RATE'
        DataPipeline = DB106
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'DB106'
        mmHeight = 4868
        mmLeft = 150818
        mmTop = 1323
        mmWidth = 2371
        BandType = 4
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 0
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 51594
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine11: TppLine
        UserName = 'Line101'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 75671
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 130969
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 142875
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 160338
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 182563
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine16: TppLine
        UserName = 'Line16'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 203200
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppVariable2: TppVariable
        UserName = 'Variable2'
        CalcOrder = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 184944
        mmTop = 1323
        mmWidth = 16933
        BandType = 4
      end
      object ppVariable1: TppVariable
        UserName = 'Variable1'
        CalcOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 163777
        mmTop = 1323
        mmWidth = 16933
        BandType = 4
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        ForceJustifyLastLine = True
        KeepTogether = True
        CharWrap = True
        DataField = #25688#35201
        DataPipeline = DB106
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'DB106'
        mmHeight = 5556
        mmLeft = 1323
        mmTop = 794
        mmWidth = 48948
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo2: TppDBMemo
        UserName = 'DBMemo2'
        ForceJustifyLastLine = True
        KeepTogether = True
        CharWrap = True
        DataField = #31185#30446#21517#31216
        DataPipeline = DB106
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'DB106'
        mmHeight = 5556
        mmLeft = 76994
        mmTop = 1058
        mmWidth = 53711
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 16404
      mmPrintPosition = 0
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = #21046#21333#20154#21592':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4953
        mmLeft = 3090
        mmTop = 8731
        mmWidth = 18415
        BandType = 8
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = #21046#21333#20154#21592
        DataPipeline = DB105
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DB105'
        mmHeight = 4868
        mmLeft = 22490
        mmTop = 8731
        mmWidth = 8467
        BandType = 8
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = #20986#32435#23457#26680':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4953
        mmLeft = 40132
        mmTop = 8731
        mmWidth = 18415
        BandType = 8
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        AutoSize = True
        DataField = #20986#32435#23457#26680#20154
        DataPipeline = DB105
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DB105'
        mmHeight = 5038
        mmLeft = 59531
        mmTop = 8731
        mmWidth = 21717
        BandType = 8
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = #20250#35745#23457#26680':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4953
        mmLeft = 80349
        mmTop = 8731
        mmWidth = 18415
        BandType = 8
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        AutoSize = True
        DataField = #20250#35745#23457#26680#20154
        DataPipeline = DB105
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DB105'
        mmHeight = 4868
        mmLeft = 99484
        mmTop = 8731
        mmWidth = 12700
        BandType = 8
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = #20027#31649#23457#26680':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4953
        mmLeft = 121021
        mmTop = 8731
        mmWidth = 18415
        BandType = 8
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        AutoSize = True
        DataField = #20027#31649#23457#26680#20154
        DataPipeline = DB105
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DB105'
        mmHeight = 5038
        mmLeft = 140494
        mmTop = 8731
        mmWidth = 21717
        BandType = 8
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = #30331#24080#20154#21592':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4953
        mmLeft = 161311
        mmTop = 8731
        mmWidth = 18415
        BandType = 8
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        AutoSize = True
        DataField = #30331#24080#20154#21592
        DataPipeline = DB105
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DB105'
        mmHeight = 4868
        mmLeft = 180711
        mmTop = 8731
        mmWidth = 15071
        BandType = 8
      end
      object ppLine22: TppLine
        UserName = 'Line18'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 22490
        mmTop = 14817
        mmWidth = 17727
        BandType = 8
      end
      object ppLine23: TppLine
        UserName = 'Line23'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 59796
        mmTop = 14552
        mmWidth = 20638
        BandType = 8
      end
      object ppLine24: TppLine
        UserName = 'Line24'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 99748
        mmTop = 14552
        mmWidth = 20638
        BandType = 8
      end
      object ppLine25: TppLine
        UserName = 'Line25'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 140759
        mmTop = 14552
        mmWidth = 20638
        BandType = 8
      end
      object ppLine26: TppLine
        UserName = 'Line26'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 180446
        mmTop = 14552
        mmWidth = 20638
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 10583
      mmPrintPosition = 0
      object ppLine17: TppLine
        UserName = 'Line11'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 7144
        mmWidth = 203200
        BandType = 7
      end
      object ppVariable3: TppVariable
        UserName = 'Variable3'
        CalcOrder = 0
        DataType = dtCurrency
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4953
        mmLeft = 165100
        mmTop = 1058
        mmWidth = 17018
        BandType = 7
      end
      object ppVariable4: TppVariable
        UserName = 'Variable4'
        CalcOrder = 1
        DataType = dtCurrency
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4953
        mmLeft = 185209
        mmTop = 1058
        mmWidth = 17018
        BandType = 7
      end
      object ppLine18: TppLine
        UserName = 'Line17'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7408
        mmLeft = 0
        mmTop = 0
        mmWidth = 265
        BandType = 7
      end
      object ppLine19: TppLine
        UserName = 'Line19'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7408
        mmLeft = 160338
        mmTop = 0
        mmWidth = 265
        BandType = 7
      end
      object ppLine20: TppLine
        UserName = 'Line20'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7408
        mmLeft = 182563
        mmTop = 0
        mmWidth = 265
        BandType = 7
      end
      object ppLine21: TppLine
        UserName = 'Line201'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7408
        mmLeft = 203200
        mmTop = 0
        mmWidth = 265
        BandType = 7
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = #21512#35745#37329#39069':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4953
        mmLeft = 7408
        mmTop = 1058
        mmWidth = 18415
        BandType = 7
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'Label20'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 27517
        mmTop = 1058
        mmWidth = 14288
        BandType = 7
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060F
        5661726961626C65314F6E43616C630B50726F6772616D54797065070B747450
        726F63656475726506536F7572636506E070726F636564757265205661726961
        626C65314F6E43616C63287661722056616C75653A2056617269616E74293B0D
        0A626567696E0D0A69662044423130365B27445F43275D203D20274427207468
        656E0D0A20626567696E0D0A202056616C7565203A3D20666F726D6174666C6F
        61742827302E3030272C44423130365B27414D4F554E54275D293B0D0A202076
        61726961626C65332E76616C75653A3D7661726961626C65332E76616C75652B
        44423130365B27414D4F554E54275D3B0D0A20656E640D0A656C73650D0A2076
        616C75653A3D27273B0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506
        095661726961626C6531094576656E744E616D6506064F6E43616C6307457665
        6E74494402210001060F5472614576656E7448616E646C65720B50726F677261
        6D4E616D65060F5661726961626C65324F6E43616C630B50726F6772616D5479
        7065070B747450726F63656475726506536F7572636506E170726F6365647572
        65205661726961626C65324F6E43616C63287661722056616C75653A20566172
        69616E74293B0D0A626567696E0D0A69662044423130365B27445F43275D3D27
        4327207468656E0D0A20626567696E0D0A202056616C7565203A3D20666F726D
        6174666C6F61742827302E3030272C44423130365B27414D4F554E54275D293B
        0D0A20207661726961626C65342E76616C75653A3D7661726961626C65342E76
        616C75652B44423130365B27414D4F554E54275D3B0D0A20656E640D0A20656C
        73650D0A2076616C75653A3D27273B0D0A0D0A656E643B0D0A0D436F6D706F6E
        656E744E616D6506095661726961626C6532094576656E744E616D6506064F6E
        43616C63074576656E74494402210000}
    end
  end
  object ppDesigner1: TppDesigner
    AllowDataSettingsChange = True
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
    Left = 224
    Top = 160
  end
end
