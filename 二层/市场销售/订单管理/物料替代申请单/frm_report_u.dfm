object Form_report: TForm_report
  Left = 357
  Top = 295
  Width = 491
  Height = 403
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
  object ADODataSet2: TADODataSet
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select a.rkey,a.d541_ptr,d34_index,d34_ptr,check_person,check_st' +
      'atus,'#13#10'check_time,check_suggestion,b.employee_name,c.dept_name ,' +
      #13#10'case when isnull(check_status,0)=0 and isnull(check_person,0)=' +
      '0 then '#39#26410#23457#26680#39' '#13#10'        when isnull(check_status,0)=0 and isnull(' +
      'check_person,0)<>0 then '#39#24453#37325#23457#39#13#10'       when isnull(check_status,0' +
      ')=1  then '#39#24050#23457#26680#39' else '#39#26410#30693#39' end as ['#29366#24577']'#13#10'from data0545 a left join' +
      ' data0005 b on a.check_person=b.rkey'#13#10' left join data0034 c on a' +
      '.d34_ptr=c.rkey'#13#10'where d541_ptr=:rkey'
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
    object ADODataSet2d541_ptr: TIntegerField
      FieldName = 'd541_ptr'
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
    object ADODataSet2employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object ADODataSet2check_suggestion: TMemoField
      FieldName = 'check_suggestion'
      BlobType = ftMemo
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
  object ADODataSet1: TADODataSet
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'SELECT    data0541.rkey, dbo.Data0017.INV_PART_NUMBER, dbo.Data0' +
      '017.INV_PART_DESCRIPTION, dbo.Data0017.INV_NAME, dbo.Data0541.MA' +
      'TERIAL_REPLACE_NO, '#13#10'                      dbo.Data0541.remark, ' +
      'dbo.Data0541.QUAN_ON_HAND, dbo.Data0541.submit_date, dbo.Data054' +
      '1.d05_ptr, dbo.Data0025.MANU_PART_NUMBER, data0541.beizhu,'#13#10'    ' +
      '                  dbo.Data0025.MANU_PART_DESC, dbo.Data0010.CUST' +
      '_CODE,dbo.Data0005.EMPLOYEE_NAME,data0541.reason'#13#10#13#10'FROM        ' +
      ' dbo.Data0541 INNER JOIN'#13#10'                      dbo.Data0017 ON ' +
      'dbo.Data0541.INVT_PTR = dbo.Data0017.RKEY INNER JOIN'#13#10'          ' +
      '             dbo.Data0025 ON dbo.Data0541.d25_rkey = dbo.Data002' +
      '5.RKEY INNER JOIN'#13#10'                      dbo.Data0010 ON dbo.Dat' +
      'a0025.CUSTOMER_PTR = dbo.Data0010.RKEY INNER JOIN'#13#10'             ' +
      '         dbo.Data0005 ON dbo.Data0541.d05_ptr = dbo.Data0005.RKE' +
      'Y'#13#10'where data0541.rkey=:rkey1'
    IndexFieldNames = 'rkey'
    Parameters = <
      item
        Name = 'rkey1'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 36
    Top = 27
    object ADODataSet1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADODataSet1INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADODataSet1INV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object ADODataSet1INV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ADODataSet1MATERIAL_REPLACE_NO: TStringField
      FieldName = 'MATERIAL_REPLACE_NO'
      Size = 10
    end
    object ADODataSet1remark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
    object ADODataSet1QUAN_ON_HAND: TFloatField
      FieldName = 'QUAN_ON_HAND'
    end
    object ADODataSet1submit_date: TDateTimeField
      FieldName = 'submit_date'
    end
    object ADODataSet1d05_ptr: TIntegerField
      FieldName = 'd05_ptr'
    end
    object ADODataSet1MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADODataSet1beizhu: TWideStringField
      FieldName = 'beizhu'
    end
    object ADODataSet1MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ADODataSet1CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADODataSet1EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADODataSet1reason: TWideStringField
      FieldName = 'reason'
      Size = 50
    end
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 107
    Top = 19
  end
  object DataSource3: TDataSource
    DataSet = ADODataSet2
    Left = 107
    Top = 97
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
  object ppDBPipeline3: TppDBPipeline
    DataSource = DataSource3
    UserName = 'DBPipeline3'
    Left = 177
    Top = 100
    MasterDataPipelineName = 'ppDBPipeline1'
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = DataSource1
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DBPipeline1'
    Left = 174
    Top = 21
    object ppDBPipeline1ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'rkey'
      FieldName = 'rkey'
      FieldLength = 0
      DataType = dtLongint
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      FieldAlias = 'INV_PART_NUMBER'
      FieldName = 'INV_PART_NUMBER'
      FieldLength = 25
      DisplayWidth = 25
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      FieldAlias = 'INV_PART_DESCRIPTION'
      FieldName = 'INV_PART_DESCRIPTION'
      FieldLength = 100
      DisplayWidth = 100
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      FieldAlias = 'INV_NAME'
      FieldName = 'INV_NAME'
      FieldLength = 30
      DisplayWidth = 30
      Position = 3
    end
    object ppDBPipeline1ppField5: TppField
      FieldAlias = 'MATERIAL_REPLACE_NO'
      FieldName = 'MATERIAL_REPLACE_NO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 4
    end
    object ppDBPipeline1ppField6: TppField
      FieldAlias = 'remark'
      FieldName = 'remark'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object ppDBPipeline1ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUAN_ON_HAND'
      FieldName = 'QUAN_ON_HAND'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppDBPipeline1ppField8: TppField
      FieldAlias = 'submit_date'
      FieldName = 'submit_date'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 7
    end
    object ppDBPipeline1ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'd05_ptr'
      FieldName = 'd05_ptr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 8
    end
    object ppDBPipeline1ppField10: TppField
      FieldAlias = 'MANU_PART_NUMBER'
      FieldName = 'MANU_PART_NUMBER'
      FieldLength = 20
      DisplayWidth = 20
      Position = 9
    end
    object ppDBPipeline1ppField11: TppField
      FieldAlias = 'MANU_PART_DESC'
      FieldName = 'MANU_PART_DESC'
      FieldLength = 80
      DisplayWidth = 80
      Position = 10
    end
    object ppDBPipeline1ppField12: TppField
      FieldAlias = 'CUST_CODE'
      FieldName = 'CUST_CODE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 11
    end
    object ppDBPipeline1ppField14: TppField
      FieldAlias = 'beizhu'
      FieldName = 'beizhu'
      FieldLength = 10
      DisplayWidth = 10
      Position = 12
    end
    object ppDBPipeline1ppField15: TppField
      FieldAlias = 'EMPLOYEE_NAME'
      FieldName = 'EMPLOYEE_NAME'
      FieldLength = 10
      DisplayWidth = 10
      Position = 13
    end
    object ppDBPipeline1ppField16: TppField
      FieldAlias = 'reason'
      FieldName = 'reason'
      FieldLength = 10
      DisplayWidth = 10
      Position = 14
    end
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
    Template.FileName = 'D:\SJSYS\NIERP\Report\tiliaodan.rtm'
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
      object ppLine11: TppLine
        UserName = 'Line11'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 2117
        mmTop = 48683
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
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = #29289#26009#26367#20195#30003#35831#21333
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6646
        mmLeft = 80675
        mmTop = 15346
        mmWidth = 40005
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
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'remark'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 12700
        mmLeft = 2646
        mmTop = 77788
        mmWidth = 193675
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'EMPLOYEE_NAME'
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
        mmLeft = 143140
        mmTop = 90488
        mmWidth = 29898
        BandType = 0
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        DataField = 'submit_date'
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
        Caption = #25552#20132#20154':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 130440
        mmTop = 90488
        mmWidth = 11642
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 2381
        mmTop = 42069
        mmWidth = 194469
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #26367#20195#21333#21495#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 2381
        mmTop = 29633
        mmWidth = 17780
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'MATERIAL_REPLACE_NO'
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
        mmLeft = 21167
        mmTop = 29633
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label2'
        Caption = #26367#20195#26448#26009#32534#30721#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 3440
        mmTop = 37306
        mmWidth = 24892
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'INV_PART_NUMBER'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 31485
        mmTop = 37306
        mmWidth = 34036
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label4'
        Caption = #26367#20195#26448#26009#21517#31216#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 3175
        mmTop = 43921
        mmWidth = 24892
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'INV_NAME'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 31485
        mmTop = 44186
        mmWidth = 17907
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label6'
        Caption = #26367#20195#26448#26009#35268#26684#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 3175
        mmTop = 50800
        mmWidth = 24892
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'INV_PART_DESCRIPTION'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 31485
        mmTop = 50800
        mmWidth = 42884
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label8'
        Caption = #26412#21378#32534#21495#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 88900
        mmTop = 37042
        mmWidth = 24342
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label9'
        Caption = #23458#25143#22411#21495#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 88636
        mmTop = 43392
        mmWidth = 24077
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'MANU_PART_NUMBER'
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
        mmLeft = 114829
        mmTop = 37042
        mmWidth = 48683
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'MANU_PART_DESC'
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
        mmLeft = 114829
        mmTop = 43921
        mmWidth = 48154
        BandType = 0
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 2381
        mmTop = 66411
        mmWidth = 194469
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label16'
        Caption = #23458#25143#20195#30721#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 88106
        mmTop = 56886
        mmWidth = 23548
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 2381
        mmTop = 71702
        mmWidth = 194469
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label17'
        Caption = #37197#39069#25968#37327#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 3440
        mmTop = 67469
        mmWidth = 23283
        BandType = 0
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        AutoSize = True
        DataField = 'QUAN_ON_HAND'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 31221
        mmTop = 67469
        mmWidth = 29295
        BandType = 0
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'CUST_CODE'
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
        mmLeft = 115094
        mmTop = 56621
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label18'
        Caption = #26367#26009#20379#24212#21830#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 3175
        mmTop = 56356
        mmWidth = 24871
        BandType = 0
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        AutoSize = True
        DataField = 'beizhu'
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
        mmLeft = 31221
        mmTop = 56621
        mmWidth = 27517
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label19'
        Caption = #35746#21333#25968#37327#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 3440
        mmTop = 61913
        mmWidth = 23813
        BandType = 0
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        AutoSize = True
        DataField = 'PARTS_RETURNED'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4022
        mmLeft = 31221
        mmTop = 61913
        mmWidth = 32935
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label10'
        Caption = 'MI'#21442#25968
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 3175
        mmTop = 71967
        mmWidth = 15346
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 2381
        mmTop = 77258
        mmWidth = 194469
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
        Caption = #21463#25511' No:WT-COP-5.2-03-01/00       '#20445#23384'3'#24180
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4022
        mmLeft = 127159
        mmTop = 0
        mmWidth = 68368
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
end
