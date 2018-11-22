object dmcon: Tdmcon
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 316
  Top = 197
  Height = 283
  Width = 367
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 25
  end
  object asp_WIP_List: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandTimeout = 500
    ProcedureName = 'WIP_Report;1'
    Parameters = <
      item
        Direction = pdReturnValue
        Size = -1
        Value = Null
      end>
    Prepared = True
    Left = 132
    Top = 25
  end
  object aqDept_List: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      
        #9'SELECT '#39'F_'#39'+REPLACE(D34.DEPT_CODE,'#39'/'#39','#39#39') as Dept_Code,D34.Dept' +
        '_Name'
      #9'FROM dbo.Data0006 D06 INNER JOIN'
      #9'      dbo.Data0025 D25 ON D06.BOM_PTR = D25.RKEY INNER JOIN'
      #9'      dbo.Data0056 D56 ON D06.RKEY = D56.WO_PTR INNER JOIN'
      
        #9'      dbo.Data0034 D34 ON D56.DEPT_PTR = D34.RKEY where D34.Seq' +
        '_Nr>0 and D34.ttype=1 and barcode_entry_flag='#39'Y'#39' group by D34.de' +
        'pt_code,D34.dept_name,D34.seq_nr'
      #9'order by D34.seq_nr'
      ''
      ' ')
    Left = 132
    Top = 97
  end
  object ds_WIP_List: TDataSource
    DataSet = asp_WIP_List
    Left = 204
    Top = 25
  end
  object adsDept_Sum: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      ' declare @CalcUnit  int select @CalcUnit =1 SELECT convert(varch' +
      'ar,D34.Seq_Nr)+'#39'_'#39'+D34.DEPT_CODE As Dept_Code,D34.Dept_Name,Qty=' +
      ' '#13#10'case @CalcUnit when 0 then sum((D56.QTY_BACKLOG+D56.TO_BE_STO' +
      'CKED)) when 1 then sum((D56.PANELS)) '#13#10'when 2 then sum((D56.QTY_' +
      'BACKLOG+D56.TO_BE_STOCKED)*D25.unit_sq)  end , '#13#10' D492.CUT_NO, D' +
      '25.MANU_PART_NUMBER, D06.PANEL_A_B,Dept_Code,sum((D56.QTY_BACKLO' +
      'G+D56.TO_BE_STOCKED))as onlineQty'#13#10'               ,case @CalcUni' +
      't when 0 then sum((case when d06.prod_status = 4 then D56.QTY_BA' +
      'CKLOG +D56.TO_BE_STOCKED  ELSE 0 END))     '#13#10'               when' +
      ' 1 then sum((case when d06.prod_status = 4 then D56.PANELS ELSE ' +
      '0 END))'#13#10'               when 2 then round(sum((case when d06.pro' +
      'd_status = 4 then D56.QTY_BACKLOG+D56.TO_BE_STOCKED ELSE 0 END)*' +
      'D25.unit_sq),3) end as qty_out'#13#10'               ,round(sum((case ' +
      'when d06.prod_status = 4 then D56.QTY_BACKLOG+D56.TO_BE_STOCKED ' +
      'ELSE 0 END)*D25.unit_sq),3) as SQM_Qty_out '#13#10'               ,cas' +
      'e @CalcUnit when 0 then sum((case when d06.prod_status <> 4 then' +
      ' D56.QTY_BACKLOG +D56.TO_BE_STOCKED  ELSE 0 END))     '#13#10'        ' +
      '       when 1 then sum((case when d06.prod_status <> 4 then D56.' +
      'PANELS ELSE 0 END))'#13#10'               when 2 then round(sum((case ' +
      'when d06.prod_status <> 4 then D56.QTY_BACKLOG+D56.TO_BE_STOCKED' +
      ' ELSE 0 END)*D25.unit_sq),3) end as qty_Online'#13#10'               ,' +
      'round(sum((case when d06.prod_status <> 4 then D56.QTY_BACKLOG+D' +
      '56.TO_BE_STOCKED ELSE 0 END)*D25.unit_sq),3) as SQM_Qty_Online '#13 +
      #10' ,case @CalcUnit when 0 then sum((case when d06.prod_status = 4' +
      ' then D56.QTY_BACKLOG +D56.TO_BE_STOCKED  ELSE 0 END)) '#13#10'       ' +
      '      when 1 then sum((case when d06.prod_status  = 4  then D56.' +
      'PANELS  ELSE 0 END))'#13#10'             when 2 then round(sum((case w' +
      'hen d06.prod_status = 4 then (D56.QTY_BACKLOG+D56.TO_BE_STOCKED)' +
      '*(D06.panel_ln*panel_wd*0.000001/PARTS_PER_PANEL) ELSE 0 END)*D2' +
      '5.unit_sq),3) end as qty_out34'#13#10#9'FROM dbo.Data0006 D06 INNER JOI' +
      'N'#13#10#9'      dbo.Data0025 D25 ON D06.BOM_PTR = D25.RKEY INNER JOIN'#13 +
      #10#9'      dbo.data0492 D492 ON D06.CUT_NO = D492.CUT_NO INNER JOIN' +
      #13#10#9'      dbo.data0056 D56 ON D06.RKEY = D56.WO_PTR INNER JOIN'#13#10#9 +
      '      dbo.Data0034 D34 ON D56.DEPT_PTR = D34.RKEY'#13#10'Where D34.Seq' +
      '_Nr>0 and D34.ttype=1 and barcode_entry_flag='#39'Y'#39' '#13#10#9'GROUP BY D49' +
      '2.CUT_NO, D25.MANU_PART_NUMBER, D06.PANEL_A_B, D34.Seq_Nr,D34.DE' +
      'PT_CODE,D34.DEPT_Name'#13#10'order by D492.CUT_NO, D25.MANU_PART_NUMBE' +
      'R, D06.PANEL_A_B, D34.Seq_Nr'#13#10
    Parameters = <>
    Prepared = True
    Left = 128
    Top = 160
  end
  object dsDept_Sum: TDataSource
    DataSet = adsDept_Sum
    Left = 200
    Top = 160
  end
  object ads60: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.Data0060.SALES_ORDER, dbo.Data0025.MANU_PART_NUMB' +
      'ER, dbo.Data0025.MANU_PART_DESC, dbo.Data0097.PO_NUMBER, '#13#10'     ' +
      '                 dbo.Data0010.CUST_CODE,data0060.ORIG_SCHED_SHIP' +
      '_DATE, dbo.Data0060.SCH_DATE, dbo.Data0060.PARTS_ORDERED,       ' +
      '               dbo.Data0060.PARTS_SHIPPED,  dbo.Data0060.PARTS_R' +
      'ETURNED, dbo.Data0060.RETURNED_SHIP, '#13#10'                      dbo' +
      '.Data0060.PARTS_ORDERED - dbo.Data0060.PARTS_SHIPPED + '#13#10'       ' +
      '                dbo.Data0060.PARTS_RETURNED - dbo.Data0060.RETUR' +
      'NED_SHIP AS qianhuo_qty,'#13#10'                       dbo.Data0060.TO' +
      '_BE_PLANNED, dbo.Data0060.so_oldnew, data0025.QTY_ON_HAND,'#13#10'    ' +
      '                  CASE dbo.Data0060.so_style WHEN 0 THEN '#39#27491#24335#35746#21333#39' ' +
      'WHEN 1 THEN '#39#22791#21697#35746#21333#39' END AS '#35746#21333#31867#22411', '#13#10'                      CASE dbo' +
      '.Data0060.PROD_REL WHEN '#39'1'#39' THEN '#39#26410#30830#35748#39' WHEN '#39'2'#39' THEN '#39#24050#30830#35748#39' WHEN ' +
      #39'3'#39' THEN '#39#24050#25237#20135#39' END AS '#30830#35748#29366#24577', '#13#10'                      CASE dbo.Dat' +
      'a0060.so_tp WHEN 0 THEN '#39#33258#21046#39' WHEN 1 THEN '#39#22806#21457#39' WHEN 2 THEN '#39#21322#21046#31243#39' ' +
      'END AS '#21152#24037#24418#24335#13#10'FROM         dbo.Data0060 INNER JOIN'#13#10'             ' +
      '         dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data00' +
      '25.RKEY INNER JOIN'#13#10'                      dbo.Data0097 ON dbo.Da' +
      'ta0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY INNER JOIN'#13#10'      ' +
      '                dbo.Data0010 ON dbo.Data0060.CUSTOMER_PTR = dbo.' +
      'Data0010.RKEY LEFT OUTER JOIN'#13#10'                          (SELECT' +
      '     TOP 100 PERCENT dbo.data0492.SO_NO'#13#10'                       ' +
      '     FROM          dbo.Data0056 INNER JOIN'#13#10'                    ' +
      '                               dbo.Data0006 ON dbo.Data0056.WO_P' +
      'TR = dbo.Data0006.RKEY INNER JOIN'#13#10'                             ' +
      '                      dbo.data0492 ON dbo.Data0006.CUT_NO = dbo.' +
      'data0492.CUT_NO'#13#10'                             where data0492.SO_' +
      'NO is not null'#13#10'                            GROUP BY dbo.data049' +
      '2.SO_NO'#13#10'                            ORDER BY dbo.data0492.SO_NO' +
      ') AS d1 ON dbo.Data0060.SALES_ORDER = d1.SO_NO'#13#10'WHERE     (dbo.D' +
      'ata0060.STATUS = 1) AND (d1.SO_NO IS NULL)'#13#10
    IndexFieldNames = 'sales_order'
    Parameters = <>
    Left = 40
    Top = 96
    object ads60SALES_ORDER: TStringField
      DisplayLabel = #38144#21806#35746#21333
      DisplayWidth = 12
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ads60MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      DisplayWidth = 10
      FieldName = 'MANU_PART_NUMBER'
    end
    object ads60MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      DisplayWidth = 20
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ads60PO_NUMBER: TStringField
      DisplayLabel = #23458#25143#35746#21333#21495
      DisplayWidth = 15
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ads60CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      DisplayWidth = 8
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ads60ORIG_SCHED_SHIP_DATE: TDateTimeField
      DisplayLabel = #23458#25143#20132#26399
      DisplayWidth = 12
      FieldName = 'ORIG_SCHED_SHIP_DATE'
    end
    object ads60SCH_DATE: TDateTimeField
      DisplayLabel = #22238#22797#20132#26399
      DisplayWidth = 11
      FieldName = 'SCH_DATE'
    end
    object ads60PARTS_ORDERED: TFloatField
      DisplayLabel = #35746#21333#25968#37327
      DisplayWidth = 7
      FieldName = 'PARTS_ORDERED'
    end
    object ads60PARTS_SHIPPED: TFloatField
      DisplayLabel = #27491#24120#36865#36135
      DisplayWidth = 7
      FieldName = 'PARTS_SHIPPED'
    end
    object ads60PARTS_RETURNED: TFloatField
      DisplayLabel = #36864#36135#25968#37327
      DisplayWidth = 7
      FieldName = 'PARTS_RETURNED'
    end
    object ads60RETURNED_SHIP: TIntegerField
      DisplayLabel = #36864#36135#36865#36135
      DisplayWidth = 8
      FieldName = 'RETURNED_SHIP'
    end
    object ads60qianhuo_qty: TFloatField
      DisplayLabel = #27424#36135#25968#37327
      DisplayWidth = 7
      FieldName = 'qianhuo_qty'
      ReadOnly = True
    end
    object ads60TO_BE_PLANNED: TIntegerField
      DisplayLabel = #24453#35745#21010#25968#37327
      DisplayWidth = 10
      FieldName = 'TO_BE_PLANNED'
    end
    object ads60so_oldnew: TStringField
      DisplayLabel = #35746#21333#26032#26087
      DisplayWidth = 4
      FieldName = 'so_oldnew'
      FixedChar = True
      Size = 4
    end
    object ads60DSDesigner: TStringField
      DisplayWidth = 8
      FieldName = #35746#21333#31867#22411
      ReadOnly = True
      Size = 8
    end
    object ads60DSDesigner2: TStringField
      DisplayWidth = 6
      FieldName = #30830#35748#29366#24577
      ReadOnly = True
      Size = 6
    end
    object ads60DSDesigner3: TStringField
      DisplayWidth = 6
      FieldName = #21152#24037#24418#24335
      ReadOnly = True
      Size = 6
    end
    object ads60QTY_ON_HAND: TIntegerField
      DisplayLabel = #24403#21069#24211#23384
      FieldName = 'QTY_ON_HAND'
    end
  end
  object DataSource1: TDataSource
    DataSet = ads60
    Left = 40
    Top = 152
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 256
    Top = 96
  end
end
