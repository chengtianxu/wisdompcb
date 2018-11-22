object Form2: TForm2
  Left = 221
  Top = 122
  Width = 623
  Height = 582
  Caption = #37319#36141#35746#21333#25628#32034
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 324
    Width = 615
    Height = 5
    Cursor = crVSplit
    HelpType = htKeyword
    Align = alBottom
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 32
    Width = 615
    Height = 292
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        Title.Caption = #37319#36141#35746#21333#21495#30721
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_DATE'
        Title.Caption = #35746#21333#26085#26399
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_status'
        Title.Caption = #29366#24577
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_type'
        Title.Caption = #31867#22411
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODE'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUPPLIER_NAME'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 514
    Width = 615
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Button1: TButton
      Left = 223
      Top = 11
      Width = 75
      Height = 25
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 303
      Top = 11
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 615
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Label1: TLabel
      Left = 124
      Top = 9
      Width = 87
      Height = 13
      Alignment = taRightJustify
      Caption = '    '#37319#36141#35746#21333#21495#30721':'
    end
    object Edit1: TEdit
      Left = 214
      Top = 5
      Width = 157
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
      OnKeyDown = DBGrid1KeyDown
    end
    object BitBtn1: TBitBtn
      Left = 378
      Top = 3
      Width = 25
      Height = 25
      TabOrder = 1
      TabStop = False
      OnClick = BitBtn1Click
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
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 329
    Width = 615
    Height = 185
    Align = alBottom
    DataSource = DataSource2
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'INV_NAME'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_DESCRIPTION'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_ORD'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRICE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_RECD'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'extra_req'
        Width = 100
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = AQ70
    Left = 384
    Top = 292
  end
  object AQ70: TADOStoredProc
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = AQ70CalcFields
    ProcedureName = 'ep042;2'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@type'
        Attributes = [paNullable]
        DataType = ftString
        Size = 1
        Value = 'S'
      end>
    Left = 416
    Top = 292
    object AQ70RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AQ70PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object AQ70CONFIRMATION_NUMBER: TStringField
      FieldName = 'CONFIRMATION_NUMBER'
    end
    object AQ70PO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object AQ70po_type: TStringField
      FieldName = 'po_type'
      FixedChar = True
      Size = 1
    end
    object AQ70status: TWordField
      FieldName = 'status'
    end
    object AQ70CODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'CODE'
      Size = 5
    end
    object AQ70SUPPLIER_NAME: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldName = 'SUPPLIER_NAME'
      Size = 30
    end
    object AQ70WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object AQ70WAREHOUSE_NAME: TStringField
      FieldName = 'WAREHOUSE_NAME'
      Size = 30
    end
    object AQ70FACTORY_LOCATION: TStringField
      FieldName = 'FACTORY_LOCATION'
    end
    object AQ70v_status: TStringField
      FieldKind = fkCalculated
      FieldName = 'v_status'
      Size = 6
      Calculated = True
    end
    object AQ70v_type: TStringField
      FieldKind = fkCalculated
      FieldName = 'v_type'
      Size = 10
      Calculated = True
    end
  end
  object ADO0071: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION,'
      
        '      dbo.Data0071.QUAN_ORD, dbo.Data0071.PRICE, dbo.Data0071.QU' +
        'AN_RECD,'
      '      dbo.Data0071.extra_req, dbo.Data0002.UNIT_NAME'
      'FROM dbo.Data0017 INNER JOIN'
      
        '      dbo.Data0071 ON dbo.Data0017.RKEY = dbo.Data0071.INVT_PTR ' +
        'INNER JOIN'
      '      dbo.Data0002 ON'
      '      dbo.Data0071.PURCHASE_UNIT_PTR = dbo.Data0002.RKEY'
      'where data0071.PO_ptr=:rkey')
    Left = 417
    Top = 351
    object ADO0071INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ADO0071INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      DisplayWidth = 30
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ADO0071QUAN_ORD: TFloatField
      DisplayLabel = #35746#36141#25968#37327
      FieldName = 'QUAN_ORD'
    end
    object ADO0071PRICE: TFloatField
      DisplayLabel = #20215#26684
      FieldName = 'PRICE'
    end
    object ADO0071extra_req: TStringField
      DisplayLabel = #29305#21035#35828#26126
      FieldName = 'extra_req'
    end
    object ADO0071UNIT_NAME: TStringField
      DisplayLabel = #37319#36141#21333#20301
      FieldName = 'UNIT_NAME'
    end
    object ADO0071QUAN_RECD: TBCDField
      DisplayLabel = #20837#20179#25968#37327
      FieldName = 'QUAN_RECD'
      Precision = 9
      Size = 3
    end
  end
  object DataSource2: TDataSource
    DataSet = ADO0071
    Left = 385
    Top = 352
  end
end
