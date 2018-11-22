object Form4: TForm4
  Left = 238
  Top = 144
  Width = 928
  Height = 560
  Caption = #29983#20135#29289#26009#37319#36141#21015#34920
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 912
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 375
      Top = 12
      Width = 113
      Height = 13
      Alignment = taRightJustify
      Caption = '    '#37319#36141#25968#37327#21512#35745':'
    end
    object Label2: TLabel
      Left = 576
      Top = 12
      Width = 80
      Height = 13
      Alignment = taRightJustify
      Caption = '   '#37329#39069#21512#35745':'
    end
    object Label3: TLabel
      Left = 205
      Top = 11
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #37319#36141#32534#21495
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clDefault
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Button1: TButton
      Left = 0
      Top = 8
      Width = 67
      Height = 25
      Caption = #36864#20986
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 66
      Top = 8
      Width = 67
      Height = 25
      Caption = #23548#20986'Excel'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Edit1: TEdit
      Left = 495
      Top = 8
      Width = 89
      Height = 21
      TabStop = False
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 2
      Text = '0.00'
    end
    object Edit2: TEdit
      Left = 665
      Top = 8
      Width = 121
      Height = 21
      TabStop = False
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 3
      Text = '0.0000'
    end
    object Edit3: TEdit
      Left = 274
      Top = 5
      Width = 121
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnChange = Edit3Change
    end
  end
  object DBGrid1: TDBGridEh
    Left = 0
    Top = 41
    Width = 912
    Height = 481
    Align = alClient
    DataSource = DataSource1
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = GB2312_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    TabOrder = 1
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'PO_NUMBER'
        Footers = <>
        Title.Color = clRed
        Title.SortIndex = 1
        Title.SortMarker = smUpEh
        Width = 83
      end
      item
        EditButtons = <>
        FieldName = 'PO_DATE'
        Footers = <>
        Width = 85
      end
      item
        EditButtons = <>
        FieldName = 'DATE_EDITED'
        Footers = <>
        Width = 87
      end
      item
        EditButtons = <>
        FieldName = 'EXPIRED_DATE'
        Footers = <>
        Width = 82
      end
      item
        EditButtons = <>
        FieldName = 'INV_PART_NUMBER'
        Footers = <>
        Width = 103
      end
      item
        EditButtons = <>
        FieldName = 'inv_part_description'
        Footers = <>
        Width = 132
      end
      item
        EditButtons = <>
        FieldName = 'EMPLOYEE_NAME'
        Footers = <>
        Width = 63
      end
      item
        EditButtons = <>
        FieldName = 'v_status'
        Footers = <>
        Width = 87
      end
      item
        EditButtons = <>
        FieldName = 'GROUP_DESC'
        Footers = <>
        Width = 58
      end
      item
        EditButtons = <>
        FieldName = 'UNIT_NAME'
        Footers = <>
        Width = 59
      end
      item
        EditButtons = <>
        FieldName = 'ABBR_NAME'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'QUAN_ORD'
        Footers = <>
        Title.Caption = #35746#21333#25968#37327
        Width = 61
      end
      item
        EditButtons = <>
        FieldName = 'PRICE'
        Footers = <>
        Title.Caption = #19981#21547#31246#21333#20215
      end
      item
        EditButtons = <>
        FieldName = 'tax_PRICE'
        Footers = <>
        Width = 54
      end
      item
        EditButtons = <>
        FieldName = 'QUAN_RECD'
        Footers = <>
        Title.Caption = #24050#25910#36135#25968#37327
      end
      item
        EditButtons = <>
        FieldName = 'no_recd'
        Footers = <>
        Title.Caption = #27424#36135#25968#37327
      end
      item
        EditButtons = <>
        FieldName = 'CURR_CODE'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'total'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'req_date'
        Footers = <>
        Width = 89
      end
      item
        EditButtons = <>
        FieldName = 'recd_date'
        Footers = <>
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'ANALYSIS_CODE_2'
        Footers = <>
        Width = 88
      end
      item
        EditButtons = <>
        FieldName = 'rohs'
        Footers = <>
        Width = 63
      end
      item
        EditButtons = <>
        FieldName = 'wh_abb_name'
        Footers = <>
        Width = 49
      end
      item
        EditButtons = <>
        FieldName = 'reason'
        Footers = <>
        Title.Caption = #35831#36141#21407#22240
        Width = 212
      end
      item
        EditButtons = <>
        FieldName = #37319#36141#35746#21333#35760#20107#26412
        Footers = <>
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'extra_req'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'PO_REQ_NUMBER'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'DEPARTMENT_NAME'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'DEPT_NAME'
        Footers = <>
        Width = 85
      end
      item
        EditButtons = <>
        FieldName = 'req_employeename'
        Footers = <>
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 432
    Top = 55
  end
  object ADOQuery1: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    BeforeInsert = ADOQuery1BeforeInsert
    BeforeEdit = ADOQuery1BeforeEdit
    BeforePost = ADOQuery1BeforePost
    BeforeDelete = ADOQuery1BeforeDelete
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      
        'SELECT     dbo.Data0070.PO_NUMBER, dbo.Data0070.PO_DATE, Data000' +
        '5_1.EMPLOYEE_NAME, dbo.Data0017.INV_PART_NUMBER, dbo.Data0070.DA' +
        'TE_EDITED, '
      
        '                      dbo.Data0023.ABBR_NAME, dbo.Data0071.QUAN_' +
        'ORD, dbo.Data0071.tax_price, dbo.Data0070.EXPIRED_DATE, dbo.Data' +
        '0071.QUAN_RECD, '
      
        '                      dbo.Data0071.QUAN_ORD - dbo.Data0071.QUAN_' +
        'RECD AS no_recd, dbo.Data0071.QUAN_ORD * dbo.Data0071.tax_price ' +
        '* dbo.Data0070.EXCHANGE_RATE AS total, '
      
        '                      dbo.Data0001.CURR_CODE, dbo.Data0070.STATU' +
        'S, dbo.Data0002.UNIT_NAME, dbo.Data0017.INV_PART_DESCRIPTION, db' +
        'o.Data0071.rohs, '
      
        '                      dbo.Data0071.recd_DATE, dbo.Data0071.REQ_D' +
        'ATE, dbo.Data0070.ANALYSIS_CODE_2, dbo.Data0015.ABBR_NAME AS wh_' +
        'abb_name, dbo.Data0496.GROUP_DESC, '
      
        '                      dbo.Data0071.reason, ROUND(dbo.Data0071.PR' +
        'ICE, 6) AS price, dbo.Data0071.extra_req, ISNULL(dbo.Data0011.NO' +
        'TE_PAD_LINE_1, '#39#39') '
      
        '                      + ISNULL(dbo.Data0011.NOTE_PAD_LINE_2, '#39#39')' +
        ' + ISNULL(dbo.Data0011.NOTE_PAD_LINE_3, '#39#39') + ISNULL(dbo.Data001' +
        '1.NOTE_PAD_LINE_4, '#39#39') AS '#37319#36141#35746#21333#35760#20107#26412', '
      
        '                      ISNULL(dbo.Data0034.DEPT_NAME, data0034_1.' +
        'DEPT_NAME) AS dept_name, ISNULL(dbo.Data0005.EMPLOYEE_NAME, dbo.' +
        'Data0070.ANALYSIS_CODE_1) '
      
        '                      AS req_employeename, isnull(dbo.Data0068.P' +
        'O_REQ_NUMBER,data0070.fob) as PO_REQ_NUMBER,'
      
        ' ISNULL(dbo.Data0068.DEPARTMENT_NAME, dbo.Data0070.PO_REV_NO) AS' +
        ' DEPARTMENT_NAME'
      'FROM         dbo.Data0011 RIGHT OUTER JOIN'
      '                      dbo.Data0005 AS Data0005_1 INNER JOIN'
      
        '                      dbo.Data0070 ON Data0005_1.RKEY = dbo.Data' +
        '0070.EMPLOYEE_POINTER INNER JOIN'
      
        '                      dbo.Data0071 ON dbo.Data0070.RKEY = dbo.Da' +
        'ta0071.PO_PTR INNER JOIN'
      
        '                      dbo.Data0017 ON dbo.Data0071.INVT_PTR = db' +
        'o.Data0017.RKEY INNER JOIN'
      
        '                      dbo.Data0001 ON dbo.Data0070.CURRENCY_PTR ' +
        '= dbo.Data0001.RKEY INNER JOIN'
      
        '                      dbo.Data0023 ON dbo.Data0070.SUPPLIER_POIN' +
        'TER = dbo.Data0023.RKEY INNER JOIN'
      
        '                      dbo.Data0002 ON dbo.Data0071.PURCHASE_UNIT' +
        '_PTR = dbo.Data0002.RKEY INNER JOIN'
      
        '                      dbo.Data0015 ON dbo.Data0070.WAREHOUSE_POI' +
        'NTER = dbo.Data0015.RKEY INNER JOIN'
      
        '                      dbo.Data0496 ON dbo.Data0017.GROUP_PTR = d' +
        'bo.Data0496.RKEY ON dbo.Data0011.FILE_POINTER = dbo.Data0070.RKE' +
        'Y AND '
      
        '                      dbo.Data0011.SOURCE_TYPE = 70 LEFT OUTER J' +
        'OIN'
      '                      dbo.Data0069 LEFT OUTER JOIN'
      '                      dbo.Data0068 LEFT OUTER JOIN'
      
        '                      dbo.Data0005 ON dbo.Data0068.REQ_BY = dbo.' +
        'Data0005.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0034 ON dbo.Data0068.DEPARTMENT_NA' +
        'ME = dbo.Data0034.DEPT_CODE ON dbo.Data0069.PURCH_REQ_PTR = dbo.' +
        'Data0068.RKEY ON '
      
        '                      dbo.Data0071.rkey69 = dbo.Data0069.RKEY LE' +
        'FT OUTER JOIN'
      
        '                      dbo.Data0034 AS data0034_1 ON dbo.Data0070' +
        '.PO_REV_NO = data0034_1.DEPT_CODE'
      'WHERE     (dbo.Data0071.QUAN_ORD > 0)')
    Left = 472
    Top = 55
    object ADOQuery1PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#32534#21495
      DisplayWidth = 18
      FieldName = 'PO_NUMBER'
      ReadOnly = True
      Size = 15
    end
    object ADOQuery1PO_DATE: TDateTimeField
      DisplayLabel = #37319#36141#26085#26399
      DisplayWidth = 22
      FieldName = 'PO_DATE'
      ReadOnly = True
    end
    object ADOQuery1DATE_EDITED: TDateTimeField
      DisplayLabel = #25552#20132#23457#25209#26085#26399
      FieldName = 'DATE_EDITED'
      ReadOnly = True
    end
    object ADOQuery1EXPIRED_DATE: TDateTimeField
      DisplayLabel = #26368#21518#23457#25209#26085#26399
      FieldName = 'EXPIRED_DATE'
      ReadOnly = True
    end
    object ADOQuery1EMPLOYEE_NAME: TStringField
      DisplayLabel = #37319#36141#21592#24037
      DisplayWidth = 16
      FieldName = 'EMPLOYEE_NAME'
      ReadOnly = True
      Size = 16
    end
    object ADOQuery1v_status: TStringField
      DisplayLabel = #37319#36141#35746#21333#29366#24577
      FieldKind = fkCalculated
      FieldName = 'v_status'
      ReadOnly = True
      Size = 6
      Calculated = True
    end
    object ADOQuery1INV_PART_NUMBER: TStringField
      DisplayLabel = #29289#26009#32534#30721
      DisplayWidth = 28
      FieldName = 'INV_PART_NUMBER'
      ReadOnly = True
      Size = 25
    end
    object ADOQuery1inv_part_description: TStringField
      DisplayLabel = #29289#26009#25551#36848
      FieldName = 'inv_part_description'
      ReadOnly = True
      Size = 100
    end
    object ADOQuery1UNIT_NAME: TStringField
      DisplayLabel = #37319#36141#21333#20301
      DisplayWidth = 15
      FieldName = 'UNIT_NAME'
      ReadOnly = True
    end
    object ADOQuery1CODE: TStringField
      DisplayLabel = #20379#24212#21830
      DisplayWidth = 7
      FieldName = 'ABBR_NAME'
      ReadOnly = True
      Size = 10
    end
    object ADOQuery1QUAN_ORD: TFloatField
      DisplayLabel = #35746#36141#25968#37327
      DisplayWidth = 12
      FieldName = 'QUAN_ORD'
      ReadOnly = True
    end
    object ADOQuery1QUAN_RECD: TFloatField
      DisplayLabel = #24050#25910#25968#37327
      FieldName = 'QUAN_RECD'
      ReadOnly = True
    end
    object ADOQuery1no_recd: TFloatField
      DisplayLabel = #26410#25910#25968#37327
      FieldName = 'no_recd'
      ReadOnly = True
    end
    object ADOQuery1CURR_CODE: TStringField
      DisplayLabel = #36135#24065
      DisplayWidth = 6
      FieldName = 'CURR_CODE'
      ReadOnly = True
      Size = 5
    end
    object ADOQuery1total: TFloatField
      DisplayLabel = #24635#35745#37329#39069'('#26412#20301#24065')'
      FieldName = 'total'
      ReadOnly = True
      DisplayFormat = '0.000'
    end
    object ADOQuery1STATUS: TWordField
      FieldName = 'STATUS'
      ReadOnly = True
      Visible = False
    end
    object ADOQuery1req_date: TDateTimeField
      DisplayLabel = #35201#27714#21040#36135#26085#26399
      FieldName = 'req_date'
      ReadOnly = True
    end
    object ADOQuery1recd_date: TDateTimeField
      DisplayLabel = #26368#21518#25910#36135#26085#26399
      FieldName = 'recd_date'
      ReadOnly = True
    end
    object ADOQuery1ANALYSIS_CODE_2: TStringField
      DisplayLabel = #37319#36141#29289#26009#31867#21035
      FieldName = 'ANALYSIS_CODE_2'
      ReadOnly = True
    end
    object ADOQuery1PRICE: TFloatField
      FieldName = 'PRICE'
      ReadOnly = True
    end
    object ADOQuery1tax_PRICE: TFloatField
      DisplayLabel = #21547#31246#20215
      FieldName = 'tax_PRICE'
      ReadOnly = True
    end
    object ADOQuery1rohs: TStringField
      DisplayLabel = #29615#20445#26631#35782
      FieldName = 'rohs'
      ReadOnly = True
      Size = 10
    end
    object ADOQuery1wh_abb_name: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'wh_abb_name'
      ReadOnly = True
      Size = 10
    end
    object ADOQuery1GROUP_DESC: TStringField
      DisplayLabel = #29289#26009#31867#21035
      FieldName = 'GROUP_DESC'
      ReadOnly = True
      Size = 30
    end
    object wdstrngfldADOQuery1reason: TWideStringField
      FieldName = 'reason'
      ReadOnly = True
      Size = 50
    end
    object ADOQuery1DSDesigner: TStringField
      DisplayWidth = 20
      FieldName = #37319#36141#35746#21333#35760#20107#26412
      ReadOnly = True
      Size = 510
    end
    object ADOQuery1extra_req: TStringField
      DisplayLabel = #29305#21035#35201#27714
      DisplayWidth = 30
      FieldName = 'extra_req'
      Size = 50
    end
    object ADOQuery1DEPT_NAME: TStringField
      DisplayLabel = #35831#36141#37096#38376#21517#31216
      FieldName = 'DEPT_NAME'
      ReadOnly = True
      Size = 30
    end
    object ADOQuery1req_employeename: TStringField
      DisplayLabel = #35831#36141#20154#21592
      FieldName = 'req_employeename'
      ReadOnly = True
      Size = 16
    end
    object ADOQuery1PO_REQ_NUMBER: TStringField
      DisplayLabel = #35831#36141#32534#21495
      FieldName = 'PO_REQ_NUMBER'
      ReadOnly = True
      Size = 15
    end
    object ADOQuery1DEPARTMENT_NAME: TStringField
      DisplayLabel = #35831#36141#37096#38376#20195#30721
      FieldName = 'DEPARTMENT_NAME'
      ReadOnly = True
      Size = 10
    end
  end
end
