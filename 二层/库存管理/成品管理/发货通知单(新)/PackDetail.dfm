object Form_PackDetail: TForm_PackDetail
  Left = 131
  Top = 72
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #25253#20851#26126#32454#26597#35810
  ClientHeight = 585
  ClientWidth = 1028
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 548
    Top = 11
    Width = 79
    Height = 13
    Caption = #25253#20851#26085#26399' '#20174':'
  end
  object Label3: TLabel
    Left = 731
    Top = 11
    Width = 20
    Height = 13
    Caption = #21040':'
  end
  object Label1: TLabel
    Left = 276
    Top = 11
    Width = 65
    Height = 13
    Alignment = taRightJustify
    Caption = #21457#36135#21333#32534#21495
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 39
    Width = 1028
    Height = 546
    Align = alBottom
    DataSource = DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'rkey64'
        Title.Caption = #35760#24405#21495
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'shipadvice_no'
        Title.Caption = #21457#36135#21333#32534#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = #25253#20851#21333#21495
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FAX_TO'
        Title.Caption = #36710#29260#21495#30721
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HAWB_NO'
        Title.Caption = #22791#27880
        Width = 146
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUST_CODE'
        Title.Caption = #23458#25143#20195#30721
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'name10'
        Title.Caption = #23458#25143#31616#31216
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUSTOMER_NAME'
        Title.Caption = #23458#25143#20840#31216
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORIG_CUSTOMER'
        Title.Caption = #20851#32852#21407#23458#25143
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALES_ORDER'
        Title.Caption = #38144#21806#23450#21333
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'date_sailing'
        Title.Caption = #36865#36135#26085#26399
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'delivery_no'
        Title.Caption = #35013#31665#21333#21495
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_NUMBER'
        Title.Caption = #26412#21378#32534#21495
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Title.Caption = #23458#25143#22411#21495
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        Title.Caption = #23458#25143#35746#21333#21495
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Title.Caption = #25351#27966#20154#21592
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_CODE'
        Title.Caption = #36135#24065
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cartons_no'
        Title.Caption = #31665#25968
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_SHIPPED'
        Title.Caption = #35013#36816#25968#37327
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quan_declare'
        Title.Caption = #25253#20851#25968#37327
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_name'
        Title.Caption = #24037#21378
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEPA_DATE'
        Title.Caption = #25253#20851#26085#26399
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'layers'
        Title.Caption = #23618#25968
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'product_name'
        Title.Caption = #20135#21697#31867#22411
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'part_price'
        Title.Caption = #20215#26684
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXCH_RATE'
        Title.Caption = #27719#29575
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total_rmb'
        Title.Caption = #38144#21806#37329#39069'(RMB)'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = #25253#20851#37329#39069
        Title.Caption = #38144#21806#37329#39069'('#21407#24065')'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total_amount'
        Title.Caption = #25253#20851#24037#20855#36153#29992
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = #24635#20540
        Title.Caption = #25253#20851#24635#37329#39069
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20986#36135#38754#31215
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = #37325#37327
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'names'
        Title.Caption = #35746#21333#24037#20855#36153#29992#22791#27880
        Width = 148
        Visible = True
      end>
  end
  object dtpk1: TDateTimePicker
    Left = 628
    Top = 6
    Width = 96
    Height = 21
    Date = 38847.000000000000000000
    Time = 38847.000000000000000000
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 1
    OnExit = dtpk1Exit
  end
  object dtpk2: TDateTimePicker
    Left = 755
    Top = 6
    Width = 96
    Height = 21
    Date = 38847.000000000000000000
    Time = 38847.000000000000000000
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 2
    OnExit = dtpk1Exit
  end
  object BitBtn4: TBitBtn
    Left = 59
    Top = 1
    Width = 57
    Height = 32
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
  object BitBtn1: TBitBtn
    Left = 1
    Top = 1
    Width = 57
    Height = 32
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
    TabOrder = 4
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
  object Edit1: TEdit
    Left = 349
    Top = 7
    Width = 121
    Height = 21
    ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
    TabOrder = 5
    OnChange = Edit1Change
  end
  object BitBtn2: TBitBtn
    Left = 471
    Top = 5
    Width = 24
    Height = 25
    Hint = #21047#26032
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    TabStop = False
    OnClick = BitBtn2Click
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
  object BitBtn5: TBitBtn
    Left = 117
    Top = 1
    Width = 57
    Height = 32
    Hint = #29992#25143#33258#23450#20041#26174#31034#23383#27573
    Caption = #23383#27573
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = BitBtn5Click
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
  object DataSource1: TDataSource
    DataSet = ADS64
    Left = 394
    Top = 155
  end
  object ADS64: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <
      item
        Name = 'dtpk1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'dtpk2'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      
        'SELECT          dbo.Data0064.RKEY AS rkey64, dbo.Data0064.SO_PTR' +
        ', dbo.Data0064.ENT_EMPL_PTR, dbo.Data0064.ENT_CSI_USER_PTR,'
      
        '                      dbo.Data0064.recon_qty, dbo.Data0064.carto' +
        'ns_no, dbo.Data0064.rkey529_ptr,dbo.Data0064.cust_decl, '
      
        '                      dbo.Data0064.GLPTR_STAUTS2, dbo.Data0064.G' +
        'L_HEADER_PTR2, dbo.Data0064.GLPTR_STATUS, '
      
        '                      dbo.Data0064.REPORT_UNIT_VALUE1, dbo.Data0' +
        '064.assign_type, dbo.Data0064.REMARK, dbo.Data0064.reg_tax_fixed' +
        '_unused, '
      
        '                      dbo.Data0064.ovsh_discount, dbo.Data0064.o' +
        'vsh_qty, dbo.Data0064.TAX_2, dbo.Data0064.discount, dbo.Data0064' +
        '.tool_tax_flag, '
      
        '                      dbo.Data0064.packing_list_ptr, dbo.Data006' +
        '4.DATE_ASSIGN, dbo.Data0064.DATE_SHIPPED, dbo.Data0064.PACKING_S' +
        'LIP_FLAG, '
      
        '                      dbo.Data0064.SHIPMENT_NO, dbo.Data0064.QUA' +
        'N_CREDITED, dbo.Data0064.QUAN_SHIPPED, dbo.Data0064.RMA_PTR, '
      
        '                      dbo.Data0529.shipadvice_no, dbo.Data0529.S' +
        'HIP_ADDR_PTR, dbo.Data0529.empl_ptr, dbo.Data0529.ATTN, dbo.Data' +
        '0529.ATTN1, '
      
        '                      dbo.Data0529.ATTN_CC, dbo.Data0529.ADV_FRO' +
        'M, dbo.Data0529.ADV_FROM_CC, dbo.Data0529.SHIP_FROM, dbo.Data052' +
        '9.TO_PORT, '
      
        '                      dbo.Data0529.FAX_NO, dbo.Data0529.SHIP_TO_' +
        'PHONE, dbo.Data0529.FAX_TO, dbo.Data0529.TDATE, dbo.Data0529.MAW' +
        'B_NO, '
      
        '                      dbo.Data0529.HAWB_NO, dbo.Data0529.FLIGHT_' +
        'NO, dbo.Data0529.DEPA_DATE, dbo.Data0529.TSTATUS, dbo.Data0529.c' +
        'urr_ptr, '
      
        '                      dbo.Data0529.audit_ptr, dbo.Data0529.final' +
        '_ptr, dbo.Data0529.invoice_no, dbo.Data0529.ORIG_CUSTOMER, dbo.D' +
        'ata0530.rkey529_ptr AS Expr2, '
      
        '                      dbo.Data0530.rkey64_PTR, dbo.Data0530.cart' +
        'ons_no AS Expr3, dbo.Data0530.weight, dbo.Data0530.reference_num' +
        'ber, dbo.Data0530.remark1, '
      
        '                      dbo.Data0530.nweight, dbo.Data0530.cust_de' +
        'cl AS Expr4, dbo.Data0530.total_amount, dbo.Data0530.quan_declar' +
        'e, dbo.Data0530.remark4, '
      
        '                      dbo.Data0530.remark2, dbo.Data0530.remark3' +
        ', dbo.Data0064.prod_tax_flag, dbo.Data0064.rush_charge, dbo.Data' +
        '0064.part_price,'
      
        '                      dbo.Data0530.bg_number as '#39#25253#20851#21333#21495#39',Data0530.' +
        'cust_decl as '#39#25253#20851#37329#39069#39','
      '         Data0060.SALES_ORDER,Data0060.COMMISION_ON_TOOLING,'
      
        '         Data0060.SCH_DATE, Data0060.ITEM_NBR,Data0060.EXCH_RATE' +
        ','
      '         Data0010.COD_FLAG,Data0060.RKEY AS rkey60,'
      '         Data0060.PARTS_ORDERED, Data0060.PARTS_SHIPPED,'
      '         Data0060.PARTS_RETURNED,Data0060.SHIPPING_METHOD,'
      
        '         Data0060.CURRENCY_PTR,Data0060.PART_PRICE as part_price' +
        '_60,'
      '         Data0060.STATUS,data0060.fob,data0060.REFERENCE_NUMBER,'
      '         Data0060.CUST_SHIP_ADDR_PTR,Data0060.CUSTOMER_PTR,'
      
        '         Data0060.PURCHASE_ORDER_PTR,Data0060.CUST_PART_PTR,data' +
        '0015.rkey rkey15,data0015.WAREHOUSE_CODE,data0015.abbr_name, '
      
        '         Data0025.MANU_PART_NUMBER,Data0025.MANU_PART_DESC,Data0' +
        '025.ANALYSIS_CODE_2,Data0025.layers,Data0008.product_name,'
      
        '         Data0010.CUST_CODE,Data0010.CUSTOMER_NAME,data0010.DO_S' +
        'MOOTHING,'
      
        '         Data0010.INVOICE_NOTE_PAD_PTR,data0010.CUSTOMER_TYPE,Da' +
        'ta0010.ABBR_NAME as name10,'
      '         Data0439.delivery_no,Data0439.date_sailing,'
      
        '         round( isnull(data0530.quan_declare,0) * Data0060.PART_' +
        'PRICE,4) AS total_case,'
      
        '         round( isnull(data0530.quan_declare,0) * Data0060.PART_' +
        'PRICE/Data0060.EXCH_RATE,4) as total_rmb,'
      
        '         round((data0530.cust_decl+isnull(data0530.total_amount,' +
        '0)),4) as '#39#24635#20540#39','
      
        '         Data0012.SHIP_TO_ADDRESS_1,Data0012.SHIP_TO_CONTACT,Dat' +
        'a0012.ZIP,'
      
        '         Data0012.SHIP_TO_PHONE,Data0012.LOCATION,Data0012.STATE' +
        ',Data0012.rkey as rkey12,'
      
        '         Data0012.LOCNAME_FOR_FORM,Data0012.MISC_BARCODE_LABLE,D' +
        'ata0012.SHP_ADDR1_FOR_FORM,'
      
        '         Data0012.COFC_FORMAT_FILENAME,Data0012.S3_BARCODE_LABLE' +
        ',Data0012.S4_BARCODE_LABLE,Data0012.PACKGE_BARCODE_LABLE,'
      '         Data0097.OPEN_SOS,Data0097.PO_DATE,Data0097.PO_NUMBER,'
      
        '         Data0001.CURR_CODE,Data0001.CURR_NAME,round( isnull(dat' +
        'a0530.quan_declare,0)*Data0025.pcs_sq,4)  as '#39#20986#36135#38754#31215#39', '
      
        '          round(isnull(data0530.quan_declare,0)*Data0025.REPORT_' +
        'UNIT_VALUE1/1000,4 ) as '#39#37325#37327#39','
      '         Data0005.EMPLOYEE_NAME,derivedtbl_1.names'
      'FROM     Data0530 INNER JOIN'
      
        '         Data0529 ON Data0530.rkey529_ptr =Data0529.RKEY INNER J' +
        'OIN'
      
        '         Data0064 ON Data0530.rkey64_PTR =Data0064.RKEY INNER JO' +
        'IN'
      '         Data0060 ON Data0064.SO_PTR = Data0060.RKEY INNER JOIN'
      
        '         Data0439 on Data0064.packing_list_ptr=Data0439.rkey INN' +
        'ER JOIN'
      
        '         Data0025 ON Data0060.CUST_PART_PTR =Data0025.RKEY INNER' +
        ' JOIN'
      
        '         Data0008 ON Data0025.PROD_CODE_PTR=Data0008.rkey INNER ' +
        'JOIN'
      
        '         Data0010 ON Data0060.CUSTOMER_PTR =Data0010.RKEY INNER ' +
        'JOIN'
      
        '         Data0005 ON Data0064.ENT_EMPL_PTR =Data0005.RKEY INNER ' +
        'JOIN'
      
        '         Data0097 ON Data0060.PURCHASE_ORDER_PTR =Data0097.RKEY ' +
        'INNER JOIN'
      
        '         Data0001 ON Data0060.CURRENCY_PTR =Data0001.RKEY INNER ' +
        'JOIN'
      
        '         Data0012 ON Data0060.CUST_SHIP_ADDR_PTR =Data0012.RKEY ' +
        'INNER JOIN '
      
        '         Data0015 on Data0060.SHIP_REG_TAX_ID=Data0015.rkey  lef' +
        't outer join'
      '          (SELECT SO_PTR, [names]=STUFF'
      
        '                          ((SELECT '#39','#39' + CATEGORY+convert(varcha' +
        'r,AMOUNT)'
      
        '                              FROM  dbo.Data0061 inner join data' +
        '0062 on data0061.rkey=data0062.ADDL_CAT_PTR'
      
        '                              WHERE SO_PTR=tb.SO_PTR FOR XML PAT' +
        'H('#39#39')), 1, 1, '#39#39')'
      'FROM   dbo.Data0062 AS tb'
      
        'GROUP BY SO_PTR) AS derivedtbl_1 on data0060.rkey=derivedtbl_1.s' +
        'o_ptr'
      'where'
      
        '      (Data0064.PACKING_SLIP_FLAG = '#39'1'#39') and (ISNULL(data0064.rk' +
        'ey529_ptr,0)>0 )'
      
        '      and  (data0529.DEPA_DATE>=:dtpk1) and (data0529.DEPA_DATE<' +
        '=:dtpk2) and (data0529.final_ptr is not null)'
      
        '     ORDER BY Data0529.shipadvice_no,Data0060.SALES_ORDER,Data00' +
        '64.SHIPMENT_NO')
    Left = 520
    Top = 152
    object ADS64SO_PTR: TIntegerField
      FieldName = 'SO_PTR'
      ReadOnly = True
    end
    object ADS64ENT_EMPL_PTR: TIntegerField
      FieldName = 'ENT_EMPL_PTR'
      ReadOnly = True
    end
    object ADS64ENT_CSI_USER_PTR: TIntegerField
      FieldName = 'ENT_CSI_USER_PTR'
      ReadOnly = True
    end
    object ADS64packing_list_ptr: TIntegerField
      FieldName = 'packing_list_ptr'
      ReadOnly = True
    end
    object ADS64DATE_ASSIGN: TDateTimeField
      FieldName = 'DATE_ASSIGN'
      ReadOnly = True
    end
    object ADS64DATE_SHIPPED: TDateTimeField
      FieldName = 'DATE_SHIPPED'
      ReadOnly = True
    end
    object ADS64PACKING_SLIP_FLAG: TStringField
      FieldName = 'PACKING_SLIP_FLAG'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object ADS64SHIPMENT_NO: TSmallintField
      FieldName = 'SHIPMENT_NO'
      ReadOnly = True
    end
    object ADS64QUAN_SHIPPED: TIntegerField
      FieldName = 'QUAN_SHIPPED'
      ReadOnly = True
    end
    object ADS64QUAN_CREDITED: TIntegerField
      FieldName = 'QUAN_CREDITED'
      ReadOnly = True
    end
    object ADS64RMA_PTR: TIntegerField
      FieldName = 'RMA_PTR'
      ReadOnly = True
    end
    object ADS64part_price: TFloatField
      FieldName = 'part_price'
      ReadOnly = True
    end
    object ADS64rush_charge: TBCDField
      FieldName = 'rush_charge'
      ReadOnly = True
      Precision = 5
      Size = 2
    end
    object ADS64prod_tax_flag: TStringField
      FieldName = 'prod_tax_flag'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object ADS64tool_tax_flag: TStringField
      FieldName = 'tool_tax_flag'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object ADS64discount: TBCDField
      FieldName = 'discount'
      ReadOnly = True
      Precision = 5
      Size = 2
    end
    object ADS64TAX_2: TBCDField
      FieldName = 'TAX_2'
      ReadOnly = True
      Precision = 4
      Size = 2
    end
    object ADS64ovsh_qty: TIntegerField
      FieldName = 'ovsh_qty'
      ReadOnly = True
    end
    object ADS64ovsh_discount: TBCDField
      FieldName = 'ovsh_discount'
      ReadOnly = True
      Precision = 5
      Size = 2
    end
    object ADS64reg_tax_fixed_unused: TWordField
      FieldName = 'reg_tax_fixed_unused'
      ReadOnly = True
    end
    object ADS64REMARK: TStringField
      FieldName = 'REMARK'
      ReadOnly = True
      Size = 60
    end
    object ADS64assign_type: TWordField
      FieldName = 'assign_type'
      ReadOnly = True
    end
    object ADS64REPORT_UNIT_VALUE1: TBCDField
      FieldName = 'REPORT_UNIT_VALUE1'
      ReadOnly = True
      Precision = 9
    end
    object ADS64cust_decl: TStringField
      FieldName = 'cust_decl'
      ReadOnly = True
      Size = 50
    end
    object ADS64GLPTR_STATUS: TBooleanField
      FieldName = 'GLPTR_STATUS'
      ReadOnly = True
    end
    object ADS64GL_HEADER_PTR2: TIntegerField
      FieldName = 'GL_HEADER_PTR2'
      ReadOnly = True
    end
    object ADS64GLPTR_STAUTS2: TBooleanField
      FieldName = 'GLPTR_STAUTS2'
      ReadOnly = True
    end
    object ADS64rkey529_ptr: TIntegerField
      FieldName = 'rkey529_ptr'
      ReadOnly = True
    end
    object ADS64cartons_no: TIntegerField
      FieldName = 'cartons_no'
      ReadOnly = True
    end
    object ADS64shipadvice_no: TStringField
      FieldName = 'shipadvice_no'
      ReadOnly = True
      Size = 10
    end
    object ADS64SHIP_ADDR_PTR: TIntegerField
      FieldName = 'SHIP_ADDR_PTR'
      ReadOnly = True
    end
    object ADS64empl_ptr: TIntegerField
      FieldName = 'empl_ptr'
      ReadOnly = True
    end
    object ADS64ATTN: TStringField
      FieldName = 'ATTN'
      ReadOnly = True
      Size = 50
    end
    object ADS64ATTN1: TStringField
      FieldName = 'ATTN1'
      ReadOnly = True
      Size = 50
    end
    object ADS64ATTN_CC: TStringField
      FieldName = 'ATTN_CC'
      ReadOnly = True
      Size = 50
    end
    object ADS64ADV_FROM: TStringField
      FieldName = 'ADV_FROM'
      ReadOnly = True
      Size = 50
    end
    object ADS64ADV_FROM_CC: TStringField
      FieldName = 'ADV_FROM_CC'
      ReadOnly = True
      Size = 50
    end
    object ADS64SHIP_FROM: TStringField
      FieldName = 'SHIP_FROM'
      ReadOnly = True
      Size = 80
    end
    object ADS64TO_PORT: TStringField
      FieldName = 'TO_PORT'
      ReadOnly = True
      Size = 100
    end
    object ADS64FAX_NO: TStringField
      FieldName = 'FAX_NO'
      ReadOnly = True
    end
    object ADS64SHIP_TO_PHONE: TStringField
      FieldName = 'SHIP_TO_PHONE'
      ReadOnly = True
    end
    object ADS64FAX_TO: TStringField
      FieldName = 'FAX_TO'
      Size = 80
    end
    object ADS64TDATE: TDateTimeField
      FieldName = 'TDATE'
      ReadOnly = True
    end
    object ADS64MAWB_NO: TStringField
      FieldName = 'MAWB_NO'
      ReadOnly = True
    end
    object ADS64HAWB_NO: TStringField
      FieldName = 'HAWB_NO'
    end
    object ADS64FLIGHT_NO: TStringField
      FieldName = 'FLIGHT_NO'
      ReadOnly = True
    end
    object ADS64DEPA_DATE: TDateTimeField
      FieldName = 'DEPA_DATE'
      ReadOnly = True
    end
    object ADS64TSTATUS: TWordField
      FieldName = 'TSTATUS'
      ReadOnly = True
    end
    object ADS64rkey64_PTR: TIntegerField
      FieldName = 'rkey64_PTR'
      ReadOnly = True
    end
    object ADS64weight: TBCDField
      FieldName = 'weight'
      ReadOnly = True
      Precision = 10
      Size = 3
    end
    object ADS64reference_number: TStringField
      FieldName = 'reference_number'
      ReadOnly = True
      Size = 50
    end
    object ADS64remark1: TStringField
      FieldName = 'remark1'
      ReadOnly = True
      Size = 50
    end
    object ADS64remark2: TStringField
      FieldName = 'remark2'
      ReadOnly = True
      Size = 50
    end
    object ADS64remark3: TStringField
      FieldName = 'remark3'
      ReadOnly = True
      Size = 50
    end
    object ADS64remark4: TStringField
      FieldName = 'remark4'
      ReadOnly = True
      Size = 50
    end
    object ADS64quan_declare: TIntegerField
      FieldName = 'quan_declare'
      ReadOnly = True
    end
    object ADS64SALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      ReadOnly = True
      FixedChar = True
      Size = 12
    end
    object ADS64COMMISION_ON_TOOLING: TStringField
      FieldName = 'COMMISION_ON_TOOLING'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object ADS64SCH_DATE: TDateTimeField
      FieldName = 'SCH_DATE'
      ReadOnly = True
    end
    object ADS64ITEM_NBR: TStringField
      FieldName = 'ITEM_NBR'
      ReadOnly = True
      FixedChar = True
      Size = 5
    end
    object ADS64COD_FLAG: TStringField
      FieldName = 'COD_FLAG'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object ADS64rkey60: TIntegerField
      FieldName = 'rkey60'
      ReadOnly = True
    end
    object ADS64PARTS_ORDERED: TFloatField
      FieldName = 'PARTS_ORDERED'
      ReadOnly = True
    end
    object ADS64PARTS_SHIPPED: TFloatField
      FieldName = 'PARTS_SHIPPED'
      ReadOnly = True
    end
    object ADS64PARTS_RETURNED: TFloatField
      FieldName = 'PARTS_RETURNED'
      ReadOnly = True
    end
    object ADS64SHIPPING_METHOD: TStringField
      FieldName = 'SHIPPING_METHOD'
      ReadOnly = True
      FixedChar = True
    end
    object ADS64CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
      ReadOnly = True
    end
    object ADS64STATUS: TWordField
      FieldName = 'STATUS'
      ReadOnly = True
    end
    object ADS64fob: TStringField
      FieldName = 'fob'
      ReadOnly = True
      Size = 50
    end
    object ADS64REFERENCE_NUMBER_1: TStringField
      FieldName = 'REFERENCE_NUMBER_1'
      ReadOnly = True
      Size = 100
    end
    object ADS64CUST_SHIP_ADDR_PTR: TIntegerField
      FieldName = 'CUST_SHIP_ADDR_PTR'
      ReadOnly = True
    end
    object ADS64CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
      ReadOnly = True
    end
    object ADS64PURCHASE_ORDER_PTR: TIntegerField
      FieldName = 'PURCHASE_ORDER_PTR'
      ReadOnly = True
    end
    object ADS64CUST_PART_PTR: TIntegerField
      FieldName = 'CUST_PART_PTR'
      ReadOnly = True
    end
    object ADS64rkey15: TIntegerField
      FieldName = 'rkey15'
      ReadOnly = True
    end
    object ADS64WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      ReadOnly = True
      Size = 5
    end
    object ADS64abbr_name: TStringField
      FieldName = 'abbr_name'
      ReadOnly = True
      Size = 10
    end
    object ADS64MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
      ReadOnly = True
    end
    object ADS64MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      ReadOnly = True
      Size = 80
    end
    object ADS64ANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      ReadOnly = True
      Size = 80
    end
    object ADS64CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      ReadOnly = True
      Size = 10
    end
    object ADS64CUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      ReadOnly = True
      Size = 100
    end
    object ADS64DO_SMOOTHING: TWordField
      FieldName = 'DO_SMOOTHING'
      ReadOnly = True
    end
    object ADS64INVOICE_NOTE_PAD_PTR: TIntegerField
      FieldName = 'INVOICE_NOTE_PAD_PTR'
      ReadOnly = True
    end
    object ADS64CUSTOMER_TYPE: TIntegerField
      FieldName = 'CUSTOMER_TYPE'
      ReadOnly = True
    end
    object ADS64name10: TStringField
      FieldName = 'name10'
      ReadOnly = True
      Size = 10
    end
    object ADS64delivery_no: TStringField
      FieldName = 'delivery_no'
      ReadOnly = True
      Size = 10
    end
    object ADS64total_case: TFloatField
      FieldName = 'total_case'
      ReadOnly = True
    end
    object ADS64SHIP_TO_ADDRESS_1: TStringField
      FieldName = 'SHIP_TO_ADDRESS_1'
      ReadOnly = True
      Size = 100
    end
    object ADS64SHIP_TO_CONTACT: TStringField
      FieldName = 'SHIP_TO_CONTACT'
      ReadOnly = True
    end
    object ADS64ZIP: TStringField
      FieldName = 'ZIP'
      ReadOnly = True
      Size = 10
    end
    object ADS64SHIP_TO_PHONE_1: TStringField
      FieldName = 'SHIP_TO_PHONE_1'
      ReadOnly = True
    end
    object ADS64LOCATION: TStringField
      FieldName = 'LOCATION'
      ReadOnly = True
      Size = 80
    end
    object ADS64STATE: TStringField
      FieldName = 'STATE'
      ReadOnly = True
      Size = 10
    end
    object ADS64rkey12: TIntegerField
      FieldName = 'rkey12'
      ReadOnly = True
    end
    object ADS64LOCNAME_FOR_FORM: TStringField
      FieldName = 'LOCNAME_FOR_FORM'
      ReadOnly = True
      Size = 100
    end
    object ADS64MISC_BARCODE_LABLE: TStringField
      FieldName = 'MISC_BARCODE_LABLE'
      ReadOnly = True
      Size = 100
    end
    object ADS64SHP_ADDR1_FOR_FORM: TStringField
      FieldName = 'SHP_ADDR1_FOR_FORM'
      ReadOnly = True
      Size = 100
    end
    object ADS64COFC_FORMAT_FILENAME: TStringField
      FieldName = 'COFC_FORMAT_FILENAME'
      ReadOnly = True
      Size = 100
    end
    object ADS64S3_BARCODE_LABLE: TStringField
      FieldName = 'S3_BARCODE_LABLE'
      ReadOnly = True
      Size = 100
    end
    object ADS64S4_BARCODE_LABLE: TStringField
      FieldName = 'S4_BARCODE_LABLE'
      ReadOnly = True
      Size = 100
    end
    object ADS64PACKGE_BARCODE_LABLE: TStringField
      FieldName = 'PACKGE_BARCODE_LABLE'
      ReadOnly = True
      Size = 100
    end
    object ADS64OPEN_SOS: TSmallintField
      FieldName = 'OPEN_SOS'
      ReadOnly = True
    end
    object ADS64PO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
      ReadOnly = True
    end
    object ADS64PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      ReadOnly = True
      Size = 25
    end
    object ADS64CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      ReadOnly = True
      Size = 5
    end
    object ADS64CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
      ReadOnly = True
    end
    object ADS64EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      ReadOnly = True
      Size = 16
    end
    object ADS64total_amount: TBCDField
      FieldName = 'total_amount'
      ReadOnly = True
      Precision = 10
      Size = 3
    end
    object ADS64nweight: TBCDField
      FieldName = 'nweight'
      ReadOnly = True
      Precision = 10
      Size = 3
    end
    object ADS64DSDesigner: TStringField
      FieldName = #25253#20851#21333#21495
      OnChange = ADS64DSDesignerChange
      Size = 50
    end
    object ADS64date_sailing: TDateTimeField
      FieldName = 'date_sailing'
      ReadOnly = True
    end
    object ADS64DSDesigner2: TBCDField
      FieldName = #25253#20851#37329#39069
      ReadOnly = True
      Precision = 19
    end
    object ADS64ORIG_CUSTOMER: TStringField
      FieldName = 'ORIG_CUSTOMER'
      ReadOnly = True
      Size = 30
    end
    object ADS64layers: TWordField
      FieldName = 'layers'
      ReadOnly = True
    end
    object ADS64product_name: TStringField
      FieldName = 'product_name'
      ReadOnly = True
      Size = 30
    end
    object ADS64DSDesigner3: TFloatField
      FieldName = #20986#36135#38754#31215
      ReadOnly = True
    end
    object ADS64DSDesigner4: TBCDField
      FieldName = #37325#37327
      ReadOnly = True
      Precision = 25
      Size = 9
    end
    object ADS64names: TMemoField
      FieldName = 'names'
      ReadOnly = True
      OnGetText = ADS64namesGetText
      BlobType = ftMemo
    end
    object ADS64EXCH_RATE: TFloatField
      FieldName = 'EXCH_RATE'
    end
    object ADS64part_price_60: TFloatField
      FieldName = 'part_price_60'
    end
    object ADS64total_rmb: TFloatField
      FieldName = 'total_rmb'
      ReadOnly = True
    end
    object ADS64DSDesigner5: TBCDField
      FieldName = #24635#20540
      ReadOnly = True
      Precision = 20
    end
    object ADS64rkey64: TAutoIncField
      FieldName = 'rkey64'
      ReadOnly = True
    end
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    Left = 183
    Top = 4
  end
end
