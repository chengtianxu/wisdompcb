object dm: Tdm
  OldCreateOrder = False
  Left = 272
  Top = 158
  Height = 300
  Width = 250
  object ADOConnection1: TADOConnection
    ConnectionString = 'FILE NAME=D:\vss_work\172.18.12.2.udl'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 8
  end
  object ADOQ451: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
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
      'data0451.END_DATE'
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
  end
  object ADOD424: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select data0034.dept_code,data0034.dept_name,data0424.*,data0015' +
      '.abbr_name'#13#10'from data0424 inner join data0034'#13#10' on data0424.dept' +
      '_ptr=data0034.rkey inner join data0015 on data0424.warehouse_ptr' +
      '=data0015.rkey'#13#10'where'#13#10'  data0424.d0451_ptr=:vptr'#13#10'ORDER by data' +
      '0034.dept_code'
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
      DisplayLabel = #20135#20986#38754#31215
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
      'SELECT '
      'CP_REV,'
      'CUSTOMER_PART_NUMBER,'
      'customer_part_desc,'
      'CUSTPART_ENT_DATE'
      'from data0050'
      'where'
      '(audited_by_ptr>0) and'
      '(cost_appr_by is null)and'
      '(custpart_ent_date > :date1) and'
      '(custpart_ent_date <= :date2)')
    Left = 132
    Top = 64
    object ADOQ50CP_REV: TStringField
      DisplayLabel = #29256#26412
      FieldName = 'CP_REV'
      FixedChar = True
      Size = 5
    end
    object ADOQ50CUSTOMER_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'CUSTOMER_PART_NUMBER'
    end
    object ADOQ50CUSTPART_ENT_DATE: TDateTimeField
      DisplayLabel = #24314#26723#26085#26399
      FieldName = 'CUSTPART_ENT_DATE'
    end
    object ADOQ50customer_part_desc: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'customer_part_desc'
      Size = 40
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
end
