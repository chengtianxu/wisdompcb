object Form_sendback: TForm_sendback
  Left = 234
  Top = 168
  Width = 727
  Height = 523
  Caption = #36864#36135#26597#25214
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 719
    Height = 455
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
    Columns = <
      item
        Expanded = False
        FieldName = 'INV_NAME'
        Width = 139
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_DESCRIPTION'
        Width = 182
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
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRICE'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAX_2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRN_NUMBER'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DELIVER_NUMBER'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRAN_DATE'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Width = 85
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 455
    Width = 719
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      719
      41)
    object Button1: TButton
      Left = 254
      Top = 11
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 334
      Top = 11
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = aqwz95
    Left = 88
    Top = 400
  end
  object aqwz95: TADOQuery
    Connection = dm.ACt
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
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
        Name = 'rkey01'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION, '
      '      dbo.Data0456.GRN_NUMBER, dbo.Data0456.DELIVER_NUMBER, '
      
        '      dbo.Data0022.PRICE, dbo.Data0022.TAX_2, dbo.Data0002.UNIT_' +
        'NAME, '
      
        '      dbo.Data0095.RKEY, dbo.Data0095.QUANTITY, dbo.Data0095.TRA' +
        'N_DATE, '
      '      dbo.Data0005.EMPLOYEE_NAME, '
      
        '      ROUND(dbo.Data0095.QUANTITY * dbo.Data0022.PRICE, 2) AS am' +
        'ount, '
      
        '      ROUND((dbo.Data0095.QUANTITY * dbo.Data0022.PRICE * dbo.Da' +
        'ta0022.TAX_2 * 0.01)'
      '       / (1 + dbo.Data0022.TAX_2 * 0.01), 2) AS tax_amount'
      'FROM dbo.Data0095 INNER JOIN'
      
        '      dbo.Data0017 ON dbo.Data0095.INVT_PTR = dbo.Data0017.RKEY ' +
        'INNER JOIN'
      '      dbo.Data0022 INNER JOIN'
      
        '      dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY I' +
        'NNER JOIN'
      
        '      dbo.Data0002 ON dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0' +
        '002.RKEY ON '
      '      dbo.Data0095.SRCE_PTR = dbo.Data0022.RKEY INNER JOIN'
      '      dbo.Data0005 ON dbo.Data0095.TRAN_BY = dbo.Data0005.RKEY'
      'WHERE (Data0095.TRAN_TP = 21) AND'
      '      (Data0095.debit_ptr IS NULL) and'
      '      (Data0456.SUPP_PTR = :rkey23) and'
      '      (Data0022.CURRENCY_PTR = :rkey01)'
      'ORDER BY dbo.Data0095.TRAN_DATE')
    Left = 120
    Top = 400
    object aqwz95RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aqwz95INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object aqwz95INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object aqwz95GRN_NUMBER: TStringField
      DisplayLabel = #20837#24211#21333#21495
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object aqwz95DELIVER_NUMBER: TStringField
      DisplayLabel = #36865#36135#21333#21495
      FieldName = 'DELIVER_NUMBER'
      Size = 15
    end
    object aqwz95PRICE: TBCDField
      DisplayLabel = #20215#26684
      FieldName = 'PRICE'
      Precision = 9
      Size = 3
    end
    object aqwz95TAX_2: TBCDField
      DisplayLabel = #31246#29575
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object aqwz95UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object aqwz95QUANTITY: TFloatField
      DisplayLabel = #36864#36135#25968#37327
      FieldName = 'QUANTITY'
    end
    object aqwz95TRAN_DATE: TDateTimeField
      DisplayLabel = #35013#36816#26085#26399
      FieldName = 'TRAN_DATE'
    end
    object aqwz95EMPLOYEE_NAME: TStringField
      DisplayLabel = #35013#36816#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object aqwz95amount: TFloatField
      FieldName = 'amount'
      ReadOnly = True
    end
    object aqwz95tax_amount: TFloatField
      FieldName = 'tax_amount'
      ReadOnly = True
    end
  end
end
