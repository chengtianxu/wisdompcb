object DM: TDM
  OldCreateOrder = False
  Left = 965
  Top = 260
  Height = 390
  Width = 266
  object DataSource1: TDataSource
    DataSet = ADS831
    Left = 24
    Top = 64
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 8
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 160
    Top = 80
  end
  object ADORead: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 168
    Top = 152
  end
  object cmdUpdate: TADOCommand
    CommandText = 
      'declare @LastDate datetime  '#13#10'  select @LastDate=DateAdd(day,Cyc' +
      'l_Duration,:v1PlanMainDate)from DATA0816 WHERE MainCycl=:v2MainC' +
      'ycl                 '#13#10'    if not exists(select * from data0831 w' +
      'here [PlanMainDate]=@LastDate '#13#10'           and [DeviNumb]=:v3Dev' +
      'iNumb and [MainCycl]=:v4MainCycl)                         '#13#10'    ' +
      'insert into data0831 (PlanMainDate,DeviNumb,DeviType,MainCycl,RK' +
      'EY832,StdTimeCons) '#13#10'    select @LastDate,Fasset_Code,data0417.D' +
      'eviType,data0812.MainCycl,1,'#13#10'    StdTimeCons =(select top 1 Std' +
      'TimeCons from [data0847] where [D417_ptr]=data0417.rkey and data' +
      '0812.MainCycl= [data0847].MainCycl )'#13#10'        from data0417 join' +
      ' data0812 on data0417.DeviType=data0812.DeviType    '#13#10'        an' +
      'd Fasset_Code=:v5DeviNumb and data0812.MainCycl=:v7MainCycl'
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'v1PlanMainDate'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'v2MainCycl'
        DataType = ftWideString
        Size = -1
        Value = Null
      end
      item
        Name = 'v3DeviNumb'
        DataType = ftWideString
        Size = -1
        Value = Null
      end
      item
        Name = 'v4MainCycl'
        DataType = ftWideString
        Size = -1
        Value = Null
      end
      item
        Name = 'v5DeviNumb'
        DataType = ftWideString
        Size = -1
        Value = Null
      end
      item
        Name = 'v7MainCycl'
        DataType = ftWideString
        Size = -1
        Value = Null
      end>
    Left = 30
    Top = 181
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
      '002 on data0017.STOCK_UNIT_PTR=data0002.rkey'#13#10'where data0268.D83' +
      '1_ptr = :vD831_ptr'
    Parameters = <
      item
        Name = 'vD831_ptr'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 72
    Top = 136
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
  object DataSource4: TDataSource
    DataSet = ADS468
    Left = 16
    Top = 136
  end
  object ADS831: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterScroll = ADS831AfterScroll
    CommandText = 
      'select d417.FASSET_NAME,d832.MainExecStat,d73.User_Full_Name,'#13#10#39 +
      #23450#26399#20445#20859#39' as Impact,d34.DEPT_NAME,d15.ABBR_NAME,d417.equipment_grade' +
      ','#13#10'd417.LOCATION,d840.Location as d840_Location,data0831.rkey,'#13#10 +
      'data0831.PlanMainDate,data0831.DeviNumb,data0831.DeviType, '#13#10'dat' +
      'a0831.MainCycl,data0831.RKEY832,data0831.StarMainTime,'#13#10'data0831' +
      '.ActuCompTime, data0831.MainImpl,data0831.Remarks, '#13#10'data0831.Ti' +
      'meCons, data0831.MainAcce_UserPtr,data0831.StdTimeCons,'#13#10'case wh' +
      'en (data0831.StdTimeCons is not null and data0831.TimeCons<>0)'#13#10 +
      'then'#13#10'convert(nvarchar(10),convert(decimal(18,0),round(data0831.' +
      'StdTimeCons/data0831.TimeCons,2)*100))+'#39'%'#39' end as Acomplish'#13#10'fro' +
      'm data0831 '#13#10'join data0417 d417 on data0831.DeviNumb=d417.FASSET' +
      '_CODE'#13#10'join data0034 d34 on d417.DEPT_PTR=d34.rkey'#13#10'join data001' +
      '5 d15 on d417.warehouse_ptr=d15.rkey'#13#10'join data0832 d832 on data' +
      '0831.RKEY832=d832.rkey'#13#10'left join data0073 d73 on data0831.MainA' +
      'cce_UserPtr=d73.rkey'#13#10'left join data0840 d840 on d417.D840_ptr=d' +
      '840.rkey'#13#10'left join data0514 d514 on d514.rkey=d417.FASSET_TYPE_' +
      'PTR'#13#10'where d417.EquiType = 0'
    IndexFieldNames = 'PlanMainDate'
    Parameters = <>
    Left = 88
    Top = 72
    object ADS831FASSET_NAME: TStringField
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object ADS831MainExecStat: TStringField
      FieldName = 'MainExecStat'
      Size = 10
    end
    object ADS831User_Full_Name: TStringField
      FieldName = 'User_Full_Name'
      Size = 30
    end
    object ADS831Impact: TStringField
      FieldName = 'Impact'
      ReadOnly = True
      Size = 8
    end
    object ADS831DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADS831ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADS831equipment_grade: TStringField
      FieldName = 'equipment_grade'
      Size = 50
    end
    object ADS831LOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 40
    end
    object ADS831d840_Location: TStringField
      FieldName = 'd840_Location'
    end
    object ADS831rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADS831PlanMainDate: TDateTimeField
      FieldName = 'PlanMainDate'
    end
    object ADS831DeviNumb: TStringField
      FieldName = 'DeviNumb'
    end
    object ADS831DeviType: TStringField
      FieldName = 'DeviType'
      Size = 10
    end
    object ADS831MainCycl: TStringField
      FieldName = 'MainCycl'
      Size = 10
    end
    object ADS831RKEY832: TIntegerField
      FieldName = 'RKEY832'
    end
    object ADS831StarMainTime: TDateTimeField
      FieldName = 'StarMainTime'
    end
    object ADS831ActuCompTime: TDateTimeField
      FieldName = 'ActuCompTime'
    end
    object ADS831MainImpl: TWideStringField
      FieldName = 'MainImpl'
    end
    object ADS831Remarks: TStringField
      FieldName = 'Remarks'
      Size = 500
    end
    object ADS831TimeCons: TBCDField
      FieldName = 'TimeCons'
      Precision = 10
      Size = 2
    end
    object ADS831MainAcce_UserPtr: TIntegerField
      FieldName = 'MainAcce_UserPtr'
    end
    object ADS831StdTimeCons: TBCDField
      FieldName = 'StdTimeCons'
      Precision = 9
      Size = 2
    end
    object ADS831Acomplish: TWideStringField
      FieldName = 'Acomplish'
      ReadOnly = True
      Size = 11
    end
  end
end
