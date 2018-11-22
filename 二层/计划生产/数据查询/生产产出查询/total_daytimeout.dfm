object Form3: TForm3
  Left = 222
  Top = 120
  Width = 696
  Height = 613
  Caption = #29983#20135#26102#25253#34920
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 38
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      688
      38)
    object Label1: TLabel
      Left = 481
      Top = 15
      Width = 33
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #27719#24635':'
    end
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
    object ComboBox1: TComboBox
      Left = 520
      Top = 11
      Width = 98
      Height = 21
      Style = csDropDownList
      Anchors = [akTop, akRight]
      Enabled = False
      ItemHeight = 13
      ItemIndex = 2
      TabOrder = 2
      Text = #38754#31215
      OnChange = ComboBox1Change
      Items.Strings = (
        'PCS'#25968#37327
        'PAN'#25968#37327
        #38754#31215)
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 38
    Width = 688
    Height = 548
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = #26102#25253#34920' 1'
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 0
        Width = 680
        Height = 520
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
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnKeyDown = DBGridEh1KeyDown
        Columns = <
          item
            EditButtons = <>
            FieldName = 'out_date'
            Footers = <>
            Width = 107
          end
          item
            EditButtons = <>
            FieldName = 'DEPT_CODE'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'DEPT_NAME'
            Footer.Value = #27719#24635':'
            Footer.ValueType = fvtStaticText
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'total_pcs'
            Footer.FieldName = 'total_pcs'
            Footer.ValueType = fvtSum
            Footers = <>
            Width = 91
          end
          item
            EditButtons = <>
            FieldName = 'total_pan'
            Footer.FieldName = 'total_pan'
            Footer.ValueType = fvtSum
            Footers = <>
            Width = 91
          end
          item
            EditButtons = <>
            FieldName = 'total_sqft'
            Footer.ValueType = fvtSum
            Footers = <>
            Width = 134
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = #26102#25253#34920' 2'
      ImageIndex = 1
      object sgrid1: TStringGrid
        Left = 0
        Top = 0
        Width = 680
        Height = 520
        Align = alClient
        ColCount = 2
        DefaultRowHeight = 20
        FixedCols = 0
        RowCount = 3
        FixedRows = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
        TabOrder = 0
        ColWidths = (
          73
          81)
      end
    end
  end
  object ADOQuery1: TADOQuery
    Connection = Form_condition.ADOConnection1
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
        Value = 39272.0006944444d
      end
      item
        Name = 'dtpk2'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = 39273.9583333333d
      end>
    Prepared = True
    SQL.Strings = (
      'SELECT TOP 100 PERCENT'
      'convert(varchar,Data0048.outtime,12)+'#39':'#39'+'
      'substring(convert(char(6),Data0048.outtime,8),1,2) AS out_date,'
      '      Data0034.DEPT_CODE, Data0034.DEPT_NAME,'
      
        '      SUM(Data0048.QTY_PROD) AS total_pcs, SUM(dbo.Data0048.PANE' +
        'LS)'
      
        '      AS total_pan, round(SUM(Data0048.QTY_PROD * Data0025.unit_' +
        'sq),2) AS total_sqft,'
      
        '      round(SUM(Data0048.QTY_PROD * Data0006.panel_ln * Data0006' +
        '.panel_wd * 0.000001'
      '       / Data0006.PARTS_PER_PANEL),2) AS total_sq'
      'FROM dbo.Data0048 INNER JOIN'
      
        '     dbo.Data0034 ON dbo.Data0048.FM_DEPT_PTR = dbo.Data0034.RKE' +
        'Y INNER JOIN'
      
        '     dbo.Data0006 ON dbo.Data0048.WO_PTR = dbo.Data0006.RKEY INN' +
        'ER JOIN'
      
        '     dbo.Data0025 ON dbo.Data0006.BOM_PTR = dbo.Data0025.RKEY IN' +
        'NER JOIN'
      
        '     dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.R' +
        'KEY '
      
        '        INNER JOIN Data0007 ON Data0008.pr_grp_Pointer=Data0007.' +
        'RKEY  INNER JOIN'
      
        '    dbo.data0492 ON dbo.Data0006.CUT_NO = dbo.data0492.CUT_NO LE' +
        'FT OUTER JOIN'
      '   dbo.Data0060 ON dbo.data0492.SO_NO = dbo.Data0060.SALES_ORDER'
      'WHERE (dbo.Data0048.OUTTIME >= :dtpk1) AND'
      '      (dbo.Data0048.OUTTIME <= :dtpk2)'
      'GROUP BY convert(varchar,Data0048.outtime,12)+'#39':'#39'+'
      ' substring(convert(char(6),Data0048.outtime,8),1,2),'
      '      Data0034.DEPT_CODE, Data0034.DEPT_NAME, Data0034.SEQ_NR'
      'ORDER BY convert(varchar,Data0048.outtime,12)+'#39':'#39'+'
      
        'substring(convert(char(6),Data0048.outtime,8),1,2),Data0034.SEQ_' +
        'NR')
    Left = 88
    Top = 304
    object ADOQuery1out_date: TStringField
      DisplayLabel = #26085#65306#26102#38388
      FieldName = 'out_date'
      Size = 30
    end
    object ADOQuery1DEPT_CODE: TStringField
      DisplayLabel = #24037#24207#20195#30721
      DisplayWidth = 10
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADOQuery1DEPT_NAME: TStringField
      DisplayLabel = #24037#24207#21517#31216
      DisplayWidth = 21
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADOQuery1total_pcs: TIntegerField
      DisplayLabel = 'PCS'#25968#37327
      DisplayWidth = 10
      FieldName = 'total_pcs'
      ReadOnly = True
    end
    object ADOQuery1total_pan: TIntegerField
      DisplayLabel = 'PAN'#25968#37327
      DisplayWidth = 11
      FieldName = 'total_pan'
      ReadOnly = True
    end
    object ADOQuery1total_sqft: TFloatField
      DisplayLabel = #38754#31215
      DisplayWidth = 19
      FieldName = 'total_sqft'
      ReadOnly = True
    end
    object ADOQuery1total_sq: TFloatField
      DisplayLabel = #38754#31215
      FieldName = 'total_sq'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 120
    Top = 304
  end
  object aqdate48: TADOQuery
    Connection = Form_condition.ADOConnection1
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
        Value = 39272.0006944444d
      end
      item
        Name = 'dtpk2'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = 39273.9583333333d
      end>
    Prepared = True
    SQL.Strings = (
      'SELECT TOP 100 PERCENT'
      'convert(varchar,Data0048.outtime,12)+'#39':'#39'+'
      'substring(convert(char(6),Data0048.outtime,8),1,2) AS out_date,'
      
        '      SUM(Data0048.QTY_PROD) AS total_pcs, SUM(dbo.Data0048.PANE' +
        'LS)'
      
        '      AS total_pan, SUM(Data0048.QTY_PROD * Data0025.unit_sq) AS' +
        ' total_sqft,'
      
        '      SUM(Data0048.QTY_PROD * Data0006.panel_ln * Data0006.panel' +
        '_wd * 0.000001'
      '       / Data0006.PARTS_PER_PANEL) AS total_sq'
      'FROM dbo.Data0048 INNER JOIN'
      
        '     dbo.Data0034 ON dbo.Data0048.FM_DEPT_PTR = dbo.Data0034.RKE' +
        'Y INNER JOIN'
      
        '     dbo.Data0006 ON dbo.Data0048.WO_PTR = dbo.Data0006.RKEY INN' +
        'ER JOIN'
      
        '     dbo.Data0025 ON dbo.Data0006.BOM_PTR = dbo.Data0025.RKEY IN' +
        'NER JOIN'
      
        '     dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.R' +
        'KEY '
      
        '    INNER JOIN Data0007 ON Data0008.pr_grp_Pointer=Data0007.RKEY' +
        '  INNER JOIN'
      
        '    dbo.data0492 ON dbo.Data0006.CUT_NO = dbo.data0492.CUT_NO LE' +
        'FT OUTER JOIN'
      '   dbo.Data0060 ON dbo.data0492.SO_NO = dbo.Data0060.SALES_ORDER'
      'WHERE (dbo.Data0048.OUTTIME >= :dtpk1) AND'
      '      (dbo.Data0048.OUTTIME <= :dtpk2)'
      'GROUP BY convert(varchar,Data0048.outtime,12)+'#39':'#39'+'
      ' substring(convert(char(6),Data0048.outtime,8),1,2)'
      'ORDER BY convert(varchar,Data0048.outtime,12)+'#39':'#39'+'
      'substring(convert(char(6),Data0048.outtime,8),1,2)')
    Left = 88
    Top = 344
    object aqdate48out_date: TStringField
      DisplayLabel = #26085#65306#26102#38388
      FieldName = 'out_date'
      Size = 30
    end
    object aqdate48total_pcs: TIntegerField
      DisplayLabel = 'PCS'#25968#37327
      DisplayWidth = 10
      FieldName = 'total_pcs'
      ReadOnly = True
    end
    object aqdate48total_pan: TIntegerField
      DisplayLabel = 'PAN'#25968#37327
      DisplayWidth = 11
      FieldName = 'total_pan'
      ReadOnly = True
    end
    object aqdate48total_sqft: TFloatField
      DisplayLabel = #38754#31215
      DisplayWidth = 19
      FieldName = 'total_sqft'
      ReadOnly = True
    end
    object aqdate48total_sq: TFloatField
      DisplayLabel = #38754#31215
      FieldName = 'total_sq'
    end
  end
  object aqdept48: TADOQuery
    Connection = Form_condition.ADOConnection1
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
        Value = 39272.0006944444d
      end
      item
        Name = 'dtpk2'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = 39273.9583333333d
      end>
    Prepared = True
    SQL.Strings = (
      'SELECT TOP 100 PERCENT'
      '      Data0034.DEPT_CODE, Data0034.DEPT_NAME,'
      
        '      SUM(Data0048.QTY_PROD) AS total_pcs, SUM(dbo.Data0048.PANE' +
        'LS)'
      
        '      AS total_pan, SUM(Data0048.QTY_PROD * Data0025.unit_sq) AS' +
        ' total_sqft,'
      
        '      SUM(Data0048.QTY_PROD * Data0006.panel_ln * Data0006.panel' +
        '_wd * 0.000001'
      '       / Data0006.PARTS_PER_PANEL) AS total_sq'
      'FROM dbo.Data0048 INNER JOIN'
      
        '     dbo.Data0034 ON dbo.Data0048.FM_DEPT_PTR = dbo.Data0034.RKE' +
        'Y INNER JOIN'
      
        '     dbo.Data0006 ON dbo.Data0048.WO_PTR = dbo.Data0006.RKEY INN' +
        'ER JOIN'
      
        '     dbo.Data0025 ON dbo.Data0006.BOM_PTR = dbo.Data0025.RKEY IN' +
        'NER JOIN'
      
        '     dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.R' +
        'KEY '
      
        '      INNER JOIN Data0007 ON Data0008.pr_grp_Pointer=Data0007.RK' +
        'EY  INNER JOIN'
      
        '    dbo.data0492 ON dbo.Data0006.CUT_NO = dbo.data0492.CUT_NO LE' +
        'FT OUTER JOIN'
      '   dbo.Data0060 ON dbo.data0492.SO_NO = dbo.Data0060.SALES_ORDER'
      'WHERE (dbo.Data0048.OUTTIME >= :dtpk1) AND'
      '      (dbo.Data0048.OUTTIME <= :dtpk2)'
      'GROUP BY Data0034.DEPT_CODE, Data0034.DEPT_NAME, Data0034.SEQ_NR'
      'ORDER BY Data0034.SEQ_NR')
    Left = 88
    Top = 384
    object aqdept48dept_code: TStringField
      DisplayLabel = #24037#24207#20195#30721
      DisplayWidth = 10
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object aqdept48dept_name: TStringField
      DisplayLabel = #24037#24207#21517#31216
      DisplayWidth = 21
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object aqdept48total_pcs: TIntegerField
      DisplayLabel = 'PCS'#25968#37327
      DisplayWidth = 10
      FieldName = 'total_pcs'
      ReadOnly = True
    end
    object aqdept48total_pan: TIntegerField
      DisplayLabel = 'PAN'#25968#37327
      DisplayWidth = 11
      FieldName = 'total_pan'
      ReadOnly = True
    end
    object aqdept48total_sqft: TFloatField
      DisplayLabel = #38754#31215
      DisplayWidth = 19
      FieldName = 'total_sqft'
      ReadOnly = True
    end
    object aqdept48total_sq: TFloatField
      DisplayLabel = #38754#31215
      FieldName = 'total_sq'
    end
  end
end
