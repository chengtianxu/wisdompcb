object Form2: TForm2
  Left = 435
  Top = 181
  Width = 933
  Height = 550
  Caption = #29677#32452#20135#21697#20135#20986#27719#24635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 917
    Height = 38
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 8
      Top = 4
      Width = 65
      Height = 29
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
      Left = 77
      Top = 4
      Width = 65
      Height = 29
      Caption = #23548#20986
      TabOrder = 1
      OnClick = BitBtn2Click
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
    Top = 38
    Width = 917
    Height = 474
    Align = alClient
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    FooterColor = cl3DLight
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    SumList.Active = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGridEh1KeyDown
    Columns = <
      item
        EditButtons = <>
        FieldName = 'dept_code1'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'dept_name1'
        Footer.Value = #27719#24635':'
        Footer.ValueType = fvtStaticText
        Footers = <>
        Width = 97
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_NUMBER'
        Footers = <>
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_DESC'
        Footers = <>
        Width = 97
      end
      item
        EditButtons = <>
        FieldName = 'CUST_CODE'
        Footers = <>
        Width = 59
      end
      item
        EditButtons = <>
        FieldName = 'pcs_total'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 66
      end
      item
        EditButtons = <>
        FieldName = 'pan_total'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = 'total_sqft'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 66
      end
      item
        EditButtons = <>
        FieldName = 'PROD_CODE'
        Footers = <>
        Width = 62
      end
      item
        EditButtons = <>
        FieldName = 'PRODUCT_NAME'
        Footers = <>
        Width = 107
      end
      item
        EditButtons = <>
        FieldName = 'abbr_name'
        Footers = <>
        Title.Caption = #29983#20135#24037#21378
      end
      item
        EditButtons = <>
        FieldName = 'abbr_name_1'
        Footers = <>
        Title.Caption = #25237#26009#24037#21378
        Width = 77
      end
      item
        EditButtons = <>
        FieldName = 'panel_ln'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'panel_wd'
        Footers = <>
      end>
  end
  object ADOQuery1: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'dtpk1'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = 39315d
      end
      item
        Name = 'dtpk2'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = 39356d
      end>
    Prepared = True
    SQL.Strings = (
      
        'SELECT  TOP (100) PERCENT dbo.Data0025.MANU_PART_NUMBER, dbo.Dat' +
        'a0025.MANU_PART_DESC,'
      
        ' Data0034_1.DEPT_CODE AS dept_code1,  Data0034_1.DEPT_NAME AS de' +
        'pt_name1,'
      
        '  SUM(dbo.Data0048.QTY_PROD) AS pcs_total, SUM(dbo.Data0048.PANE' +
        'LS) AS pan_total,'
      
        '  ROUND(SUM(dbo.Data0048.QTY_PROD * dbo.Data0025.unit_sq), 6) AS' +
        ' total_sqft,'
      
        '  ROUND(SUM(dbo.Data0048.QTY_PROD * dbo.Data0006.panel_ln * dbo.' +
        'Data0006.panel_wd'
      '   * 0.000001 / dbo.Data0006.PARTS_PER_PANEL), 6) AS total_sq,'
      
        '  dbo.Data0010.CUST_CODE, dbo.Data0008.PROD_CODE, dbo.Data0008.P' +
        'RODUCT_NAME,'
      
        'd15_1.abbr_name,d15_2.abbr_name,Data0006.panel_ln ,Data0006.pane' +
        'l_wd,data0025.CPJS'
      'FROM         dbo.Data0048 INNER JOIN'
      
        '  dbo.Data0006 ON dbo.Data0048.WO_PTR = dbo.Data0006.RKEY INNER ' +
        'JOIN'
      
        '  dbo.Data0034 ON dbo.Data0048.FM_DEPT_PTR = dbo.Data0034.RKEY I' +
        'NNER JOIN'
      
        '  dbo.Data0025 ON dbo.Data0006.BOM_PTR = dbo.Data0025.RKEY INNER' +
        ' JOIN'
      
        '  dbo.Data0034 AS Data0034_1 ON dbo.Data0034.BIG_DEPT_PTR = Data' +
        '0034_1.RKEY INNER JOIN'
      
        '  dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY' +
        ' INNER JOIN'
      
        '  dbo.data0492 ON dbo.Data0006.CUT_NO = dbo.data0492.CUT_NO INNE' +
        'R JOIN'
      
        '  dbo.Data0010 ON dbo.data0492.COMPLETED = dbo.Data0010.RKEY INN' +
        'ER JOIN'
      
        '  dbo.data0007 ON data0007.RKEY=data0008.PR_GRP_POINTER INNER JO' +
        'IN'
      
        '  dbo.data0015 D15_1 ON data0048.warehouse_ptr=D15_1.rkey INNER ' +
        'JOIN'
      
        '  dbo.data0015 D15_2 ON data0492.WHOUSE_PTR=D15_2.rkey LEFT OUTE' +
        'R JOIN'
      '  dbo.Data0060 ON dbo.data0492.SO_NO = dbo.Data0060.SALES_ORDER'
      'WHERE (dbo.Data0048.OUTTIME >= :dtpk1) AND'
      '      (dbo.Data0048.OUTTIME <= :dtpk2)'
      
        'GROUP BY dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_D' +
        'ESC,'
      
        '      Data0034_1.DEPT_CODE, Data0034_1.DEPT_NAME, Data0034_1.SEQ' +
        '_NR,'
      
        '      dbo.Data0010.CUST_CODE, d15_1.abbr_name,d15_2.abbr_name, D' +
        'ata0008.PROD_CODE,'
      
        '     Data0008.PRODUCT_NAME,Data0006.panel_ln ,Data0006.panel_wd,' +
        'data0025.CPJS'
      'ORDER BY Data0034_1.SEQ_NR')
    Left = 168
    Top = 128
    object ADOQuery1MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      DisplayWidth = 10
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOQuery1MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      DisplayWidth = 20
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADOQuery1dept_code1: TStringField
      DisplayLabel = #29677#32452#20195#30721
      FieldName = 'dept_code1'
      Size = 10
    end
    object ADOQuery1dept_name1: TStringField
      DisplayLabel = #29677#32452#21517#31216
      FieldName = 'dept_name1'
      Size = 30
    end
    object ADOQuery1CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADOQuery1PROD_CODE: TStringField
      DisplayLabel = #31867#22411#20195#30721
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object ADOQuery1PRODUCT_NAME: TStringField
      DisplayLabel = #31867#22411#21517#31216
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADOQuery1pcs_total: TIntegerField
      DisplayLabel = 'PCS'#25968#37327
      FieldName = 'pcs_total'
    end
    object ADOQuery1pan_total: TIntegerField
      DisplayLabel = 'PAN'#25968#37327
      FieldName = 'pan_total'
    end
    object ADOQuery1total_sqft: TFloatField
      DisplayLabel = #38754#31215
      FieldName = 'total_sqft'
      ReadOnly = True
    end
    object ADOQuery1total_sq: TFloatField
      DisplayLabel = #38754#31215
      FieldName = 'total_sq'
      ReadOnly = True
    end
    object ADOQuery1abbr_name: TStringField
      FieldName = 'abbr_name'
      Size = 10
    end
    object ADOQuery1abbr_name_1: TStringField
      FieldName = 'abbr_name_1'
      Size = 10
    end
    object ADOQuery1panel_ln: TFloatField
      DisplayLabel = 'PAN'#38271
      FieldName = 'panel_ln'
    end
    object ADOQuery1panel_wd: TFloatField
      DisplayLabel = 'PAN'#23485
      FieldName = 'panel_wd'
    end
    object ADOQuery1CPJS: TStringField
      DisplayLabel = #20135#21697#38454#25968
      FieldName = 'CPJS'
      Size = 30
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 104
    Top = 128
  end
end
