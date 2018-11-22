object Form_invtship: TForm_invtship
  Left = 210
  Top = 111
  Width = 707
  Height = 557
  Caption = #36864#36135#35013#36816#26597#25214
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 45
    Width = 699
    Height = 444
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Width = 69
        Visible = True
      end
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
        FieldName = 'CURR_NAME'
        Width = 49
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 699
    Height = 45
    Align = alTop
    Caption = #36865#36135#26085#26399
    TabOrder = 0
    object Label1: TLabel
      Left = 15
      Top = 19
      Width = 13
      Height = 13
      Caption = #20174
    end
    object Label2: TLabel
      Left = 128
      Top = 19
      Width = 13
      Height = 13
      Caption = #21040
    end
    object Edit1: TEdit
      Left = 340
      Top = 16
      Width = 96
      Height = 21
      TabOrder = 0
    end
    object ComboBox1: TComboBox
      Left = 249
      Top = 16
      Width = 89
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 2
      Text = #20379#24212#21830#20195#30721
      Items.Strings = (
        #20379#24212#21830#20195#30721
        #20379#24212#21830#31616#31216
        #36865#36135#21333#21495
        #20837#20179#21333#21495)
    end
    object BitBtn1: TBitBtn
      Left = 443
      Top = 14
      Width = 56
      Height = 25
      Caption = #26597#25214
      TabOrder = 1
      OnClick = BitBtn1Click
    end
    object dtpk1: TDateTimePicker
      Left = 31
      Top = 16
      Width = 94
      Height = 21
      CalAlignment = dtaLeft
      Date = 38764
      Time = 38764
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 3
    end
    object dtpk2: TDateTimePicker
      Left = 144
      Top = 16
      Width = 94
      Height = 21
      CalAlignment = dtaLeft
      Date = 38764
      Time = 38764
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 4
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 489
    Width = 699
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      699
      41)
    object Button1: TButton
      Left = 262
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #30830#23450
      TabOrder = 0
      OnClick = Button1Click
    end
    object CheckBox1: TCheckBox
      Left = 19
      Top = 13
      Width = 49
      Height = 17
      Caption = #20840#36873
      TabOrder = 1
      OnClick = CheckBox1Click
    end
    object Button2: TButton
      Left = 342
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 2
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
        Name = 'dtpk1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 37257d
      end
      item
        Name = 'dtpk2'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 38764d
      end>
    SQL.Strings = (
      'SELECT Data0017.INV_NAME, Data0017.INV_DESCRIPTION,'
      '      Data0456.GRN_NUMBER, Data0456.DELIVER_NUMBER,'
      '      Data0022.PRICE, Data0022.TAX_2, Data0022.CURRENCY_PTR,'
      
        '      Data0001.CURR_CODE, Data0001.CURR_NAME, Data0002.UNIT_NAME' +
        ','
      '      Data0456.SUPP_PTR, Data0023.CODE, Data0023.ABBR_NAME,'
      '      Data0023.SUPPLIER_NAME, Data0022.EXCHANGE_RATE,'
      '      Data0095.RKEY, Data0095.QUANTITY, Data0095.TRAN_DATE,'
      '      Data0005.EMPLOYEE_NAME,'
      '      ROUND(Data0095.QUANTITY * Data0022.PRICE, 2) AS amount,'
      
        '      ROUND((Data0095.QUANTITY * Data0022.PRICE * Data0022.TAX_2' +
        ' * 0.01)'
      '       / (1 + Data0022.TAX_2 * 0.01), 2) AS tax_amount'
      'FROM dbo.Data0095 INNER JOIN'
      
        '      dbo.Data0017 ON dbo.Data0095.INVT_PTR = dbo.Data0017.RKEY ' +
        'INNER JOIN'
      '      dbo.Data0022 INNER JOIN'
      
        '      dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY I' +
        'NNER JOIN'
      
        '      dbo.Data0001 ON dbo.Data0022.CURRENCY_PTR = dbo.Data0001.R' +
        'KEY INNER JOIN'
      '      dbo.Data0002 ON '
      
        '      dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0002.RKEY INNER J' +
        'OIN'
      
        '      dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY ' +
        'ON '
      '      dbo.Data0095.SRCE_PTR = dbo.Data0022.RKEY INNER JOIN'
      '      dbo.Data0005 ON dbo.Data0095.TRAN_BY = dbo.Data0005.RKEY'
      'WHERE (dbo.Data0095.TRAN_TP = 21) AND'
      '      (dbo.Data0095.debit_ptr IS NULL) and'
      '      (Data0095.TRAN_DATE>=:dtpk1) and'
      '      (Data0095.TRAN_DATE<=:dtpk2)'
      ''
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
    object aqwz95CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object aqwz95CURR_CODE: TStringField
      DisplayLabel = #36135#24065#20195#30721
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object aqwz95CURR_NAME: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_NAME'
    end
    object aqwz95UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object aqwz95SUPP_PTR: TIntegerField
      FieldName = 'SUPP_PTR'
    end
    object aqwz95CODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object aqwz95ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object aqwz95SUPPLIER_NAME: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object aqwz95EXCHANGE_RATE: TBCDField
      FieldName = 'EXCHANGE_RATE'
      Precision = 12
      Size = 8
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
