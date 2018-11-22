object FrmReport11: TFrmReport11
  Left = 383
  Top = 352
  Width = 351
  Height = 211
  Caption = #30452#25509#37319#36141#36135#21697#25910#36135#21333
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
    Top = 47
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
    Left = 121
    Top = 82
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
      'select data0496.group_name,data0019.inv_group_name,'
      'data0022.exchange_rate,data0022.price,data0017.inv_part_number,'
      
        'data0017.inv_part_description,data0002.unit_code,data0001.curr_c' +
        'ode,'
      'data0456.ref_number,data0456.grn_number,data0022.tdate,'
      'data0023.code,data0023.supplier_name,'
      'data0015.warehouse_code,data0005.employee_name,'
      
        'sum(data0022.quantity) as qty1,sum(data0022.quantity*data0022.pr' +
        'ice/data0022.exchange_rate) as amount'
      'From data0022,data0017,data0002,data0001,data0023,'
      'data0015,data0456,data0496,data0019,data0005'
      'where data0022.grn_ptr=data0456.rkey'
      'and data0456.rkey=:vptr'
      'and data0022.ttype=3'
      'and data0022.quantity>0'
      'and data0022.inventory_ptr=data0017.rkey'
      'and data0017.group_ptr=data0496.rkey'
      'and data0496.group_ptr=data0019.rkey'
      'and data0022.currency_ptr=data0001.rkey'
      'and data0022.supplier_ptr=data0023.rkey'
      'and data0017.stock_unit_ptr=data0002.rkey'
      'and data0022.whouse_ptr=data0015.rkey'
      'and data0456.create_by=data0005.rkey'
      'group by'
      'data0496.group_name,data0019.inv_group_name,'
      'data0022.exchange_rate,data0022.price,data0017.inv_part_number,'
      
        'data0017.inv_part_description,data0002.unit_code,data0001.curr_c' +
        'ode,'
      'data0456.ref_number,data0456.grn_number,data0022.tdate,'
      'data0023.code,data0023.supplier_name,'
      'data0015.warehouse_code,data0005.employee_name'
      'order by'
      'data0496.group_name,data0019.inv_group_name,'
      'data0022.exchange_rate,data0022.price,data0017.inv_part_number,'
      
        'data0017.inv_part_description,data0002.unit_code,data0001.curr_c' +
        'ode,'
      'data0456.ref_number,data0456.grn_number,data0022.tdate,'
      'data0023.code,data0023.supplier_name,'
      'data0015.warehouse_code'
      '')
    Left = 120
    Top = 48
  end
  object Data0493: TppDBPipeline
    DataSource = DataSource4
    UserName = 'DBCompany'
    Left = 192
    Top = 80
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = DataSource3
    UserName = 'DBDetail'
    Left = 192
    Top = 48
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
    Template.DatabaseSettings.DataPipeline = ppDBPipeline1
    Template.FileName = 'R:\NIERP\Report\GRN3.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppReport1PreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 232
    Top = 56
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
    Left = 240
    Top = 96
  end
end
