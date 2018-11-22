object DM: TDM
  OldCreateOrder = False
  Left = 721
  Top = 239
  Height = 328
  Width = 224
  object DataSource1: TDataSource
    DataSet = ADS567
    Left = 16
    Top = 56
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
  end
  object ADS567: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterScroll = ADS567AfterScroll
    CommandText = 
      'SELECT data0846.FaultName,data0846.stdDate,'#13#10'              Data0' +
      '034.DEPT_CODE,Data0034.DEPT_NAME, '#13#10'              Data0417.FASSE' +
      'T_CODE,Data0417.FASSET_NAME,Data0417.FASSET_DESC,'#13#10'             ' +
      ' case Data0417.EquiType when 0 then '#39#21542#39' when 1 then '#39#26159#39' end as E' +
      'quiType,'#13#10'              d840.Location as D417_Location,Data0417.' +
      'D840_ptr as D417_D840_ptr,'#13#10'              convert(decimal(18,2),' +
      'round(datediff(minute,ent_date,complete_date)/60.0,2)) as GZSJ,'#13 +
      #10'              Data0005.EMPL_CODE,Data0005.EMPLOYEE_NAME,data001' +
      '5.warehouse_code,data0015.abbr_name,'#13#10'              case data056' +
      '7.status when 0 then '#39#26410#25552#20132#39' when 1 then '#39#24453#21463#29702#39' when 2 then '#39#24050#21463#29702#39#13#10 +
      '              when 3 then '#39#24050#23436#24037#39' when 4 then '#39#24050#39564#25910#39' when 5 then '#39#34987 +
      #36864#22238#39' when 6 then '#39#24050#26242#20572#39' end as V_stat,'#13#10'              Data0005_1.e' +
      'mpl_code as disposal_emplcode,Data0005_1.EMPLOYEE_NAME as dispos' +
      'al_emplname,'#13#10'              Data0005_2.empl_code as completion_e' +
      'mplcode,'#13#10'              Data0005_2.EMPLOYEE_NAME as completion_e' +
      'mplname,'#13#10'              Data0005_3.EMPLOYEE_NAME as validate_emp' +
      'lname,'#13#10'              '#39'tslr'#39'=convert(varchar(500),STUFF((SELECT ' +
      #39#65307#39' + remark from data0841'#13#10'              where data0841.D567_pt' +
      'r=data0567.rkey and Status_ptr=7'#13#10'              FOR XML PATH('#39#39')' +
      '), 1, 1, '#39#39')),data0840.Location,'#13#10'              DATA0567.RKEY, D' +
      'ATA0567.NUMBER,  DATA0567.STATUS, DATA0567.DEPT_PTR, '#13#10'         ' +
      '     DATA0567.FASSET_PTR, DATA0567.PLACE, DATA0567.equipment_gra' +
      'de, DATA0567.failure_grade, '#13#10'              DATA0567.failure_deg' +
      'ree, convert(datetime,(convert(varchar,DATA0567.failure_date,101' +
      ')),101) as failure_dat,DATA0567.EMPL_PTR, DATA0567.ent_date, '#13#10' ' +
      '             DATA0567.referring_date, DATA0567.CONTACT_NAME, DAT' +
      'A0567.CONTACT_PHONE, '#13#10'              DATA0567.failure_circs, DAT' +
      'A0567.disposal_emplptr,  DATA0567.disposal_date, DATA0567.mainta' +
      'in_text, '#13#10'              DATA0567.maintain_empl, DATA0567.comple' +
      'te_date, DATA0567.validate_emplptr, DATA0567.validate_date, '#13#10'  ' +
      '            DATA0567.validate_appraise, DATA0567.fail_type, DATA' +
      '0567.WHOUSE_PTR,DATA0567.suspended_reason,'#13#10'              DATA05' +
      '67.stoppage_time, DATA0567.recovery_time, DATA0567.completion_em' +
      'plptr, DATA0567.stop_house, '#13#10'              DATA0567.maintain_ho' +
      'use, DATA0567.validate_Description, DATA0567.D846_ptr, '#13#10'       ' +
      '       DATA0567.Staff_Sum_house, DATA0567.D840_ptr, DATA0567.D07' +
      '3_ptr'#13#10#13#10'FROM    DATA0567 INNER JOIN  Data0417 ON DATA0567.FASSE' +
      'T_PTR = Data0417.RKEY '#13#10'              left join data0840 as d840' +
      ' on Data0417.D840_ptr=d840.rkey'#13#10'              INNER JOIN  Data0' +
      '034 ON DATA0567.DEPT_PTR = Data0034.RKEY'#13#10'              INNER JO' +
      'IN  Data0005 ON DATA0567.EMPL_PTR = Data0005.RKEY '#13#10'            ' +
      '  left  JOIN  Data0005 AS Data0005_1 ON DATA0567.disposal_emplpt' +
      'r = Data0005_1.RKEY '#13#10'              left  join  Data0005 AS Data' +
      '0005_2 ON Data0567.completion_emplptr=Data0005_2.RKEY '#13#10'        ' +
      '      left  join  Data0005 AS Data0005_3 ON Data0567.validate_em' +
      'plptr=Data0005_3.RKEY'#13#10'              left  join  Data0015 ON DAT' +
      'A0567.whouse_ptr=data0015.rkey '#13#10'              left join data084' +
      '6 on DATA0567.D846_ptr=data0846.rkey'#13#10'              left join da' +
      'ta0840 on DATA0567.D840_ptr=data0840.rkey'#13#10#13#10'where  1=1'
    IndexFieldNames = 'NUMBER'
    Parameters = <>
    Prepared = True
    Left = 88
    Top = 64
    object ADS567FaultName: TStringField
      FieldName = 'FaultName'
      Size = 50
    end
    object ADS567stdDate: TBCDField
      FieldName = 'stdDate'
      Precision = 9
      Size = 2
    end
    object ADS567DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADS567DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADS567FASSET_CODE: TStringField
      FieldName = 'FASSET_CODE'
    end
    object ADS567FASSET_NAME: TStringField
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object ADS567FASSET_DESC: TStringField
      FieldName = 'FASSET_DESC'
      Size = 40
    end
    object ADS567D417_Location: TStringField
      FieldName = 'D417_Location'
    end
    object ADS567D417_D840_ptr: TIntegerField
      FieldName = 'D417_D840_ptr'
    end
    object ADS567EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object ADS567EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADS567warehouse_code: TStringField
      FieldName = 'warehouse_code'
      Size = 5
    end
    object ADS567abbr_name: TStringField
      FieldName = 'abbr_name'
      Size = 10
    end
    object ADS567V_stat: TStringField
      FieldName = 'V_stat'
      ReadOnly = True
      Size = 8
    end
    object ADS567disposal_emplcode: TStringField
      FieldName = 'disposal_emplcode'
      Size = 10
    end
    object ADS567disposal_emplname: TStringField
      FieldName = 'disposal_emplname'
      Size = 16
    end
    object ADS567completion_emplcode: TStringField
      FieldName = 'completion_emplcode'
      Size = 10
    end
    object ADS567completion_emplname: TStringField
      FieldName = 'completion_emplname'
      Size = 16
    end
    object ADS567validate_emplname: TStringField
      FieldName = 'validate_emplname'
      Size = 16
    end
    object ADS567tslr: TStringField
      FieldName = 'tslr'
      ReadOnly = True
      Size = 500
    end
    object ADS567Location: TStringField
      FieldName = 'Location'
    end
    object ADS567RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADS567NUMBER: TStringField
      FieldName = 'NUMBER'
      Size = 15
    end
    object ADS567STATUS: TWordField
      FieldName = 'STATUS'
    end
    object ADS567DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ADS567FASSET_PTR: TIntegerField
      FieldName = 'FASSET_PTR'
    end
    object ADS567PLACE: TStringField
      FieldName = 'PLACE'
      Size = 40
    end
    object ADS567equipment_grade: TStringField
      FieldName = 'equipment_grade'
      Size = 10
    end
    object ADS567failure_grade: TStringField
      FieldName = 'failure_grade'
      Size = 4
    end
    object ADS567failure_degree: TStringField
      FieldName = 'failure_degree'
      Size = 8
    end
    object ADS567EMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
    end
    object ADS567ent_date: TDateTimeField
      FieldName = 'ent_date'
    end
    object ADS567referring_date: TDateTimeField
      FieldName = 'referring_date'
    end
    object ADS567CONTACT_NAME: TStringField
      FieldName = 'CONTACT_NAME'
      Size = 10
    end
    object ADS567CONTACT_PHONE: TStringField
      FieldName = 'CONTACT_PHONE'
      Size = 15
    end
    object ADS567failure_circs: TStringField
      FieldName = 'failure_circs'
      Size = 200
    end
    object ADS567disposal_emplptr: TIntegerField
      FieldName = 'disposal_emplptr'
    end
    object ADS567disposal_date: TDateTimeField
      FieldName = 'disposal_date'
    end
    object ADS567maintain_text: TStringField
      FieldName = 'maintain_text'
      Size = 400
    end
    object ADS567maintain_empl: TStringField
      FieldName = 'maintain_empl'
      Size = 50
    end
    object ADS567complete_date: TDateTimeField
      FieldName = 'complete_date'
    end
    object ADS567validate_emplptr: TIntegerField
      FieldName = 'validate_emplptr'
    end
    object ADS567validate_date: TDateTimeField
      FieldName = 'validate_date'
    end
    object ADS567validate_appraise: TStringField
      FieldName = 'validate_appraise'
      Size = 50
    end
    object ADS567fail_type: TStringField
      FieldName = 'fail_type'
      Size = 30
    end
    object ADS567WHOUSE_PTR: TIntegerField
      FieldName = 'WHOUSE_PTR'
    end
    object ADS567suspended_reason: TWideStringField
      FieldName = 'suspended_reason'
      Size = 50
    end
    object ADS567stoppage_time: TDateTimeField
      FieldName = 'stoppage_time'
    end
    object ADS567recovery_time: TDateTimeField
      FieldName = 'recovery_time'
    end
    object ADS567completion_emplptr: TIntegerField
      FieldName = 'completion_emplptr'
    end
    object ADS567stop_house: TBCDField
      FieldName = 'stop_house'
      Precision = 8
      Size = 2
    end
    object ADS567maintain_house: TBCDField
      FieldName = 'maintain_house'
      Precision = 8
      Size = 2
    end
    object ADS567validate_Description: TStringField
      FieldName = 'validate_Description'
      Size = 100
    end
    object ADS567D846_ptr: TIntegerField
      FieldName = 'D846_ptr'
    end
    object ADS567Staff_Sum_house: TBCDField
      FieldName = 'Staff_Sum_house'
      Precision = 8
      Size = 2
    end
    object ADS567D840_ptr: TIntegerField
      FieldName = 'D840_ptr'
    end
    object ADS567D073_ptr: TIntegerField
      FieldName = 'D073_ptr'
    end
    object ADS567GZSJ: TBCDField
      FieldName = 'GZSJ'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object ADS567EquiType: TStringField
      FieldName = 'EquiType'
      ReadOnly = True
      Size = 2
    end
    object ADS567failure_dat: TDateTimeField
      FieldName = 'failure_dat'
      ReadOnly = True
    end
  end
  object ADS842: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterScroll = ADS842AfterScroll
    CommandText = 
      'select  Data0842.rkey, Data0842.Work_ptr, Data0842.WorkDate, Dat' +
      'a0842.BeginTime, '#13#10'           Data0842.EndTime, Data0842.TimeCon' +
      's, Data0842.TimeRest, Data0842.Empl_ptr, '#13#10'           Data0842.S' +
      'tatus, Data0842.WorkTime, Data0842.Remark, Data0842.DayShift,'#13#10' ' +
      '          data0005.EMPL_CODE,data0005.EMPLOYEE_NAME,MainexecStat' +
      ' '#13#10'from    Data0842 left join data0005 on Data0842.Empl_ptr=data' +
      '0005.rkey'#13#10'           join data0832 on Data0842.Status=data0832.' +
      'rkey'#13#10'where data0842.work_ptr=:RKEY'
    DataSource = DataSource1
    IndexFieldNames = 'Work_ptr'
    MasterFields = 'RKEY'
    Parameters = <
      item
        Name = 'RKEY'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = 27058
      end>
    Prepared = True
    Left = 88
    Top = 112
    object ADS842rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADS842Work_ptr: TIntegerField
      FieldName = 'Work_ptr'
    end
    object ADS842WorkDate: TDateTimeField
      FieldName = 'WorkDate'
    end
    object ADS842BeginTime: TDateTimeField
      FieldName = 'BeginTime'
    end
    object ADS842EndTime: TDateTimeField
      FieldName = 'EndTime'
    end
    object ADS842TimeCons: TBCDField
      FieldName = 'TimeCons'
      Precision = 8
      Size = 2
    end
    object ADS842TimeRest: TBCDField
      FieldName = 'TimeRest'
      Precision = 8
      Size = 2
    end
    object ADS842Empl_ptr: TIntegerField
      FieldName = 'Empl_ptr'
    end
    object ADS842Status: TIntegerField
      FieldName = 'Status'
    end
    object ADS842WorkTime: TBCDField
      FieldName = 'WorkTime'
      Precision = 5
      Size = 2
    end
    object ADS842Remark: TStringField
      FieldName = 'Remark'
      Size = 200
    end
    object ADS842DayShift: TWordField
      FieldName = 'DayShift'
    end
    object ADS842EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object ADS842EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADS842MainexecStat: TStringField
      FieldName = 'MainexecStat'
      Size = 10
    end
  end
  object DataSource2: TDataSource
    DataSet = ADS842
    Left = 16
    Top = 112
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 160
    Top = 80
  end
  object ADS468: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'select dbo.DATA0268.number, dbo.Data0017.INV_PART_NUMBER, dbo.Da' +
      'ta0017.INV_PART_DESCRIPTION,'#13#10'data0002.unit_name,dbo.Data0468.QU' +
      'AN_BOM, dbo.Data0468.QUAN_ISSUED '#13#10'FROM '#13#10'dbo.DATA0268 join data' +
      '0468 on data0468.FLOW_NO=DATA0268.rkey'#13#10'INNER JOIN dbo.Data0017 ' +
      'ON dbo.Data0468.INVENT_PTR = dbo.Data0017.RKEY'#13#10'inner join data0' +
      '002 on data0017.STOCK_UNIT_PTR=data0002.rkey'#13#10'where DATA0268.d56' +
      '7_ptr=:vd567_ptr'
    Parameters = <
      item
        Name = 'vd567_ptr'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 88
    Top = 168
    object ADS468number: TStringField
      FieldName = 'number'
      Size = 10
    end
    object ADS468INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADS468INV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object ADS468unit_name: TStringField
      FieldName = 'unit_name'
    end
    object ADS468QUAN_BOM: TFloatField
      FieldName = 'QUAN_BOM'
    end
    object ADS468QUAN_ISSUED: TFloatField
      FieldName = 'QUAN_ISSUED'
    end
  end
  object DataSource3: TDataSource
    DataSet = ADS468
    Left = 16
    Top = 168
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 152
    Top = 144
  end
  object QryResultTime: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'vbeginTime'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'vEndTime'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      '/*'#21151#33021#35828#26126#65292#20256#20837#24320#22987#26102#38388#12289#32467#26463#26102#38388#65292#36820#22238#36825'2'#20010#26102#38388#27573#30340#20013#36884#20241#24687'*/'
      'declare @beginTime datetime,@EndTime datetime,@SumTime dec(9,2)'
      'set @beginTime=:vbeginTime'
      'set @EndTime=:vEndTime'
      'set @SumTime=0     '
      'if (convert(nvarchar(8),@beginTime,14))<'#39'12:00:00'#39
      
        '  if ((convert(nvarchar(8),@EndTime,14))>'#39'12:00:00'#39')or(datePart(' +
        'day,@EndTime)>datePart(day,@beginTime)) '
      
        '     if ((convert(nvarchar(8),@EndTime,14))>'#39'13:30:00'#39')or(datePa' +
        'rt(day,@EndTime)>datePart(day,@beginTime)) '
      '     set @SumTime=90'
      '     else'
      
        '     SELECT @SumTime=cast(datediff(minute,'#39'12:00:00'#39',(convert(nv' +
        'archar(8),@EndTime,14)))as dec(9,2))'
      '     print @SumTime'
      'if (convert(nvarchar(8),@beginTime,14))<'#39'17:30:00'#39
      
        '  if ((convert(nvarchar(8),@EndTime,14))>'#39'17:30:00'#39')or(datePart(' +
        'day,@EndTime)>datePart(day,@beginTime)) '
      
        '     if ((convert(nvarchar(8),@EndTime,14))>'#39'18:30:00'#39')or (dateP' +
        'art(day,@EndTime)>datePart(day,@beginTime))'
      '     set @SumTime=@SumTime+60'
      '     else'
      
        '     SELECT @SumTime=@SumTime+cast(datediff(minute,'#39'17:30:00'#39',(c' +
        'onvert(nvarchar(8),@EndTime,14)))as dec(9,2))'
      '     print @SumTime'
      'if (convert(nvarchar(8),@beginTime,14))<'#39'23:00:00'#39
      
        '  if ((convert(nvarchar(8),@EndTime,14))>'#39'23:00:00'#39')or(datePart(' +
        'day,@EndTime)>datePart(day,@beginTime))'
      
        '     if ((convert(nvarchar(8),@EndTime,14))>'#39'23:30:00'#39')or(datePa' +
        'rt(day,@EndTime)>datePart(day,@beginTime))--((convert(nvarchar(8' +
        '),@EndTime,14))>'#39'00:00:00'#39')'
      '     set @SumTime=@SumTime+30'
      '     else'
      
        '     SELECT @SumTime=@SumTime+cast(datediff(minute,'#39'23:00:00'#39',(c' +
        'onvert(nvarchar(8),@EndTime,14)))as dec(9,2))      '
      'SELECT @SumTime/60')
    Left = 160
    Top = 204
  end
end
