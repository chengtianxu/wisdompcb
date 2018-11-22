object FrmCollect2: TFrmCollect2
  Left = 402
  Top = 225
  Width = 718
  Height = 419
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
    Width = 710
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
    Width = 710
    Height = 354
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
        Width = 100
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
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'SELECT    D34.DEPT_CODE,D34.DEPT_NAME,D34.RKey as d34Rkey, Data0' +
        '034_1.DEPT_CODE AS dept_code1,Data0034_1.DEPT_NAME AS dept_name1' +
        ','
      '  count(Data0056.WO_PTR) as iTotal,'
      
        '  iPunctual=(select sum(case when (DATEDIFF(HH,getdate(),DATEADD' +
        '(HH, ISNULL(D586.DataValues,0), Data0056.INTIME))+Data0056.FLOW_' +
        'NO)>=0 then 1 else 0 end)), '
      
        '  iPunctual2=(select sum(case when (DATEDIFF(HH,getdate(),DATEAD' +
        'D(HH, ISNULL(D586.DataValues,0), Data0056.INTIME))+Data0056.FLOW' +
        '_NO)<0 then 1 else 0 end)),'
      
        ' dOnceFulfille=convert(numeric(18,2),(select sum(case when (DATE' +
        'DIFF(HH,getdate(),DATEADD(HH, ISNULL(D586.DataValues,0), Data005' +
        '6.INTIME))+Data0056.FLOW_NO)>=0 then 1 else 0 end))/cast (count(' +
        'Data0056.WO_PTR)  as  decimal(8,2)) *100) '
      'FROM  Data0056 inner join '
      #9'  data0006 D06 ON Data0056.WO_PTR = D06.RKEY inner join '
      #9'  Data0025 D25 ON D06.BOM_PTR = D25.RKEY INNER JOIN '
      '      Data0015 on Data0056.LOC_PTR=Data0015.rkey inner join'
      '      Data0008 D08 ON D25.PROD_CODE_PTR=D08.RKEY inner join '
      
        '      Data0038 AS D38 ON D25.RKEY = D38.SOURCE_PTR and Data0056.' +
        'DEPT_PTR=D38.DEPT_PTR INNER JOIN'
      '      Data0034 AS D34 ON D38.DEPT_PTR = D34.RKEY INNER JOIN '
      
        '      Data0034 AS Data0034_1 ON D34.BIG_DEPT_PTR = Data0034_1.RK' +
        'EY INNER JOIN '
      #9'  Data0492 ON D06.CUT_NO = Data0492.CUT_NO INNER JOIN'
      
        #9'  Data0010 ON Data0010.RKEY = Data0492.COMPLETED LEFT OUTER JOI' +
        'N '
      '      Data0060 LEFT OUTER JOIN'
      
        '      Data0097 ON Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY ON' +
        ' Data0492.SO_NO = Data0060.SALES_ORDER left join'
      
        '      Data0283 on D06.PRIORITY_CODE=data0283.PRIORITY_CODE LEFT ' +
        'OUTER JOIN'
      
        '      data0010 as D10 on data0060.ORIG_CUSTOMER=D10.ABBR_NAME LE' +
        'FT OUTER JOIN'
      '      (SELECT     Rkey34, DataValues,TType'
      '        FROM          dbo.data0586 '
      
        '       ) AS D586 ON D34.RKEY = D586.Rkey34 and D586.rkey34=data0' +
        '056.DEPT_PTR and D06.PRIORITY_CODE=D586.TType'
      ''
      'WHERE 1=1'
      ''
      
        'group by D34.DEPT_CODE,D34.DEPT_NAME,D34.RKey, Data0034_1.DEPT_C' +
        'ODE ,Data0034_1.DEPT_NAME')
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
