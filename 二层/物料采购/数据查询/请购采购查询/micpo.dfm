object Form5: TForm5
  Left = 237
  Top = 147
  Width = 968
  Height = 560
  Caption = #38750#29983#20135#29289#26009#37319#36141#21015#34920
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
    Width = 960
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 374
      Top = 12
      Width = 113
      Height = 13
      Alignment = taRightJustify
      Caption = '    '#37319#36141#25968#37327#21512#35745':'
    end
    object Label2: TLabel
      Left = 575
      Top = 12
      Width = 80
      Height = 13
      Alignment = taRightJustify
      Caption = '   '#37329#39069#21512#35745':'
    end
    object Label3: TLabel
      Left = 205
      Top = 14
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
      Left = 2
      Top = 8
      Width = 68
      Height = 25
      Caption = #36864#20986
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 69
      Top = 8
      Width = 68
      Height = 25
      Caption = #23548#20986'Excel'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Edit1: TEdit
      Left = 494
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
      Left = 664
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
      Top = 8
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
    Width = 960
    Height = 492
    Align = alClient
    DataSource = DataSource1
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = GB2312_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    ReadOnly = True
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
        Width = 86
      end
      item
        EditButtons = <>
        FieldName = 'PO_DATE'
        Footers = <>
        Width = 89
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
        Width = 84
      end
      item
        EditButtons = <>
        FieldName = 'DESCRIPTION'
        Footers = <>
        Width = 94
      end
      item
        EditButtons = <>
        FieldName = 'gui_ge'
        Footers = <>
        Width = 113
      end
      item
        EditButtons = <>
        FieldName = 'EMPLOYEE_NAME'
        Footers = <>
        Width = 57
      end
      item
        EditButtons = <>
        FieldName = 'v_status'
        Footers = <>
        Width = 84
      end
      item
        EditButtons = <>
        FieldName = 'ABBR_NAME'
        Footers = <>
        Width = 54
      end
      item
        EditButtons = <>
        FieldName = 'DESCRIPTION2'
        Footers = <>
        Width = 85
      end
      item
        EditButtons = <>
        FieldName = 'UNIT_NAME'
        Footers = <>
        Width = 59
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
        FieldName = 'quantity_received'
        Footers = <>
        Title.Caption = #24050#25910#36135#25968#37327
        Width = 59
      end
      item
        EditButtons = <>
        FieldName = 'no_recd'
        Footers = <>
        Title.Caption = #27424#36135#25968#37327
        Width = 58
      end
      item
        EditButtons = <>
        FieldName = 'UNIT_PRICE'
        Footers = <>
        Title.Caption = #19981#21547#31246#21333#20215
      end
      item
        EditButtons = <>
        FieldName = 'tax_PRICE'
        Footers = <>
        Width = 49
      end
      item
        EditButtons = <>
        FieldName = 'total'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'CURR_CODE'
        Footers = <>
        Width = 35
      end
      item
        EditButtons = <>
        FieldName = 'del_date'
        Footers = <>
        Width = 88
      end
      item
        EditButtons = <>
        FieldName = 'recd_date'
        Footers = <>
        Width = 85
      end
      item
        EditButtons = <>
        FieldName = 'rohs'
        Footers = <>
        Width = 57
      end
      item
        EditButtons = <>
        FieldName = 'wh_abb_name'
        Footers = <>
        Width = 67
      end
      item
        EditButtons = <>
        FieldName = 'reason'
        Footers = <>
        Title.Caption = #35831#36141#21407#22240
      end
      item
        EditButtons = <>
        FieldName = #37319#36141#35746#21333#35760#20107#26412
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
        Width = 89
      end
      item
        EditButtons = <>
        FieldName = 'req_employeename'
        Footers = <>
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 336
    Top = 123
  end
  object ADOQuery1: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      
        'SELECT      dbo.Data0070.PO_NUMBER, dbo.Data0070.PO_DATE, dbo.Da' +
        'ta0070.DATE_EDITED, Data0005_1.EMPLOYEE_NAME, dbo.Data0023.ABBR_' +
        'NAME, '
      
        '                      dbo.Data0001.CURR_CODE, dbo.Data0072.DESCR' +
        'IPTION, dbo.Data0072.DESCRIPTION2, dbo.Data0072.GUI_GE, dbo.Data' +
        '0072.QUAN_ORD, dbo.Data0072.tax_price, '
      
        '                      dbo.Data0072.QUANTITY_RECEIVED, dbo.Data00' +
        '72.QUAN_ORD - dbo.Data0072.QUANTITY_RECEIVED AS no_recd, '
      
        '                      dbo.Data0072.QUAN_ORD * dbo.Data0072.tax_p' +
        'rice * dbo.Data0070.EXCHANGE_RATE AS total, dbo.Data0002.UNIT_NA' +
        'ME, dbo.Data0070.STATUS, '
      
        '                      dbo.Data0070.EXPIRED_DATE, dbo.Data0072.DE' +
        'L_DATE, dbo.Data0072.recd_date, dbo.Data0072.rohs, dbo.Data0015.' +
        'ABBR_NAME AS wh_abb_name, '
      
        '                      dbo.Data0072.reason, ROUND(dbo.Data0072.UN' +
        'IT_PRICE, 6) AS unit_price, ISNULL(dbo.Data0011.NOTE_PAD_LINE_1,' +
        ' '#39#39') + ISNULL(dbo.Data0011.NOTE_PAD_LINE_2,'
      
        '                       '#39#39') + ISNULL(dbo.Data0011.NOTE_PAD_LINE_3' +
        ', '#39#39') + ISNULL(dbo.Data0011.NOTE_PAD_LINE_4, '#39#39') AS '#37319#36141#35746#21333#35760#20107#26412','
      
        '                      ISNULL(dbo.Data0034.DEPT_NAME, data0034_1.' +
        'DEPT_NAME) AS dept_name, ISNULL(dbo.Data0005.EMPLOYEE_NAME, dbo.' +
        'Data0070.ANALYSIS_CODE_1) '
      
        '                      AS req_employeename, isnull(dbo.Data0068.P' +
        'O_REQ_NUMBER,data0070.fob) as PO_REQ_NUMBER,'
      
        '                    ISNULL(dbo.Data0068.DEPARTMENT_NAME, dbo.Dat' +
        'a0070.PO_REV_NO) AS DEPARTMENT_NAME'
      'FROM         dbo.Data0011 RIGHT OUTER JOIN'
      '                      dbo.Data0005 AS Data0005_1 INNER JOIN'
      
        '                      dbo.Data0070 ON Data0005_1.RKEY = dbo.Data' +
        '0070.EMPLOYEE_POINTER INNER JOIN'
      
        '                      dbo.Data0072 ON dbo.Data0070.RKEY = dbo.Da' +
        'ta0072.POPTR INNER JOIN'
      
        '                      dbo.Data0023 ON dbo.Data0070.SUPPLIER_POIN' +
        'TER = dbo.Data0023.RKEY INNER JOIN'
      
        '                      dbo.Data0001 ON dbo.Data0070.CURRENCY_PTR ' +
        '= dbo.Data0001.RKEY INNER JOIN'
      
        '                      dbo.Data0002 ON dbo.Data0072.UNIT_PTR = db' +
        'o.Data0002.RKEY INNER JOIN'
      
        '                      dbo.Data0015 ON dbo.Data0070.WAREHOUSE_POI' +
        'NTER = dbo.Data0015.RKEY ON dbo.Data0011.FILE_POINTER = dbo.Data' +
        '0070.RKEY AND '
      
        '                      dbo.Data0011.SOURCE_TYPE = 70 LEFT OUTER J' +
        'OIN'
      '                      dbo.Data0068 LEFT OUTER JOIN'
      
        '                      dbo.Data0034 ON dbo.Data0068.DEPARTMENT_NA' +
        'ME = dbo.Data0034.DEPT_CODE LEFT OUTER JOIN'
      
        '                      dbo.Data0005 ON dbo.Data0068.REQ_BY = dbo.' +
        'Data0005.RKEY RIGHT OUTER JOIN'
      
        '                      dbo.Data0204 ON dbo.Data0068.RKEY = dbo.Da' +
        'ta0204.PURCHASE_REQ_PTR ON dbo.Data0072.rkey204 = dbo.Data0204.R' +
        'KEY '
      
        'left join data0034 as data0034_1 on data0070.PO_REV_NO=data0034_' +
        '1.DEPT_NAME'
      'WHERE     (dbo.Data0072.QUAN_ORD > 0)')
    Left = 376
    Top = 115
    object ADOQuery1PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#32534#21495
      DisplayWidth = 18
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object ADOQuery1PO_DATE: TDateTimeField
      DisplayLabel = #37319#36141#26085#26399
      DisplayWidth = 15
      FieldName = 'PO_DATE'
    end
    object ADOQuery1EMPLOYEE_NAME: TStringField
      DisplayLabel = #37319#36141#21592#24037
      DisplayWidth = 18
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOQuery1v_status: TStringField
      DisplayLabel = #37319#36141#35746#21333#29366#24577
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'v_status'
      Size = 6
      Calculated = True
    end
    object ADOQuery1CODE: TStringField
      DisplayLabel = #20379#24212#21830
      DisplayWidth = 11
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOQuery1DESCRIPTION: TStringField
      DisplayLabel = #29289#21697#21517#31216
      DisplayWidth = 30
      FieldName = 'DESCRIPTION'
      Size = 60
    end
    object ADOQuery1gui_ge: TStringField
      DisplayLabel = #29289#21697#35268#26684
      FieldName = 'gui_ge'
      Size = 200
    end
    object ADOQuery1DESCRIPTION2: TStringField
      DisplayLabel = #29289#21697#31867#21035
      DisplayWidth = 20
      FieldName = 'DESCRIPTION2'
      FixedChar = True
    end
    object ADOQuery1UNIT_NAME: TStringField
      DisplayLabel = #37319#36141#21333#20301
      DisplayWidth = 14
      FieldName = 'UNIT_NAME'
    end
    object ADOQuery1QUAN_ORD: TFloatField
      DisplayLabel = #35746#36141#25968#37327
      DisplayWidth = 12
      FieldName = 'QUAN_ORD'
    end
    object ADOQuery1quantity_received: TFloatField
      DisplayLabel = #24050#25910#25968#37327
      FieldName = 'quantity_received'
    end
    object ADOQuery1no_recd: TFloatField
      DisplayLabel = #26410#25910#25968#37327
      FieldName = 'no_recd'
      ReadOnly = True
    end
    object ADOQuery1CURR_CODE: TStringField
      DisplayLabel = #36135#24065
      DisplayWidth = 9
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADOQuery1total: TFloatField
      DisplayLabel = #24635#35745#37329#39069'('#26412#20301#24065')'
      DisplayWidth = 14
      FieldName = 'total'
      ReadOnly = True
    end
    object ADOQuery1STATUS: TWordField
      FieldName = 'STATUS'
      Visible = False
    end
    object ADOQuery1DATE_EDITED: TDateTimeField
      DisplayLabel = #25552#20132#23457#25209#26085#26399
      FieldName = 'DATE_EDITED'
    end
    object ADOQuery1EXPIRED_DATE: TDateTimeField
      DisplayLabel = #26368#21518#23457#25209#26085#26399
      FieldName = 'EXPIRED_DATE'
    end
    object ADOQuery1del_date: TDateTimeField
      DisplayLabel = #35201#27714#21040#36135#26085#26399
      FieldName = 'del_date'
    end
    object ADOQuery1recd_date: TDateTimeField
      DisplayLabel = #26368#21518#25910#36135#26085#26399
      FieldName = 'recd_date'
    end
    object ADOQuery1tax_PRICE: TFloatField
      DisplayLabel = #21547#31246#20215
      FieldName = 'tax_PRICE'
    end
    object ADOQuery1rohs: TStringField
      DisplayLabel = #29615#20445#26631#35782
      FieldName = 'rohs'
      Size = 10
    end
    object ADOQuery1wh_abb_name: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'wh_abb_name'
      Size = 10
    end
    object ADOQuery1reason: TStringField
      FieldName = 'reason'
      Size = 60
    end
    object ADOQuery1UNIT_PRICE: TFloatField
      FieldName = 'UNIT_PRICE'
    end
    object ADOQuery1DSDesigner: TStringField
      DisplayWidth = 20
      FieldName = #37319#36141#35746#21333#35760#20107#26412
      ReadOnly = True
      Size = 510
    end
    object ADOQuery1PO_REQ_NUMBER: TStringField
      DisplayLabel = #35831#36141#32534#21495
      FieldName = 'PO_REQ_NUMBER'
      Size = 15
    end
    object ADOQuery1req_employeename: TStringField
      DisplayLabel = #35831#36141#20154#21592
      FieldName = 'req_employeename'
      Size = 16
    end
    object ADOQuery1DEPARTMENT_NAME: TStringField
      DisplayLabel = #35831#36141#37096#38376#20195#30721
      FieldName = 'DEPARTMENT_NAME'
      Size = 10
    end
    object ADOQuery1DEPT_NAME: TStringField
      DisplayLabel = #35831#36141#37096#38376#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
  end
end
