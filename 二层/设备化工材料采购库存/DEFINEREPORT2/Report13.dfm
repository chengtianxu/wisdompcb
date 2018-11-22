object FrmReport13: TFrmReport13
  Left = 408
  Top = 285
  Width = 351
  Height = 211
  Caption = #26631#20934#37319#36141#26434#39033#26448#26009#25910#36135#21333
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DataSource3: TDataSource
    DataSet = ADO1
    Left = 159
    Top = 43
  end
  object DataSource4: TDataSource
    DataSet = ADOData0493
    Left = 159
    Top = 80
  end
  object ADOData0493: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from data0493'#13#10
    Parameters = <>
    Left = 123
    Top = 81
  end
  object ADO1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'vptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 63
      end>
    Prepared = True
    SQL.Strings = (
      
        'Select data0456.grn_number,data0456.ref_number,data0023.code,dat' +
        'a0023.supplier_name,'
      
        'data0023.analysis_code1,data0023.analysis_code2,data0023.analysi' +
        's_code3,'
      'data0070.po_number,data0072.description,data0072.description2,'
      'data0072.quan_ord,data0072.quantity_received,data0072.del_date,'
      'data0072.unit_price,data0001.curr_code,data0070.exchange_rate,'
      
        'data0070.fob,DATA0002.UNIT_CODE,DATA0070.PO_DATE,data0235.date_r' +
        'ecd,'
      
        'data0235.quan_recd,data0015.warehouse_name,data0072.GUI_GE,data0' +
        '005.employee_name,'
      
        'data0235.quan_recd*data0072.unit_price/data0070.exchange_rate as' +
        ' amount,'
      
        'data0070.analysis_code_1,data0070.analysis_code_2,data0070.analy' +
        'sis_code_3,'
      'data0070.analysis_code_4,data0070.analysis_code_5'
      'from data0072,data0070,data0002,data0001,data0235,'
      'data0023,data0456,data0015,data0005'
      'where '
      'data0072.poptr=data0070.rkey'
      'and data0072.unit_ptr=data0002.rkey'
      'and data0070.currency_ptr=data0001.rkey'
      'and data0235.d0072_ptr=data0072.rkey'
      'and data0070.supplier_pointer=data0023.rkey'
      'and data0070.warehouse_pointer=data0015.rkey'
      'and data0235.grn_ptr=data0456.rkey'
      'and data0456.rkey=:vptr'
      'and data0456.create_by=data0005.rkey'
      'order by'
      'data0072.description'
      '')
    Left = 123
    Top = 44
    object ADO1grn_number: TStringField
      FieldName = 'grn_number'
      FixedChar = True
      Size = 10
    end
    object ADO1ref_number: TStringField
      FieldName = 'ref_number'
      Size = 15
    end
    object ADO1code: TStringField
      FieldName = 'code'
      Size = 10
    end
    object ADO1supplier_name: TStringField
      FieldName = 'supplier_name'
      Size = 40
    end
    object ADO1analysis_code1: TStringField
      FieldName = 'analysis_code1'
    end
    object ADO1analysis_code2: TStringField
      FieldName = 'analysis_code2'
    end
    object ADO1analysis_code3: TStringField
      FieldName = 'analysis_code3'
    end
    object ADO1po_number: TStringField
      FieldName = 'po_number'
      Size = 15
    end
    object ADO1description: TStringField
      FieldName = 'description'
      Size = 60
    end
    object ADO1description2: TStringField
      FieldName = 'description2'
      FixedChar = True
    end
    object ADO1quan_ord: TFloatField
      FieldName = 'quan_ord'
    end
    object ADO1quantity_received: TFloatField
      FieldName = 'quantity_received'
    end
    object ADO1del_date: TDateTimeField
      FieldName = 'del_date'
    end
    object ADO1unit_price: TFloatField
      FieldName = 'unit_price'
    end
    object ADO1curr_code: TStringField
      FieldName = 'curr_code'
      Size = 5
    end
    object ADO1exchange_rate: TFloatField
      FieldName = 'exchange_rate'
    end
    object ADO1fob: TStringField
      FieldName = 'fob'
      Size = 15
    end
    object ADO1UNIT_CODE: TStringField
      FieldName = 'UNIT_CODE'
      Size = 5
    end
    object ADO1PO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object ADO1date_recd: TDateTimeField
      FieldName = 'date_recd'
    end
    object ADO1quan_recd: TFloatField
      FieldName = 'quan_recd'
    end
    object ADO1warehouse_name: TStringField
      FieldName = 'warehouse_name'
      Size = 70
    end
    object ADO1GUI_GE: TStringField
      FieldName = 'GUI_GE'
      Size = 200
    end
    object ADO1employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object ADO1amount: TFloatField
      FieldName = 'amount'
      ReadOnly = True
    end
    object ADO1analysis_code_1: TStringField
      FieldName = 'analysis_code_1'
    end
    object ADO1analysis_code_2: TStringField
      FieldName = 'analysis_code_2'
    end
    object ADO1analysis_code_3: TStringField
      FieldName = 'analysis_code_3'
    end
    object ADO1analysis_code_4: TStringField
      FieldName = 'analysis_code_4'
    end
    object ADO1analysis_code_5: TStringField
      FieldName = 'analysis_code_5'
    end
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = DataSource3
    OpenDataSource = False
    UserName = 'DBDetail'
    Left = 192
    Top = 43
  end
  object Data0493: TppDBPipeline
    DataSource = DataSource4
    OpenDataSource = False
    UserName = 'DBCompany'
    Left = 192
    Top = 80
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4 210 x 297 '#27627#31859
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    SaveAsTemplate = True
    Template.FileName = 'R:\NIERP\Report\GRN2.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppReport1PreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 232
    Top = 48
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
  end
  object ppDesigner1: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = ppReport1
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 264
    Top = 48
  end
end
