object DM: TDM
  OldCreateOrder = False
  Left = 666
  Top = 268
  Height = 328
  Width = 312
  object ADOConn: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 96
  end
  object ADOEmployee_Train: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT T.Rkey,T.employeeid,M.employeecode,M.chinesename,M.onduty' +
      'time,M.departmentname,T.Train_NO,T.Train_topics,'#13#10'       T.start' +
      'date,T.starttime,T.enddate,T.endtime,T.Train_time,T.Teacher,T.Tr' +
      'ain_place,T.Train_grade,T.ptr_flag,'#13#10'       T.Train_result,T.Tra' +
      'in_content,case T.Train_status when 0 then '#39#26410#23436#25104#39' when 1 then '#39#24050#23436 +
      #25104#39' end AS Train_status,'#13#10'       dbo.datadetail.Rkey as detailRke' +
      'y,dbo.datadetail.item,T.train_feels,T.effective_date,T.feels_pay' +
      'ed,T.oprator_ptr,T.oprate_time ,T.employeecode as ecode'#13#10'FROM   ' +
      'Employee_Train AS T INNER JOIN v_employeemsg AS M'#13#10'       ON T.e' +
      'mployeeid=M.rkey left join'#13#10'       dbo.datadetail on T.type_ptr=' +
      'dbo.datadetail.Rkey'#13#10'WHERE  '#13#10'T.startdate between :dtpk1 and :dt' +
      'pk2 and '#13#10'T.Train_status<>:V1 and T.Train_status<>:V2'#13#10'order by ' +
      'T.oprate_time desc'
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'V1'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'V2'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 128
    Top = 16
    object ADOEmployee_TrainRkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object ADOEmployee_Trainemployeeid: TIntegerField
      FieldName = 'employeeid'
    end
    object ADOEmployee_Trainemployeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object ADOEmployee_Trainchinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object ADOEmployee_Trainondutytime: TDateTimeField
      FieldName = 'ondutytime'
      DisplayFormat = 'yyyy-MM-dd'
    end
    object ADOEmployee_Traindepartmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object ADOEmployee_TrainTrain_NO: TStringField
      FieldName = 'Train_NO'
      Size = 50
    end
    object ADOEmployee_TrainTrain_topics: TWideStringField
      FieldName = 'Train_topics'
      Size = 50
    end
    object ADOEmployee_Trainstartdate: TDateTimeField
      FieldName = 'startdate'
      DisplayFormat = 'yyyy-MM-dd'
    end
    object ADOEmployee_Trainstarttime: TStringField
      FieldName = 'starttime'
      Size = 10
    end
    object ADOEmployee_Trainenddate: TDateTimeField
      FieldName = 'enddate'
      DisplayFormat = 'yyyy-MM-dd'
    end
    object ADOEmployee_Trainendtime: TStringField
      FieldName = 'endtime'
    end
    object ADOEmployee_TrainTrain_time: TFloatField
      FieldName = 'Train_time'
    end
    object ADOEmployee_TrainTeacher: TWideStringField
      FieldName = 'Teacher'
    end
    object ADOEmployee_TrainTrain_place: TWideStringField
      FieldName = 'Train_place'
    end
    object ADOEmployee_TrainTrain_grade: TWideStringField
      FieldName = 'Train_grade'
    end
    object ADOEmployee_TrainTrain_result: TWideStringField
      FieldName = 'Train_result'
    end
    object ADOEmployee_TrainTrain_content: TWideStringField
      FieldName = 'Train_content'
      Size = 200
    end
    object ADOEmployee_TrainTrain_status: TStringField
      FieldName = 'Train_status'
      ReadOnly = True
      Size = 6
    end
    object ADOEmployee_TraindetailRkey: TAutoIncField
      FieldName = 'detailRkey'
      ReadOnly = True
    end
    object ADOEmployee_TrainType_ptr: TWideStringField
      FieldName = 'item'
    end
    object ADOEmployee_Traintrain_feels: TBCDField
      FieldName = 'train_feels'
      Precision = 19
    end
    object ADOEmployee_Traineffective_date: TDateTimeField
      FieldName = 'effective_date'
      DisplayFormat = 'yyyy-MM-dd'
    end
    object ADOEmployee_Trainfeels_payed: TBooleanField
      FieldName = 'feels_payed'
      OnGetText = ADOEmployee_Trainfeels_payedGetText
    end
    object ADOEmployee_Trainptr_flag: TBooleanField
      FieldName = 'ptr_flag'
      OnGetText = ADOEmployee_Trainptr_flagGetText
    end
    object ADOEmployee_Trainoprator_ptr: TIntegerField
      FieldName = 'oprator_ptr'
      OnGetText = ADOEmployee_Trainoprator_ptrGetText
    end
    object ADOEmployee_Trainoprate_time: TDateTimeField
      FieldName = 'oprate_time'
      DisplayFormat = 'yyyy-MM-dd'
    end
    object ADOEmployee_Trainecode: TWideStringField
      FieldName = 'ecode'
      Size = 50
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOEmployee_Train
    Left = 224
    Top = 16
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConn
    Parameters = <>
    Left = 128
    Top = 160
  end
  object ADOEmployee_Train_1: TADODataSet
    Connection = ADOConn
    CommandText = 
      'SELECT rkey,employeeid,Train_NO,Train_topics,startdate,starttime' +
      ',enddate,endtime,'#13#10'       Train_time,Teacher,Train_place,Train_g' +
      'rade,Train_result,Train_content,Train_status'#13#10'FROM   Employee_Tr' +
      'ain'
    Parameters = <>
    Left = 128
    Top = 88
  end
end
