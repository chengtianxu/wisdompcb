object main_form: Tmain_form
  Left = 732
  Top = 202
  Width = 857
  Height = 577
  Caption = #24037#20855#36153#29992#25968#25454#20998#26512
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
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 841
    Height = 94
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvNone
    TabOrder = 0
    object Bevel1: TBevel
      Left = 648
      Top = 66
      Width = 175
      Height = 25
    end
    object spbtnClear: TSpeedButton
      Left = 53
      Top = 10
      Width = 27
      Height = 27
      Hint = #21047#26032
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADABFBFBDADADADADADDADADBFADADADADAADADAD000DADADADDADAD0FBF0DA
        DADAADAD0F7FBF0DADADDAD0F7F87BF0DADAAD0F7F87BFB70DADD0F7F87BFB78
        80DA000F87BFB78880ADDAD00BFB78880ADAADADA0B7888740ADDADADA088804
        440AADADADA000A04440DADADADADADA0440ADADADADADADA00D}
      ParentShowHint = False
      ShowHint = True
      OnClick = spbtnClearClick
    end
    object spBtnExit: TSpeedButton
      Left = 13
      Top = 10
      Width = 27
      Height = 27
      Hint = #36864#20986
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
      ParentShowHint = False
      ShowHint = True
      OnClick = spBtnExitClick
    end
    object spBtnExport: TSpeedButton
      Left = 13
      Top = 56
      Width = 27
      Height = 27
      Hint = #25968#25454#23548#20986'Excel'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DADADADADADA
        DADAADADADADADADADADDADADADADAD00000000000000006666007777777706E
        EF0AA0E6666606EEF0ADDA0E66606EEF060AADA0E606EEF0000DDADA006EEF0A
        DADAADAD06EEF00DADADDAD06EEF0670DADAAD06EEF0E6670DADD06EEF0A0E66
        70DA0FFFF0ADA0EEEE0D00000ADADA00000AADADADADADADADAD}
      ParentShowHint = False
      ShowHint = True
      OnClick = spBtnExportClick
    end
    object Label3: TLabel
      Left = 498
      Top = 72
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = #23458#25143#65306
    end
    object Label4: TLabel
      Left = 303
      Top = 72
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = #24037#21378#65306
    end
    object SpeedButton1: TSpeedButton
      Left = 610
      Top = 65
      Width = 26
      Height = 25
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
      OnClick = SpeedButton1Click
    end
    object Label5: TLabel
      Left = 655
      Top = 72
      Width = 170
      Height = 13
      Caption = #20135#20540#37329#39069#21333#20301#65306#20154#27665#24065'('#21547#31246')'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object RadioGroup1: TRadioGroup
      Left = 96
      Top = 48
      Width = 193
      Height = 43
      Hint = #19981#36873#25321#23458#25143#21450#19994#21153#21592#31995#32479#23558#26597#35810#20840#37096
      Caption = #26597#35810#26041#24335
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #25353#23458#25143
        #25353#19994#21153#21592)
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = RadioGroup1Click
    end
    object GroupBox1: TGroupBox
      Left = 304
      Top = 2
      Width = 329
      Height = 43
      Caption = #26085#26399#33539#22260
      TabOrder = 1
      object Label1: TLabel
        Left = 14
        Top = 21
        Width = 20
        Height = 13
        Alignment = taRightJustify
        Caption = #20174':'
      end
      object Label2: TLabel
        Left = 171
        Top = 21
        Width = 20
        Height = 13
        Alignment = taRightJustify
        Caption = #21040':'
      end
      object DTPk1: TDateTimePicker
        Left = 42
        Top = 17
        Width = 111
        Height = 21
        Date = 39668.000000000000000000
        Time = 39668.000000000000000000
        TabOrder = 0
      end
      object DTPk2: TDateTimePicker
        Left = 206
        Top = 17
        Width = 111
        Height = 21
        Date = 39668.000000000000000000
        Time = 39668.000000000000000000
        TabOrder = 1
      end
    end
    object RadioGroup2: TRadioGroup
      Left = 96
      Top = 2
      Width = 193
      Height = 43
      Hint = #19981#36873#25321#23458#25143#21450#19994#21153#21592#31995#32479#23558#26597#35810#20840#37096
      Caption = #20135#20540#32479#35745#26041#24335
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #25353#20986#36135#20135#20540
        #25353#35746#21333#20135#20540)
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object Edit1: TEdit
      Left = 539
      Top = 68
      Width = 70
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnExit = Edit1Exit
    end
    object ComboBox1: TComboBox
      Left = 338
      Top = 68
      Width = 137
      Height = 21
      ItemHeight = 13
      TabOrder = 3
      Text = 'ComboBox1'
      OnChange = ComboBox1Change
    end
    object BitBtn1: TBitBtn
      Left = 53
      Top = 56
      Width = 27
      Height = 27
      Hint = #26681#25454#24050#35774#26465#20214#26597#35810#25968#25454
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = BitBtn1Click
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
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 94
    Width = 841
    Height = 445
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #26126#32454
      object SG1: TStringGrid
        Left = 0
        Top = 0
        Width = 833
        Height = 417
        Align = alClient
        ColCount = 13
        DefaultColWidth = 65
        DefaultRowHeight = 20
        FixedCols = 7
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
        TabOrder = 0
        RowHeights = (
          20
          20)
      end
    end
    object TabSheet2: TTabSheet
      Caption = #27719#24635
      ImageIndex = 1
      object SG2: TStringGrid
        Left = 0
        Top = 0
        Width = 833
        Height = 417
        Align = alClient
        ColCount = 9
        DefaultColWidth = 65
        DefaultRowHeight = 20
        FixedCols = 3
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
        TabOrder = 0
        RowHeights = (
          20
          20)
      end
    end
  end
  object aq61: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select rkey,CATEGORY '
      'from data0061'
      'order by rkey')
    Left = 72
    Top = 256
    object aq61rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object aq61CATEGORY: TStringField
      FieldName = 'CATEGORY'
    end
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 186
  end
  object aqtmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 72
    Top = 226
  end
  object AQ25: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT TOP 100 PERCENT Data0010.CUST_CODE,Data0010.ABBR_NAME, '
      
        '       Data0005.EMPLOYEE_NAME as SALES_REP_NAME,Data0025.MANU_PA' +
        'RT_NUMBER, '
      
        '       Data0025.MANU_PART_DESC,Data0025.ANALYSIS_CODE_2, Data006' +
        '0.CUST_PART_PTR,data0025.ORIG_CUSTOMER,'
      '      data0060.customer_ptr,Data0060.COMM_ASSIGNED_BY_E_P '
      
        'FROM Data0060 INNER JOIN Data0025 ON Data0060.CUST_PART_PTR = Da' +
        'ta0025.RKEY '
      
        '     INNER JOIN Data0010 ON Data0060.CUSTOMER_PTR = Data0010.RKE' +
        'Y '
      
        '     INNER JOIN Data0005 ON Data0060.COMM_ASSIGNED_BY_E_P = Data' +
        '0005.RKEY')
    Left = 124
    Top = 225
    object AQ25CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object AQ25ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object AQ25SALES_REP_NAME: TStringField
      FieldName = 'SALES_REP_NAME'
    end
    object AQ25MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object AQ25MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object AQ25CUST_PART_PTR: TIntegerField
      FieldName = 'CUST_PART_PTR'
    end
    object AQ25ANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      Size = 80
    end
    object AQ25ORIG_CUSTOMER: TStringField
      FieldName = 'ORIG_CUSTOMER'
      Size = 10
    end
    object AQ25customer_ptr: TIntegerField
      FieldName = 'customer_ptr'
    end
    object AQ25COMM_ASSIGNED_BY_E_P: TIntegerField
      FieldName = 'COMM_ASSIGNED_BY_E_P'
    end
  end
  object AQ_SUM: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'ttype'
        Size = -1
        Value = Null
      end
      item
        Name = 'p1'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'p2'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'rkey25'
        Size = -1
        Value = Null
      end
      item
        Name = 'rkey10'
        Size = -1
        Value = Null
      end
      item
        Name = 'rkey05'
        Size = -1
        Value = Null
      end
      item
        Name = 'p3'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'p4'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'rkey_25'
        Size = -1
        Value = Null
      end
      item
        Name = 'rkey_10'
        Size = -1
        Value = Null
      end
      item
        Name = 'rkey_05'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @a int'
      'select @a=:ttype'
      'if @a=0 '
      'SELECT sum(Data0064.QUAN_SHIPPED) as qty_sum, '
      
        '      ROUND(SUM(Data0064.QUAN_SHIPPED * Data0064.part_price*(1+d' +
        'ata0064.TAX_2*0.01) / Data0060.EXCH_RATE),'
      '       3) AS money_sum'
      'FROM Data0060 INNER JOIN'
      '      Data0064 ON Data0060.RKEY = Data0064.SO_PTR'
      'WHERE (dbo.Data0064.DATE_SHIPPED >=:p1) AND '
      '      (dbo.Data0064.DATE_SHIPPED <=:p2) and'
      '      (data0060.CUST_PART_PTR=:rkey25) and'
      '      (data0060.CUSTomer_ptr=:rkey10) and'
      '      (data0060.COMM_ASSIGNED_BY_E_P =:rkey05) '
      'else'
      'SELECT isnull(sum(Data0060.PARTS_ORDERED),0) as qty_sum, '
      
        '       isnull(ROUND(SUM(Data0060.PARTS_ORDERED*Data0060.parts_al' +
        'loc*(1+data0060.RUSH_CHARGE*0.01)/Data0060.EXCH_RATE + '
      '       case when data0060.tax_in_price='#39'Y'#39' then'
      '       Data0060.TOTAL_ADD_L_PRICE/Data0060.EXCH_RATE else '
      
        '       (Data0060.TOTAL_ADD_L_PRICE*(1+data0060.RUSH_CHARGE*0.01)' +
        ')/Data0060.EXCH_RATE'
      '        end        '
      '       ), 3),0)        AS money_sum'
      'FROM Data0060'
      'WHERE (Data0060.ENT_DATE >=:p3) AND'
      '      (Data0060.ENT_DATE <=:p4) AND'
      '      (data0060.CUST_PART_PTR=:rkey_25) and'
      '      ((Data0060.STATUS = 1) OR (Data0060.STATUS = 4)) and'
      '      (data0060.CUSTomer_ptr=:rkey_10) and'
      '      (data0060.COMM_ASSIGNED_BY_E_P =:rkey_05)')
    Left = 156
    Top = 225
  end
  object AQ_DETAIL: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'ttype'
        Size = -1
        Value = Null
      end
      item
        Name = 'd1'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'd2'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'rkey25'
        Size = -1
        Value = Null
      end
      item
        Name = 'd3'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'd4'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'rkey_25'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @a int           '
      'set @a=:ttype'
      'if @a=0 '
      
        'SELECT TOP 100 PERCENT Data0062.ADDL_CAT_PTR, SUM(Data0062.AMOUN' +
        'T/D1.EXCH_RATE) '
      
        '      AS Y_amount, SUM(Data0062.FREE_AMOUNT) AS N_amount,sum(dat' +
        'a0062.costfree_amount) as s_amount'
      'FROM Data0062 INNER JOIN'
      '          (SELECT Data0060.RKEY,Data0060.exch_rate'
      
        '         FROM Data0064 INNER JOIN Data0060 ON Data0064.SO_PTR = ' +
        'Data0060.RKEY'
      '      '
      
        '         WHERE (Data0064.DATE_SHIPPED >=:d1) AND (Data0064.DATE_' +
        'SHIPPED <=:d2) AND '
      '               (data0060.CUST_PART_PTR =:rkey25 )'
      
        '         GROUP BY Data0060.RKEY,Data0060.exch_rate) d1 ON Data00' +
        '62.SO_PTR = d1.RKEY'
      ''
      'GROUP BY Data0062.ADDL_CAT_PTR'
      'ORDER BY Data0062.ADDL_CAT_PTR'
      ''
      'else'
      'SELECT Data0060.CUST_PART_PTR,Data0062.ADDL_CAT_PTR,'
      
        '      SUM(Data0062.AMOUNT/Data0060.EXCH_RATE) AS Y_amount,SUM(Da' +
        'ta0062.free_amount)'
      '      AS N_amount,sum(data0062.costfree_amount)  as s_amount'
      
        'FROM Data0060 INNER JOIN Data0062 ON Data0060.RKEY = Data0062.SO' +
        '_PTR '
      'where (data0060.ent_date>=:d3) and (data0060.ent_date<=:d4) and'
      '      (data0060.CUST_PART_PTR=:rkey_25)  '
      'GROUP BY Data0060.CUST_PART_PTR,Data0062.ADDL_CAT_PTR'
      'order by Data0062.ADDL_CAT_PTR'
      'end')
    Left = 188
    Top = 225
  end
  object AQ10: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT TOP 100 PERCENT Data0010.CUST_CODE,Data0010.ABBR_NAME, '
      
        '      Data0005.EMPLOYEE_NAME as SALES_REP_NAME,Data0060.CUSTOMER' +
        '_PTR,Data0060.COMM_ASSIGNED_BY_E_P'
      
        'FROM Data0060 INNER JOIN Data0010 ON Data0060.CUSTOMER_PTR=Data0' +
        '010.RKEY '
      
        '              INNER JOIN Data0005 ON Data0060.COMM_ASSIGNED_BY_E' +
        '_P=Data0005.RKEY ')
    Left = 124
    Top = 257
    object AQ10CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object AQ10ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object AQ10SALES_REP_NAME: TStringField
      FieldName = 'SALES_REP_NAME'
    end
    object AQ10CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object AQ10COMM_ASSIGNED_BY_E_P: TIntegerField
      FieldName = 'COMM_ASSIGNED_BY_E_P'
    end
  end
  object AQ_SUM1: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'ttype'
        Size = -1
        Value = Null
      end
      item
        Name = 'p1'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'p2'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'rkey10'
        Size = -1
        Value = Null
      end
      item
        Name = 'rkey05'
        Size = -1
        Value = Null
      end
      item
        Name = 'p3'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'p4'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'rkey_10'
        Size = -1
        Value = Null
      end
      item
        Name = 'rkey_05'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @a int'
      'select @a=:ttype'
      'if @a=0 '
      'SELECT SUM(Data0064.QUAN_SHIPPED) as qty_sum, '
      
        '      ROUND(SUM(Data0064.QUAN_SHIPPED * Data0064.part_price*(1+d' +
        'ata0064.TAX_2*0.01) / Data0060.EXCH_RATE),'
      '       3) AS money_sum'
      
        'FROM Data0060 INNER JOIN Data0064 ON Data0060.RKEY = Data0064.SO' +
        '_PTR'
      'WHERE (Data0064.DATE_SHIPPED >=:p1) AND '
      '      (dbo.Data0064.DATE_SHIPPED <=:p2) and'
      '      (data0060.CUSTOMER_PTR=:rkey10)  and'
      '     (data0060.COMM_ASSIGNED_BY_E_P =:rkey05) '
      ''
      'else'
      'SELECT isnull(SUM(Data0060.PARTS_ORDERED),0) as qty_sum,'
      
        '      isnull(ROUND(SUM(Data0060.PARTS_ORDERED*Data0060.parts_all' +
        'oc*(1+data0060.RUSH_CHARGE*0.01)/Data0060.EXCH_RATE + '
      '       case when data0060.tax_in_price='#39'Y'#39' then'
      '       Data0060.TOTAL_ADD_L_PRICE/Data0060.EXCH_RATE else '
      
        '       (Data0060.TOTAL_ADD_L_PRICE*(1+data0060.RUSH_CHARGE*0.01)' +
        ')/Data0060.EXCH_RATE'
      '        end        '
      '       ), 3),0)        AS money_sum'
      'FROM Data0060'
      'WHERE (Data0060.ENT_DATE >=:p3) AND'
      '      (Data0060.ENT_DATE <=:p4) AND'
      '      (Data0060.CUSTOMER_PTR=:rkey_10) and'
      '      ((Data0060.STATUS = 1) OR (Data0060.STATUS = 4)) and'
      '      (data0060.COMM_ASSIGNED_BY_E_P =:rkey_05) '
      '')
    Left = 156
    Top = 257
  end
  object AQ_TOOLS: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'ttype'
        Size = -1
        Value = Null
      end
      item
        Name = 'd1'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'd2'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'rkey10'
        Size = -1
        Value = Null
      end
      item
        Name = 'rkey05'
        Size = -1
        Value = Null
      end
      item
        Name = 'd3'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'd4'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'rkey_10'
        Size = -1
        Value = Null
      end
      item
        Name = 'rkey_05'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @a int'
      'set @a=:ttype'
      'if @a=0 '
      
        'SELECT TOP 100 PERCENT Data0062.ADDL_CAT_PTR, SUM(Data0062.AMOUN' +
        'T/d1.EXCH_RATE) '
      
        '      AS Y_amount, SUM(Data0062.FREE_AMOUNT) AS N_amount,SUM(Dat' +
        'a0062.costfree_amount) AS S_AMOUNT'
      'FROM Data0062 INNER JOIN    '
      '         (SELECT Data0060.RKEY,Data0060.exch_rate'
      
        '         FROM Data0064 INNER JOIN Data0060 ON Data0064.SO_PTR = ' +
        'Data0060.RKEY'
      
        '         WHERE (Data0064.DATE_SHIPPED >=:d1) AND (Data0064.DATE_' +
        'SHIPPED <=:d2) AND '
      '               (Data0060.CUSTOMER_PTR =:rkey10) and'
      '              (data0060.COMM_ASSIGNED_BY_E_P =:rkey05) '
      
        '         GROUP BY Data0060.RKEY,Data0060.exch_rate) d1 ON Data00' +
        '62.SO_PTR = d1.RKEY'
      'GROUP BY dbo.Data0062.ADDL_CAT_PTR'
      'ORDER BY dbo.Data0062.ADDL_CAT_PTR'
      'else'
      'SELECT Data0062.ADDL_CAT_PTR,'
      '      SUM(Data0062.AMOUNT/Data0060.EXCH_RATE) AS Y_amount,'
      
        '      SUM(Data0062.free_amount) AS N_amount,SUM(Data0062.costfre' +
        'e_amount) as S_amount'
      
        'FROM Data0060 INNER JOIN Data0062 ON Data0060.RKEY = Data0062.SO' +
        '_PTR'
      'where (data0060.ent_date>=:d3) and'
      '      (data0060.ent_date<=:d4) and'
      '      (data0060.CUSTOMER_PTR=:rkey_10) and'
      '     (data0060.COMM_ASSIGNED_BY_E_P =:rkey_05) '
      'GROUP BY Data0062.ADDL_CAT_PTR'
      'order by Data0062.ADDL_CAT_PTR')
    Left = 188
    Top = 257
  end
end
