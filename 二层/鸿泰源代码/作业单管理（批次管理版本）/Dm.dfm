object Dmcon: TDmcon
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 336
  Top = 150
  Height = 529
  Width = 621
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=wisdomtopcb1077;Persist Security In' +
      'fo=True;User ID=sa;Initial Catalog=wis_test;Data Source=192.168.' +
      '1.252'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 16
  end
  object adsProdList: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterOpen = adsProdListAfterOpen
    AfterScroll = adsProdListAfterScroll
    CommandText = 
      'SELECT barcode_flag,D06.RKEY,D06.WORK_ORDER_NUMBER,D06.BOM_PTR,D' +
      '06.QUAN_SCH,D06.WIPMAT_STATUS,D06.PROD_STATUS,D06.ENT_DATETIME,D' +
      '06.SCH_COMPL_DATE,D06.PARTS_PER_PANEL,'#13#10'D06.cut_no,D06.quan_rej,' +
      'D06.quan_prod,D06.panels,D492.SO_NO,D492.mrb_ptr,'#13#10'D10.CUST_CODE' +
      ', D25.CUSTOMER_PTR, D25.MANU_PART_NUMBER,D25.MANU_PART_DESC,D492' +
      '.TType ,D08.PROD_CODE,D06.panel_A_B,D492.whouse_ptr'#13#10'FROM dbo.Da' +
      'ta0025 D25 INNER JOIN'#13#10'      dbo.Data0010 D10 ON D25.CUSTOMER_PT' +
      'R = D10.RKEY '#13#10'INNER JOIN Data0006 D06 on D06.BOM_PTR=D25.RKEY'#13#10 +
      'INNER JOIN DATA0492 D492 ON D492.CUT_NO=D06.CUT_NO'#13#10'INNER JOIN D' +
      'ATA0008 D08 ON D08.RKEY=D25.PROD_CODE_PTR'#13#10'Where  (D06.WIPMAT_ST' +
      'ATUS = 0) and (D06.PROD_STATUS<9)'#13#10'and      (D25.RKEY IN'#13#10'      ' +
      '    (SELECT parent_ptr'#13#10'         FROM data0025'#13#10'         WHERE p' +
      'arent_ptr > 0 ))'#13#10'ORDER BY D06.WORK_ORDER_NUMBER'#13#10
    Parameters = <>
    Left = 24
    Top = 72
  end
  object dsProdList: TDataSource
    DataSet = adsProdList
    Left = 88
    Top = 72
  end
  object adsSubProds: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterOpen = adsSubProdsAfterOpen
    AfterScroll = adsSubProdsAfterScroll
    CommandText = 
      'select data0006.work_order_number,data0025.qty_bom,data0025.manu' +
      '_part_number,IsNULL(data0488.quan_issued,0) as quan_issued ,'#13#10'da' +
      'ta0025.rkey,data0025.bom_step,Data0025.Qty_bom*Data0006.quan_sch' +
      ' as Qty_Total_Req,data0006.rKey as WONO,'#13#10'Data0025.Qty_bom*Data0' +
      '006.quan_sch-IsNULL(data0488.quan_issued,0) as Qty_Needed'#13#10'from ' +
      'data0006 inner join data0025 on '#13#10'data0006.bom_ptr=data0025.pare' +
      'nt_ptr '#13#10'LEFT JOIN Data0056 ON Data0056.WO_PTR = Data0006.RKey'#13#10 +
      'left outer join data0488 on data0488.WO_Ptr=data0006.rKey and da' +
      'ta0488.bom_ptr=data0025.rkey'#13#10'where data0006.rkey=:F01  AND Data' +
      '0025.BOM_STEP = 1  AND ISNULL(data0056.STEP,-1) = -1'#13#10'ORDER by d' +
      'ata0025.bom_step,data0025.manu_part_number'
    Parameters = <
      item
        Name = 'F01'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 168
    Top = 72
  end
  object dsSubProds: TDataSource
    DataSet = adsSubProds
    Left = 248
    Top = 72
  end
  object adsWorkOrderList: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterOpen = adsWorkOrderListAfterOpen
    CommandText = 
      'declare @IsSelected bit,@TransQty float'#13#10'select @IsSelected =0'#13#10 +
      'select @IsSelected as IsSelected ,d56.Qty_BackLog-d06.quan_allre' +
      'j as TransQty, '#13#10'D492.SO_NO, D06.RKEY,D06.WORK_ORDER_NUMBER, '#13#10'E' +
      'NT_DATETIME, D06.QUAN_PROD,D06.Quan_Sch, '#13#10'D56.Qty_BackLog-d06.q' +
      'uan_allrej  as Qty_BackLog'#13#10'from data0006 D06 inner join data005' +
      '6 D56 on D56.WO_Ptr=D06.rKey'#13#10'inner join data0492 D492 on D06.Cu' +
      't_NO=D492.Cut_NO'#13#10'where d06.PROD_STATUS=6 and D06.BOM_Ptr=:F01 a' +
      'nd'#13#10'D06.panel_A_B=:panel_A_B'#13#10'order by D492.SO_NO, D06.work_orde' +
      'r_Number,ENT_DATETIME'#13#10
    Parameters = <
      item
        Name = 'F01'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'panel_A_B'
        Size = -1
        Value = Null
      end>
    Prepared = True
    Left = 56
    Top = 200
    object adsWorkOrderListIsSelected: TBooleanField
      FieldName = 'IsSelected'
    end
    object adsWorkOrderListRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object adsWorkOrderListWORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object adsWorkOrderListQty_BackLog: TFloatField
      FieldName = 'Qty_BackLog'
    end
    object adsWorkOrderListENT_DATETIME: TDateTimeField
      FieldName = 'ENT_DATETIME'
    end
    object adsWorkOrderListTransQty: TFloatField
      FieldName = 'TransQty'
    end
    object adsWorkOrderListSO_NO: TStringField
      FieldName = 'SO_NO'
      FixedChar = True
      Size = 12
    end
    object adsWorkOrderListQUAN_PROD: TFloatField
      FieldName = 'QUAN_PROD'
    end
    object adsWorkOrderListQuan_Sch: TFloatField
      FieldName = 'Quan_Sch'
    end
  end
  object dsWorkOrderList: TDataSource
    DataSet = cdsWorkOrderList
    Left = 352
    Top = 200
  end
  object adsTransRec: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select D489.TDate,D06.Work_order_Number,D06.Cut_No,D06.QUAN_PROD' +
      ',D489.Qty,d489.Source_ptr,D489.rkey'#13#10'from data0489 D489 inner jo' +
      'in data0006 D06 on D489.Source_ptr=D06.rKey'#13#10'where D489.TType=2 ' +
      'and D489.WO_Ptr=:F01'#13#10'and D06.Bom_ptr=:F02'#13#10#13#10
    Parameters = <
      item
        Name = 'F01'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'F02'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 168
    Top = 128
  end
  object dsTransRec: TDataSource
    DataSet = adsTransRec
    Left = 248
    Top = 128
  end
  object cdsWorkOrderList: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforeInsert = cdsWorkOrderListBeforeInsert
    BeforeEdit = cdsWorkOrderListBeforeEdit
    BeforeDelete = cdsWorkOrderListBeforeInsert
    Left = 248
    Top = 200
    object cdsWorkOrderListIsSelected: TBooleanField
      FieldName = 'IsSelected'
      OnChange = cdsWorkOrderListIsSelectedChange
    end
    object cdsWorkOrderListRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object cdsWorkOrderListWORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object cdsWorkOrderListQty_BackLog: TFloatField
      FieldName = 'Qty_BackLog'
    end
    object cdsWorkOrderListENT_DATETIME: TDateTimeField
      FieldName = 'ENT_DATETIME'
    end
    object cdsWorkOrderListTransQty: TFloatField
      FieldName = 'TransQty'
      OnChange = cdsWorkOrderListTransQtyChange
    end
    object cdsWorkOrderListSO_NO: TStringField
      FieldName = 'SO_NO'
      FixedChar = True
      Size = 12
    end
    object cdsWorkOrderListQUAN_PROD: TFloatField
      FieldName = 'QUAN_PROD'
    end
    object cdsWorkOrderListQuan_Sch: TFloatField
      FieldName = 'Quan_Sch'
      ReadOnly = True
    end
  end
  object dspWorkOrder: TDataSetProvider
    DataSet = adsWorkOrderList
    Left = 152
    Top = 200
  end
  object adsAuto_WO_List: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select D492.SO_NO, D06.RKEY,D06.WORK_ORDER_NUMBER, ENT_DATETIME,' +
      ' D06.QUAN_PROD, D56.Qty_BackLog from data0006 D06 inner join dat' +
      'a0056 D56 on D56.WO_Ptr=D06.rKey'#13#10'inner join data0492 D492 on D0' +
      '6.Cut_NO=D492.Cut_NO '#13#10'where PROD_STATUS=6 and D06.BOM_Ptr=:F01 ' +
      'and D492.SO_NO=:F02 OR D492.mrb_ptr=:F03'#13#10'order by D492.SO_NO, D' +
      '06.work_order_Number,ENT_DATETIME'#13#10
    Parameters = <
      item
        Name = 'F01'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'F02'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 12
        Value = Null
      end
      item
        Name = 'F03'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 48
    Top = 136
  end
  object adsWOReleaseList: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterOpen = adsWOReleaseListAfterOpen
    CommandText = 
      'declare @IsSelected bit set @IsSelected=0'#13#10'select @IsSelected as' +
      ' IsSelected ,D06.PROD_STATUS,barcode_flag,D06.RKEY,D06.WORK_ORDE' +
      'R_NUMBER,D06.BOM_PTR,D06.QUAN_SCH,D06.WIPMAT_STATUS,D06.ENT_DATE' +
      'TIME,D06.SCH_COMPL_DATE,D06.PARTS_PER_PANEL,'#13#10'D06.cut_no,D06.qua' +
      'n_rej,D06.quan_prod,D06.panels,D492.SO_NO,'#13#10'D10.CUST_CODE, D25.C' +
      'USTOMER_PTR, d25.unit_sq,D25.MANU_PART_NUMBER,D25.MANU_PART_DESC' +
      ',D492.TType ,D08.PROD_CODE,dateadd(day,(0-D25.SHELF_LIFE),D06.SC' +
      'H_COMPL_DATE) AS AdvicePordDate,D06.wtype,D06.put_type,D492.WHOU' +
      'SE_PTR,D25.ONHOLD_RELEASE_FLAG'#13#10'FROM dbo.Data0025 D25 INNER JOIN' +
      #13#10'      dbo.Data0010 D10 ON D25.CUSTOMER_PTR = D10.RKEY '#13#10'INNER ' +
      'JOIN Data0006 D06 on D06.BOM_PTR=D25.RKEY'#13#10'INNER JOIN DATA0492 D' +
      '492 ON D492.CUT_NO=D06.CUT_NO'#13#10'INNER JOIN DATA0008 D08 ON D08.RK' +
      'EY=D25.PROD_CODE_PTR'#13#10'Where  (D06.WIPMAT_STATUS = 1) and (D06.PR' +
      'OD_STATUS=2) and (D492.TSTATUS <>1)'#13#10'ORDER BY D06.WORK_ORDER_NUM' +
      'BER'#13#10
    Parameters = <>
    Prepared = True
    Left = 48
    Top = 280
    object adsWOReleaseListIsSelected: TBooleanField
      FieldName = 'IsSelected'
    end
    object adsWOReleaseListPROD_STATUS: TSmallintField
      FieldName = 'PROD_STATUS'
      ReadOnly = True
    end
    object adsWOReleaseListbarcode_flag: TWordField
      FieldName = 'barcode_flag'
      ReadOnly = True
    end
    object adsWOReleaseListRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object adsWOReleaseListWORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      ReadOnly = True
      Size = 22
    end
    object adsWOReleaseListBOM_PTR: TIntegerField
      FieldName = 'BOM_PTR'
      ReadOnly = True
    end
    object adsWOReleaseListQUAN_SCH: TFloatField
      FieldName = 'QUAN_SCH'
      ReadOnly = True
    end
    object adsWOReleaseListWIPMAT_STATUS: TSmallintField
      FieldName = 'WIPMAT_STATUS'
      ReadOnly = True
    end
    object adsWOReleaseListENT_DATETIME: TDateTimeField
      FieldName = 'ENT_DATETIME'
      ReadOnly = True
    end
    object adsWOReleaseListSCH_COMPL_DATE: TDateTimeField
      FieldName = 'SCH_COMPL_DATE'
      ReadOnly = True
    end
    object adsWOReleaseListPARTS_PER_PANEL: TFloatField
      FieldName = 'PARTS_PER_PANEL'
      ReadOnly = True
    end
    object adsWOReleaseListcut_no: TStringField
      FieldName = 'cut_no'
      ReadOnly = True
      FixedChar = True
      Size = 12
    end
    object adsWOReleaseListquan_rej: TFloatField
      FieldName = 'quan_rej'
      ReadOnly = True
    end
    object adsWOReleaseListquan_prod: TFloatField
      FieldName = 'quan_prod'
      ReadOnly = True
    end
    object adsWOReleaseListpanels: TIntegerField
      FieldName = 'panels'
      ReadOnly = True
    end
    object adsWOReleaseListSO_NO: TStringField
      FieldName = 'SO_NO'
      ReadOnly = True
      FixedChar = True
      Size = 12
    end
    object adsWOReleaseListCUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      ReadOnly = True
      Size = 10
    end
    object adsWOReleaseListCUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
      ReadOnly = True
    end
    object adsWOReleaseListMANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
      ReadOnly = True
    end
    object adsWOReleaseListMANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      ReadOnly = True
      Size = 40
    end
    object adsWOReleaseListTType: TWordField
      FieldName = 'TType'
      ReadOnly = True
    end
    object adsWOReleaseListPROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      ReadOnly = True
      Size = 10
    end
    object adsWOReleaseListAdvicePordDate: TDateTimeField
      FieldName = 'AdvicePordDate'
      ReadOnly = True
    end
    object adsWOReleaseListwtype: TWordField
      FieldName = 'wtype'
    end
    object adsWOReleaseListput_type: TWordField
      FieldName = 'put_type'
    end
    object adsWOReleaseListWHOUSE_PTR: TIntegerField
      FieldName = 'WHOUSE_PTR'
    end
    object adsWOReleaseListONHOLD_RELEASE_FLAG: TWordField
      FieldName = 'ONHOLD_RELEASE_FLAG'
    end
    object adsWOReleaseListunit_sq: TFloatField
      FieldName = 'unit_sq'
    end
  end
  object cdsWOReleaseList: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforeInsert = cdsWOReleaseListBeforeDelete
    BeforeDelete = cdsWOReleaseListBeforeDelete
    Left = 248
    Top = 280
  end
  object dsWOReleaseList: TDataSource
    DataSet = cdsWOReleaseList
    Left = 368
    Top = 280
  end
  object dspWOReleaseList: TDataSetProvider
    DataSet = adsWOReleaseList
    Left = 152
    Top = 280
  end
  object qryENGFlow: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'vptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'vstep'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      'select data0038.dept_ptr,data0038.step_number,'
      ' data0034.barcode_entry_flag'
      ' from data0038,data0034'
      'where data0038.source_ptr=:vptr'
      'and data0038.step_number>=:vstep'
      'and data0038.dept_ptr=data0034.rkey'
      'order by data0038.step_number')
    Left = 486
    Top = 240
  end
  object ADO0048: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select * '
      'from data0048'
      'where rkey=0')
    Left = 496
    Top = 176
  end
  object adsWOCtrlList: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'SELECT     TOP (100) PERCENT D06.RKEY, D06.WORK_ORDER_NUMBER, a.' +
      'DEPT_CODE, D06.PROD_STATUS, D06.PANEL_A_B,D06.wtype AS wtype06, ' +
      'D06.QUAN_SCH, D56.FLOW_NO, '#13#10'                      D06.QUAN_REJ,' +
      ' D06.QUAN_PROD, D06.QUAN_ALLREJ, D06.REFERENCE_PTR, d25.PARENT_P' +
      'TR, a.DEPT_PTR AS deptptr, a.TTYPE, D06.PANELS, '#13#10'              ' +
      '        D56.PANELS AS PNL_ONLine, D06.BOM_PTR, d25.MANU_PART_NUM' +
      'BER, d25.MANU_PART_DESC, D56.STEP, D56.RKEY AS d56_rkey, D56.WTY' +
      'PE, '#13#10'                      D06.FLOW_NO AS Flow_NO_06, a.DEPT_NA' +
      'ME, D06.SCH_COMPL_DATE, D06.PRIORITY_CODE, D06.PARTS_PER_PANEL, ' +
      'D56.QTY_BACKLOG, '#13#10'                      D56.TO_BE_STOCKED, D56.' +
      'DEPT_PTR, D492.SO_NO, D492.CUT_NO, D08.PRODUCT_NAME, D10.CUST_CO' +
      'DE, D10.CUSTOMER_NAME, D06.ENT_DATETIME, '#13#10'                     ' +
      ' CASE D06.Prod_Status WHEN 2 THEN '#39#24453#21457#25918#39' WHEN 3 THEN '#39#29983#20135#20013#39' WHEN 4' +
      ' THEN '#39#22806#21457#29983#20135#39' WHEN 5 THEN '#39#24453#20837#20179#39' WHEN 6 THEN '#39#24453#20998#37197#39' WHEN 9 THEN '#39#29983#20135 +
      #32467#26463#39#13#10'                       WHEN 102 THEN '#39#29983#20135#21069#26242#32531#39' WHEN 103 THEN ' +
      #39#29983#20135#20013#26242#32531#39' WHEN 202 THEN '#39#21462#28040#39' ELSE '#39#39' END AS prod_Status_CN, '#13#10'    ' +
      '                  CASE D06.Trav_Printed_By_Ptr WHEN 0 THEN '#39#26410#25171#21360#39 +
      ' ELSE '#39#24050#25171#21360#39' END AS Print_Status, D06.CANCEL_HOLD_DATE, dbo.Data0' +
      '005.EMPLOYEE_NAME,'#13#10'                      d25.unit_sq, (D06.pane' +
      'l_ln*D06.panel_wd*0.000001) / D06.PARTS_PER_PANEL  AS  unit_sq_i' +
      'ncludingBoader,d10.rkey as rkey10,d25.rkey as rkey25,d60.ENT_DAT' +
      'E'#13#10'FROM         dbo.Data0025 AS d25 INNER JOIN'#13#10'                ' +
      '      dbo.Data0006 AS D06 ON D06.BOM_PTR = d25.RKEY LEFT OUTER J' +
      'OIN'#13#10'                      dbo.Data0056 AS D56 ON D56.WO_PTR = D' +
      '06.RKEY LEFT OUTER JOIN'#13#10'                      dbo.Data0034 AS a' +
      ' ON D56.DEPT_PTR = a.RKEY INNER JOIN'#13#10'                      dbo.' +
      'data0492 AS D492 ON D492.CUT_NO = D06.CUT_NO INNER JOIN'#13#10'       ' +
      '               dbo.Data0008 AS D08 ON D08.RKEY = d25.PROD_CODE_P' +
      'TR INNER JOIN'#13#10'                      dbo.Data0010 AS D10 ON D10.' +
      'RKEY = d25.CUSTOMER_PTR LEFT OUTER JOIN'#13#10'                      d' +
      'bo.Data0005 ON D06.TRAV_PRINTED_BY_PTR = dbo.Data0005.RKEY LEFT ' +
      'JOIN Data0060 d60 ON d60.SALES_ORDER = d492.SO_NO '#13#10'WHERE     (D' +
      '06.ENT_DATETIME >= '#39'2006-1-1'#39') AND (D06.ENT_DATETIME <= '#39'2006-1-' +
      '30'#39')'
    Parameters = <>
    Prepared = True
    Left = 32
    Top = 376
  end
  object dsWOCtrlList: TDataSource
    DataSet = adsWOCtrlList
    Left = 120
    Top = 376
  end
  object adsWO_INFO: TADODataSet
    Connection = ADOConnection1
    Parameters = <>
    Left = 272
    Top = 368
  end
  object dsWO_INFO: TDataSource
    DataSet = adsWO_INFO
    Left = 368
    Top = 368
  end
  object aqIESParam: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'F01'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT D278.PARAMETER_NAME, D494.PARAMETER_VALUE, D38.STEP_NUMBE' +
        'R,'
      '      D278.DATA_TYPE, D02.UNIT_CODE, D278.PARAMETER_DESC'
      'FROM dbo.Data0038 D38 INNER JOIN'
      
        '      dbo.Data0494 D494 ON D38.SOURCE_PTR = D494.custpart_ptr AN' +
        'D '
      '      D38.STEP_NUMBER = D494.step_number INNER JOIN'
      
        '      dbo.Data0278 D278 ON D494.PARAMETER_PTR = D278.RKEY INNER ' +
        'JOIN'
      '      dbo.Data0002 D02 ON D278.UNIT_PTR = D02.RKEY'
      'where D38.rkey=:F01')
    Left = 272
    Top = 432
  end
  object dsIESParam: TDataSource
    DataSet = aqIESParam
    Left = 336
    Top = 432
  end
  object aspWO_Split: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'WO_Split;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@OrgRkey'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@WONO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 30
        Value = '0'
      end
      item
        Name = '@PCS'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@PNL'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@User_ptr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@Remark'
        Attributes = [paNullable]
        DataType = ftString
        Size = 150
        Value = ' '
      end
      item
        Name = '@type'
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 480
    Top = 336
  end
  object tmpQry: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 504
    Top = 8
  end
  object CancelDeploy: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'Deploy_WO_Qty;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@main_WO_NO'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Sub_WO_List'
        Attributes = [paNullable]
        DataType = ftString
        Size = 200
        Value = Null
      end
      item
        Name = '@Qty_List'
        Attributes = [paNullable]
        DataType = ftString
        Size = 200
        Value = Null
      end
      item
        Name = '@User_ptr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@IsCancel'
        Attributes = [paNullable]
        DataType = ftBoolean
        Value = Null
      end
      item
        Name = '@rkey489_List'
        DataType = ftString
        Size = 200
        Value = Null
      end>
    Left = 480
    Top = 416
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 520
    Top = 88
  end
end
