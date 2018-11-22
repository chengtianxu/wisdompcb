object DM: TDM
  OldCreateOrder = False
  Left = 596
  Top = 180
  Height = 266
  Width = 250
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=62ddf8f60269678;Persist Security In' +
      'fo=True;User ID=WZPCBConnect;Initial Catalog=sj_v20_live;Data So' +
      'urce=172.16.68.8;Use Procedure for Prepare=1;Auto Translate=True' +
      ';Packet Size=4096;Workstation ID=PC-20150130VGBU;Use Encryption ' +
      'for Data=False;Tag with column collation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 24
  end
  object ADS835: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterScroll = ADS835AfterScroll
    OnCalcFields = ADS835CalcFields
    CommandText = 
      'select data0830.DeptName,data0836.WorkName,data0073.USER_FULL_NA' +
      'ME as un_Applican,'#13#10'd73_1.USER_FULL_NAME as un_RespPeop,data0832' +
      '.MainExecStat,d73_2.USER_FULL_NAME as un_AdmiPeop,'#13#10'd73_3.USER_F' +
      'ULL_NAME as un_AccePeop,Data0835.rkey, Data0835.WorkOrder, Data0' +
      '835.Dept_ptr, '#13#10'Data0835.Work_ptr, Data0835.WorkExpl, Data0835.F' +
      'oreTime, Data0835.Applican, Data0835.Status, '#13#10'Data0835.RespPeop' +
      ', Data0835.AdmiTime, Data0835.AdmiPeop, Data0835.CompTime, Data0' +
      '835.ActuCons,'#13#10'Data0835.Efficien, Data0835.AcceTime, Data0835.Ac' +
      'cePeop, Data0835.Remark'#13#10'from data0835 '#13#10'join data0830 on data08' +
      '35.Dept_ptr=data0830.rkey'#13#10'join data0836 on data0835.Work_ptr=da' +
      'ta0836.rkey'#13#10'join data0073 on data0835.Applican=data0073.rkey'#13#10'l' +
      'eft join data0073 d73_1 on data0835.RespPeop=d73_1.rkey '#13#10'left j' +
      'oin data0832 on data0835.Status=data0832.rkey'#13#10'left join data007' +
      '3 d73_2 on data0835.AdmiPeop=d73_2.rkey '#13#10'left join data0073 d73' +
      '_3 on data0835.AccePeop=d73_3.rkey '#13#10'where 1=1'
    IndexFieldNames = 'WorkOrder'
    Parameters = <>
    Left = 88
    Top = 80
    object ADS835WorkOrder: TStringField
      DisplayLabel = #24037#20316#21333#21495
      FieldName = 'WorkOrder'
      Size = 15
    end
    object ADS835DeptName: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'DeptName'
      Size = 50
    end
    object ADS835WorkName: TStringField
      DisplayLabel = #20219#21153
      FieldName = 'WorkName'
      Size = 50
    end
    object ADS835WorkExpl: TStringField
      DisplayLabel = #24037#20316#20219#21153#35828#26126
      FieldName = 'WorkExpl'
      Size = 200
    end
    object ADS835un_Applican: TStringField
      DisplayLabel = #30003#35831#20154
      FieldName = 'un_Applican'
      Size = 30
    end
    object ADS835AdmiTime: TDateTimeField
      DisplayLabel = #21463#29702#26085#26399
      FieldName = 'AdmiTime'
    end
    object ADS835un_AdmiPeop: TStringField
      DisplayLabel = #21463#29702#20154
      FieldName = 'un_AdmiPeop'
      Size = 30
    end
    object ADS835CompTime: TDateTimeField
      DisplayLabel = #23436#25104#26085#26399
      FieldName = 'CompTime'
    end
    object ADS835un_RespPeop: TStringField
      DisplayLabel = #36131#20219#20154
      FieldName = 'un_RespPeop'
      Size = 30
    end
    object ADS835MainExecStat: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'MainExecStat'
      Size = 10
    end
    object ADS835AcceTime: TDateTimeField
      DisplayLabel = #39564#25910#26102#38388
      FieldName = 'AcceTime'
    end
    object ADS835un_AccePeop: TStringField
      DisplayLabel = #39564#25910#20154
      FieldName = 'un_AccePeop'
      Size = 30
    end
    object ADS835ForeTime: TBCDField
      DisplayLabel = #39044#35745#32791#26102
      FieldName = 'ForeTime'
      Precision = 8
      Size = 2
    end
    object ADS835ActuCons: TBCDField
      DisplayLabel = #23454#38469#32791#26102
      FieldName = 'ActuCons'
      Precision = 8
      Size = 2
    end
    object ADS835Efficien: TBCDField
      DisplayLabel = #25928#29575
      FieldKind = fkCalculated
      FieldName = 'Efficien'
      Precision = 5
      Calculated = True
    end
    object ADS835Remark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Remark'
      Size = 200
    end
    object ADS835rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADS835Dept_ptr: TIntegerField
      FieldName = 'Dept_ptr'
    end
    object ADS835Work_ptr: TIntegerField
      FieldName = 'Work_ptr'
    end
    object ADS835Applican: TIntegerField
      FieldName = 'Applican'
    end
    object ADS835Status: TIntegerField
      FieldName = 'Status'
    end
    object ADS835RespPeop: TIntegerField
      FieldName = 'RespPeop'
    end
    object ADS835AdmiPeop: TIntegerField
      FieldName = 'AdmiPeop'
    end
    object ADS835AccePeop: TIntegerField
      FieldName = 'AccePeop'
    end
  end
  object ADS837: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'select data0005.EMPL_CODE,data0005.EMPLOYEE_NAME,data0832.MainEx' +
      'ecStat,'#13#10'Data0837.rkey, Data0837.Work_ptr, Data0837.WorkDate, Da' +
      'ta0837.BeginTime, '#13#10'Data0837.EndTime, Data0837.TimeCons, Data083' +
      '7.TimeRest, '#13#10'Data0837.Empl_ptr, Data0837.Status, Data0837.WorkT' +
      'ime, Data0837.Remark'#13#10'from data0837'#13#10'join data0005 on data0837.E' +
      'mpl_ptr=data0005.rkey'#13#10'join data0832 on data0837.Status=data0832' +
      '.rkey'#13#10'where Data0837.Work_ptr=:rkey'
    DataSource = DataSource1
    IndexFieldNames = 'Work_ptr'
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = 1
      end>
    Left = 88
    Top = 144
    object ADS837rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADS837Work_ptr: TIntegerField
      FieldName = 'Work_ptr'
    end
    object ADS837WorkDate: TDateTimeField
      DisplayLabel = #24037#20316#26085#26399
      FieldName = 'WorkDate'
    end
    object ADS837WorkTime: TBCDField
      DisplayLabel = #23454#38469#24037#20316#26102#38388
      FieldName = 'WorkTime'
      Precision = 5
      Size = 2
    end
    object ADS837BeginTime: TDateTimeField
      DisplayLabel = #24320#22987#26102#38388
      FieldName = 'BeginTime'
    end
    object ADS837EndTime: TDateTimeField
      DisplayLabel = #32467#26463#26102#38388
      FieldName = 'EndTime'
    end
    object ADS837TimeCons: TBCDField
      DisplayLabel = #26242#20572#26102#38388
      FieldName = 'TimeCons'
      Precision = 8
      Size = 2
    end
    object ADS837TimeRest: TBCDField
      DisplayLabel = #20013#36884#20241#24687#26102#38388
      FieldName = 'TimeRest'
      Precision = 8
      Size = 2
    end
    object ADS837Empl_ptr: TIntegerField
      FieldName = 'Empl_ptr'
    end
    object ADS837EMPLOYEE_NAME: TStringField
      DisplayLabel = #38599#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADS837MainExecStat: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'MainExecStat'
      Size = 10
    end
    object ADS837EMPL_CODE: TStringField
      DisplayLabel = #38599#21592#20195#30721
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object ADS837Status: TIntegerField
      FieldName = 'Status'
    end
    object ADS837Remark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Remark'
      Size = 200
    end
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 176
    Top = 168
  end
  object DataSource1: TDataSource
    DataSet = ADS835
    Left = 32
    Top = 80
  end
  object DataSource2: TDataSource
    DataSet = ADS837
    Left = 24
    Top = 136
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 176
    Top = 112
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
    Left = 168
    Top = 60
  end
end
