object Form_ASSIGN: TForm_ASSIGN
  Left = 216
  Top = 166
  Width = 819
  Height = 513
  Caption = #35013#36816#25351#27966#25628#32034
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 811
    Height = 399
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'SALES_ORDER'
        Title.Color = clRed
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_NUMBER'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'delivery_no'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHIPMENT_NO'
        Width = 28
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_SHIPPED'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'recon_qty'
        Title.Caption = #24050#23545#36134#25968#37327
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'alloc_qty'
        Title.Caption = #26410#23545#24080#25968#37327
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'invoice_number'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'date_sailing'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PARTS_ALLOC'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAX_2'
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cust_decl'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RKEY'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_name'
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 440
    Width = 811
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      811
      39)
    object Button1: TButton
      Left = 304
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #30830#23450
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 399
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Cancel = True
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
    object CheckBox1: TCheckBox
      Left = 35
      Top = 12
      Width = 57
      Height = 17
      Caption = #20840#36873
      TabOrder = 2
      OnClick = CheckBox1Click
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 811
    Height = 41
    Align = alTop
    TabOrder = 2
    object Label3: TLabel
      Left = 281
      Top = 13
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #38144#21806#35746#21333
    end
    object Edit1: TEdit
      Left = 338
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
    object BitBtn4: TBitBtn
      Left = 17
      Top = 5
      Width = 57
      Height = 30
      Hint = #23548#20986#25968#25454'Excel'
      Caption = #23548#20986
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
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
      Left = 74
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
      TabOrder = 2
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
  object DataSource1: TDataSource
    DataSet = ads64
    OnDataChange = DataSource1DataChange
    Left = 56
    Top = 264
  end
  object ads64: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT     TOP (100) PERCENT dbo.Data0064.RKEY, dbo.Data0060.SAL' +
      'ES_ORDER,'#13#10' dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PAR' +
      'T_DESC, '#13#10' dbo.Data0097.PO_NUMBER, dbo.data0439.delivery_no, dbo' +
      '.data0439.date_sailing, '#13#10'Data0064.QUAN_SHIPPED,Data0060.PARTS_A' +
      'LLOC, data0064.cust_decl,Data0060.PART_PRICE,'#13#10'Data0064.TAX_2, d' +
      'bo.Data0112.invoice_number,data0064.SHIPMENT_NO,'#13#10' Data0064.reco' +
      'n_qty,Data0064.QUAN_SHIPPED- Data0064.recon_qty as alloc_qty,'#13#10'd' +
      'ata0015.abbr_name'#13#10'FROM         dbo.Data0064 INNER JOIN'#13#10'       ' +
      '               dbo.Data0060 ON dbo.Data0064.SO_PTR = dbo.Data006' +
      '0.RKEY INNER JOIN'#13#10'                      dbo.Data0025 ON dbo.Dat' +
      'a0060.CUST_PART_PTR = dbo.Data0025.RKEY INNER JOIN'#13#10'            ' +
      '          dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDER_PTR = dbo.' +
      'Data0097.RKEY INNER JOIN'#13#10'                      dbo.data0439 ON ' +
      'dbo.Data0064.packing_list_ptr = dbo.data0439.rkey INNER JOIN'#13#10'  ' +
      '                    dbo.Data0112 ON dbo.data0439.invoice_ptr = d' +
      'bo.Data0112.RKEY left outer join '#13#10'data0015 on data0112.warehous' +
      'e_ptr=data0015.rkey'#13#10'WHERE   Data0064.QUAN_SHIPPED- Data0064.rec' +
      'on_qty>0'#13#10
    IndexFieldNames = 'SALES_ORDER'
    Parameters = <>
    Prepared = True
    Left = 96
    Top = 264
    object ads64RKEY: TIntegerField
      DisplayLabel = #26631#35782#21015
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ads64SALES_ORDER: TStringField
      DisplayLabel = #38144#21806#35746#21333
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ads64MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ads64MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ads64PO_NUMBER: TStringField
      DisplayLabel = #23458#25143#35746#21333#21495
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ads64delivery_no: TStringField
      DisplayLabel = #35013#31665#21333#21495
      FieldName = 'delivery_no'
      Size = 10
    end
    object ads64date_sailing: TDateTimeField
      DisplayLabel = #20986#36135#26085#26399
      FieldName = 'date_sailing'
    end
    object ads64QUAN_SHIPPED: TIntegerField
      DisplayLabel = #25968#37327
      FieldName = 'QUAN_SHIPPED'
    end
    object ads64alloc_qty: TIntegerField
      DisplayLabel = #21487#24320#31080#25968#37327
      FieldName = 'alloc_qty'
      ReadOnly = True
    end
    object ads64PARTS_ALLOC: TFloatField
      DisplayLabel = #20215#26684
      FieldName = 'PARTS_ALLOC'
    end
    object ads64TAX_2: TBCDField
      DisplayLabel = #31246#29575
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object ads64SHIPMENT_NO: TSmallintField
      DisplayLabel = #25209#27425
      FieldName = 'SHIPMENT_NO'
    end
    object ads64cust_decl: TStringField
      DisplayLabel = #25253#20851#21333#21495
      FieldName = 'cust_decl'
      Size = 50
    end
    object ads64abbr_name: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'abbr_name'
      Size = 10
    end
    object ads64invoice_number: TStringField
      DisplayLabel = #21457#31080#21495
      FieldName = 'invoice_number'
      FixedChar = True
      Size = 12
    end
    object ads64recon_qty: TIntegerField
      FieldName = 'recon_qty'
    end
    object ads64PART_PRICE: TFloatField
      FieldName = 'PART_PRICE'
    end
  end
end
