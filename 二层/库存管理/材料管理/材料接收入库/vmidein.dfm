object Form6: TForm6
  Left = 282
  Top = 177
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'VMI'#20837#20179#26126#32454
  ClientHeight = 490
  ClientWidth = 1012
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 1
    Top = 0
    Width = 1010
    Height = 33
    TabOrder = 0
    object BitBtn9: TBitBtn
      Left = 62
      Top = 3
      Width = 59
      Height = 28
      Cursor = crHandPoint
      Hint = #20851#38381
      Caption = #20851#38381
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        0400000000007800000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF0FFFFFF
        FFFFFFFF00FFFFFFFFFFFFF030FFFFFFFFFFFF0330FFFFFFFFFF003330000000
        0FFFF03330FF0FFFFFFFF03300FF0FFFF4FFF03330FF0FFF44FFF03330FF0FF4
        4444F03330FF0F444444F03330FF0FF44444F0330FFF0FFF44FFF030FFFF0FFF
        F4FFF00FFFFF0FFFFFFFF00000000FFFFFFF}
    end
    object BtnSave: TBitBtn
      Left = 3
      Top = 3
      Width = 59
      Height = 28
      Cursor = crHandPoint
      Hint = #20445#23384
      Caption = #20445#23384
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BtnSaveClick
      OnEnter = BtnSaveEnter
      Glyph.Data = {
        C6050000424DC605000000000000360400002800000014000000140000000100
        08000000000090010000C40E0000C40E0000000100000000000000000000E8E0
        18008868080048484800D8D8E000C8C8C8001078F00070500000B0900800F8F8
        F800A8880800D0D8D800B8A81000A0800800C8D0D000E8E8E80068686800B0A0
        100098700800A8900800D0D0D000D8D8D80090700800B0981000C0A81000E0E0
        E0009878080090680800A0880800D8E0D800B8A01000B0901000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000100000000
        000000130000301A1600000000000000E400F712000035A6FC00770000001300
        0700A7FC7700080613000083A600FC7700000000000035A5FC0077FFFF000000
        6800010000000000000000000000000000000000000000000000000000000000
        31000000000000E2EC0000640000660000004716000078011300000047001600
        780001130000F8461600000000000000C000F7120000C8F3EB007770F5001200
        0000ECFD7F0002000000000000001300AF000000000001000A0000884000F877
        30001A1600000100000000998400E6775400F71200000101010001D8F8001200
        450090FB7700801FF80077FFFF00FFFF6000F8120000AD84E6007760F8001200
        D80084E677000000000000FFFF000000C800E2EC0000C8E2EC00001800000000
        00000000000044F8120000400000000000000000000028F81200000000000000
        00000000000000000000000C000000000200000000000101120000872B00F877
        0000ECFD7F00000000000002000000006C00001A0200381A1600007FFF00FFFF
        000000000000381A1600000500000000870031E6770084F8120000218600E677
        9800F81200006713000010FFFF000000680001000000C8E2EC00000000000000
        7000F8120000ACF8120000D8F8001200100030001000F8400000105F5400E677
        680001000000D0F8120000D8F80012000800000000000E0000000F0505BF05BF
        05BF05BF05BF05BF05BF05BF05C7BF0000000000000000000000000000000000
        00050500E1138CE0E0E0E0E0E0E0E0E0E006BD1B00BFBF00031305050505BF05
        050505050505181B00050500C60705050F050FC70F050FC70FBF011B00BFBF00
        011B05A7C7090383BF0503030305011300050500010705091003050503031003
        0305011B00BFBF00011BBF031005BF03101010101005181300050500010705C7
        0FC709C70FC70FC70F05011300BFBF00011B03171017101710171017101B1B18
        00050500011318131813181B181318131813181300BFBF0001181BC601C618C6
        01C601C60101181800050500E11713000003C210050505050510C61800BFBF00
        01181B000010C705C705BF0FC71718C600050500E113180000100F0505000005
        A717C61800BFBF0001C61B000010C70505000005C71718C600050500E1171300
        00100F05050000050F10C60100BFBF00BD0101000010090F0510100FC7170101
        00E90500000000000300000000000000000000000005C705BF05BF0509E9BF05
        BF05BF05BF05BF05BF09}
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 33
    Width = 1010
    Height = 146
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 52
      Height = 13
      Caption = #20837#20179#21333#21495
    end
    object Label12: TLabel
      Left = 248
      Top = 48
      Width = 26
      Height = 13
      Caption = #24037#21378
    end
    object LBwh: TLabel
      Left = 365
      Top = 48
      Width = 7
      Height = 13
    end
    object Label4: TLabel
      Left = 8
      Top = 118
      Width = 47
      Height = 13
      Caption = 'VMI'#26126#32454
    end
    object Label10: TLabel
      Left = 328
      Top = 122
      Width = 26
      Height = 13
      Caption = #22791#27880
    end
    object Label2: TLabel
      Left = 424
      Top = 12
      Width = 39
      Height = 13
      Caption = #20379#24212#21830
    end
    object lbsup: TLabel
      Left = 565
      Top = 13
      Width = 7
      Height = 13
    end
    object Label3: TLabel
      Left = 36
      Top = 48
      Width = 26
      Height = 13
      Caption = #36135#24065
    end
    object Label5: TLabel
      Left = 200
      Top = 12
      Width = 73
      Height = 13
      Caption = 'VMI'#20986#24211#21333#21495
    end
    object Label6: TLabel
      Left = 8
      Top = 84
      Width = 52
      Height = 13
      Caption = #36865#36135#26085#26399
    end
    object Label7: TLabel
      Left = 584
      Top = 122
      Width = 26
      Height = 13
      Caption = #27719#29575
    end
    object Label8: TLabel
      Left = 208
      Top = 84
      Width = 52
      Height = 13
      Caption = #36865#36135#20154#21592
    end
    object Label11: TLabel
      Left = 400
      Top = 84
      Width = 52
      Height = 13
      Caption = #37319#36141#21333#21495
    end
    object Label9: TLabel
      Left = 592
      Top = 84
      Width = 52
      Height = 13
      Caption = #36865#36135#21333#21495
    end
    object Lbcurr: TLabel
      Left = 155
      Top = 48
      Width = 7
      Height = 13
    end
    object MaskEdit1: TMaskEdit
      Left = 68
      Top = 8
      Width = 120
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 1
    end
    object Edit3: TEdit
      Left = 276
      Top = 44
      Width = 80
      Height = 21
      Color = clInfoBk
      Enabled = False
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 0
    end
    object Edit6: TEdit
      Left = 68
      Top = 116
      Width = 188
      Height = 21
      Color = clInfoBk
      Enabled = False
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      MaxLength = 25
      TabOrder = 2
    end
    object BitBtn6: TBitBtn
      Left = 256
      Top = 115
      Width = 32
      Height = 24
      TabOrder = 3
      TabStop = False
      OnClick = BitBtn6Click
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
    object Edit7: TEdit
      Left = 361
      Top = 118
      Width = 208
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      MaxLength = 40
      TabOrder = 4
    end
    object Edit1: TEdit
      Left = 476
      Top = 8
      Width = 80
      Height = 21
      Color = clInfoBk
      Enabled = False
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 5
    end
    object Edit2: TEdit
      Left = 68
      Top = 44
      Width = 80
      Height = 21
      Color = clInfoBk
      Enabled = False
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 6
    end
    object MaskEdit2: TMaskEdit
      Left = 276
      Top = 8
      Width = 120
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 7
    end
    object Edit4: TEdit
      Left = 68
      Top = 80
      Width = 120
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      MaxLength = 40
      TabOrder = 8
    end
    object CheckBox2: TCheckBox
      Left = 848
      Top = 68
      Width = 132
      Height = 17
      Caption = #20445#23384#21518#25171#21360#20837#20179#21333
      TabOrder = 9
    end
    object CheckBox3: TCheckBox
      Left = 848
      Top = 89
      Width = 145
      Height = 17
      Caption = #23384#20179#20301#32622#25353#24037#21378#36807#28388
      TabOrder = 10
      OnClick = CheckBox3Click
    end
    object Edit8: TEdit
      Left = 620
      Top = 118
      Width = 120
      Height = 21
      Color = clInfoBk
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      MaxLength = 40
      ReadOnly = True
      TabOrder = 11
    end
    object Edit9: TEdit
      Left = 268
      Top = 80
      Width = 120
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      MaxLength = 40
      TabOrder = 12
    end
    object Edit10: TEdit
      Left = 460
      Top = 80
      Width = 120
      Height = 21
      Color = clInfoBk
      Enabled = False
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      MaxLength = 40
      TabOrder = 13
    end
    object Edit5: TEdit
      Left = 644
      Top = 80
      Width = 120
      Height = 21
      Color = clInfoBk
      Enabled = False
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      MaxLength = 40
      TabOrder = 14
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 178
    Width = 1012
    Height = 312
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object SGrid1: TStringGrid
      Left = 0
      Top = 0
      Width = 1012
      Height = 312
      Align = alClient
      ColCount = 20
      Ctl3D = False
      DefaultRowHeight = 21
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
      ParentCtl3D = False
      TabOrder = 0
      OnDrawCell = SGrid1DrawCell
      OnKeyDown = SGrid1KeyDown
      OnKeyPress = SGrid1KeyPress
      OnKeyUp = SGrid1KeyUp
      OnSelectCell = SGrid1SelectCell
      ColWidths = (
        88
        93
        112
        58
        57
        85
        58
        53
        73
        85
        73
        86
        92
        99
        64
        113
        64
        64
        97
        87)
    end
    object ComboBox1: TComboBox
      Left = 688
      Top = 23
      Width = 84
      Height = 21
      Style = csDropDownList
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      ItemHeight = 13
      TabOrder = 1
      OnChange = ComboBox1Change
      OnKeyDown = ComboBox1KeyDown
    end
    object SGrid3: TStringGrid
      Left = 40
      Top = 143
      Width = 401
      Height = 145
      ColCount = 8
      FixedCols = 0
      RowCount = 2
      TabOrder = 2
      Visible = False
      ColWidths = (
        64
        60
        64
        64
        64
        64
        64
        64)
    end
    object ComboBox3: TComboBox
      Left = 688
      Top = 47
      Width = 84
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      ItemHeight = 13
      TabOrder = 3
      OnChange = ComboBox3Change
      OnDropDown = ComboBox3DropDown
      OnKeyDown = ComboBox3KeyDown
    end
  end
  object SGrid2: TStringGrid
    Left = 464
    Top = 312
    Width = 529
    Height = 145
    ColCount = 8
    FixedCols = 0
    RowCount = 2
    TabOrder = 2
    Visible = False
    ColWidths = (
      64
      60
      64
      64
      64
      64
      64
      64)
  end
  object ADO149: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey148'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select data0149.rkey,data0149.quantity,data0149.tax_price,data01' +
        '49.tax_2,'
      'data0149.d0134_ptr,data0134.quan_on_hand '
      
        'from data0149 inner join data0134 on data0149.d0134_ptr=data0134' +
        '.rkey'
      'where data0149.quantity>0  and data0149.gon_ptr=:rkey148 '
      'order by data0149.rkey')
    Left = 424
    Top = 242
    object ADO149rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO149quantity: TBCDField
      FieldName = 'quantity'
      Precision = 14
    end
    object ADO149tax_price: TBCDField
      FieldName = 'tax_price'
      Precision = 12
      Size = 3
    end
    object ADO149tax_2: TBCDField
      FieldName = 'tax_2'
      Precision = 4
      Size = 2
    end
    object ADO149quan_on_hand: TBCDField
      FieldName = 'quan_on_hand'
      Precision = 19
    end
    object ADO149d0134_ptr: TIntegerField
      FieldName = 'd0134_ptr'
    end
  end
  object AQ149: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey149'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select data0149.rkey,data0149.quantity,data0149.tax_price,data01' +
        '49.tax_2,'
      
        'data0134.quan_on_hand from data0149 inner join data0134 on data0' +
        '149.d0134_ptr=data0134.rkey'
      'where data0149.rkey=:rkey149')
    Left = 424
    Top = 282
    object AQ149rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object AQ149quantity: TBCDField
      FieldName = 'quantity'
      Precision = 14
    end
    object AQ149tax_price: TBCDField
      FieldName = 'tax_price'
      Precision = 12
      Size = 3
    end
    object AQ149tax_2: TBCDField
      FieldName = 'tax_2'
      Precision = 4
      Size = 2
    end
    object AQ149quan_on_hand: TBCDField
      FieldName = 'quan_on_hand'
      Precision = 19
    end
  end
  object ADOQuery1: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey23'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'rkey17'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select price_1,TAX_2,tax_flag from data0028 '
      'where supplier_ptr=:rkey23 and inventory_ptr=:rkey17')
    Left = 296
    Top = 242
    object ADOQuery1price_1: TFloatField
      FieldName = 'price_1'
    end
    object ADOQuery1TAX_2: TFloatField
      FieldName = 'TAX_2'
    end
    object ADOQuery1tax_flag: TStringField
      FieldName = 'tax_flag'
      FixedChar = True
      Size = 1
    end
  end
end
