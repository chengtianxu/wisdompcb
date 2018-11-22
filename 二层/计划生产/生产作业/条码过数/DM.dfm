object dmcon: Tdmcon
  OldCreateOrder = False
  Left = 408
  Top = 493
  Height = 545
  Width = 800
  object ADOConnection1: TADOConnection
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 32
  end
  object adsUserInfo: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select data0486.*,data0005.active_flag from data0486,data0005 wh' +
      'ere data0486.empl_ptr=data0005.rkey and '#13#10'LOGIN_NAME=:F01'
    Parameters = <
      item
        Name = 'F01'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    Left = 120
    Top = 32
  end
  object adsWOInfo: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'SELECT D34.DEPT_CODE, D34.DEPT_NAME, D06.WORK_ORDER_NUMBER, D06.' +
      'CUT_NO, D06.Quan_Sch, D06.Quan_Rej,D25.parent_ptr,'#13#10'      D06.PA' +
      'NEL_A_B, D06.PROD_STATUS, D56.*, D06.QUAN_ALLREJ, D06.WIPMAT_STA' +
      'TUS,isnull(D06.CUTNO_WO,'#39#39') as cutno_wo,D06.SCH_COMPL_DATE,'#13#10'   ' +
      '   D06.wtype AS Wtype06, D06.BOM_PTR, D25.MANU_PART_NUMBER, D06.' +
      'rKey as rKey06,D06.PARTS_PER_PANEL,'#13#10'      D25.MANU_PART_DESC, D' +
      '06.SCH_COMPL_DATE, D492.TTYPE,isnull(DATEDIFF(day,getdate(), D06' +
      '.SCH_COMPL_DATE) ,0) AS '#20132#36135#21608#26399','#13#10'      D492.whouse_ptr,D34.ALLOW_S' +
      'PLIT_LOTS, D34.SETUP_TIME_PER_LOT,D34.QUEUE_TIME,D34.PROCESS_TIM' +
      'E,D34.PROCESS_TIME_B'#13#10'FROM dbo.Data0006 D06 INNER JOIN'#13#10'      db' +
      'o.Data0056 D56 ON D06.RKEY = D56.WO_PTR INNER JOIN'#13#10'      dbo.Da' +
      'ta0034 D34 ON D56.DEPT_PTR = D34.RKEY INNER JOIN'#13#10'      dbo.Data' +
      '0025 D25 ON D06.BOM_PTR = D25.RKEY INNER JOIN'#13#10'      dbo.data049' +
      '2 D492 ON D06.CUT_NO = D492.CUT_NO'#13#10'where D06.Work_Order_Number=' +
      ':F01'
    Parameters = <
      item
        Name = 'F01'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 22
        Value = Null
      end>
    Left = 40
    Top = 112
  end
  object dsWOInfo: TDataSource
    DataSet = adsWOInfo
    Left = 104
    Top = 112
  end
  object aqNextStepNO: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
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
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT top 1 D34.rKey,D34.DEPT_CODE, D34.DEPT_NAME, D38.STEP_NUM' +
        'BER,'
      'D34.ALLOW_SPLIT_LOTS'
      'FROM dbo.Data0038 D38 INNER JOIN'
      '      dbo.Data0034 D34 ON D38.DEPT_PTR = D34.RKEY'
      
        'WHERE (D34.BARCODE_ENTRY_FLAG = '#39'Y'#39') and D38.Source_ptr=:F01 and' +
        ' D38.Step_Number>:F02'
      'order by Step_Number asc')
    Left = 296
    Top = 240
  end
  object adsEmployee: TADODataSet
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    CommandText = 
      'select data0005.rkey,data0005.empl_code,data0005.employee_name,d' +
      'ata0034.rkey as rkey34'#13#10'from data0005 left join data0034'#13#10'on dat' +
      'a0005.employee_id=data0034.big_dept_ptr'#13#10'and data0005.Active_Fla' +
      'g='#39'Y'#39#13#10'and data0034.rkey=:F01'#13#10'order by empl_code'
    Parameters = <
      item
        Name = 'F01'
        Size = -1
        Value = Null
      end>
    Left = 40
    Top = 176
  end
  object aqBasicParam: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select ppc_control12,ppc_control23 from data0192')
    Left = 176
    Top = 176
  end
  object aqTmp: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 248
    Top = 176
  end
  object dsEmployee: TDataSource
    DataSet = adsEmployee
    Left = 104
    Top = 176
  end
  object ads0041: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from data0041 where rkey=NULL'
    Parameters = <>
    Left = 40
    Top = 232
  end
  object ads0048: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from data0048 where rkey=NULL'
    Parameters = <>
    Left = 96
    Top = 232
  end
  object aqTmp2: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 160
    Top = 240
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 224
    Top = 240
  end
  object DS: TDataSource
    DataSet = adsUserInfo
    Left = 192
    Top = 32
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
        Value = Null
      end
      item
        Name = '@OrgRkey'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@WONO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 30
        Value = Null
      end
      item
        Name = '@PCS'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@PNL'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
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
        Name = '@Remark'
        Attributes = [paNullable]
        DataType = ftString
        Size = 150
        Value = Null
      end>
    Left = 256
    Top = 48
  end
  object tmpQry: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 264
    Top = 112
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
    Left = 480
    Top = 80
  end
  object adsProdList: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterOpen = adsProdListAfterOpen
    AfterScroll = adsProdListAfterScroll
    CommandText = 
      'SELECT barcode_flag,D06.RKEY,D06.WORK_ORDER_NUMBER,D06.BOM_PTR,D' +
      '06.QUAN_SCH,D06.WIPMAT_STATUS,D06.ENT_DATETIME,D06.SCH_COMPL_DAT' +
      'E,D06.PARTS_PER_PANEL,'#13#10'D06.cut_no,D06.quan_rej,D06.quan_prod,D0' +
      '6.panels,D492.SO_NO,D492.mrb_ptr,'#13#10'D10.CUST_CODE, D25.CUSTOMER_P' +
      'TR, D25.MANU_PART_NUMBER,D25.MANU_PART_DESC,D492.TType ,D08.PROD' +
      '_CODE,D06.panel_A_B,D492.whouse_ptr'#13#10'FROM dbo.Data0025 D25 INNER' +
      ' JOIN'#13#10'      dbo.Data0010 D10 ON D25.CUSTOMER_PTR = D10.RKEY '#13#10'I' +
      'NNER JOIN Data0006 D06 on D06.BOM_PTR=D25.RKEY'#13#10'INNER JOIN DATA0' +
      '492 D492 ON D492.CUT_NO=D06.CUT_NO'#13#10'INNER JOIN DATA0008 D08 ON D' +
      '08.RKEY=D25.PROD_CODE_PTR'#13#10'Where  (D06.WIPMAT_STATUS = 0) and (D' +
      '06.PROD_STATUS<9)'#13#10'and      (D25.RKEY IN'#13#10'          (SELECT pare' +
      'nt_ptr'#13#10'         FROM data0025'#13#10'         WHERE parent_ptr > 0 ))' +
      #13#10'and D06.work_order_number=:wo06'#13#10'ORDER BY D06.WORK_ORDER_NUMBE' +
      'R'#13#10
    Parameters = <
      item
        Name = 'wo06'
        Size = -1
        Value = Null
      end>
    Left = 472
    Top = 16
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
    Left = 560
    Top = 16
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
    Left = 568
    Top = 80
  end
  object ADOSub25: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey25'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'step'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end>
    SQL.Strings = (
      
        'select rkey from data0025 where parent_ptr=:rkey25 and bom_step=' +
        ':step')
    Left = 56
    Top = 408
    object ADOSub25rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
  end
  object ADOSumqty: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey25'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select sum(D56.Qty_BackLog-d06.quan_allrej) as qty_totel'
      'from data0006 D06 inner join data0056 D56 on D56.WO_Ptr=D06.rKey'
      'inner join data0492 D492 on D06.Cut_NO=D492.Cut_NO'
      'where d06.PROD_STATUS=6 and d06.bom_ptr=:rkey25')
    Left = 120
    Top = 352
    object ADOSumqtyqty_totel: TFloatField
      FieldName = 'qty_totel'
      ReadOnly = True
    end
  end
  object ADOSubneed: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'wo06'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 22
        Value = Null
      end
      item
        Name = 'rkey25'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        '   select data0006.work_order_number,cast((data0025.qty_bom+0.0)' +
        '/data0025.QTY_PARENTBOM as decimal(18,4)) as qty_bom,data0025.ma' +
        'nu_part_number,IsNULL(data0488.quan_issued,0) as quan_issued, '
      
        '          data0025.rkey,data0025.bom_step,ceiling(Data0025.Qty_b' +
        'om*Data0006.quan_sch/(QTY_PARENTBOM+0.0)) as Qty_Total_Req,data0' +
        '006.rKey as WONO,'
      
        '          ceiling(Data0025.Qty_bom*Data0006.quan_sch/(QTY_PARENT' +
        'BOM+0.0))-IsNULL(data0488.quan_issued,0) as Qty_Needed'
      '          from data0006 inner join data0025 on '
      '          data0006.bom_ptr=data0025.parent_ptr '
      '          LEFT JOIN Data0056 ON Data0056.WO_PTR = Data0006.RKey '
      
        '          left outer join data0488 on data0488.WO_Ptr=data0006.r' +
        'Key and data0488.bom_ptr=data0025.rkey '
      
        '          where data0006.work_order_number=:wo06  AND data0025.r' +
        'key=:rkey25 AND Data0025.BOM_STEP = data0056.STEP '
      '          ORDER by data0025.bom_step,data0025.manu_part_number ')
    Left = 48
    Top = 344
    object ADOSubneedwork_order_number: TStringField
      FieldName = 'work_order_number'
      Size = 22
    end
    object ADOSubneedqty_bom: TBCDField
      FieldName = 'qty_bom'
      ReadOnly = True
      Precision = 18
    end
    object ADOSubneedmanu_part_number: TStringField
      FieldName = 'manu_part_number'
    end
    object ADOSubneedquan_issued: TIntegerField
      FieldName = 'quan_issued'
      ReadOnly = True
    end
    object ADOSubneedrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOSubneedbom_step: TWordField
      FieldName = 'bom_step'
    end
    object ADOSubneedQty_Total_Req: TFloatField
      FieldName = 'Qty_Total_Req'
      ReadOnly = True
    end
    object ADOSubneedWONO: TAutoIncField
      FieldName = 'WONO'
      ReadOnly = True
    end
    object ADOSubneedQty_Needed: TFloatField
      FieldName = 'Qty_Needed'
      ReadOnly = True
    end
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
    Left = 360
    Top = 152
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
    Left = 656
    Top = 152
  end
  object cdsWorkOrderList: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforeInsert = cdsWorkOrderListBeforeInsert
    BeforeEdit = cdsWorkOrderListBeforeEdit
    BeforeDelete = cdsWorkOrderListBeforeDelete
    Left = 552
    Top = 152
    object cdsWorkOrderListIsSelected: TBooleanField
      FieldName = 'IsSelected'
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
    Left = 456
    Top = 152
  end
  object dsTransRec: TDataSource
    DataSet = adsTransRec
    Left = 632
    Top = 72
  end
  object NextStep_238: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
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
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      
        'select top 1 d34.rkey,d34.dept_code,d34.dept_name,d238.step_numb' +
        'er,'
      'd34.allow_split_lots'
      'from data0238 d238 inner join '
      '     data0034 d34 on d238.dept_ptr=d34.rkey'
      
        'where (d34.barcode_entry_flag='#39'Y'#39') and d238.wo_ptr=:F01 and d238' +
        '.step_number>:F02'
      'order by step_number asc')
    Left = 438
    Top = 272
  end
  object WoClamp: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <
      item
        Name = 'cutno_wo'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 22
        Value = Null
      end
      item
        Name = 'step'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      'SELECT'
      
        '          dbo.Data0006.WORK_ORDER_NUMBER, dbo.Data0006.CUT_NO, d' +
        'bo.Data0006.PANEL_A_B, dbo.Data0006.BEGIN_STEP_NO, '
      
        '          dbo.Data0006.SUB_LEVELS, dbo.Data0006.PRIORITY_CODE, d' +
        'bo.Data0006.PROD_STATUS, dbo.Data0006.ENGG_STATUS, '
      
        '          dbo.Data0006.ENGG_PROD_FLAG, dbo.Data0006.QUAN_SCH, db' +
        'o.Data0006.QUAN_REJ, dbo.Data0006.QUAN_PROD, dbo.Data0006.PANELS' +
        ', '
      
        '          dbo.Data0006.REMARK_PNLS, dbo.Data0006.PLANNED_QTY, db' +
        'o.Data0006.FLOW_NO, dbo.Data0006.WIPMAT_STATUS, dbo.Data0006.wty' +
        'pe, '
      
        '          dbo.Data0006.put_type, dbo.Data0006.MATL_COST, dbo.Dat' +
        'a0006.OVHD_COST, dbo.Data0006.from_wo_ptr,isnull(dbo.Data0006.CU' +
        'TNO_WO,'#39#39') as cutno_wo, '
      
        '          dbo.Data0006.LOT_NUMBER, dbo.Data0006.QUAN_ALLPNL, dbo' +
        '.Data0006.RKEY AS rkey06, dbo.Data0056.RKEY, dbo.Data0056.STEP, '
      
        '          dbo.Data0056.QTY_BACKLOG, dbo.Data0056.PANELS AS panel' +
        's56, dbo.Data0056.INTIME, '
      
        '          dbo.Data0056.TO_BE_STOCKED, dbo.Data0056.WTYPE AS wtyp' +
        'e56, dbo.Data0056.REFERENCE, dbo.Data0056.TO_BE_CANCD, '
      '          dbo.Data0056.OUTSOURCE, dbo.Data0056.PO_NUMBER'
      'FROM         dbo.Data0006 INNER JOIN'
      
        '                   dbo.Data0056 ON dbo.Data0006.RKEY = dbo.Data0' +
        '056.WO_PTR'
      'WHERE      dbo.Data0006.cutno_wo=:cutno_wo '
      '                  and dbo.Data0056.step=:step'
      '                  and dbo.Data0006.prod_status in (3,5,6)'
      '                  and dbo.Data0006.wtype in (0,1,3)'
      '                  '
      '          ')
    Left = 674
    Top = 343
    object WoClampWORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object WoClampCUT_NO: TStringField
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object WoClampPANEL_A_B: TIntegerField
      FieldName = 'PANEL_A_B'
    end
    object WoClampBEGIN_STEP_NO: TSmallintField
      FieldName = 'BEGIN_STEP_NO'
    end
    object WoClampSUB_LEVELS: TSmallintField
      FieldName = 'SUB_LEVELS'
    end
    object WoClampPRIORITY_CODE: TWordField
      FieldName = 'PRIORITY_CODE'
    end
    object WoClampPROD_STATUS: TSmallintField
      FieldName = 'PROD_STATUS'
    end
    object WoClampENGG_STATUS: TSmallintField
      FieldName = 'ENGG_STATUS'
    end
    object WoClampENGG_PROD_FLAG: TSmallintField
      FieldName = 'ENGG_PROD_FLAG'
    end
    object WoClampQUAN_SCH: TFloatField
      FieldName = 'QUAN_SCH'
    end
    object WoClampQUAN_REJ: TFloatField
      FieldName = 'QUAN_REJ'
    end
    object WoClampQUAN_PROD: TFloatField
      FieldName = 'QUAN_PROD'
    end
    object WoClampPANELS: TIntegerField
      FieldName = 'PANELS'
    end
    object WoClampREMARK_PNLS: TFloatField
      FieldName = 'REMARK_PNLS'
    end
    object WoClampPLANNED_QTY: TFloatField
      FieldName = 'PLANNED_QTY'
    end
    object WoClampFLOW_NO: TSmallintField
      FieldName = 'FLOW_NO'
    end
    object WoClampWIPMAT_STATUS: TSmallintField
      FieldName = 'WIPMAT_STATUS'
    end
    object WoClampwtype: TWordField
      FieldName = 'wtype'
    end
    object WoClampput_type: TWordField
      FieldName = 'put_type'
    end
    object WoClampMATL_COST: TFloatField
      FieldName = 'MATL_COST'
    end
    object WoClampOVHD_COST: TFloatField
      FieldName = 'OVHD_COST'
    end
    object WoClampfrom_wo_ptr: TIntegerField
      FieldName = 'from_wo_ptr'
    end
    object WoClampCUTNO_WO: TStringField
      FieldName = 'CUTNO_WO'
      Size = 22
    end
    object WoClampLOT_NUMBER: TStringField
      FieldName = 'LOT_NUMBER'
      Size = 4
    end
    object WoClampQUAN_ALLPNL: TIntegerField
      FieldName = 'QUAN_ALLPNL'
    end
    object WoClamprkey06: TAutoIncField
      FieldName = 'rkey06'
      ReadOnly = True
    end
    object WoClampRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object WoClampSTEP: TSmallintField
      FieldName = 'STEP'
    end
    object WoClampQTY_BACKLOG: TFloatField
      FieldName = 'QTY_BACKLOG'
    end
    object WoClamppanels56: TIntegerField
      FieldName = 'panels56'
    end
    object WoClampINTIME: TDateTimeField
      FieldName = 'INTIME'
    end
    object WoClampTO_BE_STOCKED: TFloatField
      FieldName = 'TO_BE_STOCKED'
    end
    object WoClampwtype56: TSmallintField
      FieldName = 'wtype56'
    end
    object WoClampREFERENCE: TStringField
      FieldName = 'REFERENCE'
    end
    object WoClampTO_BE_CANCD: TIntegerField
      FieldName = 'TO_BE_CANCD'
    end
    object WoClampOUTSOURCE: TBooleanField
      FieldName = 'OUTSOURCE'
    end
    object WoClampPO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 25
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 530
    Top = 454
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 622
    Top = 453
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 716
    Top = 453
  end
  object WoClampIn: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <
      item
        Name = 'step'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      'SELECT'
      
        '          dbo.Data0006.WORK_ORDER_NUMBER, dbo.Data0006.CUT_NO, d' +
        'bo.Data0006.PANEL_A_B, dbo.Data0006.BEGIN_STEP_NO, '
      
        '          dbo.Data0006.SUB_LEVELS, dbo.Data0006.PRIORITY_CODE, d' +
        'bo.Data0006.PROD_STATUS, dbo.Data0006.ENGG_STATUS, '
      
        '          dbo.Data0006.ENGG_PROD_FLAG, dbo.Data0006.QUAN_SCH, db' +
        'o.Data0006.QUAN_REJ, dbo.Data0006.QUAN_PROD, dbo.Data0006.PANELS' +
        ', '
      
        '          dbo.Data0006.REMARK_PNLS, dbo.Data0006.PLANNED_QTY, db' +
        'o.Data0006.FLOW_NO, dbo.Data0006.WIPMAT_STATUS, dbo.Data0006.wty' +
        'pe, '
      
        '          dbo.Data0006.put_type, dbo.Data0006.MATL_COST, dbo.Dat' +
        'a0006.OVHD_COST, dbo.Data0006.from_wo_ptr,isnull(dbo.Data0006.CU' +
        'TNO_WO,'#39#39') as cutno_wo, '
      
        '          dbo.Data0006.LOT_NUMBER, dbo.Data0006.QUAN_ALLPNL, dbo' +
        '.Data0006.RKEY AS rkey06, dbo.Data0056.RKEY, dbo.Data0056.STEP, '
      
        '          dbo.Data0056.QTY_BACKLOG, dbo.Data0056.PANELS AS panel' +
        's56, dbo.Data0056.INTIME, '
      
        '          dbo.Data0056.TO_BE_STOCKED, dbo.Data0056.WTYPE AS wtyp' +
        'e56, dbo.Data0056.REFERENCE, dbo.Data0056.TO_BE_CANCD, '
      '          dbo.Data0056.OUTSOURCE, dbo.Data0056.PO_NUMBER'
      'FROM         dbo.Data0006 INNER JOIN'
      
        '                   dbo.Data0056 ON dbo.Data0006.RKEY = dbo.Data0' +
        '056.WO_PTR'
      'WHERE       dbo.Data0056.step=:step'
      '                  and dbo.Data0006.prod_status in (3,5,6)'
      '                  and dbo.Data0006.wtype in (0,1,3)'
      ''
      '          ')
    Left = 606
    Top = 342
    object WoClampInWORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object WoClampInCUT_NO: TStringField
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object WoClampInPANEL_A_B: TIntegerField
      FieldName = 'PANEL_A_B'
    end
    object WoClampInBEGIN_STEP_NO: TSmallintField
      FieldName = 'BEGIN_STEP_NO'
    end
    object WoClampInSUB_LEVELS: TSmallintField
      FieldName = 'SUB_LEVELS'
    end
    object WoClampInPRIORITY_CODE: TWordField
      FieldName = 'PRIORITY_CODE'
    end
    object WoClampInPROD_STATUS: TSmallintField
      FieldName = 'PROD_STATUS'
    end
    object WoClampInENGG_STATUS: TSmallintField
      FieldName = 'ENGG_STATUS'
    end
    object WoClampInENGG_PROD_FLAG: TSmallintField
      FieldName = 'ENGG_PROD_FLAG'
    end
    object WoClampInQUAN_SCH: TFloatField
      FieldName = 'QUAN_SCH'
    end
    object WoClampInQUAN_REJ: TFloatField
      FieldName = 'QUAN_REJ'
    end
    object WoClampInQUAN_PROD: TFloatField
      FieldName = 'QUAN_PROD'
    end
    object WoClampInPANELS: TIntegerField
      FieldName = 'PANELS'
    end
    object WoClampInREMARK_PNLS: TFloatField
      FieldName = 'REMARK_PNLS'
    end
    object WoClampInPLANNED_QTY: TFloatField
      FieldName = 'PLANNED_QTY'
    end
    object WoClampInFLOW_NO: TSmallintField
      FieldName = 'FLOW_NO'
    end
    object WoClampInWIPMAT_STATUS: TSmallintField
      FieldName = 'WIPMAT_STATUS'
    end
    object WoClampInwtype: TWordField
      FieldName = 'wtype'
    end
    object WoClampInput_type: TWordField
      FieldName = 'put_type'
    end
    object WoClampInMATL_COST: TFloatField
      FieldName = 'MATL_COST'
    end
    object WoClampInOVHD_COST: TFloatField
      FieldName = 'OVHD_COST'
    end
    object WoClampInfrom_wo_ptr: TIntegerField
      FieldName = 'from_wo_ptr'
    end
    object WoClampInCUTNO_WO: TStringField
      FieldName = 'CUTNO_WO'
      Size = 22
    end
    object WoClampInLOT_NUMBER: TStringField
      FieldName = 'LOT_NUMBER'
      Size = 4
    end
    object WoClampInQUAN_ALLPNL: TIntegerField
      FieldName = 'QUAN_ALLPNL'
    end
    object WoClampInrkey06: TAutoIncField
      FieldName = 'rkey06'
      ReadOnly = True
    end
    object WoClampInRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object WoClampInSTEP: TSmallintField
      FieldName = 'STEP'
    end
    object WoClampInQTY_BACKLOG: TFloatField
      FieldName = 'QTY_BACKLOG'
    end
    object WoClampInpanels56: TIntegerField
      FieldName = 'panels56'
    end
    object WoClampInINTIME: TDateTimeField
      FieldName = 'INTIME'
    end
    object WoClampInTO_BE_STOCKED: TFloatField
      FieldName = 'TO_BE_STOCKED'
    end
    object WoClampInwtype56: TSmallintField
      FieldName = 'wtype56'
    end
    object WoClampInREFERENCE: TStringField
      FieldName = 'REFERENCE'
    end
    object WoClampInTO_BE_CANCD: TIntegerField
      FieldName = 'TO_BE_CANCD'
    end
    object WoClampInOUTSOURCE: TBooleanField
      FieldName = 'OUTSOURCE'
    end
    object WoClampInPO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 25
    end
  end
  object Para_Value: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey25'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'step_number'
        Attributes = [paSigned, paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      'select names_value=isnull(STUFF((SELECT '#39','#39' + PARAMETER_VALUE'
      '                      FROM  dbo.Data0494'
      
        '                      where custpart_ptr=:rkey25 and step_number' +
        '=:step_number and outp_spfc_flag='#39'Y'#39' FOR XML PATH('#39#39')), 1, 1, '#39#39 +
        '),'#39#39')')
    Left = 504
    Top = 344
    object Para_Valuenames_value: TMemoField
      FieldName = 'names_value'
      ReadOnly = True
      BlobType = ftMemo
    end
  end
end
