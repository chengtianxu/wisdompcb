object Form4: TForm4
  Left = 345
  Top = 259
  Width = 979
  Height = 563
  Caption = #25910#27454#26126#32454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 971
    Height = 41
    Align = alTop
    TabOrder = 0
    object lbl1: TLabel
      Left = 248
      Top = 16
      Width = 35
      Height = 13
      Caption = 'labl1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object lbl2: TLabel
      Left = 592
      Top = 16
      Width = 72
      Height = 13
      Caption = #21457#31080#26085#26399#20174#65306
    end
    object lbl3: TLabel
      Left = 768
      Top = 17
      Width = 24
      Height = 13
      Caption = #21040#65306
    end
    object btn1: TButton
      Left = 16
      Top = 7
      Width = 75
      Height = 25
      Caption = #20851#38381
      TabOrder = 0
      OnClick = btn1Click
    end
    object btn2: TButton
      Left = 104
      Top = 7
      Width = 75
      Height = 25
      Caption = #23548#20986
      TabOrder = 1
      OnClick = btn2Click
    end
    object Edit1: TEdit
      Left = 313
      Top = 11
      Width = 121
      Height = 21
      ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 2
      OnChange = Edit1Change
    end
    object dtp1: TDateTimePicker
      Left = 664
      Top = 13
      Width = 97
      Height = 21
      Date = 43185.375687407410000000
      Time = 43185.375687407410000000
      ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 3
      OnChange = dtp1Change
    end
    object dtp2: TDateTimePicker
      Left = 793
      Top = 13
      Width = 115
      Height = 21
      Date = 43185.375993333330000000
      Time = 43185.375993333330000000
      ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 4
      OnChange = dtp1Change
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 971
    Height = 491
    Align = alClient
    DataSource = DS115
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyDown = DBGridEh1KeyDown
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'REFERENCE_NO'
        Footers = <>
        Title.Caption = #25903#31080#32534#21495
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'TDATE'
        Footers = <>
        Title.Caption = #31080#25454#26085#26399
      end
      item
        EditButtons = <>
        FieldName = 'v_status'
        Footers = <>
        Title.Caption = #31080#25454#31867#22411
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'v_status114'
        Footers = <>
        Title.Caption = #31080#25454#29366#24577
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'CUST_CODE'
        Footers = <>
        Title.Caption = #23458#25143#20195#30721
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'ABBR_NAME'
        Footers = <>
        Title.Caption = #23458#25143#31616#31216
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'CURR_CODE'
        Footers = <>
        Title.Caption = #36135#24065#20195#30721
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'CURR_NAME'
        Footers = <>
        Title.Caption = #36135#24065
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'EXCHANGE_RATE'
        Footers = <>
        Title.Caption = #27719#29575
      end
      item
        EditButtons = <>
        FieldName = 'BANK_NAME'
        Footers = <>
        Title.Caption = #29616#37329#38134#34892
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'NUMBER'
        Footers = <>
        Title.Caption = #21457#31080#32534#21495
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'MX_amount'
        Footers = <>
        Title.Caption = #21457#31080#37329#39069
      end
      item
        EditButtons = <>
        FieldName = 'APPL_CASH_DISC'
        Footers = <>
        Title.Caption = #29616#37329#25240#25187
      end
      item
        EditButtons = <>
        FieldName = 'REMARK'
        Footers = <>
        Title.Caption = #22791#27880
      end>
  end
  object ADO115: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT   dbo.Data0114.REFERENCE_NO, dbo.Data0105.VOUCHER, dbo.Da' +
      'ta0105.STATUS, dbo.Data0114.RKEY, '#13#10'                dbo.Data0114' +
      '.TDATE, dbo.Data0114.REMARK, dbo.Data0114.STATUS AS status114, d' +
      'bo.Data0001.CURR_CODE, '#13#10'                dbo.Data0001.CURR_NAME,' +
      ' dbo.Data0114.EXCHANGE_RATE, dbo.Data0128.BANK_NAME, dbo.Data001' +
      '0.CUST_CODE, '#13#10'                dbo.Data0010.ANALYSIS_CODE4, dbo.' +
      'Data0010.ANALYSIS_CODE5, dbo.Data0010.CUSTOMER_NAME, '#13#10'         ' +
      '       dbo.Data0010.ABBR_NAME, dbo.Data0010.FED_TAX_ID_NO, dbo.D' +
      'ata0114.TTYPE, dbo.Data0128.BAL_AMOUNT, '#13#10'                dbo.Da' +
      'ta0114.AMOUNT - dbo.Data0114.DEBIT_AMOUNT AS dz_amount, dbo.Data' +
      '0015.WAREHOUSE_CODE, '#13#10'                dbo.Data0015.ABBR_NAME AS' +
      ' abbrname15, '#13#10'                CASE data0114.ttype WHEN 1 THEN '#39 +
      #29616#38134#25910#27454#39' WHEN 2 THEN '#39#39044#25910#24080#27454#39' WHEN 5 THEN '#39#36716#24080#25910#27454#39' END AS v_ttype, '#13#10'  ' +
      '              CASE data0105.status WHEN 0 THEN '#39#26410#23457#26680#39' WHEN 1 THEN' +
      ' '#39#20250#35745#24050#23457#39' WHEN 2 THEN '#39#20027#31649#24050#23457#39' WHEN 3 THEN '#39#24050#30331#24080#39#13#10'                 W' +
      'HEN 4 THEN '#39#20986#32435#24050#23457#39' WHEN 5 THEN '#39#34987#20316#24223#39' END AS v_status, '#13#10'         ' +
      '       CASE data0114.status WHEN 1 THEN '#39#26377#25928#30340#39' WHEN 2 THEN '#39#24050#28165#31639#39' ' +
      'WHEN 3 THEN '#39#24050#21462#28040#39' END AS v_status114, '#13#10'                dbo.Data' +
      '0114.DEBIT_AMOUNT, ROUND(dbo.Data0114.AMOUNT * dbo.Data0114.EXCH' +
      'ANGE_RATE, 2) AS stand_amount, '#13#10'                CASE WHEN INV_P' +
      'TR IS NULL THEN Data0116.MEMO_NUMBER ELSE Data0112.invoice_numbe' +
      'r END AS NUMBER, '#13#10'                CASE WHEN INV_PTR IS NULL THE' +
      'N - data0115.amount ELSE data0115.amount END AS MX_amount, '#13#10'   ' +
      '             dbo.Data0115.APPL_CASH_DISC'#13#10'FROM      dbo.Data0114' +
      ' INNER JOIN'#13#10'                dbo.Data0001 ON dbo.Data0114.CURREC' +
      'Y_PTR = dbo.Data0001.RKEY INNER JOIN'#13#10'                dbo.Data00' +
      '10 ON dbo.Data0114.SRCE_PTR = dbo.Data0010.RKEY INNER JOIN'#13#10'    ' +
      '            dbo.Data0115 ON dbo.Data0114.RKEY = dbo.Data0115.SRC' +
      'E_PTR LEFT OUTER JOIN'#13#10'                dbo.Data0112 ON dbo.Data0' +
      '115.INV_PTR = dbo.Data0112.RKEY LEFT OUTER JOIN'#13#10'               ' +
      ' dbo.Data0116 ON dbo.Data0115.CRE_MEMO_PTR = dbo.Data0116.RKEY L' +
      'EFT OUTER JOIN'#13#10'                dbo.Data0105 ON dbo.Data0114.RKE' +
      'Y = dbo.Data0105.SOURCE_PTR LEFT OUTER JOIN'#13#10'                dbo' +
      '.Data0128 ON dbo.Data0114.BANK_PTR = dbo.Data0128.RKEY LEFT OUTE' +
      'R JOIN'#13#10'                dbo.Data0015 ON dbo.Data0114.warehouse_p' +
      'tr = dbo.Data0015.RKEY'#13#10'WHERE (data0114.ttype <> 3) and '#13#10'      ' +
      '(data0114.ttype <> 4) and'#13#10'      (Data0114.TDATE>= :vdate3)  and' +
      #13#10'      (Data0114.TDATE<= :vdate4) '
    IndexFieldNames = 'REFERENCE_NO'
    Parameters = <
      item
        Name = 'vdate3'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'vdate4'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    Left = 112
    Top = 488
    object strngfldADO115REFERENCE_NO: TStringField
      FieldName = 'REFERENCE_NO'
      Size = 10
    end
    object strngfldADO115VOUCHER: TStringField
      FieldName = 'VOUCHER'
      Size = 12
    end
    object ADO115STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object ADO115RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO115TDATE: TDateTimeField
      FieldName = 'TDATE'
    end
    object strngfldADO115REMARK: TStringField
      FieldName = 'REMARK'
      Size = 60
    end
    object ADO115status114: TWordField
      FieldName = 'status114'
    end
    object strngfldADO115CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object strngfldADO115CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object ADO115EXCHANGE_RATE: TFloatField
      FieldName = 'EXCHANGE_RATE'
    end
    object strngfldADO115BANK_NAME: TStringField
      FieldName = 'BANK_NAME'
      Size = 30
    end
    object strngfldADO115CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object strngfldADO115ANALYSIS_CODE4: TStringField
      FieldName = 'ANALYSIS_CODE4'
    end
    object strngfldADO115ANALYSIS_CODE5: TStringField
      FieldName = 'ANALYSIS_CODE5'
    end
    object strngfldADO115CUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object strngfldADO115ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object strngfldADO115FED_TAX_ID_NO: TStringField
      FieldName = 'FED_TAX_ID_NO'
      Size = 50
    end
    object ADO115TTYPE: TWordField
      FieldName = 'TTYPE'
    end
    object ADO115BAL_AMOUNT: TFloatField
      FieldName = 'BAL_AMOUNT'
    end
    object ADO115dz_amount: TFloatField
      FieldName = 'dz_amount'
      ReadOnly = True
    end
    object strngfldADO115WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object strngfldADO115abbrname15: TStringField
      FieldName = 'abbrname15'
      Size = 10
    end
    object strngfldADO115v_ttype: TStringField
      FieldName = 'v_ttype'
      ReadOnly = True
      Size = 8
    end
    object strngfldADO115v_status: TStringField
      FieldName = 'v_status'
      ReadOnly = True
      Size = 8
    end
    object strngfldADO115v_status114: TStringField
      FieldName = 'v_status114'
      ReadOnly = True
      Size = 6
    end
    object ADO115DEBIT_AMOUNT: TFloatField
      FieldName = 'DEBIT_AMOUNT'
    end
    object ADO115stand_amount: TFloatField
      FieldName = 'stand_amount'
      ReadOnly = True
    end
    object strngfldADO115NUMBER: TStringField
      FieldName = 'NUMBER'
      ReadOnly = True
      Size = 12
    end
    object ADO115MX_amount: TBCDField
      FieldName = 'MX_amount'
      ReadOnly = True
      Precision = 10
      Size = 2
    end
    object ADO115APPL_CASH_DISC: TBCDField
      FieldName = 'APPL_CASH_DISC'
      Precision = 10
      Size = 2
    end
  end
  object DS115: TDataSource
    DataSet = ADO115
    Left = 192
    Top = 488
  end
end
