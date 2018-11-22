object DM: TDM
  OldCreateOrder = False
  Left = 426
  Top = 222
  Height = 556
  Width = 735
  object cdsRead: TClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 304
    Top = 24
  end
  object ADOConnection1: TADOConnection
    ConnectionTimeout = 30
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 24
  end
  object dspRead: TDataSetProvider
    DataSet = dtRead
    Options = [poAllowCommandText]
    Left = 240
    Top = 28
  end
  object cds0004: TClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    PacketRecords = 100
    Params = <>
    ProviderName = 'dsp0004'
    Left = 304
    Top = 104
  end
  object dt0004: TADODataSet
    Connection = ADOConnection1
    Parameters = <>
    Left = 174
    Top = 108
  end
  object dsp0004: TDataSetProvider
    DataSet = dt0004
    Options = [poAllowCommandText]
    Left = 240
    Top = 108
  end
  object dtRead1: TADODataSet
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    Left = 174
    Top = 172
  end
  object dtReadDate: TADODataSet
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    Left = 174
    Top = 236
  end
  object dspReadDate: TDataSetProvider
    DataSet = dtReadDate
    Options = [poAllowCommandText]
    Left = 248
    Top = 236
  end
  object cdsReadDate: TClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspReadDate'
    ReadOnly = True
    Left = 316
    Top = 232
  end
  object dtRead: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      ' select data0849.* from data0849 '#13#10' join data0419 on data0849.[D' +
      '419_ptr]=data0419.[rkey]'#13#10' where data0419.programe=:vPrograme an' +
      'd data0849.[D073_ptr]=:vD073_ptr'#13#10'order by data0849 .[FieldOrder' +
      ']'
    Parameters = <
      item
        Name = 'vPrograme'
        DataType = ftFloat
        Value = 0.000000000000000000
      end
      item
        Name = 'vD073_ptr'
        DataType = ftSmallint
        Value = 0
      end>
    Left = 174
    Top = 28
  end
  object dspRead1: TDataSetProvider
    DataSet = dtRead1
    Options = [poAllowCommandText]
    Left = 240
    Top = 173
  end
  object cdsRead1: TClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 304
    Top = 169
  end
  object dtReadRkey: TADODataSet
    Connection = ADOConnection1
    Parameters = <>
    Left = 72
    Top = 152
  end
  object qry0843_delete: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'Work_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from DATA0843 where [Work_ptr]=:Work_ptr')
    Left = 352
    Top = 456
    object qry0843_deleteRkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object qry0843_deleteWork_ptr: TIntegerField
      FieldName = 'Work_ptr'
    end
    object qry0843_deletestop_begin_date: TDateTimeField
      FieldName = 'stop_begin_date'
    end
    object qry0843_deletestop_end_date: TDateTimeField
      FieldName = 'stop_end_date'
    end
    object qry0843_deleteremark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
  end
  object qry0843ResultTime_delete: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
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
      '/*'#21151#33021#35828#26126#65292#20256#20837#24320#22987#26102#38388#12289#32467#26463#26102#38388#65292#36820#22238#36825'2'#20010#26102#38388#27573#30340#24037#20316#26102#38388#65292#25187#38500#20013#36884#20241#24687'*/'
      'declare @beginTime datetime,@EndTime datetime,@SumTime dec(9,2)'
      'set @beginTime=:vbeginTime'
      'set @EndTime=:vEndTime'
      'set @SumTime=0'
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
        'onvert(nvarchar(8),@EndTime,14)))as dec(9,2))   '
      'SELECT (datediff( minute ,@beginTime,@EndTime)-@SumTime)/60')
    Left = 416
    Top = 464
  end
  object cdsClone: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 256
    Top = 312
  end
  object cds0849_Delete: TClientDataSet
    Aggregates = <>
    CommandText = 
      ' select data0849.* from data0849 '#13#10' join data0419 on data0849.[D' +
      '419_ptr]=data0419.[rkey]'#13#10' where data0419.programe=:vPrograme an' +
      'd data0849.[D073_ptr]=:vD073_ptr '#13#10#13#10'order by data0849 .[FieldOr' +
      'der]'
    FilterOptions = [foCaseInsensitive]
    IndexFieldNames = 'FieldOrder'
    FetchOnDemand = False
    Params = <
      item
        DataType = ftFloat
        Name = 'vPrograme'
        ParamType = ptUnknown
        Value = 0.000000000000000000
      end
      item
        DataType = ftInteger
        Name = 'vD073_ptr'
        ParamType = ptUnknown
        Value = 0
      end>
    ProviderName = 'dsp0849'
    Left = 256
    Top = 452
    object cds0849_DeleteD419_ptr: TIntegerField
      FieldName = 'D419_ptr'
    end
    object cds0849_DeleteD073_ptr: TIntegerField
      FieldName = 'D073_ptr'
    end
    object cds0849_DeleteFormName: TStringField
      DisplayLabel = #31383#20307#21517
      FieldName = 'FormName'
      Size = 50
    end
    object cds0849_DeleteGridName: TStringField
      FieldName = 'GridName'
      Size = 50
    end
    object cds0849_DeleteFieldName: TStringField
      FieldName = 'FieldName'
      Size = 50
    end
    object cds0849_DeleteFieldCaption: TStringField
      DisplayLabel = #23383#27573#21517
      FieldName = 'FieldCaption'
      Size = 100
    end
    object cds0849_DeleteFieldOrder: TIntegerField
      DisplayLabel = #39034#24207
      FieldName = 'FieldOrder'
      OnChange = cds0849_DeleteFieldOrderChange
    end
    object cds0849_DeleteFieldWidth: TIntegerField
      DisplayLabel = #23485#24230
      FieldName = 'FieldWidth'
    end
    object cds0849_DeleteIsDisplay: TBooleanField
      DisplayLabel = #26159#21542#26174#31034
      FieldName = 'IsDisplay'
    end
  end
  object dt0849_Delete: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from data0860'
    Parameters = <
      item
        Name = 'vPrograme'
        DataType = ftFloat
        Value = 0.000000000000000000
      end
      item
        Name = 'vD073_ptr'
        DataType = ftSmallint
        Value = 0
      end>
    Left = 108
    Top = 452
    object dt0849_DeleteD419_ptr: TIntegerField
      FieldName = 'D419_ptr'
    end
    object dt0849_DeleteD073_ptr: TIntegerField
      FieldName = 'D073_ptr'
    end
    object dt0849_DeleteGridName: TStringField
      FieldName = 'GridName'
      Size = 50
    end
    object dt0849_DeleteFieldName: TStringField
      FieldName = 'FieldName'
      Size = 50
    end
    object dt0849_DeleteFieldCaption: TStringField
      FieldName = 'FieldCaption'
      Size = 100
    end
    object dt0849_DeleteFieldOrder: TIntegerField
      FieldName = 'FieldOrder'
    end
    object dt0849_DeleteFieldWidth: TIntegerField
      FieldName = 'FieldWidth'
    end
    object dt0849_DeleteIsDisplay: TBooleanField
      FieldName = 'IsDisplay'
    end
    object dt0849_DeleteFormName: TStringField
      FieldName = 'FormName'
      Size = 50
    end
  end
  object dsp0849_Delete: TDataSetProvider
    DataSet = dt0849_Delete
    Options = [poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 186
    Top = 452
  end
  object cdsTemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 320
    Top = 312
  end
end
