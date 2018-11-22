object Form_report: TForm_report
  Left = 318
  Top = 158
  Width = 459
  Height = 311
  Caption = #25253#34920#25171#21360
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 107
    Top = 19
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline3
    PrinterSetup.BinName = #26222#36890#32440
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297127
    PrinterSetup.mmPaperWidth = 210079
    PrinterSetup.PaperSize = 9
    Template.FileName = 'Y:\NIERP\Report\contract_control_rpt.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 393
    Top = 53
    Version = '7.01'
    mmColumnWidth = 197379
    DataPipelineName = 'ppDBPipeline3'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 95250
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 2117
        mmTop = 34925
        mmWidth = 194469
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 2117
        mmTop = 61119
        mmWidth = 194469
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 2117
        mmTop = 94986
        mmWidth = 194469
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 60061
        mmTop = 42069
        mmWidth = 136525
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 2117
        mmTop = 48948
        mmWidth = 194469
        BandType = 0
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        Weight = 0.750000000000000000
        mmHeight = 3440
        mmLeft = 2117
        mmTop = 55298
        mmWidth = 194469
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 60590
        mmLeft = 2117
        mmTop = 34925
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #36865#23457#20154#23457#26680#24847#35265':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2646
        mmTop = 61913
        mmWidth = 34396
        BandType = 0
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 60590
        mmLeft = 194734
        mmTop = 34925
        mmWidth = 2117
        BandType = 0
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 14023
        mmLeft = 59796
        mmTop = 34925
        mmWidth = 12965
        BandType = 0
      end
      object ppLine16: TppLine
        UserName = 'Line16'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 83079
        mmTop = 55563
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = #21512#20316#23458#25143#21517#31216
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 12700
        mmTop = 38894
        mmWidth = 42863
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = #21512#21516#21517#31216':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2646
        mmTop = 50006
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = #21512#21516#36865#23457#37096#38376':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2646
        mmTop = 56886
        mmWidth = 27781
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = #21512#21516#23457#26680#34920
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6615
        mmLeft = 84402
        mmTop = 15346
        mmWidth = 32544
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Contract review form'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 83344
        mmTop = 22754
        mmWidth = 35264
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = #26085' '#26399' :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 134673
        mmTop = 30163
        mmWidth = 16669
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = #22270#29255
        DataPipeline = ppDBPipeline2
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 12965
        mmLeft = 7673
        mmTop = 1323
        mmWidth = 42863
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = #20013#25991#21517#31216
        DataPipeline = ppDBPipeline2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 3810
        mmLeft = 50271
        mmTop = 6350
        mmWidth = 71438
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = #33521#25991#21517#31216
        DataPipeline = ppDBPipeline2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 3440
        mmLeft = 48948
        mmTop = 10583
        mmWidth = 75936
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = #30002#26041#65288#23458#25143#65289#21517#31216
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 5027
        mmLeft = 61383
        mmTop = 35983
        mmWidth = 130440
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = #30002#26041#65288#23458#25143#65289#21517#31216'en'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 5027
        mmLeft = 61383
        mmTop = 43392
        mmWidth = 130440
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = #21512#21516#21517#31216
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 5027
        mmLeft = 21960
        mmTop = 49742
        mmWidth = 170392
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = #36865#23457#20154#37096#38376
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 5027
        mmLeft = 83873
        mmTop = 55827
        mmWidth = 66940
        BandType = 0
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = #36865#23457#20154#24847#35265
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 23813
        mmLeft = 2646
        mmTop = 66411
        mmWidth = 193675
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = #36865#23457#20154
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 142346
        mmTop = 90488
        mmWidth = 15346
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = #25552#20132#26085#26399
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 157957
        mmTop = 90488
        mmWidth = 34660
        BandType = 0
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        DataField = #25552#20132#26085#26399
        DataPipeline = ppDBPipeline1
        DisplayFormat = 'yyyy'#24180'mm'#26376'dd'#26085
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 152929
        mmTop = 30163
        mmWidth = 43921
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #31614#21517':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 130440
        mmTop = 90488
        mmWidth = 11642
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 31750
      mmPrintPosition = 0
      object ppLine9: TppLine
        UserName = 'Line9'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 2117
        mmTop = 29369
        mmWidth = 194469
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'employee_name'
        DataPipeline = ppDBPipeline3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline3'
        mmHeight = 3969
        mmLeft = 140759
        mmTop = 27252
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'check_time'
        DataPipeline = ppDBPipeline3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline3'
        mmHeight = 3969
        mmLeft = 158221
        mmTop = 27252
        mmWidth = 38365
        BandType = 4
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #31614#21517':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 128588
        mmTop = 27252
        mmWidth = 11642
        BandType = 4
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 31750
        mmLeft = 2117
        mmTop = 0
        mmWidth = 5821
        BandType = 4
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 31750
        mmLeft = 183621
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'd34_index'
        DataPipeline = ppDBPipeline3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline3'
        mmHeight = 4233
        mmLeft = 2381
        mmTop = 0
        mmWidth = 5821
        BandType = 4
      end
      object ppLabel2: TppLabel
        UserName = 'Label101'
        Caption = #23457#37096#38376':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 8467
        mmTop = 0
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'dept_name'
        DataPipeline = ppDBPipeline3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline3'
        mmHeight = 4233
        mmLeft = 24606
        mmTop = 0
        mmWidth = 27781
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'check_suggestion'
        DataPipeline = ppDBPipeline3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBPipeline3'
        mmHeight = 27517
        mmLeft = 2381
        mmTop = 3969
        mmWidth = 193940
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = #21463#25511' No:DG-COP-5.2-05-01/00       '#20445#23384'3'#24180
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4498
        mmLeft = 111654
        mmTop = 0
        mmWidth = 83873
        BandType = 8
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
    Left = 369
    Top = 197
  end
  object ADOQuery2: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select company_name as '#20013#25991#21517#31216',company_name2 as '#33521#25991#21517#31216','
      'Company_Icon as '#22270#29255' from data0493')
    Left = 41
    Top = 203
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 108
    Top = 205
  end
  object ppDBPipeline2: TppDBPipeline
    DataSource = DataSource2
    UserName = 'DBPipeline2'
    Left = 182
    Top = 203
    object ppDBPipeline2ppField1: TppField
      FieldAlias = #20013#25991#21517#31216
      FieldName = #20013#25991#21517#31216
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPipeline2ppField2: TppField
      FieldAlias = #33521#25991#21517#31216
      FieldName = #33521#25991#21517#31216
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppDBPipeline2ppField3: TppField
      FieldAlias = #22270#29255
      FieldName = #22270#29255
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 2
      Searchable = False
      Sortable = False
    end
  end
  object DataSource3: TDataSource
    DataSet = ADODataSet2
    Left = 107
    Top = 97
  end
  object ADODataSet1: TADODataSet
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select a.rkey,isnull(a.submit_person,0) as submit_person,'#13#10'isnul' +
      'l(a.submit_department,0) as submit_department,'#13#10'isnull(a.check_s' +
      'tatus,0) as check_status,'#13#10'isnull(a.circle,0) as circle,'#13#10'check_' +
      'type,'#13#10'row_number() over(order by a.rkey ) as '#24207#21495','#13#10'contract_numb' +
      'er as '#21512#21516#32534#21495','#13#10'contract_name as '#21512#21516#21517#31216','#13#10'part_A_name_ch as ['#30002#26041#65288#23458#25143#65289#21517#31216 +
      '],'#13#10'part_A_name_en as ['#30002#26041#65288#23458#25143#65289#21517#31216'en],'#13#10'submit_date  as '#25552#20132#26085#26399','#13#10'(sel' +
      'ect dept_name from data0034 where rkey=a.submit_department) as  ' +
      #36865#23457#20154#37096#38376' ,'#13#10'isnull((select employee_name from data0005 where rkey=a' +
      '.submit_person),'#39#39') as '#36865#23457#20154','#13#10'submit_suggestion as '#36865#23457#20154#24847#35265','#13#10'case w' +
      'hen ( check_status=0  and circle=1 ) then'#39#26410#25552#20132#39#13#10'         when  (' +
      ' check_status=0  and circle>1 ) then '#39#24453#37325#25552#20132#39#13#10'         when   che' +
      'ck_status=1 then '#39#24453#23457#26680#39#13#10'         when  check_status=2 then  '#39#20840#37096#36890 +
      #36807#23457#26680#39' end as '#29366#24577','#13#10'submit_suggestion,'#13#10'remark, party_a from  data0' +
      '696 a'#13#10'where a.rkey= :rkey696'#13#10
    IndexFieldNames = 'rkey'
    Parameters = <
      item
        Name = 'rkey696'
        Size = -1
        Value = Null
      end>
    Left = 36
    Top = 27
    object ADODataSet1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADODataSet1submit_person: TIntegerField
      FieldName = 'submit_person'
      ReadOnly = True
    end
    object ADODataSet1submit_department: TIntegerField
      FieldName = 'submit_department'
      ReadOnly = True
    end
    object ADODataSet1check_status: TIntegerField
      FieldName = 'check_status'
      ReadOnly = True
    end
    object ADODataSet1circle: TIntegerField
      FieldName = 'circle'
      ReadOnly = True
    end
    object ADODataSet1check_type: TIntegerField
      FieldName = 'check_type'
    end
    object ADODataSet1DSDesigner: TLargeintField
      FieldName = #24207#21495
      ReadOnly = True
    end
    object ADODataSet1DSDesigner2: TWideStringField
      FieldName = #21512#21516#32534#21495
      Size = 15
    end
    object ADODataSet1DSDesigner3: TWideStringField
      FieldName = #21512#21516#21517#31216
      Size = 100
    end
    object ADODataSet1DSDesigner4: TWideStringField
      FieldName = #30002#26041#65288#23458#25143#65289#21517#31216
      Size = 100
    end
    object ADODataSet1en: TWideStringField
      FieldName = #30002#26041#65288#23458#25143#65289#21517#31216'en'
      Size = 50
    end
    object ADODataSet1DSDesigner5: TDateTimeField
      FieldName = #25552#20132#26085#26399
    end
    object ADODataSet1DSDesigner6: TStringField
      FieldName = #36865#23457#20154#37096#38376
      ReadOnly = True
      Size = 30
    end
    object ADODataSet1DSDesigner7: TStringField
      FieldName = #36865#23457#20154
      ReadOnly = True
      Size = 16
    end
    object ADODataSet1DSDesigner8: TMemoField
      FieldName = #36865#23457#20154#24847#35265
      BlobType = ftMemo
    end
    object ADODataSet1DSDesigner9: TStringField
      FieldName = #29366#24577
      ReadOnly = True
      Size = 12
    end
    object ADODataSet1submit_suggestion: TMemoField
      FieldName = 'submit_suggestion'
      BlobType = ftMemo
    end
    object ADODataSet1remark: TMemoField
      FieldName = 'remark'
      BlobType = ftMemo
    end
    object ADODataSet1party_a: TIntegerField
      FieldName = 'party_a'
    end
  end
  object ADODataSet2: TADODataSet
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select a.rkey,a.d696_ptr,d34_index,d34_ptr,check_person,check_st' +
      'atus,'#13#10'check_time,check_suggestion,b.employee_name,c.dept_name ,' +
      #13#10'case when isnull(check_status,0)=0 and isnull(check_person,0)=' +
      '0 then '#39#26410#23457#26680#39' '#13#10'        when isnull(check_status,0)=0 and isnull(' +
      'check_person,0)<>0 then '#39#24453#37325#23457#39#13#10'       when isnull(check_status,0' +
      ')=1  then '#39#24050#23457#26680#39' else '#39#26410#30693#39' end as ['#29366#24577']'#13#10'from data0693 a left join' +
      ' data0005 b on a.check_person=b.rkey'#13#10' left join data0034 c on a' +
      '.d34_ptr=c.rkey'#13#10'where d696_ptr=:rkey'#13#10
    DataSource = DataSource1
    IndexFieldNames = 'd34_index'
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 37
    Top = 94
    object ADODataSet2rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADODataSet2d696_ptr: TIntegerField
      FieldName = 'd696_ptr'
    end
    object ADODataSet2d34_index: TIntegerField
      FieldName = 'd34_index'
    end
    object ADODataSet2d34_ptr: TIntegerField
      FieldName = 'd34_ptr'
    end
    object ADODataSet2check_person: TIntegerField
      FieldName = 'check_person'
    end
    object ADODataSet2check_status: TIntegerField
      FieldName = 'check_status'
    end
    object ADODataSet2check_time: TDateTimeField
      FieldName = 'check_time'
    end
    object ADODataSet2check_suggestion: TMemoField
      FieldName = 'check_suggestion'
      BlobType = ftMemo
    end
    object ADODataSet2employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object ADODataSet2dept_name: TStringField
      FieldName = 'dept_name'
      Size = 30
    end
    object ADODataSet2DSDesigner: TStringField
      FieldName = #29366#24577
      ReadOnly = True
      Size = 6
    end
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = DataSource1
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DBPipeline1'
    Left = 174
    Top = 21
    object ppDBPipeline1ppField1: TppField
      FieldAlias = 'rkey'
      FieldName = 'rkey'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField2: TppField
      FieldAlias = 'submit_person'
      FieldName = 'submit_person'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField3: TppField
      FieldAlias = 'submit_department'
      FieldName = 'submit_department'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField4: TppField
      FieldAlias = 'check_status'
      FieldName = 'check_status'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField5: TppField
      FieldAlias = 'circle'
      FieldName = 'circle'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField6: TppField
      FieldAlias = 'check_type'
      FieldName = 'check_type'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField7: TppField
      FieldAlias = #24207#21495
      FieldName = #24207#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField8: TppField
      FieldAlias = #21512#21516#32534#21495
      FieldName = #21512#21516#32534#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField9: TppField
      FieldAlias = #21512#21516#21517#31216
      FieldName = #21512#21516#21517#31216
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField10: TppField
      FieldAlias = #30002#26041#65288#23458#25143#65289#21517#31216
      FieldName = #30002#26041#65288#23458#25143#65289#21517#31216
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField11: TppField
      FieldAlias = #30002#26041#65288#23458#25143#65289#21517#31216'en'
      FieldName = #30002#26041#65288#23458#25143#65289#21517#31216'en'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField12: TppField
      FieldAlias = #25552#20132#26085#26399
      FieldName = #25552#20132#26085#26399
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField13: TppField
      FieldAlias = #36865#23457#20154#37096#38376
      FieldName = #36865#23457#20154#37096#38376
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField14: TppField
      FieldAlias = #36865#23457#20154
      FieldName = #36865#23457#20154
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField15: TppField
      FieldAlias = #36865#23457#20154#24847#35265
      FieldName = #36865#23457#20154#24847#35265
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField16: TppField
      FieldAlias = #29366#24577
      FieldName = #29366#24577
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField17: TppField
      FieldAlias = 'submit_suggestion'
      FieldName = 'submit_suggestion'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField18: TppField
      FieldAlias = 'remark'
      FieldName = 'remark'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField19: TppField
      FieldAlias = 'party_a'
      FieldName = 'party_a'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
  end
  object ppDBPipeline3: TppDBPipeline
    DataSource = DataSource3
    UserName = 'DBPipeline3'
    Left = 177
    Top = 100
    MasterDataPipelineName = 'ppDBPipeline1'
    object ppDBPipeline3ppField1: TppField
      FieldAlias = 'rkey'
      FieldName = 'rkey'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline3ppField2: TppField
      FieldAlias = 'd696_ptr'
      FieldName = 'd696_ptr'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline3ppField3: TppField
      FieldAlias = 'd34_index'
      FieldName = 'd34_index'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline3ppField4: TppField
      FieldAlias = 'd34_ptr'
      FieldName = 'd34_ptr'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline3ppField5: TppField
      FieldAlias = 'check_person'
      FieldName = 'check_person'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline3ppField6: TppField
      FieldAlias = 'check_status'
      FieldName = 'check_status'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline3ppField7: TppField
      FieldAlias = 'check_time'
      FieldName = 'check_time'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline3ppField8: TppField
      FieldAlias = 'check_suggestion'
      FieldName = 'check_suggestion'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline3ppField9: TppField
      FieldAlias = 'employee_name'
      FieldName = 'employee_name'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline3ppField10: TppField
      FieldAlias = 'dept_name'
      FieldName = 'dept_name'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline3ppField11: TppField
      FieldAlias = #29366#24577
      FieldName = #29366#24577
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
  end
end
