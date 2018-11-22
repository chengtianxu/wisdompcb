object dm: Tdm
  OldCreateOrder = False
  Left = 469
  Top = 177
  Height = 300
  Width = 250
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 8
  end
  object ADOQ451: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'v_year'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'Select data0451.ACTUAL_FM_DATE,data0451.ACTUAL_END_DATE,'
      'data0005.employee_name,data0451.closed_date,data0451.rkey,'
      'data0451.END_DATE,data0451.wo_ptr'
      'from data0451 inner join data0005'
      'on data0451.closed_by=data0005.rkey'
      'where year(closed_date)=:v_year'
      'order by FM_DATE')
    Left = 128
    Top = 8
    object ADOQ451ACTUAL_FM_DATE: TDateTimeField
      FieldName = 'ACTUAL_FM_DATE'
    end
    object ADOQ451ACTUAL_END_DATE: TDateTimeField
      FieldName = 'ACTUAL_END_DATE'
    end
    object ADOQ451employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object ADOQ451closed_date: TDateTimeField
      FieldName = 'closed_date'
    end
    object ADOQ451rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQ451END_DATE: TDateTimeField
      FieldName = 'END_DATE'
    end
    object ADOQ451wo_ptr: TIntegerField
      FieldName = 'wo_ptr'
    end
  end
  object ADOD424: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select data0034.dept_code,data0034.dept_name,data0424.*,data0015' +
      '.abbr_name,data0034.cost_name'#13#10'from data0424 inner join data0034' +
      #13#10' on data0424.dept_ptr=data0034.rkey inner join data0015 on dat' +
      'a0424.warehouse_ptr=data0015.rkey'#13#10'where'#13#10'  data0424.d0451_ptr=:' +
      'vptr'#13#10'ORDER by data0424.warehouse_ptr,data0034.SEQ_NR'
    Parameters = <
      item
        Name = 'vptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 32
    Top = 64
    object ADOD424dept_code: TStringField
      DisplayLabel = #36164#28304#32534#21495
      FieldName = 'dept_code'
      Size = 10
    end
    object ADOD424dept_name: TStringField
      DisplayLabel = #36164#28304#21517#31216
      FieldName = 'dept_name'
      Size = 30
    end
    object ADOD424RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOD424D0451_PTR: TIntegerField
      FieldName = 'D0451_PTR'
    end
    object ADOD424DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ADOD424OVHD_1: TBCDField
      FieldName = 'OVHD_1'
      Precision = 18
      Size = 2
    end
    object ADOD424OVHD_2: TBCDField
      FieldName = 'OVHD_2'
      Precision = 18
      Size = 2
    end
    object ADOD424OVHD_3: TBCDField
      FieldName = 'OVHD_3'
      Precision = 18
      Size = 2
    end
    object ADOD424yield_sqft: TBCDField
      DisplayLabel = #33258#21046#29983#20135#38754#31215
      FieldName = 'yield_sqft'
      Precision = 19
    end
    object ADOD424yield_amount: TBCDField
      FieldName = 'yield_amount'
      Precision = 19
    end
    object ADOD424STD_OVHD_1: TBCDField
      FieldName = 'STD_OVHD_1'
      Precision = 18
      Size = 2
    end
    object ADOD424STD_OVHD_2: TBCDField
      FieldName = 'STD_OVHD_2'
      Precision = 18
      Size = 2
    end
    object ADOD424STD_OVHD_3: TBCDField
      FieldName = 'STD_OVHD_3'
      Precision = 18
      Size = 2
    end
    object ADOD424STD_MTAL_1: TBCDField
      FieldName = 'STD_MTAL_1'
      Precision = 12
      Size = 2
    end
    object ADOD424STD_MTAL_2: TBCDField
      FieldName = 'STD_MTAL_2'
      Precision = 12
      Size = 2
    end
    object ADOD424OVHD_MTAL_1: TBCDField
      FieldName = 'OVHD_MTAL_1'
      Precision = 12
      Size = 2
    end
    object ADOD424abbr_name: TStringField
      FieldName = 'abbr_name'
      Size = 10
    end
    object ADOD424warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object ADOD424cost_name: TStringField
      DisplayLabel = #25104#26412#20013#24515
      FieldName = 'cost_name'
      FixedChar = True
      Size = 15
    end
    object ADOD424OVHD_4: TBCDField
      FieldName = 'OVHD_4'
      Precision = 18
      Size = 2
    end
    object ADOD424OVHD_5: TBCDField
      FieldName = 'OVHD_5'
      Precision = 18
      Size = 2
    end
    object ADOD424STD_OVHD_4: TBCDField
      FieldName = 'STD_OVHD_4'
      Precision = 18
      Size = 2
    end
    object ADOD424STD_OVHD_5: TBCDField
      FieldName = 'STD_OVHD_5'
      Precision = 18
      Size = 2
    end
    object ADOD424yield_sqft_wf: TBCDField
      DisplayLabel = #22806#21457#29983#20135#38754#31215
      FieldName = 'yield_sqft_wf'
      ReadOnly = True
      Precision = 18
    end
  end
  object ADOQ50: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'date1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'date2'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'SELECT MANU_PART_NUMBER,MANU_PART_DESC,'
      'CUSTPART_ENT_DATE'
      'from data0025'
      'where'
      '(audited_by_ptr>0) and'
      '(cost_appr_by is null)and'
      '(custpart_ent_date > :date1) and'
      '(custpart_ent_date <= :date2)'
      '')
    Left = 132
    Top = 64
    object ADOQ50MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOQ50MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ADOQ50CUSTPART_ENT_DATE: TDateTimeField
      DisplayLabel = #21019#24314#26085#26399
      FieldName = 'CUSTPART_ENT_DATE'
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 136
    Top = 136
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 48
    Top = 176
  end
  object ADOD410: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.Data0006.WORK_ORDER_NUMBER, dbo.Data0025.MANU_PAR' +
      'T_NUMBER, dbo.Data0025.MANU_PART_DESC, dbo.Data0008.PRODUCT_NAME' +
      ', '#13#10'                      dbo.data0410.STEP, dbo.data0410.QTY, '#13 +
      #10'                      case when dbo.data0410.WTYPE=0 then '#39#27491#24120#39' ' +
      'when dbo.data0410.WTYPE=2 then '#39#36820#24037#39' when dbo.data0410.WTYPE=3 th' +
      'en '#39#22806#21457#39' else '#39#20854#23427#39' end as WTYPE,'#13#10'                       dbo.data' +
      '0410.QTY * dbo.data0410.unit_sq AS sq_total,'#13#10'                  ' +
      '    dbo.data0410.QTY * dbo.data0410.matl_pcs as matl_total,'#13#10'   ' +
      '                   dbo.data0410.QTY * dbo.data0410.ovhd_pcs as o' +
      'vhd_total,'#13#10'                      dbo.data0410.QTY * dbo.data041' +
      '0.ovhd1_pcs as ovhd1_total,'#13#10'                      dbo.data0410.' +
      'QTY * dbo.data0410.outsource_pcs as outsource_total             ' +
      '         '#13#10'FROM         dbo.Data0025 INNER JOIN'#13#10'               ' +
      '       dbo.Data0006 ON dbo.Data0025.RKEY = dbo.Data0006.BOM_PTR ' +
      'INNER JOIN'#13#10'                      dbo.data0410 ON dbo.Data0006.R' +
      'KEY = dbo.data0410.WO_PTR INNER JOIN'#13#10'                      dbo.' +
      'Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY'#13#10'wher' +
      'e       (dbo.data0410.D0451_PTR = :D0451_PTR) AND (data0410.ware' +
      'house_ptr = :warehouse_ptr) AND (dbo.data0410.DEPT_PTR = :DEPT_P' +
      'TR)'
    IndexFieldNames = 'WORK_ORDER_NUMBER'
    Parameters = <
      item
        Name = 'D0451_PTR'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'warehouse_ptr'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'DEPT_PTR'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 32
    Top = 120
    object ADOD410WORK_ORDER_NUMBER: TStringField
      DisplayLabel = #20316#19994#21333
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object ADOD410MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOD410MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ADOD410PRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#31867#22411
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADOD410STEP: TIntegerField
      DisplayLabel = #27493#39588#21495
      FieldName = 'STEP'
    end
    object ADOD410QTY: TIntegerField
      DisplayLabel = #20135#20986#25968#37327
      FieldName = 'QTY'
    end
    object ADOD410WTYPE: TStringField
      DisplayLabel = #29983#20135#31867#22411
      FieldName = 'WTYPE'
      ReadOnly = True
      Size = 4
    end
    object ADOD410sq_total: TFloatField
      DisplayLabel = #38754#31215
      FieldName = 'sq_total'
      ReadOnly = True
    end
    object ADOD410matl_total: TFloatField
      DisplayLabel = #19968#31867#26448#26009#25104#26412
      FieldName = 'matl_total'
      ReadOnly = True
    end
    object ADOD410ovhd_total: TFloatField
      DisplayLabel = #21046#36896#36153#29992
      FieldName = 'ovhd_total'
      ReadOnly = True
    end
    object ADOD410ovhd1_total: TFloatField
      DisplayLabel = #30452#25509#20154#24037
      FieldName = 'ovhd1_total'
      ReadOnly = True
    end
    object ADOD410outsource_total: TFloatField
      DisplayLabel = #20108#31867#26448#26009
      FieldName = 'outsource_total'
      ReadOnly = True
    end
  end
end
