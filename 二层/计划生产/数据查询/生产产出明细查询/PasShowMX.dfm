object frmShowMX: TfrmShowMX
  Left = 255
  Top = 213
  Width = 741
  Height = 514
  Caption = #26126#32454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 725
    Height = 33
    Align = alTop
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 8
      Top = 4
      Width = 59
      Height = 27
      Caption = #20851#38381
      ModalResult = 2
      TabOrder = 0
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        0400000000007800000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF0FFFFFF
        FFFFFFFF00FFFFFFFFFFFFF030FFFFFFFFFFFF0330FFFFFFFFFF003330000000
        0FFFF03330FF0FFFFFFFF03300FF0FFFF4FFF03330FF0FFF44FFF03330FF0FF4
        4444F03330FF0F444444F03330FF0FF44444F0330FFF0FFF44FFF030FFFF0FFF
        F4FFF00FFFFF0FFFFFFFF00000000FFFFFFF}
    end
    object BitBtn2: TBitBtn
      Left = 67
      Top = 4
      Width = 59
      Height = 27
      Caption = #23548#20986
      TabOrder = 1
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DADADADADADA
        DADAADADADADADADADADDADADADADAD00000000000000006666007777777706E
        EF0AA0E6666606EEF0ADDA0E66606EEF060AADA0E606EEF0000DDADA006EEF0A
        DADAADAD06EEF00DADADDAD06EEF0670DADAAD06EEF0E6670DADD06EEF0A0E66
        70DA0FFFF0ADA0EEEE0D00000ADADA00000AADADADADADADADAD}
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 33
    Width = 725
    Height = 443
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'WORK_ORDER_NUMBER'
        Footer.Value = #21512#35745
        Footer.ValueType = fvtStaticText
        Footers = <>
        Width = 103
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_NUMBER'
        Footers = <>
        Width = 73
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_DESC'
        Footers = <>
        Width = 130
      end
      item
        EditButtons = <>
        FieldName = 'DEPT_CODE'
        Footers = <>
        Title.Caption = #24037#24207#20195#30721
        Width = 81
      end
      item
        EditButtons = <>
        FieldName = 'DEPT_NAME'
        Footers = <>
        Title.Caption = #24037#24207#21517#31216
        Width = 107
      end
      item
        EditButtons = <>
        FieldName = 'dept_code2'
        Footers = <>
        Visible = False
        Width = 82
      end
      item
        EditButtons = <>
        FieldName = 'dept_name2'
        Footers = <>
        Visible = False
        Width = 114
      end
      item
        EditButtons = <>
        FieldName = 'dept_code1'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'dept_name1'
        Footers = <>
        Width = 89
      end
      item
        EditButtons = <>
        FieldName = 'total_sqft'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'QTY_PROD2'
        Footer.FieldName = 'QTY_PROD2'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = 'PCS'#25968
        Width = 68
      end
      item
        EditButtons = <>
        FieldName = 'PANELS'
        Footer.FieldName = 'PANELS'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = 'PNL'#25968#37327
        Width = 68
      end
      item
        EditButtons = <>
        FieldName = 'INTIME'
        Footers = <>
        Title.Caption = #25910#26495#26102#38388
        Visible = False
        Width = 91
      end
      item
        EditButtons = <>
        FieldName = 'OUTTIME'
        Footers = <>
        Width = 76
      end
      item
        EditButtons = <>
        FieldName = #20572#30041#23567#26102
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'DataValues'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #24037#24207#23436#24037#23567#26102#25968'('#29702#35770')'
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'ModernDate34'
        Footers = <>
        Title.Caption = #24037#24207#29702#35770#23436#25104#26102#38388
        Width = 110
      end
      item
        EditButtons = <>
        FieldName = 'FLOW_NO'
        Footers = <>
        Title.Caption = #26242#20572#23567#26102#25968
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'YS'
        Footers = <>
        Title.Caption = #26159#21542#20934#26399
        Width = 56
      end
      item
        EditButtons = <>
        FieldName = 'PRIORITY_name'
        Footers = <>
        Title.Caption = #32039#24613#31243#24230
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'PARTS_PER_PANEL'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'pnl_size'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'panel_ln'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = 'PNL'#38271
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'panel_wd'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = 'PNL'#23485
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'STEP_NO'
        Footers = <>
        Width = 38
      end
      item
        EditButtons = <>
        FieldName = 'C_WTYPE'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'CUST_CODE'
        Footers = <>
        Width = 69
      end
      item
        EditButtons = <>
        FieldName = 'PROD_CODE'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'PRODUCT_NAME'
        Footers = <>
        Visible = False
        Width = 92
      end
      item
        EditButtons = <>
        FieldName = 'CUT_NO'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'SO_NO'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'ENT_DATETIME'
        Footers = <>
        Title.Caption = #25237#20135#26085#26399
        Visible = False
        Width = 83
      end
      item
        EditButtons = <>
        FieldName = 'SCH_COMPL_DATE'
        Footers = <>
        Title.Caption = #35745#21010#23436#24037#26085#26399
        Visible = False
        Width = 94
      end
      item
        EditButtons = <>
        FieldName = 'EMPLOYEE_NAME'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #36807#25968#20154#21592
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'ABBR_NAME'
        Footers = <>
        Title.Caption = #29983#20135#24037#21378
      end
      item
        EditButtons = <>
        FieldName = 'ABBR_NAME_1'
        Footers = <>
        Title.Caption = #25237#26009#24037#21378
      end
      item
        EditButtons = <>
        FieldName = 'ACTION_REF'
        Footers = <>
        Title.Caption = #22791#27880
        Width = 56
      end
      item
        EditButtons = <>
        FieldName = 'PARAMETER_VALUE'
        Footers = <>
        Title.Caption = #20135#20986#21442#25968
        Visible = False
        Width = 87
      end
      item
        EditButtons = <>
        FieldName = 'SAMPLE_NR'
        Footers = <>
        Width = 118
      end
      item
        EditButtons = <>
        FieldName = 'CPJS'
        Footers = <>
      end>
  end
  object ADOQuery1: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'dtpk1'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'dtpk2'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     TOP (100) PERCENT Data0025.MANU_PART_NUMBER, Data0025' +
        '.MANU_PART_DESC,data0025.SAMPLE_NR,'
      
        ' dbo.Data0006.WORK_ORDER_NUMBER, dbo.Data0006.ENT_DATETIME,dbo.D' +
        'ata0006.SCH_COMPL_DATE,dbo.Data0034.DEPT_CODE,'
      
        '  dbo.Data0034.DEPT_NAME, dbo.Data0048.QTY_PROD as QTY_PROD2, db' +
        'o.Data0048.PANELS,Data0048.ACTION_REF,'
      
        '    dbo.Data0048.INTIME,dbo.Data0048.OUTTIME, dbo.Data0006.CUT_N' +
        'O,dbo.data0005.EMPLOYEE_NAME,'
      
        '  dbo.Data0010.CUST_CODE, dbo.Data0008.PROD_CODE, dbo.data0492.S' +
        'O_NO,'
      
        '  Data0034_1.DEPT_CODE AS dept_code1, dbo.Data0048.STEP_NO,Data0' +
        '048.PARAMETER_VALUE,'
      '  Data0034_1.DEPT_NAME AS dept_name1, dbo.Data0008.PRODUCT_NAME,'
      
        '  dbo.Data0006.PARTS_PER_PANEL, dbo.Data0006.pnl_size,dbo.data00' +
        '06.panel_ln,dbo.data0006.panel_wd,'
      
        '  ROUND(dbo.Data0048.QTY_PROD * dbo.Data0025.unit_sq, 6) AS tota' +
        'l_sqft,'
      
        '  ROUND(dbo.Data0048.QTY_PROD * dbo.Data0006.panel_ln * dbo.Data' +
        '0006.panel_wd'
      '  * 0.000001 / dbo.Data0006.PARTS_PER_PANEL, 6) AS total_sq,'
      
        '  CASE dbo.data0048.WTYPE WHEN 0 THEN '#39#27491#24120#36807#25968#39' WHEN 2 THEN '#39#36820#24037#36807#25968#39' ' +
        'WHEN 3 THEN '#39#22806#21457#29983#20135#39' END AS C_WTYPE,'
      
        '  Data0034_2.DEPT_CODE AS dept_code2, Data0034_2.DEPT_NAME AS de' +
        'pt_name2, D15_1.ABBR_NAME,D15_2.ABBR_NAME,'
      ''
      
        'cast(DATEDIFF(n, Data0048.INTIME, Data0048.OUTTIME)/60 as float)' +
        '+'
      
        'round(cast((DATEDIFF(mi, Data0048.INTIME, Data0048.OUTTIME) % 60' +
        ') as float) /60,2)  as '#20572#30041#23567#26102','
      ''
      
        ' ISNULL(D586.DataValues,0) AS DataValues,DATEADD(HH, ISNULL(D586' +
        '.DataValues,0), Data0048.INTIME) AS ModernDate34,D586.PRIORITY_n' +
        'ame,'
      ' '
      
        'dbo.Data0034.Rkey as d34Rkey,dbo.Data0006.PROD_STATUS,data0025.C' +
        'PJS,data0048.FLOW_NO,'
      
        'case when (cast(DATEDIFF(n, Data0048.INTIME, Data0048.OUTTIME)/6' +
        '0 as float)+'
      
        'round(cast((DATEDIFF(mi, Data0048.INTIME, Data0048.OUTTIME) % 60' +
        ') as float) /60,2)-Data0048.FLOW_NO-ISNULL(D586.DataValues,0))<=' +
        '0 then '#39#26159#39'  else '#39#21542#39' end as YS'
      'FROM         dbo.Data0048 INNER JOIN'
      
        '    dbo.Data0006 ON dbo.Data0048.WO_PTR = dbo.Data0006.RKEY INNE' +
        'R JOIN'
      
        '    dbo.Data0034 ON dbo.Data0048.FM_DEPT_PTR = dbo.Data0034.RKEY' +
        ' INNER JOIN'
      
        '    dbo.Data0025 ON dbo.Data0006.BOM_PTR = dbo.Data0025.RKEY lef' +
        't JOIN'
      
        '    dbo.data0005 on dbo.data0048.EMPL_PTR=dbo.data0005.Rkey INNE' +
        'R JOIN'
      
        '    dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RK' +
        'EY INNER JOIN'
      
        '    dbo.data0492 ON dbo.Data0006.CUT_NO = dbo.data0492.CUT_NO IN' +
        'NER JOIN'
      
        '    dbo.Data0034 AS Data0034_1 ON dbo.Data0034.BIG_DEPT_PTR = Da' +
        'ta0034_1.RKEY INNER JOIN'
      
        '    dbo.Data0010 ON dbo.data0492.COMPLETED = dbo.Data0010.RKEY I' +
        'NNER JOIN'
      
        '    dbo.data0007 ON data0007.RKEY=data0008.PR_GRP_POINTER INNER ' +
        'JOIN'
      
        '    dbo.Data0015 D15_1 ON dbo.Data0048.warehouse_ptr = D15_1.RKE' +
        'Y INNER JOIN'
      
        '    dbo.Data0015 D15_2 ON dbo.Data0492.WHOUSE_PTR=D15_2.RKEY LEF' +
        'T OUTER JOIN'
      
        '    dbo.Data0034 AS Data0034_2 ON dbo.Data0048.TO_DEPT_PTR = Dat' +
        'a0034_2.RKEY LEFT OUTER JOIN'
      
        '   dbo.Data0060 ON dbo.data0492.SO_NO = dbo.Data0060.SALES_ORDER' +
        '  LEFT OUTER JOIN'
      
        '      (SELECT     Rkey34, DataValues,TType,data0283.PRIORITY_nam' +
        'e'
      
        '        FROM          dbo.data0586  inner join data0283 on data0' +
        '586.TType=data0283.PRIORITY_CODE '
      
        '       ) AS D586 ON Data0034.RKEY = D586.Rkey34 and D586.rkey34=' +
        'data0048.FM_DEPT_PTR and Data0006.PRIORITY_CODE=D586.TType'
      'WHERE (dbo.Data0048.OUTTIME >= :dtpk1) AND'
      '      (dbo.Data0048.OUTTIME <= :dtpk2)'
      'ORDER BY '#20572#30041#23567#26102' desc,data0048.STEP_NO ')
    Left = 480
    Top = 160
    object ADOQuery1MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
      Size = 30
    end
    object ADOQuery1MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ADOQuery1SAMPLE_NR: TStringField
      FieldName = 'SAMPLE_NR'
      Size = 50
    end
    object ADOQuery1WORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object ADOQuery1ENT_DATETIME: TDateTimeField
      FieldName = 'ENT_DATETIME'
    end
    object ADOQuery1SCH_COMPL_DATE: TDateTimeField
      FieldName = 'SCH_COMPL_DATE'
    end
    object ADOQuery1DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADOQuery1DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADOQuery1QTY_PROD2: TIntegerField
      FieldName = 'QTY_PROD2'
    end
    object ADOQuery1PANELS: TIntegerField
      FieldName = 'PANELS'
    end
    object ADOQuery1ACTION_REF: TStringField
      FieldName = 'ACTION_REF'
      Size = 50
    end
    object ADOQuery1INTIME: TDateTimeField
      FieldName = 'INTIME'
    end
    object ADOQuery1OUTTIME: TDateTimeField
      FieldName = 'OUTTIME'
    end
    object ADOQuery1CUT_NO: TStringField
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object ADOQuery1EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOQuery1CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADOQuery1PROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object ADOQuery1SO_NO: TStringField
      FieldName = 'SO_NO'
      FixedChar = True
      Size = 12
    end
    object ADOQuery1dept_code1: TStringField
      FieldName = 'dept_code1'
      Size = 10
    end
    object ADOQuery1STEP_NO: TSmallintField
      FieldName = 'STEP_NO'
    end
    object ADOQuery1PARAMETER_VALUE: TStringField
      FieldName = 'PARAMETER_VALUE'
      Size = 50
    end
    object ADOQuery1dept_name1: TStringField
      FieldName = 'dept_name1'
      Size = 30
    end
    object ADOQuery1PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADOQuery1PARTS_PER_PANEL: TFloatField
      FieldName = 'PARTS_PER_PANEL'
    end
    object ADOQuery1pnl_size: TStringField
      FieldName = 'pnl_size'
    end
    object ADOQuery1panel_ln: TFloatField
      FieldName = 'panel_ln'
    end
    object ADOQuery1panel_wd: TFloatField
      FieldName = 'panel_wd'
    end
    object ADOQuery1total_sqft: TFloatField
      FieldName = 'total_sqft'
      ReadOnly = True
    end
    object ADOQuery1total_sq: TFloatField
      FieldName = 'total_sq'
      ReadOnly = True
    end
    object ADOQuery1C_WTYPE: TStringField
      FieldName = 'C_WTYPE'
      ReadOnly = True
      Size = 8
    end
    object ADOQuery1dept_code2: TStringField
      FieldName = 'dept_code2'
      Size = 10
    end
    object ADOQuery1dept_name2: TStringField
      FieldName = 'dept_name2'
      Size = 30
    end
    object ADOQuery1ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOQuery1ABBR_NAME_1: TStringField
      FieldName = 'ABBR_NAME_1'
      Size = 10
    end
    object ADOQuery1DSDesigner: TFloatField
      FieldName = #20572#30041#23567#26102
      ReadOnly = True
    end
    object ADOQuery1DataValues: TFloatField
      FieldName = 'DataValues'
      ReadOnly = True
    end
    object ADOQuery1ModernDate34: TDateTimeField
      FieldName = 'ModernDate34'
      ReadOnly = True
    end
    object ADOQuery1PRIORITY_name: TStringField
      FieldName = 'PRIORITY_name'
      Size = 10
    end
    object ADOQuery1d34Rkey: TIntegerField
      FieldName = 'd34Rkey'
      ReadOnly = True
    end
    object ADOQuery1PROD_STATUS: TSmallintField
      FieldName = 'PROD_STATUS'
    end
    object ADOQuery1CPJS: TStringField
      FieldName = 'CPJS'
      Size = 30
    end
    object ADOQuery1FLOW_NO: TSmallintField
      FieldName = 'FLOW_NO'
    end
    object ADOQuery1YS: TStringField
      FieldName = 'YS'
      ReadOnly = True
      Size = 2
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 392
    Top = 160
  end
end
