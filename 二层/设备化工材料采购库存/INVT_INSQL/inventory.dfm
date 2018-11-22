object Form2: TForm2
  Left = 220
  Top = 124
  Width = 803
  Height = 591
  Caption = #26448#26009#25509#25910#28165#21333
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 795
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      795
      41)
    object Label1: TLabel
      Left = 561
      Top = 2
      Width = 78
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = #25509#25910#25968#37327#21512#35745
    end
    object Label2: TLabel
      Left = 659
      Top = 2
      Width = 117
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = #19981#21547#31246#26412#24065#37329#39069#21512#35745
    end
    object Label3: TLabel
      Left = 290
      Top = 21
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop]
      Caption = #26448#26009#32534#30721
    end
    object Button1: TButton
      Left = 3
      Top = 6
      Width = 67
      Height = 30
      Caption = #36864#20986
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 71
      Top = 6
      Width = 67
      Height = 30
      Caption = #23548#20986'Excel'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 139
      Top = 6
      Width = 67
      Height = 30
      Caption = #25171#21360#25253#34920
      TabOrder = 2
      OnClick = Button3Click
    end
    object Edit1: TEdit
      Left = 558
      Top = 19
      Width = 89
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 3
      Text = '0.00'
    end
    object Edit2: TEdit
      Left = 656
      Top = 19
      Width = 121
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 4
      Text = '0.0000'
    end
    object Edit3: TEdit
      Left = 352
      Top = 18
      Width = 152
      Height = 21
      Anchors = [akTop]
      TabOrder = 5
      OnChange = Edit3Change
    end
    object BitBtn5: TBitBtn
      Left = 207
      Top = 6
      Width = 61
      Height = 30
      Hint = #29992#25143#33258#23450#20041#26174#31034#23383#27573
      Caption = #23383#27573
      ParentShowHint = False
      PopupMenu = PopupMenu2
      ShowHint = True
      TabOrder = 6
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
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 795
    Height = 523
    Align = alClient
    DataSource = DataSource1
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'GRN_NUMBER'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DELIVER_NUMBER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_REV_NO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_PART_NUMBER'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_NAME'
        Width = 152
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_DESCRIPTION'
        Width = 155
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inv_group_name'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GROUP_NAME'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'code23'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTITY'
        ReadOnly = False
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21547#31246#20215
        ReadOnly = False
        Title.Caption = #20215#26684'('#21547#31246')'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAX_2'
        ReadOnly = False
        Visible = True
      end
      item
        Expanded = False
        FieldName = #19981#21547#31246#20215
        ReadOnly = False
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_CODE'
        Title.Caption = #36135#24065
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21407#24065#21547#31246#37329#39069
        ReadOnly = False
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26412#24065#21547#31246#37329#39069
        ReadOnly = False
        Visible = False
      end
      item
        Expanded = False
        FieldName = #26412#24065#19981#21547#31246#37329#39069
        ReadOnly = False
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ship_DATE'
        ReadOnly = False
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_ON_HAND'
        ReadOnly = False
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WAREHOUSE_CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCATION'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BARCODE_ID'
        Visible = True
      end>
  end
  object ado0022: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'SELECT Data0456.GRN_NUMBER, Data0022.BARCODE_ID,'
      '      Data0017.INV_PART_NUMBER, Data0017.INV_NAME,'
      '      Data0017.INV_DESCRIPTION, Data0496.GROUP_NAME,'
      '      Data0015.WAREHOUSE_CODE, Data0070.PO_NUMBER,'
      '      Data0023.ABBR_NAME AS code23, Data0022.QUANTITY,'
      '      Data0022.QUAN_ON_HAND, Data0022.QUAN_IN_INSP,'
      '      Data0001.CURR_CODE, Data0022.PRICE as '#21547#31246#20215','
      '      round(Data0022.PRICE/(1+Data0022.TAX_2*0.01),3) as '#19981#21547#31246#20215','
      '      ROUND(Data0022.QUANTITY * Data0022.PRICE,2) AS '#21407#24065#21547#31246#37329#39069','
      
        '      ROUND(Data0022.QUANTITY * Data0022.PRICE * Data0022.EXCHAN' +
        'GE_RATE,'
      '       2) AS '#26412#24065#21547#31246#37329#39069',Data0070.PO_REV_NO,'
      
        '      ROUND(Data0022.QUANTITY * Data0022.PRICE * Data0022.EXCHAN' +
        'GE_RATE/'
      '      (1+Data0022.TAX_2*0.01), 2) AS '#26412#24065#19981#21547#31246#37329#39069','
      '       data0019.inv_group_name, Data0002.UNIT_NAME,'
      '      Data0005.EMPLOYEE_NAME, Data0016.LOCATION, Data0022.TAX_2,'
      '      Data0456.ship_DATE, Data0456.DELIVER_NUMBER'
      'FROM Data0023 INNER JOIN'
      '      dbo.Data0005 INNER JOIN'
      '      dbo.Data0001 INNER JOIN'
      '      dbo.Data0022 INNER JOIN'
      
        '      dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY I' +
        'NNER JOIN'
      
        '      dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR = dbo.Data0017.' +
        'RKEY INNER JOIN'
      
        '      dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY' +
        ' ON'
      '      dbo.Data0001.RKEY = dbo.Data0022.CURRENCY_PTR INNER JOIN'
      
        '      dbo.data0019 ON dbo.Data0496.GROUP_PTR = dbo.data0019.rkey' +
        ' ON'
      '      dbo.Data0005.RKEY = dbo.Data0456.CREATE_BY ON'
      '      dbo.Data0023.RKEY = dbo.Data0456.SUPP_PTR INNER JOIN'
      '      dbo.Data0002 ON'
      
        '      dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0002.RKEY INNER J' +
        'OIN'
      
        '      dbo.Data0015 ON dbo.Data0456.warehouse_ptr = dbo.Data0015.' +
        'RKEY INNER JOIN'
      '      dbo.Data0016 ON'
      
        '      dbo.Data0022.LOCATION_PTR = dbo.Data0016.RKEY LEFT OUTER J' +
        'OIN'
      '      dbo.Data0070 ON dbo.Data0456.PO_PTR = dbo.Data0070.RKEY'
      'WHERE (dbo.Data0022.QUANTITY > 0)')
    Left = 168
    Top = 448
    object ado0022PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#35746#21333#21495
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object ado0022INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      DisplayWidth = 35
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ado0022INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      DisplayWidth = 15
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ado0022INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      DisplayWidth = 20
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ado0022GROUP_NAME: TStringField
      DisplayLabel = #26448#26009#31867#21035
      DisplayWidth = 15
      FieldName = 'GROUP_NAME'
      Size = 10
    end
    object ado0022GRN_NUMBER: TStringField
      DisplayLabel = #25910#26009#21333
      DisplayWidth = 18
      FieldName = 'GRN_NUMBER'
      FixedChar = True
      Size = 10
    end
    object ado0022code23: TStringField
      DisplayLabel = #20379#24212#21830
      DisplayWidth = 11
      FieldName = 'code23'
      Size = 10
    end
    object ado0022QUANTITY: TFloatField
      DisplayLabel = #25509#25910#25968#37327
      DisplayWidth = 18
      FieldName = 'QUANTITY'
    end
    object ado0022CURR_CODE: TStringField
      DisplayLabel = #25509#25910#36135#24065
      DisplayWidth = 9
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ado0022QUAN_ON_HAND: TFloatField
      DisplayLabel = #29616#26377#25968#37327
      DisplayWidth = 18
      FieldName = 'QUAN_ON_HAND'
    end
    object ado0022QUAN_IN_INSP: TFloatField
      DisplayLabel = #22312#26816#26597#25968#37327
      DisplayWidth = 18
      FieldName = 'QUAN_IN_INSP'
    end
    object ado0022WAREHOUSE_CODE: TStringField
      DisplayLabel = #20179#24211
      DisplayWidth = 9
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ado0022inv_group_name: TStringField
      DisplayLabel = #26448#26009#32452#21035
      FieldName = 'inv_group_name'
    end
    object ado0022UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      DisplayWidth = 10
      FieldName = 'UNIT_NAME'
    end
    object ado0022PO_REV_NO: TStringField
      DisplayLabel = #35831#36141#37096#38376
      FieldName = 'PO_REV_NO'
      Size = 10
    end
    object ado0022EMPLOYEE_NAME: TStringField
      DisplayLabel = #25910#36135#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ado0022LOCATION: TStringField
      DisplayLabel = #20301#32622
      FieldName = 'LOCATION'
      Size = 10
    end
    object ado0022TAX_2: TBCDField
      DisplayLabel = #31246#29575'%'
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object ado0022ship_DATE: TDateTimeField
      DisplayLabel = #25910#36135#26085#26399
      FieldName = 'ship_DATE'
    end
    object ado0022DELIVER_NUMBER: TStringField
      DisplayLabel = #36865#36135#21333#21495
      FieldName = 'DELIVER_NUMBER'
      Size = 15
    end
    object ado0022BARCODE_ID: TStringField
      DisplayLabel = #22791#27880
      DisplayWidth = 10
      FieldName = 'BARCODE_ID'
      Size = 50
    end
    object ado0022DSDesigner: TBCDField
      FieldName = #21547#31246#20215
      Precision = 9
      Size = 3
    end
    object ado0022DSDesigner2: TBCDField
      FieldName = #19981#21547#31246#20215
      ReadOnly = True
      Precision = 22
      Size = 12
    end
    object ado0022DSDesigner3: TBCDField
      FieldName = #21407#24065#21547#31246#37329#39069
      ReadOnly = True
      Precision = 19
      Size = 6
    end
    object ado0022DSDesigner4: TBCDField
      FieldName = #26412#24065#21547#31246#37329#39069
      ReadOnly = True
      Precision = 32
      Size = 14
    end
    object ado0022DSDesigner5: TBCDField
      FieldName = #26412#24065#19981#21547#31246#37329#39069
      ReadOnly = True
      Precision = 32
      Size = 16
    end
  end
  object DataSource1: TDataSource
    DataSet = ado0022
    Left = 136
    Top = 448
  end
  object PopupMenu2: TPopupMenu
    AutoHotkeys = maManual
    Left = 272
    Top = 8
  end
end
