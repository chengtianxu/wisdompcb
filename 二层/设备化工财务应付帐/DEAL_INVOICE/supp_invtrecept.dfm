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
    Left = 133
    Top = 15
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #20837#20179#21333#21495':'
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
    OnKeyDown = DBGrid1KeyDown
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
        ReadOnly = False
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
        Width = 138
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
    ModalResult = 1
    TabOrder = 2
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
    Left = 196
    Top = 11
    Width = 121
    Height = 21
    TabOrder = 4
    OnChange = Edit1Change
  end
  object aq456: TADOQuery
    Connection = dm.ACt
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = aq456CalcFields
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
        Name = 'rkey15'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'rkey01'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'v_type'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT dbo.Data0456.RKEY, dbo.Data0456.GRN_NUMBER, '
      '      dbo.Data0456.DELIVER_NUMBER, dbo.Data0070.PO_NUMBER, '
      
        '      dbo.Data0456.ship_DATE, dbo.Data0005.EMPLOYEE_NAME, dbo.Da' +
        'ta0456.TTYPE, '
      
        '      dbo.Data0001.CURR_NAME, SUM(dbo.Data0022.QUANTITY * dbo.Da' +
        'ta0022.PRICE) '
      '      AS amount'
      'FROM dbo.Data0456 INNER JOIN'
      
        '      dbo.Data0005 ON dbo.Data0456.CREATE_BY = dbo.Data0005.RKEY' +
        ' INNER JOIN'
      
        '      dbo.Data0022 ON dbo.Data0456.RKEY = dbo.Data0022.GRN_PTR I' +
        'NNER JOIN'
      '      dbo.Data0001 ON '
      
        '      dbo.Data0022.CURRENCY_PTR = dbo.Data0001.RKEY LEFT OUTER J' +
        'OIN'
      '      dbo.Data0070 ON dbo.Data0456.PO_PTR = dbo.Data0070.RKEY'
      'WHERE (dbo.Data0456.STATUS = 3) and'
      '      (Data0456.supp_ptr=:rkey23) and'
      '      (data0456.warehouse_ptr=:rkey15) and'
      '      (data0022.currency_ptr=:rkey01) and'
      '      (data0456.ttype=:v_type)'
      'GROUP BY dbo.Data0456.GRN_NUMBER, dbo.Data0456.DELIVER_NUMBER,'
      '      dbo.Data0070.PO_NUMBER, dbo.Data0456.ship_DATE,'
      
        '      dbo.Data0005.EMPLOYEE_NAME, dbo.Data0456.TTYPE, dbo.Data00' +
        '01.CURR_NAME, '
      '      dbo.Data0456.RKEY')
    Left = 40
    Top = 240
    object aq456RKEY: TIntegerField
      DisplayWidth = 8
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aq456GRN_NUMBER: TStringField
      DisplayLabel = #20837#20179#21333#21495
      DisplayWidth = 16
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object aq456DELIVER_NUMBER: TStringField
      DisplayLabel = #36865#36135#21333#21495
      DisplayWidth = 20
      FieldName = 'DELIVER_NUMBER'
      Size = 15
    end
    object aq456PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#35746#21333
      DisplayWidth = 16
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object aq456ship_DATE: TDateTimeField
      DisplayLabel = #36865#36135#26085#26399
      DisplayWidth = 22
      FieldName = 'ship_DATE'
    end
    object aq456EMPLOYEE_NAME: TStringField
      DisplayLabel = #25910#36135#21592#24037
      DisplayWidth = 19
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object aq456TTYPE: TWordField
      DisplayWidth = 12
      FieldName = 'TTYPE'
    end
    object aq456CURR_NAME: TStringField
      DisplayLabel = #36135#24065
      DisplayWidth = 24
      FieldName = 'CURR_NAME'
    end
    object aq456amount: TBCDField
      DisplayLabel = #37329#39069
      DisplayWidth = 47
      FieldName = 'amount'
      Precision = 38
      Size = 6
    end
    object aq456v_type: TStringField
      DisplayLabel = #31867#22411
      FieldKind = fkCalculated
      FieldName = 'v_type'
      Size = 4
      Calculated = True
    end
  end
  object DataSource1: TDataSource
    DataSet = aq456
    Left = 8
    Top = 240
  end
  object DataSource2: TDataSource
    DataSet = aq22
    Left = 8
    Top = 312
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
      'SELECT dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION,'
      
        '      dbo.Data0022.QUANTITY, dbo.Data0002.UNIT_NAME, dbo.Data002' +
        '2.PRICE, '
      
        '      dbo.Data0022.TAX_2, ROUND(dbo.Data0022.QUANTITY * dbo.Data' +
        '0022.PRICE, 2) '
      '      AS amount, '
      
        '      ROUND((dbo.Data0022.QUANTITY * dbo.Data0022.PRICE * dbo.Da' +
        'ta0022.TAX_2 * 0.01)'
      
        '       / (1 + dbo.Data0022.TAX_2 * 0.01), 2) AS tax_amount, dbo.' +
        'Data0022.GRN_PTR, '
      '      dbo.Data0022.RKEY, dbo.Data0022.SOURCE_PTR'
      'FROM dbo.Data0022 INNER JOIN'
      
        '      dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR = dbo.Data0017.' +
        'RKEY INNER JOIN'
      '      dbo.Data0002 ON '
      '      dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0002.RKEY'
      'WHERE (dbo.Data0022.GRN_PTR = :rkey)')
    Left = 40
    Top = 312
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
      Precision = 9
      Size = 3
    end
    object aq22TAX_2: TBCDField
      DisplayLabel = #31246#29575'%'
      DisplayWidth = 7
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
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
      Precision = 38
      Size = 17
    end
    object aq22GRN_PTR: TIntegerField
      DisplayWidth = 12
      FieldName = 'GRN_PTR'
    end
    object aq22RKEY: TIntegerField
      DisplayWidth = 12
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aq22SOURCE_PTR: TIntegerField
      DisplayWidth = 15
      FieldName = 'SOURCE_PTR'
    end
  end
end
