object Form_suppinvtrecept: TForm_suppinvtrecept
  Left = 259
  Top = 141
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20379#24212#21830#20837#20179#21333#26597#25214
  ClientHeight = 497
  ClientWidth = 595
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 189
    Top = 15
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #20837#20179#21333#21495':'
  end
  object DBGrid3: TDBGrid
    Left = 0
    Top = 305
    Width = 594
    Height = 137
    DataSource = DataSource3
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid3KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'goods_name'
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'goods_guige'
        Width = 148
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_RECD'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'unit_price'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'state_tax'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'amount'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tax_amount'
        Width = 49
        Visible = True
      end>
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 40
    Width = 596
    Height = 263
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'GRN_NUMBER'
        Title.Color = clRed
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DELIVER_NUMBER'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ship_DATE'
        ReadOnly = False
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'amount'
        ReadOnly = False
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_type'
        Width = 65
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 305
    Width = 594
    Height = 137
    DataSource = DataSource2
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid2KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'INV_NAME'
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_DESCRIPTION'
        Width = 148
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTITY'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRICE'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAX_2'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'amount'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tax_amount'
        Width = 49
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 216
    Top = 462
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 296
    Top = 462
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 3
  end
  object Edit1: TEdit
    Left = 252
    Top = 11
    Width = 121
    Height = 21
    TabOrder = 4
    OnChange = Edit1Change
  end
  object DataSource1: TDataSource
    DataSet = aq456
    OnDataChange = DataSource1DataChange
    Left = 8
    Top = 240
  end
  object DataSource2: TDataSource
    DataSet = aq22
    Left = 8
    Top = 336
  end
  object aq22: TADOQuery
    Connection = dm.ACt
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Data0017.INV_NAME, Data0017.INV_DESCRIPTION,'
      '      Data0022.QUANTITY, Data0002.UNIT_NAME,'
      'Data0022.TAX_2, ROUND(Data0022.QUANTITY * Data0022.tax_PRICE, 2)'
      '      AS amount,Data0022.tax_PRICE as price,'
      
        'ROUND((Data0022.QUANTITY * Data0022.tax_PRICE * Data0022.TAX_2 *' +
        ' 0.01)'
      
        ' / (1 + Data0022.TAX_2 * 0.01), 2) AS tax_amount, Data0022.GRN_P' +
        'TR,'
      '      Data0022.RKEY, Data0022.SOURCE_PTR'
      'FROM dbo.Data0022 INNER JOIN'
      
        '      dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR = dbo.Data0017.' +
        'RKEY INNER JOIN'
      '      dbo.Data0002 ON'
      '      dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0002.RKEY'
      'WHERE (dbo.Data0022.GRN_PTR = :rkey)')
    Left = 40
    Top = 336
    object aq22INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      DisplayWidth = 32
      FieldName = 'INV_NAME'
      Size = 30
    end
    object aq22INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      DisplayWidth = 23
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object aq22QUANTITY: TBCDField
      DisplayLabel = #20837#20179#25968#37327
      DisplayWidth = 12
      FieldName = 'QUANTITY'
      Precision = 9
      Size = 3
    end
    object aq22UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      DisplayWidth = 13
      FieldName = 'UNIT_NAME'
    end
    object aq22PRICE: TBCDField
      DisplayLabel = #20215#26684
      DisplayWidth = 12
      FieldName = 'PRICE'
      Precision = 13
    end
    object aq22TAX_2: TBCDField
      DisplayLabel = #31246#29575'%'
      DisplayWidth = 7
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object aq22GRN_PTR: TIntegerField
      DisplayWidth = 12
      FieldName = 'GRN_PTR'
    end
    object aq22SOURCE_PTR: TIntegerField
      DisplayWidth = 15
      FieldName = 'SOURCE_PTR'
    end
    object aq22RKEY: TIntegerField
      DisplayWidth = 12
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aq22amount: TBCDField
      DisplayLabel = #37329#39069
      DisplayWidth = 9
      FieldName = 'amount'
      ReadOnly = True
      Precision = 19
      Size = 6
    end
    object aq22tax_amount: TBCDField
      DisplayLabel = #31246#37329
      DisplayWidth = 13
      FieldName = 'tax_amount'
      ReadOnly = True
      Precision = 32
      Size = 17
    end
  end
  object aq235: TADOQuery
    Connection = dm.ACt
    CursorType = ctStatic
    Filtered = True
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
      'SELECT dbo.Data0235.goods_name, dbo.Data0235.goods_guige,'
      
        '      dbo.Data0235.QUAN_RECD, dbo.Data0002.UNIT_NAME, dbo.Data02' +
        '35.unit_price,'
      
        '      dbo.Data0235.state_tax, dbo.Data0235.GRN_PTR, dbo.Data0235' +
        '.D0072_PTR,'
      '      dbo.Data0235.RKEY,'
      'ROUND(Data0235.QUAN_RECD * Data0235.unit_price, 2) AS amount,'
      
        'ROUND((Data0235.QUAN_RECD * Data0235.unit_price * Data0235.state' +
        '_tax * 0.01)'
      '/(1 + Data0235.state_tax * 0.01), 2) AS tax_amount'
      'FROM dbo.Data0235 INNER JOIN'
      '      dbo.Data0002 ON dbo.Data0235.unit_ptr = dbo.Data0002.RKEY'
      'WHERE (Data0235.GRN_PTR = :rkey)')
    Left = 40
    Top = 376
    object aq235goods_name: TStringField
      DisplayLabel = #29289#21697#21517#31216
      FieldName = 'goods_name'
      Size = 60
    end
    object aq235goods_guige: TStringField
      DisplayLabel = #29289#21697#35268#26684
      FieldName = 'goods_guige'
      Size = 200
    end
    object aq235QUAN_RECD: TBCDField
      DisplayLabel = #20837#20179#25968#37327
      FieldName = 'QUAN_RECD'
      Precision = 10
      Size = 3
    end
    object aq235UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object aq235unit_price: TBCDField
      DisplayLabel = #20215#26684
      FieldName = 'unit_price'
      Precision = 10
      Size = 3
    end
    object aq235state_tax: TBCDField
      DisplayLabel = #31246#29575'%'
      FieldName = 'state_tax'
      Precision = 4
      Size = 2
    end
    object aq235GRN_PTR: TIntegerField
      FieldName = 'GRN_PTR'
    end
    object aq235D0072_PTR: TIntegerField
      FieldName = 'D0072_PTR'
    end
    object aq235RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aq235amount: TBCDField
      DisplayLabel = #37329#39069
      FieldName = 'amount'
      ReadOnly = True
      Precision = 21
      Size = 6
    end
    object aq235tax_amount: TBCDField
      DisplayLabel = #31246#37329
      FieldName = 'tax_amount'
      ReadOnly = True
      Precision = 32
      Size = 15
    end
  end
  object DataSource3: TDataSource
    DataSet = aq235
    Left = 8
    Top = 376
  end
  object aq456: TADODataSet
    Connection = dm.ACt
    CursorType = ctStatic
    Filtered = True
    CommandText = 'wzep107;2'
    CommandType = cmdStoredProc
    IndexFieldNames = 'GRN_NUMBER'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@rkey23'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 1
      end
      item
        Name = '@rkey01'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 1
      end
      item
        Name = '@v_type'
        Attributes = [paNullable]
        DataType = ftWord
        Precision = 3
        Value = 1
      end
      item
        Name = '@exchange_rate'
        Attributes = [paNullable]
        DataType = ftBCD
        Precision = 19
        Value = 10000c
      end>
    Left = 40
    Top = 240
    object aq456RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aq456GRN_NUMBER: TStringField
      DisplayLabel = #20837#20179#21333#21495
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object aq456DELIVER_NUMBER: TStringField
      DisplayLabel = #36865#36135#21333#21495
      FieldName = 'DELIVER_NUMBER'
      Size = 15
    end
    object aq456PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#35746#21333
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object aq456ship_DATE: TDateTimeField
      DisplayLabel = #36865#36135#26085#26399
      FieldName = 'ship_DATE'
    end
    object aq456EMPLOYEE_NAME: TStringField
      DisplayLabel = #25910#36135#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object aq456TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object aq456CURR_NAME: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_NAME'
    end
    object aq456amount: TBCDField
      DisplayLabel = #37329#39069
      FieldName = 'amount'
      ReadOnly = True
      Precision = 32
      Size = 6
    end
    object aq456CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object aq456v_type: TStringField
      DisplayLabel = #20837#20179#31867#22411
      FieldName = 'v_type'
      ReadOnly = True
      Size = 8
    end
  end
end
