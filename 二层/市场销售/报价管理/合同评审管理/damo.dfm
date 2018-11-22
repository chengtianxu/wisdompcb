object dm: Tdm
  OldCreateOrder = False
  Left = 359
  Top = 235
  Height = 297
  Width = 409
  object ADOConn: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=wisdomtopcb1077;Persist Security In' +
      'fo=True;User ID=sa;Initial Catalog=sj_v20_live;Data Source=172.1' +
      '6.8.112'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 16
    Top = 10
  end
  object aqTmp: TADOQuery
    Connection = ADOConn
    Parameters = <>
    Left = 136
  end
  object dsBrowse: TDataSource
    DataSet = adsBrowse
    Left = 16
    Top = 160
  end
  object adsBrowse: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'Select t167.RKEY,t167.ContractNo,t167.Cust_Id,t167.Cust_Name,'#13#10' ' +
      '          t167.Status,'#13#10'           Case t167.Status When 0 Then ' +
      #39#26410#23457#26680#39#13#10'                                       When 1 Then '#39#24050#25552#20132#39#13 +
      #10'                                       When 2 Then '#39#24050#23457#26680#39#13#10'     ' +
      '                                  When 3 Then '#39#24050#36864#22238#39#13#10'           ' +
      'End As TStatus,'#13#10'           IsNull(t5.EMPLOYEE_NAME,t167.CreateI' +
      'd)'#13#10'           As CreateName,'#13#10'           t167.CreateDate,'#13#10'    ' +
      '       IsNull(t5_0.EMPLOYEE_NAME,t167.LastModifyId)'#13#10'           ' +
      'As LastModifyName,'#13#10'           t167.LastModifyDate,'#13#10'           ' +
      'IsNull(t5_1.EMPLOYEE_NAME,t167.AuditId)'#13#10'           As AuditName' +
      ','#13#10'           t167.AuditDate,t167.ColorTag'#13#10'From Data0167 t167'#13#10 +
      'Left Join Data0005 t5'#13#10'         On t167.CreateId = t5.RKEY'#13#10'Left' +
      ' Join Data0005 t5_0'#13#10'         On t167.LastModifyId = t5_0.RKEY'#13#10 +
      'Left Join Data0005 t5_1'#13#10'         On t167.AuditId = t5_1.RKEY'#13#10'W' +
      'here t167.CreateDate Between :dtpk1 And :dtpk2'
    IndexFieldNames = 'ContractNo'
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    Prepared = True
    Left = 16
    Top = 104
    object adsBrowseRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
    object adsBrowseContractNo: TStringField
      DisplayLabel = #21512#21516#21495
      FieldName = 'ContractNo'
      Size = 15
    end
    object adsBrowseCust_Id: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'Cust_Id'
      Size = 10
    end
    object adsBrowseCust_Name: TStringField
      DisplayLabel = #23458#25143#21517#31216
      DisplayWidth = 30
      FieldName = 'Cust_Name'
      Size = 100
    end
    object adsBrowseStatus: TWordField
      DisplayWidth = 6
      FieldName = 'Status'
      Visible = False
    end
    object adsBrowseTStatus: TStringField
      DisplayLabel = #29366#24577
      DisplayWidth = 10
      FieldName = 'TStatus'
      ReadOnly = True
      Visible = False
      Size = 6
    end
    object adsBrowseCreateName: TStringField
      DisplayLabel = #21019#24314#20154
      DisplayWidth = 12
      FieldName = 'CreateName'
      ReadOnly = True
      Size = 16
    end
    object adsBrowseCreateDate: TDateTimeField
      DisplayLabel = #21019#24314#26102#38388
      DisplayWidth = 24
      FieldName = 'CreateDate'
    end
    object adsBrowseLastModifyName: TStringField
      DisplayLabel = #26368#21518#20462#25913#20154
      DisplayWidth = 12
      FieldName = 'LastModifyName'
      ReadOnly = True
      Size = 16
    end
    object adsBrowseLastModifyDate: TDateTimeField
      DisplayLabel = #26368#21518#20462#25913#26102#38388
      DisplayWidth = 24
      FieldName = 'LastModifyDate'
    end
    object adsBrowseAuditName: TStringField
      DisplayLabel = #23457#26680#20154
      DisplayWidth = 12
      FieldName = 'AuditName'
      ReadOnly = True
      Size = 16
    end
    object adsBrowseAuditDate: TDateTimeField
      DisplayLabel = #23457#26680#26102#38388
      DisplayWidth = 24
      FieldName = 'AuditDate'
    end
    object adsBrowseColorTag: TWordField
      FieldName = 'ColorTag'
      Visible = False
    end
  end
  object aqGetDate: TADOQuery
    Connection = ADOConn
    Parameters = <>
    Left = 72
    Top = 56
  end
  object aqMain: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforeClose = aqMainBeforeClose
    AfterScroll = aqMainAfterScroll
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
      'Select * From Data0167'
      'Where RKEY = :RKEY')
    Left = 71
    Top = 104
    object aqMainRKEY: TAutoIncField
      FieldName = 'RKEY'
    end
    object aqMainContractNo: TStringField
      FieldName = 'ContractNo'
      Size = 15
    end
    object aqMainStatus: TWordField
      FieldName = 'Status'
    end
    object aqMainCust_Id: TStringField
      FieldName = 'Cust_Id'
      Size = 10
    end
    object aqMainCust_Name: TStringField
      FieldName = 'Cust_Name'
      Size = 100
    end
    object aqMainCust_Addr: TStringField
      FieldName = 'Cust_Addr'
      Size = 100
    end
    object aqMainSalesMan: TStringField
      FieldName = 'SalesMan'
      Size = 10
    end
    object aqMainContact: TStringField
      FieldName = 'Contact'
      Size = 10
    end
    object aqMainTel: TStringField
      FieldName = 'Tel'
    end
    object aqMainFax: TStringField
      FieldName = 'Fax'
    end
    object aqMainMail: TStringField
      FieldName = 'Mail'
      Size = 30
    end
    object aqMainContractAmt: TBCDField
      FieldName = 'ContractAmt'
      DisplayFormat = '####0.00'
      Precision = 18
      Size = 3
    end
    object aqMainCURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      OnChange = aqMainCURR_CODEChange
      Size = 5
    end
    object aqMainPosition: TStringField
      FieldName = 'Position'
      Size = 10
    end
    object aqMainNotes: TStringField
      FieldName = 'Notes'
      Size = 255
    end
    object aqMainCreateId: TIntegerField
      FieldName = 'CreateId'
    end
    object aqMainCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object aqMainLastModifyId: TIntegerField
      FieldName = 'LastModifyId'
    end
    object aqMainLastModifyDate: TDateTimeField
      FieldName = 'LastModifyDate'
    end
    object aqMainAuditId: TIntegerField
      FieldName = 'AuditId'
    end
    object aqMainAuditDate: TDateTimeField
      FieldName = 'AuditDate'
    end
    object aqMainColorTag: TWordField
      FieldName = 'ColorTag'
    end
  end
  object dsMain: TDataSource
    DataSet = aqMain
    Left = 71
    Top = 160
  end
  object dsDetail: TDataSource
    DataSet = aqDetail
    Left = 134
    Top = 160
  end
  object aqDetail: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforeDelete = aqDetailBeforeDelete
    AfterScroll = aqDetailAfterScroll
    OnCalcFields = aqDetailCalcFields
    Parameters = <
      item
        Name = 'RKEY167'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'Select * From Data0168'
      'Where PARAMETER_PTR = :RKEY167'
      'Order By RFQNo')
    Left = 134
    Top = 104
    object aqDetailRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
    object aqDetailPARAMETER_PTR: TIntegerField
      FieldName = 'PARAMETER_PTR'
      Visible = False
    end
    object aqDetailFlag: TWordField
      DisplayWidth = 5
      FieldName = 'Flag'
    end
    object aqDetailRKEY165: TIntegerField
      FieldName = 'RKEY165'
      Visible = False
    end
    object aqDetailRFQNo: TStringField
      DisplayLabel = 'RFQ'#32534#21495
      DisplayWidth = 15
      FieldName = 'RFQNo'
      Size = 15
    end
    object aqDetailFileName: TStringField
      DisplayLabel = #25991#20214#21517
      FieldName = 'FileName'
      Size = 30
    end
    object aqDetailPartsId: TStringField
      DisplayLabel = #38646#20214#21495
      FieldName = 'PartsId'
      Size = 30
    end
    object aqDetailBoardThick: TStringField
      DisplayLabel = #26495#21402
      DisplayWidth = 8
      FieldName = 'BoardThick'
      Size = 10
    end
    object aqDetailLayers: TWordField
      DisplayLabel = #23618#25968
      DisplayWidth = 5
      FieldName = 'Layers'
    end
    object aqDetailSetSize: TStringField
      DisplayLabel = #25104#21697#23610#23544
      DisplayWidth = 15
      FieldName = 'SetSize'
      Size = 16
    end
    object aqDetailQnty: TIntegerField
      DisplayLabel = #25104#21697#25968#37327
      DisplayWidth = 8
      FieldName = 'Qnty'
    end
    object aqDetailUPS: TStringField
      DisplayWidth = 5
      FieldName = 'UPS'
      Size = 50
    end
    object aqDetailPrice: TBCDField
      DisplayLabel = #20215#26684
      DisplayWidth = 10
      FieldName = 'Price'
      DisplayFormat = '####0.00'
      Precision = 18
      Size = 3
    end
    object aqDetailEngAmount: TBCDField
      DisplayLabel = #24037#31243#36153
      DisplayWidth = 10
      FieldName = 'EngAmount'
      DisplayFormat = '####0.00'
      Precision = 18
      Size = 3
    end
    object aqDetailFLAmount: TBCDField
      DisplayLabel = #33778#26519#36153
      DisplayWidth = 10
      FieldName = 'FLAmount'
      DisplayFormat = '####0.00'
      Precision = 18
      Size = 3
    end
    object aqDetailTestAmount: TBCDField
      DisplayLabel = #27979#35797#36153
      DisplayWidth = 10
      FieldName = 'TestAmount'
      DisplayFormat = '####0.00'
      Precision = 18
      Size = 3
    end
    object aqDetailMakeAmount: TBCDField
      DisplayLabel = #21046#26495#36153
      DisplayWidth = 10
      FieldName = 'MakeAmount'
      DisplayFormat = '####0.00'
      Precision = 18
      Size = 3
    end
    object aqDetailOtherAmount: TBCDField
      DisplayLabel = #20854#20182#36153#29992
      DisplayWidth = 10
      FieldName = 'OtherAmount'
      DisplayFormat = '####0.00'
      Precision = 18
      Size = 3
    end
    object aqDetailTotalAmount: TBCDField
      DisplayLabel = #25240#25187#21069#24635#37329#39069
      DisplayWidth = 12
      FieldName = 'TotalAmount'
      DisplayFormat = '####0.00'
      Precision = 18
      Size = 3
    end
    object aqDetailAftDiscountAmount: TBCDField
      DisplayLabel = #25240#25187#21518#24635#37329#39069
      DisplayWidth = 12
      FieldName = 'AftDiscountAmount'
      DisplayFormat = '####0.00'
      Precision = 18
      Size = 3
    end
    object aqDetailArea: TBCDField
      DisplayLabel = #38754#31215
      DisplayWidth = 10
      FieldName = 'Area'
      Precision = 18
      Size = 6
    end
    object aqDetailDueDate: TDateTimeField
      DisplayLabel = #20132#36135#26085#26399
      FieldName = 'DueDate'
    end
    object aqDetailFile_Number: TStringField
      DisplayLabel = #26723#26696#21495
      DisplayWidth = 6
      FieldName = 'File_Number'
      Size = 30
    end
    object aqDetailPOType: TWordField
      DisplayLabel = #35746#21333#31867#22411
      FieldName = 'POType'
    end
    object aqDetailLAM2: TStringField
      DisplayLabel = #26495#26448
      DisplayWidth = 15
      FieldName = 'LAM2'
      Size = 30
    end
    object aqDetailSurfaceDeal: TStringField
      DisplayLabel = #34920#38754#28034#35206
      DisplayWidth = 10
      FieldName = 'SurfaceDeal'
      Size = 24
    end
    object aqDetailWCCPTH: TStringField
      DisplayLabel = #22806#38108
      DisplayWidth = 8
      FieldName = 'WCCPTH'
      Size = 12
    end
    object aqDetailNCCPTH: TStringField
      DisplayLabel = #20869#38108
      DisplayWidth = 8
      FieldName = 'NCCPTH'
      Size = 12
    end
    object aqDetailVersion: TStringField
      DisplayLabel = #20135#21697#29256#26412
      DisplayWidth = 8
      FieldName = 'Version'
      Size = 10
    end
    object aqDetailTZFL: TStringField
      DisplayLabel = #22270#32440#33778#26519
      DisplayWidth = 8
      FieldName = 'TZFL'
      Size = 50
    end
    object aqDetailStandardPrice: TBCDField
      FieldName = 'StandardPrice'
      Visible = False
      DisplayFormat = '####0.00'
      Precision = 18
      Size = 3
    end
    object aqDetailXS_Add: TBCDField
      FieldName = 'XS_Add'
      Visible = False
      Precision = 18
      Size = 6
    end
    object aqDetailPrice_Add: TBCDField
      FieldName = 'Price_Add'
      Visible = False
      DisplayFormat = '####0.00'
      Precision = 18
      Size = 3
    end
    object aqDetailAfterPrice: TBCDField
      FieldName = 'AfterPrice'
      Visible = False
      DisplayFormat = '####0.00'
      Precision = 18
      Size = 3
    end
    object aqDetailStdEngAmount: TBCDField
      FieldName = 'StdEngAmount'
      Visible = False
      DisplayFormat = '####0.00'
      Precision = 18
      Size = 3
    end
    object aqDetailStdEngPrice: TBCDField
      FieldName = 'StdEngPrice'
      Visible = False
      DisplayFormat = '####0.00'
      Precision = 18
      Size = 3
    end
    object aqDetailStdArea: TBCDField
      FieldName = 'StdArea'
      Visible = False
      Precision = 18
      Size = 6
    end
    object aqDetailGoldFingerAmount: TBCDField
      FieldName = 'GoldFingerAmount'
      Visible = False
      DisplayFormat = '####0.00'
      Precision = 18
      Size = 3
    end
    object aqDetailUrgentAmount: TBCDField
      FieldName = 'UrgentAmount'
      Visible = False
      DisplayFormat = '####0.00'
      Precision = 18
      Size = 3
    end
    object aqDetailAdd_Percent: TBCDField
      FieldName = 'Add_Percent'
      Visible = False
      Precision = 18
      Size = 6
    end
    object aqDetailAdd_TotalAmount: TBCDField
      FieldName = 'Add_TotalAmount'
      Visible = False
      DisplayFormat = '####0.00'
      Precision = 18
      Size = 3
    end
    object aqDetailDiscount: TBCDField
      DisplayLabel = #25240#25187#37329#39069
      FieldName = 'Discount'
      Visible = False
      DisplayFormat = '####0.00'
      Precision = 18
      Size = 3
    end
    object aqDetailUrgentDays: TWordField
      FieldName = 'UrgentDays'
      Visible = False
    end
    object aqDetailDueDays: TWordField
      FieldName = 'DueDays'
      Visible = False
    end
    object aqDetailNotes: TStringField
      FieldName = 'Notes'
      Visible = False
      Size = 255
    end
    object aqDetailDueArea: TFloatField
      FieldKind = fkCalculated
      FieldName = 'DueArea'
      Calculated = True
    end
  end
  object dsRFQParam: TDataSource
    DataSet = aqRFQParam
    Left = 321
    Top = 56
  end
  object aqRFQParam: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
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
      'Select * From Data0166'
      'Where PARAMETER_PTR = :RKEY165'
      'Order By Group_Type, SEQ_NO')
    Left = 321
    object aqRFQParamRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aqRFQParamPARAMETER_PTR: TIntegerField
      FieldName = 'PARAMETER_PTR'
    end
    object aqRFQParamGroup_Type: TWordField
      FieldName = 'Group_Type'
    end
    object aqRFQParamGroup_Name: TStringField
      FieldName = 'Group_Name'
    end
    object aqRFQParamSEQ_NO: TSmallintField
      FieldName = 'SEQ_NO'
    end
    object aqRFQParamParam_ptr: TIntegerField
      FieldName = 'Param_ptr'
      Visible = False
    end
    object aqRFQParamPARAMETER_DESC: TStringField
      DisplayLabel = #21442#25968#21517#31216
      DisplayWidth = 15
      FieldKind = fkLookup
      FieldName = 'PARAMETER_DESC'
      LookupDataSet = aqParamName
      LookupKeyFields = 'RKEY'
      LookupResultField = 'PARAMETER_DESC'
      KeyFields = 'Param_ptr'
      LookupCache = True
      Lookup = True
    end
    object aqRFQParamParam_Value: TStringField
      DisplayLabel = #21442#25968#20540
      DisplayWidth = 11
      FieldName = 'Param_Value'
      Size = 50
    end
    object aqRFQParamMustInput: TWordField
      FieldName = 'MustInput'
    end
  end
  object aqParamName: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'Select t1.RKEY,t1.PARAMETER_NAME,t1.PARAMETER_DESC,t2.UNIT_CODE,'
      '          t2.UNIT_NAME,t1.DATA_TYPE,t1.min_value,t1.max_value'
      'From Data0278 t1 Left Join data0002 t2'
      '                On t1.UNIT_PTR = t2.RKEY')
    Left = 136
    Top = 56
    object aqParamNameRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aqParamNamePARAMETER_NAME: TStringField
      FieldName = 'PARAMETER_NAME'
      Size = 10
    end
    object aqParamNamePARAMETER_DESC: TStringField
      FieldName = 'PARAMETER_DESC'
    end
    object aqParamNameUNIT_CODE: TStringField
      FieldName = 'UNIT_CODE'
      Size = 5
    end
    object aqParamNameUNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object aqParamNameDATA_TYPE: TWordField
      FieldName = 'DATA_TYPE'
    end
    object aqParamNamemin_value: TFloatField
      FieldName = 'min_value'
    end
    object aqParamNamemax_value: TFloatField
      FieldName = 'max_value'
    end
  end
  object aqDtlItem: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'PARAMETER_PTR'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'Select * From Data0169'
      'Where PARAMETER_PTR = :PARAMETER_PTR'
      'Order By SEQ_NO')
    Left = 192
    Top = 104
    object aqDtlItemRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
    object aqDtlItemPARAMETER_PTR: TIntegerField
      FieldName = 'PARAMETER_PTR'
      Visible = False
    end
    object aqDtlItemRKEY165: TIntegerField
      FieldName = 'RKEY165'
      Visible = False
    end
    object aqDtlItemRFQNo: TStringField
      FieldName = 'RFQNo'
      Visible = False
      Size = 15
    end
    object aqDtlItemParam_ptr: TIntegerField
      FieldName = 'Param_ptr'
      Visible = False
    end
    object aqDtlItemSEQ_NO: TSmallintField
      FieldName = 'SEQ_NO'
      Visible = False
    end
    object aqDtlItemPARAMETER_DESC: TStringField
      DisplayLabel = #21442#25968#21517#31216
      DisplayWidth = 15
      FieldKind = fkLookup
      FieldName = 'PARAMETER_DESC'
      LookupDataSet = aqParamName
      LookupKeyFields = 'RKEY'
      LookupResultField = 'PARAMETER_DESC'
      KeyFields = 'Param_ptr'
      LookupCache = True
      Lookup = True
    end
    object aqDtlItemUNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      DisplayWidth = 6
      FieldKind = fkLookup
      FieldName = 'UNIT_NAME'
      LookupDataSet = aqParamName
      LookupKeyFields = 'RKEY'
      LookupResultField = 'UNIT_CODE'
      KeyFields = 'Param_ptr'
      LookupCache = True
      Lookup = True
    end
    object aqDtlItemParam_Value: TStringField
      DisplayLabel = #21442#25968#20540
      DisplayWidth = 10
      FieldName = 'Param_Value'
      Size = 50
    end
    object aqDtlItemAdd_Type: TWordField
      DisplayLabel = #21442#25968#31867#22411
      DisplayWidth = 22
      FieldName = 'Add_Type'
    end
    object aqDtlItemAdd_Value: TBCDField
      DisplayLabel = #21152#25104
      DisplayWidth = 6
      FieldName = 'Add_Value'
      Precision = 18
      Size = 6
    end
    object aqDtlItemAdd_Time: TStringField
      DisplayLabel = #21152#25104#26102#38388
      DisplayWidth = 8
      FieldName = 'Add_Time'
      Size = 10
    end
    object aqDtlItemNotes: TStringField
      DisplayLabel = #35828#26126
      DisplayWidth = 35
      FieldName = 'Notes'
      Size = 255
    end
  end
  object dsDtlItem: TDataSource
    DataSet = aqDtlItem
    Left = 192
    Top = 160
  end
  object dsSetItem: TDataSource
    DataSet = aqSetItem
    Left = 257
    Top = 160
  end
  object aqSetItem: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'Select * From Data0170'
      'Order By SEQ_NO')
    Left = 257
    Top = 104
    object aqSetItemRKEY: TAutoIncField
      DisplayWidth = 10
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
    object aqSetItemParam_ptr: TIntegerField
      DisplayWidth = 10
      FieldName = 'Param_ptr'
      Visible = False
    end
    object aqSetItemSEQ_NO: TSmallintField
      DisplayLabel = #24207#21495
      DisplayWidth = 5
      FieldName = 'SEQ_NO'
    end
    object aqSetItemPARAMETER_NAME: TStringField
      DisplayLabel = #21442#25968#21517#31216
      FieldKind = fkLookup
      FieldName = 'PARAMETER_NAME'
      LookupDataSet = aqParamName
      LookupKeyFields = 'RKEY'
      LookupResultField = 'PARAMETER_NAME'
      KeyFields = 'Param_ptr'
      LookupCache = True
      Size = 10
      Lookup = True
    end
    object aqSetItemPARAMETER_DESC: TStringField
      DisplayLabel = #21442#25968#25551#36848
      DisplayWidth = 15
      FieldKind = fkLookup
      FieldName = 'PARAMETER_DESC'
      LookupDataSet = aqParamName
      LookupKeyFields = 'RKEY'
      LookupResultField = 'PARAMETER_DESC'
      KeyFields = 'Param_ptr'
      LookupCache = True
      Lookup = True
    end
    object aqSetItemUNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      DisplayWidth = 8
      FieldKind = fkLookup
      FieldName = 'UNIT_NAME'
      LookupDataSet = aqParamName
      LookupKeyFields = 'RKEY'
      LookupResultField = 'UNIT_CODE'
      KeyFields = 'Param_ptr'
      LookupCache = True
      Size = 10
      Lookup = True
    end
    object aqSetItemAddType: TWordField
      DisplayLabel = #21152#20215#31867#22411
      DisplayWidth = 20
      FieldName = 'AddType'
    end
    object aqSetItemNotes: TStringField
      DisplayLabel = #22791#27880
      DisplayWidth = 25
      FieldName = 'Notes'
      Size = 255
    end
  end
  object acAddModel: TADOCommand
    CommandText = 
      'Insert Data0170(Param_ptr,SEQ_NO,AddType,Notes)'#13#10'Values( :Param_' +
      'ptr , :SEQ_NO , :Add_Type , :Notes )'
    Connection = ADOConn
    Parameters = <
      item
        Name = 'Param_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'SEQ_NO'
        Attributes = [paSigned, paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end
      item
        Name = 'Add_Type'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end
      item
        Name = 'Notes'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end>
    Left = 72
  end
  object dsFindRFQ: TDataSource
    DataSet = aqFindRFQ
    Left = 259
    Top = 56
  end
  object aqFindRFQ: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    Parameters = <
      item
        Name = 'Cust_Id'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 1
        Value = Null
      end
      item
        Name = 'Cust_Id'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      'Select *, '
      '  TPOType = Case POType When 0 Then '#39#26032#21333#39
      '                                            When 1 Then '#39#22797#25237#21333#39
      '                                            When 2 Then '#39#22797#25237#21464#26356#21333#39
      '  End'
      'From Data0165'
      'Where (( :Cust_Id = '#39#39') Or (Cust_Id = :Cust_Id))'
      'And Status = 1')
    Left = 259
    object aqFindRFQRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
    object aqFindRFQRFQNo: TStringField
      DisplayLabel = 'RFQ'#32534#21495
      DisplayWidth = 15
      FieldName = 'RFQNo'
      Size = 15
    end
    object aqFindRFQStatus: TWordField
      FieldName = 'Status'
      Visible = False
    end
    object aqFindRFQCust_Id: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'Cust_Id'
      Size = 10
    end
    object aqFindRFQCust_Name: TStringField
      DisplayLabel = #23458#25143#21517#31216
      DisplayWidth = 20
      FieldName = 'Cust_Name'
      Size = 100
    end
    object aqFindRFQCust_Addr: TStringField
      DisplayLabel = #23458#25143#22320#22336
      DisplayWidth = 30
      FieldName = 'Cust_Addr'
      Visible = False
      Size = 100
    end
    object aqFindRFQSalesMan: TStringField
      DisplayLabel = #19994#21153#21592
      FieldName = 'SalesMan'
      Visible = False
      Size = 10
    end
    object aqFindRFQTechContact: TStringField
      DisplayLabel = #25216#26415#32852#31995#20154
      FieldName = 'TechContact'
      Visible = False
      Size = 10
    end
    object aqFindRFQTel: TStringField
      DisplayLabel = #30005#35805
      FieldName = 'Tel'
      Visible = False
    end
    object aqFindRFQMail: TStringField
      DisplayLabel = #37038#31665
      FieldName = 'Mail'
      Visible = False
      Size = 30
    end
    object aqFindRFQFileName: TStringField
      DisplayLabel = #25991#20214#21517
      DisplayWidth = 20
      FieldName = 'FileName'
      Size = 30
    end
    object aqFindRFQFilePath: TStringField
      FieldName = 'FilePath'
      Visible = False
      Size = 80
    end
    object aqFindRFQPartsId: TStringField
      DisplayLabel = #38646#20214#21495
      DisplayWidth = 20
      FieldName = 'PartsId'
      Size = 30
    end
    object aqFindRFQPOType: TStringField
      DisplayLabel = #35746#21333#31867#22411
      FieldName = 'POType'
      Visible = False
      Size = 10
    end
    object aqFindRFQCreateId: TIntegerField
      FieldName = 'CreateId'
      Visible = False
    end
    object aqFindRFQCreateDate: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object aqFindRFQLastModifyId: TIntegerField
      FieldName = 'LastModifyId'
      Visible = False
    end
    object aqFindRFQLastModifyDate: TDateTimeField
      FieldName = 'LastModifyDate'
      Visible = False
    end
    object aqFindRFQAuditId: TIntegerField
      FieldName = 'AuditId'
      Visible = False
    end
    object aqFindRFQAuditDate: TDateTimeField
      FieldName = 'AuditDate'
      Visible = False
    end
    object aqFindRFQTPOType: TStringField
      DisplayLabel = #35746#21333#31867#22411
      FieldName = 'TPOType'
      ReadOnly = True
      Size = 10
    end
  end
  object dsFindCust: TDataSource
    DataSet = aqFindCust
    Left = 200
    Top = 56
  end
  object aqFindCust: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      
        'Select t10.CUST_CODE,t10.CUSTOMER_NAME,t10.BILLING_ADDRESS_1,t5.' +
        'EMPLOYEE_NAME as SALES_REP_NAME,'
      
        '       t1.CURR_CODE,t10.PHONE,t10.FAX,t10.GEN_EMAIL_ADDRESS,t10.' +
        'CONTACT_NAME_1,t10.CONT_PHONE_1'
      'from data0010 t10 Left Join data0005 t5'
      'On t10.SALES_REP_PTR = t5.RKEY'
      'Left Join data0001 t1'
      'On t10.CURRENCY_PTR = t1.RKEY'
      'order by t10.CUST_CODE')
    Left = 200
    object aqFindCustCUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object aqFindCustCUSTOMER_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      DisplayWidth = 20
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object aqFindCustBILLING_ADDRESS_1: TStringField
      DisplayLabel = #23458#25143#22320#22336
      DisplayWidth = 30
      FieldName = 'BILLING_ADDRESS_1'
      Size = 100
    end
    object aqFindCustSALES_REP_NAME: TStringField
      DisplayLabel = #19994#21153#21592
      DisplayWidth = 10
      FieldName = 'SALES_REP_NAME'
      Visible = False
    end
    object aqFindCustCURR_CODE: TStringField
      DisplayLabel = #24065#31181
      FieldName = 'CURR_CODE'
      Visible = False
      Size = 5
    end
    object aqFindCustPHONE: TStringField
      DisplayLabel = #32852#31995#30005#35805
      DisplayWidth = 15
      FieldName = 'PHONE'
      Visible = False
      FixedChar = True
    end
    object aqFindCustFAX: TStringField
      DisplayLabel = #20256#30495
      DisplayWidth = 15
      FieldName = 'FAX'
      Visible = False
      FixedChar = True
    end
    object aqFindCustGEN_EMAIL_ADDRESS: TStringField
      DisplayLabel = #37038#31665
      DisplayWidth = 20
      FieldName = 'GEN_EMAIL_ADDRESS'
      Visible = False
      FixedChar = True
      Size = 50
    end
    object aqFindCustCONTACT_NAME_1: TStringField
      FieldName = 'CONTACT_NAME_1'
      FixedChar = True
    end
    object aqFindCustCONT_PHONE_1: TStringField
      FieldName = 'CONT_PHONE_1'
      FixedChar = True
      Size = 14
    end
  end
  object dsParamName: TDataSource
    DataSet = aqParamName
    Left = 201
    Top = 56
  end
  object dsEngStr: TDataSource
    DataSet = aqEngStr
    Left = 321
    Top = 160
  end
  object aqEngStr: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * From Data0159')
    Left = 321
    Top = 104
    object aqEngStrBoardType: TWordField
      DisplayLabel = #26495#26009#31867#22411
      FieldName = 'BoardType'
    end
    object aqEngStrLayer: TWordField
      DisplayLabel = #23618#25968
      FieldName = 'Layer'
    end
    object aqEngStrEngAmount: TBCDField
      DisplayLabel = #24037#31243#36153'('#20803'/'#31181')'
      FieldName = 'EngAmount'
      Precision = 18
      Size = 3
    end
    object aqEngStrAddEngAmount: TBCDField
      DisplayLabel = #38754#31215#21152#25104#36153'('#20803'/CM2)'
      FieldName = 'AddEngAmount'
      Precision = 18
      Size = 3
    end
    object aqEngStrstdArea: TBCDField
      DisplayLabel = #21152#25104#38754#31215#30028#38480'(CM2)'
      FieldName = 'stdArea'
      Precision = 18
      Size = 2
    end
  end
  object acAudit: TADOCommand
    CommandText = 
      'Update Data0167'#13#10'Set Status = :Status ,'#13#10'       AuditId = :Audit' +
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
    Left = 16
    Top = 56
  end
end
