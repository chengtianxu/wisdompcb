object frmQry492: TfrmQry492
  Left = 335
  Top = 218
  Width = 1038
  Height = 553
  Caption = #25353#25237#20135#26597#35810'BOM'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 1022
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object lbl1: TLabel
      Left = 586
      Top = 10
      Width = 12
      Height = 13
      Caption = #21040
      Visible = False
    end
    object lbl2: TLabel
      Left = 426
      Top = 9
      Width = 60
      Height = 13
      AutoSize = False
      Caption = #25237#20135#26085#26399#65306
    end
    object lbl3: TLabel
      Left = 720
      Top = 8
      Width = 73
      Height = 13
      AutoSize = False
      Caption = 'BOM'#29366#24577#65306
    end
    object btn2: TBitBtn
      Left = 0
      Top = 2
      Width = 57
      Height = 30
      Hint = #36864#20986#31995#32479
      Caption = #36864#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btn2Click
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
    object btn3: TBitBtn
      Left = 57
      Top = 2
      Width = 57
      Height = 30
      Hint = #21047#26032#24403#21069#25968#25454
      Caption = #21047#26032
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btn3Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADABFBFBDADADADADADDADADBFADADADADAADADAD000DADADADDADAD0FBF0DA
        DADAADAD0F7FBF0DADADDAD0F7F87BF0DADAAD0F7F87BFB70DADD0F7F87BFB78
        80DA000F87BFB78880ADDAD00BFB78880ADAADADA0B7888740ADDADADA088804
        440AADADADA000A04440DADADADADADA0440ADADADADADADA00D}
    end
    object btn4: TBitBtn
      Left = 114
      Top = 2
      Width = 57
      Height = 30
      Hint = #23548#20986#25968#25454#21040'Excel'
      Caption = #23548#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btn4Click
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
    object dtp1: TDateTimePicker
      Left = 493
      Top = 6
      Width = 84
      Height = 21
      Date = 39226.000000000000000000
      Time = 39226.000000000000000000
      TabOrder = 3
      OnChange = btn3Click
    end
    object dtp2: TDateTimePicker
      Left = 608
      Top = 6
      Width = 89
      Height = 21
      Date = 39226.999988425930000000
      Time = 39226.999988425930000000
      TabOrder = 4
      OnChange = btn3Click
    end
    object edtFilter: TLabeledEdit
      Left = 267
      Top = 5
      Width = 121
      Height = 21
      EditLabel.Width = 37
      EditLabel.Height = 13
      EditLabel.Caption = 'edtFilter'
      LabelPosition = lpLeft
      TabOrder = 5
      OnChange = edtFilterChange
      OnKeyPress = edtFilterKeyPress
    end
    object cbb1: TComboBox
      Left = 783
      Top = 1
      Width = 82
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 6
      Text = 'BOM'#20840#37096
      OnChange = btn3Click
      Items.Strings = (
        'MI'#24453#21518#34917
        'BOM'#24453#23457
        'BOM'#24453#21046
        'BOM'#24050#23457
        'BOM'#20840#37096)
    end
  end
  object eh1: TDBGridEh
    Left = 0
    Top = 33
    Width = 1022
    Height = 482
    Align = alClient
    DataSource = ds1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyDown = eh1KeyDown
    OnTitleClick = eh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'MANU_PART_NUMBER'
        Footers = <>
        Title.Caption = #26412#21378#32534#21495
        Width = 110
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_DESC'
        Footers = <>
        Title.Caption = #23458#25143#22411#21495
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'PRODUCT_NAME'
        Footers = <>
        Title.Caption = #20135#21697#31867#22411
        Width = 77
      end
      item
        DisplayFormat = '0.0000'
        EditButtons = <>
        FieldName = 'BIAOZHUNCHENGBEN'
        Footers = <>
        Title.Caption = #26631#20934#25104#26412
      end
      item
        EditButtons = <>
        FieldName = 'cut_no'
        Footers = <>
        Title.Caption = #37197#26009#21333#21495
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'ISSUE_DATE'
        Footers = <>
        Title.Caption = #25237#20135#26085#26399
        Width = 110
      end
      item
        EditButtons = <>
        FieldName = 'CUST_CODE'
        Footers = <>
        Title.Caption = #23458#25143#20195#30721
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'ABBR_NAME'
        Footers = <>
        Title.Caption = #23458#25143#31616#31216
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'BOM_STATUS'
        Footers = <>
        Title.Caption = 'BOM'#29366#24577
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'TSTATUS'
        Footers = <>
        Title.Caption = 'MI'#29366#24577
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'CUSTPART_ENT_DATE'
        Footers = <>
        Title.Caption = 'MI'#21019#24314#26085#26399
        Width = 110
      end>
  end
  object ds1: TDataSource
    DataSet = ads1
    Left = 280
    Top = 120
  end
  object ads1: TADODataSet
    Connection = dmcon.ADOConnection1
    CommandText = 
      'SELECT     D10.CUST_CODE, D25.CUSTPART_ENT_DATE, D25.MANU_PART_N' +
      'UMBER, D10.ABBR_NAME, D25.MANU_PART_DESC, d492.CUT_NO, '#13#10'       ' +
      '               d492.ISSUE_DATE, '#13#10'                      CASE D25' +
      '.BOM_STATUS WHEN 0 THEN '#39'MI'#24453#21518#34917#39' WHEN 1 THEN '#39'BOM'#24453#23457#39' WHEN 2 THEN ' +
      #39'BOM'#24453#21046#39' WHEN 4 THEN '#39'BOM'#24050#23457#39' END AS BOM_STATUS,'#13#10'                ' +
      '       CASE D25.TSTATUS WHEN 0 THEN '#39#24453#21046#20316#39' WHEN 1 THEN '#39#24050#23457#26680#39' WHEN' +
      ' 2 THEN '#39#23457#36864#22238#39' WHEN 3 THEN '#39#24453#26816#26597#39' WHEN 4 THEN '#39#24453#23457#26680#39' WHEN 5 THEN'#13#10' ' +
      '                      '#39#26816#36864#22238#39' WHEN 6 THEN '#39#26410#25552#20132#39' END AS TSTATUS, db' +
      'o.Data0008.PRODUCT_NAME, '#13#10'                      D25.tot_accu_ma' +
      'tl_per_sqft + D25.tot_accu_OVHD_per_sqft AS BIAOZHUNCHENGBEN'#13#10'FR' +
      'OM         dbo.Data0025 AS D25 INNER JOIN'#13#10'                     ' +
      ' dbo.Data0010 AS D10 ON D25.CUSTOMER_PTR = D10.RKEY INNER JOIN'#13#10 +
      '                      dbo.data0492 AS d492 ON d492.BOM_PTR = D25' +
      '.RKEY LEFT OUTER JOIN'#13#10'                      dbo.Data0008 ON D25' +
      '.PROD_CODE_PTR = dbo.Data0008.RKEY'#13#10'WHERE     (D25.PARENT_PTR IS' +
      ' NULL) AND (d492.TTYPE = 0)'
    Parameters = <>
    Left = 240
    Top = 120
    object ads1CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ads1CUSTPART_ENT_DATE: TDateTimeField
      FieldName = 'CUSTPART_ENT_DATE'
    end
    object ads1MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ads1ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ads1MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ads1cut_no: TStringField
      FieldName = 'cut_no'
      FixedChar = True
      Size = 12
    end
    object ads1ISSUE_DATE: TDateTimeField
      FieldName = 'ISSUE_DATE'
    end
    object ads1BOM_STATUS: TStringField
      FieldName = 'BOM_STATUS'
      ReadOnly = True
      Size = 8
    end
    object ads1TSTATUS: TStringField
      FieldName = 'TSTATUS'
      ReadOnly = True
      Size = 6
    end
    object ads1PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ads1BIAOZHUNCHENGBEN: TFloatField
      FieldName = 'BIAOZHUNCHENGBEN'
      ReadOnly = True
    end
  end
end
