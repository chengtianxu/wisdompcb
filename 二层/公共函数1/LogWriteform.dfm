object LogWritefrm: TLogWritefrm
  Left = 486
  Top = 202
  BorderStyle = bsDialog
  Caption = #26085#24535
  ClientHeight = 400
  ClientWidth = 501
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 501
    Height = 137
    Align = alTop
    DataSource = DataSource1
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'USER_LOGIN_NAME'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USER_FULL_NAME'
        Width = 142
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OperDate'
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CompName'
        Width = 112
        Visible = True
      end>
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 137
    Width = 501
    Height = 263
    Align = alClient
    DataSource = DataSource2
    DrawMemoText = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'FieldName'
        Footers = <>
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'OldValue'
        Footers = <>
        Width = 180
      end
      item
        EditButtons = <>
        FieldName = 'NewValue'
        Footers = <>
        Width = 180
      end>
  end
  object cdsLog: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select data0073.USER_LOGIN_NAME,data0073.USER_FULL_NAME,data0860' +
      '.* '#13#10'from data0860 '#13#10'join data0859 on data0860.[D859_ptr]=data08' +
      '59.rkey'#13#10'join data0073 on data0860.[D073_ptr]=data0073.rkey'#13#10'whe' +
      're data0859.[TableName]=:TableName and data0860.[Row_ptr]=:Row_p' +
      'tr'
    FilterOptions = [foCaseInsensitive]
    FetchOnDemand = False
    Params = <
      item
        DataType = ftString
        Name = 'TableName'
        ParamType = ptUnknown
        Value = #39#39
      end
      item
        DataType = ftInteger
        Name = 'Row_ptr'
        ParamType = ptUnknown
        Value = '1'
      end>
    ProviderName = 'dspRead'
    ReadOnly = True
    AfterScroll = cdsLogAfterScroll
    Left = 30
    Top = 126
    object cdsLogUSER_LOGIN_NAME: TStringField
      DisplayLabel = #25805#20316#32773#20195#30721
      FieldName = 'USER_LOGIN_NAME'
      ProviderFlags = []
      Size = 15
    end
    object cdsLogUSER_FULL_NAME: TStringField
      DisplayLabel = #25805#20316#32773#22995#21517
      FieldName = 'USER_FULL_NAME'
      ProviderFlags = []
      Size = 30
    end
    object cdsLogD073_ptr: TIntegerField
      FieldName = 'D073_ptr'
    end
    object cdsLogOperDate: TDateTimeField
      DisplayLabel = #25805#20316#26085#26399
      FieldName = 'OperDate'
    end
    object cdsLogCompName: TStringField
      DisplayLabel = #30331#38470#30005#33041
      FieldName = 'CompName'
      Size = 50
    end
    object cdsLogRow_ptr: TIntegerField
      FieldName = 'Row_ptr'
    end
    object cdsLogD859_ptr: TIntegerField
      FieldName = 'D859_ptr'
    end
    object cdsLogRkey: TIntegerField
      FieldName = 'Rkey'
      ReadOnly = True
    end
  end
  object dspLog: TDataSetProvider
    DataSet = dtLog
    Options = [poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 231
    Top = 360
  end
  object dtLog: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from data0860 '#13#10#13#10'where 1=2'
    Parameters = <>
    Left = 131
    Top = 360
    object dtLogD859_ptr: TIntegerField
      FieldName = 'D859_ptr'
    end
    object dtLogRow_ptr: TIntegerField
      FieldName = 'Row_ptr'
    end
    object dtLogD073_ptr: TIntegerField
      FieldName = 'D073_ptr'
    end
    object dtLogOperDate: TDateTimeField
      FieldName = 'OperDate'
    end
    object dtLogCompName: TStringField
      FieldName = 'CompName'
      Size = 50
    end
  end
  object dtLogDetailed: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from data0861 where 1=2'
    Parameters = <>
    Left = 131
    Top = 433
    object dtLogDetailedRkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object dtLogDetailedD859_ptr: TIntegerField
      FieldName = 'D859_ptr'
    end
    object dtLogDetailedRow_ptr: TIntegerField
      FieldName = 'Row_ptr'
    end
    object dtLogDetailedFieldName: TStringField
      FieldName = 'FieldName'
      Size = 50
    end
    object dtLogDetailedOldValue: TMemoField
      FieldName = 'OldValue'
      BlobType = ftMemo
    end
    object dtLogDetailedNewValue: TMemoField
      FieldName = 'NewValue'
      BlobType = ftMemo
    end
  end
  object dspLogDetailed: TDataSetProvider
    DataSet = dtLogDetailed
    Options = [poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 230
    Top = 433
  end
  object DataSource1: TDataSource
    DataSet = cdsLog
    Left = 108
    Top = 126
  end
  object DataSource2: TDataSource
    DataSet = cdsLogDetailed
    Left = 108
    Top = 200
  end
  object cdsLogDetailed: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from data0861 '#13#10'where [D860_ptr]=:D860_ptr'
    Params = <
      item
        DataType = ftInteger
        Name = 'D860_ptr'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 30
    Top = 200
    object cdsLogDetailedRkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object cdsLogDetailedD860_ptr: TIntegerField
      FieldName = 'D860_ptr'
    end
    object cdsLogDetailedFieldName: TStringField
      DisplayLabel = #26639#20301
      FieldName = 'FieldName'
      Size = 50
    end
    object cdsLogDetailedNewValue: TMemoField
      DisplayLabel = #26032#20540
      FieldName = 'NewValue'
      BlobType = ftMemo
    end
    object cdsLogDetailedOldValue: TMemoField
      DisplayLabel = #21407#20540
      FieldName = 'OldValue'
      BlobType = ftMemo
    end
  end
  object cdsLog0: TClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspLog'
    Left = 330
    Top = 360
  end
  object cdsLogDetailed0: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLogDetailed'
    Left = 330
    Top = 433
  end
  object dtRead: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'select data0073.USER_LOGIN_NAME,data0073.USER_FULL_NAME,data0860' +
      '.* '#13#10'from data0860 '#13#10'join data0859 on data0860.[D859_ptr]=data08' +
      '59.rkey'#13#10'join data0073 on data0860.[D073_ptr]=data0073.rkey'#13#10'whe' +
      're data0859.[TableName]=:TableName and data0860.[Row_ptr]=:Row_p' +
      'tr'
    Parameters = <
      item
        Name = 'TableName'
        DataType = ftString
        Size = 2
        Value = #39#39
      end
      item
        Name = 'Row_ptr'
        DataType = ftString
        Size = 1
        Value = '1'
      end>
    Left = 30
    Top = 52
  end
  object dspRead: TDataSetProvider
    DataSet = dtRead
    Options = [poAllowCommandText]
    Left = 108
    Top = 52
  end
  object cdsLog1: TClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspLog'
    Left = 431
    Top = 360
  end
  object cdsLogDetailed1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLogDetailed'
    Left = 427
    Top = 433
  end
  object qryD859: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'TableName'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @TableName varchar(20) '
      'set @TableName=:TableName'
      
        'if not exists(select *from data0859 where [TableName]=@TableName' +
        ')'
      'insert into data0859([TableName])'
      'values(@TableName)'
      'select *from data0859 where [TableName]=@TableName')
    Left = 368
    Top = 56
  end
  object TempCDS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 216
    Top = 184
  end
  object TempCDS1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 304
    Top = 184
  end
  object ADOCommand1: TADOCommand
    Connection = DM.ADOConnection1
    Parameters = <>
    Left = 216
    Top = 56
  end
end
