object DM: TDM
  OldCreateOrder = False
  Left = 444
  Top = 287
  Height = 355
  Width = 432
  object ADOConnection1: TADOConnection
    ConnectionTimeout = 30
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 24
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery4
    Left = 128
    Top = 24
  end
  object ADOQuery4: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'SELECT Data0006.WORK_ORDER_NUMBER,'
      
        'Data0010.CUST_CODE,Data0025.MANU_PART_NUMBER,Data0025.MANU_PART_' +
        'DESC,'
      
        'Data0025.ANALYSIS_CODE_2,Data0034.DEPT_CODE,Data0034.DEPT_NAME,D' +
        'ata0056.INTIME AS '#25509#25910#26102#38388','
      'Data0006.ENT_DATETIME AS '#25237#20135#26102#38388','
      'Data0006.sch_compl_date AS '#35745#21010#23436#24037#26085#26399','
      
        'Data0056.STEP,DATEDIFF(day,data0056.assign_date,Data0006.sch_com' +
        'pl_date) AS '#20132#36135#21608#26399','
      'DATEDIFF(day,  GETDATE(),Data0006.sch_compl_date) AS '#20132#36135#21608#26399'2,'
      'Data0056.DEPT_PTR,Data0006.pnl_size,Data0006.QUAN_SCH AS '#25237#20135#25968#37327','
      
        'Data0006.PANELS AS '#25237#20135#25968#37327'PANEL,Data0056.QTY_BACKLOG AS '#22312#32447#25968#37327'PCS,Dat' +
        'a0056.PANELS AS '#22312#32447#25968#37327'PANEL,Data0006.RELEASE_DATE,Data0006.PROD_ST' +
        'ATUS,'
      'CASE Data0006.PROD_STATUS WHEN 3 THEN '#39#29983#20135#20013#39' WHEN 4 THEN '#39#22806#21457#29983#20135#39' '
      
        'WHEN 5 THEN '#39#24453#20837#20179#39' WHEN 6 THEN '#39#24453#20998#37197#39' WHEN 103 THEN '#39#29983#20135#20013#26242#32531#39' END AS' +
        ' '#20316#19994#21333#29366#24577','
      
        'CASE data0006.wtype WHEN 0 THEN '#39#27491#24120#39' WHEN 1 THEN '#39#23614#25968#39' WHEN 2 THE' +
        'N '#39#24453#36820#24037#39' '
      
        'WHEN 3 THEN '#39#36820#24037#39' WHEN 4 THEN '#39#24453#25253#24223#39' WHEN 5 THEN '#39#24050#25253#24223#39' END AS '#25209#27425#29366#24577 +
        ','
      
        'ROUND(Data0056.QTY_BACKLOG * Data0025.unit_sq,4) AS wip_area,Dat' +
        'a0006.CUT_NO,Data0060.SALES_ORDER,'
      
        'CONVERT(varchar,DATEDIFF(hh,Data0056.INTIME,GETDATE()) / 24) + '#39 +
        #22825#39' '
      
        '+ CONVERT(varchar,DATEDIFF(hh,Data0056.INTIME,GETDATE()) % 24) +' +
        ' '#39#26102#39' '
      
        '+ CONVERT(varchar,DATEDIFF(mi,Data0056.INTIME,GETDATE()) % 60) +' +
        ' '#39#20998#39' AS '#22312#32447#26102#38271','
      
        'CASE WHEN data0025.parent_ptr IS NULL THEN '#39#22806#23618#39' ELSE '#39#20869#23618#39' END AS' +
        ' '#20869#22806#23618','
      'CASE Data0056.wType WHEN 0 THEN '#39#39' ELSE '#39#26159#39' END AS '#36820#24037#20013','
      'CASE WHEN Data0056.PUT_TYPE > 0 THEN '#39#26159#39' ELSE '#39#39' END AS '#27491#24120#37325#26816','
      'Data0097.PO_NUMBER,Data0060.so_oldnew,Data0056.REFERENCE,'
      'case isnull(data0060.so_tp,0) when 0 then '#39#33258#21046#39' when 1 then '#39#22806#21457#39' '
      'when 2 then '#39#21322#21046#31243#39' end as sotp,'
      
        'case Data0025.ttype when 0 then '#39#37327#26495#39' when 1 then '#39#26679#26495#39' end as tty' +
        'pe,'
      'Data0056.FLOW_NO,Data0015.ABBR_NAME,Data0006.Rkey,'
      
        'case data0056.IF_PAIGONG when 0 then '#39#21542#39' when 1 then '#39#26159#39' end as ' +
        #26159#21542#27966#24037','
      'data0056.assign_cycle,data0056.assign_date,data0056.DateValue,'
      
        'dateadd(hh,data0056.FLOW_NO,dateadd(mi,data0056.DateValue*60,dat' +
        'a0056.assign_date)) as '#27966#24037#35201#27714#23436#25104#26102#38388','
      
        'datediff(mi,getdate(),dateadd(hh,data0056.FLOW_NO,dateadd(mi,dat' +
        'a0056.DateValue*60,data0056.assign_date)))/30/2.0 as '#27966#24037#21097#20313#23567#26102','
      
        'case when (datediff(mi,getdate(),dateadd(hh,data0056.FLOW_NO,dat' +
        'eadd(mi,data0056.DateValue*60,data0056.assign_date)))/30/2.0<0) ' +
        'then '#39'Y'#39' else '#39'N'#39' end as '#27966#24037#26159#21542#36229#26102','
      'DATEDIFF(day,  GETDATE(),Data0056.INTIME) AS '#22312#32447#20572#30041#26102#38388','
      
        'CASE WHEN Data0006.PARTS_PER_PANEL <> 0 THEN data0056.QTY_BACKLO' +
        'G * (Data0006.panel_ln * Data0006.panel_wd * 0.000001)/Data0006.' +
        'PARTS_PER_PANEL ELSE 0 END AS pl_area'
      ''
      'FROM Data0008 INNER JOIN '
      'Data0006 INNER JOIN '
      'Data0056 ON Data0006.RKEY = Data0056.WO_PTR INNER JOIN '
      'Data0015 on Data0056.LOC_PTR=Data0015.rkey inner join '
      'Data0025 ON Data0006.BOM_PTR = Data0025.RKEY INNER JOIN '
      'Data0034 ON Data0056.DEPT_PTR = Data0034.RKEY INNER JOIN '
      'Data0010 INNER JOIN '
      
        'Data0492 ON Data0010.RKEY = Data0492.COMPLETED ON Data0006.CUT_N' +
        'O = Data0492.CUT_NO ON  Data0008.RKEY = Data0025.PROD_CODE_PTR L' +
        'EFT OUTER JOIN '
      'Data0060 LEFT OUTER JOIN'
      
        ' Data0097 ON Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY ON Data' +
        '0492.SO_NO = Data0060.SALES_ORDER'
      'WHERE Data0056.QTY_BACKLOG > 0 ')
    Left = 192
    Top = 24
    object ADOQuery4WORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object ADOQuery4CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADOQuery4MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOQuery4MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ADOQuery4ANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      Size = 80
    end
    object ADOQuery4DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADOQuery4DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADOQuery4DSDesigner: TDateTimeField
      FieldName = #25509#25910#26102#38388
    end
    object ADOQuery4DSDesigner2: TDateTimeField
      FieldName = #25237#20135#26102#38388
    end
    object ADOQuery4DSDesigner3: TDateTimeField
      FieldName = #35745#21010#23436#24037#26085#26399
    end
    object ADOQuery4STEP: TSmallintField
      FieldName = 'STEP'
    end
    object ADOQuery4DSDesigner4: TIntegerField
      FieldName = #20132#36135#21608#26399
      ReadOnly = True
    end
    object ADOQuery4DSDesigner22: TIntegerField
      FieldName = #20132#36135#21608#26399'2'
      ReadOnly = True
    end
    object ADOQuery4DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ADOQuery4pnl_size: TStringField
      FieldName = 'pnl_size'
    end
    object ADOQuery4DSDesigner5: TFloatField
      FieldName = #25237#20135#25968#37327
    end
    object ADOQuery4PANEL: TIntegerField
      FieldName = #25237#20135#25968#37327'PANEL'
    end
    object ADOQuery4PCS: TFloatField
      FieldName = #22312#32447#25968#37327'PCS'
    end
    object ADOQuery4PANEL2: TIntegerField
      FieldName = #22312#32447#25968#37327'PANEL'
    end
    object ADOQuery4RELEASE_DATE: TDateTimeField
      FieldName = 'RELEASE_DATE'
    end
    object ADOQuery4PROD_STATUS: TSmallintField
      FieldName = 'PROD_STATUS'
    end
    object ADOQuery4DSDesigner6: TStringField
      FieldName = #20316#19994#21333#29366#24577
      ReadOnly = True
      Size = 10
    end
    object ADOQuery4DSDesigner7: TStringField
      FieldName = #25209#27425#29366#24577
      ReadOnly = True
      Size = 6
    end
    object ADOQuery4wip_area: TFloatField
      FieldName = 'wip_area'
      ReadOnly = True
    end
    object ADOQuery4CUT_NO: TStringField
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object ADOQuery4SALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ADOQuery4DSDesigner8: TStringField
      FieldName = #22312#32447#26102#38271
      ReadOnly = True
      Size = 96
    end
    object ADOQuery4DSDesigner9: TStringField
      FieldName = #20869#22806#23618
      ReadOnly = True
      Size = 4
    end
    object ADOQuery4DSDesigner10: TStringField
      FieldName = #36820#24037#20013
      ReadOnly = True
      Size = 2
    end
    object ADOQuery4DSDesigner11: TStringField
      FieldName = #27491#24120#37325#26816
      ReadOnly = True
      Size = 2
    end
    object ADOQuery4PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 32
    end
    object ADOQuery4so_oldnew: TStringField
      FieldName = 'so_oldnew'
      Size = 10
    end
    object ADOQuery4REFERENCE: TStringField
      FieldName = 'REFERENCE'
    end
    object ADOQuery4sotp: TStringField
      FieldName = 'sotp'
      ReadOnly = True
      Size = 6
    end
    object ADOQuery4ttype: TStringField
      FieldName = 'ttype'
      ReadOnly = True
      Size = 4
    end
    object ADOQuery4FLOW_NO: TSmallintField
      FieldName = 'FLOW_NO'
    end
    object ADOQuery4ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOQuery4Rkey: TIntegerField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object ADOQuery4DSDesigner12: TStringField
      FieldName = #26159#21542#27966#24037
      ReadOnly = True
      Size = 2
    end
    object ADOQuery4assign_cycle: TIntegerField
      FieldName = 'assign_cycle'
    end
    object ADOQuery4assign_date: TDateTimeField
      FieldName = 'assign_date'
    end
    object ADOQuery4DateValue: TBCDField
      FieldName = 'DateValue'
      Precision = 9
      Size = 2
    end
    object ADOQuery4DSDesigner13: TDateTimeField
      FieldName = #27966#24037#35201#27714#23436#25104#26102#38388
      ReadOnly = True
    end
    object ADOQuery4DSDesigner14: TBCDField
      FieldName = #27966#24037#21097#20313#23567#26102
      ReadOnly = True
      Precision = 17
      Size = 6
    end
    object ADOQuery4DSDesigner15: TStringField
      FieldName = #27966#24037#26159#21542#36229#26102
      ReadOnly = True
      Size = 1
    end
    object ADOQuery4DSDesigner16: TIntegerField
      FieldName = #22312#32447#20572#30041#26102#38388
      ReadOnly = True
    end
    object ADOQuery4pl_area: TFloatField
      FieldName = 'pl_area'
      ReadOnly = True
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 128
    Top = 96
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 208
    Top = 96
  end
  object Ado0849: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'D419_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'D073_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select CAST(0 AS bit) AS Sel, data0849.* from data0849 '
      'where D419_ptr=:D419_ptr and D073_ptr=:D073_ptr')
    Left = 128
    Top = 168
    object Ado0849Sel: TBooleanField
      FieldName = 'Sel'
    end
    object Ado0849Rkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object Ado0849D419_ptr: TIntegerField
      FieldName = 'D419_ptr'
    end
    object Ado0849D073_ptr: TIntegerField
      FieldName = 'D073_ptr'
    end
    object Ado0849FormName: TStringField
      FieldName = 'FormName'
      Size = 50
    end
    object Ado0849GridName: TStringField
      FieldName = 'GridName'
      Size = 50
    end
    object Ado0849FieldName: TStringField
      FieldName = 'FieldName'
      Size = 50
    end
    object Ado0849FieldCaption: TStringField
      FieldName = 'FieldCaption'
      Size = 100
    end
    object Ado0849FieldOrder: TIntegerField
      FieldName = 'FieldOrder'
    end
    object Ado0849FieldWidth: TIntegerField
      FieldName = 'FieldWidth'
    end
    object Ado0849IsDisplay: TBooleanField
      FieldName = 'IsDisplay'
    end
  end
  object CDS2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 304
    Top = 168
  end
  object DSP2: TDataSetProvider
    DataSet = Ado0849
    Left = 208
    Top = 168
  end
  object Ado849s: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from data0849 where RKey is Null')
    Left = 128
    Top = 232
    object Ado849sRkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object Ado849sD419_ptr: TIntegerField
      FieldName = 'D419_ptr'
    end
    object Ado849sD073_ptr: TIntegerField
      FieldName = 'D073_ptr'
    end
    object Ado849sFormName: TStringField
      FieldName = 'FormName'
      Size = 50
    end
    object Ado849sGridName: TStringField
      FieldName = 'GridName'
      Size = 50
    end
    object Ado849sFieldName: TStringField
      FieldName = 'FieldName'
      Size = 50
    end
    object Ado849sFieldCaption: TStringField
      FieldName = 'FieldCaption'
      Size = 100
    end
    object Ado849sFieldOrder: TIntegerField
      FieldName = 'FieldOrder'
    end
    object Ado849sFieldWidth: TIntegerField
      FieldName = 'FieldWidth'
    end
    object Ado849sIsDisplay: TBooleanField
      FieldName = 'IsDisplay'
    end
  end
end
