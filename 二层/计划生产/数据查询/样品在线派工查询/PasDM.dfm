object DM: TDM
  OldCreateOrder = False
  Left = 413
  Top = 206
  Height = 487
  Width = 337
  object ADOConnection1: TADOConnection
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 24
  end
  object Ado586: TADOQuery
    Connection = ADOConnection1
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'select data0034.DEPT_CODE,data0034.DEPT_NAME,data0586.DataValues' +
        ',data0034.Rkey'
      ',data0586.TType,data0283.PRIORITY_name'
      'from data0586 inner join'
      'data0034 on data0586.RKey34=data0034.Rkey inner join'
      'data0283 on data0586.TType=data0283.PRIORITY_CODE')
    Left = 152
    Top = 24
    object Ado586DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object Ado586DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object Ado586DataValues: TBCDField
      FieldName = 'DataValues'
      Precision = 2
      Size = 2
    end
    object Ado586Rkey: TIntegerField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object Ado586TType: TSmallintField
      FieldName = 'TType'
    end
    object Ado586PRIORITY_name: TStringField
      FieldName = 'PRIORITY_name'
      Size = 10
    end
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    Left = 40
    Top = 88
  end
  object Ado587: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      ';with dv as '
      '( '
      
        #9'select D06.WORK_ORDER_NUMBER,dbo.SumDateValue3(D06.RKEY, D38.ST' +
        'EP_NUMBER,D06.PRIORITY_CODE) AS value2,'
      #9'dbo.SumDateValue4(D25.RKEY,0,D06.PRIORITY_CODE) AS V4'
      #9'FROM  Data0056 inner join '
      #9'  data0006 D06 ON Data0056.WO_PTR = D06.RKEY inner join '
      #9'  Data0025 D25 ON D06.BOM_PTR = D25.RKEY INNER JOIN '
      
        '      Data0038 AS D38 ON D25.RKEY = D38.SOURCE_PTR and Data0056.' +
        'DEPT_PTR=D38.DEPT_PTR INNER JOIN '
      
        '      Data0034 AS D34 ON D38.DEPT_PTR = D34.RKEY  LEFT OUTER JOI' +
        'N'
      '      (SELECT     Rkey34, DataValues,TType'
      '        FROM          dbo.data0586 '
      
        '       ) AS D586 ON D34.RKEY = D586.Rkey34 and D586.rkey34=data0' +
        '056.DEPT_PTR and D06.PRIORITY_CODE=D586.TType'
      'WHERE 1=1'
      ')'
      'SELECT D06.WORK_ORDER_NUMBER,D06.BOM_PTR,'
      'Data0010.CUST_CODE,D25.MANU_PART_NUMBER,D25.MANU_PART_DESC,'
      
        'D25.ANALYSIS_CODE_2,D34.DEPT_CODE,D34.DEPT_NAME,Data0056.INTIME ' +
        'AS '#25509#25910#26102#38388','
      'D06.ENT_DATETIME AS '#25237#20135#26102#38388','
      'D06.sch_compl_date AS '#35745#21010#23436#24037#26085#26399','
      
        'Data0056.STEP,DATEDIFF(day,data0056.assign_date,D06.sch_compl_da' +
        'te) AS '#20132#36135#21608#26399','
      'DATEDIFF(day,  GETDATE(),D06.sch_compl_date) AS '#20132#36135#21608#26399'2,'
      'Data0056.DEPT_PTR,D06.pnl_size,D06.QUAN_SCH AS '#25237#20135#25968#37327','
      
        'D06.PANELS AS '#25237#20135#25968#37327'PANEL,Data0056.QTY_BACKLOG AS '#22312#32447#25968#37327'PCS,Data0056' +
        '.PANELS AS '#22312#32447#25968#37327'PANEL,D06.RELEASE_DATE,D06.PROD_STATUS,'
      'CASE D06.PROD_STATUS WHEN 3 THEN '#39#29983#20135#20013#39' WHEN 4 THEN '#39#22806#21457#29983#20135#39' '
      
        'WHEN 5 THEN '#39#24453#20837#20179#39' WHEN 6 THEN '#39#24453#20998#37197#39' WHEN 103 THEN '#39#29983#20135#20013#26242#32531#39' END AS' +
        ' '#20316#19994#21333#29366#24577','
      
        'CASE D06.wtype WHEN 0 THEN '#39#27491#24120#39' WHEN 1 THEN '#39#23614#25968#39' WHEN 2 THEN '#39#24453#36820 +
        #24037#39' '
      
        'WHEN 3 THEN '#39#36820#24037#39' WHEN 4 THEN '#39#24453#25253#24223#39' WHEN 5 THEN '#39#24050#25253#24223#39' END AS '#25209#27425#29366#24577 +
        ','
      
        'ROUND(Data0056.QTY_BACKLOG * D25.unit_sq,4) AS wip_area,D06.CUT_' +
        'NO,Data0060.SALES_ORDER,'
      
        'CONVERT(varchar,DATEDIFF(hh,D06.ENT_DATETIME,GETDATE()) / 24) + ' +
        #39#22825#39' '
      
        '+ CONVERT(varchar,DATEDIFF(hh,D06.ENT_DATETIME,GETDATE()) % 24) ' +
        '+ '#39#26102#39' '
      
        '+ CONVERT(varchar,DATEDIFF(mi,D06.ENT_DATETIME,GETDATE()) % 60) ' +
        '+ '#39#20998#39' AS '#22312#32447#26102#38271','
      'CASE WHEN D25.parent_ptr IS NULL THEN '#39#22806#23618#39' ELSE '#39#20869#23618#39' END AS '#20869#22806#23618','
      'CASE Data0056.wType WHEN 0 THEN '#39#39' ELSE '#39#26159#39' END AS '#36820#24037#20013','
      'CASE WHEN Data0056.PUT_TYPE > 0 THEN '#39#26159#39' ELSE '#39#39' END AS '#27491#24120#37325#26816','
      'Data0097.PO_NUMBER,Data0060.so_oldnew,Data0056.REFERENCE,'
      'case isnull(data0060.so_tp,0) when 0 then '#39#33258#21046#39' when 1 then '#39#22806#21457#39' '
      'when 2 then '#39#21322#21046#31243#39' end as sotp,'
      'case D25.ttype when 0 then '#39#37327#26495#39' when 1 then '#39#26679#26495#39' end as ttype,'
      
        'ISNULL(Data0056.FLOW_NO,0) as FLOW_NO,Data0015.ABBR_NAME,D06.Rke' +
        'y,'
      
        'case Data0060.STATUS when 1 then '#39#26377#25928#39' when 2 then '#39#26242#32531#39' when 3 th' +
        'en '#39#20851#38381#39' when 4 then '#39#23436#25104#39' when 5 then '#39#21462#28040#39' when 6 then '#39#26410#25552#20132#39' end ' +
        'as STATUS2,'
      'ISNULL(D586.DataValues,0) AS value1, dv.value2,'
      
        ' DATEADD(HH,Data0056.FLOW_NO, DATEADD(HH, ISNULL(D586.DataValues' +
        ',0), Data0056.INTIME)) AS ModernDate34,'
      
        ' DATEADD(HH,dv.V4,DATEADD(mi, dv.value2 * 60, Data0056.INTIME)) ' +
        'AS NewDate2,'
      
        'DATEADD(HH,Data0056.FLOW_NO, DATEADD(HH,(datediff(HH,Data0056.IN' +
        'TIME,getdate())),DATEADD(HH,dv.V4,DATEADD(mi, dv.value2 * 60, Da' +
        'ta0056.INTIME)))) AS NewDate,'
      
        'DATEDIFF(HH,getdate(),DATEADD(HH, ISNULL(D586.DataValues,0), Dat' +
        'a0056.INTIME))+Data0056.FLOW_NO as LaveDate34,'
      
        ' (datediff(hh,getdate(),d06.SCH_COMPL_DATE))-(datediff(hh,Data00' +
        '56.INTIME,(DATEADD(HH,dv.V4,DATEADD(mi, dv.value2 * 60, Data0056' +
        '.INTIME))))) as WL,'
      
        '  D38.STEP_NUMBER,data0283.PRIORITY_name,D25.rkey,dv.V4,d06.rkey' +
        ' as rkey06,D06.PRIORITY_CODE,data0056.rkey as rkey56,D25.PARENT_' +
        'PTR,data0056.WTYPE,'
      
        'D06.QUAN_REJ,D06.QUAN_PROD,data0060.PARTS_ORDERED,data0056.REFER' +
        'ENCE,data0056.TO_BE_STOCKED,Data0060.ORIG_CUSTOMER,D10.CUST_CODE' +
        ' as Code10'
      
        ',DATEADD(hh,dv.V4+dbo.SumDateValue3(D06.RKEY, 0,D06.PRIORITY_COD' +
        'E),D06.ENT_DATETIME) as WLDate,'
      
        'CASE data0492.TTYPE WHEN 0 THEN '#39#27491#24120#25237#20135#39' WHEN 1 THEN '#39#34917#26009#25237#20135#39' WHEN 2' +
        ' THEN '#39#25353'MRB'#37325#25237#39' WHEN 3 THEN '#39#25353'MRB'#36820#20462#39' WHEN 4 THEN '#39#25353#26495#21495#25237#20135#39' END  AS ' +
        'MyData0492TTYPE,'
      
        ' Data0034_1.DEPT_CODE AS dept_code1,Data0034_1.DEPT_NAME AS dept' +
        '_name1'
      'FROM  Data0056 inner join '
      #9'  data0006 D06 ON Data0056.WO_PTR = D06.RKEY inner join '
      #9'  Data0025 D25 ON D06.BOM_PTR = D25.RKEY INNER JOIN '
      '      Data0015 on Data0056.LOC_PTR=Data0015.rkey inner join'
      '      Data0008 D08 ON D25.PROD_CODE_PTR=D08.RKEY inner join '
      
        '      Data0038 AS D38 ON D25.RKEY = D38.SOURCE_PTR and Data0056.' +
        'DEPT_PTR=D38.DEPT_PTR INNER JOIN'
      '      Data0034 AS D34 ON D38.DEPT_PTR = D34.RKEY INNER JOIN'
      
        '      dbo.Data0034 AS Data0034_1 ON D34.BIG_DEPT_PTR = Data0034_' +
        '1.RKEY INNER JOIN '
      #9'  Data0492 ON D06.CUT_NO = Data0492.CUT_NO INNER JOIN'
      #9'  dv on d06.WORK_ORDER_NUMBER=dv.WORK_ORDER_NUMBER inner join '
      
        #9'  Data0010 ON Data0010.RKEY = Data0492.COMPLETED LEFT OUTER JOI' +
        'N '
      '      Data0060 LEFT OUTER JOIN'
      
        '      Data0097 ON Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY ON' +
        ' Data0492.SO_NO = Data0060.SALES_ORDER left join'
      
        '      Data0283 on D06.PRIORITY_CODE=data0283.PRIORITY_CODE LEFT ' +
        'OUTER JOIN'
      
        '      data0010 as D10 on data0060.ORIG_CUSTOMER=D10.ABBR_NAME LE' +
        'FT OUTER JOIN'
      '      (SELECT     Rkey34, DataValues,TType'
      '        FROM          dbo.data0586 '
      
        '       ) AS D586 ON D34.RKEY = D586.Rkey34 and D586.rkey34=data0' +
        '056.DEPT_PTR and D06.PRIORITY_CODE=D586.TType'
      'WHERE 1=1'
      '')
    Left = 152
    Top = 88
    object Ado587WORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object Ado587CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object Ado587MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object Ado587MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object Ado587ANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      Size = 80
    end
    object Ado587DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object Ado587DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object Ado587DSDesigner: TDateTimeField
      FieldName = #25509#25910#26102#38388
    end
    object Ado587DSDesigner2: TDateTimeField
      FieldName = #25237#20135#26102#38388
    end
    object Ado587DSDesigner3: TDateTimeField
      FieldName = #35745#21010#23436#24037#26085#26399
    end
    object Ado587STEP: TSmallintField
      FieldName = 'STEP'
    end
    object Ado587DSDesigner4: TIntegerField
      FieldName = #20132#36135#21608#26399
      ReadOnly = True
    end
    object Ado587DSDesigner22: TIntegerField
      FieldName = #20132#36135#21608#26399'2'
      ReadOnly = True
    end
    object Ado587DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object Ado587pnl_size: TStringField
      FieldName = 'pnl_size'
    end
    object Ado587DSDesigner5: TFloatField
      FieldName = #25237#20135#25968#37327
    end
    object Ado587PANEL: TIntegerField
      FieldName = #25237#20135#25968#37327'PANEL'
    end
    object Ado587PCS: TFloatField
      FieldName = #22312#32447#25968#37327'PCS'
    end
    object Ado587PANEL2: TIntegerField
      FieldName = #22312#32447#25968#37327'PANEL'
    end
    object Ado587RELEASE_DATE: TDateTimeField
      FieldName = 'RELEASE_DATE'
    end
    object Ado587PROD_STATUS: TSmallintField
      FieldName = 'PROD_STATUS'
    end
    object Ado587DSDesigner6: TStringField
      FieldName = #20316#19994#21333#29366#24577
      ReadOnly = True
      Size = 10
    end
    object Ado587DSDesigner7: TStringField
      FieldName = #25209#27425#29366#24577
      ReadOnly = True
      Size = 6
    end
    object Ado587wip_area: TFloatField
      FieldName = 'wip_area'
      ReadOnly = True
    end
    object Ado587CUT_NO: TStringField
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object Ado587SALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object Ado587DSDesigner8: TStringField
      FieldName = #22312#32447#26102#38271
      ReadOnly = True
      Size = 96
    end
    object Ado587DSDesigner9: TStringField
      FieldName = #20869#22806#23618
      ReadOnly = True
      Size = 4
    end
    object Ado587DSDesigner10: TStringField
      FieldName = #36820#24037#20013
      ReadOnly = True
      Size = 2
    end
    object Ado587DSDesigner11: TStringField
      FieldName = #27491#24120#37325#26816
      ReadOnly = True
      Size = 2
    end
    object Ado587PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 32
    end
    object Ado587so_oldnew: TStringField
      FieldName = 'so_oldnew'
      Size = 10
    end
    object Ado587REFERENCE: TStringField
      FieldName = 'REFERENCE'
    end
    object Ado587sotp: TStringField
      FieldName = 'sotp'
      ReadOnly = True
      Size = 6
    end
    object Ado587ttype: TStringField
      FieldName = 'ttype'
      ReadOnly = True
      Size = 4
    end
    object Ado587FLOW_NO: TSmallintField
      FieldName = 'FLOW_NO'
    end
    object Ado587ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object Ado587Rkey: TIntegerField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object Ado587value1: TFloatField
      FieldName = 'value1'
      ReadOnly = True
    end
    object Ado587value2: TBCDField
      FieldName = 'value2'
      ReadOnly = True
      Precision = 9
      Size = 2
    end
    object Ado587NewDate: TDateTimeField
      FieldName = 'NewDate'
      ReadOnly = True
    end
    object Ado587LaveDate34: TIntegerField
      FieldName = 'LaveDate34'
      ReadOnly = True
    end
    object Ado587ModernDate34: TDateTimeField
      FieldName = 'ModernDate34'
      ReadOnly = True
    end
    object Ado587STEP_NUMBER: TSmallintField
      FieldName = 'STEP_NUMBER'
    end
    object Ado587PRIORITY_name: TStringField
      FieldName = 'PRIORITY_name'
      Size = 10
    end
    object Ado587STATUS2: TStringField
      FieldName = 'STATUS2'
      ReadOnly = True
      Size = 6
    end
    object Ado587V4: TBCDField
      FieldName = 'V4'
      ReadOnly = True
      Precision = 9
      Size = 2
    end
    object Ado587WL: TIntegerField
      FieldName = 'WL'
      ReadOnly = True
    end
    object Ado587PRIORITY_CODE: TWordField
      FieldName = 'PRIORITY_CODE'
    end
    object Ado587rkey_1: TIntegerField
      FieldName = 'rkey_1'
      ReadOnly = True
    end
    object Ado587rkey06: TIntegerField
      FieldName = 'rkey06'
      ReadOnly = True
    end
    object Ado587rkey56: TIntegerField
      FieldName = 'rkey56'
      ReadOnly = True
    end
    object Ado587PARENT_PTR: TIntegerField
      FieldName = 'PARENT_PTR'
    end
    object Ado587BOM_PTR: TIntegerField
      FieldName = 'BOM_PTR'
    end
    object Ado587WTYPE: TSmallintField
      FieldName = 'WTYPE'
    end
    object Ado587QUAN_REJ: TFloatField
      DisplayLabel = #25253#24223#25968#37327
      FieldName = 'QUAN_REJ'
    end
    object Ado587QUAN_PROD: TFloatField
      DisplayLabel = #23436#24037#25968#37327
      FieldName = 'QUAN_PROD'
    end
    object Ado587PARTS_ORDERED: TFloatField
      DisplayLabel = #35746#21333#25968#37327
      FieldName = 'PARTS_ORDERED'
    end
    object Ado587TO_BE_STOCKED: TFloatField
      FieldName = 'TO_BE_STOCKED'
    end
    object Ado587ORIG_CUSTOMER: TStringField
      FieldName = 'ORIG_CUSTOMER'
      Size = 10
    end
    object Ado587NewDate2: TDateTimeField
      FieldName = 'NewDate2'
    end
    object Ado587Code10: TStringField
      FieldName = 'Code10'
      Size = 10
    end
    object Ado587REFERENCE_1: TStringField
      FieldName = 'REFERENCE_1'
    end
    object Ado587WLDate: TDateTimeField
      FieldName = 'WLDate'
      ReadOnly = True
    end
    object Ado587MyData0492TTYPE: TStringField
      FieldName = 'MyData0492TTYPE'
      ReadOnly = True
      Size = 10
    end
    object Ado587dept_code1: TStringField
      FieldName = 'dept_code1'
      Size = 10
    end
    object Ado587dept_name1: TStringField
      FieldName = 'dept_name1'
      Size = 30
    end
  end
  object Ado587s: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'SELECT D25.MANU_PART_NUMBER, D06.WORK_ORDER_NUMBER, D06.RELEASE_' +
        'DATE,D34.DEPT_CODE, D34.DEPT_NAME,  '
      
        ' D587.STEP_NUMBER,D587.PROCESS_Add_TIME,D587.Remark,D587.Rkey06,' +
        'D587.RKey25,D587.OperDate,D587.User_Ptr,D05.EMPLOYEE_NAME'
      'FROM  dbo.data0587 as D587 inner join'
      '      dbo.Data0025 AS D25 ON D587.Rkey25=D25.Rkey INNER JOIN'
      '      dbo.Data0006 AS D06 ON D587.RKEY06 = D06.Rkey INNER JOIN'
      
        '      dbo.Data0038 AS D38 ON D25.RKEY = D38.SOURCE_PTR and D587.' +
        'STEP_NUMBER=D38.STEP_NUMBER INNER JOIN'
      '      dbo.Data0034 AS D34 ON D38.DEPT_PTR = D34.RKEY inner join'
      '      dbo.data0005 as D05 on D587.User_Ptr=D05.Rkey')
    Left = 160
    Top = 152
    object Ado587sMANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object Ado587sWORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object Ado587sRELEASE_DATE: TDateTimeField
      FieldName = 'RELEASE_DATE'
    end
    object Ado587sDEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object Ado587sDEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object Ado587sSTEP_NUMBER: TIntegerField
      FieldName = 'STEP_NUMBER'
    end
    object Ado587sPROCESS_Add_TIME: TFloatField
      FieldName = 'PROCESS_Add_TIME'
    end
    object Ado587sRemark: TStringField
      FieldName = 'Remark'
      Size = 200
    end
    object Ado587sRkey06: TIntegerField
      FieldName = 'Rkey06'
    end
    object Ado587sRKey25: TIntegerField
      FieldName = 'RKey25'
    end
    object Ado587sUser_Ptr: TIntegerField
      FieldName = 'User_Ptr'
    end
    object Ado587sOperDate: TDateTimeField
      FieldName = 'OperDate'
    end
    object Ado587sEMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    Left = 40
    Top = 152
  end
  object Ado48: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'WORK_ORDER_NUMBER'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 22
        Value = Null
      end>
    SQL.Strings = (
      'SELECT D34.DEPT_NAME,D48.OUTTIME,D38.STEP_NUMBER'
      'FROM  dbo.Data0025 AS D25 INNER JOIN '
      '      dbo.Data0006 AS D06 ON D25.RKEY = D06.BOM_PTR INNER JOIN'
      
        '      dbo.Data0038 AS D38 ON D25.RKEY = D38.SOURCE_PTR INNER JOI' +
        'N'
      
        '      dbo.Data0034 AS D34 ON D38.DEPT_PTR = D34.RKEY LEFT OUTER ' +
        'JOIN'
      '      (select OUTTIME,INTIME,WO_PTR,FM_DEPT_PTR'
      
        '       from data0048 ) as D48 on D06.Rkey=D48.WO_PTR and D34.Rke' +
        'y=D48.FM_DEPT_PTR'
      
        'where (D06.PROD_STATUS = 3) AND (D34.BARCODE_ENTRY_FLAG = '#39'Y'#39') A' +
        'ND (D34.ACTIVE_FLAG = 0) '
      'AND  (D06.WORK_ORDER_NUMBER =:WORK_ORDER_NUMBER)'
      'order by D38.STEP_NUMBER')
    Left = 160
    Top = 205
    object Ado48DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object Ado48OUTTIME: TDateTimeField
      FieldName = 'OUTTIME'
    end
    object Ado48STEP_NUMBER: TSmallintField
      FieldName = 'STEP_NUMBER'
    end
  end
  object ado283: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from data0283')
    Left = 48
    Top = 208
    object ado283PRIORITY_CODE: TWordField
      FieldName = 'PRIORITY_CODE'
    end
    object ado283PRIORITY_name: TStringField
      FieldName = 'PRIORITY_name'
      Size = 10
    end
    object ado283iSort: TWordField
      FieldName = 'iSort'
    end
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
    Left = 48
    Top = 280
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
  object DSP2: TDataSetProvider
    DataSet = Ado0849
    Left = 128
    Top = 280
  end
  object CDS2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 280
  end
  object Ado849s: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from data0849 where RKey is Null')
    Left = 48
    Top = 344
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
