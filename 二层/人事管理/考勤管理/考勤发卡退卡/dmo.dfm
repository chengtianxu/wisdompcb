object DM: TDM
  OldCreateOrder = False
  Left = 840
  Top = 203
  Height = 366
  Width = 323
  object ADOEmployeecardMsg: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT employeemsg.employeecode,employeemsg.chinesename,employee' +
      'msg.Cardno,employeemsg.status AS Estatus,employeecardMsg.rkey,'#13#10 +
      '       employeecardMsg.cardno_dec,employeecardMsg.cardno_dex,emp' +
      'loyeecardMsg.employeeid,employeecardMsg.begin_time, '#13#10'       emp' +
      'loyeecardMsg.end_time,employeecardMsg.oper_person,employeecardMs' +
      'g.oper_date, Data0005.employee_name AS oper_name,'#13#10'       employ' +
      'eecardMsg.status,Case employeecardMsg.status when 1 then '#39#26377#25928#39' wh' +
      'en 2 then '#39#25346#22833#39' when 3 then '#39#36864#21345#39' when 4 then '#39#25439#22351#39' end AS Cstatus'#13 +
      #10'FROM   employeecardMsg INNER JOIN'#13#10'       employeemsg ON employ' +
      'eemsg.rkey = employeecardMsg.employeeid INNER JOIN'#13#10'       Data0' +
      '005    ON employeecardMsg.oper_person = Data0005.rkey'#13#10'WHERE  1 ' +
      '= 1'
    Parameters = <>
    Left = 136
    Top = 64
    object ADOEmployeecardMsgemployeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object ADOEmployeecardMsgchinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object ADOEmployeecardMsgCardno: TStringField
      FieldName = 'Cardno'
    end
    object ADOEmployeecardMsgEstatus: TWordField
      FieldName = 'Estatus'
    end
    object ADOEmployeecardMsgrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOEmployeecardMsgcardno_dec: TStringField
      FieldName = 'cardno_dec'
    end
    object ADOEmployeecardMsgcardno_dex: TStringField
      FieldName = 'cardno_dex'
    end
    object ADOEmployeecardMsgemployeeid: TIntegerField
      FieldName = 'employeeid'
    end
    object ADOEmployeecardMsgbegin_time: TDateTimeField
      FieldName = 'begin_time'
    end
    object ADOEmployeecardMsgend_time: TDateTimeField
      FieldName = 'end_time'
    end
    object ADOEmployeecardMsgoper_person: TIntegerField
      FieldName = 'oper_person'
    end
    object ADOEmployeecardMsgoper_date: TDateTimeField
      FieldName = 'oper_date'
    end
    object ADOEmployeecardMsgoper_name: TStringField
      FieldName = 'oper_name'
      Size = 16
    end
    object ADOEmployeecardMsgstatus: TIntegerField
      FieldName = 'status'
    end
    object ADOEmployeecardMsgCstatus: TStringField
      FieldName = 'Cstatus'
      ReadOnly = True
      Size = 6
    end
  end
  object ADOEmployeeMsg: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    CommandText = 'select * from employeemsg where 1=1'
    Parameters = <>
    Left = 136
    Top = 8
    object ADOEmployeeMsgrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOEmployeeMsgchinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object ADOEmployeeMsgemployeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object ADOEmployeeMsgdepartmentid: TIntegerField
      FieldName = 'departmentid'
    end
    object ADOEmployeeMsgondutytime: TDateTimeField
      FieldName = 'ondutytime'
    end
    object ADOEmployeeMsgoutdutytime: TDateTimeField
      FieldName = 'outdutytime'
    end
    object ADOEmployeeMsgemploy_type: TIntegerField
      FieldName = 'employ_type'
    end
    object ADOEmployeeMsgPosition: TIntegerField
      FieldName = 'Position'
    end
    object ADOEmployeeMsgRank: TIntegerField
      FieldName = 'Rank'
    end
    object ADOEmployeeMsgPolitics_face: TIntegerField
      FieldName = 'Politics_face'
    end
    object ADOEmployeeMsgeducation: TIntegerField
      FieldName = 'education'
    end
    object ADOEmployeeMsgmarriage: TIntegerField
      FieldName = 'marriage'
    end
    object ADOEmployeeMsgsex: TIntegerField
      FieldName = 'sex'
    end
    object ADOEmployeeMsgaddr: TWideStringField
      FieldName = 'addr'
      Size = 50
    end
    object ADOEmployeeMsgprovince: TWideStringField
      FieldName = 'province'
    end
    object ADOEmployeeMsgIDCard: TWideStringField
      FieldName = 'IDCard'
    end
    object ADOEmployeeMsgCardno: TStringField
      FieldName = 'Cardno'
    end
    object ADOEmployeeMsgphone: TWideStringField
      FieldName = 'phone'
    end
    object ADOEmployeeMsgattendance: TIntegerField
      FieldName = 'attendance'
    end
    object ADOEmployeeMsgwagetype: TIntegerField
      FieldName = 'wagetype'
    end
    object ADOEmployeeMsgroomcode: TWideStringField
      FieldName = 'roomcode'
    end
    object ADOEmployeeMsgnation: TWideStringField
      FieldName = 'nation'
    end
    object ADOEmployeeMsgphoto: TBlobField
      FieldName = 'photo'
    end
    object ADOEmployeeMsgresume: TMemoField
      FieldName = 'resume'
      BlobType = ftMemo
    end
    object ADOEmployeeMsgothers_contacts: TWideStringField
      FieldName = 'others_contacts'
    end
    object ADOEmployeeMsgbirthday: TDateTimeField
      FieldName = 'birthday'
    end
    object ADOEmployeeMsgstatus: TWordField
      FieldName = 'status'
    end
    object ADOEmployeeMsgclassgroupid: TIntegerField
      FieldName = 'classgroupid'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOEmployeecardMsg
    Left = 232
    Top = 64
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConn
    Parameters = <>
    Left = 136
    Top = 120
  end
  object ADO73: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Param1'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select employee_ptr from Data0073 where rkey=:rkey')
    Left = 136
    Top = 176
    object ADO73employee_ptr: TIntegerField
      FieldName = 'employee_ptr'
    end
  end
  object ADOCard: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    CommandText = 
      'select top 1 * from employeecardmsg where cardno_dec=:cardno_dec' +
      ' order by begin_time desc'
    Parameters = <
      item
        Name = 'cardno_dec'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end>
    Left = 136
    Top = 232
    object ADOCardrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOCardcardno_dec: TStringField
      FieldName = 'cardno_dec'
    end
    object ADOCardcardno_dex: TStringField
      FieldName = 'cardno_dex'
    end
    object ADOCardemployeeid: TIntegerField
      FieldName = 'employeeid'
    end
    object ADOCardbegin_time: TDateTimeField
      FieldName = 'begin_time'
    end
    object ADOCardend_time: TDateTimeField
      FieldName = 'end_time'
    end
    object ADOCardstatus: TIntegerField
      FieldName = 'status'
    end
    object ADOCardoper_person: TIntegerField
      FieldName = 'oper_person'
    end
    object ADOCardoper_date: TDateTimeField
      FieldName = 'oper_date'
    end
  end
  object ADOConn: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 72
  end
end
