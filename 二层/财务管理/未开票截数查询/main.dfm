object Form_main: TForm_main
  Left = 287
  Top = 167
  Width = 870
  Height = 500
  Caption = #26410#24320#31080#25130#25968#26597#35810
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
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 37
    Width = 854
    Height = 424
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    FooterRowCount = 1
    OptionsEh = [dghFixed3D, dghFooter3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    SumList.Active = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGridEh1KeyDown
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'CUST_CODE'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Color = clRed
        Title.SortIndex = 1
        Title.SortMarker = smUpEh
        Width = 73
      end
      item
        EditButtons = <>
        FieldName = 'ABBR_NAME'
        Footers = <>
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'CUSTOMER_NAME'
        Footers = <>
        Width = 167
      end
      item
        EditButtons = <>
        FieldName = 'invoice_number'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'CURR_CODE'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'EXCHANGE_RATE'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'POSTED_DATE'
        Footers = <>
        Width = 84
      end
      item
        EditButtons = <>
        FieldName = 'INVOICE_DATE'
        Footers = <>
        Width = 94
      end
      item
        EditButtons = <>
        FieldName = 'INVOICE_TOTAL'
        Footers = <>
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = 'amount_paid'
        Footers = <>
        Width = 67
      end
      item
        EditButtons = <>
        FieldName = 'amt_payable'
        Footers = <>
        Width = 71
      end
      item
        EditButtons = <>
        FieldName = 'PO_NUMBER'
        Footers = <>
        Width = 92
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_NUMBER'
        Footers = <>
        Width = 96
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_DESC'
        Footers = <>
        Width = 103
      end
      item
        EditButtons = <>
        FieldName = 'ORIG_CUSTOMER'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'ANALYSIS_CODE_2'
        Footers = <>
        Width = 87
      end
      item
        EditButtons = <>
        FieldName = 'LAYERS'
        Footers = <>
        Width = 31
      end
      item
        EditButtons = <>
        FieldName = 'PRODUCT_NAME'
        Footers = <>
        Width = 123
      end
      item
        EditButtons = <>
        FieldName = 'ANALYSIS_CODE_1'
        Footers = <>
        Width = 145
      end
      item
        EditButtons = <>
        FieldName = 'unit_sq'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'delivery_no'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'SALES_ORDER'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'DATE_SHIPPED'
        Footers = <>
        Width = 85
      end
      item
        EditButtons = <>
        FieldName = 'quan_shipped'
        Footers = <>
        Width = 57
      end
      item
        EditButtons = <>
        FieldName = 'QUANTITY'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'PARTS_ALLOC'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'TAX_2'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'RUSH_CHARGE'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #26410#24320#31080#37329#39069'('#21547#31246')'
        Width = 110
      end
      item
        EditButtons = <>
        FieldName = 'Amount'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #26410#24320#31080#37329#39069'('#19981#21547#31246')'
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'MISC_INV_DESCRIPTION'
        Footers = <>
        Width = 108
      end
      item
        EditButtons = <>
        FieldName = 'cost_2'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 61
      end
      item
        EditButtons = <>
        FieldName = 'invoicetype'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'rkey'
        Footers = <>
        Width = 57
      end
      item
        EditButtons = <>
        FieldName = 'abbrname15'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'abbrname23'
        Footers = <>
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 854
    Height = 37
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 298
      Top = 12
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #23458#25143#20195#30721
    end
    object BitBtn1: TBitBtn
      Left = 6
      Top = 5
      Width = 57
      Height = 30
      Cursor = crHandPoint
      Hint = #36864#20986
      Caption = #36864#20986
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
      Left = 65
      Top = 5
      Width = 57
      Height = 30
      Hint = #23548#20986#25968#25454'Excel'
      Caption = #23548#20986
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
    object Edit1: TEdit
      Left = 354
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
    object BitBtn6: TBitBtn
      Left = 178
      Top = 5
      Width = 57
      Height = 30
      Hint = #29992#25143#33258#23450#20041#26174#31034#23383#27573
      Caption = #23383#27573
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      PopupMenu = PopupMenu2
      ShowHint = True
      TabOrder = 4
      OnClick = BitBtn6Click
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
    object BtQry: TBitBtn
      Left = 122
      Top = 5
      Width = 57
      Height = 30
      Hint = #37325#26032#23450#20041#26597#35810#26465#20214
      Caption = #26597#35810
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BtQryClick
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
  object ADOConnection1: TADOConnection
    KeepConnection = False
    LoginPrompt = False
    Provider = 'C:\Program Files\Common Files\System\Ole DB\Data Links\bak.udl'
    Left = 112
    Top = 120
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      
        ' if object_ID('#39'tempdb..#temptable'#39') is not null  drop table #tem' +
        'ptable '
      
        'SELECT     dbo.Data0010.CUST_CODE, dbo.Data0010.ABBR_NAME, dbo.D' +
        'ata0010.CUSTOMER_NAME, dbo.Data0112.invoice_number, dbo.Data0001' +
        '.CURR_CODE, '
      
        '                      dbo.Data0112.EXCHANGE_RATE, dbo.Data0112.P' +
        'OSTED_DATE, dbo.Data0112.INVOICE_DATE, dbo.Data0112.INVOICE_TOTA' +
        'L, '
      
        '                      dbo.Data0112.amount_paid + dbo.Data0112.CA' +
        'SH_DISC AS amount_paid, Data0025.ORIG_CUSTOMER,'
      
        '                      dbo.Data0112.INVOICE_TOTAL - dbo.Data0112.' +
        'amount_paid - dbo.Data0112.CASH_DISC AS amt_payable, dbo.Data009' +
        '7.PO_NUMBER, '
      
        '                      dbo.Data0025.MANU_PART_NUMBER, dbo.Data002' +
        '5.MANU_PART_DESC, dbo.Data0025.ANALYSIS_CODE_2, dbo.Data0025.LAY' +
        'ERS, dbo.Data0008.PRODUCT_NAME,'
      
        '                       dbo.Data0025.ANALYSIS_CODE_1, dbo.Data002' +
        '5.unit_sq, dbo.data0439.delivery_no, dbo.Data0060.SALES_ORDER, d' +
        'bo.Data0064.DATE_SHIPPED, '
      
        '                      0.0 + dbo.Data0064.QUAN_SHIPPED AS quan_sh' +
        'ipped, dbo.DATA0163.QUANTITY, dbo.Data0060.PARTS_ALLOC, dbo.Data' +
        '0064.TAX_2, dbo.DATA0163.RUSH_CHARGE, '
      
        '                      Convert(varchar(255),dbo.Data0064.REMARK) ' +
        'AS MISC_INV_DESCRIPTION, dbo.DATA0163.QUANTITY*derivedtbl_1.cost' +
        '_2/Data0064.QUAN_SHIPPED as cost_2, '#39#26631#20934#21457#31080#39' AS invoicetype, dbo.D' +
        'ATA0163.SO_SHP_PTR AS rkey, '
      
        '                      dbo.Data0015.ABBR_NAME AS abbrname15, dbo.' +
        'Data0023.ABBR_NAME AS abbrname23 into #temptable '
      'FROM         dbo.Data0060 INNER JOIN'
      
        '                      dbo.Data0064 ON dbo.Data0060.RKEY = dbo.Da' +
        'ta0064.SO_PTR INNER JOIN'
      '                      dbo.Data0010 INNER JOIN'
      
        '                      dbo.Data0112 ON dbo.Data0112.CUSTOMER_PTR ' +
        '= dbo.Data0010.RKEY INNER JOIN'
      
        '                      dbo.Data0001 ON dbo.Data0112.CURRENCY_PTR ' +
        '= dbo.Data0001.RKEY INNER JOIN'
      
        '                      dbo.data0439 ON dbo.Data0112.RKEY = dbo.da' +
        'ta0439.invoice_ptr ON dbo.Data0064.packing_list_ptr = dbo.data04' +
        '39.rkey INNER JOIN'
      
        '                      dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDE' +
        'R_PTR = dbo.Data0097.RKEY INNER JOIN'
      
        '                      dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR' +
        ' = dbo.Data0025.RKEY INNER JOIN'
      
        '                      dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR' +
        ' = dbo.Data0008.RKEY INNER JOIN'
      
        '   (SELECT Data0052.SO_SHP_PTR, SUM(Data0052.QUAN_SHP * (data005' +
        '3.cost_pcs+data0053.matl_ovhd_pcs+'
      
        'data0053.OVHD_COST+data0053.PLANNED_QTY+data0053.ovhd1_pcs+data0' +
        '053.outsource_pcs)) AS cost_2'
      
        '                            FROM          dbo.Data0052 INNER JOI' +
        'N'
      
        '                                                   dbo.Data0053 ' +
        'ON dbo.Data0052.DATA0053_PTR = dbo.Data0053.RKEY'
      
        '                            GROUP BY Data0052.SO_SHP_PTR) AS der' +
        'ivedtbl_1 ON dbo.Data0064.RKEY = derivedtbl_1.SO_SHP_PTR INNER J' +
        'OIN'
      
        '                      dbo.DATA0163 ON dbo.Data0064.RKEY = dbo.DA' +
        'TA0163.SO_SHP_PTR INNER JOIN'
      
        '                      dbo.Data0015 ON dbo.Data0112.warehouse_ptr' +
        ' = dbo.Data0015.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0023 ON dbo.Data0060.supplier_ptr ' +
        '= dbo.Data0023.RKEY'
      'WHERE     (dbo.DATA0163.HEADER_PTR = 9)'
      ''
      'insert into #temptable'
      
        'SELECT     dbo.Data0010.CUST_CODE, dbo.Data0010.ABBR_NAME, dbo.D' +
        'ata0010.CUSTOMER_NAME, dbo.Data0112.invoice_number, dbo.Data0001' +
        '.CURR_CODE, '
      
        '                      dbo.Data0112.EXCHANGE_RATE, dbo.Data0112.P' +
        'OSTED_DATE, dbo.Data0112.INVOICE_DATE, dbo.Data0112.INVOICE_TOTA' +
        'L, '
      
        '                      dbo.Data0112.amount_paid + dbo.Data0112.CA' +
        'SH_DISC AS amount_paid, isnull(Data0025.ORIG_CUSTOMER,'#39#39') as ORI' +
        'G_CUSTOMER,'
      
        '                      dbo.Data0112.INVOICE_TOTAL - dbo.Data0112.' +
        'amount_paid - dbo.Data0112.CASH_DISC AS amt_payable, ISNULL(dbo.' +
        'Data0097.PO_NUMBER, '#39#39') AS PO_NUMBER, '
      
        '                      ISNULL(dbo.Data0025.MANU_PART_NUMBER, '#39#39') ' +
        'AS MANU_PART_NUMBER, ISNULL(dbo.Data0025.MANU_PART_DESC, '#39#39') AS ' +
        'MANU_PART_DESC, '
      
        '                      ISNULL(dbo.Data0025.ANALYSIS_CODE_2, '#39#39') A' +
        'S ANALYSIS_CODE_2, ISNULL(dbo.Data0025.LAYERS, 0) AS LAYERS, ISN' +
        'ULL(dbo.Data0008.PRODUCT_NAME, '#39#39') '
      
        '                      AS PRODUCT_NAME, ISNULL(dbo.Data0025.ANALY' +
        'SIS_CODE_1, '#39#39') AS ANALYSIS_CODE_1, ISNULL(dbo.Data0025.unit_sq,' +
        ' 0) AS unit_sq, '#39#39' AS delivery_no, '
      
        '                      ISNULL(dbo.Data0060.SALES_ORDER, '#39#39') AS SA' +
        'LES_ORDER, NULL AS DATE_SHIPPED, 0 AS quan_shipped, dbo.DATA0163' +
        '.QUANTITY, '
      
        '                      ISNULL(dbo.Data0060.PARTS_ALLOC, 0) AS PAR' +
        'TS_ALLOC, data0112.ship_tax AS tax_2, dbo.DATA0163.RUSH_CHARGE, '
      
        'CASE data0112.INVOICE_TYPE WHEN 2 then derivedtbl_1.names when 3' +
        ' then dbo.Data0112.MISC_INV_DESCRIPTION end as MISC_INV_DESCRIPT' +
        'ION,'
      
        ' 0 AS cost_2,CASE data0112.INVOICE_TYPE WHEN 2 THEN '#39#24037#20855#21457#31080#39' WHEN ' +
        '3 THEN '#39#26434#39033#21457#31080#39' END AS invoicetype,DATA0163.INVOICE_PTR as rkey,'
      
        'dbo.Data0015.ABBR_NAME AS abbrname15, isnull(dbo.Data0023.ABBR_N' +
        'AME,'#39#39') AS abbrname23'
      'FROM         dbo.DATA0163 INNER JOIN'
      '                      dbo.Data0010 INNER JOIN'
      
        '                      dbo.Data0112 ON dbo.Data0112.CUSTOMER_PTR ' +
        '= dbo.Data0010.RKEY INNER JOIN'
      
        '                      dbo.Data0001 ON dbo.Data0112.CURRENCY_PTR ' +
        '= dbo.Data0001.RKEY ON dbo.DATA0163.INVOICE_PTR = dbo.Data0112.R' +
        'KEY LEFT OUTER JOIN'
      '                      dbo.Data0025 INNER JOIN'
      
        '                      dbo.Data0060 ON dbo.Data0025.RKEY = dbo.Da' +
        'ta0060.CUST_PART_PTR INNER JOIN'
      
        '                      dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR' +
        ' = dbo.Data0008.RKEY INNER JOIN'
      
        '                      dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDE' +
        'R_PTR = dbo.Data0097.RKEY ON dbo.Data0112.sales_order_ptr = dbo.' +
        'Data0060.RKEY left OUTER JOIN'
      ' (SELECT INVOICE_PTR, [names]=STUFF'
      
        '                          ((SELECT '#39','#39' + CATEGORY+convert(varcha' +
        'r,AMOUNT)'
      
        '                              FROM  dbo.Data0061 inner join data' +
        '0065 on data0061.rkey=data0065.ADDL_CATEGORY_PTR'
      
        '                              WHERE INVOICE_PTR=tb.INVOICE_PTR F' +
        'OR XML PATH('#39#39')), 1, 1, '#39#39')'
      'FROM   dbo.Data0065 AS tb'
      
        'GROUP BY INVOICE_PTR) AS derivedtbl_1 on data0112.rkey=derivedtb' +
        'l_1.invoice_ptr  INNER JOIN'
      
        '                      dbo.Data0015 ON dbo.Data0112.warehouse_ptr' +
        ' = dbo.Data0015.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0023 ON dbo.Data0060.supplier_ptr ' +
        '= dbo.Data0023.RKEY'
      'WHERE     (dbo.DATA0163.HEADER_PTR = 9)'
      ''
      'insert into #temptable'
      
        'SELECT     dbo.Data0010.CUST_CODE, dbo.Data0010.ABBR_NAME, dbo.D' +
        'ata0010.CUSTOMER_NAME, dbo.Data0098.RMA_NUMBER AS invoice_number' +
        ', '
      
        '                      dbo.Data0001.CURR_CODE, dbo.Data0116.EX_RA' +
        'TE AS exchange_rate, dbo.Data0116.MEMO_DATE AS POSTED_DATE, dbo.' +
        'Data0116.RMA_DATE AS invoice_date, '
      
        '   - (1 * dbo.Data0116.AMOUNT) AS invoice_total, - (dbo.Data0116' +
        '.AMOUNT - dbo.Data0116.AVL_AMT) AS amount_paid,Data0025.ORIG_CUS' +
        'TOMER, - (1 * dbo.Data0116.AVL_AMT) AS amt_payable, '
      
        '                      dbo.Data0097.PO_NUMBER, dbo.Data0025.MANU_' +
        'PART_NUMBER, dbo.Data0025.MANU_PART_DESC, dbo.Data0025.ANALYSIS_' +
        'CODE_2, dbo.Data0025.LAYERS, '
      
        '                      dbo.Data0008.PRODUCT_NAME, dbo.Data0025.AN' +
        'ALYSIS_CODE_1, dbo.Data0025.unit_sq, dbo.Data0116.MEMO_NUMBER AS' +
        ' delivery_no, '
      
        '                      dbo.Data0060.SALES_ORDER, dbo.Data0098.Put' +
        'away_date AS date_shipped, - (1 * dbo.Data0098.QTY_RECD) AS quan' +
        '_shipped, dbo.DATA0163.QUANTITY, '
      
        '                      dbo.Data0060.PARTS_ALLOC, dbo.Data0098.tax' +
        '_2, dbo.DATA0163.RUSH_CHARGE, dbo.Data0116.DESCRIPTION, '
      
        '                    dbo.DATA0163.QUANTITY*derivedtbl_1.cost_pcs ' +
        'as cost_2, '
      
        '                      '#39#36864#36135#22791#24536#39' AS invoicetype,DATA0163.RMA_PTR as ' +
        'rkey,dbo.Data0015.ABBR_NAME AS abbrname15, isnull(dbo.Data0023.A' +
        'BBR_NAME,'#39#39') AS abbrname23'
      '               FROM         dbo.Data0001 INNER JOIN'
      '                      dbo.Data0116 INNER JOIN'
      
        '                      dbo.Data0010 ON dbo.Data0116.CUST_PTR = db' +
        'o.Data0010.RKEY ON'
      
        '                     dbo.Data0001.RKEY = dbo.Data0116.CURRENCY_P' +
        'TR INNER JOIN'
      '                      dbo.Data0008 INNER JOIN'
      
        '                      dbo.Data0097 INNER JOIN     dbo.Data0025 I' +
        'NNER JOIN'
      
        '                      dbo.Data0098 ON dbo.Data0025.RKEY = dbo.Da' +
        'ta0098.CUSTOMER_PART_PTR INNER JOIN'
      
        '                      dbo.Data0060 ON dbo.Data0098.SO_PTR = dbo.' +
        'Data0060.RKEY ON '
      
        '                   dbo.Data0097.RKEY = dbo.Data0060.PURCHASE_ORD' +
        'ER_PTR ON '
      
        '                      dbo.Data0008.RKEY = dbo.Data0025.PROD_CODE' +
        '_PTR ON dbo.Data0116.RKEY = dbo.Data0098.srce_ptr INNER JOIN'
      
        '                    ( SELECT     dbo.data0416.rma_ptr, avg(dbo.D' +
        'ata0053.cost_pcs) as cost_pcs'
      
        '                            FROM          dbo.Data0053 INNER JOI' +
        'N'
      
        '                                               dbo.data0416 ON d' +
        'bo.Data0053.NPAD_PTR = dbo.data0416.rkey'
      
        '                            WHERE   (dbo.data0416.type = 4)  gro' +
        'up by data0416.rma_ptr'
      
        '                    ) AS derivedtbl_1 ON dbo.Data0098.RKEY = der' +
        'ivedtbl_1.rma_ptr INNER JOIN'
      
        '                      dbo.DATA0163 ON dbo.Data0098.RKEY = dbo.DA' +
        'TA0163.RMA_PTR   LEFT OUTER JOIN'
      
        '                      dbo.Data0015 ON dbo.Data0116.warehouse_ptr' +
        ' = dbo.Data0015.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0023 ON dbo.Data0060.supplier_ptr ' +
        '= dbo.Data0023.RKEY'
      'WHERE     (dbo.DATA0163.HEADER_PTR = 9)'
      ''
      ''
      'insert into #temptable'
      
        'SELECT     '#39#39','#39#39','#39#39', dbo.Data0116.MEMO_NUMBER AS invoice_number,' +
        ' '
      
        '                      '#39#39', dbo.Data0116.EX_RATE AS exchange_rate,' +
        ' dbo.Data0116.MEMO_DATE AS POSTED_DATE, dbo.Data0116.RMA_DATE AS' +
        ' invoice_date, '
      
        '  - (1 * dbo.Data0116.AMOUNT) AS invoice_total, - (dbo.Data0116.' +
        'AMOUNT - dbo.Data0116.AVL_AMT) AS amount_paid,'#39#39' AS ORIG_CUSTOME' +
        'R ,- (1 * dbo.Data0116.AVL_AMT) AS amt_payable, '
      
        '                      '#39#39' AS PO_NUMBER, '#39#39' AS MANU_PART_NUMBER, '#39 +
        #39' AS MANU_PART_DESC, '#39#39' AS ANALYSIS_CODE_2, 0 AS LAYERS, '#39#39' AS P' +
        'RODUCT_NAME, '#39#39' AS ANALYSIS_CODE_1, '
      
        '                      0 AS unit_sq, dbo.Data0116.MEMO_NUMBER AS ' +
        'delivery_no, '#39#39' AS SALES_ORDER, NULL AS date_shipped, 0 AS quan_' +
        'shipped, dbo.DATA0163.QUANTITY, '
      
        '                      0 AS PARTS_ALLOC, CASE (isnull(Data0116.GO' +
        'ODS_AMT,0)+isnull(Data0116.TOOLING_CHARGE,0)+isnull(Data0116.SHI' +
        'PPING,0)) WHEN 0 THEN 0'
      
        '                                                         ELSE  r' +
        'ound(Data0116.FED_TAX/(isnull(Data0116.GOODS_AMT,0)+isnull(Data0' +
        '116.TOOLING_CHARGE,0)+isnull(Data0116.SHIPPING,0)),2)*100 END AS' +
        ' tax_2,'
      
        ' dbo.DATA0163.RUSH_CHARGE, dbo.Data0116.DESCRIPTION AS MISC_INV_' +
        'DESCRIPTION, 0 AS cost_2,'#39#26080#36864#36135#39' AS invoicetype,DATA0163.DEBIT_PTR' +
        ' as rkey,'
      'dbo.Data0015.ABBR_NAME AS abbrname15, '#39#39' AS abbrname23'
      'FROM         dbo.Data0116 INNER JOIN'
      
        '                      dbo.DATA0163 ON dbo.Data0116.RKEY = dbo.DA' +
        'TA0163.DEBIT_PTR inner join data0015'
      '    on  dbo.Data0116.warehouse_ptr = dbo.Data0015.RKEY'
      'WHERE     (dbo.DATA0163.HEADER_PTR = 9)'
      ''
      'update #temptable'
      'set CUST_CODE=t10.CUST_CODE, ABBR_NAME=t10.ABBR_NAME, '
      '      CUSTOMER_NAME=t10.CUSTOMER_NAME,CURR_CODE=t1.CURR_CODE'
      'from #temptable t,Data0116 t116,Data0001 t1,Data0010 t10'
      'where t.invoice_number = t116.MEMO_NUMBER'
      'and t116.CURRENCY_PTR = t1.RKEY'
      'and t116.CUST_PTR = t10.RKEY'
      ''
      'select * from #temptable'
      'where (1=1)')
    Left = 144
    Top = 120
    object ADOQuery1CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADOQuery1ABBR_NAME: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOQuery1CUSTOMER_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      DisplayWidth = 50
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object ADOQuery1invoice_number: TStringField
      DisplayLabel = #21457#31080#21495
      FieldName = 'invoice_number'
      Size = 12
    end
    object ADOQuery1CURR_CODE: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADOQuery1EXCHANGE_RATE: TFloatField
      DisplayLabel = #27719#29575
      FieldName = 'EXCHANGE_RATE'
    end
    object ADOQuery1POSTED_DATE: TDateTimeField
      DisplayLabel = #21457#31080#26085#26399
      FieldName = 'POSTED_DATE'
    end
    object ADOQuery1INVOICE_DATE: TDateTimeField
      DisplayLabel = #24080#40836#26085#26399
      FieldName = 'INVOICE_DATE'
    end
    object ADOQuery1INVOICE_TOTAL: TBCDField
      DisplayLabel = #21457#31080#37329#39069
      FieldName = 'INVOICE_TOTAL'
      Precision = 19
    end
    object ADOQuery1amount_paid: TBCDField
      DisplayLabel = #24050#32467#37329#39069
      FieldName = 'amount_paid'
      Precision = 19
    end
    object ADOQuery1amt_payable: TBCDField
      DisplayLabel = #26410#32467#37329#39069
      FieldName = 'amt_payable'
      Precision = 19
    end
    object ADOQuery1PO_NUMBER: TStringField
      DisplayLabel = #23458#25143#35746#21333#21495
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ADOQuery1MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOQuery1MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ADOQuery1ANALYSIS_CODE_2: TStringField
      DisplayLabel = #23458#25143#29289#26009#21495
      FieldName = 'ANALYSIS_CODE_2'
      Size = 80
    end
    object ADOQuery1LAYERS: TWordField
      DisplayLabel = #23618#25968
      FieldName = 'LAYERS'
    end
    object ADOQuery1PRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#31867#22411
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADOQuery1ANALYSIS_CODE_1: TStringField
      DisplayLabel = #20132#36135#23610#23544
      FieldName = 'ANALYSIS_CODE_1'
      Size = 30
    end
    object ADOQuery1unit_sq: TFloatField
      DisplayLabel = #21333#21482#38754#31215
      FieldName = 'unit_sq'
    end
    object ADOQuery1delivery_no: TStringField
      DisplayLabel = #35013#31665#21333#21495
      FieldName = 'delivery_no'
      Size = 10
    end
    object ADOQuery1SALES_ORDER: TStringField
      DisplayLabel = #38144#21806#35746#21333
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ADOQuery1DATE_SHIPPED: TDateTimeField
      DisplayLabel = #35013#36816#26085#26399
      FieldName = 'DATE_SHIPPED'
    end
    object ADOQuery1quan_shipped: TBCDField
      DisplayLabel = #20986#36135#25968#37327
      FieldName = 'quan_shipped'
      Precision = 12
      Size = 1
    end
    object ADOQuery1QUANTITY: TIntegerField
      DisplayLabel = #26410#24320#31080#25968#37327
      FieldName = 'QUANTITY'
    end
    object ADOQuery1PARTS_ALLOC: TFloatField
      DisplayLabel = #19981#21547#31246#20215#26684
      FieldName = 'PARTS_ALLOC'
    end
    object ADOQuery1TAX_2: TBCDField
      DisplayLabel = #31246#29575
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object ADOQuery1RUSH_CHARGE: TBCDField
      DisplayLabel = #26410#24320#31080#37329#39069
      FieldName = 'RUSH_CHARGE'
      Precision = 19
    end
    object ADOQuery1Amount: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Amount'
      Calculated = True
    end
    object ADOQuery1MISC_INV_DESCRIPTION: TStringField
      DisplayLabel = #22791#27880
      DisplayWidth = 50
      FieldName = 'MISC_INV_DESCRIPTION'
      Size = 255
    end
    object ADOQuery1cost_2: TFloatField
      DisplayLabel = #25104#26412
      FieldName = 'cost_2'
    end
    object ADOQuery1invoicetype: TStringField
      DisplayLabel = #31867#22411
      FieldName = 'invoicetype'
      Size = 8
    end
    object ADOQuery1rkey: TIntegerField
      DisplayLabel = #35760#24405#21495
      FieldName = 'rkey'
    end
    object ADOQuery1abbrname15: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'abbrname15'
      Size = 10
    end
    object ADOQuery1abbrname23: TStringField
      DisplayLabel = #22806#21327#20379#24212#21830
      FieldName = 'abbrname23'
      Size = 16
    end
    object ADOQuery1ORIG_CUSTOMER: TStringField
      DisplayLabel = #20851#32852#21407#23458#25143
      FieldName = 'ORIG_CUSTOMER'
      Size = 10
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 176
    Top = 120
  end
  object PopupMenu2: TPopupMenu
    AutoHotkeys = maManual
    Left = 264
    Top = 8
  end
end
