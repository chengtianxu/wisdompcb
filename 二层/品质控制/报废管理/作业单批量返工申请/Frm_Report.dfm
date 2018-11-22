object Form_Report: TForm_Report
  Left = 510
  Top = 351
  Width = 462
  Height = 361
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
  object DataSource2: TDataSource
    DataSet = Aqwz252
    Left = 136
    Top = 239
  end
  object Aqwz252: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    SQL.Strings = (
      'select data0006.work_order_number,'
      
        'data0252.pnl_qty,data0252.pcs_qty,data0252.rkey203,data0252.rkey' +
        '06'
      'from data0252'
      'inner join data0006'
      'on data0252.rkey06=data0006.rkey'
      'where data0252.rkey203=:rkey'
      ''
      ''
      ''
      ''
      '')
    Left = 48
    Top = 240
    object Aqwz252work_order_number: TStringField
      FieldName = 'work_order_number'
      Size = 22
    end
    object Aqwz252rkey203: TIntegerField
      FieldName = 'rkey203'
    end
    object Aqwz252rkey06: TIntegerField
      FieldName = 'rkey06'
    end
    object Aqwz252pnl_qty: TIntegerField
      FieldName = 'pnl_qty'
    end
    object Aqwz252pcs_qty: TIntegerField
      FieldName = 'pcs_qty'
    end
  end
  object Aqwz203: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 11
      end>
    SQL.Strings = (
      
        'SELECT          dbo.DATA0203.rkey, dbo.DATA0203.return_code, dbo' +
        '.DATA0203.user_ptr, dbo.DATA0203.ENT_DATE, '
      
        '                      dbo.DATA0203.submit, dbo.DATA0203.CUST_PAR' +
        'T_PTR, dbo.DATA0203.dept_ptr, dbo.DATA0203.v_ttype, dbo.DATA0203' +
        '.status,'
      
        '                      case Data0203.status when 0 then '#39#26410#25552#20132#39' whe' +
        'n 1 then '#39#24453#23457#25209#39' when 2 then '#39#24050#23457#25209#39' when 3 then '#39#24050#36864#22238#39' end as tstatu' +
        's, '
      
        '                      dbo.DATA0203.WTYPE_step, dbo.DATA0203.desc' +
        'ribe, dbo.DATA0203.reason, dbo.DATA0203.scheme, dbo.DATA0203.pan' +
        'el_qty, '
      
        '                      dbo.DATA0203.pcs_qty, dbo.DATA0257.Remark,' +
        'dbo.Data0025.MANU_PART_NUMBER, '
      
        '                      dbo.Data0025.MANU_PART_DESC, dbo.Data0034.' +
        'DEPT_CODE, dbo.Data0034.DEPT_NAME, dbo.Data0005.employee_name as' +
        ' ABBR_NAME'
      'FROM         dbo.DATA0203 INNER JOIN'
      
        '                  dbo.DATA0257 ON dbo.DATA0257.v_ttype = dbo.DAT' +
        'A0203.v_ttype INNER JOIN'
      
        '                  dbo.Data0025 ON dbo.DATA0203.CUST_PART_PTR = d' +
        'bo.Data0025.RKEY INNER JOIN'
      
        '                  dbo.Data0034 ON dbo.DATA0203.dept_ptr = dbo.Da' +
        'ta0034.RKEY INNER JOIN'
      
        '                  dbo.Data0005 ON dbo.DATA0203.user_ptr = dbo.Da' +
        'ta0005.RKEY '
      'WHERE   dbo.Data0203.rkey=:rkey'
      '')
    Left = 40
    Top = 175
    object Aqwz203rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object Aqwz203return_code: TStringField
      FieldName = 'return_code'
      Size = 10
    end
    object Aqwz203user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object Aqwz203ENT_DATE: TDateTimeField
      FieldName = 'ENT_DATE'
    end
    object Aqwz203submit: TDateTimeField
      FieldName = 'submit'
    end
    object Aqwz203CUST_PART_PTR: TIntegerField
      FieldName = 'CUST_PART_PTR'
    end
    object Aqwz203dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object Aqwz203v_ttype: TStringField
      FieldName = 'v_ttype'
    end
    object Aqwz203status: TWordField
      FieldName = 'status'
    end
    object Aqwz203tstatus: TStringField
      FieldName = 'tstatus'
      ReadOnly = True
      Size = 6
    end
    object Aqwz203WTYPE_step: TIntegerField
      FieldName = 'WTYPE_step'
    end
    object Aqwz203describe: TWideStringField
      FieldName = 'describe'
      Size = 200
    end
    object Aqwz203reason: TWideStringField
      FieldName = 'reason'
      Size = 200
    end
    object Aqwz203scheme: TWideStringField
      FieldName = 'scheme'
      Size = 200
    end
    object Aqwz203panel_qty: TIntegerField
      FieldName = 'panel_qty'
    end
    object Aqwz203pcs_qty: TIntegerField
      FieldName = 'pcs_qty'
    end
    object Aqwz203Remark: TWideStringField
      FieldName = 'Remark'
      Size = 100
    end
    object Aqwz203MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object Aqwz203MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object Aqwz203DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object Aqwz203DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object Aqwz203ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 16
    end
  end
  object DataSource1: TDataSource
    DataSet = Aqwz203
    Left = 128
    Top = 175
  end
  object ppDB203: TppDBPipeline
    DataSource = DataSource1
    UserName = 'DB203'
    Left = 200
    Top = 184
    object ppDB203ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'rkey'
      FieldName = 'rkey'
      FieldLength = 0
      DataType = dtLongint
      DisplayWidth = 10
      Position = 0
    end
    object ppDB203ppField2: TppField
      FieldAlias = 'return_code'
      FieldName = 'return_code'
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
    object ppDB203ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'user_ptr'
      FieldName = 'user_ptr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object ppDB203ppField4: TppField
      FieldAlias = 'ENT_DATE'
      FieldName = 'ENT_DATE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 3
    end
    object ppDB203ppField5: TppField
      FieldAlias = 'submit'
      FieldName = 'submit'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 4
    end
    object ppDB203ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'CUST_PART_PTR'
      FieldName = 'CUST_PART_PTR'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 5
    end
    object ppDB203ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'dept_ptr'
      FieldName = 'dept_ptr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 6
    end
    object ppDB203ppField8: TppField
      FieldAlias = 'v_ttype'
      FieldName = 'v_ttype'
      FieldLength = 20
      DisplayWidth = 20
      Position = 7
    end
    object ppDB203ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'status'
      FieldName = 'status'
      FieldLength = 0
      DataType = dtLongint
      DisplayWidth = 10
      Position = 8
    end
    object ppDB203ppField10: TppField
      FieldAlias = 'tstatus'
      FieldName = 'tstatus'
      FieldLength = 6
      DisplayWidth = 6
      Position = 9
    end
    object ppDB203ppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'WTYPE_step'
      FieldName = 'WTYPE_step'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 10
    end
    object ppDB203ppField12: TppField
      FieldAlias = 'describe'
      FieldName = 'describe'
      FieldLength = 200
      DisplayWidth = 200
      Position = 11
    end
    object ppDB203ppField13: TppField
      FieldAlias = 'reason'
      FieldName = 'reason'
      FieldLength = 200
      DisplayWidth = 200
      Position = 12
    end
    object ppDB203ppField14: TppField
      FieldAlias = 'scheme'
      FieldName = 'scheme'
      FieldLength = 200
      DisplayWidth = 200
      Position = 13
    end
    object ppDB203ppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'panel_qty'
      FieldName = 'panel_qty'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 14
    end
    object ppDB203ppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'pcs_qty'
      FieldName = 'pcs_qty'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 15
    end
    object ppDB203ppField17: TppField
      FieldAlias = 'Remark'
      FieldName = 'Remark'
      FieldLength = 100
      DisplayWidth = 100
      Position = 16
    end
    object ppDB203ppField18: TppField
      FieldAlias = 'MANU_PART_NUMBER'
      FieldName = 'MANU_PART_NUMBER'
      FieldLength = 20
      DisplayWidth = 20
      Position = 17
    end
    object ppDB203ppField19: TppField
      FieldAlias = 'MANU_PART_DESC'
      FieldName = 'MANU_PART_DESC'
      FieldLength = 80
      DisplayWidth = 80
      Position = 18
    end
    object ppDB203ppField20: TppField
      FieldAlias = 'DEPT_CODE'
      FieldName = 'DEPT_CODE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 19
    end
    object ppDB203ppField21: TppField
      FieldAlias = 'DEPT_NAME'
      FieldName = 'DEPT_NAME'
      FieldLength = 30
      DisplayWidth = 30
      Position = 20
    end
    object ppDB203ppField22: TppField
      FieldAlias = 'ABBR_NAME'
      FieldName = 'ABBR_NAME'
      FieldLength = 16
      DisplayWidth = 16
      Position = 21
    end
  end
  object ppDB252: TppDBPipeline
    DataSource = DataSource2
    UserName = 'DB252'
    Left = 200
    Top = 240
    MasterDataPipelineName = 'ppDB203'
    object ppDB252ppField1: TppField
      FieldAlias = 'work_order_number'
      FieldName = 'work_order_number'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppDB252ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'rkey203'
      FieldName = 'rkey203'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object ppDB252ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'rkey06'
      FieldName = 'rkey06'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object ppDB252ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'pnl_qty'
      FieldName = 'pnl_qty'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 3
    end
    object ppDB252ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'pcs_qty'
      FieldName = 'pcs_qty'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 4
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB252
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
    Template.FileName = 'D:\SJSYS\NIERP\Report\wzpr252.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 280
    Top = 200
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB252'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 47096
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #21046#31243#24322#24120#36820#24037#21333
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 20
        Font.Style = []
        Transparent = True
        mmHeight = 8128
        mmLeft = 73819
        mmTop = 2381
        mmWidth = 55563
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 20108
        mmLeft = 0
        mmTop = 12171
        mmWidth = 200290
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 6615
        mmLeft = 0
        mmTop = 22490
        mmWidth = 200025
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 20108
        mmLeft = 98954
        mmTop = 12171
        mmWidth = 2381
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 19844
        mmLeft = 37306
        mmTop = 12435
        mmWidth = 13229
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 20108
        mmLeft = 136790
        mmTop = 12171
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = #36820#24037#20195#30721
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = []
        Transparent = True
        mmHeight = 5715
        mmLeft = 7938
        mmTop = 14552
        mmWidth = 19981
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #26412#21378#32534#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = []
        Transparent = True
        mmHeight = 5715
        mmLeft = 107421
        mmTop = 14552
        mmWidth = 19981
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = #30003#35831#24037#24207
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = []
        Transparent = True
        mmHeight = 5715
        mmLeft = 7938
        mmTop = 24606
        mmWidth = 19981
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #24322#24120#31561#32423
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = []
        Transparent = True
        mmHeight = 5715
        mmLeft = 107421
        mmTop = 24606
        mmWidth = 19981
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'return_code'
        DataPipeline = ppDB203
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB203'
        mmHeight = 5715
        mmLeft = 45773
        mmTop = 14552
        mmWidth = 20066
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'MANU_PART_NUMBER'
        DataPipeline = ppDB203
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB203'
        mmHeight = 5715
        mmLeft = 144463
        mmTop = 14552
        mmWidth = 26670
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'DEPT_NAME'
        DataPipeline = ppDB203
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB203'
        mmHeight = 5715
        mmLeft = 46302
        mmTop = 24606
        mmWidth = 9991
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'v_ttype'
        DataPipeline = ppDB203
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB203'
        mmHeight = 5715
        mmLeft = 144727
        mmTop = 24606
        mmWidth = 8297
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = #36820#24037#20316#19994#21333':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4868
        mmLeft = 0
        mmTop = 33338
        mmWidth = 22352
        BandType = 0
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        mmHeight = 8731
        mmLeft = 0
        mmTop = 38365
        mmWidth = 200290
        BandType = 0
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8467
        mmLeft = 83608
        mmTop = 38629
        mmWidth = 17198
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8467
        mmLeft = 143404
        mmTop = 38629
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = #20316#19994#21333#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4868
        mmLeft = 30956
        mmTop = 40481
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = #22312#32447#25968#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4868
        mmLeft = 104511
        mmTop = 40481
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = #22312#32447'PNL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4868
        mmLeft = 163248
        mmTop = 40481
        mmWidth = 16722
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 7144
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'work_order_number'
        DataPipeline = ppDB252
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB252'
        mmHeight = 4868
        mmLeft = 3175
        mmTop = 794
        mmWidth = 37973
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'pcs_qty'
        DataPipeline = ppDB252
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB252'
        mmHeight = 4868
        mmLeft = 99484
        mmTop = 794
        mmWidth = 31623
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'pnl_qty'
        DataPipeline = ppDB252
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB252'
        mmHeight = 4868
        mmLeft = 155046
        mmTop = 794
        mmWidth = 16468
        BandType = 4
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7144
        mmLeft = 0
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7144
        mmLeft = 83608
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7144
        mmLeft = 143404
        mmTop = 0
        mmWidth = 4763
        BandType = 4
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        ParentHeight = True
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 7144
        mmLeft = 187061
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        ParentHeight = True
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 7144
        mmLeft = 0
        mmTop = 0
        mmWidth = 200025
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'rkey203'
      DataPipeline = ppDB252
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDB252'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 104511
        mmPrintPosition = 0
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = #24322#24120#25551#36848#65306
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = []
          Transparent = True
          mmHeight = 4763
          mmLeft = 0
          mmTop = 2910
          mmWidth = 21167
          BandType = 5
          GroupNo = 0
        end
        object ppShape3: TppShape
          UserName = 'Shape3'
          mmHeight = 28575
          mmLeft = 0
          mmTop = 7938
          mmWidth = 200290
          BandType = 5
          GroupNo = 0
        end
        object ppShape4: TppShape
          UserName = 'Shape4'
          mmHeight = 28575
          mmLeft = 0
          mmTop = 41804
          mmWidth = 200290
          BandType = 5
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label11'
          Caption = #24322#24120#21407#22240#65306
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = []
          Transparent = True
          mmHeight = 4763
          mmLeft = 0
          mmTop = 36777
          mmWidth = 21167
          BandType = 5
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          Caption = #36820#24037#26041#26696#65306
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = []
          Transparent = True
          mmHeight = 4763
          mmLeft = 0
          mmTop = 70908
          mmWidth = 21167
          BandType = 5
          GroupNo = 0
        end
        object ppShape5: TppShape
          UserName = 'Shape5'
          mmHeight = 28575
          mmLeft = 0
          mmTop = 75936
          mmWidth = 200290
          BandType = 5
          GroupNo = 0
        end
        object ppDBMemo1: TppDBMemo
          UserName = 'DBMemo1'
          CharWrap = True
          DataField = 'describe'
          DataPipeline = ppDB203
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppDB203'
          mmHeight = 27517
          mmLeft = 529
          mmTop = 8467
          mmWidth = 198967
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppDBMemo2: TppDBMemo
          UserName = 'DBMemo2'
          CharWrap = True
          DataField = 'reason'
          DataPipeline = ppDB203
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppDB203'
          mmHeight = 27517
          mmLeft = 529
          mmTop = 42333
          mmWidth = 198967
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppDBMemo3: TppDBMemo
          UserName = 'DBMemo3'
          CharWrap = True
          DataField = 'scheme'
          DataPipeline = ppDB203
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppDB203'
          mmHeight = 27517
          mmLeft = 529
          mmTop = 76465
          mmWidth = 198967
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'rkey203'
      DataPipeline = ppDB252
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDB252'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppSubReport1: TppSubReport
          UserName = 'SubReport1'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'ppDB260'
          mmHeight = 6085
          mmLeft = 0
          mmTop = 0
          mmWidth = 203200
          BandType = 5
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport1: TppChildReport
            AutoStop = False
            DataPipeline = ppDB260
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
            Version = '7.01'
            mmColumnWidth = 0
            DataPipelineName = 'ppDB260'
            object ppTitleBand1: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppHeaderBand2: TppHeaderBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppDetailBand2: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 5821
              mmPrintPosition = 0
              object ppDBText8: TppDBText
                UserName = 'DBText8'
                AutoSize = True
                DataField = 'employee_name'
                DataPipeline = ppDB260
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDB260'
                mmHeight = 4022
                mmLeft = 2381
                mmTop = 794
                mmWidth = 10668
                BandType = 4
              end
              object ppDBText10: TppDBText
                UserName = 'DBText10'
                AutoSize = True
                DataField = 'dept_name'
                DataPipeline = ppDB260
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDB260'
                mmHeight = 4022
                mmLeft = 34396
                mmTop = 794
                mmWidth = 10668
                BandType = 4
              end
              object ppDBText9: TppDBText
                UserName = 'DBText9'
                AutoSize = True
                DataField = 'auth_date'
                DataPipeline = ppDB260
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDB260'
                mmHeight = 4022
                mmLeft = 78052
                mmTop = 794
                mmWidth = 32554
                BandType = 4
              end
              object ppDBText11: TppDBText
                UserName = 'DBText11'
                AutoSize = True
                DataField = 'PUTH_INFO'
                DataPipeline = ppDB260
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDB260'
                mmHeight = 3979
                mmLeft = 118534
                mmTop = 794
                mmWidth = 17187
                BandType = 4
              end
              object ppLine15: TppLine
                UserName = 'Line15'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 5821
                mmLeft = 0
                mmTop = 0
                mmWidth = 6350
                BandType = 4
              end
              object ppLine16: TppLine
                UserName = 'Line16'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 5821
                mmLeft = 30163
                mmTop = 0
                mmWidth = 2381
                BandType = 4
              end
              object ppLine17: TppLine
                UserName = 'Line17'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 5821
                mmLeft = 76994
                mmTop = 0
                mmWidth = 2381
                BandType = 4
              end
              object ppLine18: TppLine
                UserName = 'Line18'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 5821
                mmLeft = 114036
                mmTop = 0
                mmWidth = 2381
                BandType = 4
              end
              object ppLine19: TppLine
                UserName = 'Line19'
                Position = lpBottom
                Weight = 0.750000000000000000
                mmHeight = 3969
                mmLeft = 0
                mmTop = 1852
                mmWidth = 200025
                BandType = 4
              end
              object ppLine20: TppLine
                UserName = 'Line20'
                ParentHeight = True
                Position = lpRight
                Weight = 0.750000000000000000
                mmHeight = 5821
                mmLeft = 186796
                mmTop = 0
                mmWidth = 13229
                BandType = 4
              end
            end
            object ppSummaryBand1: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppGroup3: TppGroup
              BreakName = 'rkey203'
              DataPipeline = ppDB260
              KeepTogether = True
              OutlineSettings.CreateNode = True
              UserName = 'Group3'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              DataPipelineName = 'ppDB260'
              object ppGroupHeaderBand3: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 13229
                mmPrintPosition = 0
                object ppLabel13: TppLabel
                  UserName = 'Label13'
                  Caption = #35780#23457#20449#24687
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 10
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 265
                  mmTop = 2117
                  mmWidth = 20638
                  BandType = 3
                  GroupNo = 0
                end
                object ppShape6: TppShape
                  UserName = 'Shape6'
                  mmHeight = 6085
                  mmLeft = 0
                  mmTop = 7144
                  mmWidth = 200025
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine12: TppLine
                  UserName = 'Line12'
                  Position = lpLeft
                  Weight = 0.750000000000000000
                  mmHeight = 5821
                  mmLeft = 30163
                  mmTop = 7144
                  mmWidth = 13229
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine14: TppLine
                  UserName = 'Line14'
                  Position = lpLeft
                  Weight = 0.750000000000000000
                  mmHeight = 6085
                  mmLeft = 114036
                  mmTop = 7144
                  mmWidth = 13229
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel14: TppLabel
                  UserName = 'Label14'
                  Caption = #35780#23457#20154
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 10
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 7673
                  mmTop = 8467
                  mmWidth = 13758
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel15: TppLabel
                  UserName = 'Label15'
                  Caption = #35780#23457#26102#38388
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 10
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 85990
                  mmTop = 8467
                  mmWidth = 18785
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel16: TppLabel
                  UserName = 'Label16'
                  Caption = #35780#23457#22791#27880
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 10
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 145257
                  mmTop = 8467
                  mmWidth = 19579
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine13: TppLine
                  UserName = 'Line13'
                  Position = lpLeft
                  Weight = 0.750000000000000000
                  mmHeight = 6085
                  mmLeft = 76994
                  mmTop = 7144
                  mmWidth = 10583
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel17: TppLabel
                  UserName = 'Label17'
                  Caption = #35780#23457#37096#38376
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 10
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 37835
                  mmTop = 8467
                  mmWidth = 18521
                  BandType = 3
                  GroupNo = 0
                end
              end
              object ppGroupFooterBand3: TppGroupFooterBand
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
            end
          end
        end
      end
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
    Report = ppReport1
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 340
    Top = 72
  end
  object aqwz260: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    SQL.Strings = (
      'select  '
      'data0260.rkey203,'
      'data0260.dept_ptr,data0034.dept_name,'
      'data0260.user_ptr,data0005.employee_name,'
      'data0260.auth_date,'
      'data0260.PUTH_INFO,'
      'data0260.seq_no,'
      'data0260.auth_flag '
      'from data0260 '
      'left join data0005 on data0260.user_ptr=data0005.rkey'
      'join data0034 on  data0260.dept_ptr=data0034.rkey'
      'join data0203 on data0260.rkey203=data0203.rkey'
      'where data0260.rkey203 =:rkey')
    Left = 48
    Top = 120
    object aqwz260rkey203: TIntegerField
      FieldName = 'rkey203'
    end
    object aqwz260dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object aqwz260dept_name: TStringField
      FieldName = 'dept_name'
      Size = 30
    end
    object aqwz260user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object aqwz260employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object aqwz260auth_date: TDateTimeField
      FieldName = 'auth_date'
    end
    object aqwz260PUTH_INFO: TStringField
      FieldName = 'PUTH_INFO'
      Size = 50
    end
    object aqwz260seq_no: TIntegerField
      FieldName = 'seq_no'
    end
    object aqwz260auth_flag: TBooleanField
      FieldName = 'auth_flag'
    end
  end
  object DataSource3: TDataSource
    DataSet = aqwz260
    Left = 128
    Top = 120
  end
  object ppDB260: TppDBPipeline
    DataSource = DataSource3
    UserName = 'DB260'
    Left = 208
    Top = 120
    MasterDataPipelineName = 'ppDB203'
    object ppDB260ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'rkey203'
      FieldName = 'rkey203'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 0
    end
    object ppDB260ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'dept_ptr'
      FieldName = 'dept_ptr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object ppDB260ppField3: TppField
      FieldAlias = 'dept_name'
      FieldName = 'dept_name'
      FieldLength = 30
      DisplayWidth = 30
      Position = 2
    end
    object ppDB260ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'user_ptr'
      FieldName = 'user_ptr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 3
    end
    object ppDB260ppField5: TppField
      FieldAlias = 'employee_name'
      FieldName = 'employee_name'
      FieldLength = 16
      DisplayWidth = 16
      Position = 4
    end
    object ppDB260ppField6: TppField
      FieldAlias = 'auth_date'
      FieldName = 'auth_date'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 5
    end
    object ppDB260ppField7: TppField
      FieldAlias = 'PUTH_INFO'
      FieldName = 'PUTH_INFO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppDB260ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'seq_no'
      FieldName = 'seq_no'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 7
    end
    object ppDB260ppField9: TppField
      FieldAlias = 'auth_flag'
      FieldName = 'auth_flag'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 8
    end
  end
end
