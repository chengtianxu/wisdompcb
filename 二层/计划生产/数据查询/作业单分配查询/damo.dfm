object dm: Tdm
  OldCreateOrder = True
  Left = 500
  Top = 316
  Height = 260
  Width = 321
  object ds489: TDataSource
    DataSet = ads489
    Left = 56
    Top = 48
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
  end
  object ads489: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT D06.work_order_number AS out_wo,D25.manu_part_number AS o' +
      'ut_no,D06.quan_sch,'#13#10'CASE D06.wipmat_status WHEN 0 THEN '#39#24453#20998#37197#39' EL' +
      'SE '#39#24050#20998#37197#39' END AS mat_status,'#13#10'D489.qty,D05.employee_name,D489.tda' +
      'te,D06_1.work_order_number AS inner_wo,'#13#10'D25_1.manu_part_number ' +
      'AS inner_no,D25_1.qty_bom,d489.rkey,d489.wo_ptr,d489.SOURCE_PTR'#13 +
      #10'FROM data0489 d489 INNER JOIN data0006 d06 ON d489.wo_ptr=d06.r' +
      'key '#13#10'INNER JOIN data0025 d25 ON d06.bom_ptr=d25.rkey'#13#10'INNER JOI' +
      'N data0006 d06_1 ON d489.source_ptr=d06_1.rkey'#13#10'INNER JOIN data0' +
      '025 d25_1 ON d489.bom_ptr=d25_1.rkey'#13#10'LEFT JOIN data0005 d05 ON ' +
      'd489.user_ptr=d05.rkey'#13#10'WHERE d489.ttype=2 and d489.tdate>=:dt1 ' +
      'and d489.tdate<=:dt2'#13#10
    IndexFieldNames = 'out_wo'
    Parameters = <
      item
        Name = 'dt1'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'dt2'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    Left = 16
    Top = 48
  end
  object aqtmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 16
    Top = 96
  end
  object adsIN: TADODataSet
    Connection = ADOConnection1
    Parameters = <>
    Left = 208
    Top = 72
  end
  object dsIN: TDataSource
    DataSet = adsIN
    Left = 256
    Top = 72
  end
end
