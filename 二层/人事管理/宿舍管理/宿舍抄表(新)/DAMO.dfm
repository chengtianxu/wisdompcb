object DM: TDM
  OldCreateOrder = False
  Left = 647
  Top = 266
  Height = 340
  Width = 392
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 152
    Top = 32
  end
  object adoMain: TADODataSet
    Connection = ADOConnection1
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.Bedroom_equipment_record.rkey, dbo.Bedroom_equipm' +
      'ent_record.roomid,dbo.Bedroommsg.R_code, dbo.Bedroommsg.R_name,'#13 +
      #10#9#9' dbo.Bedroom_equipment_record.record_date,dbo.Bedroom_equipme' +
      'nt_record.record_number,'#13#10#9#9' dbo.Bedroom_equipment_record.type, ' +
      'dbo.Bedroom_equipment_record.operator, '#13#10'         dbo.Bedroom_eq' +
      'uipment_record.oper_time, dbo.Bedroom_equipment_record.remark,'#13#10 +
      '         dbo.Bedroom_equipment_record.ischecked,dbo.Data0005.EMP' +
      'LOYEE_NAME,'#13#10'         case  when dbo.Bedroom_equipment_record.ty' +
      'pe='#39'e'#39' or dbo.Bedroom_equipment_record.type='#39'E'#39' '#13#10'         then ' +
      #39#30005#36153#39' else '#39#27700#36153#39' end as strtype,case dbo.Bedroom_equipment_record.' +
      'ischecked when 0 then '#39#21542#39' else '#39#26159#39' end as checked'#13#10'FROM         ' +
      'dbo.Bedroom_equipment_record INNER JOIN'#13#10'          dbo.Bedroomms' +
      'g ON dbo.Bedroom_equipment_record.roomid = dbo.Bedroommsg.rkey I' +
      'NNER JOIN'#13#10'          dbo.Data0005 ON dbo.Bedroom_equipment_recor' +
      'd.operator = dbo.Data0005.RKEY'#13#10'WHERE dbo.Bedroom_equipment_reco' +
      'rd.record_date between :From and :To '
    IndexFieldNames = 'r_code'
    Parameters = <
      item
        Name = 'From'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'To'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    Left = 40
    Top = 96
    object adoMainrkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object adoMainR_code: TStringField
      DisplayLabel = #25151#38388#32534#21495
      FieldName = 'R_code'
      Size = 50
    end
    object adoMainR_name: TWideStringField
      DisplayLabel = #25151#38388#21517#31216
      FieldName = 'R_name'
    end
    object adoMainrecord_date: TDateTimeField
      DisplayLabel = #25220#34920#26085#26399
      FieldName = 'record_date'
    end
    object adoMainrecord_number: TBCDField
      DisplayLabel = #25220#34920#24230#25968
      FieldName = 'record_number'
      Precision = 10
      Size = 2
    end
    object adoMaintype: TStringField
      FieldName = 'type'
      FixedChar = True
      Size = 10
    end
    object adoMainoperator: TIntegerField
      FieldName = 'operator'
    end
    object adoMainoper_time: TDateTimeField
      DisplayLabel = #24405#20837#26102#38388
      FieldName = 'oper_time'
    end
    object adoMainremark: TWideStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 50
    end
    object adoMainischecked: TBooleanField
      FieldName = 'ischecked'
    end
    object adoMainEMPLOYEE_NAME: TStringField
      DisplayLabel = #24405#20837#20154
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object adoMainstrtype: TStringField
      DisplayLabel = #31867#22411
      FieldName = 'strtype'
      ReadOnly = True
      Size = 4
    end
    object adoMainchecked: TStringField
      DisplayLabel = #26159#21542#22797#26680
      FieldName = 'checked'
      ReadOnly = True
      Size = 2
    end
    object adoMainroomid: TIntegerField
      FieldName = 'roomid'
    end
  end
  object adoTmp: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 120
    Top = 248
  end
  object adoTime: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    Left = 208
    Top = 248
  end
  object DataSource1: TDataSource
    DataSet = adoMain
    Left = 112
    Top = 96
  end
end
