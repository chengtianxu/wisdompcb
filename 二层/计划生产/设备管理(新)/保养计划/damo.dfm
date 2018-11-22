object DM: TDM
  OldCreateOrder = False
  Left = 965
  Top = 260
  Height = 552
  Width = 401
  object DataSource1: TDataSource
    DataSet = ADS831
    Left = 24
    Top = 64
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=wisdompcb1077;Persist Security Info' +
      '=True;User ID=sa;Initial Catalog=demo2;Data Source=192.168.8.37;' +
      'Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096' +
      ';Workstation ID=Z-PC;Use Encryption for Data=False;Tag with colu' +
      'mn collation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 8
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
      'PTR'#13#10'where d417.EquiType = 1'
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
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 160
    Top = 80
  end
  object ADS848: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'select Data0848.Rkey,Data0848.Work_ptr, Data0848.WorkDate, Data0' +
      '848.BeginTime, Data0848.EndTime, '#13#10'Data0848.TimeRest, Data0848.E' +
      'mpl_ptr, Data0848.Status, Data0848.WorkTime, Data0848.Remark, Da' +
      'ta0848.DayShift,'#13#10'data0005.EMPL_CODE,data0005.EMPLOYEE_NAME,Main' +
      'execStat '#13#10'from Data0848'#13#10'left join data0005 on Data0848.Empl_pt' +
      'r=data0005.rkey'#13#10'join data0832 on Data0848.Status=data0832.rkey'#13 +
      #10'where Data0848.Work_ptr=:RKEY'
    DataSource = DataSource1
    MasterFields = 'RKEY'
    Parameters = <
      item
        Name = 'RKEY'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 88
    Top = 128
    object ADS848Rkey: TIntegerField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object ADS848Work_ptr: TIntegerField
      FieldName = 'Work_ptr'
    end
    object ADS848WorkDate: TDateTimeField
      FieldName = 'WorkDate'
    end
    object ADS848BeginTime: TDateTimeField
      FieldName = 'BeginTime'
      ReadOnly = True
    end
    object ADS848EndTime: TDateTimeField
      FieldName = 'EndTime'
      ReadOnly = True
    end
    object ADS848TimeRest: TBCDField
      FieldName = 'TimeRest'
      Precision = 8
      Size = 2
    end
    object ADS848Empl_ptr: TIntegerField
      FieldName = 'Empl_ptr'
    end
    object ADS848Status: TIntegerField
      FieldName = 'Status'
    end
    object ADS848WorkTime: TBCDField
      FieldName = 'WorkTime'
      Precision = 5
      Size = 2
    end
    object ADS848Remark: TStringField
      FieldName = 'Remark'
      Size = 200
    end
    object ADS848DayShift: TWordField
      FieldName = 'DayShift'
    end
    object ADS848EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object ADS848EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADS848MainexecStat: TStringField
      FieldName = 'MainexecStat'
      Size = 10
    end
  end
  object DataSource2: TDataSource
    DataSet = ADS848
    Left = 16
    Top = 128
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
    Left = 230
    Top = 229
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
  object ADS847: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'select data0034.DEPT_CODE,data0034.DEPT_NAME,rtrim(d17.FASSET_CO' +
      'DE) as FASSET_CODE,'#13#10'd17.FASSET_NAME,data0847.RKEY, data0847.D41' +
      '7_ptr, data0847.MainCycl, data0847.StdTimeCons'#13#10'from dbo.Data084' +
      '7 '#13#10'join data0417 d17 on Data0847.D417_ptr=d17.rkey'#13#10'join data08' +
      '16 on Data0847.MainCycl=data0816.MainCycl'#13#10'join data0034 on d17.' +
      'DEPT_PTR=data0034.rkey'
    IndexFieldNames = 'FASSET_CODE'
    Parameters = <>
    Left = 80
    Top = 184
    object ADS847DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADS847DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADS847FASSET_CODE: TStringField
      FieldName = 'FASSET_CODE'
      ReadOnly = True
    end
    object ADS847FASSET_NAME: TStringField
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object ADS847RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADS847D417_ptr: TIntegerField
      FieldName = 'D417_ptr'
    end
    object ADS847MainCycl: TStringField
      FieldName = 'MainCycl'
      Size = 10
    end
    object ADS847StdTimeCons: TBCDField
      FieldName = 'StdTimeCons'
      Precision = 9
      Size = 2
    end
  end
  object DataSource3: TDataSource
    DataSet = ADS847
    Left = 16
    Top = 176
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
    Left = 80
    Top = 240
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
    Left = 24
    Top = 232
  end
  object ADS821: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    OnCalcFields = ADS821CalcFields
    CommandText = 
      'SELECT     dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, ' +
      'dbo.Data0017.INV_DESCRIPTION, dbo.Data0017.QUAN_ON_HAND, '#13#10'     ' +
      '                 (dbo.Data0017.QUAN_ON_HAND-dbo.Data0017.QUAN_AS' +
      'SIGN) as ValidateQuantity, dbo.Data0821.Quantity, dbo.Data0821.I' +
      'fmustReplace,'#13#10'                      dbo.Data0821.ReplaceQuantit' +
      'y,(dbo.Data0821.Quantity-dbo.Data0821.ReplaceQuantity) as NeedRe' +
      'placeQuantity, dbo.Data0002.UNIT_NAME, '#13#10'                      d' +
      'bo.Data0073.USER_FULL_NAME,dbo.Data0821.ReplaceDate,Data0821.Cre' +
      'ateDate,dbo.Data0821.Rkey, dbo.Data0821.Rkey831, dbo.Data0821.Rk' +
      'ey17, '#13#10'                     dbo.Data0821.unit_ptr, dbo.Data0821' +
      '.ReplaceRkey73,data0417.FASSET_CODE,data0417.FASSET_NAME,data083' +
      '1.DeviType,data0831.MainCycl,'#13#10'                    data0831.Plan' +
      'MainDate,data0015.ABBR_NAME,data0034.DEPT_NAME'#13#10'FROM         dbo' +
      '.Data0821 INNER JOIN'#13#10'                      dbo.Data0017 ON dbo.' +
      'Data0821.Rkey17 = dbo.Data0017.RKEY INNER JOIN'#13#10'                ' +
      '      dbo.Data0002 ON dbo.Data0821.unit_ptr = dbo.Data0002.RKEY ' +
      'left JOIN'#13#10'                      dbo.Data0073 ON dbo.Data0821.Re' +
      'placeRkey73 = dbo.Data0073.RKEY INNER JOIN'#13#10'                    ' +
      '  Data0831 ON data0831.rkey = data0821.Rkey831 Inner join'#13#10'     ' +
      '                 data0417 on data0417.FASSET_CODE = data0831.Dev' +
      'iNumb Inner join '#13#10'                      data0015  on data0417.w' +
      'arehouse_ptr=data0015.rkey  left join '#13#10'                     dat' +
      'a0034  on data0417.DEPT_PTR=data0034.rkey '#13#10'where 1=1'
    IndexFieldNames = 'FASSET_CODE'
    Parameters = <>
    Left = 80
    Top = 296
    object ADS821FASSET_CODE: TStringField
      DisplayLabel = #35774#22791#20195#30721
      FieldName = 'FASSET_CODE'
      ReadOnly = True
    end
    object ADS821FASSET_NAME: TStringField
      DisplayLabel = #35774#22791#21517#31216
      FieldName = 'FASSET_NAME'
      ReadOnly = True
      Size = 30
    end
    object ADS821DeviType: TStringField
      DisplayLabel = #20445#20859#31867#22411
      FieldName = 'DeviType'
      ReadOnly = True
      Size = 10
    end
    object ADS821MainCycl: TStringField
      DisplayLabel = #20445#20859#21608#26399
      FieldName = 'MainCycl'
      ReadOnly = True
      Size = 10
    end
    object ADS821PlanMainDate: TDateTimeField
      DisplayLabel = #35745#21010#20445#20859#26102#38388
      FieldName = 'PlanMainDate'
      ReadOnly = True
    end
    object ADS821INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#20195#30721
      FieldName = 'INV_PART_NUMBER'
      ReadOnly = True
      Size = 25
    end
    object ADS821INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      ReadOnly = True
      Size = 30
    end
    object ADS821INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35215#26684
      FieldName = 'INV_DESCRIPTION'
      ReadOnly = True
      Size = 70
    end
    object ADS821QUAN_ON_HAND: TBCDField
      DisplayLabel = #24403#21069#24211#23384
      FieldName = 'QUAN_ON_HAND'
      ReadOnly = True
      Precision = 19
    end
    object ADS821ValidateQuantity: TBCDField
      DisplayLabel = #26377#25928#24211#23384
      FieldName = 'ValidateQuantity'
      ReadOnly = True
      Precision = 20
    end
    object ADS821Quantity: TFloatField
      DisplayLabel = #38656#35201#26356#25442#25968#37327
      FieldName = 'Quantity'
      ReadOnly = True
    end
    object ADS821ReplaceQuantity: TFloatField
      DisplayLabel = #24050#26356#25442#25968#37327
      FieldName = 'ReplaceQuantity'
    end
    object ADS821NeedReplaceQuantity: TFloatField
      DisplayLabel = #36824#26410#26356#25442#25968#37327
      FieldName = 'NeedReplaceQuantity'
      ReadOnly = True
    end
    object ADS821UNIT_NAME: TStringField
      DisplayLabel = #21333#20301#21517#31216
      FieldName = 'UNIT_NAME'
      ReadOnly = True
    end
    object ADS821IfmustReplace: TBooleanField
      DisplayLabel = #26159#21542#24517#39035#26356#25442
      FieldName = 'IfmustReplace'
      ReadOnly = True
    end
    object ADS821USER_FULL_NAME: TStringField
      DisplayLabel = #26356#25442#26448#26009#20154#21592
      FieldName = 'USER_FULL_NAME'
      ReadOnly = True
      Size = 30
    end
    object ADS821ReplaceDate: TDateTimeField
      DisplayLabel = #26356#25442#26085#26399
      FieldName = 'ReplaceDate'
    end
    object ADS821Rkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object ADS821Rkey831: TIntegerField
      FieldName = 'Rkey831'
    end
    object ADS821Rkey17: TIntegerField
      FieldName = 'Rkey17'
    end
    object ADS821unit_ptr: TIntegerField
      FieldName = 'unit_ptr'
    end
    object ADS821ReplaceRkey73: TIntegerField
      FieldName = 'ReplaceRkey73'
    end
    object ADS821NeedReplaceQuantitys: TFloatField
      DisplayLabel = #36824#26410#26356#25442#25968#37327
      FieldKind = fkCalculated
      FieldName = 'NeedReplaceQuantitys'
      Calculated = True
    end
    object ADS821ABBR_NAME: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'ABBR_NAME'
      ReadOnly = True
      Size = 10
    end
    object ADS821DEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'DEPT_NAME'
      ReadOnly = True
      Size = 30
    end
    object ADS821CreateDate: TDateTimeField
      DisplayLabel = #21019#24314#26085#26399
      FieldName = 'CreateDate'
      ReadOnly = True
    end
  end
  object DS821: TDataSource
    DataSet = ADS821
    Left = 80
    Top = 360
  end
  object ds821_old: TDataSource
    DataSet = ads821_Old
    Left = 160
    Top = 360
  end
  object ads821_Old: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    OnCalcFields = ads821_OldCalcFields
    CommandText = 
      'SELECT     dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, ' +
      'dbo.Data0017.INV_DESCRIPTION, dbo.Data0017.QUAN_ON_HAND, '#13#10'     ' +
      '                 (dbo.Data0017.QUAN_ON_HAND-dbo.Data0017.QUAN_AS' +
      'SIGN) as ValidateQuantity, dbo.Data0821.Quantity, dbo.Data0821.I' +
      'fmustReplace,'#13#10'                      dbo.Data0821.ReplaceQuantit' +
      'y,(dbo.Data0821.Quantity-dbo.Data0821.ReplaceQuantity) as NeedRe' +
      'placeQuantity, dbo.Data0002.UNIT_NAME, '#13#10'                      d' +
      'bo.Data0073.USER_FULL_NAME,dbo.Data0821.ReplaceDate,Data0821.Cre' +
      'ateDate,dbo.Data0821.Rkey, dbo.Data0821.Rkey831, dbo.Data0821.Rk' +
      'ey17, '#13#10'                     dbo.Data0821.unit_ptr, dbo.Data0821' +
      '.ReplaceRkey73,data0417.FASSET_CODE,data0417.FASSET_NAME,data083' +
      '1.DeviType,data0831.MainCycl,'#13#10'                    data0831.Plan' +
      'MainDate,data0015.ABBR_NAME,data0034.DEPT_NAME'#13#10'FROM         dbo' +
      '.Data0821 INNER JOIN'#13#10'                      dbo.Data0017 ON dbo.' +
      'Data0821.Rkey17 = dbo.Data0017.RKEY INNER JOIN'#13#10'                ' +
      '      dbo.Data0002 ON dbo.Data0821.unit_ptr = dbo.Data0002.RKEY ' +
      'left JOIN'#13#10'                      dbo.Data0073 ON dbo.Data0821.Re' +
      'placeRkey73 = dbo.Data0073.RKEY INNER JOIN'#13#10'                    ' +
      '  Data0831 ON data0831.rkey = data0821.Rkey831 Inner join'#13#10'     ' +
      '                 data0417 on data0417.FASSET_CODE = data0831.Dev' +
      'iNumb Inner join '#13#10'                      data0015  on data0417.w' +
      'arehouse_ptr=data0015.rkey  left join '#13#10'                     dat' +
      'a0034  on data0417.DEPT_PTR=data0034.rkey '#13#10'where 1=1'
    IndexFieldNames = 'FASSET_CODE'
    Parameters = <>
    Left = 160
    Top = 296
    object ads821_OldINV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#20195#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ads821_OldINV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ads821_OldINV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35215#26684
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ads821_OldQUAN_ON_HAND: TBCDField
      DisplayLabel = #24403#21069#24211#23384
      FieldName = 'QUAN_ON_HAND'
      Precision = 19
    end
    object ads821_OldValidateQuantity: TBCDField
      DisplayLabel = #26377#25928#24211#23384
      FieldName = 'ValidateQuantity'
      ReadOnly = True
      Precision = 20
    end
    object ads821_OldQuantity: TFloatField
      DisplayLabel = #38656#35201#26356#25442#25968#37327
      FieldName = 'Quantity'
    end
    object ads821_OldIfmustReplace: TBooleanField
      DisplayLabel = #26159#21542#24517#39035#26356#25442
      FieldName = 'IfmustReplace'
    end
    object ads821_OldReplaceQuantity: TFloatField
      DisplayLabel = #24050#26356#25442#25968#37327
      FieldName = 'ReplaceQuantity'
    end
    object ads821_OldNeedReplaceQuantity: TFloatField
      DisplayLabel = #24050#26356#25442#25968#37327
      FieldName = 'NeedReplaceQuantity'
      ReadOnly = True
    end
    object ads821_OldUNIT_NAME: TStringField
      DisplayLabel = #21333#20301#21517#31216
      FieldName = 'UNIT_NAME'
    end
    object ads821_OldUSER_FULL_NAME: TStringField
      DisplayLabel = #26356#25442#26448#26009#20154#21592
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object ads821_OldReplaceDate: TDateTimeField
      DisplayLabel = #26356#25442#26085#26399
      FieldName = 'ReplaceDate'
    end
    object ads821_OldCreateDate: TDateTimeField
      DisplayLabel = #21019#24314#26085#26399
      FieldName = 'CreateDate'
    end
    object ads821_OldRkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object ads821_OldRkey831: TIntegerField
      FieldName = 'Rkey831'
    end
    object ads821_OldRkey17: TIntegerField
      FieldName = 'Rkey17'
    end
    object ads821_Oldunit_ptr: TIntegerField
      FieldName = 'unit_ptr'
    end
    object ads821_OldReplaceRkey73: TIntegerField
      FieldName = 'ReplaceRkey73'
    end
    object ads821_OldFASSET_CODE: TStringField
      DisplayLabel = #35774#22791#20195#30721
      FieldName = 'FASSET_CODE'
    end
    object ads821_OldFASSET_NAME: TStringField
      DisplayLabel = #35774#22791#21517#31216
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object ads821_OldDeviType: TStringField
      DisplayLabel = #20445#20859#31867#22411
      FieldName = 'DeviType'
      Size = 10
    end
    object ads821_OldMainCycl: TStringField
      DisplayLabel = #20445#20859#21608#26399
      FieldName = 'MainCycl'
      Size = 10
    end
    object ads821_OldPlanMainDate: TDateTimeField
      DisplayLabel = #35745#21010#20445#20859#26102#38388
      FieldName = 'PlanMainDate'
    end
    object ads821_OldABBR_NAME: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ads821_OldDEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ads821_OldNeedReplaceQuantitys: TFloatField
      DisplayLabel = #36824#26410#26356#25442#25968#37327
      FieldKind = fkCalculated
      FieldName = 'NeedReplaceQuantitys'
      Calculated = True
    end
  end
end
