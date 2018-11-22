object Frm_MatZT: TFrm_MatZT
  Left = 260
  Top = 166
  Width = 1059
  Height = 588
  Caption = #22312#36884#26448#26009#26597#35810
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1051
    Height = 35
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 160
      Top = 11
      Width = 48
      Height = 12
      Caption = #26448#26009#32534#30721
    end
    object Label2: TLabel
      Left = 488
      Top = 12
      Width = 24
      Height = 12
      Caption = #24037#21378
    end
    object Edit1: TEdit
      Left = 216
      Top = 8
      Width = 129
      Height = 20
      TabOrder = 0
      OnChange = Edit1Change
    end
    object BtClose: TBitBtn
      Left = 0
      Top = 3
      Width = 57
      Height = 30
      Caption = #20851#38381
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
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
    object BtnExcel: TBitBtn
      Left = 60
      Top = 2
      Width = 60
      Height = 30
      Caption = #23548#20986
      TabOrder = 2
      OnClick = BtnExcelClick
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
      Top = 8
      Width = 145
      Height = 20
      Style = csDropDownList
      ItemHeight = 12
      TabOrder = 3
      OnChange = ComboBox1Change
    end
  end
  object Grd1: TDBGridEh
    Left = 0
    Top = 35
    Width = 1051
    Height = 529
    Align = alClient
    DataSource = DataSource1
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -12
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    ReadOnly = True
    SortLocal = True
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = Grd1KeyDown
    OnTitleClick = Grd1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'INV_PART_NUMBER'
        Footers = <>
        Width = 126
      end
      item
        EditButtons = <>
        FieldName = 'INV_PART_DESCRIPTION'
        Footers = <>
        Width = 125
      end
      item
        EditButtons = <>
        FieldName = 'ABBR_NAME'
        Footers = <>
        Width = 57
      end
      item
        DisplayFormat = '0.000'
        EditButtons = <>
        FieldName = 'QUAN_ORD'
        Footers = <>
        Title.Caption = #35746#21333#25968#37327
        Width = 54
      end
      item
        DisplayFormat = '0.000'
        EditButtons = <>
        FieldName = 'QUAN_RECD'
        Footers = <>
        Title.Caption = #24050#25910#36135#25968#37327
      end
      item
        DisplayFormat = '0.000'
        EditButtons = <>
        FieldName = 'zaitu'
        Footers = <>
        Title.Caption = #27424#36135#25968#37327
        Width = 57
      end
      item
        EditButtons = <>
        FieldName = 'quan_on_hand'
        Footers = <>
        Title.Caption = #24211#23384#25968#37327
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'UNIT_NAME'
        Footers = <>
        Width = 29
      end
      item
        EditButtons = <>
        FieldName = 'REQ_DATE'
        Footers = <>
        Title.Caption = #20132#36135#26085#26399
        Width = 66
      end
      item
        EditButtons = <>
        FieldName = 'PO_NUMBER'
        Footers = <>
        Width = 73
      end
      item
        EditButtons = <>
        FieldName = 'ANALYSIS_CODE_1'
        Footers = <>
        Width = 41
      end
      item
        EditButtons = <>
        FieldName = 'dept_name'
        Footers = <>
        Width = 67
      end
      item
        EditButtons = <>
        FieldName = 'PO_REQ_NUMBER'
        Footers = <>
        Width = 73
      end
      item
        EditButtons = <>
        FieldName = 'reason'
        Footers = <>
        Width = 103
      end
      item
        EditButtons = <>
        FieldName = 'rohs'
        Footers = <>
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'ComNm'
        Footers = <>
        Width = 56
      end
      item
        EditButtons = <>
        FieldName = 'EMPLOYEE_NAME'
        Footers = <>
        Title.Caption = #37319#36141#21592
      end
      item
        EditButtons = <>
        FieldName = 'reply_date'
        Footers = <>
        Title.Caption = #35201#27714#21040#36135#26085#26399
        Width = 85
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADO71
    Left = 448
    Top = 88
  end
  object ADO71: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_PART_D' +
        'ESCRIPTION, dbo.Data0023.ABBR_NAME, dbo.Data0071.QUAN_ORD, '
      
        '                      dbo.Data0071.QUAN_RECD, dbo.Data0071.QUAN_' +
        'ORD - dbo.Data0071.QUAN_RECD AS zaitu, dbo.Data0002.UNIT_NAME, d' +
        'bo.Data0071.tax_price, '
      
        '                      dbo.Data0071.TAX_2, dbo.Data0071.REQ_DATE,' +
        ' dbo.Data0070.PO_NUMBER, '
      
        '                      ISNULL(dbo.Data0005.EMPLOYEE_NAME, dbo.Dat' +
        'a0070.ANALYSIS_CODE_1)  AS ANALYSIS_CODE_1, '
      
        '                      ISNULL(Data0034_1.DEPT_NAME, dbo.Data0034.' +
        'DEPT_NAME) AS dept_name, '
      
        '                      ISNULL(dbo.Data0068.PO_REQ_NUMBER, dbo.Dat' +
        'a0070.FOB) AS PO_REQ_NUMBER, dbo.Data0071.reason, dbo.Data0071.r' +
        'ohs, '
      
        '                      dbo.Data0015.ABBR_NAME AS ComNm, Data0005_' +
        '1.EMPLOYEE_NAME, dbo.Data0017.QUAN_ON_HAND, dbo.Data0069.reply_d' +
        'ate'
      'FROM         dbo.Data0034 right OUTER JOIN'
      '                      dbo.Data0071 INNER JOIN'
      
        '                      dbo.Data0070 ON dbo.Data0071.PO_PTR = dbo.' +
        'Data0070.RKEY INNER JOIN'
      
        '                      dbo.Data0023 ON dbo.Data0070.SUPPLIER_POIN' +
        'TER = dbo.Data0023.RKEY INNER JOIN'
      
        '                      dbo.Data0002 ON dbo.Data0071.PURCHASE_UNIT' +
        '_PTR = dbo.Data0002.RKEY INNER JOIN'
      
        '                      dbo.Data0017 ON dbo.Data0071.INVT_PTR = db' +
        'o.Data0017.RKEY INNER JOIN'
      
        '                      dbo.Data0015 ON dbo.Data0070.WAREHOUSE_POI' +
        'NTER = dbo.Data0015.RKEY INNER JOIN'
      
        '                      dbo.Data0005 AS Data0005_1 ON dbo.Data0070' +
        '.EMPLOYEE_POINTER = Data0005_1.RKEY ON '
      
        '                      dbo.Data0034.DEPT_CODE = dbo.Data0070.PO_R' +
        'EV_NO FULL OUTER JOIN'
      '                      dbo.Data0068 LEFT OUTER JOIN'
      
        '                      dbo.Data0034 AS Data0034_1 ON dbo.Data0068' +
        '.DEPARTMENT_NAME = Data0034_1.DEPT_CODE LEFT OUTER JOIN'
      
        '                      dbo.Data0005 ON dbo.Data0068.REQ_BY = dbo.' +
        'Data0005.RKEY FULL OUTER JOIN'
      
        '                      dbo.Data0069 ON dbo.Data0068.RKEY = dbo.Da' +
        'ta0069.PURCH_REQ_PTR ON dbo.Data0071.rkey69 = dbo.Data0069.RKEY'
      
        'WHERE     (dbo.Data0070.STATUS = 5) AND (dbo.Data0071.QUAN_ORD -' +
        ' dbo.Data0071.QUAN_RECD > 0) ')
    Left = 448
    Top = 128
    object ADO71INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADO71INV_PART_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object ADO71ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object ADO71QUAN_ORD: TFloatField
      FieldName = 'QUAN_ORD'
      DisplayFormat = '0.000'
    end
    object ADO71QUAN_RECD: TFloatField
      FieldName = 'QUAN_RECD'
      DisplayFormat = '0.000'
    end
    object ADO71zaitu: TFloatField
      DisplayLabel = #22312#36884#25968#37327
      FieldName = 'zaitu'
      ReadOnly = True
      DisplayFormat = '0.000'
    end
    object ADO71UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object ADO71tax_price: TFloatField
      DisplayLabel = #21547#31246#21333#20215
      FieldName = 'tax_price'
    end
    object ADO71TAX_2: TBCDField
      DisplayLabel = #31246#29575'%'
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object ADO71REQ_DATE: TDateTimeField
      DisplayLabel = #38656#27714#26085#26399
      FieldName = 'REQ_DATE'
    end
    object ADO71PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#21333#21495
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object ADO71ANALYSIS_CODE_1: TStringField
      DisplayLabel = #35831#36141#20154
      FieldName = 'ANALYSIS_CODE_1'
    end
    object ADO71dept_name: TStringField
      DisplayLabel = #35831#36141#37096#38376
      FieldName = 'dept_name'
      ReadOnly = True
      Size = 30
    end
    object ADO71PO_REQ_NUMBER: TStringField
      DisplayLabel = #35831#36141#21333#21495
      FieldName = 'PO_REQ_NUMBER'
      ReadOnly = True
      Size = 15
    end
    object ADO71reason: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'reason'
      Size = 60
    end
    object ADO71rohs: TStringField
      DisplayLabel = #29615#20445#26631#35782
      FieldName = 'rohs'
      Size = 10
    end
    object ADO71ComNm: TStringField
      DisplayLabel = #24037#21378#21517#31216
      FieldName = 'ComNm'
      Size = 10
    end
    object ADO71EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADO71quan_on_hand: TBCDField
      DisplayWidth = 20
      FieldName = 'quan_on_hand'
      DisplayFormat = '0.000'
      Precision = 19
    end
    object ADO71reply_date: TDateTimeField
      FieldName = 'reply_date'
    end
  end
end
