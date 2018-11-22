object Form6: TForm6
  Left = 426
  Top = 163
  Width = 841
  Height = 542
  Caption = #25104#21697#20837#20179#27719#24635
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
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
    Width = 825
    Height = 48
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      825
      48)
    object Label1: TLabel
      Left = 400
      Top = 26
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = '   '#21512#35745':'
      Visible = False
    end
    object Label2: TLabel
      Left = 471
      Top = 5
      Width = 40
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = '  '#25968#37327
      Visible = False
    end
    object Label3: TLabel
      Left = 569
      Top = 5
      Width = 40
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = '  '#38754#31215
      Visible = False
    end
    object Edit1: TEdit
      Left = 463
      Top = 22
      Width = 89
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = cl3DLight
      ImeName = #26497#21697#20116#31508
      ReadOnly = True
      TabOrder = 0
      Text = '0.00'
      Visible = False
    end
    object Edit2: TEdit
      Left = 558
      Top = 22
      Width = 81
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = cl3DLight
      ImeName = #26497#21697#20116#31508
      ReadOnly = True
      TabOrder = 1
      Text = '0.00'
      Visible = False
    end
    object BitBtn1: TBitBtn
      Left = 11
      Top = 8
      Width = 57
      Height = 30
      Cursor = crHandPoint
      Hint = #36864#20986
      Caption = #36864#20986
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BitBtn1Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
    end
    object BitBtn4: TBitBtn
      Left = 131
      Top = 9
      Width = 57
      Height = 30
      Hint = #23548#20986#25968#25454'Excel'
      Caption = #23548#20986
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Visible = False
      OnClick = BitBtn4Click
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
    object BitBtn2: TBitBtn
      Left = 70
      Top = 9
      Width = 57
      Height = 30
      Hint = #23548#20986#25968#25454'Excel'
      Caption = #23548#20986
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
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
    Top = 48
    Width = 825
    Height = 456
    Align = alClient
    DataSource = DataSource2
    FooterColor = clWindow
    FooterFont.Charset = GB2312_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    FooterRowCount = 1
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghRowHighlight]
    RowHeight = 4
    RowLines = 1
    SumList.Active = True
    TabOrder = 1
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGridEh1KeyDown
    Columns = <
      item
        EditButtons = <>
        FieldName = 'MANU_PART_NUMBER'
        Footers = <>
        Width = 102
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_DESC'
        Footers = <>
        Width = 145
      end
      item
        EditButtons = <>
        FieldName = 'analysis_code_2'
        Footers = <>
        Width = 123
      end
      item
        EditButtons = <>
        FieldName = 'PROD_CODE'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'cust_code'
        Footers = <>
        Title.Caption = #23458#25143#20195#30721
      end
      item
        EditButtons = <>
        FieldName = 'ABBR_NAME'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'ORIG_CUSTOMER'
        Footers = <>
        Title.Caption = #20851#32852#21407#23458#25143
      end
      item
        EditButtons = <>
        FieldName = 'rece_total'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'so_mianqi'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'in_weight'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'layers'
        Footers = <>
        Width = 52
      end
      item
        EditButtons = <>
        FieldName = 'SAMPLE_NR'
        Footers = <>
        Width = 109
      end
      item
        EditButtons = <>
        FieldName = 'total_cost'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'notax_amout_b'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 119
      end
      item
        EditButtons = <>
        FieldName = 'tax_amout_b'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 115
      end>
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery1
    Left = 296
    Top = 280
  end
  object ADOQuery1: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      
        'SELECT TOP 100 PERCENT dbo.Data0010.ABBR_NAME, dbo.Data0008.PROD' +
        '_CODE, '
      '      SUM(dbo.Data0053.QUANTITY) AS rece_total,'
      
        '      ROUND(SUM(dbo.Data0053.QUANTITY * dbo.Data0025.unit_sq), 4' +
        ') AS so_mianqi,'
      
        '      SUM(dbo.Data0025.REPORT_UNIT_VALUE1 * dbo.Data0053.QUANTIT' +
        'Y / 1000) '
      
        '      AS in_weight, dbo.Data0025.MANU_PART_NUMBER,dbo.Data0025.S' +
        'AMPLE_NR, '
      
        '      dbo.Data0025.MANU_PART_DESC,data0025.analysis_code_2,data0' +
        '025.layers,'
      
        'ROUND(sum(Data0053.QUANTITY * (Data0053.cost_pcs+Data0053.matl_o' +
        'vhd_pcs+'
      
        'Data0053.OVHD_COST+Data0053.PLANNED_QTY+data0053.ovhd1_pcs+data0' +
        '053.outsource_pcs)), 4) AS total_cost,'
      '       SUM(Data0053.QUANTITY*'
      
        '       CASE WHEN Data0053.barcode_ptr >= 0 THEN ROUND(Data0060.P' +
        'ARTS_ALLOC  / Data0060.EXCH_RATE, 6) '
      '       ELSE Data0025.LATEST_PRICE end) as notax_amout_b,'
      
        '       SUM(Data0053.QUANTITY* CASE WHEN Data0053.barcode_ptr >= ' +
        '0 THEN '
      
        '       ROUND(Data0060.PARTS_ALLOC * (1 + Data0060.RUSH_CHARGE * ' +
        '0.01)  / Data0060.EXCH_RATE, 6) '
      
        '       ELSE Data0025.LATEST_PRICE END) as tax_amout_b,data0025.O' +
        'RIG_CUSTOMER,data0010.cust_code  '
      'FROM dbo.Data0010 INNER JOIN'
      '      dbo.Data0008 INNER JOIN'
      '      dbo.Data0025 ON '
      '      dbo.Data0008.RKEY = dbo.Data0025.PROD_CODE_PTR INNER JOIN'
      
        '      dbo.Data0053 ON dbo.Data0025.RKEY = dbo.Data0053.CUST_PART' +
        '_PTR ON '
      
        '      dbo.Data0010.RKEY = dbo.Data0025.CUSTOMER_PTR LEFT OUTER J' +
        'OIN'
      
        '      dbo.Data0060 ON dbo.Data0053.barcode_ptr = dbo.Data0060.RK' +
        'EY'
      'WHERE (dbo.Data0053.QUANTITY > 0)'
      
        'GROUP BY dbo.Data0008.PROD_CODE, dbo.Data0010.ABBR_NAME,data0025' +
        '.analysis_code_2,'
      
        '      dbo.Data0025.MANU_PART_NUMBER,dbo.Data0025.SAMPLE_NR, dbo.' +
        'Data0025.MANU_PART_DESC,data0025.layers,data0025.ORIG_CUSTOMER,d' +
        'ata0010.cust_code')
    Left = 336
    Top = 280
    object ADOQuery1ABBR_NAME: TStringField
      DisplayLabel = #23458#25143
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOQuery1cust_code: TStringField
      FieldName = 'cust_code'
      Size = 10
    end
    object ADOQuery1ORIG_CUSTOMER: TStringField
      FieldName = 'ORIG_CUSTOMER'
      Size = 10
    end
    object ADOQuery1PROD_CODE: TStringField
      DisplayLabel = #20135#21697#31867#21035
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object ADOQuery1rece_total: TFloatField
      DisplayLabel = #20837#20179#25968#37327
      FieldName = 'rece_total'
    end
    object ADOQuery1so_mianqi: TFloatField
      DisplayLabel = #20837#24211#38754#31215
      FieldName = 'so_mianqi'
      ReadOnly = True
    end
    object ADOQuery1in_weight: TFloatField
      DisplayLabel = #20837#20179#37325#37327'(KG)'
      FieldName = 'in_weight'
    end
    object ADOQuery1MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOQuery1MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADOQuery1analysis_code_2: TStringField
      DisplayLabel = #23458#25143#29289#26009#21495
      FieldName = 'analysis_code_2'
      Size = 50
    end
    object ADOQuery1layers: TWordField
      DisplayLabel = #23618#25968
      FieldName = 'layers'
    end
    object ADOQuery1SAMPLE_NR: TStringField
      DisplayLabel = #27979#35797#25104#22411#22791#27880
      FieldName = 'SAMPLE_NR'
      Size = 50
    end
    object ADOQuery1total_cost: TFloatField
      DisplayLabel = #25104#26412
      FieldName = 'total_cost'
      ReadOnly = True
    end
    object ADOQuery1notax_amout_b: TFloatField
      DisplayLabel = #37329#39069'('#26412#20301#24065#19981#21547#31246')'
      FieldName = 'notax_amout_b'
      ReadOnly = True
    end
    object ADOQuery1tax_amout_b: TFloatField
      DisplayLabel = #37329#39069'('#26412#20301#24065#21547#31246')'
      FieldName = 'tax_amout_b'
      ReadOnly = True
    end
  end
end
