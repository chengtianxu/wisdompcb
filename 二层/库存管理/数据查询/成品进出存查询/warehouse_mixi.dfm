object Form9: TForm9
  Left = 568
  Top = 184
  Width = 1117
  Height = 556
  Caption = #25104#21697#24211#23384#26126#32454
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
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1101
    Height = 60
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 258
      Top = 16
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = #26412#21378#32534#21495':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 520
      Top = 10
      Width = 91
      Height = 13
      Caption = #24211#23384#25968#37327#21512#35745#65306
    end
    object Label3: TLabel
      Left = 520
      Top = 36
      Width = 91
      Height = 13
      Caption = #24211#23384#38754#31215#21512#35745#65306
    end
    object lbl1: TLabel
      Left = 840
      Top = 12
      Width = 65
      Height = 13
      Caption = #24050#36807#26377#25928#26399
    end
    object lbl2: TLabel
      Left = 848
      Top = 42
      Width = 78
      Height = 13
      Caption = #24050#36229#22238#22797#20132#26399
    end
    object lbl3: TLabel
      Left = 960
      Top = 12
      Width = 91
      Height = 13
      Caption = #36229#26399#19988#36807#26377#25928#26399
    end
    object Edit1: TEdit
      Left = 326
      Top = 12
      Width = 117
      Height = 21
      ImeMode = imDisable
      ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 0
      OnChange = Edit1Change
    end
    object BitBtn1: TBitBtn
      Left = 14
      Top = 6
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
      TabOrder = 1
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
      Left = 72
      Top = 6
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
      TabOrder = 2
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
    object Edit2: TEdit
      Left = 608
      Top = 6
      Width = 121
      Height = 21
      Color = clBtnFace
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      ReadOnly = True
      TabOrder = 3
    end
    object Edit3: TEdit
      Left = 608
      Top = 32
      Width = 121
      Height = 21
      Color = clBtnFace
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      ReadOnly = True
      TabOrder = 4
    end
    object BitBtn2: TBitBtn
      Left = 130
      Top = 6
      Width = 57
      Height = 30
      Hint = #23548#20986#25968#25454'Excel'
      Caption = #23383#27573
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      PopupMenu = PopupMenu1
      ShowHint = True
      TabOrder = 5
      OnClick = BitBtn2Click
      Glyph.Data = {
        0E070000424D0E0700000000000036040000280000001A0000001A0000000100
        080000000000D80200001217000012170000000100000000000000000000D0C8
        C80078787800383838000088080050F85800B8B8B800F8F8F800004800006060
        600080F8880000F00800A0A0A000E0E0E0009898980030303000E8E8E800C0C0
        C00000A80800A8A8A80020F83000D8D8D800C8C8C800505050009090900000D8
        080068686800F0F0F0008080880010F8200098F8A000B0B0B00060F86800D0D0
        D0003850380000A0080090F898000058000008080800C8D0C80008F818007070
        70008080800000980800C8D0D00058F8600088888800D0C8D00068F87000A0F8
        A00000F8080028F8300000B0080000E0080018F8200098F89800000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000130000904C1A00000000000000E400F712000035A6FC00770000001300
        0700A7FC7700080613000083A600FC7700000000000035A5FC0077FFFF000000
        2000010000000000000000000000000000000000000000000000000000000000
        31000000000000F1F500006400006600C800651A00007801130000C865001A00
        780001130000C0651A00000000000000C000F7120000C8F3EB007770F5001200
        0000ECFD7F0002000000000000001300E8000100000001000A0000884000F877
        90004C1A00000100000000998400E6775400F71200000101010001D8F8001200
        450090FB7700801FF80077FFFF00FFFF6000F8120000AD84E6007760F8001200
        D80084E677000000000000FFFF0000003000F1F5000030F1F500001800000000
        00000000000044F8120000400000000000000000000028F81200000000000000
        00000000000000000000000C000000000200000000000101120000872B00F877
        0000ECFD7F00000000000002000000006C00001A0200984C1A00007FFF00FFFF
        000000000000984C1A00000500000000870031E6770084F8120000218600E677
        9800F81200006713000010FFFF00000020000100000030F1F500000000000000
        7000F8120000ACF8120000D8F8001200100030001000F8400000105F5400E677
        200001000000D0F8120000D8F80012000800000000000E000000070707070700
        0000000000000000000000000000000000070707000007070707002222222222
        2222222222222222222222222200070700000707070700222222222222222222
        2222222222222222220007070000070707070022222222222222222222222222
        2222222222000707000007070707002222222222222222222222222222222222
        2200070700000707070700220000000000000000000000000000000022000707
        0000070707070022170E0E0E0E0E180E0E0E0E0E0E0E0E002200070700000707
        07070022171313130C1C1A0C1313131313131300220007070000070707070022
        1706061F1809252E1F060606060606002200070700000707070700220911060E
        09239C1A0E061111111111002200070700000707070700221A110C1A34191908
        1A0C11012C0127002200070700000707070700221A0602343514302308291321
        1515150022000707000007070707002229160514050A0DC233D82202060D1000
        220007070000070707070022021B1B070707071B1B312D12081F070022000707
        000007070707002202070707070707070710312D23291B002200070700000707
        07070022021B1B1B1B1B1B1B1B1B0D1E2D201000220007070000070707070022
        290D0D0D0D0D0D0D0D0D0D1524C20DAF2200070700000707070700221A151515
        151515151515151515151500220007070000070707070022092F27212C161616
        0127210116162F002200070700000707070700220F090029291A29F50F171709
        1A0F09002200070700000707070700222222002E0D151017290E111F0E0F2222
        22000707000007070707002222222200002E10290E2121000022222222000707
        0000070707070022222222222200111829210022222222222200070700000707
        0707070000000000000002211F00000000000000000707070000070707070707
        0707070707070300110007070707070707070707000007070707070707070707
        0707170F2A03070707070707070707070000}
    end
    object edt1: TEdit
      Left = 800
      Top = 8
      Width = 33
      Height = 21
      Color = clRed
      ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 6
    end
    object edt2: TEdit
      Left = 800
      Top = 40
      Width = 33
      Height = 21
      Color = clBlue
      ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 7
    end
    object edt3: TEdit
      Left = 920
      Top = 8
      Width = 33
      Height = 21
      Color = clPurple
      ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 8
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 60
    Width = 1101
    Height = 458
    Align = alClient
    DataSource = DataSource1
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'WORK_ORDER_NUMBER'
        Title.Caption = #20316#19994#21333#21495
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_NUMBER'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROD_CODE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PRODUCT_NAME'
        Title.Caption = #20135#21697#31867#21035#21517#31216
        Width = 121
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_name10'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WAREHOUSE_CODE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'LOCATION'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTY_ON_HAND'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'so_mianji'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MFG_DATE'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SCH_DATE'
        Title.Caption = #22238#22797#20132#26399
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXP_DATE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'REFERENCE_NUMBER'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'spec_place'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LATEST_PRICE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'fed_tax_id_no'
        Title.Caption = #20184#27454#26041#27861
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'total_cost'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANALYSIS_CODE_2'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'reference_60'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rep_employeename'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALES_ORDER'
        Title.Caption = #38144#21806#35746#21333#21495
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PARTS_ORDERED'
        Title.Caption = #35746#21333#25968#37327
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'COMMISION_ON_TOOLING60'
        Title.Caption = #38144#21806#26041#24335
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        Title.Caption = #36135#24065#21517#31216
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REPORT_UNIT_VALUE1'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TotalWgt'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'c_type'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'employee_name'
        Title.Caption = #20837#24211#20154#21592
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Title.Caption = #22806#21327#21378#23478
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cust_code10'
        Title.Caption = #23458#25143#20195#30721
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TTYPE'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SAMPLE_NR'
        Title.Caption = #27979#24335#25104#22411#22791#27880
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'state'
        Title.Caption = #29366#24577
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ischaban'
        Title.Caption = #22909#26495#21449#26495
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'zhouqi'
        Title.Caption = #21608#26399
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORIG_CUSTOMER'
        Title.Caption = #20851#32852#21407#23458#25143
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADO53
    OnDataChange = DataSource1DataChange
    Left = 200
    Top = 440
  end
  object ADO53: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      
        'SELECT     TOP (100) PERCENT dbo.Data0006.WORK_ORDER_NUMBER, CAS' +
        'E WHEN Data0060.SALES_ORDER IS NOT NULL '
      
        '                      THEN Data0060.SALES_ORDER ELSE '#39#39' END AS S' +
        'ALES_ORDER, dbo.Data0060.PARTS_ORDERED, dbo.Data0008.PRODUCT_NAM' +
        'E, dbo.Data0008.PROD_CODE, '
      
        '                      dbo.Data0015.WAREHOUSE_CODE, dbo.Data0016.' +
        'LOCATION, dbo.Data0053.QTY_ON_HAND, ROUND(dbo.Data0053.QTY_ON_HA' +
        'ND * dbo.Data0025.unit_sq, 4) '
      
        '                      AS so_mianji, dbo.Data0053.MFG_DATE, dbo.D' +
        'ata0060.SCH_DATE, dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MA' +
        'NU_PART_DESC, '
      
        '                      dbo.Data0025.LATEST_PRICE, dbo.Data0025.AN' +
        'ALYSIS_CODE_2, dbo.Data0060.REFERENCE_NUMBER AS reference_60, '
      
        '                      dbo.Data0005.EMPLOYEE_NAME, dbo.Data0053.M' +
        'FG_DATE + dbo.Data0025.REVIEW_DAYS AS EXP_DATE, dbo.Data0010.FED' +
        '_TAX_ID_NO, '
      
        '                      dbo.Data0053.REFERENCE_NUMBER, dbo.Data002' +
        '5.SAMPLE_NR, '
      
        '                      CASE Data0060.COMMISION_ON_TOOLING WHEN '#39'Y' +
        #39' THEN '#39#36716#21378#39' WHEN '#39'N'#39' THEN '#39#20869#38144#39' END AS COMMISION_ON_TOOLING60, db' +
        'o.Data0001.CURR_NAME, '
      
        '                      dbo.Data0025.REPORT_UNIT_VALUE1, ROUND(dbo' +
        '.Data0053.QTY_ON_HAND * dbo.Data0025.REPORT_UNIT_VALUE1 * 0.001,' +
        ' 4) AS TotalWgt, '
      
        '                      CASE data0053.rma_ptr WHEN 0 THEN '#39#27491#24120#36807#25968#20837#20179#39 +
        ' WHEN 1 THEN '#39#36864#36135#37325#26816#20837#20179#39' WHEN 2 THEN '#39#36820#20462#37325#26816#20837#20179#39' WHEN 3 THEN '#39#30452#25509#20837#20179#39' WH' +
        'EN 4 THEN '#39#22996#22806#21152#24037#20837#20179#39
      
        '                       WHEN 5 THEN '#39#22996#22806#21152#24037#36864#36135#20837#20179#39' WHEN 6 THEN '#39#38144#21806#36864#36135#20837 +
        #20179#39' WHEN 7 THEN '#39#36716#25442#20837#20179#39' WHEN 8 THEN '#39#29305#27530#20837#20179#39' END AS c_type, dbo.Data' +
        '0023.ABBR_NAME, '
      
        '                      CASE WHEN data0053.work_order_ptr > 0 THEN' +
        ' round(Data0053.QTY_ON_HAND * Data0006.panel_ln * Data0006.panel' +
        '_wd * 0.000001 / Data0006.PARTS_PER_PANEL,'
      
        '                       4) ELSE ROUND(dbo.Data0053.QTY_ON_HAND * ' +
        'dbo.Data0025.unit_sq, 4) END AS total_sq, CASE WHEN Data0060.cus' +
        'tomer_ptr IS NOT NULL '
      
        '                      THEN Data0010_1.ABBR_NAME ELSE data0010.AB' +
        'BR_NAME END AS abbr_name10, CASE WHEN Data0060.customer_ptr IS N' +
        'OT NULL '
      
        '                      THEN Data0010_1.cust_code ELSE data0010.cu' +
        'st_code END AS cust_code10, dbo.Data0053.spec_place, CASE WHEN D' +
        'ATEDIFF(day, GETDATE(), '
      
        '                      dbo.Data0060.SCH_DATE) < 0 THEN '#39#24050#36229#26399#39' ELSE' +
        ' '#39#26377#25928#39' END AS state, '
      
        '                      CASE Data0025.TTYPE WHEN 0 THEN '#39#37327#20135#39' WHEN ' +
        '1 THEN '#39#26679#26495#39' ELSE '#39#26410#23450#20041#39' END AS TTYPE, dbo.Data0097.PO_NUMBER,    ' +
        '                       '
      
        '                        ROUND(dbo.Data0053.QUANTITY * (dbo.Data0' +
        '053.cost_pcs + dbo.Data0053.matl_ovhd_pcs +'
      
        '                      dbo.Data0053.OVHD_COST + dbo.Data0053.PLAN' +
        'NED_QTY+data0053.ovhd1_pcs+data0053.outsource_pcs), 4)   AS tota' +
        'l_cost, d05.EMPLOYEE_NAME AS rep_employeename,'
      
        '                      case when data0053.barcode_ptr is not null' +
        ' then data0060.ORIG_CUSTOMER else data0025.ORIG_CUSTOMER end as ' +
        'ORIG_CUSTOMER,'
      'dbo.data0053.ischaban,dbo.data0053.zhouqi'
      'FROM         dbo.Data0006 RIGHT OUTER JOIN'
      '                      dbo.Data0097 RIGHT OUTER JOIN'
      '                      dbo.Data0005 AS d05 RIGHT OUTER JOIN'
      
        '                      dbo.Data0060 ON d05.RKEY = dbo.Data0060.CO' +
        'MM_ASSIGNED_BY_E_P RIGHT OUTER JOIN'
      '                      dbo.Data0008 INNER JOIN'
      
        '                      dbo.Data0025 ON dbo.Data0008.RKEY = dbo.Da' +
        'ta0025.PROD_CODE_PTR INNER JOIN'
      
        '                      dbo.Data0010 ON dbo.Data0025.CUSTOMER_PTR ' +
        '= dbo.Data0010.RKEY INNER JOIN'
      '                      dbo.Data0053 INNER JOIN'
      
        '                      dbo.Data0015 ON dbo.Data0053.WHSE_PTR = db' +
        'o.Data0015.RKEY INNER JOIN'
      
        '                      dbo.Data0016 ON dbo.Data0053.LOC_PTR = dbo' +
        '.Data0016.RKEY ON dbo.Data0025.RKEY = dbo.Data0053.CUST_PART_PTR' +
        ' INNER JOIN'
      
        '                      dbo.data0416 ON dbo.Data0053.NPAD_PTR = db' +
        'o.data0416.rkey INNER JOIN'
      
        '                      dbo.Data0005 ON dbo.data0416.empl_ptr = db' +
        'o.Data0005.RKEY ON dbo.Data0060.RKEY = dbo.Data0053.barcode_ptr ' +
        'LEFT OUTER JOIN'
      
        '                      dbo.Data0010 AS Data0010_1 ON dbo.Data0060' +
        '.CUSTOMER_PTR = Data0010_1.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0023 ON dbo.Data0060.supplier_ptr ' +
        '= dbo.Data0023.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0001 ON dbo.Data0060.CURRENCY_PTR ' +
        '= dbo.Data0001.RKEY ON dbo.Data0097.RKEY = dbo.Data0060.PURCHASE' +
        '_ORDER_PTR ON '
      
        '                      dbo.Data0006.RKEY = dbo.Data0053.WORK_ORDE' +
        'R_PTR'
      'WHERE     (dbo.Data0053.QTY_ON_HAND > 0) '
      'ORDER BY dbo.Data0025.MANU_PART_NUMBER')
    Left = 257
    Top = 439
    object ADO53WORK_ORDER_NUMBER: TStringField
      DisplayLabel = #24037#20316#23450#21333
      DisplayWidth = 22
      FieldName = 'WORK_ORDER_NUMBER'
      ReadOnly = True
      FixedChar = True
      Size = 22
    end
    object ADO53PROD_CODE: TStringField
      DisplayLabel = #20135#21697#31867#21035
      DisplayWidth = 10
      FieldName = 'PROD_CODE'
      ReadOnly = True
      Size = 10
    end
    object ADO53CUST_CODE: TStringField
      DisplayLabel = #23458#25143#31616#31216
      DisplayWidth = 15
      FieldName = 'abbr_name10'
      ReadOnly = True
      Size = 10
    end
    object ADO53WAREHOUSE_CODE: TStringField
      DisplayLabel = #24037#21378
      DisplayWidth = 12
      FieldName = 'WAREHOUSE_CODE'
      ReadOnly = True
      Size = 5
    end
    object ADO53LOCATION: TStringField
      DisplayLabel = #20179#24211
      DisplayWidth = 18
      FieldName = 'LOCATION'
      ReadOnly = True
    end
    object ADO53QTY_ON_HAND: TFloatField
      DisplayLabel = #24211#23384#25968#37327
      DisplayWidth = 16
      FieldName = 'QTY_ON_HAND'
      ReadOnly = True
    end
    object ADO53MFG_DATE: TDateTimeField
      DisplayLabel = #20837#20179#26085#26399
      DisplayWidth = 19
      FieldName = 'MFG_DATE'
      ReadOnly = True
      DisplayFormat = 'yyyy-mm-dd'
    end
    object ADO53EXP_DATE: TDateTimeField
      DisplayLabel = #36807#26399#26085#26399
      FieldName = 'EXP_DATE'
      ReadOnly = True
    end
    object ADO53REFERENCE_NUMBER: TStringField
      DisplayLabel = #22791#27880
      DisplayWidth = 30
      FieldName = 'REFERENCE_NUMBER'
      ReadOnly = True
      FixedChar = True
    end
    object ADO53LATEST_PRICE: TFloatField
      DisplayLabel = #26368#26032#20215#26684
      DisplayWidth = 23
      FieldName = 'LATEST_PRICE'
      ReadOnly = True
    end
    object ADO53so_mianji: TFloatField
      DisplayLabel = #24211#23384#38754#31215
      FieldName = 'so_mianji'
      ReadOnly = True
    end
    object ADO53ANALYSIS_CODE_2: TStringField
      DisplayLabel = #23458#25143#29289#26009#21495
      FieldName = 'ANALYSIS_CODE_2'
      ReadOnly = True
      Size = 50
    end
    object ADO53MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
      ReadOnly = True
    end
    object ADO53MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      ReadOnly = True
      Size = 40
    end
    object ADO53PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      ReadOnly = True
      Size = 30
    end
    object ADO53reference_60: TStringField
      DisplayLabel = #35746#21333#21442#32771
      FieldName = 'reference_60'
      ReadOnly = True
      Size = 30
    end
    object ADO53PO_NUMBER: TStringField
      DisplayLabel = #23458#25143#35746#21333#21495
      FieldName = 'PO_NUMBER'
      ReadOnly = True
      Size = 25
    end
    object ADO53fed_tax_id_no: TStringField
      FieldName = 'fed_tax_id_no'
      ReadOnly = True
      Size = 50
    end
    object ADO53CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
      ReadOnly = True
    end
    object ADO53COMMISION_ON_TOOLING60: TStringField
      FieldName = 'COMMISION_ON_TOOLING60'
      ReadOnly = True
      Size = 4
    end
    object ADO53REPORT_UNIT_VALUE1: TBCDField
      DisplayLabel = #21333#37325'(G)'
      FieldName = 'REPORT_UNIT_VALUE1'
      ReadOnly = True
      Precision = 9
    end
    object ADO53TotalWgt: TFloatField
      DisplayLabel = #24635#37325'(KG)'
      FieldName = 'TotalWgt'
      ReadOnly = True
    end
    object ADO53c_type: TStringField
      DisplayLabel = #20837#24211#31867#22411
      FieldName = 'c_type'
      ReadOnly = True
      Size = 16
    end
    object ADO53SCH_DATE: TDateTimeField
      FieldName = 'SCH_DATE'
      ReadOnly = True
    end
    object ADO53SALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      ReadOnly = True
      FixedChar = True
      Size = 12
    end
    object ADO53PARTS_ORDERED: TFloatField
      FieldName = 'PARTS_ORDERED'
      ReadOnly = True
    end
    object ADO53ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      ReadOnly = True
      Size = 16
    end
    object ADO53ORIG_CUSTOMER: TStringField
      FieldName = 'ORIG_CUSTOMER'
      ReadOnly = True
      Size = 10
    end
    object ADO53total_sq: TFloatField
      DisplayLabel = #24211#23384#38754#31215
      FieldName = 'total_sq'
      ReadOnly = True
    end
    object ADO53employee_name: TStringField
      DisplayLabel = #20837#24211#20154#21592#22995#21517
      FieldName = 'employee_name'
      ReadOnly = True
      Size = 16
    end
    object ADO53cust_code10: TStringField
      FieldName = 'cust_code10'
      ReadOnly = True
      Size = 10
    end
    object ADO53spec_place: TStringField
      DisplayLabel = #20855#20307#20301#32622
      FieldName = 'spec_place'
      ReadOnly = True
    end
    object ADO53TTYPE: TStringField
      DisplayLabel = #20135#21697#23646#24615
      FieldName = 'TTYPE'
      ReadOnly = True
      Size = 6
    end
    object ADO53SAMPLE_NR: TStringField
      FieldName = 'SAMPLE_NR'
      ReadOnly = True
      Size = 50
    end
    object ADO53total_cost: TFloatField
      DisplayLabel = #25104#26412
      FieldName = 'total_cost'
      ReadOnly = True
    end
    object ADO53state: TStringField
      FieldName = 'state'
      ReadOnly = True
      Size = 6
    end
    object ADO53rep_employeename: TStringField
      DisplayLabel = #19994#21153#21592#22995#21517
      FieldName = 'rep_employeename'
      ReadOnly = True
      Size = 16
    end
    object intgrfldADO53ischaban: TIntegerField
      FieldName = 'ischaban'
    end
    object strngfldADO53zhouqi: TStringField
      FieldName = 'zhouqi'
      Size = 200
    end
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    OnPopup = PopupMenu1Popup
    Left = 200
    Top = 8
  end
end
