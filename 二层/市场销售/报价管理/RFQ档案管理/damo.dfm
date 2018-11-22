object dm: Tdm
  OldCreateOrder = False
  Left = 586
  Top = 319
  Height = 313
  Width = 539
  object ADOConn: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
  end
  object dsRFQ: TDataSource
    DataSet = ADSRFQ
    Left = 32
    Top = 160
  end
  object ADSRFQ: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'Select t165.RKEY,t165.RFQNo,t165.Cust_Id,t165.Cust_Name,'#13#10'      ' +
      '     t165.FileName,t165.POType,t165.PartsId,'#13#10'           Case t1' +
      '65.POType When 0 Then '#39#26032#21333#39#13#10'                                    ' +
      '      When 1 Then '#39#22797#25237#21333#39#13#10'                                       ' +
      '   When 2 Then '#39#22797#25237#21464#26356#21333#39#13#10'           End As TPOType,'#13#10'           t' +
      '165.Status,'#13#10'           Case t165.Status When 0 Then '#39#26410#23457#26680#39#13#10'    ' +
      '                                   When 1 Then '#39#24050#23457#26680#39#13#10'          ' +
      ' End As TStatus,'#13#10'           t165.IsUP,'#13#10'           Case t165.Is' +
      'UP When 0 Then '#39#26410#19978#20256#39#13#10'                                     When ' +
      '1 Then '#39#24050#19978#20256#39#13#10'           End As TIsUP,'#13#10'           IsNull(t5.EMP' +
      'LOYEE_NAME,t165.CreateId)'#13#10'           As CreateName,'#13#10'          ' +
      ' t165.CreateDate,'#13#10'           IsNull(t5_0.EMPLOYEE_NAME,t165.Las' +
      'tModifyId)'#13#10'           As LastModifyName,'#13#10'           t165.LastM' +
      'odifyDate,'#13#10'           IsNull(t5_1.EMPLOYEE_NAME,t165.AuditId)'#13#10 +
      '           As AuditName,'#13#10'           t165.AuditDate'#13#10'From Data01' +
      '65 t165'#13#10'Left Join Data0005 t5'#13#10'         On t165.CreateId = t5.R' +
      'KEY'#13#10'Left Join Data0005 t5_0'#13#10'         On t165.LastModifyId = t5' +
      '_0.RKEY'#13#10'Left Join Data0005 t5_1'#13#10'         On t165.AuditId = t5_' +
      '1.RKEY'#13#10'Where t165.CreateDate Between :dtpk1 And :dtpk2'
    IndexFieldNames = 'RFQNo'
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = 41061d
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = 41091d
      end>
    Prepared = True
    Left = 32
    Top = 104
    object ADSRFQRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
    object ADSRFQRFQNo: TStringField
      DisplayLabel = 'RFQ'#32534#21495
      FieldName = 'RFQNo'
      Size = 15
    end
    object ADSRFQCust_Id: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'Cust_Id'
      Size = 10
    end
    object ADSRFQCust_Name: TStringField
      DisplayLabel = #23458#25143#21517#31216
      DisplayWidth = 30
      FieldName = 'Cust_Name'
      Size = 100
    end
    object ADSRFQFileName: TStringField
      DisplayLabel = #25991#20214#21517
      DisplayWidth = 15
      FieldName = 'FileName'
      Size = 30
    end
    object ADSRFQPOType: TStringField
      DisplayLabel = #35746#21333#31867#22411
      FieldName = 'POType'
      Visible = False
      Size = 10
    end
    object ADSRFQTPOType: TStringField
      DisplayLabel = #35746#21333#31867#22411
      DisplayWidth = 10
      FieldName = 'TPOType'
      ReadOnly = True
      Size = 10
    end
    object ADSRFQStatus: TWordField
      DisplayWidth = 6
      FieldName = 'Status'
      Visible = False
    end
    object ADSRFQTStatus: TStringField
      DisplayLabel = #29366#24577
      DisplayWidth = 10
      FieldName = 'TStatus'
      ReadOnly = True
      Size = 6
    end
    object ADSRFQIsUP: TBooleanField
      FieldName = 'IsUP'
    end
    object ADSRFQTIsUP: TStringField
      FieldName = 'TIsUP'
      ReadOnly = True
      Size = 6
    end
    object ADSRFQCreateName: TStringField
      DisplayLabel = #21019#24314#20154
      DisplayWidth = 12
      FieldName = 'CreateName'
      ReadOnly = True
      Size = 16
    end
    object ADSRFQCreateDate: TDateTimeField
      DisplayLabel = #21019#24314#26102#38388
      DisplayWidth = 24
      FieldName = 'CreateDate'
    end
    object ADSRFQLastModifyName: TStringField
      DisplayLabel = #26368#21518#20462#25913#20154
      DisplayWidth = 12
      FieldName = 'LastModifyName'
      ReadOnly = True
      Size = 16
    end
    object ADSRFQLastModifyDate: TDateTimeField
      DisplayLabel = #26368#21518#20462#25913#26102#38388
      DisplayWidth = 24
      FieldName = 'LastModifyDate'
    end
    object ADSRFQAuditName: TStringField
      DisplayLabel = #23457#26680#20154
      DisplayWidth = 12
      FieldName = 'AuditName'
      ReadOnly = True
      Size = 16
    end
    object ADSRFQAuditDate: TDateTimeField
      DisplayLabel = #23457#26680#26102#38388
      DisplayWidth = 24
      FieldName = 'AuditDate'
    end
    object ADSRFQPartsId: TStringField
      FieldName = 'PartsId'
      Size = 30
    end
  end
  object ADQGetDate: TADOQuery
    Connection = ADOConn
    Parameters = <>
    Left = 32
    Top = 48
  end
  object AQSetParam: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'Select t164.*, t278.PARAMETER_NAME, t278.PARAMETER_DESC'
      'From Data0164 t164, Data0278 t278'
      'where t164.Param_ptr = t278.RKEY'
      'Order By t164.Group_Type,t164.SEQ_NO')
    Left = 104
    object AQSetParamRKEY: TAutoIncField
      DisplayLabel = 'RKEY'#20540
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
    object AQSetParamGroup_Type: TWordField
      DisplayLabel = #21442#25968#31867#21035
      FieldName = 'Group_Type'
    end
    object AQSetParamGroup_Name: TStringField
      DisplayLabel = #21442#25968#31867#21035#21517#31216
      DisplayWidth = 20
      FieldName = 'Group_Name'
      Size = 50
    end
    object AQSetParamParam_ptr: TIntegerField
      DisplayLabel = #24037#31243#21442#25968'RKEY'#20540
      FieldName = 'Param_ptr'
      Visible = False
    end
    object AQSetParamPARAMETER_NAME: TStringField
      DisplayLabel = #24037#31243#21442#25968#21517#31216
      FieldName = 'PARAMETER_NAME'
      Size = 10
    end
    object AQSetParamPARAMETER_DESC: TStringField
      DisplayLabel = #24037#31243#21442#25968#25551#36848
      FieldName = 'PARAMETER_DESC'
    end
    object AQSetParamSEQ_NO: TSmallintField
      DisplayLabel = #21442#25968#39034#24207
      FieldName = 'SEQ_NO'
    end
    object AQSetParamNeedDisplayConManage: TStringField
      DisplayLabel = #26159#21542#22312#21512#21516#31649#29702#19978#26174#31034
      DisplayWidth = 20
      FieldName = 'NeedDisplayConManage'
      FixedChar = True
      Size = 1
    end
    object AQSetParamNeedDisplaySalesCon: TStringField
      DisplayLabel = #26159#21542#22312#38144#21806#21512#21516#19978#26174#31034
      DisplayWidth = 20
      FieldName = 'NeedDisplaySalesCon'
      FixedChar = True
      Size = 1
    end
    object AQSetParamEngDepartNeedSee: TStringField
      DisplayLabel = #24037#31243#37096#26159#21542#38656#26597#30475
      DisplayWidth = 20
      FieldName = 'EngDepartNeedSee'
      FixedChar = True
      Size = 1
    end
    object AQSetParamEngDepartMINeed: TStringField
      DisplayLabel = #24037#31243#37096'MI'#38656#25235#21462#30340#20449#24687
      DisplayWidth = 20
      FieldName = 'EngDepartMINeed'
      FixedChar = True
      Size = 1
    end
    object AQSetParamMustInput: TWordField
      DisplayLabel = #26159#21542#24517#22635
      DisplayWidth = 5
      FieldName = 'MustInput'
    end
  end
  object dsSetParam: TDataSource
    DataSet = AQSetParam
    Left = 176
  end
  object dsPrint: TDataSource
    DataSet = AQPrint
    Left = 176
    Top = 104
  end
  object temp: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select CONTROL_NO_LENGTH, SEED_VALUE, SEED_FLAG from data0004')
    Left = 256
    object tempCONTROL_NO_LENGTH: TSmallintField
      FieldName = 'CONTROL_NO_LENGTH'
    end
    object tempSEED_VALUE: TStringField
      FieldName = 'SEED_VALUE'
    end
    object tempSEED_FLAG: TWordField
      FieldName = 'SEED_FLAG'
    end
  end
  object AQCalcSeqNo: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Group_Type'
        Attributes = [paNullable]
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end>
    SQL.Strings = (
      'Select IsNull(Max(SEQ_NO),0)+1 As Max_No'
      'From Data0164'
      'Where Group_Type = :Group_Type')
    Left = 408
    Top = 56
    object AQCalcSeqNoMax_No: TIntegerField
      FieldName = 'Max_No'
      ReadOnly = True
    end
  end
  object AQ0010: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'Select t10.CUST_CODE,t10.CUSTOMER_NAME,t10.BILLING_ADDRESS_1,'
      
        '       t5.EMPLOYEE_NAME as SALES_REP_NAME,t10.PHONE,t10.GEN_EMAI' +
        'L_ADDRESS'
      'from data0010 t10 Left Join data0005 t5'
      'On t10.SALES_REP_PTR = t5.RKEY'
      'order by t10.CUST_CODE')
    Left = 408
    Top = 112
    object AQ0010CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      DisplayWidth = 10
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object AQ0010CUSTOMER_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      DisplayWidth = 30
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object AQ0010BILLING_ADDRESS_1: TStringField
      DisplayLabel = #23458#25143#22320#22336
      DisplayWidth = 80
      FieldName = 'BILLING_ADDRESS_1'
      Size = 100
    end
    object AQ0010SALES_REP_NAME: TStringField
      DisplayLabel = #36319#21333#21592
      DisplayWidth = 20
      FieldName = 'SALES_REP_NAME'
      Visible = False
    end
    object AQ0010PHONE: TStringField
      DisplayLabel = #30005#35805#21495#30721
      DisplayWidth = 20
      FieldName = 'PHONE'
      Visible = False
      FixedChar = True
    end
    object AQ0010GEN_EMAIL_ADDRESS: TStringField
      DisplayWidth = 50
      FieldName = 'GEN_EMAIL_ADDRESS'
      Visible = False
      FixedChar = True
      Size = 50
    end
  end
  object AQMain: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'RKEY'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'Select * From Data0165'
      'Where RKEY = :RKEY')
    Left = 104
    Top = 48
    object AQMainRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AQMainRFQNo: TStringField
      FieldName = 'RFQNo'
      Size = 15
    end
    object AQMainStatus: TWordField
      FieldName = 'Status'
    end
    object AQMainCust_Id: TStringField
      FieldName = 'Cust_Id'
      Size = 10
    end
    object AQMainCust_Name: TStringField
      FieldName = 'Cust_Name'
      Size = 100
    end
    object AQMainCust_Addr: TStringField
      FieldName = 'Cust_Addr'
      Size = 100
    end
    object AQMainSalesMan: TStringField
      FieldName = 'SalesMan'
      Size = 10
    end
    object AQMainTechContact: TStringField
      FieldName = 'TechContact'
      Size = 10
    end
    object AQMainTel: TStringField
      FieldName = 'Tel'
    end
    object AQMainMail: TStringField
      FieldName = 'Mail'
      Size = 30
    end
    object AQMainFileName: TStringField
      FieldName = 'FileName'
      Size = 255
    end
    object AQMainFilePath: TStringField
      FieldName = 'FilePath'
      Size = 80
    end
    object AQMainPartsId: TStringField
      FieldName = 'PartsId'
      Size = 30
    end
    object AQMainPOType: TStringField
      FieldName = 'POType'
      Size = 10
    end
    object AQMainLayers_Info: TMemoField
      FieldName = 'Layers_Info'
      BlobType = ftMemo
    end
    object AQMainIsUP: TBooleanField
      FieldName = 'IsUP'
    end
    object AQMainCreateId: TIntegerField
      FieldName = 'CreateId'
    end
    object AQMainCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object AQMainLastModifyId: TIntegerField
      FieldName = 'LastModifyId'
    end
    object AQMainLastModifyDate: TDateTimeField
      FieldName = 'LastModifyDate'
    end
    object AQMainAuditId: TIntegerField
      FieldName = 'AuditId'
    end
    object AQMainAuditDate: TDateTimeField
      FieldName = 'AuditDate'
    end
  end
  object AQ0338: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'RKEY0166'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0338 where parameter_ptr= :RKEY0166')
    Left = 408
    Top = 168
    object AQ0338rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object AQ0338PARAMETER_PTR: TIntegerField
      FieldName = 'PARAMETER_PTR'
    end
    object AQ0338SEQUENCE_NO: TSmallintField
      FieldName = 'SEQUENCE_NO'
    end
    object AQ0338TVALUE: TStringField
      FieldName = 'TVALUE'
      Size = 30
    end
  end
  object AQTempDetail: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select t164.*,t278.PARAMETER_NAME,t278.PARAMETER_DESC,t278.UNIT_' +
        'NAME'
      'From Data0164 t164'
      
        'Left Join (Select t1.*,t2.UNIT_NAME From Data0278 t1 Left Join d' +
        'ata0002 t2'
      '                On t1.UNIT_PTR = t2.RKEY) t278'
      'On t164.Param_ptr = t278.RKEY'
      'Order By t164.Group_Type, t164.SEQ_NO')
    Left = 280
    Top = 176
    object AQTempDetailRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
    object AQTempDetailGroup_Type: TWordField
      FieldName = 'Group_Type'
    end
    object AQTempDetailGroup_Name: TStringField
      FieldName = 'Group_Name'
      Size = 50
    end
    object AQTempDetailParam_ptr: TIntegerField
      FieldName = 'Param_ptr'
    end
    object AQTempDetailSEQ_NO: TSmallintField
      FieldName = 'SEQ_NO'
    end
    object AQTempDetailNeedDisplayConManage: TStringField
      FieldName = 'NeedDisplayConManage'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object AQTempDetailNeedDisplaySalesCon: TStringField
      FieldName = 'NeedDisplaySalesCon'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object AQTempDetailEngDepartNeedSee: TStringField
      FieldName = 'EngDepartNeedSee'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object AQTempDetailEngDepartMINeed: TStringField
      FieldName = 'EngDepartMINeed'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object AQTempDetailMustInput: TWordField
      FieldName = 'MustInput'
    end
    object AQTempDetailPARAMETER_NAME: TStringField
      FieldName = 'PARAMETER_NAME'
      Size = 10
    end
    object AQTempDetailPARAMETER_DESC: TStringField
      FieldName = 'PARAMETER_DESC'
    end
    object AQTempDetailUNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
  end
  object AQParamName: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select t1.RKEY,t1.PARAMETER_NAME,t1.PARAMETER_DESC,t2.UNIT_CODE,'
      '           t2.UNIT_NAME,t1.DATA_TYPE,t1.min_value,t1.max_value'
      'From Data0278 t1 Left Join data0002 t2'
      '                On t1.UNIT_PTR = t2.RKEY')
    Left = 408
    Top = 224
    object AQParamNameRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AQParamNamePARAMETER_NAME: TStringField
      FieldName = 'PARAMETER_NAME'
      Size = 10
    end
    object AQParamNamePARAMETER_DESC: TStringField
      FieldName = 'PARAMETER_DESC'
    end
    object AQParamNameUNIT_CODE: TStringField
      FieldName = 'UNIT_CODE'
      Size = 5
    end
    object AQParamNameUNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object AQParamNameDATA_TYPE: TWordField
      FieldName = 'DATA_TYPE'
    end
    object AQParamNamemin_value: TFloatField
      FieldName = 'min_value'
    end
    object AQParamNamemax_value: TFloatField
      FieldName = 'max_value'
    end
  end
  object ASPCopyData: TADOStoredProc
    Connection = ADOConn
    ProcedureName = 'WZPR164;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = -6
      end
      item
        Name = '@RKEY165'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@RKEY4'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@EmpId'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 32
    Top = 216
  end
  object ACAudit: TADOCommand
    CommandText = 
      'Update Data0165'#13#10'Set Status = :Status ,'#13#10'       AuditId = :Audit' +
      'Id ,'#13#10'       AuditDate = :AuditDate'#13#10'Where RKEY = :RKEY'
    Connection = ADOConn
    Parameters = <
      item
        Name = 'Status'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end
      item
        Name = 'AuditId'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'AuditDate'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'RKEY'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 256
    Top = 48
  end
  object AQEmp: TADOQuery
    Connection = ADOConn
    Parameters = <>
    Left = 327
    Top = 4
  end
  object AQPrint: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'RKEY165'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'Select t165.RFQNo,t165.Cust_Id,t165.Cust_Name,t165.Cust_Addr,'
      
        '       t165.SalesMan,t165.TechContact,t165.Tel,t165.Mail,t165.Fi' +
        'leName,t165.PartsId,'
      '       Case t165.Status When 0 Then '#39#26410#23457#26680#39
      '                                   When 1 Then '#39#24050#23457#26680#39
      '       End As TStatus,'
      '       Case t165.POType When 0 Then '#39#26032#21333#39
      '                                      When 1 Then '#39#22797#25237#21333#39
      '                                      When 2 Then '#39#22797#25237#21464#26356#21333#39
      '       End As TPOType,'
      '       t5_1.EMPLOYEE_NAME As CreateName,t165.CreateDate,'
      '       t5_2.EMPLOYEE_NAME As LastModifyName,t165.LastModifyDate,'
      '       t5_3.EMPLOYEE_NAME As AuditName,t165.AuditDate,'
      
        '       t166.Group_Name,t166.SEQ_NO,t_Param.PARAMETER_NAME,t_Para' +
        'm.PARAMETER_DESC,t_Param.UNIT_NAME,t166.Param_Value,'
      '       t165.Layers_Info'
      'From Data0165 t165'
      'Inner Join Data0166 t166 On t165.RKEY = t166.PARAMETER_PTR'
      
        'Inner Join (Select t1.RKEY,t1.PARAMETER_NAME,t1.PARAMETER_DESC,t' +
        '2.UNIT_NAME'
      
        '            From Data0278 t1 Left Join data0002 t2 On t1.UNIT_PT' +
        'R = t2.RKEY) t_Param On t166.Param_ptr = t_Param.RKEY'
      'Left Join Data0005 t5_1 On t165.CreateId = t5_1.RKEY'
      'Left Join Data0005 t5_2 On t165.LastModifyId = t5_2.RKEY'
      'Left Join Data0005 t5_3 On t165.AuditId = t5_3.RKEY'
      'Where t165.RKEY = :RKEY165'
      'Order By t166.Group_Name, t166.SEQ_NO')
    Left = 104
    Top = 104
    object AQPrintRFQNo: TStringField
      DisplayLabel = 'RFQ'#32534#21495
      FieldName = 'RFQNo'
      Size = 15
    end
    object AQPrintCust_Id: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'Cust_Id'
      Size = 10
    end
    object AQPrintCust_Name: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'Cust_Name'
      Size = 100
    end
    object AQPrintCust_Addr: TStringField
      DisplayLabel = #23458#25143#22320#22336
      FieldName = 'Cust_Addr'
      Size = 100
    end
    object AQPrintSalesMan: TStringField
      DisplayLabel = #19994#21153#21592
      FieldName = 'SalesMan'
      Size = 10
    end
    object AQPrintTechContact: TStringField
      DisplayLabel = #25216#26415#32852#31995#20154
      FieldName = 'TechContact'
      Size = 10
    end
    object AQPrintTel: TStringField
      DisplayLabel = #30005#35805
      FieldName = 'Tel'
    end
    object AQPrintMail: TStringField
      DisplayLabel = #37038#31665
      FieldName = 'Mail'
      Size = 30
    end
    object AQPrintFileName: TStringField
      DisplayLabel = #25991#20214#21517
      FieldName = 'FileName'
      Size = 30
    end
    object AQPrintPartsId: TStringField
      DisplayLabel = #38646#20214#21495
      FieldName = 'PartsId'
      Size = 30
    end
    object AQPrintTStatus: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'TStatus'
      ReadOnly = True
      Size = 6
    end
    object AQPrintTPOType: TStringField
      DisplayLabel = #35746#21333#31867#22411
      FieldName = 'TPOType'
      ReadOnly = True
      Size = 10
    end
    object AQPrintCreateName: TStringField
      DisplayLabel = #21019#24314#20154
      FieldName = 'CreateName'
      Size = 16
    end
    object AQPrintCreateDate: TDateTimeField
      DisplayLabel = #21019#24314#26102#38388
      FieldName = 'CreateDate'
    end
    object AQPrintLastModifyName: TStringField
      DisplayLabel = #26368#21518#20462#25913#20154
      FieldName = 'LastModifyName'
      Size = 16
    end
    object AQPrintLastModifyDate: TDateTimeField
      DisplayLabel = #26368#21518#20462#25913#26102#38388
      FieldName = 'LastModifyDate'
    end
    object AQPrintAuditName: TStringField
      DisplayLabel = #23457#26680#20154
      FieldName = 'AuditName'
      Size = 16
    end
    object AQPrintAuditDate: TDateTimeField
      DisplayLabel = #23457#26680#26085#26399
      FieldName = 'AuditDate'
    end
    object AQPrintGroup_Name: TStringField
      DisplayLabel = #21442#25968#31867#21035
      FieldName = 'Group_Name'
    end
    object AQPrintSEQ_NO: TSmallintField
      DisplayLabel = #21442#25968#39034#24207
      FieldName = 'SEQ_NO'
    end
    object AQPrintPARAMETER_NAME: TStringField
      DisplayLabel = #21442#25968#21517#31216
      FieldName = 'PARAMETER_NAME'
      Size = 10
    end
    object AQPrintPARAMETER_DESC: TStringField
      DisplayLabel = #21442#25968#25551#36848
      FieldName = 'PARAMETER_DESC'
    end
    object AQPrintUNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object AQPrintParam_Value: TStringField
      DisplayLabel = #21442#25968#20540
      FieldName = 'Param_Value'
      Size = 50
    end
    object AQPrintLayers_Info: TMemoField
      FieldName = 'Layers_Info'
      BlobType = ftMemo
    end
  end
  object AQ0193: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CODE'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 5
        Value = Null
      end
      item
        Name = 'CODE'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 5
        Value = Null
      end>
    SQL.Strings = (
      'select  RECORD_KEY,CODE, DESCRIPTION,layers_info'
      #13'from data0193'
      #13'where SPEC_RKEY <> '#39'Y'#39
      'and ((CODE = :CODE ) or ( :CODE = '#39#39'))')
    Left = 320
    Top = 88
    object AQ0193RECORD_KEY: TAutoIncField
      FieldName = 'RECORD_KEY'
      ReadOnly = True
    end
    object AQ0193CODE: TStringField
      FieldName = 'CODE'
      FixedChar = True
      Size = 5
    end
    object AQ0193DESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 40
    end
    object AQ0193layers_info: TMemoField
      FieldName = 'layers_info'
      BlobType = ftMemo
    end
  end
  object dsMain: TDataSource
    DataSet = AQMain
    Left = 176
    Top = 48
  end
  object ASPCopyData1: TADOStoredProc
    Connection = ADOConn
    ProcedureName = 'WZPR164;2'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@RKEY165'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@EmpId'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 176
    Top = 216
  end
end
