object DM: TDM
  OldCreateOrder = False
  Left = 412
  Top = 240
  Height = 359
  Width = 313
  object ADOConn: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 44
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 228
    Top = 16
  end
  object ADODataSet1: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT  employeemsg.employeecode,employeemsg.chinesename,'#13#10' data' +
      'department.departmentname,datadetail.item,employeemsg.ondutytime' +
      ','#13#10'        employeemsg.outdutytime'#13#10'from employeemsg '#13#10'inner joi' +
      'n datadepartment ON employeemsg.departmentid=datadepartment.rkey' +
      ' '#13#10'inner join datadetail on employeemsg.position=datadetail.rkey' +
      #13#10'WHERE datadepartment.rkey in (select departmentid from hr_perm' +
      'ission where operator_ptr = :rkey73 '#13#10'and program_ptr=(select rk' +
      'ey from data0419 where programe ='#39'AttendanceReport.exe'#39'))'
    Parameters = <
      item
        Name = 'rkey73'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    Left = 144
    Top = 16
    object ADODataSet1employeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object ADODataSet1chinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object ADODataSet1departmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object ADODataSet1item: TWideStringField
      FieldName = 'item'
    end
    object ADODataSet1ondutytime: TDateTimeField
      FieldName = 'ondutytime'
    end
    object ADODataSet1outdutytime: TDateTimeField
      FieldName = 'outdutytime'
    end
  end
  object DataSource2: TDataSource
    DataSet = ADODataSet2
    Left = 224
    Top = 144
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConn
    Parameters = <>
    Left = 144
    Top = 80
  end
  object ADODataSet2: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    CommandText = 
      'select * from v_onoffduty_report where CheckDate between :startD' +
      'ate and :endDate'
    Parameters = <
      item
        Name = 'startDate'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'endDate'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    Left = 144
    Top = 144
    object ADODataSet2flag: TStringField
      FieldName = 'flag'
      ReadOnly = True
      Size = 2
    end
    object ADODataSet2dy: TIntegerField
      FieldName = 'dy'
      ReadOnly = True
    end
    object ADODataSet2DSDesigner: TIntegerField
      FieldName = #24180
      ReadOnly = True
    end
    object ADODataSet2DSDesigner2: TIntegerField
      FieldName = #26376
      ReadOnly = True
    end
    object ADODataSet2DSDesigner3: TIntegerField
      FieldName = #26085
      ReadOnly = True
    end
    object ADODataSet2ChineseName: TWideStringField
      FieldName = 'ChineseName'
    end
    object ADODataSet2employeeid: TIntegerField
      FieldName = 'employeeid'
    end
    object ADODataSet2out1: TWideStringField
      FieldName = 'out1'
      ReadOnly = True
      Size = 5
    end
    object ADODataSet2in1: TWideStringField
      FieldName = 'in1'
      ReadOnly = True
      Size = 5
    end
    object ADODataSet2in2: TWideStringField
      FieldName = 'in2'
      ReadOnly = True
      Size = 5
    end
    object ADODataSet2out2: TWideStringField
      FieldName = 'out2'
      ReadOnly = True
      Size = 5
    end
    object ADODataSet2in3: TWideStringField
      FieldName = 'in3'
      ReadOnly = True
      Size = 5
    end
    object ADODataSet2out3: TWideStringField
      FieldName = 'out3'
      ReadOnly = True
      Size = 5
    end
    object ADODataSet2in4: TWideStringField
      FieldName = 'in4'
      ReadOnly = True
      Size = 5
    end
    object ADODataSet2out4: TWideStringField
      FieldName = 'out4'
      ReadOnly = True
      Size = 5
    end
    object ADODataSet2DepartmentName: TWideStringField
      FieldName = 'DepartmentName'
    end
    object ADODataSet2EmployeeCode: TWideStringField
      FieldName = 'EmployeeCode'
    end
    object ADODataSet2outdutytime: TDateTimeField
      FieldName = 'outdutytime'
      ReadOnly = True
    end
    object ADODataSet2position_item: TWideStringField
      DisplayLabel = #32844#21153
      FieldName = 'position_item'
      ReadOnly = True
    end
    object ADODataSet2ClassName: TWideStringField
      FieldName = 'ClassName'
    end
    object ADODataSet2CheckDate: TDateTimeField
      FieldName = 'CheckDate'
    end
    object ADODataSet2SumCN: TFloatField
      FieldName = 'SumCN'
    end
    object ADODataSet2SumCT: TFloatField
      FieldName = 'SumCT'
    end
    object ADODataSet2SumZN: TFloatField
      FieldName = 'SumZN'
    end
    object ADODataSet2SumZT: TFloatField
      FieldName = 'SumZT'
    end
    object ADODataSet2SumKN: TFloatField
      FieldName = 'SumKN'
    end
    object ADODataSet2sumkt: TFloatField
      FieldName = 'sumkt'
      ReadOnly = True
    end
    object ADODataSet2SumWN: TFloatField
      FieldName = 'SumWN'
    end
    object ADODataSet2SumWT: TFloatField
      FieldName = 'SumWT'
    end
    object ADODataSet2SumJN: TFloatField
      FieldName = 'SumJN'
    end
    object ADODataSet2SumJT: TFloatField
      FieldName = 'SumJT'
    end
    object ADODataSet2SumEN: TFloatField
      FieldName = 'SumEN'
    end
    object ADODataSet2SumET: TFloatField
      FieldName = 'SumET'
    end
    object ADODataSet2SumLN: TFloatField
      FieldName = 'SumLN'
    end
    object ADODataSet2SumLT: TFloatField
      FieldName = 'SumLT'
      ReadOnly = True
    end
    object ADODataSet2YTnote: TWideStringField
      FieldName = 'YTnote'
      Size = 50
    end
    object ADODataSet2ClassGroupID: TIntegerField
      FieldName = 'ClassGroupID'
    end
    object ADODataSet2RestType: TIntegerField
      FieldName = 'RestType'
    end
    object ADODataSet2OWT: TFloatField
      FieldName = 'OWT'
    end
    object ADODataSet2SWT: TFloatField
      FieldName = 'SWT'
    end
    object ADODataSet2NCN: TIntegerField
      FieldName = 'NCN'
    end
    object ADODataSet2RWT: TFloatField
      FieldName = 'RWT'
      ReadOnly = True
    end
    object ADODataSet2ROT: TFloatField
      FieldName = 'ROT'
      ReadOnly = True
    end
    object ADODataSet2RWTROT: TFloatField
      FieldName = 'RWTROT'
      ReadOnly = True
    end
    object ADODataSet2work1: TFloatField
      FieldName = 'work1'
      ReadOnly = True
    end
    object ADODataSet2work2: TFloatField
      FieldName = 'work2'
      ReadOnly = True
    end
    object ADODataSet2work3: TFloatField
      FieldName = 'work3'
      ReadOnly = True
    end
    object ADODataSet2work4: TFloatField
      FieldName = 'work4'
      ReadOnly = True
    end
    object ADODataSet2work10: TFloatField
      FieldName = 'work10'
      ReadOnly = True
    end
    object ADODataSet2restday: TFloatField
      FieldName = 'restday'
      ReadOnly = True
    end
    object ADODataSet2workday: TFloatField
      FieldName = 'workday'
      ReadOnly = True
    end
    object ADODataSet2qj: TIntegerField
      FieldName = 'qj'
    end
  end
end
