inherited frmReportOther_mod38: TfrmReportOther_mod38
  Caption = 'frmReportOther_mod38'
  ClientWidth = 535
  ExplicitWidth = 551
  ExplicitHeight = 428
  PixelsPerInch = 96
  TextHeight = 13
  object cds457: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT dbo.Data0457.RKEY, dbo.Data0457.GON_NUMBER, '#13#10'     dbo.Da' +
      'ta0457.REF_NUMBER, '#13#10'      dbo.Data0457.CREATE_DATE, '#13#10'      dbo' +
      '.Data0015.ABBR_NAME, data0457.TTYPE,'#13#10'      dbo.Data0034.DEPT_CO' +
      'DE, dbo.Data0034.DEPT_NAME, '#13#10'      dbo.Data0005.EMPLOYEE_NAME,'#13 +
      #10'Data0005_1.EMPLOYEE_NAME as '#21457#26009#20154#21592','#13#10'case data0457.ttype when 1 t' +
      'hen '#39#25353#37197#26009#21333#39#13#10'when 2 then '#39#25353#37096#38376#39' when 3 then '#39#21457#26009#21040#36710#38388#39#13#10'when 4 then '#39 +
      #29289#26009#36864#20179#39' when 5 then '#39#26434#39033#29289#21697#39#13#10'when 6 then '#39#26434#39033#36864#20179#39#13#10'end as '#20986#20179#31867#22411','#13#10'case' +
      ' data0457.status when 0 then '#39#26410#23457#35745#39#13#10'when 1 then '#39#24050#23457#35745#39#13#10'end as '#29366#24577 +
      ',Data0457.Cut_No as '#22791#27880#13#10'FROM dbo.Data0457 INNER JOIN'#13#10'      dbo.' +
      'Data0015 ON dbo.Data0457.warehouse_ptr = dbo.Data0015.RKEY INNER' +
      ' JOIN'#13#10'      dbo.Data0034 ON dbo.Data0457.dept_ptr = dbo.Data003' +
      '4.RKEY INNER JOIN'#13#10'      dbo.Data0005 ON dbo.Data0457.RECD_BY = ' +
      'dbo.Data0005.RKEY INNER JOIN'#13#10'      dbo.Data0005 Data0005_1 ON d' +
      'bo.Data0457.CREATE_BY = Data0005_1.RKEY'#13#10'where data0457.rkey=:rk' +
      'ey'
    Params = <
      item
        DataType = ftUnknown
        Name = 'rkey'
        ParamType = ptUnknown
      end>
    Left = 96
    Top = 64
  end
  object cds208: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT Data0017.INV_PART_NUMBER,Data0017.INV_NAME,Data0017.INV_D' +
      'ESCRIPTION,Data0207.QUANTITY, '#13#10'       Data0207.RTN_QUANTITY,Dat' +
      'a0002.UNIT_NAME,Data0022.rohs,Data0022.SUPPLIER2,Data0207.D0022_' +
      'PTR, '#13#10'       Data0022.QUAN_ON_HAND,Data0207.INVENTORY_PTR,Data0' +
      '207.RKEY,Data0017.QUAN_ON_HAND AS hand17, '#13#10'       Data0023.ABBR' +
      '_NAME'#13#10'FROM   Data0207 INNER JOIN'#13#10'       Data0017 ON Data0207.I' +
      'NVENTORY_PTR = Data0017.RKEY INNER JOIN'#13#10'       Data0022 ON Data' +
      '0207.D0022_PTR = Data0022.RKEY INNER JOIN'#13#10'       Data0002 ON Da' +
      'ta0022.LOCATION_PTR_FROM = Data0002.RKEY INNER JOIN'#13#10'       Data' +
      '0456 ON Data0022.GRN_PTR = Data0456.RKEY INNER JOIN'#13#10'       Data' +
      '0023 ON Data0456.SUPP_PTR = Data0023.RKEY'#13#10'where gon_ptr=:rkey'
    Params = <
      item
        DataType = ftUnknown
        Name = 'rkey'
        ParamType = ptUnknown
      end>
    Left = 96
    Top = 128
  end
  object frxrprt2: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42677.595161006900000000
    ReportOptions.LastChange = 42821.445591585650000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 392
    Top = 80
    Datasets = <
      item
        DataSet = frxdbdtst208
        DataSetName = 'ds208'
      end
      item
        DataSet = frxdbdtst457
        DataSetName = 'ds457'
      end
      item
        DataSet = frxdbdtst493
        DataSetName = 'ds493'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 256
      LeftMargin = 6.400000000000000000
      RightMargin = 6.400000000000000000
      TopMargin = 6.400000000000000000
      BottomMargin = 6.400000000000000000
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        Height = 75.590600000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 745.323316000000000000
        object Memo8: TfrxMemoView
          Left = 264.567100000000000000
          Top = 45.354360000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #20986#24211#21333'('#26434#39033')')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 207.874150000000000000
          Width = 249.448980000000000000
          Height = 18.897650000000000000
          DataField = #20844#21496#21517#31216'1'
          DataSet = frxdbdtst493
          DataSetName = 'ds493'
          Memo.UTF8W = (
            '[ds493."'#20844#21496#21517#31216'1"]')
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 24.677180000000000000
        Top = 241.889920000000000000
        Width = 745.323316000000000000
        object Memo2: TfrxMemoView
          Left = 0.779530000000000000
          Top = 2.000000000000000000
          Width = 132.283550000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #29289#21697#21517#31216' ')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 132.622140000000000000
          Top = 2.000000000000000000
          Width = 366.614410000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #29289#21697#35268#26684)
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 499.016080000000000000
          Top = 2.000000000000000000
          Width = 56.692950000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #21333#20301)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 555.709030000000000000
          Top = 2.000000000000000000
          Width = 45.354360000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #25968#37327)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 600.842920000000000000
          Top = 2.000000000000000000
          Width = 117.165430000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #29615#20445#26631#35782)
          ParentFont = False
        end
      end
      object TfrxMemoView
      end
      object TfrxMemoView
      end
      object TfrxMemoView
      end
      object TfrxMemoView
      end
      object TfrxMemoView
      end
      object TfrxMemoView
      end
      object TfrxMemoView
      end
      object TfrxMemoView
      end
      object TfrxMemoView
      end
      object TfrxMemoView
      end
      object TfrxMemoView
      end
      object TfrxMemoView
      end
      object TfrxMemoView
      end
      object TfrxMemoView
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 64.252010000000000000
        Top = 154.960730000000000000
        Width = 745.323316000000000000
        DataSet = frxdbdtst457
        DataSetName = 'ds457'
        RowCount = 0
        object Memo10: TfrxMemoView
          Left = 3.779530000000000000
          Top = 37.795300000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #39046#26009#37096#38376#65306)
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 479.779840000000000000
          Top = 41.574830000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #20986#24211#26085#26399#65306)
          ParentFont = False
        end
        object ds457CREATE_DATE: TfrxMemoView
          Left = 550.370440000000000000
          Top = 41.574830000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          DataField = 'CREATE_DATE'
          DataSet = frxdbdtst457
          DataSetName = 'ds457'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[ds457."CREATE_DATE"]')
          ParentFont = False
        end
        object ds457DEPT_NAME: TfrxMemoView
          Left = 83.149660000000000000
          Top = 37.795300000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          DataField = 'DEPT_NAME'
          DataSet = frxdbdtst457
          DataSetName = 'ds457'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[ds457."DEPT_NAME"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 526.913730000000000000
          Top = 9.338590000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #20986#24211#21333#21495#65306)
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 610.063390000000000000
          Top = 7.559060000000000000
          Width = 120.944960000000000000
          Height = 22.677180000000000000
          DataField = 'GON_NUMBER'
          DataSet = frxdbdtst457
          DataSetName = 'ds457'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[ds457."GON_NUMBER"]')
          ParentFont = False
        end
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        Height = 41.574830000000000000
        Top = 291.023810000000000000
        Width = 745.323316000000000000
        DataSet = frxdbdtst208
        DataSetName = 'ds208'
        RowCount = 0
        object ds207rohs: TfrxMemoView
          Left = 600.165740000000000000
          Width = 117.165430000000000000
          Height = 41.574830000000000000
          DataField = 'rohs'
          DataSet = frxdbdtst208
          DataSetName = 'ds208'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[ds208."rohs"]')
          ParentFont = False
        end
        object ds207goods_name: TfrxMemoView
          Top = 0.779530000000000000
          Width = 132.283550000000000000
          Height = 41.574830000000000000
          DataField = 'goods_name'
          DataSet = frxdbdtst208
          DataSetName = 'ds208'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[ds208."goods_name"]')
          ParentFont = False
        end
        object ds207goods_guige: TfrxMemoView
          Left = 132.504020000000000000
          Width = 366.614410000000000000
          Height = 41.574830000000000000
          DataField = 'goods_guige'
          DataSet = frxdbdtst208
          DataSetName = 'ds208'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[ds208."goods_guige"]')
          ParentFont = False
        end
        object ds207UNIT_NAME: TfrxMemoView
          Left = 497.897960000000000000
          Width = 56.692950000000000000
          Height = 41.574830000000000000
          DataField = 'UNIT_NAME'
          DataSet = frxdbdtst208
          DataSetName = 'ds208'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[ds208."UNIT_NAME"]')
          ParentFont = False
        end
        object ds207QUANTITY: TfrxMemoView
          Left = 554.811380000000000000
          Width = 45.354360000000000000
          Height = 41.574830000000000000
          DataField = 'QUANTITY'
          DataSet = frxdbdtst208
          DataSetName = 'ds208'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[ds208."QUANTITY"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 393.071120000000000000
        Width = 745.323316000000000000
        object Memo11: TfrxMemoView
          Left = 11.338590000000000000
          Top = 3.779530000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #39046#26009#20154#65306)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 204.094620000000000000
          Top = 3.779530000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #21457#26009#20154#65306)
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 464.882190000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #22791#27880#65306)
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 291.023810000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = #21457#26009#20154#21592
          DataSet = frxdbdtst457
          DataSetName = 'ds457'
          Memo.UTF8W = (
            '[ds457."'#21457#26009#20154#21592'"]')
        end
        object ds457EMPLOYEE_NAME: TfrxMemoView
          Left = 79.370130000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'EMPLOYEE_NAME'
          DataSet = frxdbdtst457
          DataSetName = 'ds457'
          Memo.UTF8W = (
            '[ds457."EMPLOYEE_NAME"]')
        end
        object Memo16: TfrxMemoView
          Left = 525.354670000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          DataField = #22791#27880
          DataSet = frxdbdtst457
          DataSetName = 'ds457'
          Memo.UTF8W = (
            '[ds457."'#22791#27880'"]')
        end
      end
    end
  end
  object frxdbdtst457: TfrxDBDataset
    UserName = 'ds457'
    CloseDataSource = False
    FieldAliases.Strings = (
      'RKEY=RKEY'
      'GON_NUMBER=GON_NUMBER'
      'REF_NUMBER=REF_NUMBER'
      'CREATE_DATE=CREATE_DATE'
      'ABBR_NAME=ABBR_NAME'
      'TTYPE=TTYPE'
      'DEPT_CODE=DEPT_CODE'
      'DEPT_NAME=DEPT_NAME'
      'EMPLOYEE_NAME=EMPLOYEE_NAME'
      #21457#26009#20154#21592'='#21457#26009#20154#21592
      #20986#20179#31867#22411'='#20986#20179#31867#22411
      #29366#24577'='#29366#24577
      #22791#27880'='#22791#27880)
    DataSet = cds457
    BCDToCurrency = False
    Left = 192
    Top = 64
  end
  object frxdbdtst208: TfrxDBDataset
    UserName = 'ds208'
    CloseDataSource = False
    FieldAliases.Strings = (
      'goods_name=goods_name'
      'goods_guige=goods_guige'
      'goods_type=goods_type'
      'rohs=rohs'
      'UNIT_NAME=UNIT_NAME'
      'rkey=RKEY'
      'SOURCE_PTR=SOURCE_PTR'
      'DEPT_PTR=DEPT_PTR'
      'GON_PTR=GON_PTR'
      'TRANSACTION_PTR=TRANSACTION_PTR'
      'GL_HDR_PTR=GL_HDR_PTR'
      'TDATE=TDATE'
      'QUANTITY=QUANTITY'
      'RTN_QUANTITY=RTN_QUANTITY'
      'D457_IDKey=D457_IDKey')
    DataSet = cds208
    BCDToCurrency = False
    Left = 200
    Top = 128
  end
  object qry457: TADOQuery
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\System\Ole DB\Data Links' +
      '\8.112.udl'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT dbo.Data0457.RKEY, dbo.Data0457.GON_NUMBER, '
      '     dbo.Data0457.REF_NUMBER, '
      '      dbo.Data0457.CREATE_DATE, '
      '      dbo.Data0015.ABBR_NAME, data0457.TTYPE,'
      '      dbo.Data0034.DEPT_CODE, dbo.Data0034.DEPT_NAME, '
      '      dbo.Data0005.EMPLOYEE_NAME,'
      'Data0005_1.EMPLOYEE_NAME as '#21457#26009#20154#21592','
      'case data0457.ttype when 1 then '#39#25353#37197#26009#21333#39
      'when 2 then '#39#25353#37096#38376#39' when 3 then '#39#21457#26009#21040#36710#38388#39
      'when 4 then '#39#29289#26009#36864#20179#39' when 5 then '#39#26434#39033#29289#21697#39
      'when 6 then '#39#26434#39033#36864#20179#39
      'end as '#20986#20179#31867#22411','
      'case data0457.status when 0 then '#39#26410#23457#35745#39
      'when 1 then '#39#24050#23457#35745#39
      'end as '#29366#24577',Data0457.Cut_No as '#22791#27880
      'FROM dbo.Data0457 INNER JOIN'
      
        '      dbo.Data0015 ON dbo.Data0457.warehouse_ptr = dbo.Data0015.' +
        'RKEY INNER JOIN'
      
        '      dbo.Data0034 ON dbo.Data0457.dept_ptr = dbo.Data0034.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0005 ON dbo.Data0457.RECD_BY = dbo.Data0005.RKEY I' +
        'NNER JOIN'
      
        '      dbo.Data0005 Data0005_1 ON dbo.Data0457.CREATE_BY = Data00' +
        '05_1.RKEY'
      'where data0457.rkey=19')
    Left = 32
    Top = 64
    object qry457RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object qry457GON_NUMBER: TStringField
      FieldName = 'GON_NUMBER'
      Size = 10
    end
    object qry457REF_NUMBER: TStringField
      FieldName = 'REF_NUMBER'
      Size = 15
    end
    object qry457CREATE_DATE: TDateTimeField
      FieldName = 'CREATE_DATE'
    end
    object qry457ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object qry457TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object qry457DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object qry457DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object qry457EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object qry457发料人员: TStringField
      FieldName = #21457#26009#20154#21592
      Size = 16
    end
    object qry457出仓类型: TStringField
      FieldName = #20986#20179#31867#22411
      ReadOnly = True
      Size = 10
    end
    object qry457状态: TStringField
      FieldName = #29366#24577
      ReadOnly = True
      Size = 6
    end
    object qry457备注: TStringField
      FieldName = #22791#27880
      Size = 40
    end
  end
  object qry208: TADOQuery
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\System\Ole DB\Data Links' +
      '\8.112.udl'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        ' select  b.goods_name ,b.goods_guige  ,b.goods_type  , b.rohs   ' +
        ','
      ' c.UNIT_NAME ,a.*'
      ' from data0208  a'
      ' inner join Data0235 b  on a.SOURCE_PTR=b.RKEY'
      ' inner join Data0002 c on b.unit_ptr=c.rkey'
      ' where a.rkey=0')
    Left = 32
    Top = 128
    object qry208goods_name: TStringField
      FieldName = 'goods_name'
      Size = 60
    end
    object qry208goods_guige: TStringField
      FieldName = 'goods_guige'
      Size = 200
    end
    object qry208goods_type: TStringField
      FieldName = 'goods_type'
    end
    object qry208rohs: TStringField
      FieldName = 'rohs'
      Size = 10
    end
    object qry208UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object qry208rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object qry208SOURCE_PTR: TIntegerField
      FieldName = 'SOURCE_PTR'
    end
    object qry208DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object qry208GON_PTR: TIntegerField
      FieldName = 'GON_PTR'
    end
    object qry208TRANSACTION_PTR: TIntegerField
      FieldName = 'TRANSACTION_PTR'
    end
    object qry208GL_HDR_PTR: TIntegerField
      FieldName = 'GL_HDR_PTR'
    end
    object qry208TDATE: TDateTimeField
      FieldName = 'TDATE'
    end
    object qry208QUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
    object qry208RTN_QUANTITY: TFloatField
      FieldName = 'RTN_QUANTITY'
    end
    object qry208D457_IDKey: TStringField
      FieldName = 'D457_IDKey'
      FixedChar = True
      Size = 38
    end
  end
  object cds493: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT Company_Name as '#20844#21496#21517#31216'1, '#13#10'Company_Name2 as '#20844#21496#21517#31216'2, '#13#10'Compan' +
      'y_Name3 as '#20844#21496#21517#31216'3, '#13#10'ship_address as '#20844#21496#22320#22336','#13#10'Company_Icon as '#20844#21496#22270#26631',' +
      ' '#13#10'SITE_INFO_ADD_1 as '#20844#21496#20301#32622'1, '#13#10'SITE_INFO_ADD_2 as '#20844#21496#20301#32622'2, '#13#10'SITE_' +
      'INFO_ADD_3 as '#20844#21496#20301#32622'3, '#13#10'SITE_INFO_PHONE as '#30005#35805#13#10'FROM DATA0493'#13#10
    Params = <>
    Left = 96
    Top = 184
  end
  object qry493: TADOQuery
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\System\Ole DB\Data Links' +
      '\8.112.udl'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT Company_Name as '#20844#21496#21517#31216'1, '
      'Company_Name2 as '#20844#21496#21517#31216'2, '
      'Company_Name3 as '#20844#21496#21517#31216'3, '
      'ship_address as '#20844#21496#22320#22336','
      'Company_Icon as '#20844#21496#22270#26631', '
      'SITE_INFO_ADD_1 as '#20844#21496#20301#32622'1, '
      'SITE_INFO_ADD_2 as '#20844#21496#20301#32622'2, '
      'SITE_INFO_ADD_3 as '#20844#21496#20301#32622'3, '
      'SITE_INFO_PHONE as '#30005#35805
      'FROM DATA0493')
    Left = 32
    Top = 184
    object strngfldqry493公司名称1: TStringField
      FieldName = #20844#21496#21517#31216'1'
      Size = 50
    end
    object strngfldqry493公司名称2: TStringField
      FieldName = #20844#21496#21517#31216'2'
      Size = 50
    end
    object strngfldqry493公司名称3: TStringField
      FieldName = #20844#21496#21517#31216'3'
      Size = 50
    end
    object strngfldqry493公司地址: TStringField
      FieldName = #20844#21496#22320#22336
      Size = 50
    end
    object blbfldqry493公司图标: TBlobField
      FieldName = #20844#21496#22270#26631
    end
    object strngfldqry493公司位置1: TStringField
      FieldName = #20844#21496#20301#32622'1'
      FixedChar = True
      Size = 50
    end
    object strngfldqry493公司位置2: TStringField
      FieldName = #20844#21496#20301#32622'2'
      FixedChar = True
      Size = 50
    end
    object strngfldqry493公司位置3: TStringField
      FieldName = #20844#21496#20301#32622'3'
      FixedChar = True
      Size = 50
    end
    object strngfldqry493电话: TStringField
      FieldName = #30005#35805
      FixedChar = True
      Size = 30
    end
  end
  object frxdbdtst493: TfrxDBDataset
    UserName = 'ds493'
    CloseDataSource = False
    FieldAliases.Strings = (
      #20844#21496#21517#31216'1='#20844#21496#21517#31216'1'
      #20844#21496#21517#31216'2='#20844#21496#21517#31216'2'
      #20844#21496#21517#31216'3='#20844#21496#21517#31216'3'
      #20844#21496#22320#22336'='#20844#21496#22320#22336
      #20844#21496#22270#26631'='#20844#21496#22270#26631
      #20844#21496#20301#32622'1='#20844#21496#20301#32622'1'
      #20844#21496#20301#32622'2='#20844#21496#20301#32622'2'
      #20844#21496#20301#32622'3='#20844#21496#20301#32622'3'
      #30005#35805'='#30005#35805)
    DataSet = cds493
    BCDToCurrency = False
    Left = 200
    Top = 184
  end
end
