object Detailed1_frm: TDetailed1_frm
  Left = 492
  Top = 202
  Width = 885
  Height = 570
  Caption = #20998#37197#26126#32454
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 869
    Height = 471
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = GB2312_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -12
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGridEh1KeyDown
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'CUT_NO'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'PROD_CODE'
        Footers = <>
        Width = 102
      end
      item
        EditButtons = <>
        FieldName = 'PRODUCT_NAME'
        Footers = <>
        Width = 138
      end
      item
        EditButtons = <>
        FieldName = 'PRODUCT_DESC'
        Footers = <>
        Width = 188
      end
      item
        EditButtons = <>
        FieldName = 'part_name'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'INV_PART_NUMBER'
        Footers = <>
        Width = 107
      end
      item
        EditButtons = <>
        FieldName = 'INV_NAME'
        Footers = <>
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'INV_DESCRIPTION'
        Footers = <>
        Width = 166
      end
      item
        EditButtons = <>
        FieldName = 'UNIT_CODE'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'alloc_datetime'
        Footers = <>
        Width = 105
      end
      item
        EditButtons = <>
        FieldName = 'quan_alloc'
        Footers = <>
        Width = 74
      end
      item
        EditButtons = <>
        FieldName = 'EMPLOYEE_NAME'
        Footers = <>
      end>
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 869
    Height = 41
    ButtonHeight = 30
    Caption = 'ToolBar1'
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 0
      Top = 2
      Width = 70
      Height = 30
      Cursor = crHandPoint
      Hint = #36864#20986
      Caption = #36864#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
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
    object BitBtn3: TBitBtn
      Left = 70
      Top = 2
      Width = 70
      Height = 30
      Hint = #21047#26032#25968#25454
      Caption = #21047#26032
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BitBtn3Click
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
    object BitBtn4: TBitBtn
      Left = 140
      Top = 2
      Width = 70
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
    object BtQry: TBitBtn
      Left = 210
      Top = 2
      Width = 70
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
      Visible = False
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
    object Panel1: TPanel
      Left = 280
      Top = 2
      Width = 305
      Height = 30
      BevelOuter = bvNone
      TabOrder = 4
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 512
    Width = 869
    Height = 19
    Panels = <
      item
        Width = 240
      end
      item
        Width = 220
      end
      item
        Width = 240
      end
      item
        Width = 50
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 240
    Top = 152
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    AfterOpen = ADOQuery1AfterOpen
    OnFilterRecord = ADOQuery1FilterRecord
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     TOP (100) PERCENT dbo.data0492.CUT_NO, dbo.Data0008.P' +
        'ROD_CODE, dbo.Data0008.PRODUCT_NAME, dbo.Data0008.PRODUCT_DESC, ' +
        'dbo.Data0017.INV_PART_NUMBER, '
      
        '                      dbo.Data0017.INV_NAME, dbo.Data0017.INV_DE' +
        'SCRIPTION, dbo.Data0002.UNIT_CODE, dbo.DATA0475.alloc_datetime, ' +
        'dbo.DATA0475.quan_alloc, dbo.DATA0475.d492_ptr, dbo.DATA0475.rke' +
        'y22, '
      
        '                      dbo.Data0005.EMPLOYEE_NAME, dbo.WZCP0494.p' +
        'art_name'
      'FROM         dbo.WZCP0495 LEFT OUTER JOIN'
      
        '                      dbo.WZCP0494 ON dbo.WZCP0495.PARTBOM_PTR =' +
        ' dbo.WZCP0494.rkey RIGHT OUTER JOIN'
      '                      dbo.DATA0475 INNER JOIN'
      
        '                      dbo.Data0005 ON dbo.DATA0475.alloc_userptr' +
        ' = dbo.Data0005.RKEY INNER JOIN'
      
        '                      dbo.Data0022 ON dbo.DATA0475.rkey22 = dbo.' +
        'Data0022.RKEY INNER JOIN'
      
        '                      dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR' +
        ' = dbo.Data0017.RKEY INNER JOIN'
      
        '                      dbo.Data0002 ON dbo.Data0017.STOCK_UNIT_PT' +
        'R = dbo.Data0002.RKEY INNER JOIN'
      
        '                      dbo.wzcp0492 ON dbo.DATA0475.d492_ptr = db' +
        'o.wzcp0492.Rkey INNER JOIN'
      
        '                      dbo.data0492 ON dbo.data0492.rkey = dbo.wz' +
        'cp0492.D492_ptr INNER JOIN'
      
        '                      dbo.Data0008 ON dbo.data0492.BOM_PTR = dbo' +
        '.Data0008.RKEY ON dbo.WZCP0495.rkey = dbo.wzcp0492.wzcp0495_ptr')
    Left = 160
    Top = 152
    object ADOQuery1CUT_NO: TStringField
      DisplayLabel = #29983#20135#21333#21495
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object ADOQuery1PROD_CODE: TStringField
      DisplayLabel = #24037#31243#32534#30721
      FieldName = 'PROD_CODE'
      Size = 25
    end
    object ADOQuery1PRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#21517#31216
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADOQuery1PRODUCT_DESC: TStringField
      DisplayLabel = #20135#21697#35268#26684
      FieldName = 'PRODUCT_DESC'
      Size = 200
    end
    object ADOQuery1part_name: TStringField
      DisplayLabel = 'BOM'#21517#31216
      FieldName = 'part_name'
    end
    object ADOQuery1INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADOQuery1INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ADOQuery1INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ADOQuery1UNIT_CODE: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_CODE'
      Size = 5
    end
    object ADOQuery1alloc_datetime: TDateTimeField
      DisplayLabel = #20998#37197#26102#38388
      FieldName = 'alloc_datetime'
    end
    object ADOQuery1quan_alloc: TBCDField
      DisplayLabel = #24050#20998#37197#25968#37327
      FieldName = 'quan_alloc'
      Precision = 12
    end
    object ADOQuery1EMPLOYEE_NAME: TStringField
      DisplayLabel = #20998#37197#20154
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOQuery1d492_ptr: TIntegerField
      FieldName = 'd492_ptr'
    end
    object ADOQuery1rkey22: TIntegerField
      FieldName = 'rkey22'
    end
  end
  object ADOQuery2: TADOQuery
    Parameters = <>
    SQL.Strings = (
      '/*'
      
        'select data0492.CUT_NO,Data0008.PROD_CODE,Data0008.PRODUCT_NAME,' +
        'Data0008.PRODUCT_DESC,'
      
        'Data0017.INV_PART_NUMBER,Data0017.INV_NAME,Data0017.INV_DESCRIPT' +
        'ION,data0002.UNIT_CODE,'
      
        'DATA0475.alloc_datetime,DATA0475.quan_alloc,DATA0475.d492_ptr,DA' +
        'TA0475.rkey22,data0005.EMPLOYEE_NAME '
      'from dbo.DATA0475'
      'join data0005 on DATA0475.alloc_userptr = data0005.rkey'
      'join data0022 on DATA0475.rkey22 = data0022.rkey'
      'join Data0017 on data0022.INVENTORY_PTR = Data0017.rkey'
      'join data0002 on Data0017.STOCK_UNIT_PTR = data0002.rkey'
      'join data0492 on DATA0475.d492_ptr = data0492.rkey'
      'join data0008 ON data0492.BOM_PTR = Data0008.RKEY  */')
    Left = 160
    Top = 248
  end
end
