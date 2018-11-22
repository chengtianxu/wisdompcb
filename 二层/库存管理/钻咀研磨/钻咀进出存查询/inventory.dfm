object Form2: TForm2
  Left = 213
  Top = 200
  Width = 803
  Height = 591
  Caption = #38075#21632#20837#20179#26126#32454
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
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
      Left = 441
      Top = 2
      Width = 92
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = '  '#25509#25910#25968#37327#21512#35745
    end
    object Label3: TLabel
      Left = 254
      Top = 21
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #20837#20179#21333#21495
    end
    object Button1: TButton
      Left = 1
      Top = 6
      Width = 61
      Height = 30
      Caption = #36864#20986
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 62
      Top = 6
      Width = 61
      Height = 30
      Caption = #23548#20986'Excel'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 123
      Top = 6
      Width = 61
      Height = 30
      Caption = #25171#21360#25253#34920
      TabOrder = 2
      Visible = False
      OnClick = Button3Click
    end
    object Edit1: TEdit
      Left = 448
      Top = 19
      Width = 89
      Height = 21
      TabStop = False
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 3
      Text = '0.00'
    end
    object Edit3: TEdit
      Left = 316
      Top = 18
      Width = 127
      Height = 21
      TabOrder = 4
      OnChange = Edit3Change
    end
    object BitBtn5: TBitBtn
      Left = 123
      Top = 6
      Width = 61
      Height = 30
      Hint = #29992#25143#33258#23450#20041#26174#31034#23383#27573
      Caption = #23383#27573
      ParentShowHint = False
      PopupMenu = PopupMenu2
      ShowHint = True
      TabOrder = 5
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
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CREATE_DATE'
        ReadOnly = False
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SYSTEM_DATE'
        ReadOnly = False
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPL_CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'handle_name'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_PART_NUMBER'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_PART_DESCRIPTION'
        Width = 210
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUPPLIER_NAME'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCATION_CODE'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCATION_NAME'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OH_degree'
        ReadOnly = False
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTITY'
        ReadOnly = False
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_ON_HAND'
        ReadOnly = False
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_ALLOC'
        ReadOnly = False
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REMARK219'
        Width = -1
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'REMARK220'
        Width = 172
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
      
        'SELECT     dbo.DATA0219.GRN_NUMBER, dbo.DATA0219.CREATE_DATE, db' +
        'o.DATA0219.SYSTEM_DATE, dbo.Data0005.EMPL_CODE, '
      
        '                      dbo.Data0005.EMPLOYEE_NAME, dbo.DATA0219.h' +
        'andle_name, dbo.DATA0219.REMARK AS REMARK219, dbo.Data0017.INV_P' +
        'ART_NUMBER, '
      
        '                      dbo.Data0017.INV_PART_DESCRIPTION, dbo.Dat' +
        'a0023.CODE, dbo.Data0023.SUPPLIER_NAME, dbo.Data0023.ABBR_NAME, '
      
        '                      dbo.DATA0160.LOCATION_CODE, dbo.DATA0160.L' +
        'OCATION_NAME, dbo.DATA0220.OH_degree, dbo.DATA0220.QUANTITY, '
      
        '                      dbo.DATA0220.QUAN_RETURNED, dbo.DATA0220.Q' +
        'UAN_SCRAPPED, dbo.DATA0220.QUAN_ON_HAND, dbo.DATA0220.QUAN_ALLOC' +
        ', '
      '                      dbo.DATA0220.REMARK AS REMARK220'
      'FROM         dbo.DATA0219 INNER JOIN'
      
        '                      dbo.DATA0220 ON dbo.DATA0219.RKEY = dbo.DA' +
        'TA0220.GRN_PTR INNER JOIN'
      
        '                      dbo.Data0017 ON dbo.DATA0220.INVENTORY_PTR' +
        ' = dbo.Data0017.RKEY INNER JOIN'
      
        '                      dbo.Data0023 ON dbo.DATA0220.SUPPLIER_PTR ' +
        '= dbo.Data0023.RKEY INNER JOIN'
      
        '                      dbo.DATA0160 ON dbo.DATA0220.LOCATION_PTR ' +
        '= dbo.DATA0160.RKEY INNER JOIN'
      
        '                      dbo.Data0005 ON dbo.DATA0219.CREATE_BY = d' +
        'bo.Data0005.RKEY'
      'WHERE     (dbo.DATA0219.TTYPE = 0)')
    Left = 168
    Top = 448
    object ado0022GRN_NUMBER: TStringField
      DisplayLabel = #20837#20179#21333#21495
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object ado0022CREATE_DATE: TDateTimeField
      DisplayLabel = #21019#24314#26085#26399
      FieldName = 'CREATE_DATE'
    end
    object ado0022SYSTEM_DATE: TDateTimeField
      DisplayLabel = #31995#32479#26085#26399
      FieldName = 'SYSTEM_DATE'
    end
    object ado0022EMPL_CODE: TStringField
      DisplayLabel = #21019#24314#20154#20195#30721
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object ado0022EMPLOYEE_NAME: TStringField
      DisplayLabel = #21019#24314#20154
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ado0022handle_name: TStringField
      DisplayLabel = #32463#21150#20154
      FieldName = 'handle_name'
      Size = 50
    end
    object ado0022REMARK219: TStringField
      DisplayLabel = #20837#20179#21333#22791#27880
      FieldName = 'REMARK219'
      Size = 100
    end
    object ado0022INV_PART_NUMBER: TStringField
      DisplayLabel = #38075#21632#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ado0022INV_PART_DESCRIPTION: TStringField
      DisplayLabel = #38075#21632#35268#26684
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object ado0022CODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object ado0022SUPPLIER_NAME: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object ado0022ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ado0022LOCATION_CODE: TStringField
      DisplayLabel = #20301#32622#20195#30721
      FieldName = 'LOCATION_CODE'
      Size = 10
    end
    object ado0022LOCATION_NAME: TStringField
      DisplayLabel = #20301#32622#35828#26126
      FieldName = 'LOCATION_NAME'
      Size = 50
    end
    object ado0022OH_degree: TWordField
      DisplayLabel = #32763#30952#27425#25968
      FieldName = 'OH_degree'
    end
    object ado0022QUANTITY: TIntegerField
      DisplayLabel = #20837#20179#25968#37327
      FieldName = 'QUANTITY'
    end
    object ado0022QUAN_ON_HAND: TIntegerField
      DisplayLabel = #24403#21069#24211#23384
      FieldName = 'QUAN_ON_HAND'
    end
    object ado0022QUAN_ALLOC: TIntegerField
      DisplayLabel = #24453#20986#20179#25968#37327
      FieldName = 'QUAN_ALLOC'
    end
    object ado0022REMARK220: TStringField
      DisplayLabel = #20837#20179#26126#32454#22791#27880
      FieldName = 'REMARK220'
      Size = 100
    end
  end
  object DataSource1: TDataSource
    DataSet = ado0022
    Left = 136
    Top = 448
  end
  object PopupMenu2: TPopupMenu
    AutoHotkeys = maManual
    Left = 208
    Top = 10
  end
end
