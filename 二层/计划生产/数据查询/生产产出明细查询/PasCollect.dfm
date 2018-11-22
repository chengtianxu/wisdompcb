object FrmCollect: TFrmCollect
  Left = 335
  Top = 227
  Width = 749
  Height = 460
  Caption = #27966#24037#36798#25104#29575#27719#24635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 733
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
      OnClick = BitBtn1Click
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
  object Panel2: TPanel
    Left = 0
    Top = 38
    Width = 733
    Height = 384
    Align = alClient
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 731
      Height = 382
      Align = alClient
      DataSource = DataSource1
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      PopupMenu = PopupMenu1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyDown = DBGridEh1KeyDown
      Columns = <
        item
          EditButtons = <>
          FieldName = 'DEPT_CODE'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #24037#24207#32534#21495
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'DEPT_NAME'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #24037#24207#21517#31216
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'iTotal'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #27966#24037#24635#25968
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'iPunctual'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #20934#26399#20010#25968
        end
        item
          EditButtons = <>
          FieldName = 'iPunctual2'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #36229#26399#20010#25968
        end
        item
          EditButtons = <>
          FieldName = 'dOverlay'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #21472#21152#36229#26399#20010#25968#20043#21644
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'dOnceFulfille'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #19968#27425#36798#25104#29575'(%)'
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'OverlayFulfille'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #21472#21152#36798#25104#29575
          Visible = False
          Width = 100
        end>
    end
  end
  object ADOQuery1: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
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
        '0034.RKey as d34Rkey,'
      '  count(dbo.data0048.IF_PAIGONG) as iTotal,'
      ''
      
        '  iPunctual=(select sum(case dbo.data0048.IF_PAIGONG when 1 then' +
        ' (case when ROUND( (cast(DATEDIFF(n, Data0048.INTIME, Data0048.O' +
        'UTTIME)/60 as float)+round(cast((DATEDIFF(mi, Data0048.INTIME, D' +
        'ata0048.OUTTIME) % 60) as float) /60,2)-'
      
        '  dbo.data0048.DateValue-dbo.data0048.FLOW_NO),2)<=0 then 1 else' +
        ' 0 end)end)),'
      ''
      
        '   iPunctual2=(select sum(case dbo.data0048.IF_PAIGONG when 1 th' +
        'en (case when ROUND( (cast(DATEDIFF(n, Data0048.INTIME, Data0048' +
        '.OUTTIME)/60 as float)+round(cast((DATEDIFF(mi, Data0048.INTIME,' +
        ' Data0048.OUTTIME) % 60) as float) /60,2)-'
      
        '  dbo.data0048.DateValue-dbo.data0048.FLOW_NO),2)<=0 then 0 else' +
        ' 1 end)end)),'
      ''
      
        ' dOverlay=(select sum(case when CONVERT( int,(datepart(minute,db' +
        'o.Data0048.INTIME)))-CONVERT( int,(datepart(minute,dbo.Data0048.' +
        'OUTTIME)))>0  then (case when(ROUND(((convert(numeric(18,2),CONV' +
        'ERT( varchar(10),(DATEDIFF(Hour,dbo.Data0048.INTIME,dbo.Data0048' +
        '.OUTTIME)-1))+'#39'.'#39'+'
      
        '  CONVERT( varchar(10),(DATEDIFF(minute,dbo.Data0048.INTIME,dbo.' +
        'Data0048.OUTTIME))-'
      
        '  (floor(DATEDIFF(minute,dbo.Data0048.INTIME,dbo.Data0048.OUTTIM' +
        'E)/ 1440) *1440) -'
      
        '  (floor((DATEDIFF(minute,dbo.Data0048.INTIME,dbo.Data0048.OUTTI' +
        'ME)% 1440)/60)*60))))/dbo.data0048.DateValue),2)>1) then ROUND((' +
        '(convert(numeric(18,2),CONVERT( varchar(10),(DATEDIFF(Hour,dbo.D' +
        'ata0048.INTIME,dbo.Data0048.OUTTIME)-1))+'#39'.'#39'+'
      
        '  CONVERT( varchar(10),(DATEDIFF(minute,dbo.Data0048.INTIME,dbo.' +
        'Data0048.OUTTIME))-'
      
        '  (floor(DATEDIFF(minute,dbo.Data0048.INTIME,dbo.Data0048.OUTTIM' +
        'E)/ 1440) *1440) -'
      
        '  (floor((DATEDIFF(minute,dbo.Data0048.INTIME,dbo.Data0048.OUTTI' +
        'ME)% 1440)/60)*60))))/dbo.data0048.DateValue),2) else 0 end) els' +
        'e (case when(ROUND(((convert(numeric(18,2),CONVERT( varchar(10),' +
        '(DATEDIFF(Hour,dbo.Data0048.INTIME,dbo.Data0048.OUTTIME)))+'#39'.'#39'+'
      
        '  CONVERT( varchar(10),(DATEDIFF(minute,dbo.Data0048.INTIME,dbo.' +
        'Data0048.OUTTIME))-'
      
        '  (floor(DATEDIFF(minute,dbo.Data0048.INTIME,dbo.Data0048.OUTTIM' +
        'E)/ 1440) *1440) -'
      
        '  (floor((DATEDIFF(minute,dbo.Data0048.INTIME,dbo.Data0048.OUTTI' +
        'ME)% 1440)/60)*60))))/dbo.data0048.DateValue),2)>1) then ROUND((' +
        '(convert(numeric(18,2),CONVERT( varchar(10),(DATEDIFF(Hour,dbo.D' +
        'ata0048.INTIME,dbo.Data0048.OUTTIME)))+'#39'.'#39'+'
      
        '  CONVERT( varchar(10),(DATEDIFF(minute,dbo.Data0048.INTIME,dbo.' +
        'Data0048.OUTTIME))-'
      
        '  (floor(DATEDIFF(minute,dbo.Data0048.INTIME,dbo.Data0048.OUTTIM' +
        'E)/ 1440) *1440) -'
      
        '  (floor((DATEDIFF(minute,dbo.Data0048.INTIME,dbo.Data0048.OUTTI' +
        'ME)% 1440)/60)*60))))/dbo.data0048.DateValue),2) else 0 end) end' +
        ')),'
      ''
      
        '  dOnceFulfille=convert(numeric(18,2),(select sum(case dbo.data0' +
        '048.IF_PAIGONG when 1 then (case when ROUND( (cast(DATEDIFF(n, D' +
        'ata0048.INTIME, Data0048.OUTTIME)/60 as float)+round(cast((DATED' +
        'IFF(mi, Data0048.INTIME, Data0048.OUTTIME) % 60) as float) /60,2' +
        ')-'
      
        '  dbo.data0048.DateValue-dbo.data0048.FLOW_NO),2)<=0 then 1 else' +
        ' 0 end)end))/cast (count(dbo.data0048.IF_PAIGONG) as  decimal(8,' +
        '2)) *100),'
      ''
      
        '  OverlayFulfille=convert(numeric(18,2),(convert(numeric(18,2),(' +
        'count(dbo.data0048.IF_PAIGONG)-(select sum(case when CONVERT( in' +
        't,(datepart(minute,dbo.Data0048.INTIME)))-CONVERT( int,(datepart' +
        '(minute,dbo.Data0048.OUTTIME)))>0  then (case when(ROUND(((conve' +
        'rt(numeric(18,2),CONVERT( varchar(10),(DATEDIFF(Hour,dbo.Data004' +
        '8.INTIME,dbo.Data0048.OUTTIME)-1))+'#39'.'#39'+'
      
        '  CONVERT( varchar(10),(DATEDIFF(minute,dbo.Data0048.INTIME,dbo.' +
        'Data0048.OUTTIME))-'
      
        '  (floor(DATEDIFF(minute,dbo.Data0048.INTIME,dbo.Data0048.OUTTIM' +
        'E)/ 1440) *1440) -'
      
        '  (floor((DATEDIFF(minute,dbo.Data0048.INTIME,dbo.Data0048.OUTTI' +
        'ME)% 1440)/60)*60))))/dbo.data0048.DateValue),2)>1) then ROUND((' +
        '(convert(numeric(18,2),CONVERT( varchar(10),(DATEDIFF(Hour,dbo.D' +
        'ata0048.INTIME,dbo.Data0048.OUTTIME)-1))+'#39'.'#39'+'
      
        '  CONVERT( varchar(10),(DATEDIFF(minute,dbo.Data0048.INTIME,dbo.' +
        'Data0048.OUTTIME))-'
      
        '  (floor(DATEDIFF(minute,dbo.Data0048.INTIME,dbo.Data0048.OUTTIM' +
        'E)/ 1440) *1440) -'
      
        '  (floor((DATEDIFF(minute,dbo.Data0048.INTIME,dbo.Data0048.OUTTI' +
        'ME)% 1440)/60)*60))))/dbo.data0048.DateValue),2) else 0 end) els' +
        'e (case when(ROUND(((convert(numeric(18,2),CONVERT( varchar(10),' +
        '(DATEDIFF(Hour,dbo.Data0048.INTIME,dbo.Data0048.OUTTIME)))+'#39'.'#39'+'
      
        '  CONVERT( varchar(10),(DATEDIFF(minute,dbo.Data0048.INTIME,dbo.' +
        'Data0048.OUTTIME))-'
      
        '  (floor(DATEDIFF(minute,dbo.Data0048.INTIME,dbo.Data0048.OUTTIM' +
        'E)/ 1440) *1440) -'
      
        '  (floor((DATEDIFF(minute,dbo.Data0048.INTIME,dbo.Data0048.OUTTI' +
        'ME)% 1440)/60)*60))))/dbo.data0048.DateValue),2)>1) then ROUND((' +
        '(convert(numeric(18,2),CONVERT( varchar(10),(DATEDIFF(Hour,dbo.D' +
        'ata0048.INTIME,dbo.Data0048.OUTTIME)))+'#39'.'#39'+'
      
        '  CONVERT( varchar(10),(DATEDIFF(minute,dbo.Data0048.INTIME,dbo.' +
        'Data0048.OUTTIME))-'
      
        '  (floor(DATEDIFF(minute,dbo.Data0048.INTIME,dbo.Data0048.OUTTIM' +
        'E)/ 1440) *1440) -'
      
        '  (floor((DATEDIFF(minute,dbo.Data0048.INTIME,dbo.Data0048.OUTTI' +
        'ME)% 1440)/60)*60))))/dbo.data0048.DateValue),2) else 0 end) end' +
        '))))/count(dbo.data0048.IF_PAIGONG))*100)'
      'FROM         dbo.Data0048 INNER JOIN'
      
        '    dbo.Data0006 ON dbo.Data0048.WO_PTR = dbo.Data0006.RKEY INNE' +
        'R JOIN'
      
        '    dbo.Data0034 ON dbo.Data0048.FM_DEPT_PTR = dbo.Data0034.RKEY' +
        ' INNER JOIN'
      
        '    dbo.Data0025 ON dbo.Data0006.BOM_PTR = dbo.Data0025.RKEY INN' +
        'ER JOIN'
      
        '    dbo.Data0005 ON dbo.Data0048.EMPL_PTR = dbo.Data0005.RKEY IN' +
        'NER JOIN'
      
        '    dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RK' +
        'EY INNER JOIN'
      
        '    dbo.data0492 ON dbo.Data0006.CUT_NO = dbo.data0492.CUT_NO IN' +
        'NER JOIN'
      
        '    dbo.Data0034 AS Data0034_1 ON dbo.Data0034.BIG_DEPT_PTR = Da' +
        'ta0034_1.RKEY INNER JOIN'
      
        '    dbo.Data0010 ON dbo.data0492.COMPLETED = dbo.Data0010.RKEY I' +
        'NNER JOIN'
      
        '    dbo.Data0015 D15_1 ON dbo.Data0048.warehouse_ptr = D15_1.RKE' +
        'Y INNER JOIN'
      
        '    dbo.Data0015 D15_2 ON dbo.Data0492.WHOUSE_PTR=D15_2.RKEY LEF' +
        'T OUTER JOIN'
      
        '    dbo.Data0034 AS Data0034_2 ON dbo.Data0048.TO_DEPT_PTR = Dat' +
        'a0034_2.RKEY'
      'WHERE (dbo.Data0048.OUTTIME >= :dtpk1) AND'
      '      (dbo.Data0048.OUTTIME <= :dtpk2)'
      '      and dbo.data0048.IF_PAIGONG=1 '
      
        '      and data0034.RKey in(select DEPT_ptr from data0054 join [d' +
        'ata0051] on [data0054].[D051_ptr]=[data0051].rkey group by dept_' +
        'ptr)'
      
        'group by dbo.data0048.IF_PAIGONG,dbo.Data0034.DEPT_CODE,dbo.Data' +
        '0034.DEPT_NAME,dbo.data0034.RKey,dbo.Data0034.SEQ_NR'
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
    object ADOQuery1dOverlay: TBCDField
      FieldName = 'dOverlay'
      ReadOnly = True
      Precision = 32
      Size = 12
    end
    object ADOQuery1dOnceFulfille: TBCDField
      FieldName = 'dOnceFulfille'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object ADOQuery1OverlayFulfille: TBCDField
      FieldName = 'OverlayFulfille'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 328
    Top = 182
  end
  object PopupMenu1: TPopupMenu
    Left = 448
    Top = 166
    object N1: TMenuItem
      Caption = #26126#32454
    end
  end
end
