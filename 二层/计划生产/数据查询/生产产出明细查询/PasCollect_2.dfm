object FrmCollect2: TFrmCollect2
  Left = 369
  Top = 163
  Width = 724
  Height = 494
  Caption = #36798#25104#29575#27719#24635
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 716
    Height = 38
    Align = alTop
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 8
      Top = 4
      Width = 63
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
      Left = 73
      Top = 4
      Width = 63
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
    Width = 716
    Height = 429
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    FooterRowCount = 1
    SumList.Active = True
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'DEPT_CODE'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #24037#24207#32534#21495
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'DEPT_NAME'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #24037#24207#21517#31216
        Width = 130
      end
      item
        EditButtons = <>
        FieldName = 'dept_name1'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #29677#32452#21517#31216
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'iTotal'
        Footer.FieldName = 'iTotal'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #24037#24207#24635#20010#25968
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'iPunctual'
        Footer.FieldName = 'iPunctual'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #20934#26399#20010#25968
        Width = 75
      end
      item
        EditButtons = <>
        FieldName = 'iPunctual2'
        Footer.FieldName = 'iPunctual2'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #36229#26399#20010#25968
        Width = 75
      end
      item
        EditButtons = <>
        FieldName = 'dOnceFulfille'
        Footer.FieldName = 'dOnceFulfille'
        Footer.ValueType = fvtStaticText
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #20934#26399#30334#20998#27604
        Width = 80
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
      
        'SELECT    dbo.Data0034.DEPT_CODE,dbo.Data0034.DEPT_NAME,dbo.data' +
        '0034.RKey as d34Rkey,Data0034_1.DEPT_CODE AS dept_code1,  Data00' +
        '34_1.DEPT_NAME AS dept_name1,'
      '  count(Data0048.WO_PTR) as iTotal,'
      
        '  iPunctual=(select sum(case when (cast(DATEDIFF(n, Data0048.INT' +
        'IME, Data0048.OUTTIME)/60 as float)+'
      
        'round(cast((DATEDIFF(mi, Data0048.INTIME, Data0048.OUTTIME) % 60' +
        ') as float) /60,2)-Data0048.FLOW_NO-ISNULL(D586.DataValues,0))<=' +
        '0 then 1 else 0 end)), '
      
        '  iPunctual2=(select sum(case when (cast(DATEDIFF(n, Data0048.IN' +
        'TIME, Data0048.OUTTIME)/60 as float)+'
      
        'round(cast((DATEDIFF(mi, Data0048.INTIME, Data0048.OUTTIME) % 60' +
        ') as float) /60,2)-Data0048.FLOW_NO-ISNULL(D586.DataValues,0))>0' +
        ' then 1 else 0 end)),'
      
        ' dOnceFulfille=convert(numeric(18,2),(select sum(case when (cast' +
        '(DATEDIFF(n, Data0048.INTIME, Data0048.OUTTIME)/60 as float)+'
      
        'round(cast((DATEDIFF(mi, Data0048.INTIME, Data0048.OUTTIME) % 60' +
        ') as float) /60,2)-Data0048.FLOW_NO-ISNULL(D586.DataValues,0))<=' +
        '0 then 1 else 0 end))/cast (count(Data0048.WO_PTR)  as  decimal(' +
        '8,2)) *100) '
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
      '      (SELECT     Rkey34, DataValues,TType'
      '        FROM          dbo.data0586 '
      
        '       ) AS D586 ON Data0034.RKEY = D586.Rkey34 and D586.rkey34=' +
        'data0048.FM_DEPT_PTR and Data0006.PRIORITY_CODE=D586.TType'
      'WHERE (dbo.Data0048.OUTTIME >= :dtpk1) AND'
      '      (dbo.Data0048.OUTTIME <= :dtpk2)'
      
        'group by dbo.Data0034.DEPT_CODE,dbo.Data0034.DEPT_NAME,dbo.data0' +
        '034.RKey,dbo.Data0034.SEQ_NR,Data0034_1.DEPT_CODE ,  Data0034_1.' +
        'DEPT_NAME'
      'ORDER BY dbo.Data0034.SEQ_NR')
    Left = 328
    Top = 118
    object ADOQuery1DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADOQuery1DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADOQuery1d34Rkey: TAutoIncField
      FieldName = 'd34Rkey'
      ReadOnly = True
    end
    object ADOQuery1iTotal: TIntegerField
      FieldName = 'iTotal'
      ReadOnly = True
    end
    object ADOQuery1iPunctual: TIntegerField
      FieldName = 'iPunctual'
      ReadOnly = True
    end
    object ADOQuery1iPunctual2: TIntegerField
      FieldName = 'iPunctual2'
      ReadOnly = True
    end
    object ADOQuery1dOnceFulfille: TBCDField
      FieldName = 'dOnceFulfille'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object ADOQuery1dept_code1: TStringField
      FieldName = 'dept_code1'
      Size = 10
    end
    object ADOQuery1dept_name1: TStringField
      FieldName = 'dept_name1'
      Size = 30
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 328
    Top = 182
  end
end
