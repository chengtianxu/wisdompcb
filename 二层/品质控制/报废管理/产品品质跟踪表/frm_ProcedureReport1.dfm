object frm_ProcedureReport: Tfrm_ProcedureReport
  Left = 491
  Top = 294
  Width = 579
  Height = 381
  Caption = #24037#24207#25253#34920
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ads493: TADODataSet
    Active = True
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'select * from data0493'#13#10
    Parameters = <>
    Left = 152
    Top = 216
    object ads493Company_Name: TStringField
      FieldName = 'Company_Name'
      Size = 50
    end
    object ads493Company_Name2: TStringField
      FieldName = 'Company_Name2'
      Size = 50
    end
    object ads493Company_Name3: TStringField
      FieldName = 'Company_Name3'
      Size = 50
    end
    object ads493ship_address: TStringField
      FieldName = 'ship_address'
      Size = 50
    end
    object ads493Company_Icon: TBlobField
      FieldName = 'Company_Icon'
    end
    object ads493SITE_INFO_ADD_1: TStringField
      FieldName = 'SITE_INFO_ADD_1'
      FixedChar = True
      Size = 50
    end
    object ads493SITE_INFO_ADD_2: TStringField
      FieldName = 'SITE_INFO_ADD_2'
      FixedChar = True
      Size = 50
    end
    object ads493SITE_INFO_ADD_3: TStringField
      FieldName = 'SITE_INFO_ADD_3'
      FixedChar = True
      Size = 50
    end
    object ads493SITE_INFO_PHONE: TStringField
      FieldName = 'SITE_INFO_PHONE'
      FixedChar = True
      Size = 30
    end
  end
  object DataSource3: TDataSource
    DataSet = ads493
    Left = 200
    Top = 216
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource3
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 256
    Top = 216
    object ppDB493ppField1: TppField
      FieldAlias = 'Company_Name'
      FieldName = 'Company_Name'
      FieldLength = 50
      DisplayWidth = 50
      Position = 0
    end
    object ppDB493ppField2: TppField
      FieldAlias = 'Company_Name2'
      FieldName = 'Company_Name2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppDB493ppField3: TppField
      FieldAlias = 'Company_Name3'
      FieldName = 'Company_Name3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object ppDB493ppField4: TppField
      FieldAlias = 'ship_address'
      FieldName = 'ship_address'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object ppDB493ppField5: TppField
      FieldAlias = 'Company_Icon'
      FieldName = 'Company_Icon'
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField6: TppField
      FieldAlias = 'SITE_INFO_ADD_1'
      FieldName = 'SITE_INFO_ADD_1'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object ppDB493ppField7: TppField
      FieldAlias = 'SITE_INFO_ADD_2'
      FieldName = 'SITE_INFO_ADD_2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppDB493ppField8: TppField
      FieldAlias = 'SITE_INFO_ADD_3'
      FieldName = 'SITE_INFO_ADD_3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
    object ppDB493ppField9: TppField
      FieldAlias = 'SITE_INFO_PHONE'
      FieldName = 'SITE_INFO_PHONE'
      FieldLength = 30
      DisplayWidth = 30
      Position = 8
    end
  end
  object DataSource1: TDataSource
    DataSet = ADS25
    Left = 200
    Top = 120
  end
  object ADS25: TADODataSet
    Active = True
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT Data0025.RKEY, Data0025.MANU_PART_NUMBER as '#26412#21378#32534#21495', '#13#10'     ' +
      ' Data0025.MANU_PART_DESC as '#23458#25143#22411#21495',Data0010.CUST_CODE AS '#23458#25143#20195#30721', '#13#10' ' +
      '     Data0010.CUSTOMER_NAME AS '#23458#25143#21517#31216', Data0010.ABBR_NAME AS '#23458#25143#31616#31216',' +
      ' '#13#10'      Data0008.PROD_CODE AS '#31867#22411#20195#30721', Data0008.PRODUCT_NAME AS '#31867#22411 +
      #21517#31216', '#13#10'      Data0005_3.EMPLOYEE_NAME AS '#26816#26597#20154#21592', Data0025.CHECK_DAT' +
      'E AS '#26816#26597#26085#26399', '#13#10'      Data0005_1.EMPLOYEE_NAME AS '#23457#26680#20154#21592',Data0025.AUD' +
      'ITED_DATE AS '#23457#26680#26085#26399', '#13#10'      Data0005_2.EMPLOYEE_NAME AS '#20462#35746#20154#21592',Data' +
      '0025.LAST_MODIFIED_DATE AS '#20462#35746#26085#26399','#13#10'     Data0025.SAMPLE_NR AS '#26679#26495#32534 +
      #21495',Data0025.ANALYSIS_CODE_2 AS '#23458#25143#29289#26009#21495', '#13#10'Data0025.LAYERS AS '#23618#25968',Dat' +
      'a0025.ANALYSIS_CODE_1 AS '#20132#36135#23610#23544'SET, '#13#10'Data0025.ANALYSIS_CODE_5 AS ' +
      #21333#21482#23610#23544'PCS, Data0025.ANALYSIS_CODE_4 AS '#25340#29256#23610#23544'SPEL, '#13#10'Data0025.pcs_sq' +
      ' AS '#21333#21482#38754#31215'PCS, Data0025.unit_sq AS '#21333#21482#38754#31215'SET, '#13#10'     Data0025.spell_' +
      'sq AS '#21333#21482#38754#31215'SPEL, Data0025.layers_info AS '#23618#21387#32467#26500','#13#10'Data0025.REMARK a' +
      's '#21152#24037#25351#31034',Data0025.ENG_NOTE as '#24037#31243#22791#27880', '#13#10'Data0025.EST_SCRAP as '#25253#24223#29575' , ' +
      'Data0025.SHELF_LIFE as '#29983#20135#21608#26399', '#13#10'      Data0025.REVIEW_DAYS as '#26377#25928#26399 +
      #22825#25968', Data0025.MFG_LEAD_TIME as '#21046#36896#25552#21069#26399', '#13#10'      Data0025.ANALYSIS_C' +
      'ODE_3 as '#22823#26009#35268#26684', Data0025.REPORT_UNIT_VALUE1 AS '#21333#21482#37325#37327'g, '#13#10'      dbo' +
      '.Data0025.OPT_LOT_SIZE as '#27969#36716#25209#37327', '#13#10'case Data0025.ONHOLD_SALES_FLA' +
      'G when 0 then '#39#26377#25928#39' when 1 then '#39#36807#26399#39' end as '#38144#21806#29366#24577', '#13#10'Data0015.WARE' +
      'HOUSE_CODE as '#24037#21378#20195#30721', Data0015.ABBR_NAME as '#24037#21378#31616#31216','#13#10'case Data0025.T' +
      'STATUS'#13#10'   when 0 then '#39#24453#21046#20316#39' when 1 then '#39#24050#23457#26680#39' when 2 then '#39#23457#36864#22238#39 +
      ' when 3 then '#39#24453#26816#26597#39#13#10'   when 4 then '#39#24453#23457#26680#39' when 5 then '#39#26816#36864#22238#39' when ' +
      '6 then '#39#26410#25552#20132#39' end as '#23457#25209#29366#24577','#13#10#13#10'case   Data0025.ttype  when 0 then ' +
      #39#37327#20135#39' when 1 then '#39#26679#26495#39'  end as '#37327#20135#26679#26495','#13#10'case Data0025.green_flag wh' +
      'en '#39'Y'#39' then '#39'RoHS'#39'  else '#39#38750'RoHS'#39' end as '#29615#20445#26631#35782','#13#10'case when data002' +
      '5.PARENT_PTR is null then '#39#22806#23618#39' ELSE '#39#20869#23618#39' end as  '#20135#21697#24615#36136#13#10'FROM dbo.' +
      'Data0008 INNER JOIN'#13#10'      dbo.Data0025 ON '#13#10'      dbo.Data0008.' +
      'RKEY = dbo.Data0025.PROD_CODE_PTR INNER JOIN'#13#10'      dbo.Data0010' +
      ' ON '#13#10'      dbo.Data0025.CUSTOMER_PTR = dbo.Data0010.RKEY LEFT O' +
      'UTER JOIN'#13#10'      dbo.Data0005 Data0005_3 ON '#13#10'      dbo.Data0025' +
      '.CHECK_BY_PTR = Data0005_3.RKEY LEFT OUTER JOIN'#13#10'      dbo.Data0' +
      '005 Data0005_2 ON '#13#10'      dbo.Data0025.LAST_MODIFIED_BY_PTR = Da' +
      'ta0005_2.RKEY LEFT OUTER JOIN'#13#10'      dbo.Data0005 Data0005_1 ON ' +
      'dbo.Data0025.AUDITED_BY_PTR = Data0005_1.RKEY left JOIN'#13#10'       ' +
      'Data0015 ON Data0025.PROD_ROUTE_PTR = Data0015.RKEY'#13#10'where Data0' +
      '025.MANU_PART_NUMBER=:MANU_PART_NUMBER'
    Parameters = <
      item
        Name = 'MANU_PART_NUMBER'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end>
    Left = 153
    Top = 120
    object ADS25RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADS25DSDesigner: TStringField
      FieldName = #26412#21378#32534#21495
    end
    object ADS25DSDesigner2: TStringField
      FieldName = #23458#25143#22411#21495
      Size = 40
    end
    object ADS25DSDesigner3: TStringField
      FieldName = #23458#25143#20195#30721
      Size = 10
    end
    object ADS25DSDesigner4: TStringField
      FieldName = #23458#25143#21517#31216
      Size = 100
    end
    object ADS25DSDesigner5: TStringField
      FieldName = #23458#25143#31616#31216
      Size = 10
    end
    object ADS25DSDesigner6: TStringField
      FieldName = #31867#22411#20195#30721
      Size = 10
    end
    object ADS25DSDesigner7: TStringField
      FieldName = #31867#22411#21517#31216
      Size = 30
    end
    object ADS25DSDesigner8: TStringField
      FieldName = #26816#26597#20154#21592
      Size = 16
    end
    object ADS25DSDesigner9: TDateTimeField
      FieldName = #26816#26597#26085#26399
    end
    object ADS25DSDesigner10: TStringField
      FieldName = #23457#26680#20154#21592
      Size = 16
    end
    object ADS25DSDesigner11: TDateTimeField
      FieldName = #23457#26680#26085#26399
    end
    object ADS25DSDesigner12: TStringField
      FieldName = #20462#35746#20154#21592
      Size = 16
    end
    object ADS25DSDesigner13: TDateTimeField
      FieldName = #20462#35746#26085#26399
    end
    object ADS25DSDesigner14: TStringField
      FieldName = #26679#26495#32534#21495
      Size = 15
    end
    object ADS25DSDesigner15: TStringField
      FieldName = #23458#25143#29289#26009#21495
      Size = 50
    end
    object ADS25DSDesigner16: TWordField
      FieldName = #23618#25968
    end
    object ADS25SET: TStringField
      FieldName = #20132#36135#23610#23544'SET'
      Size = 30
    end
    object ADS25PCS: TStringField
      FieldName = #21333#21482#23610#23544'PCS'
      Size = 30
    end
    object ADS25SPEL: TStringField
      FieldName = #25340#29256#23610#23544'SPEL'
      Size = 30
    end
    object ADS25PCS2: TFloatField
      FieldName = #21333#21482#38754#31215'PCS'
    end
    object ADS25SET2: TFloatField
      FieldName = #21333#21482#38754#31215'SET'
    end
    object ADS25SPEL2: TFloatField
      FieldName = #21333#21482#38754#31215'SPEL'
    end
    object ADS25DSDesigner17: TMemoField
      FieldName = #23618#21387#32467#26500
      BlobType = ftMemo
    end
    object ADS25DSDesigner18: TMemoField
      FieldName = #21152#24037#25351#31034
      BlobType = ftMemo
    end
    object ADS25DSDesigner19: TStringField
      FieldName = #24037#31243#22791#27880
      Size = 200
    end
    object ADS25DSDesigner20: TFloatField
      FieldName = #25253#24223#29575
    end
    object ADS25DSDesigner21: TIntegerField
      FieldName = #29983#20135#21608#26399
    end
    object ADS25DSDesigner22: TSmallintField
      FieldName = #26377#25928#26399#22825#25968
    end
    object ADS25DSDesigner23: TSmallintField
      FieldName = #21046#36896#25552#21069#26399
    end
    object ADS25DSDesigner24: TStringField
      FieldName = #22823#26009#35268#26684
      Size = 50
    end
    object ADS25g: TBCDField
      FieldName = #21333#21482#37325#37327'g'
      Precision = 9
    end
    object ADS25DSDesigner25: TIntegerField
      FieldName = #27969#36716#25209#37327
    end
    object ADS25DSDesigner26: TStringField
      FieldName = #38144#21806#29366#24577
      ReadOnly = True
      Size = 4
    end
    object ADS25DSDesigner27: TStringField
      FieldName = #23457#25209#29366#24577
      ReadOnly = True
      Size = 6
    end
    object ADS25DSDesigner28: TStringField
      FieldName = #37327#20135#26679#26495
      ReadOnly = True
      Size = 4
    end
    object ADS25DSDesigner29: TStringField
      FieldName = #29615#20445#26631#35782
      ReadOnly = True
      Size = 6
    end
    object ADS25DSDesigner30: TStringField
      FieldName = #20135#21697#24615#36136
      ReadOnly = True
      Size = 4
    end
    object ADS25DSDesigner31: TStringField
      FieldName = #24037#21378#20195#30721
      Size = 5
    end
    object ADS25DSDesigner32: TStringField
      FieldName = #24037#21378#31616#31216
      Size = 10
    end
  end
  object ads31: TADODataSet
    Active = True
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'select DATA0031.SOURCE_PTR, DATA0031.STEP_NUMBER as '#39#27493#39588#39',DATA003' +
      '1.DEPT_PTR , '#13#10'data0034.DEPT_Name as '#39#24037#24207#21517#31216#39', DATA0031.QA_CONFIRM' +
      'ATION as '#39' '#24037#33402#38590#28857#39', '#13#10'DATA0031.SCRAP_QTY_reason as'#39#25511#21046#26041#27861#39', DATA0031' +
      '.gaffer_confirmation as '#39#29983#20135#21442#25968#39','#13#10' DATA0031.FLOW_QTY as '#39#21697#36136#29366#20917#39', D' +
      'ATA0031.rece_gaffetconfir, DATA0031.technology_diff '#13#10'from DATA0' +
      '031 inner join data0034 on data0031.DEPT_PTR=data0034.Rkey'#13#10'wher' +
      'e source_ptr=:Rkey'#13#10'order by step_number'
    DataSource = DataSource1
    IndexFieldNames = 'SOURCE_PTR'
    MasterFields = 'Rkey'
    Parameters = <
      item
        Name = 'Rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 152
    Top = 168
    object ads31SOURCE_PTR: TIntegerField
      FieldName = 'SOURCE_PTR'
    end
    object ads31DSDesigner: TSmallintField
      FieldName = #27493#39588
    end
    object ads31DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ads31DSDesigner2: TStringField
      FieldName = #24037#24207#21517#31216
      Size = 30
    end
    object ads31DSDesigner3: TStringField
      FieldName = ' '#24037#33402#38590#28857
      Size = 400
    end
    object ads31DSDesigner4: TStringField
      FieldName = #25511#21046#26041#27861
      Size = 400
    end
    object ads31DSDesigner5: TStringField
      FieldName = #29983#20135#21442#25968
      Size = 400
    end
    object ads31DSDesigner6: TStringField
      FieldName = #21697#36136#29366#20917
      Size = 50
    end
  end
  object DataSource2: TDataSource
    DataSet = ads31
    Left = 200
    Top = 165
  end
  object ppDB31: TppDBPipeline
    DataSource = DataSource2
    OpenDataSource = False
    UserName = 'DB31'
    Left = 256
    Top = 167
    MasterDataPipelineName = 'ppDB25'
    object ppDB31ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'SOURCE_PTR'
      FieldName = 'SOURCE_PTR'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 0
    end
    object ppDB31ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = #27493#39588
      FieldName = #27493#39588
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object ppDB31ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEPT_PTR'
      FieldName = 'DEPT_PTR'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object ppDB31ppField4: TppField
      FieldAlias = #24037#24207#21517#31216
      FieldName = #24037#24207#21517#31216
      FieldLength = 30
      DisplayWidth = 30
      Position = 3
    end
    object ppDB31ppField5: TppField
      FieldAlias = ' '#24037#33402#38590#28857
      FieldName = ' '#24037#33402#38590#28857
      FieldLength = 400
      DisplayWidth = 400
      Position = 4
    end
    object ppDB31ppField6: TppField
      FieldAlias = #25511#21046#26041#27861
      FieldName = #25511#21046#26041#27861
      FieldLength = 400
      DisplayWidth = 400
      Position = 5
    end
    object ppDB31ppField7: TppField
      FieldAlias = #29983#20135#21442#25968
      FieldName = #29983#20135#21442#25968
      FieldLength = 400
      DisplayWidth = 400
      Position = 6
    end
    object ppDB31ppField8: TppField
      FieldAlias = #21697#36136#29366#20917
      FieldName = #21697#36136#29366#20917
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
  end
  object ppDB25: TppDBPipeline
    DataSource = DataSource1
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB25'
    Left = 256
    Top = 120
    object ppDB25ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'RKEY'
      FieldName = 'RKEY'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 0
    end
    object ppDB25ppField2: TppField
      FieldAlias = #26412#21378#32534#21495
      FieldName = #26412#21378#32534#21495
      FieldLength = 20
      DisplayWidth = 20
      Position = 1
    end
    object ppDB25ppField3: TppField
      FieldAlias = #23458#25143#22411#21495
      FieldName = #23458#25143#22411#21495
      FieldLength = 40
      DisplayWidth = 40
      Position = 2
    end
    object ppDB25ppField4: TppField
      FieldAlias = #23458#25143#20195#30721
      FieldName = #23458#25143#20195#30721
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
    object ppDB25ppField5: TppField
      FieldAlias = #23458#25143#21517#31216
      FieldName = #23458#25143#21517#31216
      FieldLength = 100
      DisplayWidth = 100
      Position = 4
    end
    object ppDB25ppField6: TppField
      FieldAlias = #23458#25143#31616#31216
      FieldName = #23458#25143#31616#31216
      FieldLength = 10
      DisplayWidth = 10
      Position = 5
    end
    object ppDB25ppField7: TppField
      FieldAlias = #31867#22411#20195#30721
      FieldName = #31867#22411#20195#30721
      FieldLength = 10
      DisplayWidth = 10
      Position = 6
    end
    object ppDB25ppField8: TppField
      FieldAlias = #31867#22411#21517#31216
      FieldName = #31867#22411#21517#31216
      FieldLength = 30
      DisplayWidth = 30
      Position = 7
    end
    object ppDB25ppField9: TppField
      FieldAlias = #26816#26597#20154#21592
      FieldName = #26816#26597#20154#21592
      FieldLength = 16
      DisplayWidth = 16
      Position = 8
    end
    object ppDB25ppField10: TppField
      FieldAlias = #26816#26597#26085#26399
      FieldName = #26816#26597#26085#26399
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 9
    end
    object ppDB25ppField11: TppField
      FieldAlias = #23457#26680#20154#21592
      FieldName = #23457#26680#20154#21592
      FieldLength = 16
      DisplayWidth = 16
      Position = 10
    end
    object ppDB25ppField12: TppField
      FieldAlias = #23457#26680#26085#26399
      FieldName = #23457#26680#26085#26399
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 11
    end
    object ppDB25ppField13: TppField
      FieldAlias = #20462#35746#20154#21592
      FieldName = #20462#35746#20154#21592
      FieldLength = 16
      DisplayWidth = 16
      Position = 12
    end
    object ppDB25ppField14: TppField
      FieldAlias = #20462#35746#26085#26399
      FieldName = #20462#35746#26085#26399
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 13
    end
    object ppDB25ppField15: TppField
      FieldAlias = #26679#26495#32534#21495
      FieldName = #26679#26495#32534#21495
      FieldLength = 15
      DisplayWidth = 15
      Position = 14
    end
    object ppDB25ppField16: TppField
      FieldAlias = #23458#25143#29289#26009#21495
      FieldName = #23458#25143#29289#26009#21495
      FieldLength = 50
      DisplayWidth = 50
      Position = 15
    end
    object ppDB25ppField17: TppField
      Alignment = taRightJustify
      FieldAlias = #23618#25968
      FieldName = #23618#25968
      FieldLength = 0
      DataType = dtLongint
      DisplayWidth = 10
      Position = 16
    end
    object ppDB25ppField18: TppField
      FieldAlias = #20132#36135#23610#23544'SET'
      FieldName = #20132#36135#23610#23544'SET'
      FieldLength = 30
      DisplayWidth = 30
      Position = 17
    end
    object ppDB25ppField19: TppField
      FieldAlias = #21333#21482#23610#23544'PCS'
      FieldName = #21333#21482#23610#23544'PCS'
      FieldLength = 30
      DisplayWidth = 30
      Position = 18
    end
    object ppDB25ppField20: TppField
      FieldAlias = #25340#29256#23610#23544'SPEL'
      FieldName = #25340#29256#23610#23544'SPEL'
      FieldLength = 30
      DisplayWidth = 30
      Position = 19
    end
    object ppDB25ppField21: TppField
      Alignment = taRightJustify
      FieldAlias = #21333#21482#38754#31215'PCS'
      FieldName = #21333#21482#38754#31215'PCS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object ppDB25ppField22: TppField
      Alignment = taRightJustify
      FieldAlias = #21333#21482#38754#31215'SET'
      FieldName = #21333#21482#38754#31215'SET'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object ppDB25ppField23: TppField
      Alignment = taRightJustify
      FieldAlias = #21333#21482#38754#31215'SPEL'
      FieldName = #21333#21482#38754#31215'SPEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object ppDB25ppField24: TppField
      FieldAlias = #23618#21387#32467#26500
      FieldName = #23618#21387#32467#26500
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField25: TppField
      FieldAlias = #21152#24037#25351#31034
      FieldName = #21152#24037#25351#31034
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 24
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField26: TppField
      FieldAlias = #24037#31243#22791#27880
      FieldName = #24037#31243#22791#27880
      FieldLength = 200
      DisplayWidth = 200
      Position = 25
    end
    object ppDB25ppField27: TppField
      Alignment = taRightJustify
      FieldAlias = #25253#24223#29575
      FieldName = #25253#24223#29575
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object ppDB25ppField28: TppField
      Alignment = taRightJustify
      FieldAlias = #29983#20135#21608#26399
      FieldName = #29983#20135#21608#26399
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 27
    end
    object ppDB25ppField29: TppField
      Alignment = taRightJustify
      FieldAlias = #26377#25928#26399#22825#25968
      FieldName = #26377#25928#26399#22825#25968
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 28
    end
    object ppDB25ppField30: TppField
      Alignment = taRightJustify
      FieldAlias = #21046#36896#25552#21069#26399
      FieldName = #21046#36896#25552#21069#26399
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 29
    end
    object ppDB25ppField31: TppField
      FieldAlias = #22823#26009#35268#26684
      FieldName = #22823#26009#35268#26684
      FieldLength = 50
      DisplayWidth = 50
      Position = 30
    end
    object ppDB25ppField32: TppField
      Alignment = taRightJustify
      FieldAlias = #21333#21482#37325#37327'g'
      FieldName = #21333#21482#37325#37327'g'
      FieldLength = 4
      DataType = dtDouble
      DisplayWidth = 10
      Position = 31
    end
    object ppDB25ppField33: TppField
      Alignment = taRightJustify
      FieldAlias = #27969#36716#25209#37327
      FieldName = #27969#36716#25209#37327
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 32
    end
    object ppDB25ppField34: TppField
      FieldAlias = #38144#21806#29366#24577
      FieldName = #38144#21806#29366#24577
      FieldLength = 4
      DisplayWidth = 4
      Position = 33
    end
    object ppDB25ppField35: TppField
      FieldAlias = #23457#25209#29366#24577
      FieldName = #23457#25209#29366#24577
      FieldLength = 6
      DisplayWidth = 6
      Position = 34
    end
    object ppDB25ppField36: TppField
      FieldAlias = #37327#20135#26679#26495
      FieldName = #37327#20135#26679#26495
      FieldLength = 4
      DisplayWidth = 4
      Position = 35
    end
    object ppDB25ppField37: TppField
      FieldAlias = #29615#20445#26631#35782
      FieldName = #29615#20445#26631#35782
      FieldLength = 6
      DisplayWidth = 6
      Position = 36
    end
    object ppDB25ppField38: TppField
      FieldAlias = #20135#21697#24615#36136
      FieldName = #20135#21697#24615#36136
      FieldLength = 4
      DisplayWidth = 4
      Position = 37
    end
    object ppDB25ppField39: TppField
      FieldAlias = #24037#21378#20195#30721
      FieldName = #24037#21378#20195#30721
      FieldLength = 5
      DisplayWidth = 5
      Position = 38
    end
    object ppDB25ppField40: TppField
      FieldAlias = #24037#21378#31616#31216
      FieldName = #24037#21378#31616#31216
      FieldLength = 10
      DisplayWidth = 10
      Position = 39
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB31
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
    Template.FileName = 'D:\sjsys\NIERP\Report\wzpr031.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 304
    Top = 168
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB31'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 30692
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #26412#21378#32534#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 20902
        mmTop = 16404
        mmWidth = 15875
        BandType = 1
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = #26412#21378#32534#21495
        DataPipeline = ppDB25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB25'
        mmHeight = 4022
        mmLeft = 39688
        mmTop = 16404
        mmWidth = 14055
        BandType = 1
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'Company_Name'
        DataPipeline = ppDB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 5630
        mmLeft = 64236
        mmTop = 2117
        mmWidth = 64939
        BandType = 1
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = #26679#21697#29983#20135#21697#36136#36319#36394#20449#24687#34920
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 77112
        mmTop = 8731
        mmWidth = 38650
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
        mmHeight = 13229
        mmLeft = 1852
        mmTop = 529
        mmWidth = 13229
        BandType = 1
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = #23458#25143#22411#21495
        DataPipeline = ppDB25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB25'
        mmHeight = 4022
        mmLeft = 39688
        mmTop = 22754
        mmWidth = 14055
        BandType = 1
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = #23458#25143#22411#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 20638
        mmTop = 23283
        mmWidth = 15833
        BandType = 1
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = #24037#21378#20195#30721':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 69321
        mmTop = 16404
        mmWidth = 15833
        BandType = 1
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = #24037#21378#20195#30721
        DataPipeline = ppDB25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB25'
        mmHeight = 4022
        mmLeft = 88106
        mmTop = 16404
        mmWidth = 14055
        BandType = 1
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = #24037#21378#31616#31216#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 69321
        mmTop = 22490
        mmWidth = 15875
        BandType = 1
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = #24037#21378#31616#31216
        DataPipeline = ppDB25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB25'
        mmHeight = 4022
        mmLeft = 88106
        mmTop = 22225
        mmWidth = 14055
        BandType = 1
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = #23458#25143#20195#30721#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 124619
        mmTop = 16404
        mmWidth = 17568
        BandType = 1
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = #23458#25143#20195#30721
        DataPipeline = ppDB25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB25'
        mmHeight = 4022
        mmLeft = 144992
        mmTop = 16404
        mmWidth = 14055
        BandType = 1
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = #23458#25143#31616#31216#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 124619
        mmTop = 22490
        mmWidth = 17568
        BandType = 1
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = #23458#25143#31616#31216
        DataPipeline = ppDB25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB25'
        mmHeight = 4022
        mmLeft = 144992
        mmTop = 22225
        mmWidth = 14055
        BandType = 1
      end
    end
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 8996
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        ParentHeight = True
        ParentWidth = True
        mmHeight = 8996
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = #27493#39588
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2910
        mmTop = 2381
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #24037#24207#21517#31216
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 17992
        mmTop = 2381
        mmWidth = 14055
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = #24037#33402#38590#28857
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 4233
        mmLeft = 48683
        mmTop = 2381
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #25511#21046#26041#27861
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 4763
        mmLeft = 95250
        mmTop = 2646
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        ShiftWithParent = True
        Caption = #29983#20135#21442#25968
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 4763
        mmLeft = 134144
        mmTop = 2117
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = #21697#36136#29366#20917
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 4498
        mmLeft = 171186
        mmTop = 2646
        mmWidth = 16404
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8996
        mmLeft = 14288
        mmTop = 0
        mmWidth = 3704
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8996
        mmLeft = 41010
        mmTop = 0
        mmWidth = 3704
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8996
        mmLeft = 76465
        mmTop = 0
        mmWidth = 3175
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8996
        mmLeft = 122502
        mmTop = 0
        mmWidth = 3175
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8996
        mmLeft = 159015
        mmTop = 0
        mmWidth = 3175
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13494
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentHeight = True
        ParentWidth = True
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 13494
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = #27493#39588
        DataPipeline = ppDB31
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB31'
        mmHeight = 4022
        mmLeft = 2117
        mmTop = 794
        mmWidth = 7027
        BandType = 4
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 13494
        mmLeft = 0
        mmTop = 0
        mmWidth = 6350
        BandType = 4
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 13494
        mmLeft = 14288
        mmTop = 0
        mmWidth = 3704
        BandType = 4
      end
      object ppLine11: TppLine
        UserName = 'Line101'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 13494
        mmLeft = 41010
        mmTop = 0
        mmWidth = 2646
        BandType = 4
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 13494
        mmLeft = 76465
        mmTop = 0
        mmWidth = 3704
        BandType = 4
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 13494
        mmLeft = 122502
        mmTop = 0
        mmWidth = 3704
        BandType = 4
      end
      object ppLine16: TppLine
        UserName = 'Line16'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 13494
        mmLeft = 159015
        mmTop = 0
        mmWidth = 3704
        BandType = 4
      end
      object ppLine17: TppLine
        UserName = 'Line17'
        ParentHeight = True
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 13494
        mmLeft = 193675
        mmTop = 0
        mmWidth = 3704
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = #25511#21046#26041#27861
        DataPipeline = ppDB31
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDB31'
        mmHeight = 12700
        mmLeft = 76994
        mmTop = 265
        mmWidth = 44979
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = #29983#20135#21442#25968
        DataPipeline = ppDB31
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDB31'
        mmHeight = 12435
        mmLeft = 123561
        mmTop = 529
        mmWidth = 35190
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = #21697#36136#29366#20917
        DataPipeline = ppDB31
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDB31'
        mmHeight = 12435
        mmLeft = 159544
        mmTop = 265
        mmWidth = 36777
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = #24037#24207#21517#31216
        DataPipeline = ppDB31
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDB31'
        mmHeight = 11906
        mmLeft = 15346
        mmTop = 794
        mmWidth = 25665
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = ' '#24037#33402#38590#28857
        DataPipeline = ppDB31
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDB31'
        mmHeight = 12171
        mmLeft = 41540
        mmTop = 794
        mmWidth = 34396
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {00}
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
    Left = 304
    Top = 216
  end
end
