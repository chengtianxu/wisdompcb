object Form_Report: TForm_Report
  Left = 422
  Top = 295
  Width = 536
  Height = 430
  Caption = 'Form_Report'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ADO597: TADOQuery
    Connection = DM.ADOConnection1
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
      
        'SELECT dbo.data0597.status as ststusr,    dbo.data0597.rkey, dbo' +
        '.data0597.spNumber, dbo.Data0010.ABBR_NAME, dbo.Data0073.USER_FU' +
        'LL_NAME, dbo.Data0001.CURR_NAME, dbo.data0597.v_ttype ,dbo.data0' +
        '597.Number,dbo.data0597.spmoney,'
      
        '                      dbo.Data0015.ABBR_NAME, dbo.Data0005.ABBR_' +
        'NAME AS yw05, dbo.data0597.EntryTime, case dbo.data0597.Debit wh' +
        'en 0 then '#39#21542#39' when 1 then '#39#26159#39' else '#39#20854#23427#39' end as debita, dbo.data0' +
        '597.Remarks, '
      
        '                     case dbo.data0597.status when 1 then '#39#26410#25552#20132#39' ' +
        'when 2 then '#39#35780#23457#20013#39' when 3 then '#39#24050#35780#23457#39' when 4 then '#39#36864#22238#39'  else '#39#20854#23427#39' ' +
        'end as v_status,  dbo.data0597.submit_date, dbo.data0597.ywexpla' +
        'in'
      'FROM         dbo.Data0073 INNER JOIN'
      '                      dbo.data0597 INNER JOIN'
      
        '                      dbo.Data0010 ON dbo.data0597.rkey10 = dbo.' +
        'Data0010.RKEY ON dbo.Data0073.RKEY = dbo.data0597.rkey73 INNER J' +
        'OIN'
      
        '                      dbo.Data0001 ON dbo.data0597.rkey01 = dbo.' +
        'Data0001.RKEY INNER JOIN'
      
        '                      dbo.Data0015 ON dbo.data0597.rkey15 = dbo.' +
        'Data0015.RKEY INNER JOIN'
      
        '                      dbo.Data0005 ON dbo.data0597.Salesman = db' +
        'o.Data0005.RKEY'
      ''
      ' where'
      ' dbo.data0597.rkey=:rkey')
    Left = 84
    Top = 24
    object ADO597ststusr: TWordField
      FieldName = 'ststusr'
    end
    object ADO597rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO597spNumber: TStringField
      FieldName = 'spNumber'
      Size = 50
    end
    object ADO597ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADO597USER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object ADO597CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object ADO597v_ttype: TWideStringField
      FieldName = 'v_ttype'
      Size = 50
    end
    object ADO597Number: TIntegerField
      FieldName = 'Number'
    end
    object ADO597spmoney: TBCDField
      FieldName = 'spmoney'
      Precision = 19
    end
    object ADO597ABBR_NAME_1: TStringField
      FieldName = 'ABBR_NAME_1'
      Size = 10
    end
    object ADO597yw05: TStringField
      FieldName = 'yw05'
      Size = 10
    end
    object ADO597EntryTime: TDateTimeField
      FieldName = 'EntryTime'
    end
    object ADO597debita: TStringField
      FieldName = 'debita'
      ReadOnly = True
      Size = 4
    end
    object ADO597Remarks: TWideStringField
      FieldName = 'Remarks'
      Size = 300
    end
    object ADO597v_status: TStringField
      FieldName = 'v_status'
      ReadOnly = True
      Size = 6
    end
    object ADO597submit_date: TDateTimeField
      FieldName = 'submit_date'
    end
    object ADO597ywexplain: TWideStringField
      FieldName = 'ywexplain'
      Size = 300
    end
  end
  object DataSource1: TDataSource
    DataSet = ADO597
    Left = 148
    Top = 24
  end
  object ppDB597: TppDBPipeline
    DataSource = DataSource1
    UserName = 'DB597'
    Left = 248
    Top = 28
    object ppDB597ppField1: TppField
      FieldAlias = 'ststusr'
      FieldName = 'ststusr'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB597ppField2: TppField
      FieldAlias = 'rkey'
      FieldName = 'rkey'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB597ppField3: TppField
      FieldAlias = 'spNumber'
      FieldName = 'spNumber'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB597ppField4: TppField
      FieldAlias = 'ABBR_NAME'
      FieldName = 'ABBR_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB597ppField5: TppField
      FieldAlias = 'USER_FULL_NAME'
      FieldName = 'USER_FULL_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB597ppField6: TppField
      FieldAlias = 'CURR_NAME'
      FieldName = 'CURR_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDB597ppField7: TppField
      FieldAlias = 'v_ttype'
      FieldName = 'v_ttype'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDB597ppField8: TppField
      FieldAlias = 'Number'
      FieldName = 'Number'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDB597ppField9: TppField
      FieldAlias = 'spmoney'
      FieldName = 'spmoney'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDB597ppField10: TppField
      FieldAlias = 'ABBR_NAME_1'
      FieldName = 'ABBR_NAME_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppDB597ppField11: TppField
      FieldAlias = 'yw05'
      FieldName = 'yw05'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppDB597ppField12: TppField
      FieldAlias = 'EntryTime'
      FieldName = 'EntryTime'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppDB597ppField13: TppField
      FieldAlias = 'debita'
      FieldName = 'debita'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppDB597ppField14: TppField
      FieldAlias = 'Remarks'
      FieldName = 'Remarks'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppDB597ppField15: TppField
      FieldAlias = 'v_status'
      FieldName = 'v_status'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppDB597ppField16: TppField
      FieldAlias = 'submit_date'
      FieldName = 'submit_date'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppDB597ppField17: TppField
      FieldAlias = 'ywexplain'
      FieldName = 'ywexplain'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = DB609
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
    SaveAsTemplate = True
    Template.FileName = 'D:\sjsys\NIERP\Report\597.RTM'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 332
    Top = 80
    Version = '7.01'
    mmColumnWidth = 203200
    DataPipelineName = 'DB609'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 51329
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape2'
        mmHeight = 8996
        mmLeft = 1852
        mmTop = 42333
        mmWidth = 198438
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 14288
        mmLeft = 2117
        mmTop = 20638
        mmWidth = 197909
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = #32034#36180#32534#21495':   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 141552
        mmTop = 15081
        mmWidth = 17992
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 2117
        mmTop = 27781
        mmWidth = 197644
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 14023
        mmLeft = 60325
        mmTop = 20902
        mmWidth = 1852
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'spNumber'
        DataPipeline = ppDB597
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB597'
        mmHeight = 4022
        mmLeft = 161396
        mmTop = 15081
        mmWidth = 16298
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #23458#25143#31616#31216':   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 5821
        mmTop = 22225
        mmWidth = 17992
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'ABBR_NAME'
        DataPipeline = ppDB597
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB597'
        mmHeight = 4022
        mmLeft = 25665
        mmTop = 22225
        mmWidth = 21590
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = #30003#25253#20154':   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 3175
        mmTop = 14817
        mmWidth = 14552
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'USER_FULL_NAME'
        DataPipeline = ppDB597
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB597'
        mmHeight = 4022
        mmLeft = 18785
        mmTop = 14817
        mmWidth = 32343
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #30003#25253#26085#26399':   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 77258
        mmTop = 15081
        mmWidth = 17992
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'submit_date'
        DataPipeline = ppDB597
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB597'
        mmHeight = 4022
        mmLeft = 96309
        mmTop = 15081
        mmWidth = 19177
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'yw05'
        DataPipeline = ppDB597
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB597'
        mmHeight = 4022
        mmLeft = 86784
        mmTop = 22225
        mmWidth = 8043
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = #20027#31649#19994#21153#21592':   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 63236
        mmTop = 22225
        mmWidth = 22490
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = #24037#21378':   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 128852
        mmTop = 22225
        mmWidth = 10054
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'ABBR_NAME_1'
        DataPipeline = ppDB597
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB597'
        mmHeight = 4022
        mmLeft = 139965
        mmTop = 22225
        mmWidth = 25485
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 14023
        mmLeft = 125148
        mmTop = 20902
        mmWidth = 1852
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = #25968#37327':   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 13229
        mmTop = 29369
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = #37329#39069':   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 75406
        mmTop = 29369
        mmWidth = 10054
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'spmoney'
        DataPipeline = ppDB597
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB597'
        mmHeight = 4022
        mmLeft = 87048
        mmTop = 29369
        mmWidth = 14224
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = #24065#31181':   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 129117
        mmTop = 29369
        mmWidth = 10054
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = 'CURR_NAME'
        DataPipeline = ppDB597
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB597'
        mmHeight = 4022
        mmLeft = 140759
        mmTop = 29369
        mmWidth = 22225
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'Number'
        DataPipeline = ppDB597
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB597'
        mmHeight = 4022
        mmLeft = 25665
        mmTop = 29369
        mmWidth = 12573
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #23458#25143#21697#36136#32034#36180#30003#35831'  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 20
        Font.Style = []
        Transparent = True
        mmHeight = 8202
        mmLeft = 66411
        mmTop = 5027
        mmWidth = 60854
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = #26126#32454':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 2117
        mmTop = 36777
        mmWidth = 8086
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = #30830#35748#26085#26399
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2910
        mmTop = 44979
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = #26412#21378#32534#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 25400
        mmTop = 44979
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = #21378#20869#21608#26399
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 50536
        mmTop = 44979
        mmWidth = 16933
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8467
        mmLeft = 23283
        mmTop = 42863
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = #35828#26126
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 114565
        mmTop = 45508
        mmWidth = 8467
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 113242
        mmTop = 43392
        mmWidth = 265
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = #25968#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 145521
        mmTop = 44715
        mmWidth = 8731
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8467
        mmLeft = 156104
        mmTop = 42598
        mmWidth = 794
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8467
        mmLeft = 144198
        mmTop = 42598
        mmWidth = 1058
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = #21333#20215
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 164042
        mmTop = 45244
        mmWidth = 8731
        BandType = 0
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8467
        mmLeft = 175948
        mmTop = 42863
        mmWidth = 265
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = #32034#36180#26376#20221
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 177536
        mmTop = 44979
        mmWidth = 17463
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8467
        mmLeft = 48683
        mmTop = 42333
        mmWidth = 1058
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 8202
      mmPrintPosition = 0
      object ppShape3: TppShape
        UserName = 'Shape3'
        mmHeight = 265
        mmLeft = 1852
        mmTop = 7938
        mmWidth = 198173
        BandType = 4
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 23548
        mmTop = 265
        mmWidth = 265
        BandType = 4
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8202
        mmLeft = 48683
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine16: TppLine
        UserName = 'Line16'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 113242
        mmTop = 529
        mmWidth = 265
        BandType = 4
      end
      object ppLine18: TppLine
        UserName = 'Line18'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8202
        mmLeft = 144463
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppLine19: TppLine
        UserName = 'Line101'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8202
        mmLeft = 156104
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppLine21: TppLine
        UserName = 'Line21'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7938
        mmLeft = 175948
        mmTop = 0
        mmWidth = 794
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'condate'
        DataPipeline = DB609
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DB609'
        mmHeight = 4022
        mmLeft = 2646
        mmTop = 2381
        mmWidth = 12488
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText101'
        AutoSize = True
        DataField = 'MANU_PART_NUMBER'
        DataPipeline = DB609
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DB609'
        mmHeight = 3969
        mmLeft = 24342
        mmTop = 2381
        mmWidth = 21960
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText102'
        AutoSize = True
        DataField = 'rec_no'
        DataPipeline = DB609
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DB609'
        mmHeight = 4022
        mmLeft = 51065
        mmTop = 2381
        mmWidth = 10753
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText104'
        DataField = 'explain'
        DataPipeline = DB609
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'DB609'
        mmHeight = 6879
        mmLeft = 113771
        mmTop = 794
        mmWidth = 30956
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText106'
        AutoSize = True
        DataField = 'Number'
        DataPipeline = DB609
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DB609'
        mmHeight = 4022
        mmLeft = 148167
        mmTop = 2381
        mmWidth = 12573
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText107'
        AutoSize = True
        DataField = 'spUnitPrice'
        DataPipeline = DB609
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DB609'
        mmHeight = 4022
        mmLeft = 157427
        mmTop = 2381
        mmWidth = 17949
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText109'
        AutoSize = True
        DataField = 'spmonth'
        DataPipeline = DB609
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DB609'
        mmHeight = 4022
        mmLeft = 178330
        mmTop = 2381
        mmWidth = 13547
        BandType = 4
      end
      object ppLine23: TppLine
        UserName = 'Line23'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7938
        mmLeft = 1588
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine24: TppLine
        UserName = 'Line24'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7938
        mmLeft = 200025
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
    end
  end
  object ADO609: TADOQuery
    Connection = DM.ADOConnection1
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
      
        'SELECT     dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART' +
        '_DESC, dbo.data0609.rkey, dbo.data0609.rkey597, dbo.data0609.Num' +
        'ber25, dbo.data0609.condate, dbo.data0609.remark, '
      
        '                      dbo.data0609.rec_no, dbo.data0609.xingtai,' +
        ' dbo.data0609.explain, dbo.data0609.company, dbo.data0609.Number' +
        ', dbo.data0609.spUnitPrice, dbo.data0609.spliable, '
      '                      dbo.data0609.spmonth'
      'FROM         dbo.data0609 INNER JOIN'
      
        '                      dbo.Data0025 ON dbo.data0609.Number25 = db' +
        'o.Data0025.MANU_PART_NUMBER'
      ''
      'where dbo.data0609.rkey597=:rkey')
    Left = 84
    Top = 124
    object ADO609MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADO609MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ADO609rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO609rkey597: TIntegerField
      FieldName = 'rkey597'
    end
    object ADO609Number25: TStringField
      FieldName = 'Number25'
      Size = 30
    end
    object ADO609condate: TDateTimeField
      FieldName = 'condate'
    end
    object ADO609remark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
    object ADO609rec_no: TWideStringField
      FieldName = 'rec_no'
      Size = 50
    end
    object ADO609xingtai: TStringField
      FieldName = 'xingtai'
    end
    object ADO609explain: TWideStringField
      FieldName = 'explain'
      Size = 200
    end
    object ADO609company: TStringField
      FieldName = 'company'
    end
    object ADO609Number: TIntegerField
      FieldName = 'Number'
    end
    object ADO609spUnitPrice: TBCDField
      FieldName = 'spUnitPrice'
      Precision = 19
    end
    object ADO609spliable: TWideStringField
      FieldName = 'spliable'
      Size = 10
    end
    object ADO609spmonth: TDateTimeField
      FieldName = 'spmonth'
    end
  end
  object DataSource2: TDataSource
    DataSet = ADO609
    Left = 160
    Top = 124
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
    Left = 408
    Top = 84
  end
  object ADO599: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey597'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.data0599.rkey597, dbo.data0599.PUTH_INFO, dbo.dat' +
        'a0599.seq_no, dbo.data0599.auth_date, dbo.Data0073.USER_FULL_NAM' +
        'E, '
      
        '                      CASE dbo.data0599.status WHEN 0 THEN '#39#26410#23457#26680#39 +
        ' WHEN 1 THEN '#39#24050#23457#26680#39' ELSE '#39#36864#22238#39' END AS status1, dbo.data0597.v_ttyp' +
        'e'
      'FROM         dbo.data0599 INNER JOIN'
      
        '                      dbo.data0597 ON dbo.data0599.rkey597 = dbo' +
        '.data0597.rkey LEFT OUTER JOIN'
      
        '                      dbo.Data0073 ON dbo.data0599.rkey73 = dbo.' +
        'Data0073.RKEY'
      ''
      'where rkey597=:rkey597')
    Left = 84
    Top = 204
    object ADO599rkey597: TIntegerField
      FieldName = 'rkey597'
    end
    object ADO599PUTH_INFO: TWideStringField
      FieldName = 'PUTH_INFO'
      Size = 100
    end
    object ADO599seq_no: TIntegerField
      FieldName = 'seq_no'
    end
    object ADO599auth_date: TDateTimeField
      FieldName = 'auth_date'
    end
    object ADO599USER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object ADO599status1: TStringField
      FieldName = 'status1'
      ReadOnly = True
      Size = 6
    end
    object ADO599v_ttype: TWideStringField
      FieldName = 'v_ttype'
      Size = 50
    end
  end
  object DataSource3: TDataSource
    DataSet = ADO599
    Left = 160
    Top = 208
  end
  object ppDB599: TppDBPipeline
    DataSource = DataSource3
    UserName = 'DB599'
    Left = 268
    Top = 204
  end
  object DB609: TppDBPipeline
    DataSource = DataSource2
    UserName = 'DB609'
    Left = 252
    Top = 132
    object DB609ppField1: TppField
      FieldAlias = 'MANU_PART_NUMBER'
      FieldName = 'MANU_PART_NUMBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object DB609ppField2: TppField
      FieldAlias = 'MANU_PART_DESC'
      FieldName = 'MANU_PART_DESC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object DB609ppField3: TppField
      FieldAlias = 'rkey'
      FieldName = 'rkey'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object DB609ppField4: TppField
      FieldAlias = 'rkey597'
      FieldName = 'rkey597'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object DB609ppField5: TppField
      FieldAlias = 'Number25'
      FieldName = 'Number25'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object DB609ppField6: TppField
      FieldAlias = 'condate'
      FieldName = 'condate'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object DB609ppField7: TppField
      FieldAlias = 'remark'
      FieldName = 'remark'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object DB609ppField8: TppField
      FieldAlias = 'rec_no'
      FieldName = 'rec_no'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object DB609ppField9: TppField
      FieldAlias = 'xingtai'
      FieldName = 'xingtai'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object DB609ppField10: TppField
      FieldAlias = 'explain'
      FieldName = 'explain'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object DB609ppField11: TppField
      FieldAlias = 'company'
      FieldName = 'company'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object DB609ppField12: TppField
      FieldAlias = 'Number'
      FieldName = 'Number'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object DB609ppField13: TppField
      FieldAlias = 'spUnitPrice'
      FieldName = 'spUnitPrice'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object DB609ppField14: TppField
      FieldAlias = 'spliable'
      FieldName = 'spliable'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object DB609ppField15: TppField
      FieldAlias = 'spmonth'
      FieldName = 'spmonth'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
  end
end
