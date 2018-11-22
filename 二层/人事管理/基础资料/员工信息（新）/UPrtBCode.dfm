object frmPrtBCode: TfrmPrtBCode
  Left = 549
  Top = 268
  Width = 433
  Height = 277
  Caption = 'frmPrtBCode'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pdbprtempcode: TppDBPipeline
    DataSource = dsDS1
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'pdbprtempcode'
    Left = 168
    Top = 16
    object pdbprtempcodeppField1: TppField
      FieldAlias = 'employeecode'
      FieldName = 'employeecode'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
  end
  object dsDS1: TDataSource
    DataSet = qryEmpCode
    Left = 88
    Top = 16
  end
  object qryEmpCode: TADOQuery
    Connection = FDM.con1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select   employeecode    from employeemsg where  rkey=:rkey')
    Left = 32
    Top = 16
    object wdstrngfldEmpCodeemployeecode: TWideStringField
      FieldName = 'employeecode'
    end
  end
  object prprt1: TppReport
    AutoStop = False
    DataPipeline = pdbprtempcode
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 30000
    PrinterSetup.mmPaperWidth = 70000
    PrinterSetup.PaperSize = 256
    Template.FileName = 'D:\SJSYS\NIERP\Report\employeemsg_empBarCode.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 232
    Top = 16
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'pdbprtempcode'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 16933
      mmPrintPosition = 0
      object pdbrcd1: TppDBBarCode
        UserName = 'pdbrcd1'
        BarCodeType = bcCode39
        BarColor = clWindowText
        DataField = 'employeecode'
        DataPipeline = pdbprtempcode
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pdbprtempcode'
        mmHeight = 16140
        mmLeft = 5027
        mmTop = 529
        mmWidth = 47625
        BandType = 4
        mmBarWidth = 254
        mmWideBarRatio = 76200
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
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
    Report = prprt1
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 232
    Top = 80
  end
end
