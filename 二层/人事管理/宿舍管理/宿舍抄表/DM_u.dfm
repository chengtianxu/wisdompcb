object DM: TDM
  OldCreateOrder = False
  Left = 384
  Top = 240
  Height = 374
  Width = 256
  object ADOCon: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=wisdomtopcb1077;Persist Security In' +
      'fo=True;User ID=wzsa;Initial Catalog=sj_v20_live;Data Source=172' +
      '.16.0.8'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 54
    Top = 40
  end
  object ADOBER: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT      cast(0 as bit) Sel,dbo.Bedroommsg.R_code, dbo.Bedroo' +
        'm_equipment_record.record_date, dbo.Bedroom_equipment_record.rec' +
        'ord_number, '
      
        '                      dbo.Bedroom_equipment_record.type, dbo.Bed' +
        'room_equipment_record.roomid, dbo.Bedroom_equipment_record.rkey,' +
        ' '
      
        '                      dbo.Bedroom_equipment_record.operator, dbo' +
        '.Bedroom_equipment_record.oper_time, dbo.Bedroom_equipment_recor' +
        'd.remark, '
      
        '                      CASE dbo.Bedroom_equipment_record.ischecke' +
        'd WHEN 0 THEN '#39#24453#22797#26680#39' WHEN 1 THEN '#39#24050#22797#26680#39' END AS ischecked_s,'
      
        '                      CASE  WHEN (dbo.Bedroom_equipment_record.t' +
        'ype='#39'W'#39' or dbo.Bedroom_equipment_record.type='#39'w'#39') THEN '#39#27700#34920#39' '
      
        '                      WHEN (dbo.Bedroom_equipment_record.type='#39'E' +
        #39' or dbo.Bedroom_equipment_record.type= '#39'e'#39') THEN '#39#30005#34920#39'  END AS t' +
        'ype_s,   '
      '                     dbo.Bedroom_equipment_record.ischecked, '
      '                      dbo.Data0005.EMPLOYEE_NAME'
      'FROM         dbo.Bedroom_equipment_record INNER JOIN'
      
        '                      dbo.Bedroommsg ON dbo.Bedroom_equipment_re' +
        'cord.roomid = dbo.Bedroommsg.rkey INNER JOIN'
      
        '                      dbo.Data0005 ON dbo.Bedroom_equipment_reco' +
        'rd.operator = dbo.Data0005.RKEY')
    Left = 56
    Top = 128
    object ADOBERR_code: TStringField
      FieldName = 'R_code'
      Size = 50
    end
    object ADOBERrecord_date: TDateTimeField
      FieldName = 'record_date'
    end
    object ADOBERrecord_number: TFloatField
      FieldName = 'record_number'
    end
    object ADOBERtype: TStringField
      FieldName = 'type'
      FixedChar = True
      Size = 10
    end
    object ADOBERroomid: TIntegerField
      FieldName = 'roomid'
    end
    object ADOBERrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOBERoperator: TIntegerField
      FieldName = 'operator'
    end
    object ADOBERoper_time: TDateTimeField
      FieldName = 'oper_time'
    end
    object ADOBERremark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
    object ADOBEREMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOBERischecked_s: TStringField
      FieldName = 'ischecked_s'
      ReadOnly = True
      Size = 6
    end
    object ADOBERischecked: TBooleanField
      FieldName = 'ischecked'
    end
    object ADOBERtype_s: TStringField
      FieldName = 'type_s'
      ReadOnly = True
      Size = 4
    end
    object ADOBERSel: TBooleanField
      FieldName = 'Sel'
    end
  end
  object DS: TDataSource
    DataSet = ADOBER
    Left = 56
    Top = 192
  end
  object tmp: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 239
    Top = 92
  end
  object CDS: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforeInsert = CDSBeforeInsert
    AfterInsert = CDSAfterInsert
    Left = 144
    Top = 130
    object CDSSel: TBooleanField
      FieldName = 'Sel'
    end
    object CDSR_code: TStringField
      FieldName = 'R_code'
      Size = 50
    end
    object CDSrecord_date: TDateTimeField
      FieldName = 'record_date'
    end
    object CDSrecord_number: TFloatField
      FieldName = 'record_number'
    end
    object CDStype: TStringField
      FieldName = 'type'
      FixedChar = True
      Size = 10
    end
    object CDSroomid: TIntegerField
      FieldName = 'roomid'
    end
    object CDSrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object CDSoperator: TIntegerField
      FieldName = 'operator'
    end
    object CDSoper_time: TDateTimeField
      FieldName = 'oper_time'
    end
    object CDSremark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
    object CDSEMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object CDSischecked_s: TStringField
      FieldName = 'ischecked_s'
      ReadOnly = True
      Size = 6
    end
    object CDSischecked: TBooleanField
      FieldName = 'ischecked'
    end
    object CDStype_s: TStringField
      FieldName = 'type_s'
      ReadOnly = True
      Size = 4
    end
  end
  object DSP: TDataSetProvider
    DataSet = ADOBER
    Left = 104
    Top = 130
  end
  object DataSource1: TDataSource
    DataSet = CDS
    Left = 136
    Top = 192
  end
end
