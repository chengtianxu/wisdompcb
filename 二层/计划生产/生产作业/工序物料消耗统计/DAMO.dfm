object DM: TDM
  OldCreateOrder = False
  Left = 555
  Top = 313
  Height = 340
  Width = 392
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'C:\Program Files\Common Files\System\OLE DB\Data Links\1808.udl'
    Left = 152
    Top = 32
  end
  object adoMain: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.DATA0570.rkey,DBO.DATA0570.formula_number,DBO.DAT' +
      'A0570.number,dbo.DATA0570.ttype, dbo.DATA0570.DEPT_PTR, dbo.Data' +
      '0034.DEPT_CODE, dbo.Data0034.DEPT_NAME,dbo.DATA0570.start_date, ' +
      #13#10#9'   dbo.DATA0570.status, case dbo.DATA0570.status when 0 then ' +
      #39#26377#25928#39' when 1 then '#39#24050#23457#26680#39' end as strStatus,'#9#9#9#13#10'                   ' +
      '   dbo.DATA0570.end_date, dbo.DATA0570.EMPL_PTR, dbo.Data0005.EM' +
      'PLOYEE_NAME as Statistic_user,dbo.DATA0570.Statistic_date, '#13#10#9'  ' +
      '   dbo.DATA0570.authempl_ptr,auth_user.employee_name as auth_use' +
      'rname,DBO.DATA0015.ABBR_NAME,'#13#10'                       dbo.DATA05' +
      '70.auth_date, dbo.DATA0570.theory_result, dbo.DATA0570.measure_r' +
      'esult1, dbo.DATA0570.measure_result2, '#13#10'                      db' +
      'o.DATA0570.measure_result3, dbo.DATA0570.theorycalc_meth, dbo.DA' +
      'TA0570.measurecalc_meth1, dbo.DATA0570.measurecalc_meth2, '#13#10'    ' +
      '                  dbo.DATA0570.measurecalc_meth3, dbo.DATA0570.m' +
      'aster_remark,expend_QUANTITY,dbo.data0570.warehouse_ptr,dbo.data' +
      '0570.pnl_totalsqrt'#13#10'FROM         dbo.DATA0570 INNER JOIN'#13#10'      ' +
      '                dbo.Data0034 ON dbo.DATA0570.DEPT_PTR = dbo.Data' +
      '0034.RKEY INNER JOIN'#13#10'                      dbo.Data0005 ON dbo.' +
      'DATA0570.EMPL_PTR = dbo.Data0005.RKEY'#9'LEFT JOIN'#13#10#9'    dbo.Data00' +
      '05 as auth_user ON dbo.Data0570.authempl_ptr= auth_user.RKEY LEF' +
      'T JOIN'#13#10#9'    DBO.DATA0015 ON DBO.DATA0015.RKEY = DBO.DATA0570.wa' +
      'rehouse_ptr'#13#10'where    dbo.DATA0570.ttype=0 and dbo.DATA0570.star' +
      't_date>= :startdate and dbo.DATA0570.start_date<= :enddate '
    Parameters = <
      item
        Name = 'startdate'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'enddate'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    Left = 40
    Top = 104
    object adoMainnumber: TStringField
      DisplayLabel = #32479#35745#32534#21495
      FieldName = 'number'
      ReadOnly = True
      Size = 15
    end
    object adoMainttype: TWordField
      FieldName = 'ttype'
      ReadOnly = True
    end
    object adoMainDEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
      ReadOnly = True
    end
    object adoMainDEPT_CODE: TStringField
      DisplayLabel = #24037#24207#20195#30721
      FieldName = 'DEPT_CODE'
      ReadOnly = True
      Size = 10
    end
    object adoMainDEPT_NAME: TStringField
      DisplayLabel = #32479#35745#24037#24207
      FieldName = 'DEPT_NAME'
      ReadOnly = True
      Size = 30
    end
    object adoMainstart_date: TDateTimeField
      DisplayLabel = #24320#22987#26085#26399
      FieldName = 'start_date'
      ReadOnly = True
    end
    object adoMainstatus: TWordField
      FieldName = 'status'
      ReadOnly = True
    end
    object adoMainstrStatus: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'strStatus'
      ReadOnly = True
      Size = 6
    end
    object adoMainend_date: TDateTimeField
      DisplayLabel = #32467#26463#26085#26399
      FieldName = 'end_date'
      ReadOnly = True
    end
    object adoMainEMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
      ReadOnly = True
    end
    object adoMainStatistic_user: TStringField
      DisplayLabel = #32479#35745#20154
      FieldName = 'Statistic_user'
      ReadOnly = True
      Size = 16
    end
    object adoMainStatistic_date: TDateTimeField
      DisplayLabel = #32479#35745#26085#26399
      FieldName = 'Statistic_date'
      ReadOnly = True
    end
    object adoMainauthempl_ptr: TIntegerField
      FieldName = 'authempl_ptr'
      ReadOnly = True
    end
    object adoMainauth_username: TStringField
      DisplayLabel = #23457#26680#20154
      FieldName = 'auth_username'
      ReadOnly = True
      Size = 16
    end
    object adoMainauth_date: TDateTimeField
      DisplayLabel = #23457#26680#26085#26399
      FieldName = 'auth_date'
      ReadOnly = True
    end
    object adoMaintheory_result: TBCDField
      DisplayLabel = #29702#35770#35745#31639#32467#26524
      FieldName = 'theory_result'
      ReadOnly = True
      Precision = 12
    end
    object adoMainpnl_totalsqrt: TBCDField
      DisplayLabel = #29983#20135#38754#31215
      FieldName = 'pnl_totalsqrt'
      Precision = 10
      Size = 8
    end
    object adoMainmeasure_result1: TBCDField
      DisplayLabel = #26368#22823#35745#31639#32467#26524
      FieldName = 'measure_result1'
      ReadOnly = True
      Precision = 12
    end
    object adoMainmeasure_result2: TBCDField
      DisplayLabel = #26368#23567#35745#31639#32467#26524
      FieldName = 'measure_result2'
      ReadOnly = True
      Precision = 12
    end
    object adoMainmeasure_result3: TBCDField
      DisplayLabel = #24179#22343#35745#31639#32467#26524
      FieldName = 'measure_result3'
      ReadOnly = True
      Precision = 12
    end
    object adoMaintheorycalc_meth: TStringField
      DisplayLabel = #29702#35770#32467#26524#35745#31639#20844#24335
      FieldName = 'theorycalc_meth'
      ReadOnly = True
      Size = 400
    end
    object adoMainmeasurecalc_meth1: TStringField
      DisplayLabel = #26368#22823#32467#26524#35745#31639#20844#24335
      FieldName = 'measurecalc_meth1'
      ReadOnly = True
      Size = 400
    end
    object adoMainmeasurecalc_meth2: TStringField
      DisplayLabel = #26368#23567#32467#26524#35745#31639#20844#24335
      FieldName = 'measurecalc_meth2'
      ReadOnly = True
      Size = 400
    end
    object adoMainmeasurecalc_meth3: TStringField
      DisplayLabel = #24179#22343#32467#26524#35745#31639#20844#24335
      FieldName = 'measurecalc_meth3'
      ReadOnly = True
      Size = 400
    end
    object adoMainmaster_remark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'master_remark'
      ReadOnly = True
      Size = 50
    end
    object adoMainrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object adoMainformula_number: TStringField
      DisplayLabel = #20844#24335#20195#30721
      FieldName = 'formula_number'
      Size = 10
    end
    object adoMainexpend_QUANTITY: TBCDField
      DisplayLabel = #23454#38469#39046#26009
      FieldName = 'expend_QUANTITY'
      Precision = 10
      Size = 2
    end
    object adoMainABBR_NAME: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object adoMainwarehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
  end
  object adoTmp: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 272
    Top = 248
  end
  object adoTime: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    Left = 208
    Top = 248
  end
  object DataSource1: TDataSource
    DataSet = adoMain
    Left = 96
    Top = 104
  end
  object DataSource2: TDataSource
    DataSet = cds571
    Left = 210
    Top = 184
  end
  object ado571: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey570'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      
        'SELECT     Statistic_ptr, recno_number, ttype,case ttype when 0 ' +
        'then '#39#26679#26495#39' when 1 then '#39#37327#20135#39' end as type, WORK_ORDER_number, PANEL' +
        '_A_B, customer_name,'
      
        '            MANU_PART_NUMBER, MANU_PART_DESC, pan_qty, pcs_qty, ' +
        'pan_size, layers,DEPT_PTR,'
      
        '            pcs_size, pan_sqrt, pcs_sqrt, pan_qty*pan_sqrt as to' +
        'tal_sqrt, theory_result, PARA_PTR_0, PARA_PTR_1, PARA_PTR_2, PAR' +
        'A_PTR_3, PARA_PTR_4, '
      
        #9#9#9'PARA_PTR_5, PARA_PTR_6, PARA_PTR_7, PARA_PTR_8, PARA_PTR_9, P' +
        'ARA_VALUE_0, PARA_VALUE_1, PARA_VALUE_2, '
      
        '            PARA_VALUE_3, PARA_VALUE_4, PARA_VALUE_5, PARA_VALUE' +
        '_6, PARA_VALUE_7, PARA_VALUE_8, PARA_VALUE_9,   REMARK,if_read57' +
        '1'
      'FROM         dbo.DATA0571'
      'where dbo.data0571.Statistic_ptr=:rkey570')
    Left = 42
    Top = 184
    object ado571MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      DisplayWidth = 30
      FieldName = 'MANU_PART_NUMBER'
      Size = 30
    end
    object ado571MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ado571customer_name: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'customer_name'
    end
    object ado571type: TStringField
      DisplayLabel = #26679#26495'/'#37327#20135
      FieldName = 'type'
      ReadOnly = True
      Size = 4
    end
    object ado571WORK_ORDER_number: TStringField
      DisplayLabel = #20316#19994#21333#21495
      DisplayWidth = 22
      FieldName = 'WORK_ORDER_number'
      Size = 22
    end
    object ado571PANEL_A_B: TStringField
      DisplayLabel = 'PANEL_A/B'
      FieldName = 'PANEL_A_B'
      Size = 4
    end
    object ado571pan_qty: TIntegerField
      DisplayLabel = 'PANEL'#25968#37327
      FieldName = 'pan_qty'
    end
    object ado571pcs_qty: TIntegerField
      DisplayLabel = 'PCS'#25968#37327
      FieldName = 'pcs_qty'
    end
    object ado571pan_size: TStringField
      DisplayLabel = 'PANEL'#23610#23544
      FieldName = 'pan_size'
      Size = 30
    end
    object ado571pcs_size: TStringField
      DisplayLabel = 'PCS'#23610#23544
      FieldName = 'pcs_size'
      Size = 30
    end
    object ado571pan_sqrt: TBCDField
      DisplayLabel = 'PANEL'#38754#31215
      FieldName = 'pan_sqrt'
      Precision = 10
      Size = 8
    end
    object ado571pcs_sqrt: TBCDField
      DisplayLabel = 'PCS'#38754#31215
      FieldName = 'pcs_sqrt'
      Precision = 10
      Size = 8
    end
    object ado571total_sqrt: TBCDField
      DisplayLabel = 'PANEL'#24635#38754#31215
      FieldName = 'total_sqrt'
      ReadOnly = True
      Precision = 21
      Size = 8
    end
    object ado571layers: TWordField
      DisplayLabel = #23618#25968
      FieldName = 'layers'
    end
    object ado571recno_number: TIntegerField
      FieldName = 'recno_number'
    end
    object ado571PARA_PTR_0: TIntegerField
      DisplayLabel = #21442#25968'0'
      FieldName = 'PARA_PTR_0'
    end
    object ado571PARA_PTR_1: TIntegerField
      DisplayLabel = #21442#25968'1'
      FieldName = 'PARA_PTR_1'
    end
    object ado571PARA_PTR_2: TIntegerField
      DisplayLabel = #21442#25968'2'
      FieldName = 'PARA_PTR_2'
    end
    object ado571PARA_PTR_3: TIntegerField
      DisplayLabel = #21442#25968'3'
      FieldName = 'PARA_PTR_3'
    end
    object ado571PARA_VALUE_0: TStringField
      DisplayLabel = #21442#25968#20540'0'
      FieldName = 'PARA_VALUE_0'
      Size = 30
    end
    object ado571PARA_VALUE_1: TStringField
      DisplayLabel = #21442#25968#20540'1'
      FieldName = 'PARA_VALUE_1'
      Size = 30
    end
    object ado571PARA_VALUE_2: TStringField
      DisplayLabel = #21442#25968#20540'2'
      FieldName = 'PARA_VALUE_2'
      Size = 30
    end
    object ado571PARA_VALUE_3: TStringField
      DisplayLabel = #21442#25968#20540'3'
      FieldName = 'PARA_VALUE_3'
      Size = 30
    end
    object ado571PARA_PTR_4: TIntegerField
      FieldName = 'PARA_PTR_4'
    end
    object ado571PARA_PTR_5: TIntegerField
      FieldName = 'PARA_PTR_5'
    end
    object ado571PARA_PTR_6: TIntegerField
      FieldName = 'PARA_PTR_6'
    end
    object ado571PARA_PTR_7: TIntegerField
      FieldName = 'PARA_PTR_7'
    end
    object ado571PARA_PTR_8: TIntegerField
      FieldName = 'PARA_PTR_8'
    end
    object ado571PARA_PTR_9: TIntegerField
      FieldName = 'PARA_PTR_9'
    end
    object ado571PARA_VALUE_4: TStringField
      FieldName = 'PARA_VALUE_4'
      Size = 30
    end
    object ado571PARA_VALUE_5: TStringField
      FieldName = 'PARA_VALUE_5'
      Size = 30
    end
    object ado571PARA_VALUE_6: TStringField
      FieldName = 'PARA_VALUE_6'
      Size = 30
    end
    object ado571PARA_VALUE_7: TStringField
      FieldName = 'PARA_VALUE_7'
      Size = 30
    end
    object ado571PARA_VALUE_8: TStringField
      FieldName = 'PARA_VALUE_8'
      Size = 30
    end
    object ado571PARA_VALUE_9: TStringField
      FieldName = 'PARA_VALUE_9'
      Size = 30
    end
    object ado571theory_result: TBCDField
      DisplayLabel = #29702#35770#32467#26524
      FieldName = 'theory_result'
      Precision = 12
    end
    object ado571REMARK: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REMARK'
      Size = 50
    end
    object ado571if_read571: TStringField
      FieldName = 'if_read571'
      FixedChar = True
      Size = 1
    end
    object ado571Statistic_ptr: TIntegerField
      FieldName = 'Statistic_ptr'
    end
    object ado571ttype: TWordField
      FieldName = 'ttype'
    end
    object ado571DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
  end
  object dsp571: TDataSetProvider
    DataSet = ado571
    Left = 98
    Top = 184
  end
  object cds571: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    FieldDefs = <
      item
        Name = 'MANU_PART_NUMBER'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MANU_PART_DESC'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'customer_name'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'type'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 4
      end
      item
        Name = 'WORK_ORDER_number'
        DataType = ftString
        Size = 22
      end
      item
        Name = 'PANEL_A_B'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'pan_qty'
        DataType = ftInteger
      end
      item
        Name = 'pcs_qty'
        DataType = ftInteger
      end
      item
        Name = 'pan_size'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'pcs_size'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'pan_sqrt'
        DataType = ftBCD
        Precision = 10
        Size = 8
      end
      item
        Name = 'pcs_sqrt'
        DataType = ftBCD
        Precision = 10
        Size = 8
      end
      item
        Name = 'total_sqrt'
        Attributes = [faReadonly]
        DataType = ftBCD
        Precision = 21
        Size = 8
      end
      item
        Name = 'layers'
        DataType = ftSmallint
      end
      item
        Name = 'recno_number'
        DataType = ftInteger
      end
      item
        Name = 'PARA_PTR_0'
        DataType = ftInteger
      end
      item
        Name = 'PARA_PTR_1'
        DataType = ftInteger
      end
      item
        Name = 'PARA_PTR_2'
        DataType = ftInteger
      end
      item
        Name = 'PARA_PTR_3'
        DataType = ftInteger
      end
      item
        Name = 'PARA_VALUE_0'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'PARA_VALUE_1'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'PARA_VALUE_2'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'PARA_VALUE_3'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'PARA_PTR_4'
        DataType = ftInteger
      end
      item
        Name = 'PARA_PTR_5'
        DataType = ftInteger
      end
      item
        Name = 'PARA_PTR_6'
        DataType = ftInteger
      end
      item
        Name = 'PARA_PTR_7'
        DataType = ftInteger
      end
      item
        Name = 'PARA_PTR_8'
        DataType = ftInteger
      end
      item
        Name = 'PARA_PTR_9'
        DataType = ftInteger
      end
      item
        Name = 'PARA_VALUE_4'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'PARA_VALUE_5'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'PARA_VALUE_6'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'PARA_VALUE_7'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'PARA_VALUE_8'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'PARA_VALUE_9'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'theory_result'
        DataType = ftBCD
        Precision = 12
        Size = 4
      end
      item
        Name = 'REMARK'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'if_read571'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Statistic_ptr'
        DataType = ftInteger
      end
      item
        Name = 'ttype'
        DataType = ftSmallint
      end
      item
        Name = 'DEPT_PTR'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dsp571'
    StoreDefs = True
    AfterPost = cds571AfterPost
    OnCalcFields = cds571CalcFields
    Left = 146
    Top = 184
    object cds571MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      DisplayWidth = 30
      FieldName = 'MANU_PART_NUMBER'
      Size = 30
    end
    object cds571MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object cds571Statistic_ptr: TIntegerField
      FieldName = 'Statistic_ptr'
    end
    object cds571customer_name: TStringField
      FieldName = 'customer_name'
    end
    object cds571type: TStringField
      DisplayLabel = #26679#26495'/'#37327#20135
      FieldName = 'type'
      Size = 4
    end
    object cds571WORK_ORDER_number: TStringField
      FieldName = 'WORK_ORDER_number'
      Size = 22
    end
    object cds571PANEL_A_B: TStringField
      DisplayLabel = 'PANEL_A/B'
      FieldName = 'PANEL_A_B'
      Size = 4
    end
    object cds571pan_qty: TIntegerField
      DisplayLabel = 'PANEL'#25968#37327
      FieldName = 'pan_qty'
    end
    object cds571pcs_qty: TIntegerField
      DisplayLabel = 'PCS'#25968#37327
      FieldName = 'pcs_qty'
    end
    object cds571pan_size: TStringField
      DisplayLabel = 'PANEL'#23610#23544
      FieldName = 'pan_size'
      Size = 30
    end
    object cds571pcs_size: TStringField
      DisplayLabel = 'PCS'#23610#23544
      FieldName = 'pcs_size'
      Size = 30
    end
    object cds571pan_sqrt: TBCDField
      DisplayLabel = 'PANEL'#38754#31215
      FieldName = 'pan_sqrt'
      Precision = 10
      Size = 8
    end
    object cds571pcs_sqrt: TBCDField
      DisplayLabel = 'PCS'#38754#31215
      FieldName = 'pcs_sqrt'
      Precision = 10
      Size = 8
    end
    object cds571layers: TSmallintField
      DisplayLabel = #23618#25968
      FieldName = 'layers'
    end
    object cds571theory_result: TBCDField
      DisplayLabel = #29702#35770#32467#26524
      FieldName = 'theory_result'
      Precision = 12
    end
    object cds571REMARK: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REMARK'
      Size = 50
    end
    object cds571recno_number: TIntegerField
      FieldName = 'recno_number'
    end
    object cds571ttype: TSmallintField
      FieldName = 'ttype'
    end
    object cds571total_sqrt: TBCDField
      DisplayLabel = 'PANEL'#24635#38754#31215
      FieldName = 'total_sqrt'
      Precision = 21
      Size = 8
    end
    object cds571if_read571: TStringField
      DisplayLabel = #26087#26723#26696
      FieldName = 'if_read571'
      FixedChar = True
      Size = 1
    end
    object cds571perpanel_result: TBCDField
      FieldKind = fkCalculated
      FieldName = 'perpanel_result'
      Calculated = True
    end
    object cds571PARA_PTR_0: TIntegerField
      DisplayLabel = #21442#25968'0'
      FieldName = 'PARA_PTR_0'
    end
    object cds571PARA_PTR_1: TIntegerField
      DisplayLabel = #21442#25968'1'
      FieldName = 'PARA_PTR_1'
    end
    object cds571PARA_PTR_2: TIntegerField
      DisplayLabel = #21442#25968'2'
      FieldName = 'PARA_PTR_2'
    end
    object cds571PARA_PTR_4: TIntegerField
      FieldName = 'PARA_PTR_4'
    end
    object cds571PARA_PTR_3: TIntegerField
      DisplayLabel = #21442#25968'3'
      FieldName = 'PARA_PTR_3'
    end
    object cds571PARA_PTR_5: TIntegerField
      FieldName = 'PARA_PTR_5'
    end
    object cds571PARA_PTR_6: TIntegerField
      FieldName = 'PARA_PTR_6'
    end
    object cds571PARA_PTR_7: TIntegerField
      FieldName = 'PARA_PTR_7'
    end
    object cds571PARA_PTR_8: TIntegerField
      FieldName = 'PARA_PTR_8'
    end
    object cds571PARA_PTR_9: TIntegerField
      FieldName = 'PARA_PTR_9'
    end
    object cds571PARA_VALUE_0: TStringField
      FieldName = 'PARA_VALUE_0'
      OnChange = cds571PARA_VALUE_0Change
      Size = 30
    end
    object cds571PARA_VALUE_1: TStringField
      FieldName = 'PARA_VALUE_1'
      OnChange = cds571PARA_VALUE_0Change
      Size = 30
    end
    object cds571PARA_VALUE_2: TStringField
      FieldName = 'PARA_VALUE_2'
      OnChange = cds571PARA_VALUE_0Change
      Size = 30
    end
    object cds571PARA_VALUE_3: TStringField
      FieldName = 'PARA_VALUE_3'
      OnChange = cds571PARA_VALUE_0Change
      Size = 30
    end
    object cds571PARA_VALUE_4: TStringField
      FieldName = 'PARA_VALUE_4'
      Size = 30
    end
    object cds571PARA_VALUE_5: TStringField
      FieldName = 'PARA_VALUE_5'
      Size = 30
    end
    object cds571PARA_VALUE_6: TStringField
      FieldName = 'PARA_VALUE_6'
      Size = 30
    end
    object cds571PARA_VALUE_7: TStringField
      FieldName = 'PARA_VALUE_7'
      Size = 30
    end
    object cds571PARA_VALUE_8: TStringField
      FieldName = 'PARA_VALUE_8'
      Size = 30
    end
    object cds571PARA_VALUE_9: TStringField
      FieldName = 'PARA_VALUE_9'
      Size = 30
    end
    object cds571DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object cds571dept_name: TStringField
      DisplayLabel = #24037#24207#20195#30721
      FieldKind = fkCalculated
      FieldName = 'dept_name'
      Calculated = True
    end
  end
  object ads571: TADODataSet
    Connection = ADOConnection1
    CommandText = 
      ' SELECT     dbo.DATA0571.recno_number, dbo.DATA0571.ttype,'#13#10#9#9#9'c' +
      'ase  dbo.DATA0571.ttype when 0 then '#39#26679#26495#39' when 1 then '#39#37327#20135#39' end as' +
      ' type, '#13#10#9#9#9' dbo.DATA0571.WORK_ORDER_number,  dbo.DATA0571.PANEL' +
      '_A_B,  dbo.DATA0571.customer_name,dbo.DATA0571.DEPT_PTR,DBO.DATA' +
      '0034.DEPT_CODE,data0015.abbr_name,'#13#10'            dbo.DATA0571. MA' +
      'NU_PART_NUMBER,  dbo.DATA0571.MANU_PART_DESC,  dbo.DATA0571.pan_' +
      'qty,  dbo.DATA0571.pcs_qty,  dbo.DATA0571.pan_size, layers,'#13#10'   ' +
      '          dbo.DATA0571.pcs_size,  dbo.DATA0571.pan_sqrt,  dbo.DA' +
      'TA0571.pcs_sqrt, pan_qty*pan_sqrt as total_sqrt,  dbo.DATA0571.t' +
      'heory_result,DATA0570.FORMULA_NUMBER,'#13#10'            PARA_VALUE_0,' +
      ' PARA_VALUE_1, PARA_VALUE_2, PARA_VALUE_3, PARA_VALUE_4, '#13#10'     ' +
      '       PARA_VALUE_5, PARA_VALUE_6, PARA_VALUE_7, PARA_VALUE_8, P' +
      'ARA_VALUE_9,'#13#10'            REMARK,if_read571,substring(convert(va' +
      'rchar(20),dbo.DATA0570.start_date,120),1,10) as start_date'#13#10'FROM' +
      '        dbo.DATA0571 INNER JOIN '#13#10#9#9#9#9#9'dbo.DATA0570 ON dbo.DATA0' +
      '571.Statistic_ptr=dbo.DATA0570.RKEY   LEFT JOIN '#13#10'             D' +
      'BO.DATA0034 ON DBO.DATA0571.DEPT_PTR=DBO.DATA0034.RKEY LEFT JOIN' +
      #13#10#9'    DBO.DATA0015 ON DBO.DATA0015.RKEY = DBO.DATA0570.warehous' +
      'e_ptr'#13#10'where dbo.DATA0570.formula_number=:formula and dbo.data05' +
      '70.warehouse_ptr=:warehouse  and dbo.DATA0570.start_date between' +
      ' :s and :e'#13#10
    Parameters = <
      item
        Name = 'formula'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = 'warehouse'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 's'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'e'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    Left = 48
    Top = 248
    object ads571recno_number: TIntegerField
      FieldName = 'recno_number'
      DisplayFormat = #24207#21495
    end
    object ads571MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ads571MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ads571DEPT_CODE: TStringField
      DisplayLabel = #24037#24207#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ads571ttype: TWordField
      FieldName = 'ttype'
      DisplayFormat = #20135#21697#31867#22411
    end
    object ads571PANEL_A_B: TStringField
      FieldName = 'PANEL_A_B'
      Size = 4
    end
    object ads571pan_qty: TIntegerField
      DisplayLabel = 'PANEL'#25968#37327
      FieldName = 'pan_qty'
    end
    object ads571pcs_qty: TIntegerField
      DisplayLabel = 'PCS'#25968#37327
      FieldName = 'pcs_qty'
    end
    object ads571pan_size: TStringField
      DisplayLabel = 'PANEL'#23610#23544
      FieldName = 'pan_size'
      Size = 30
    end
    object ads571layers: TWordField
      DisplayLabel = #23618#25968
      FieldName = 'layers'
    end
    object ads571pcs_size: TStringField
      DisplayLabel = 'PCS'#23610#23544
      FieldName = 'pcs_size'
      Size = 30
    end
    object ads571pan_sqrt: TBCDField
      DisplayLabel = 'PANEL'#38754#31215
      FieldName = 'pan_sqrt'
      Precision = 10
      Size = 8
    end
    object ads571pcs_sqrt: TBCDField
      DisplayLabel = 'PCS'#38754#31215
      FieldName = 'pcs_sqrt'
      Precision = 10
      Size = 8
    end
    object ads571total_sqrt: TBCDField
      DisplayLabel = #24635#38754#31215
      FieldName = 'total_sqrt'
      ReadOnly = True
      Precision = 21
      Size = 8
    end
    object ads571PARA_VALUE_0: TStringField
      DisplayLabel = #21442#25968'0'
      FieldName = 'PARA_VALUE_0'
      Size = 30
    end
    object ads571PARA_VALUE_1: TStringField
      DisplayLabel = #21442#25968'1'
      FieldName = 'PARA_VALUE_1'
      Size = 30
    end
    object ads571PARA_VALUE_2: TStringField
      DisplayLabel = #21442#25968'2'
      FieldName = 'PARA_VALUE_2'
      Size = 30
    end
    object ads571PARA_VALUE_3: TStringField
      DisplayLabel = #21442#25968'3'
      FieldName = 'PARA_VALUE_3'
      Size = 30
    end
    object ads571PARA_VALUE_4: TStringField
      DisplayLabel = #21442#25968'4'
      FieldName = 'PARA_VALUE_4'
      Size = 30
    end
    object ads571PARA_VALUE_5: TStringField
      DisplayLabel = #21442#25968'5'
      FieldName = 'PARA_VALUE_5'
      Size = 30
    end
    object ads571PARA_VALUE_6: TStringField
      DisplayLabel = #21442#25968'6'
      FieldName = 'PARA_VALUE_6'
      Size = 30
    end
    object ads571PARA_VALUE_7: TStringField
      DisplayLabel = #21442#25968'7'
      FieldName = 'PARA_VALUE_7'
      Size = 30
    end
    object ads571PARA_VALUE_8: TStringField
      DisplayLabel = #21442#25968'8'
      FieldName = 'PARA_VALUE_8'
      Size = 30
    end
    object ads571PARA_VALUE_9: TStringField
      DisplayLabel = #21442#25968'9'
      FieldName = 'PARA_VALUE_9'
      Size = 30
    end
    object ads571theory_result: TBCDField
      DisplayLabel = #29702#35770#32467#26524
      FieldName = 'theory_result'
      Precision = 12
    end
    object ads571start_date: TStringField
      DisplayLabel = #26085#26399
      FieldName = 'start_date'
      ReadOnly = True
    end
    object ads571REMARK: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REMARK'
      Size = 500
    end
    object ads571abbr_name: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'abbr_name'
      Size = 10
    end
    object ads571FORMULA_NUMBER: TStringField
      DisplayLabel = #20844#24335#32534#30721
      FieldName = 'FORMULA_NUMBER'
      Size = 10
    end
  end
  object DataSource3: TDataSource
    DataSet = ads571
    Left = 112
    Top = 248
  end
end
