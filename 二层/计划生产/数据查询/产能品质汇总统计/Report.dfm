object FrmRep: TFrmRep
  Left = 317
  Top = 184
  Width = 315
  Height = 167
  Caption = 'FrmRep'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object prprt1: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Letter'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\Documents and Settings\Admin\'#26700#38754'\'#26032#24314#25991#20214#22841'\729report.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 224
    Top = 40
    Version = '7.01'
    mmColumnWidth = 0
    object phdrbnd1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23813
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = #37096#38376
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 4763
        mmTop = 15346
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = #26085#30446#26631#20135#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 32544
        mmTop = 15346
        mmWidth = 20902
        BandType = 0
      end
    end
    object pdtlbnd1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = #37096#38376
        DataPipeline = pdbpln2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pdbpln2'
        mmHeight = 4763
        mmLeft = 5292
        mmTop = 794
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = #26085#30446#26631#20135#37327
        DataPipeline = pdbpln2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pdbpln2'
        mmHeight = 4763
        mmLeft = 30427
        mmTop = 529
        mmWidth = 32808
        BandType = 4
      end
    end
    object pftrbnd1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
  object pdsgnr1: TppDesigner
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
    Left = 176
    Top = 40
  end
  object pdbpln2: TppDBPipeline
    DataSource = ds1
    UserName = 'pdbpln2'
    Left = 128
    Top = 40
    object pdbpln2ppField1: TppField
      FieldAlias = #37096#38376
      FieldName = #37096#38376
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pdbpln2ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = #26085#30446#26631#20135#37327
      FieldName = #26085#30446#26631#20135#37327
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pdbpln2ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = #26085#23454#38469#20135#37327
      FieldName = #26085#23454#38469#20135#37327
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pdbpln2ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = #26085#20135#37327#36798#25104#29575
      FieldName = #26085#20135#37327#36798#25104#29575
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pdbpln2ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = #26376#23454#38469#20135#37327
      FieldName = #26376#23454#38469#20135#37327
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pdbpln2ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = #26376#20135#37327#36798#25104#29575
      FieldName = #26376#20135#37327#36798#25104#29575
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pdbpln2ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'WIP'
      FieldName = 'WIP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pdbpln2ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = #26085#30446#26631#25253#24223#29575
      FieldName = #26085#30446#26631#25253#24223#29575
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pdbpln2ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = #26085#23454#38469#25253#24223#29575
      FieldName = #26085#23454#38469#25253#24223#29575
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pdbpln2ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = #26085#25253#24223#29575#36798#25104#29575
      FieldName = #26085#25253#24223#29575#36798#25104#29575
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pdbpln2ppField11: TppField
      Alignment = taRightJustify
      FieldAlias = #26376#23454#38469#25253#24223#29575
      FieldName = #26376#23454#38469#25253#24223#29575
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pdbpln2ppField12: TppField
      Alignment = taRightJustify
      FieldAlias = #26376#25253#24223#29575#36798#25104#29575
      FieldName = #26376#25253#24223#29575#36798#25104#29575
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
  end
  object ds1: TDataSource
    DataSet = qry1
    Left = 80
    Top = 40
  end
  object qry1: TADOQuery
    Active = True
    Connection = Damo.con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        ' SELECT    ControlItemName as '#37096#38376', DTarNum as '#26085#30446#26631#20135#37327', DProNum as '#26085 +
        #23454#38469#20135#37327', DFinalProTax as '#26085#20135#37327#36798#25104#29575', MProNum as '#26376#23454#38469#20135#37327', MFinalProTax '#26376#20135#37327 +
        #36798#25104#29575', '
      
        '                 WIP, DTarDellTax '#26085#30446#26631#25253#24223#29575', DDelTax '#26085#23454#38469#25253#24223#29575', DFinal' +
        'DelTax '#26085#25253#24223#29575#36798#25104#29575', MDelTax '#26376#23454#38469#25253#24223#29575', '
      '                  MFinalDelTax '#26376#25253#24223#29575#36798#25104#29575
      'FROM         Data0729')
    Left = 32
    Top = 40
    object wdstrngfldqry1DSDesigner: TWideStringField
      FieldName = #37096#38376
      Size = 50
    end
    object fltfldqry1DSDesigner2: TFloatField
      FieldName = #26085#30446#26631#20135#37327
    end
    object fltfldqry1DSDesigner3: TFloatField
      FieldName = #26085#23454#38469#20135#37327
    end
    object fltfldqry1DSDesigner4: TFloatField
      FieldName = #26085#20135#37327#36798#25104#29575
    end
    object fltfldqry1DSDesigner5: TFloatField
      FieldName = #26376#23454#38469#20135#37327
    end
    object fltfldqry1DSDesigner6: TFloatField
      FieldName = #26376#20135#37327#36798#25104#29575
    end
    object fltfldqry1WIP: TFloatField
      FieldName = 'WIP'
    end
    object fltfldqry1DSDesigner7: TFloatField
      FieldName = #26085#30446#26631#25253#24223#29575
    end
    object fltfldqry1DSDesigner8: TFloatField
      FieldName = #26085#23454#38469#25253#24223#29575
    end
    object fltfldqry1DSDesigner9: TFloatField
      FieldName = #26085#25253#24223#29575#36798#25104#29575
    end
    object fltfldqry1DSDesigner10: TFloatField
      FieldName = #26376#23454#38469#25253#24223#29575
    end
    object fltfldqry1DSDesigner11: TFloatField
      FieldName = #26376#25253#24223#29575#36798#25104#29575
    end
  end
end
