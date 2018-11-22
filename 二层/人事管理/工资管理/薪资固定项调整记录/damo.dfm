object DM: TDM
  OldCreateOrder = False
  Left = 419
  Top = 318
  Height = 338
  Width = 487
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 
      'C:\Program Files\Common Files\System\Ole DB\Data Links\'#19996#33694'_172.18' +
      '.0.8.udl'
    Left = 56
    Top = 40
  end
  object qrySalaryJL: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'user'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @TempTable table(IsSelected bit)      '
      '  insert @TempTable'
      '  values (0)'
      ''
      
        'SELECT  IsSelected,    dbo.basicsalary_Alteration.rkey,  dbo.bas' +
        'icsalary_Alteration.accountid, '
      
        '       (select accountName from salaryaccount where rkey= dbo.ba' +
        'sicsalary_Alteration.accountid) as accountName,'
      
        '       dbo.basicsalary_Alteration.employeeid, dbo.basicsalary_Al' +
        'teration.itemname, dbo.basicsalary_Alteration.datafield, '
      
        '       dbo.basicsalary_Alteration.originaldata, dbo.basicsalary_' +
        'Alteration.newdata, dbo.basicsalary_Alteration.effect_date, '
      
        '       case  when dbo.basicsalary_Alteration.effect_flag = 0 the' +
        'n '#39#21542#39' else '#39#26159#39' end effect_flag,'
      
        '       dbo.basicsalary_Alteration.operator, dbo.basicsalary_Alte' +
        'ration.operate_date, '
      
        '       dbo.employeemsg.rkey AS Emp_rkey, dbo.employeemsg.employe' +
        'ecode, dbo.employeemsg.chinesename, '
      '       dbo.datadepartment.departmentname, '
      '       dbo.Data0005.EMPLOYEE_NAME,'
      
        '       case when employeemsg.status=1 then '#39#26159#39' else '#39#21542#39' end stat' +
        'usName, employeemsg.status,'
      
        '       basicsalary_Alteration.remark, employee_train_flag, Pitem' +
        '.train_flag, Pitem.item as Pitem,'
      
        '       Ritem.item, Employee_Train.Train_NO, Employee_Train.rkey ' +
        'as TrainRkey'
      'FROM   dbo.basicsalary_Alteration INNER JOIN'
      
        '       dbo.employeemsg ON dbo.basicsalary_Alteration.employeeid ' +
        '= dbo.employeemsg.rkey INNER JOIN'
      
        '       dbo.datadepartment ON dbo.employeemsg.departmentid = dbo.' +
        'datadepartment.rkey LEFT JOIN'
      
        '       dbo.datadetail as Ritem ON dbo.basicsalary_Alteration.alt' +
        'er_reason = Ritem.rkey LEFT JOIN'
      
        #9'   dbo.datadetail as Pitem ON dbo.employeemsg.position = Pitem.' +
        'rkey LEFT JOIN'
      
        '       Employee_Train ON dbo.basicsalary_Alteration.employee_tra' +
        'in_ptr = dbo.Employee_Train.rkey INNER JOIN'
      
        '       dbo.Data0005 ON dbo.basicsalary_Alteration.operator = dbo' +
        '.Data0005.RKEY'
      'INNER JOIN'
      
        #9'      (select distinct departmentid from hr_permission where pr' +
        'ogram_ptr = (select rkey from data0419 where programe = '#39'SalaryJ' +
        'L.exe'#39' )'
      
        #9'     and  operator_ptr=:user ) as depart on employeemsg.departm' +
        'entid=depart.departmentid'
      ' join @TempTable c on 1=1'
      'WHERE (1=1) ')
    Left = 143
    Top = 40
    object qrySalaryJLrkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object qrySalaryJLaccountid: TIntegerField
      FieldName = 'accountid'
    end
    object qrySalaryJLaccountName: TWideStringField
      FieldName = 'accountName'
      ReadOnly = True
      Size = 50
    end
    object qrySalaryJLemployeeid: TIntegerField
      FieldName = 'employeeid'
    end
    object qrySalaryJLitemname: TWideStringField
      FieldName = 'itemname'
      Size = 50
    end
    object qrySalaryJLdatafield: TWideStringField
      FieldName = 'datafield'
      FixedChar = True
      Size = 10
    end
    object qrySalaryJLoriginaldata: TFloatField
      FieldName = 'originaldata'
    end
    object qrySalaryJLnewdata: TFloatField
      FieldName = 'newdata'
    end
    object qrySalaryJLeffect_date: TDateTimeField
      FieldName = 'effect_date'
    end
    object qrySalaryJLeffect_flag: TStringField
      FieldName = 'effect_flag'
      ReadOnly = True
      Size = 2
    end
    object qrySalaryJLoperator: TIntegerField
      FieldName = 'operator'
    end
    object qrySalaryJLoperate_date: TDateTimeField
      FieldName = 'operate_date'
    end
    object qrySalaryJLEmp_rkey: TIntegerField
      FieldName = 'Emp_rkey'
      ReadOnly = True
    end
    object qrySalaryJLemployeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object qrySalaryJLchinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object qrySalaryJLdepartmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object qrySalaryJLEMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object qrySalaryJLstatusName: TStringField
      FieldName = 'statusName'
      ReadOnly = True
      Size = 2
    end
    object qrySalaryJLstatus: TWordField
      FieldName = 'status'
    end
    object qrySalaryJLremark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
    object qrySalaryJLemployee_train_flag: TBooleanField
      FieldName = 'employee_train_flag'
    end
    object qrySalaryJLtrain_flag: TBooleanField
      FieldName = 'train_flag'
    end
    object qrySalaryJLPitem: TWideStringField
      FieldName = 'Pitem'
    end
    object qrySalaryJLitem: TWideStringField
      FieldName = 'item'
    end
    object qrySalaryJLTrain_NO: TStringField
      FieldName = 'Train_NO'
      Size = 50
    end
    object qrySalaryJLTrainRkey: TIntegerField
      FieldName = 'TrainRkey'
      ReadOnly = True
    end
    object qrySalaryJLIsSelected: TBooleanField
      FieldName = 'IsSelected'
    end
  end
  object ds1: TDataSource
    DataSet = qrySalaryJL
    Left = 212
    Top = 40
  end
  object qrytemp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 148
    Top = 216
  end
  object sp1: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'Get_wagetype'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@employeeid'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@yearmonth'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 10
        Value = Null
      end
      item
        Name = '@wagetype'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 216
    Top = 216
  end
  object ds2: TDataSource
    DataSet = qry2
    Left = 212
    Top = 104
  end
  object qry2: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      
        'select employeemsg.rkey, employeemsg.employeecode, employeemsg.c' +
        'hinesename,'
      
        'datadepartment.departmentname, datadetail.item, salaryaccount.ac' +
        'countName'
      'from employeemsg '
      
        'inner join datadepartment on employeemsg.departmentid=datadepart' +
        'ment.rkey'
      'inner join datadetail on employeemsg.position=datadetail.rkey'
      
        'inner join salaryaccount on employeemsg.wagetype=salaryaccount.r' +
        'key'
      'where status=1')
    Left = 144
    Top = 104
    object qry2rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object qry2employeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object qry2chinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object qry2departmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object qry2item: TWideStringField
      FieldName = 'item'
    end
    object qry2accountName: TWideStringField
      FieldName = 'accountName'
      Size = 50
    end
  end
  object qry3: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'EmpRkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select itemname, datafield,employeemsg.rkey from dbo.DesignSalar' +
        'yItem inner join employeemsg'
      
        'on employeemsg.wagetype=DesignSalaryItem.accountid where datasou' +
        'rcetype=2 '
      'and employeemsg.rkey=:EmpRkey')
    Left = 146
    Top = 160
    object qry3itemname: TWideStringField
      FieldName = 'itemname'
      Size = 50
    end
    object qry3datafield: TWideStringField
      FieldName = 'datafield'
      Size = 10
    end
    object qry3rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
  end
  object ds3: TDataSource
    DataSet = qry3
    Left = 214
    Top = 160
  end
  object qrychosieEmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'accountrkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select employeemsg.rkey, employeemsg.employeecode, employeemsg.c' +
        'hinesename,datadepartment.departmentname,employeemsg.ondutytime,'
      'datadetail.item,datadetail.train_flag'
      'from employeemsg '
      
        'inner join datadepartment on employeemsg.departmentid=datadepart' +
        'ment.rkey'
      'left join datadetail on employeemsg.position=datadetail.rkey'
      'where employeemsg.status=1 '
      'and wagetype=:accountrkey')
    Left = 337
    Top = 42
  end
  object dschoiseEmp: TDataSource
    DataSet = qrychosieEmp
    Left = 420
    Top = 41
  end
  object qryTrain: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'emprkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select Employee_Train.rkey, employeemsg.employeecode, employeems' +
        'g.chinesename,datadepartment.departmentname,'
      
        'Employee_Train.Train_No, Employee_Train.Train_topics,datadetail.' +
        'item'
      'from employeemsg '
      
        'inner join datadepartment on employeemsg.departmentid=datadepart' +
        'ment.rkey'
      
        'left outer join Employee_Train on employeemsg.rkey=Employee_Trai' +
        'n.employeeid'
      
        'left outer join datadetail on Employee_Train.type_ptr=datadetail' +
        '.rkey'
      'where Employee_Train.employeeid=:emprkey'
      'and Employee_Train.ptr_flag=0'
      'and (datadetail.item like '#39'%'#35843#34218'%'#39' or datadetail.item like '#39'%'#26187#21319'%'#39')')
    Left = 337
    Top = 106
    object qryTrainrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object qryTrainemployeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object qryTrainchinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object qryTraindepartmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object qryTrainTrain_No: TStringField
      FieldName = 'Train_No'
      Size = 50
    end
    object qryTrainTrain_topics: TWideStringField
      FieldName = 'Train_topics'
      Size = 50
    end
    object qryTrainitem: TWideStringField
      FieldName = 'item'
      Size = 10
    end
  end
  object dsTrain: TDataSource
    DataSet = qryTrain
    Left = 420
    Top = 105
  end
  object qryDetail: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from datadetail where dictid=21')
    Left = 337
    Top = 170
    object qryDetailrkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object qryDetaildictid: TIntegerField
      FieldName = 'dictid'
    end
    object qryDetailitem: TWideStringField
      FieldName = 'item'
    end
    object qryDetailMemo: TWideStringField
      FieldName = 'Memo'
      Size = 200
    end
  end
  object dsDetail: TDataSource
    DataSet = qryDetail
    Left = 420
    Top = 169
  end
  object qryTrainTemp: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'rkey'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select  * from basicsalary_Alteration '
      'where rkey = :rkey')
    Left = 57
    Top = 106
    object qryTrainTemprkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object qryTrainTempemployeeid: TIntegerField
      FieldName = 'employeeid'
    end
    object qryTrainTempaccountid: TIntegerField
      FieldName = 'accountid'
    end
    object qryTrainTempitemname: TWideStringField
      FieldName = 'itemname'
      Size = 50
    end
    object qryTrainTempdatafield: TWideStringField
      FieldName = 'datafield'
      FixedChar = True
      Size = 10
    end
    object qryTrainTemporiginaldata: TFloatField
      FieldName = 'originaldata'
    end
    object qryTrainTempnewdata: TFloatField
      FieldName = 'newdata'
    end
    object qryTrainTempeffect_date: TDateTimeField
      FieldName = 'effect_date'
    end
    object qryTrainTempeffect_flag: TBooleanField
      FieldName = 'effect_flag'
    end
    object qryTrainTempoperator: TIntegerField
      FieldName = 'operator'
    end
    object qryTrainTempoperate_date: TDateTimeField
      FieldName = 'operate_date'
    end
    object qryTrainTempremark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
    object qryTrainTempemployee_train_ptr: TIntegerField
      FieldName = 'employee_train_ptr'
    end
    object qryTrainTempemployee_train_flag: TBooleanField
      FieldName = 'employee_train_flag'
    end
    object qryTrainTempalter_reason: TIntegerField
      FieldName = 'alter_reason'
    end
  end
end
