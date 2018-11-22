object DM: TDM
  OldCreateOrder = False
  Left = 670
  Top = 339
  Height = 318
  Width = 377
  object ADOConn: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 96
  end
  object ADOAskLeaveRegister: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT AskLeaveRegister.rkey,AskLeaveRegister.employeeid,employe' +
      'emsg.employeecode,employeemsg.chinesename,AskLeaveRegister.leave' +
      'type,AskForLeave.LeaveType as leavetype1,'#13#10'       AskLeaveRegist' +
      'er.startdate,AskLeaveRegister.starttime,AskLeaveRegister.enddate' +
      ',AskLeaveRegister.endtime,'#13#10'       AskLeaveRegister.registerman,' +
      'Data0005.employee_name AS registerman1,AskLeaveRegister.makedate' +
      ','#13#10'       AskLeaveRegister.CurStatus,case AskLeaveRegister.CurSt' +
      'atus when 0 then '#39#21542#39' when 1 then '#39#26159#39' end as CurStatus1, '#13#10'      ' +
      ' AskLeaveRegister.leavereason, AskLeaveRegister.remark,employeem' +
      'sg.departmentname'#13#10'FROM   AskLeaveRegister INNER JOIN'#13#10'       As' +
      'kForLeave ON AskLeaveRegister.leavetype = AskForLeave.rkey INNER' +
      ' JOIN'#13#10'       v_employeemsg employeemsg ON AskLeaveRegister.empl' +
      'oyeeid = employeemsg.rkey INNER JOIN'#13#10'       Data0005    ON AskL' +
      'eaveRegister.RegisterMan = Data0005.rkey'#13#10'where 1=1'
    IndexFieldNames = 'makedate'
    Parameters = <>
    Left = 144
    Top = 16
    object ADOAskLeaveRegisterrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOAskLeaveRegisteremployeeid: TIntegerField
      FieldName = 'employeeid'
    end
    object ADOAskLeaveRegisteremployeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object ADOAskLeaveRegisterchinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object ADOAskLeaveRegisterleavetype: TIntegerField
      FieldName = 'leavetype'
    end
    object ADOAskLeaveRegisterleavetype1: TWideStringField
      FieldName = 'leavetype1'
      Size = 50
    end
    object ADOAskLeaveRegisterstartdate: TDateTimeField
      FieldName = 'startdate'
    end
    object ADOAskLeaveRegisterstarttime: TDateTimeField
      FieldName = 'starttime'
    end
    object ADOAskLeaveRegisterenddate: TDateTimeField
      FieldName = 'enddate'
    end
    object ADOAskLeaveRegisterendtime: TDateTimeField
      FieldName = 'endtime'
    end
    object ADOAskLeaveRegisterregisterman: TIntegerField
      FieldName = 'registerman'
    end
    object ADOAskLeaveRegisterregisterman1: TStringField
      FieldName = 'registerman1'
      Size = 16
    end
    object ADOAskLeaveRegistermakedate: TDateTimeField
      FieldName = 'makedate'
    end
    object ADOAskLeaveRegisterCurStatus: TIntegerField
      FieldName = 'CurStatus'
    end
    object ADOAskLeaveRegisterCurStatus1: TStringField
      FieldName = 'CurStatus1'
      ReadOnly = True
      Size = 2
    end
    object ADOAskLeaveRegisterleavereason: TWideStringField
      FieldName = 'leavereason'
      Size = 50
    end
    object ADOAskLeaveRegisterremark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
    object ADOAskLeaveRegisterdepartmentname: TWideStringField
      DisplayLabel = #37096#38376
      FieldName = 'departmentname'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOAskLeaveRegister
    Left = 256
    Top = 16
  end
  object ADOAskForLeave: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    CommandText = 
      'select rkey,leavetype from askforleave where leavetype like '#39'%'#39'+' +
      ':leavetype+'#39'%'#39' order by rkey'
    Parameters = <
      item
        Name = 'leavetype+'#39'%'#39
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end>
    Left = 144
    Top = 128
    object ADOAskForLeaverkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOAskForLeaveleavetype: TWideStringField
      FieldName = 'leavetype'
      Size = 50
    end
  end
  object ADOemployeemsg: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select rkey,employeecode,chinesename from employeemsg where empl' +
      'oyeecode like '#39'%'#39'+:employeecode +'#39'%'#39'  and [status]=1'
    Parameters = <
      item
        Name = 'employeecode'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end>
    Left = 144
    Top = 72
    object ADOemployeemsgrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOemployeemsgemployeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object ADOemployeemsgchinesename: TWideStringField
      FieldName = 'chinesename'
    end
  end
  object DataSource2: TDataSource
    DataSet = ADOemployeemsg
    Left = 256
    Top = 72
  end
  object DataSource3: TDataSource
    DataSet = ADOAskForLeave
    Left = 256
    Top = 128
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     rkey, employeeid, leavetype, startdate, starttime, en' +
        'ddate, endtime, RegisterMan, leavereason, remark, makedate, CurS' +
        'tatus'
      'FROM         AskLeaveRegister where rkey=:rkey')
    Left = 144
    Top = 184
    object ADOQuery1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery1employeeid: TIntegerField
      FieldName = 'employeeid'
    end
    object ADOQuery1leavetype: TIntegerField
      FieldName = 'leavetype'
    end
    object ADOQuery1startdate: TDateTimeField
      FieldName = 'startdate'
    end
    object ADOQuery1starttime: TDateTimeField
      FieldName = 'starttime'
    end
    object ADOQuery1enddate: TDateTimeField
      FieldName = 'enddate'
    end
    object ADOQuery1endtime: TDateTimeField
      FieldName = 'endtime'
    end
    object ADOQuery1RegisterMan: TIntegerField
      FieldName = 'RegisterMan'
    end
    object ADOQuery1leavereason: TWideStringField
      FieldName = 'leavereason'
      Size = 50
    end
    object ADOQuery1remark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
    object ADOQuery1makedate: TDateTimeField
      FieldName = 'makedate'
    end
    object ADOQuery1CurStatus: TIntegerField
      FieldName = 'CurStatus'
    end
  end
  object ADO0073: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select employee_ptr from Data0073 where rkey=:rkey')
    Left = 144
    Top = 240
    object ADO0073employee_ptr: TIntegerField
      FieldName = 'employee_ptr'
    end
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConn
    Parameters = <>
    Left = 232
    Top = 192
  end
end
