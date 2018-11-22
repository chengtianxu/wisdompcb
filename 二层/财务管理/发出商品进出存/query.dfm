object frmQuery: TfrmQuery
  Left = 277
  Top = 149
  Width = 979
  Height = 563
  Caption = #21457#20986#21830#21697#36827#20986#23384#26597#35810
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 963
    Height = 33
    Align = alTop
    TabOrder = 0
    object lblFilter: TLabel
      Left = 450
      Top = 11
      Width = 48
      Height = 12
      Alignment = taRightJustify
      Caption = #23458#25143#20195#30721
    end
    object btnExit: TBitBtn
      Left = 0
      Top = 2
      Width = 57
      Height = 30
      Hint = #36864#20986#31995#32479
      Caption = #36864#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnExitClick
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
    object btnRefresh: TBitBtn
      Left = 57
      Top = 2
      Width = 57
      Height = 30
      Hint = #21047#26032#24403#21069#25968#25454
      Caption = #21047#26032
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnRefreshClick
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
    object btnExport: TBitBtn
      Left = 114
      Top = 2
      Width = 57
      Height = 30
      Hint = #23548#20986#25968#25454#21040'Excel'
      Caption = #23548#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnExportClick
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
    object btnQuery: TBitBtn
      Left = 171
      Top = 2
      Width = 57
      Height = 30
      Hint = #37325#26032#23450#20041#26597#35810#26465#20214
      Caption = #26597#35810
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
    object edtFilter: TEdit
      Left = 502
      Top = 7
      Width = 109
      Height = 20
      TabOrder = 4
      OnChange = edtFilterChange
      OnExit = edtFilterExit
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 33
    Width = 963
    Height = 492
    Align = alClient
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 961
      Height = 471
      Align = alClient
      DataSource = dsQuery
      FooterColor = clWindow
      FooterFont.Charset = ANSI_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -12
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      FooterRowCount = 1
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking]
      ReadOnly = True
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      TitleLines = 2
      UseMultiTitle = True
      OnKeyDown = DBGridEh1KeyDown
      OnTitleBtnClick = DBGridEh1TitleBtnClick
      OnTitleClick = DBGridEh1TitleClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'CUST_CODE'
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'ABBR_NAME'
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'CUSTOMER_NAME'
          Footers = <>
          Title.TitleButton = True
          Width = 239
        end
        item
          EditButtons = <>
          FieldName = 'MANU_PART_NUMBER'
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'MANU_PART_DESC'
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'ANALYSIS_CODE_2'
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'LAYERS'
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'PRODUCT_NAME'
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'ANALYSIS_CODE_1'
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'unit_sq'
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'SALES_ORDER'
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'abbr_name23'
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'DATE_SHIPPED'
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'TAX_2'
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'type'
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'invoice_number'
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'rkey'
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'CURR_CODE'
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'BQnty'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'BAmount'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.TitleButton = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'BAmount1'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.TitleButton = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'InQnty'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'InAmount'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.TitleButton = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'InAmount1'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.TitleButton = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'OutQnty'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'OutAmount'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.TitleButton = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'OutAdjustAMT'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'OutAmount1'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.TitleButton = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'EQnty'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'EAmount'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.TitleButton = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'EAmount1'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.TitleButton = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'QntyBalance'
          Footers = <>
          Title.TitleButton = True
          Width = 35
        end
        item
          EditButtons = <>
          FieldName = 'AmountBalance'
          Footers = <>
          Title.TitleButton = True
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'AmountBalance1'
          Footers = <>
          Title.TitleButton = True
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'AllBalance'
          Footers = <>
          Title.TitleButton = True
          Width = 35
        end>
    end
    object sb1: TStatusBar
      Left = 1
      Top = 472
      Width = 961
      Height = 19
      Panels = <
        item
          Text = #34892#25968#65306
          Width = 150
        end
        item
          Width = 50
        end>
    end
  end
  object aqQuery: TADOQuery
    Connection = frmMain.adoConn
    CursorType = ctStatic
    Filtered = True
    BeforeOpen = aqQueryBeforeOpen
    AfterOpen = aqQueryAfterOpen
    Parameters = <
      item
        Name = 'param1'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'param2'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'Exec SP_140;2  :param1,  :param2')
    Left = 688
    Top = 17
    object aqQueryCUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object aqQueryABBR_NAME: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object aqQueryCUSTOMER_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      DisplayWidth = 50
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object aqQueryMANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      DisplayWidth = 15
      FieldName = 'MANU_PART_NUMBER'
    end
    object aqQueryMANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      DisplayWidth = 30
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object aqQueryANALYSIS_CODE_2: TStringField
      DisplayLabel = #23458#25143#29289#26009#21495
      DisplayWidth = 30
      FieldName = 'ANALYSIS_CODE_2'
      Size = 80
    end
    object aqQueryLAYERS: TWordField
      DisplayLabel = #23618#25968
      DisplayWidth = 5
      FieldName = 'LAYERS'
    end
    object aqQueryPRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#31867#22411
      DisplayWidth = 20
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object aqQueryANALYSIS_CODE_1: TStringField
      DisplayLabel = #20132#36135#23610#23544
      DisplayWidth = 20
      FieldName = 'ANALYSIS_CODE_1'
      Size = 30
    end
    object aqQueryunit_sq: TFloatField
      DisplayLabel = #21333#21482#38754#31215
      FieldName = 'unit_sq'
    end
    object aqQuerySALES_ORDER: TStringField
      DisplayLabel = #38144#21806#35746#21333
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object aqQueryabbr_name23: TStringField
      DisplayLabel = #22806#21327#21378#21830
      FieldName = 'abbr_name23'
      Size = 16
    end
    object aqQueryDATE_SHIPPED: TDateTimeField
      DisplayLabel = #35013#36816#26085#26399
      FieldName = 'DATE_SHIPPED'
    end
    object aqQueryTAX_2: TBCDField
      DisplayLabel = #31246#29575
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object aqQuerytype: TStringField
      DisplayLabel = #31867#22411
      FieldName = 'type'
      ReadOnly = True
      Size = 18
    end
    object aqQueryinvoice_number: TStringField
      DisplayLabel = #21457#31080#21495
      FieldName = 'invoice_number'
      FixedChar = True
      Size = 12
    end
    object aqQueryrkey: TIntegerField
      DisplayLabel = #26631#35782#21015
      FieldName = 'rkey'
    end
    object aqQueryCURR_CODE: TStringField
      DisplayLabel = #24065#31181
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object aqQuerycost_Price: TFloatField
      FieldName = 'cost_Price'
      Visible = False
    end
    object aqQueryBQnty: TIntegerField
      DisplayLabel = #26399#21021'|'#25968#37327
      FieldName = 'BQnty'
    end
    object aqQueryBAmount: TBCDField
      DisplayLabel = #26399#21021'|'#21407#24065#21547#31246#37329#39069'('#38144#21806#20215')'
      FieldName = 'BAmount'
      Precision = 19
    end
    object aqQueryBAmount1: TFloatField
      DisplayLabel = #26399#21021'|'#37329#39069'('#25104#26412#20215')'
      FieldName = 'BAmount1'
    end
    object aqQueryInQnty: TIntegerField
      DisplayLabel = #26412#26399#36827'|'#25968#37327
      FieldName = 'InQnty'
    end
    object aqQueryInAmount: TBCDField
      DisplayLabel = #26412#26399#36827'|'#21407#24065#21547#31246#37329#39069'('#38144#21806#20215')'
      FieldName = 'InAmount'
      Precision = 19
    end
    object aqQueryInAmount1: TFloatField
      DisplayLabel = #26412#26399#36827'|'#37329#39069'('#25104#26412#20215')'
      FieldName = 'InAmount1'
    end
    object aqQueryOutQnty: TIntegerField
      DisplayLabel = #26412#26399#20986'|'#25968#37327
      FieldName = 'OutQnty'
    end
    object aqQueryOutAmount: TBCDField
      DisplayLabel = #26412#26399#20986'|'#21407#24065#21547#31246#37329#39069'('#38144#21806#20215')'
      FieldName = 'OutAmount'
      Precision = 19
    end
    object aqQueryOutAdjustAMT: TBCDField
      DisplayLabel = #26412#26399#20986'|'#35843#25972#37329#39069
      FieldName = 'OutAdjustAMT'
      Precision = 19
    end
    object aqQueryOutAmount1: TFloatField
      DisplayLabel = #26412#26399#20986'|'#37329#39069'('#25104#26412#20215')'
      FieldName = 'OutAmount1'
    end
    object aqQueryEQnty: TIntegerField
      DisplayLabel = #26399#26411'|'#25968#37327
      FieldName = 'EQnty'
    end
    object aqQueryEAmount: TBCDField
      DisplayLabel = #26399#26411'|'#21407#24065#21547#31246#37329#39069'('#38144#21806#20215')'
      FieldName = 'EAmount'
      Precision = 19
    end
    object aqQueryEAmount1: TFloatField
      DisplayLabel = #26399#26411'|'#37329#39069'('#25104#26412#20215')'
      FieldName = 'EAmount1'
    end
    object aqQueryQntyBalance: TStringField
      DisplayLabel = #24179#34913#20851#31995'|'#25968#37327
      FieldName = 'QntyBalance'
      ReadOnly = True
      Size = 4
    end
    object aqQueryAmountBalance: TStringField
      DisplayLabel = #24179#34913#20851#31995'|'#21407#24065#21547#31246#37329#39069'('#38144#21806#20215')'
      FieldName = 'AmountBalance'
      ReadOnly = True
      Size = 4
    end
    object aqQueryAmountBalance1: TStringField
      DisplayLabel = #24179#34913#20851#31995'|'#37329#39069'('#25104#26412#20215')'
      FieldName = 'AmountBalance1'
      ReadOnly = True
      Size = 4
    end
    object aqQueryAllBalance: TStringField
      DisplayLabel = #24179#34913#20851#31995'|'#25152#26377
      FieldName = 'AllBalance'
      ReadOnly = True
      Size = 4
    end
  end
  object dsQuery: TDataSource
    DataSet = aqQuery
    Left = 744
    Top = 16
  end
end
