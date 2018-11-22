object FrmReport16: TFrmReport16
  Left = 321
  Top = 398
  Width = 351
  Height = 210
  Caption = #20986#20179#21333'-'#21040#37096#38376'/'#24037#24207
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DataSource4: TDataSource
    DataSet = ADOData0493
    Left = 159
    Top = 76
  end
  object ADOData0493: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'select * from data0493'#13#10
    Parameters = <>
    Left = 121
    Top = 76
  end
  object Data0493: TppDBPipeline
    DataSource = DataSource4
    UserName = 'DBCompany'
    Left = 192
    Top = 76
  end
  object DataSource3: TDataSource
    DataSet = ADO1
    Left = 159
    Top = 43
  end
  object ADO1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'vptr'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 63
      end>
    SQL.Strings = (
      
        'select data0017.inv_part_number,data0017.inv_part_description,da' +
        'ta0002.unit_code,data0034.dept_code,'
      
        'data0022.barcode_id,data0015.warehouse_code,data0207.quantity,da' +
        'ta0207.tdate,data0023.code,'
      
        'data0023.abbr_name,data0023.supplier_name,data0023.analysis_code' +
        '1,data0023.analysis_code2,data0023.analysis_code3'
      
        'from data0207,data0017,data0002,data0034,data0022,data0015,data0' +
        '023'
      'where data0207.inventory_ptr=data0017.rkey'
      'and data0017.stock_unit_ptr=data0002.rkey'
      'and data0207.dept_ptr=data0034.rkey'
      'and data0207.d0022_ptr=data0022.rkey'
      'and data0022.whouse_ptr=data0015.rkey'
      'and data0022.supplier_ptr=data0023.rkey'
      'and data0207.gon_ptr=:vptr'
      'order by data0017.inv_part_number'
      '')
    Left = 120
    Top = 40
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = DataSource3
    UserName = 'DBDetail'
    Left = 192
    Top = 40
    object ppDBPipeline1ppField1: TppField
      FieldAlias = 'inv_part_number'
      FieldName = 'inv_part_number'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      FieldAlias = 'inv_part_description'
      FieldName = 'inv_part_description'
      FieldLength = 40
      DisplayWidth = 40
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      FieldAlias = 'unit_code'
      FieldName = 'unit_code'
      FieldLength = 5
      DisplayWidth = 5
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      FieldAlias = 'dept_code'
      FieldName = 'dept_code'
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
    object ppDBPipeline1ppField5: TppField
      FieldAlias = 'barcode_id'
      FieldName = 'barcode_id'
      FieldLength = 12
      DisplayWidth = 12
      Position = 4
    end
    object ppDBPipeline1ppField6: TppField
      FieldAlias = 'warehouse_code'
      FieldName = 'warehouse_code'
      FieldLength = 5
      DisplayWidth = 5
      Position = 5
    end
    object ppDBPipeline1ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'quantity'
      FieldName = 'quantity'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppDBPipeline1ppField8: TppField
      FieldAlias = 'tdate'
      FieldName = 'tdate'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 7
    end
    object ppDBPipeline1ppField9: TppField
      FieldAlias = 'code'
      FieldName = 'code'
      FieldLength = 5
      DisplayWidth = 5
      Position = 8
    end
    object ppDBPipeline1ppField10: TppField
      FieldAlias = 'abbr_name'
      FieldName = 'abbr_name'
      FieldLength = 10
      DisplayWidth = 10
      Position = 9
    end
    object ppDBPipeline1ppField11: TppField
      FieldAlias = 'supplier_name'
      FieldName = 'supplier_name'
      FieldLength = 30
      DisplayWidth = 30
      Position = 10
    end
    object ppDBPipeline1ppField12: TppField
      FieldAlias = 'analysis_code1'
      FieldName = 'analysis_code1'
      FieldLength = 20
      DisplayWidth = 20
      Position = 11
    end
    object ppDBPipeline1ppField13: TppField
      FieldAlias = 'analysis_code2'
      FieldName = 'analysis_code2'
      FieldLength = 20
      DisplayWidth = 20
      Position = 12
    end
    object ppDBPipeline1ppField14: TppField
      FieldAlias = 'analysis_code3'
      FieldName = 'analysis_code3'
      FieldLength = 20
      DisplayWidth = 20
      Position = 13
    end
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
    Template.FileName = 'R:\NIERP\Report\GON2.rtm'
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
    Left = 240
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
    Left = 280
    Top = 56
  end
end
