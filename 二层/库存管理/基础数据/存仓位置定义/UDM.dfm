object DM: TDM
  OldCreateOrder = False
  Left = 710
  Top = 348
  Height = 308
  Width = 391
  object con1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 8
    Top = 16
  end
  object qry_temp: TADOQuery
    Connection = con1
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 112
    Top = 32
  end
  object qry_rpt: TADOQuery
    Connection = con1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      ' select  location  from DATA0176  where 1=0')
    Left = 24
    Top = 176
    object qry_rptlocation: TWideStringField
      FieldName = 'location'
    end
  end
  object ds_rpt: TDataSource
    DataSet = qry_rpt
    Left = 80
    Top = 176
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
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 240
    Top = 168
  end
  object pdbprt1: TppDBPipeline
    DataSource = ds_rpt
    UserName = 'pdbprt1'
    Left = 176
    Top = 184
    object pdbprt1ppField1: TppField
      FieldAlias = 'location'
      FieldName = 'location'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
  end
  object ppRpt: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 0
    PrinterSetup.mmMarginLeft = 0
    PrinterSetup.mmMarginRight = 0
    PrinterSetup.mmMarginTop = 0
    PrinterSetup.mmPaperHeight = 70000
    PrinterSetup.mmPaperWidth = 100000
    PrinterSetup.PaperSize = 256
    SaveAsTemplate = True
    Template.FileName = 'D:\SJSYS\NIERP\Report\EP176.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 296
    Top = 64
    Version = '7.01'
    mmColumnWidth = 0
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 69056
      mmPrintPosition = 0
      object ppimg1: TppImage
        UserName = 'ppimg1'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 24871
        mmLeft = 6085
        mmTop = 17463
        mmWidth = 24871
        BandType = 4
      end
      object pplbl2: TppLabel
        UserName = 'lbl2'
        Caption = #20179#20648#20301#32622
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 36
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 32279
        mmLeft = 33867
        mmTop = 29104
        mmWidth = 61913
        BandType = 4
      end
      object pplbl1: TppLabel
        UserName = 'lbl1'
        Caption = #20179#24211#21517#31216
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 36
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 14817
        mmLeft = 33867
        mmTop = 12700
        mmWidth = 63500
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 265
      mmPrintPosition = 0
    end
  end
end
