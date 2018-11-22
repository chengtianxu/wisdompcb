object Form_report: TForm_report
  Left = 330
  Top = 236
  Width = 506
  Height = 448
  Caption = #25253#34920#25171#21360
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
  object ads273: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT Data0273.ENTERED_DATE as '#21019#24314#26085#26399','#13#10' Data0273.VERIFIED_DATE a' +
      's '#23457#26680#26085#26399', '#13#10' Data0273.TEXT1 as '#22312#32447#20135#21697#22788#29702#26041#27861', Data0273.TEXT3  as '#25104#21697#24211#23384#22788#29702 +
      #26041#27861', '#13#10' Data0273.TEXT4 as '#20998#21457#37096#38376', Data0273.ECN_NO as ECN'#32534#21495', '#13#10'Data0' +
      '273.text as '#21464#26356#20869#23481',Data0273.remark as '#22791#27880', '#13#10'    Data0273.last_modi' +
      '_date as '#26368#21518#20462#25913#26085#26399', '#13#10'   Data0273.ECNB1 as '#21464#26356#21069#20540'1,Data0273.ECNB2 as ' +
      #21464#26356#21069#20540'2, '#13#10'   Data0273.ECNB3 as '#21464#26356#21069#20540'3, Data0273.ECNB4 as '#21464#26356#21069#20540'4,  '#13 +
      #10'  Data0273.ECNB5 as '#21464#26356#21069#20540'5, Data0273.ECNA1 as '#21464#26356#21518#20540'1, '#13#10'Data0273.' +
      'ECNA2 as '#21464#26356#21518#20540'2, Data0273.ECNA3 as '#21464#26356#21518#20540'3,'#13#10'Data0273.ECNA4 as '#21464#26356#21518#20540 +
      '4,Data0273.ECNA5 as '#21464#26356#21518#20540'5,'#13#10'Data0010.CUST_CODE as '#23458#25143#20195#30721', Data0010' +
      '.CUSTOMER_NAME as '#23458#25143#21517#31216','#13#10'     Data0005.EMPLOYEE_NAME as '#21019#24314#20154#21592', '#13#10 +
      '      Data0005_2.EMPLOYEE_NAME AS '#26368#21518#20462#25913#20154#21592', '#13#10'      Data0005_1.EMP' +
      'LOYEE_NAME AS '#23457#26680#20154#21592', '#13#10'      Data0025_1.MANU_PART_NUMBER as '#21464#26356#21069#26412#21378 +
      #32534#21495', '#13#10'      Data0025_1.MANU_PART_DESC  as '#21464#26356#21069#23458#25143#22411#21495', '#13#10'      Data0' +
      '025.MANU_PART_NUMBER AS '#21464#26356#21518#26412#21378#32534#21495', '#13#10'      Data0025.MANU_PART_DESC' +
      ' AS '#21464#26356#21518#23458#25143#22411#21495','#13#10'case Data0273.STATUS when 0 then '#39#26410#25552#20132#39' '#13#10'         ' +
      '                                when 1 then '#39#24453#32467#26696#39#13#10'             ' +
      '                            when 2 then '#39#24050#32467#26696#39' end as '#29366#24577','#13#10'case d' +
      'ata0273.source when 1 then '#39#20869#37096#21464#26356#39' when 2 then '#39#22806#37096#21464#26356#39' end as '#20449#24687#26469#28304 +
      ','#13#10'case data0273.tooling_close '#13#10' when 1 then '#39#37327#20135#36716#37327#20135#39' '#13#10' when 2 ' +
      'then '#39#37327#20135#36716#26679#26495#39#13#10' when 3 then '#39#26679#26495#36716#26679#26495#39#13#10' when 4 then '#39#26679#26495#36716#37327#20135#39' end as ' +
      #36716#25442#31867#22411','#13#10'case data0273.ecnstart '#13#10' when 0 then '#39#31435#21363#29983#25928#39#13#10' when 1 the' +
      'n '#39#19979#25209#29983#25928#39#13#10'end as '#29983#25928#26085#26399',Data0273.CUSTOMER_PART_PTR'#13#10'FROM dbo.Data0' +
      '273 INNER JOIN'#13#10'      dbo.Data0010 ON dbo.Data0273.CUSTOMER_PTR ' +
      '= dbo.Data0010.RKEY INNER JOIN'#13#10'      dbo.Data0005 ON dbo.Data02' +
      '73.ENTERED_BY = dbo.Data0005.RKEY INNER JOIN'#13#10'      dbo.Data0025' +
      ' ON '#13#10'      dbo.Data0273.CUSTOMER_PART_PTR = dbo.Data0025.RKEY I' +
      'NNER JOIN'#13#10'      dbo.Data0025 Data0025_1 ON '#13#10'      dbo.Data0273' +
      '.COPYFROMCUST_PTR = Data0025_1.RKEY LEFT OUTER JOIN'#13#10'      dbo.D' +
      'ata0005 Data0005_2 ON '#13#10'      dbo.Data0273.last_modi_by_ptr = Da' +
      'ta0005_2.RKEY LEFT OUTER JOIN'#13#10'      dbo.Data0005 Data0005_1 ON ' +
      'dbo.Data0273.VERIFIED_BY = Data0005_1.RKEY'#13#10'where data0273.rkey=' +
      ':rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 72
    Top = 40
    object ads273DSDesigner: TDateTimeField
      FieldName = #21019#24314#26085#26399
    end
    object ads273DSDesigner2: TDateTimeField
      FieldName = #23457#26680#26085#26399
    end
    object ads273DSDesigner3: TStringField
      FieldName = #22312#32447#20135#21697#22788#29702#26041#27861
      Size = 70
    end
    object ads273DSDesigner4: TStringField
      FieldName = #25104#21697#24211#23384#22788#29702#26041#27861
      Size = 70
    end
    object ads273DSDesigner5: TStringField
      FieldName = #20998#21457#37096#38376
      Size = 200
    end
    object ads273ECN: TStringField
      FieldName = 'ECN'#32534#21495
      Size = 10
    end
    object ads273DSDesigner6: TStringField
      FieldName = #21464#26356#20869#23481
      Size = 500
    end
    object ads273DSDesigner7: TStringField
      FieldName = #22791#27880
      Size = 200
    end
    object ads273DSDesigner8: TDateTimeField
      FieldName = #26368#21518#20462#25913#26085#26399
    end
    object ads273DSDesigner1: TStringField
      FieldName = #21464#26356#21069#20540'1'
      Size = 100
    end
    object ads273DSDesigner22: TStringField
      FieldName = #21464#26356#21069#20540'2'
      Size = 100
    end
    object ads273DSDesigner32: TStringField
      FieldName = #21464#26356#21069#20540'3'
      Size = 100
    end
    object ads273DSDesigner42: TStringField
      FieldName = #21464#26356#21069#20540'4'
      Size = 100
    end
    object ads273DSDesigner52: TStringField
      FieldName = #21464#26356#21069#20540'5'
      Size = 100
    end
    object ads273DSDesigner12: TStringField
      FieldName = #21464#26356#21518#20540'1'
      Size = 100
    end
    object ads273DSDesigner23: TStringField
      FieldName = #21464#26356#21518#20540'2'
      Size = 100
    end
    object ads273DSDesigner33: TStringField
      FieldName = #21464#26356#21518#20540'3'
      Size = 100
    end
    object ads273DSDesigner43: TStringField
      FieldName = #21464#26356#21518#20540'4'
      Size = 100
    end
    object ads273DSDesigner53: TStringField
      FieldName = #21464#26356#21518#20540'5'
      Size = 100
    end
    object ads273DSDesigner9: TStringField
      FieldName = #23458#25143#20195#30721
      Size = 10
    end
    object ads273DSDesigner10: TStringField
      FieldName = #23458#25143#21517#31216
      Size = 100
    end
    object ads273DSDesigner11: TStringField
      FieldName = #21019#24314#20154#21592
      Size = 16
    end
    object ads273DSDesigner13: TStringField
      FieldName = #26368#21518#20462#25913#20154#21592
      Size = 16
    end
    object ads273DSDesigner14: TStringField
      FieldName = #23457#26680#20154#21592
      Size = 16
    end
    object ads273DSDesigner15: TStringField
      FieldName = #21464#26356#21069#26412#21378#32534#21495
    end
    object ads273DSDesigner16: TStringField
      FieldName = #21464#26356#21069#23458#25143#22411#21495
      Size = 40
    end
    object ads273DSDesigner17: TStringField
      FieldName = #21464#26356#21518#26412#21378#32534#21495
    end
    object ads273DSDesigner18: TStringField
      FieldName = #21464#26356#21518#23458#25143#22411#21495
      Size = 40
    end
    object ads273DSDesigner19: TStringField
      FieldName = #29366#24577
      ReadOnly = True
      Size = 6
    end
    object ads273DSDesigner20: TStringField
      FieldName = #20449#24687#26469#28304
      ReadOnly = True
      Size = 8
    end
    object ads273DSDesigner21: TStringField
      FieldName = #36716#25442#31867#22411
      ReadOnly = True
      Size = 10
    end
    object ads273DSDesigner24: TStringField
      FieldName = #29983#25928#26085#26399
      ReadOnly = True
      Size = 8
    end
    object ads273CUSTOMER_PART_PTR: TIntegerField
      FieldName = 'CUSTOMER_PART_PTR'
    end
  end
  object ads493: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'select Company_Name as '#20844#21496#21517#31216', '#13#10'Company_Name2 as '#20844#21496#21517#31216'2, '#13#10'Company' +
      '_Name3 as '#20844#21496#21517#31216'3, '#13#10'ship_address as '#22320#22336','#13#10' Company_Icon as '#20844#21496#22270#26631#13#10'f' +
      'rom data0493'
    Parameters = <>
    Left = 72
    Top = 96
    object ads493DSDesigner: TStringField
      FieldName = #20844#21496#21517#31216
      Size = 50
    end
    object ads493DSDesigner2: TStringField
      FieldName = #20844#21496#21517#31216'2'
      Size = 50
    end
    object ads493DSDesigner3: TStringField
      FieldName = #20844#21496#21517#31216'3'
      Size = 50
    end
    object ads493DSDesigner4: TStringField
      FieldName = #22320#22336
      Size = 50
    end
    object ads493DSDesigner5: TBlobField
      FieldName = #20844#21496#22270#26631
    end
  end
  object DataSource1: TDataSource
    DataSet = ads273
    Left = 120
    Top = 40
  end
  object DataSource2: TDataSource
    DataSet = ads493
    Left = 120
    Top = 96
  end
  object DataSource3: TDataSource
    DataSet = ads_ed38
    Left = 120
    Top = 136
  end
  object ads_ed38: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT TOP 100 PERCENT dbo.Data0038.STEP_NUMBER as '#27493#39588', '#13#10' Data00' +
      '34.DEPT_CODE as '#24037#24207#20195#30721', Data0034.DEPT_NAME as '#24037#24207#21517#31216', '#13#10'Data0038.too' +
      'l_old_rev as '#26087#29256#26412', Data0038.tooling_rev As '#26032#29256#26412', '#13#10'      dbo.Data0' +
      '038.TOOL_REMARK as '#22791#27880#13#10'FROM dbo.Data0038 INNER JOIN'#13#10'      dbo.D' +
      'ata0034 ON dbo.Data0038.DEPT_PTR = dbo.Data0034.RKEY'#13#10'where SOUR' +
      'CE_PTR=:CUSTOMER_PART_PTR'#13#10'and (Data0038.tooling_rev <> '#39#39' or Da' +
      'ta0038.tool_old_rev <> '#39#39')'#13#10'ORDER BY dbo.Data0038.STEP_NUMBER'
    Parameters = <
      item
        Name = 'CUSTOMER_PART_PTR'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 74
    Top = 136
    object ads_ed38DSDesigner: TSmallintField
      FieldName = #27493#39588
    end
    object ads_ed38DSDesigner2: TStringField
      FieldName = #24037#24207#20195#30721
      Size = 10
    end
    object ads_ed38DSDesigner3: TStringField
      FieldName = #24037#24207#21517#31216
      Size = 30
    end
    object ads_ed38DSDesigner4: TStringField
      FieldName = #26087#29256#26412
      Size = 10
    end
    object ads_ed38DSDesigner5: TStringField
      FieldName = #26032#29256#26412
      Size = 10
    end
    object ads_ed38DSDesigner6: TStringField
      FieldName = #22791#27880
      Size = 50
    end
  end
  object ppDB273: TppDBPipeline
    DataSource = DataSource1
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB273'
    Left = 176
    Top = 40
    object ppDB273ppField1: TppField
      FieldAlias = #21019#24314#26085#26399
      FieldName = #21019#24314#26085#26399
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 0
      Position = 0
    end
    object ppDB273ppField2: TppField
      FieldAlias = #23457#26680#26085#26399
      FieldName = #23457#26680#26085#26399
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 1
    end
    object ppDB273ppField3: TppField
      FieldAlias = #22312#32447#20135#21697#22788#29702#26041#27861
      FieldName = #22312#32447#20135#21697#22788#29702#26041#27861
      FieldLength = 70
      DisplayWidth = 70
      Position = 2
    end
    object ppDB273ppField4: TppField
      FieldAlias = #25104#21697#24211#23384#22788#29702#26041#27861
      FieldName = #25104#21697#24211#23384#22788#29702#26041#27861
      FieldLength = 70
      DisplayWidth = 70
      Position = 3
    end
    object ppDB273ppField5: TppField
      FieldAlias = #20998#21457#37096#38376
      FieldName = #20998#21457#37096#38376
      FieldLength = 200
      DisplayWidth = 200
      Position = 4
    end
    object ppDB273ppField6: TppField
      FieldAlias = 'ECN'#32534#21495
      FieldName = 'ECN'#32534#21495
      FieldLength = 10
      DisplayWidth = 10
      Position = 5
    end
    object ppDB273ppField7: TppField
      FieldAlias = #21464#26356#20869#23481
      FieldName = #21464#26356#20869#23481
      FieldLength = 500
      DisplayWidth = 500
      Position = 6
    end
    object ppDB273ppField8: TppField
      FieldAlias = #22791#27880
      FieldName = #22791#27880
      FieldLength = 200
      DisplayWidth = 200
      Position = 7
    end
    object ppDB273ppField9: TppField
      FieldAlias = #26368#21518#20462#25913#26085#26399
      FieldName = #26368#21518#20462#25913#26085#26399
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 8
    end
    object ppDB273ppField10: TppField
      FieldAlias = #21464#26356#21069#20540'1'
      FieldName = #21464#26356#21069#20540'1'
      FieldLength = 100
      DisplayWidth = 100
      Position = 9
    end
    object ppDB273ppField11: TppField
      FieldAlias = #21464#26356#21069#20540'2'
      FieldName = #21464#26356#21069#20540'2'
      FieldLength = 100
      DisplayWidth = 100
      Position = 10
    end
    object ppDB273ppField12: TppField
      FieldAlias = #21464#26356#21069#20540'3'
      FieldName = #21464#26356#21069#20540'3'
      FieldLength = 100
      DisplayWidth = 100
      Position = 11
    end
    object ppDB273ppField13: TppField
      FieldAlias = #21464#26356#21069#20540'4'
      FieldName = #21464#26356#21069#20540'4'
      FieldLength = 100
      DisplayWidth = 100
      Position = 12
    end
    object ppDB273ppField14: TppField
      FieldAlias = #21464#26356#21069#20540'5'
      FieldName = #21464#26356#21069#20540'5'
      FieldLength = 100
      DisplayWidth = 100
      Position = 13
    end
    object ppDB273ppField15: TppField
      FieldAlias = #21464#26356#21518#20540'1'
      FieldName = #21464#26356#21518#20540'1'
      FieldLength = 100
      DisplayWidth = 100
      Position = 14
    end
    object ppDB273ppField16: TppField
      FieldAlias = #21464#26356#21518#20540'2'
      FieldName = #21464#26356#21518#20540'2'
      FieldLength = 100
      DisplayWidth = 100
      Position = 15
    end
    object ppDB273ppField17: TppField
      FieldAlias = #21464#26356#21518#20540'3'
      FieldName = #21464#26356#21518#20540'3'
      FieldLength = 100
      DisplayWidth = 100
      Position = 16
    end
    object ppDB273ppField18: TppField
      FieldAlias = #21464#26356#21518#20540'4'
      FieldName = #21464#26356#21518#20540'4'
      FieldLength = 100
      DisplayWidth = 100
      Position = 17
    end
    object ppDB273ppField19: TppField
      FieldAlias = #21464#26356#21518#20540'5'
      FieldName = #21464#26356#21518#20540'5'
      FieldLength = 100
      DisplayWidth = 100
      Position = 18
    end
    object ppDB273ppField20: TppField
      FieldAlias = #23458#25143#20195#30721
      FieldName = #23458#25143#20195#30721
      FieldLength = 10
      DisplayWidth = 10
      Position = 19
    end
    object ppDB273ppField21: TppField
      FieldAlias = #23458#25143#21517#31216
      FieldName = #23458#25143#21517#31216
      FieldLength = 100
      DisplayWidth = 100
      Position = 20
    end
    object ppDB273ppField22: TppField
      FieldAlias = #21019#24314#20154#21592
      FieldName = #21019#24314#20154#21592
      FieldLength = 16
      DisplayWidth = 16
      Position = 21
    end
    object ppDB273ppField23: TppField
      FieldAlias = #26368#21518#20462#25913#20154#21592
      FieldName = #26368#21518#20462#25913#20154#21592
      FieldLength = 16
      DisplayWidth = 16
      Position = 22
    end
    object ppDB273ppField24: TppField
      FieldAlias = #23457#26680#20154#21592
      FieldName = #23457#26680#20154#21592
      FieldLength = 16
      DisplayWidth = 16
      Position = 23
    end
    object ppDB273ppField25: TppField
      FieldAlias = #21464#26356#21069#26412#21378#32534#21495
      FieldName = #21464#26356#21069#26412#21378#32534#21495
      FieldLength = 20
      DisplayWidth = 20
      Position = 24
    end
    object ppDB273ppField26: TppField
      FieldAlias = #21464#26356#21069#23458#25143#22411#21495
      FieldName = #21464#26356#21069#23458#25143#22411#21495
      FieldLength = 40
      DisplayWidth = 40
      Position = 25
    end
    object ppDB273ppField27: TppField
      FieldAlias = #21464#26356#21518#26412#21378#32534#21495
      FieldName = #21464#26356#21518#26412#21378#32534#21495
      FieldLength = 20
      DisplayWidth = 20
      Position = 26
    end
    object ppDB273ppField28: TppField
      FieldAlias = #21464#26356#21518#23458#25143#22411#21495
      FieldName = #21464#26356#21518#23458#25143#22411#21495
      FieldLength = 40
      DisplayWidth = 40
      Position = 27
    end
    object ppDB273ppField29: TppField
      FieldAlias = #29366#24577
      FieldName = #29366#24577
      FieldLength = 6
      DisplayWidth = 6
      Position = 28
    end
    object ppDB273ppField30: TppField
      FieldAlias = #20449#24687#26469#28304
      FieldName = #20449#24687#26469#28304
      FieldLength = 8
      DisplayWidth = 8
      Position = 29
    end
    object ppDB273ppField31: TppField
      FieldAlias = #36716#25442#31867#22411
      FieldName = #36716#25442#31867#22411
      FieldLength = 10
      DisplayWidth = 10
      Position = 30
    end
    object ppDB273ppField32: TppField
      FieldAlias = #29983#25928#26085#26399
      FieldName = #29983#25928#26085#26399
      FieldLength = 8
      DisplayWidth = 8
      Position = 31
    end
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource2
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 176
    Top = 96
    object ppDB493ppField1: TppField
      FieldAlias = #20844#21496#21517#31216
      FieldName = #20844#21496#21517#31216
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppDB493ppField2: TppField
      FieldAlias = #20844#21496#21517#31216'2'
      FieldName = #20844#21496#21517#31216'2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppDB493ppField3: TppField
      FieldAlias = #20844#21496#21517#31216'3'
      FieldName = #20844#21496#21517#31216'3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object ppDB493ppField4: TppField
      FieldAlias = #22320#22336
      FieldName = #22320#22336
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object ppDB493ppField5: TppField
      FieldAlias = #20844#21496#22270#26631
      FieldName = #20844#21496#22270#26631
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 4
      Searchable = False
      Sortable = False
    end
  end
  object ppDB38: TppDBPipeline
    DataSource = DataSource3
    OpenDataSource = False
    UserName = 'DB38'
    Left = 176
    Top = 136
    MasterDataPipelineName = 'ppDB273'
    object ppDB38ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = #27493#39588
      FieldName = #27493#39588
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object ppDB38ppField2: TppField
      FieldAlias = #24037#24207#20195#30721
      FieldName = #24037#24207#20195#30721
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
    object ppDB38ppField3: TppField
      FieldAlias = #24037#24207#21517#31216
      FieldName = #24037#24207#21517#31216
      FieldLength = 30
      DisplayWidth = 30
      Position = 2
    end
    object ppDB38ppField4: TppField
      FieldAlias = #26087#29256#26412
      FieldName = #26087#29256#26412
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
    object ppDB38ppField5: TppField
      FieldAlias = #26032#29256#26412
      FieldName = #26032#29256#26412
      FieldLength = 10
      DisplayWidth = 10
      Position = 4
    end
    object ppDB38ppField6: TppField
      FieldAlias = #22791#27880
      FieldName = #22791#27880
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB38
    PassSetting = psTwoPass
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
    Template.FileName = 'R:\NIERP\Report\ECN_Report.rtm'
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
    Left = 232
    Top = 136
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB38'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 88900
      mmPrintPosition = 0
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = #20844#21496#22270#26631
        DataPipeline = ppDB493
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDB493'
        mmHeight = 15610
        mmLeft = 1323
        mmTop = 1323
        mmWidth = 24077
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = #20844#21496#21517#31216
        DataPipeline = ppDB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 16
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 6435
        mmLeft = 59759
        mmTop = 1852
        mmWidth = 68072
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #24037#31243#21464#26356#36890#30693#21333'ECN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5630
        mmLeft = 71975
        mmTop = 10054
        mmWidth = 42587
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 165894
        mmTop = 7408
        mmWidth = 19579
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 18256
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'ECN'#32534#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4022
        mmLeft = 14552
        mmTop = 19315
        mmWidth = 14139
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'ECN'#32534#21495
        DataPipeline = ppDB273
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB273'
        mmHeight = 4022
        mmLeft = 31221
        mmTop = 19315
        mmWidth = 12361
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 25400
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #21464#26356#31867#22411':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4022
        mmLeft = 74348
        mmTop = 19579
        mmWidth = 15833
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = #36716#25442#31867#22411
        DataPipeline = ppDB273
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB273'
        mmHeight = 4022
        mmLeft = 92869
        mmTop = 19579
        mmWidth = 14055
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = #20449#24687#26469#28304':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 141288
        mmTop = 19844
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = #20449#24687#26469#28304
        DataPipeline = ppDB273
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB273'
        mmHeight = 4022
        mmLeft = 158486
        mmTop = 20108
        mmWidth = 14055
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #29983#25928#26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 141288
        mmTop = 27252
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = #29983#25928#26085#26399
        DataPipeline = ppDB273
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB273'
        mmHeight = 4022
        mmLeft = 158221
        mmTop = 27252
        mmWidth = 14055
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 70644
        mmLeft = 0
        mmTop = 18256
        mmWidth = 1323
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 161132
        mmTop = 12700
        mmWidth = 32015
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = #21464#26356#21069#26412#21378#32534#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 1323
        mmTop = 26723
        mmWidth = 26458
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = #21464#26356#21069#26412#21378#32534#21495
        DataPipeline = ppDB273
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB273'
        mmHeight = 4022
        mmLeft = 30427
        mmTop = 26723
        mmWidth = 24596
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = #21464#26356#21518#26412#21378#32534#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 63500
        mmTop = 26988
        mmWidth = 26458
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = #21464#26356#21518#26412#21378#32534#21495
        DataPipeline = ppDB273
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB273'
        mmHeight = 4022
        mmLeft = 91811
        mmTop = 26988
        mmWidth = 24596
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = #22312#32447#20135#21697#22788#29702#26041#27861':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4022
        mmLeft = 1323
        mmTop = 69850
        mmWidth = 29887
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = #22312#32447#20135#21697#22788#29702#26041#27861
        DataPipeline = ppDB273
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB273'
        mmHeight = 4022
        mmLeft = 32279
        mmTop = 69850
        mmWidth = 28109
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = #25104#21697#24211#23384#22788#29702#26041#27861':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4022
        mmLeft = 1323
        mmTop = 76729
        mmWidth = 29887
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = #25104#21697#24211#23384#22788#29702#26041#27861
        DataPipeline = ppDB273
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB273'
        mmHeight = 4022
        mmLeft = 32279
        mmTop = 76729
        mmWidth = 28109
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = #24037#24207#21517#31216
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 20902
        mmTop = 83079
        mmWidth = 14055
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = #26087#29256#26412
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 40746
        mmTop = 83079
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = #26032#29256#26412
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 57944
        mmTop = 83344
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = #27493#39588
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2646
        mmTop = 83344
        mmWidth = 7144
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 88635
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = #22791#27880
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 81756
        mmTop = 82815
        mmWidth = 9525
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 32544
        mmWidth = 197300
        BandType = 0
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        AutoSize = True
        DataField = #21464#26356#21069#20540'1'
        DataPipeline = ppDB273
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB273'
        mmHeight = 4022
        mmLeft = 6879
        mmTop = 39952
        mmWidth = 15833
        BandType = 0
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        AutoSize = True
        DataField = #21464#26356#21069#20540'2'
        DataPipeline = ppDB273
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB273'
        mmHeight = 4022
        mmLeft = 6879
        mmTop = 45508
        mmWidth = 15833
        BandType = 0
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        AutoSize = True
        DataField = #21464#26356#21069#20540'3'
        DataPipeline = ppDB273
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB273'
        mmHeight = 4022
        mmLeft = 6879
        mmTop = 51065
        mmWidth = 15833
        BandType = 0
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = #21464#26356#21069#20540'4'
        DataPipeline = ppDB273
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB273'
        mmHeight = 3969
        mmLeft = 6879
        mmTop = 56886
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = #21464#26356#21069#20540'5'
        DataPipeline = ppDB273
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB273'
        mmHeight = 3969
        mmLeft = 6879
        mmTop = 63236
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        AutoSize = True
        DataField = #21464#26356#21518#20540'1'
        DataPipeline = ppDB273
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB273'
        mmHeight = 4022
        mmLeft = 103717
        mmTop = 39952
        mmWidth = 15833
        BandType = 0
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        AutoSize = True
        DataField = #21464#26356#21518#20540'2'
        DataPipeline = ppDB273
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB273'
        mmHeight = 4022
        mmLeft = 103981
        mmTop = 45508
        mmWidth = 15833
        BandType = 0
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        AutoSize = True
        DataField = #21464#26356#21518#20540'3'
        DataPipeline = ppDB273
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB273'
        mmHeight = 4022
        mmLeft = 103717
        mmTop = 51065
        mmWidth = 15833
        BandType = 0
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        DataField = #21464#26356#21518#20540'4'
        DataPipeline = ppDB273
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB273'
        mmHeight = 3969
        mmLeft = 103717
        mmTop = 56886
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        DataField = #21464#26356#21518#20540'5'
        DataPipeline = ppDB273
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB273'
        mmHeight = 3969
        mmLeft = 103717
        mmTop = 63236
        mmWidth = 17198
        BandType = 0
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 38365
        mmWidth = 197300
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 44715
        mmWidth = 197300
        BandType = 0
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 50271
        mmWidth = 197300
        BandType = 0
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 56092
        mmWidth = 197300
        BandType = 0
      end
      object ppLine16: TppLine
        UserName = 'Line16'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 62177
        mmWidth = 197300
        BandType = 0
      end
      object ppLine17: TppLine
        UserName = 'Line17'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 68263
        mmWidth = 197300
        BandType = 0
      end
      object ppLine18: TppLine
        UserName = 'Line18'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 74877
        mmWidth = 197300
        BandType = 0
      end
      object ppLine19: TppLine
        UserName = 'Line19'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 81756
        mmWidth = 197300
        BandType = 0
      end
      object ppLine20: TppLine
        UserName = 'Line20'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 35454
        mmLeft = 96838
        mmTop = 32808
        mmWidth = 1323
        BandType = 0
      end
      object ppLine21: TppLine
        UserName = 'Line21'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 70644
        mmLeft = 197300
        mmTop = 17992
        mmWidth = 265
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = #21464#26356#21069#20540
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 11113
        mmTop = 33867
        mmWidth = 14055
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = #21464#26356#21518#20540
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 105040
        mmTop = 33602
        mmWidth = 14055
        BandType = 0
      end
      object ppLine22: TppLine
        UserName = 'Line22'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6879
        mmLeft = 12700
        mmTop = 82021
        mmWidth = 2910
        BandType = 0
      end
      object ppLine23: TppLine
        UserName = 'Line23'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6879
        mmLeft = 39688
        mmTop = 81756
        mmWidth = 2910
        BandType = 0
      end
      object ppLine24: TppLine
        UserName = 'Line24'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6879
        mmLeft = 54240
        mmTop = 82021
        mmWidth = 2910
        BandType = 0
      end
      object ppLine25: TppLine
        UserName = 'Line25'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6879
        mmLeft = 70115
        mmTop = 81756
        mmWidth = 2910
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 7408
      mmPrintPosition = 0
      object ppLine5: TppLine
        UserName = 'Line5'
        ParentHeight = True
        ParentWidth = True
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 7408
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = #24037#24207#21517#31216
        DataPipeline = ppDB38
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB38'
        mmHeight = 4022
        mmLeft = 14552
        mmTop = 1588
        mmWidth = 14055
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = #26087#29256#26412
        DataPipeline = ppDB38
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB38'
        mmHeight = 4022
        mmLeft = 42333
        mmTop = 1588
        mmWidth = 10541
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = #26032#29256#26412
        DataPipeline = ppDB38
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB38'
        mmHeight = 4022
        mmLeft = 57415
        mmTop = 1588
        mmWidth = 10541
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = #27493#39588
        DataPipeline = ppDB38
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB38'
        mmHeight = 4022
        mmLeft = 2572
        mmTop = 1588
        mmWidth = 7027
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        AutoSize = True
        DataField = #22791#27880
        DataPipeline = ppDB38
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB38'
        mmHeight = 4022
        mmLeft = 72761
        mmTop = 1588
        mmWidth = 7027
        BandType = 4
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7408
        mmLeft = 0
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7408
        mmLeft = 12700
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7408
        mmLeft = 39688
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7408
        mmLeft = 54240
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7408
        mmLeft = 70115
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine26: TppLine
        UserName = 'Line26'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7408
        mmLeft = 197300
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 29898
      mmPrintPosition = 0
      object ppDBMemo2: TppDBMemo
        UserName = 'DBMemo2'
        CharWrap = False
        DataField = #20998#21457#37096#38376
        DataPipeline = ppDB273
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppDB273'
        mmHeight = 11642
        mmLeft = 23283
        mmTop = 2381
        mmWidth = 137848
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = #21457#25918#37096#38376':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 4498
        mmTop = 2646
        mmWidth = 15875
        BandType = 8
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = #21019#24314#20154':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 3175
        mmTop = 20108
        mmWidth = 12435
        BandType = 8
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        AutoSize = True
        DataField = #21019#24314#20154#21592
        DataPipeline = ppDB273
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB273'
        mmHeight = 3969
        mmLeft = 20902
        mmTop = 20108
        mmWidth = 14023
        BandType = 8
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        AutoSize = True
        DataField = #23457#26680#20154#21592
        DataPipeline = ppDB273
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB273'
        mmHeight = 3969
        mmLeft = 77258
        mmTop = 20108
        mmWidth = 14023
        BandType = 8
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = #23457#26680#20154#21592':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 60061
        mmTop = 20108
        mmWidth = 15875
        BandType = 8
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = 'QAE'#23457#26680':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 114300
        mmTop = 20108
        mmWidth = 14023
        BandType = 8
      end
      object ppLine28: TppLine
        UserName = 'Line28'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 25665
        mmWidth = 197380
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 50800
      mmPrintPosition = 0
      object ppLine27: TppLine
        UserName = 'Line27'
        ParentHeight = True
        ParentWidth = True
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 50800
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 7
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = #21464#26356#20869#23481
        DataPipeline = ppDB273
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB273'
        mmHeight = 12965
        mmLeft = 23019
        mmTop = 5027
        mmWidth = 141552
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = #21464#26356#20869#23481':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 4498
        mmTop = 5292
        mmWidth = 15875
        BandType = 7
      end
      object ppLine29: TppLine
        UserName = 'Line29'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 50800
        mmLeft = 0
        mmTop = 0
        mmWidth = 265
        BandType = 7
      end
      object ppLine30: TppLine
        UserName = 'Line30'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 50800
        mmLeft = 197300
        mmTop = 0
        mmWidth = 265
        BandType = 7
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
    WindowState = wsMaximized
    Left = 232
    Top = 176
  end
end
