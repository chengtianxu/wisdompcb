object Form1: TForm1
  Left = 204
  Top = 133
  Width = 849
  Height = 533
  Caption = #24212#25910#24080#27454#24080#40836#26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid1: TStringGrid
    Left = 0
    Top = 52
    Width = 833
    Height = 427
    Align = alClient
    ColCount = 16
    DefaultRowHeight = 20
    FixedCols = 7
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing]
    TabOrder = 1
    OnDrawCell = StringGrid1DrawCell
    OnSelectCell = StringGrid1SelectCell
    ColWidths = (
      64
      64
      36
      64
      64
      64
      65
      68
      64
      64
      64
      64
      64
      64
      64
      64)
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 833
    Height = 52
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label4: TLabel
      Left = 190
      Top = 9
      Width = 46
      Height = 13
      Caption = #26399#38388#20174':'
    end
    object Label3: TLabel
      Left = 216
      Top = 34
      Width = 20
      Height = 13
      Caption = #21040':'
    end
    object Label1: TLabel
      Left = 342
      Top = 8
      Width = 33
      Height = 13
      Caption = #23458#25143':'
    end
    object Label2: TLabel
      Left = 342
      Top = 34
      Width = 33
      Height = 13
      Caption = #36135#24065':'
    end
    object Label5: TLabel
      Left = 481
      Top = 8
      Width = 35
      Height = 13
      Caption = '     '
    end
    object Label6: TLabel
      Left = 481
      Top = 32
      Width = 35
      Height = 13
      Caption = '     '
    end
    object abbr_name: TLabel
      Left = 479
      Top = 1
      Width = 63
      Height = 13
      Caption = 'abbr_name'
      Visible = False
    end
    object exch_rate: TLabel
      Left = 480
      Top = 36
      Width = 63
      Height = 13
      Caption = 'exch_rate'
      Visible = False
    end
    object tax_id_no: TLabel
      Left = 480
      Top = 19
      Width = 63
      Height = 13
      Caption = 'tax_id_no'
      Visible = False
    end
    object customer_type: TLabel
      Left = 555
      Top = 17
      Width = 91
      Height = 13
      Caption = 'customer_type'
      Visible = False
    end
    object sales_rep_name: TLabel
      Left = 554
      Top = 1
      Width = 98
      Height = 13
      Caption = 'sales_rep_name'
      Visible = False
    end
    object Edit1: TEdit
      Left = 376
      Top = 5
      Width = 68
      Height = 21
      MaxLength = 10
      TabOrder = 4
      OnExit = Edit1Exit
    end
    object dtpk1: TDateTimePicker
      Left = 238
      Top = 6
      Width = 96
      Height = 21
      Date = 38847.000000000000000000
      Time = 38847.000000000000000000
      TabOrder = 0
      OnCloseUp = dtpk1Exit
      OnExit = dtpk1Exit
    end
    object dtpk2: TDateTimePicker
      Left = 238
      Top = 30
      Width = 96
      Height = 21
      Date = 38727.000000000000000000
      Time = 38727.000000000000000000
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 2
      Top = 2
      Width = 57
      Height = 30
      Hint = #36864#20986#31995#32479
      Caption = #36864#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
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
    object Edit2: TEdit
      Left = 376
      Top = 30
      Width = 68
      Height = 21
      MaxLength = 5
      TabOrder = 5
      OnExit = Edit2Exit
    end
    object BitBtn6: TBitBtn
      Left = 450
      Top = 3
      Width = 25
      Height = 25
      TabOrder = 2
      OnClick = BitBtn6Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        333333777777777F33333330B00000003333337F7777777F3333333000000000
        333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
        333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
        03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
        03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
        3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
        333333333377F7F33333333333330F03333333333337F7F33333333333330B03
        3333333333373733333333333333303333333333333373333333}
      NumGlyphs = 2
    end
    object BitBtn2: TBitBtn
      Left = 450
      Top = 27
      Width = 25
      Height = 25
      TabOrder = 3
      OnClick = BitBtn2Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        333333777777777F33333330B00000003333337F7777777F3333333000000000
        333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
        333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
        03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
        03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
        3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
        333333333377F7F33333333333330F03333333333337F7F33333333333330B03
        3333333333373733333333333333303333333333333373333333}
      NumGlyphs = 2
    end
    object BitBtn4: TBitBtn
      Left = 116
      Top = 2
      Width = 57
      Height = 30
      Hint = #24320#22987#25353#26465#20214#26597#35810
      Caption = #26597#35810
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = BitBtn4Click
      Glyph.Data = {
        C6050000424DC605000000000000360400002800000014000000140000000100
        08000000000090010000C40E0000C40E0000000100000000000000000000E8E0
        0000D0A000006060600038383800F0700000B8B8C00020202000A8B0B000F0F0
        F800B8400000C0600800A0A0A000E0E0E800D8D8E000B8100000D0D8D800C0A0
        8800B8300000F8F8080098989800B0504000B0908800B8706000E0A86000E0D8
        C000F070380088888800F0D8B0005858580008101000E0D0B000B8504000E8C8
        A000F0B85000E8D8A800C8C8C800D8982000D8C0B00050505000C8803800F0C8
        8800F8500800D8A040007078780008080800E8C0880028283000F8980000E8F0
        F00040404000B0B8B800B8A0A000C0682800E0A87800F0800000C8D0D000C898
        8000E0A88000D8904800E0E0E000F0A0000070707000E0783000B0888800E8D0
        6800C8B8A800C8700800D8885000B850180028282000B8887800F0F0D8001818
        1800F070180090909000D8C05800E8B09800F8F0E000F8F0F00048484800B8C0
        C800F0C06000F8F8F800F8805800F8F0C80080808000B8906000B0B0B000D090
        5000F8600000D8D0C800E0A05800B8585800B8B00000B8481000D0D0B000D078
        3000C0702000F0A86800C0602000E8E8E800A8A8A800F0C0B800B0201000F0A8
        4000E0B89000B8B8B80068686800F0F0E800F0982000D8D0A800E8C88000F0E0
        C000B8380800F0800800D8E0E000C0C0C000F0680800B0B0B800C0601800E0B8
        7800F0981000C8781800C0C8C80010101800C8A09000E0B8600030303000F0F0
        F000C0B8B80028282800E8E0E000F0F8F8003838400078787800F0D8B800D8C8
        B800F0C89000E0E8E800B8601000D0883800F8680800D8D0B800E8D08800C8C8
        D000D0D0D000B8B0B00058586000D8D8D8002820200010101000E8E8F000F8F8
        F000D8D0D000B8786000B8480000F0780000F0880000E0B08000B8C0C000B818
        0000C0A88800B8300800B0504800F0E0B000E8D0B000F0D08800F8501000F880
        0800ECFD7F0002000000000000001300E8000100000001000A0000884000F877
        78004B1B00000100000000998400E6775400F71200000101010001D8F8001200
        450090FB7700801FF80077FFFF00FFFF6000F8120000AD84E6007760F8001200
        D80084E677000000000000FFFF0000003800A8F8000038A8F800001800000000
        00000000000044F8120000400000000000000000000028F81200000000000000
        00000000000000000000000C000000000200000000000101120000872B00F877
        0000ECFD7F00000000000002000000006C00001A0200804B1B00007FFF00FFFF
        000000000000804B1B00000500000000870031E6770084F8120000218600E677
        9800F81200006713000010FFFF00000020000100000038A8F800000000000000
        7000F8120000ACF8120000D8F8001200100030001000F8400000105F5400E677
        200001000000D0F8120000D8F80012000800000000000E0000005331B2861D86
        1D861D861D861DF81DC57431F62C9824801414572C572C6C2C6C6C1D6C6C77B2
        6CB2B26C2CDF1232DF6C6CF86CF86C861D1B006C1D0E94530E8A6E8A24240E24
        24240E6F6CB294800E531D31550E4C245524242424515551B26C322453318655
        248A0E557780000086576C002CB20E5398536C31305A55F8CC1424511486B2F3
        1D802453535386534C229457536F066F06242CB2806C065353551D5353511D53
        638C12152477248680F8245353318653531D7755358D35121B57066FF66C2453
        98536C535380240EAA6F631557123551B26C24535353945353B2065398554D35
        776F0624C56C065353551D53536C6F53535355246F152451806C245353319453
        532480535353246F7E8D531D946C245398536C53535314F85353AA2453531480
        576C245353532C5353555314C557776F14002C246C5706535355575353315353
        551B6CF857146E146C2C24535331866C775353555353535353225A35C5B20653
        9853570E57535353535353535353AA08143153315353986C866C2C6C6C1D941D
        861D8680775398535355}
    end
    object BitBtn3: TBitBtn
      Left = 59
      Top = 2
      Width = 57
      Height = 30
      Hint = #23548#20986#25968#25454#21040'Excel'
      Caption = #23548#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = BitBtn3Click
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
    object CheckBox1: TCheckBox
      Left = 552
      Top = 32
      Width = 97
      Height = 17
      Caption = #26174#31034#20998#26399#24080#40836
      TabOrder = 9
      OnClick = CheckBox1Click
    end
    object RadioGroup1: TRadioGroup
      Left = 651
      Top = 17
      Width = 157
      Height = 33
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #35760#24080#27719#29575
        #28014#21160#27719#29575)
      TabOrder = 10
    end
  end
  object StringGrid2: TStringGrid
    Left = 608
    Top = 64
    Width = 113
    Height = 345
    ColCount = 2
    FixedCols = 0
    RowCount = 2
    TabOrder = 2
    Visible = False
    ColWidths = (
      43
      41)
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 479
    Width = 833
    Height = 16
    Align = alBottom
    TabOrder = 3
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 280
    Top = 128
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 344
    Top = 128
  end
  object AQ_balance: TADOQuery
    AutoCalcFields = False
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'SELECT CUSTOMER_PTR, CURRENCY_PTR,'
      'SUM(INVOICE_TOTAL - amount_paid - CASH_DISC) AS '#24403#21069#20313#39069','
      
        'ROUND(SUM((INVOICE_TOTAL - amount_paid - CASH_DISC) * BASE_TO_OT' +
        'HER), 2) AS '#24403#21069#20313#39069#35760#24080#26412#24065','
      
        'ROUND(SUM((INVOICE_TOTAL - amount_paid - CASH_DISC) * EXCHANGE_R' +
        'ATE), 2) AS '#24403#21069#20313#39069#26412#24065
      'FROM Data0112 inner join data0001'
      'on data0112.CURRENCY_PTR = data0001.rkey'
      
        'where INVOICE_TOTAL - amount_paid - CASH_DISC > 0  and INVOICE_S' +
        'TATUS=1'
      ''
      ''
      'GROUP BY CUSTOMER_PTR, CURRENCY_PTR'
      'UNION'
      'SELECT CUST_PTR, CURRENCY_PTR,'
      '      -SUM(AVL_AMT) AS '#24403#21069#36151#39033','
      '      -ROUND(SUM(AVL_AMT * BASE_TO_OTHER), 2) AS '#24403#21069#36151#24065#35760#24080#26412#24065','
      '      -ROUND(SUM(AVL_AMT * EX_RATE), 2) AS '#24403#21069#36151#24065#26412#24065
      'FROM Data0116 inner join data0001'
      'on data0116.CURRENCY_PTR = data0001.rkey'
      'where avl_amt > 0 and memo_status <> 3'
      ''
      ''
      'GROUP BY CUST_PTR, CURRENCY_PTR')
    Left = 512
    Top = 208
    object AQ_balanceCUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object AQ_balanceCURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object AQ_balanceDSDesigner: TBCDField
      FieldName = #24403#21069#20313#39069
      ReadOnly = True
      Precision = 19
    end
    object AQ_balanceDSDesigner2: TFloatField
      FieldName = #24403#21069#20313#39069#35760#24080#26412#24065
      ReadOnly = True
    end
    object AQ_balanceDSDesigner3: TFloatField
      FieldName = #24403#21069#20313#39069#26412#24065
      ReadOnly = True
    end
  end
  object aq_lengrece: TADOQuery
    AutoCalcFields = False
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'SELECT CUSTOMER_PTR, CURRENCY_PTR, SUM(INVOICE_TOTAL) AS '#26412#26399#24212#25910','
      
        '      ROUND(SUM(INVOICE_TOTAL * data0001.BASE_TO_OTHER), 2) as '#26412 +
        #26399#24212#25910#35760#24080#26412#24065','
      
        '      ROUND(SUM(INVOICE_TOTAL * data0112.EXCHANGE_RATE), 2) AS '#26412 +
        #26399#24212#25910#26412#24065
      'FROM Data0112 inner join data0001'
      'on data0112.CURRENCY_PTR=data0001.rkey'
      'WHERE (POSTED_DATE >= :dtpk1) AND '
      '      (POSTED_DATE <= :dtpk2) and data0112.invoice_status <> 3'
      ''
      'GROUP BY CUSTOMER_PTR, CURRENCY_PTR')
    Left = 280
    Top = 208
    object aq_lengreceCUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object aq_lengreceCURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object aq_lengreceDSDesigner: TBCDField
      FieldName = #26412#26399#24212#25910
      Precision = 19
    end
    object aq_lengreceDSDesigner2: TFloatField
      FieldName = #26412#26399#24212#25910#35760#24080#26412#24065
      ReadOnly = True
    end
    object aq_lengreceDSDesigner3: TFloatField
      FieldName = #26412#26399#24212#25910#26412#24065
      ReadOnly = True
    end
  end
  object aq_lengyirece: TADOQuery
    AutoCalcFields = False
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'SELECT SRCE_PTR, CURRECY_PTR, SUM(AMOUNT) AS '#26412#26399#25910#27454','
      
        '      ROUND(SUM(AMOUNT * data0001.BASE_TO_OTHER), 2) AS '#26412#26399#25910#27454#35760#24080#26412#24065 +
        ','
      '      ROUND(SUM(AMOUNT * Data0114.EXCHANGE_RATE), 2) AS '#26412#26399#25910#27454#26412#24065
      'FROM Data0114 inner join data0001'
      'on data0114.CURRECY_PTR=data0001.rkey'
      'WHERE (TTYPE <> 3) AND (TTYPE <> 4)'
      
        '     and (Data0114.TDATE >= :dtpk1) AND (Data0114.TDATE <= :dtpk' +
        '2) and'
      '      (status<>3) and (AMOUNT>0)'
      ''
      'GROUP BY SRCE_PTR, CURRECY_PTR')
    Left = 312
    Top = 208
    object aq_lengyireceSRCE_PTR: TIntegerField
      FieldName = 'SRCE_PTR'
    end
    object aq_lengyireceCURRECY_PTR: TIntegerField
      FieldName = 'CURRECY_PTR'
    end
    object aq_lengyireceDSDesigner: TFloatField
      FieldName = #26412#26399#25910#27454
    end
    object aq_lengyireceDSDesigner2: TFloatField
      FieldName = #26412#26399#25910#27454#35760#24080#26412#24065
      ReadOnly = True
    end
    object aq_lengyireceDSDesigner3: TFloatField
      FieldName = #26412#26399#25910#27454#26412#24065
      ReadOnly = True
    end
  end
  object AQ_lengcredit: TADOQuery
    AutoCalcFields = False
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'SELECT CUST_PTR, CURRENCY_PTR, SUM(AMOUNT) AS '#26412#26399#25187#27454','
      
        '      ROUND(SUM(AMOUNT * data0001.BASE_TO_OTHER), 2) AS '#26412#26399#25187#27454#35760#24080#26412#24065 +
        ','
      '      ROUND(SUM(AMOUNT * Data0116.EX_RATE), 2) AS '#26412#26399#25187#27454#26412#24065
      'FROM Data0116 inner join data0001'
      '  on data0116.CURRENCY_PTR = data0001.rkey'
      'WHERE (memo_status<>3) and (memo_tp<>1) and'
      '(MEMO_DATE >= :dtpk1) AND '
      '(MEMO_DATE <= :dtpk2)'
      ''
      'GROUP BY CUST_PTR, CURRENCY_PTR')
    Left = 344
    Top = 208
    object AQ_lengcreditCUST_PTR: TIntegerField
      FieldName = 'CUST_PTR'
    end
    object AQ_lengcreditCURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object AQ_lengcreditDSDesigner: TBCDField
      FieldName = #26412#26399#25187#27454
      Precision = 19
    end
    object AQ_lengcreditDSDesigner2: TFloatField
      FieldName = #26412#26399#25187#27454#35760#24080#26412#24065
      ReadOnly = True
    end
    object AQ_lengcreditDSDesigner3: TFloatField
      FieldName = #26412#26399#25187#27454#26412#24065
      ReadOnly = True
    end
  end
  object aq_finarece: TADOQuery
    AutoCalcFields = False
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'SELECT CUSTOMER_PTR, CURRENCY_PTR, SUM(INVOICE_TOTAL) AS '#26399#21518#24212#25910','
      
        '      ROUND(SUM(INVOICE_TOTAL * data0001.BASE_TO_OTHER), 2) AS '#26399 +
        #21518#24212#25910#35760#24080#26412#24065','
      
        '      ROUND(SUM(INVOICE_TOTAL * Data0112.EXCHANGE_RATE), 2) AS '#26399 +
        #21518#24212#25910#26412#24065
      'FROM Data0112 inner join data0001'
      'on data0112.CURRENCY_PTR=data0001.rkey'
      'WHERE (POSTED_DATE > :dtpk2) and data0112.invoice_status<>3'
      ''
      'GROUP BY CUSTOMER_PTR, CURRENCY_PTR')
    Left = 400
    Top = 208
    object aq_finarececustomer_ptr: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object aq_finarececurrency_ptr: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object aq_finareceDSDesigner: TBCDField
      FieldName = #26399#21518#24212#25910
      Precision = 19
    end
    object aq_finareceDSDesigner2: TFloatField
      FieldName = #26399#21518#24212#25910#35760#24080#26412#24065
      ReadOnly = True
    end
    object aq_finareceDSDesigner3: TFloatField
      FieldName = #26399#21518#24212#25910#26412#24065
      ReadOnly = True
    end
  end
  object aq_finayirece: TADOQuery
    AutoCalcFields = False
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'SELECT SRCE_PTR, CURRECY_PTR, SUM(AMOUNT) AS '#26399#21518#25910#27454','
      '      ROUND(SUM(AMOUNT * BASE_TO_OTHER), 2) AS '#26399#21518#25910#27454#35760#24080#26412#24065','
      '      ROUND(SUM(AMOUNT * EXCHANGE_RATE), 2) AS '#26399#21518#25910#27454#26412#24065
      'FROM Data0114 inner join data0001'
      'on data0114.CURRECY_PTR = data0001.rkey'
      'WHERE (TTYPE <> 3) AND (TTYPE <> 4)'
      '  and (Data0114.TDATE > :dtpk2) and (status<>3)'
      '  and (AMOUNT>0)'
      ''
      'GROUP BY SRCE_PTR, CURRECY_PTR')
    Left = 432
    Top = 208
    object aq_finayirecesrce_ptr: TIntegerField
      FieldName = 'SRCE_PTR'
    end
    object aq_finayirececurrecy_ptr: TIntegerField
      FieldName = 'CURRECY_PTR'
    end
    object aq_finayireceDSDesigner: TFloatField
      FieldName = #26399#21518#25910#27454
    end
    object aq_finayireceDSDesigner2: TFloatField
      FieldName = #26399#21518#25910#27454#35760#24080#26412#24065
      ReadOnly = True
    end
    object aq_finayireceDSDesigner3: TFloatField
      FieldName = #26399#21518#25910#27454#26412#24065
      ReadOnly = True
    end
  end
  object AQ_finacredit: TADOQuery
    AutoCalcFields = False
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'SELECT CUST_PTR, CURRENCY_PTR, SUM(AMOUNT) AS '#26399#21518#25187#27454','
      
        '      ROUND(SUM(AMOUNT * data0001.BASE_TO_OTHER), 2) AS '#26399#21518#25187#27454#35760#24080#26412#24065 +
        ','
      '      ROUND(SUM(AMOUNT * data0116.EX_RATE), 2) AS '#26399#21518#25187#27454#26412#24065
      'FROM Data0116 inner join data0001'
      '  on data0116.CURRENCY_PTR = data0001.rkey'
      'WHERE (memo_status <> 3) and (memo_tp<>1) and'
      '(MEMO_DATE > :dtpk2)'
      ''
      'GROUP BY CUST_PTR, CURRENCY_PTR')
    Left = 464
    Top = 208
    object AQ_finacreditcust_ptr: TIntegerField
      FieldName = 'CUST_PTR'
    end
    object AQ_finacreditcurrency_ptr: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object AQ_finacreditDSDesigner: TBCDField
      FieldName = #26399#21518#25187#27454
      Precision = 19
    end
    object AQ_finacreditDSDesigner2: TFloatField
      FieldName = #26399#21518#25187#27454#35760#24080#26412#24065
      ReadOnly = True
    end
    object AQ_finacreditDSDesigner3: TFloatField
      FieldName = #26399#21518#25187#27454#26412#24065
      ReadOnly = True
    end
  end
  object aq01: TADOQuery
    AutoCalcFields = False
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select rkey,curr_code,BASE_TO_OTHER '
      'from data0001'
      'order by rkey')
    Left = 312
    Top = 128
    object aq01rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object aq01curr_code: TStringField
      FieldName = 'curr_code'
      Size = 5
    end
    object aq01BASE_TO_OTHER: TFloatField
      FieldName = 'BASE_TO_OTHER'
    end
  end
end
