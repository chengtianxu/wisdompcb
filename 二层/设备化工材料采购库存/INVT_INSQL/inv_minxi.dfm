object Form9: TForm9
  Left = 195
  Top = 140
  Width = 824
  Height = 552
  Caption = #26448#26009#24211#23384#26126#32454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 816
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      816
      41)
    object Label3: TLabel
      Left = 253
      Top = 15
      Width = 123
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop]
      AutoSize = False
      Caption = #26448#26009#32534#30721
    end
    object Button1: TButton
      Left = 7
      Top = 8
      Width = 70
      Height = 25
      Caption = #36864#20986
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 78
      Top = 8
      Width = 70
      Height = 25
      Caption = #23548#20986'Excel'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Edit3: TEdit
      Left = 384
      Top = 11
      Width = 152
      Height = 21
      Anchors = [akTop]
      TabOrder = 2
      OnChange = Edit3Change
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 816
    Height = 484
    Align = alClient
    DataSource = DataSource1
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
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
        FieldName = 'INV_PART_NUMBER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inv_name'
        Width = 146
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_DESCRIPTION'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GROUP_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'code23'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_ON_HAND'
        ReadOnly = False
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXCHANGE_RATE'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRICE'
        ReadOnly = False
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tax_2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'notax_price'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_REV_NO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRN_NUMBER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WAREHOUSE_CODE'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCATION'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ship_DATE'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXPIRE_DATE'
        ReadOnly = False
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BARCODE_ID'
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = ado0022
    Left = 136
    Top = 448
  end
  object ado0022: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'SELECT Data0017.INV_PART_NUMBER,Data0017.INV_NAME,'
      '      Data0017.INV_DESCRIPTION, Data0496.GROUP_NAME,'
      '      Data0023.ABBR_NAME AS code23, Data0022.QUAN_ON_HAND,'
      '      Data0001.CURR_CODE, Data0022.PRICE, Data0016.LOCATION,'
      '      Data0002.UNIT_NAME,  Data0022.EXPIRE_DATE,'
      '      Data0022.BARCODE_ID, Data0070.PO_REV_NO,'
      '      Data0456.GRN_NUMBER,data0022.tax_2,Data0022.EXCHANGE_RATE,'
      '      Data0015.WAREHOUSE_CODE, Data0456.ship_DATE,'
      'round(Data0022.PRICE/(1+data0022.tax_2*0.01),3) as notax_price'
      'FROM dbo.Data0016 INNER JOIN'
      '      dbo.Data0002 INNER JOIN'
      '      dbo.Data0001 INNER JOIN'
      '      dbo.Data0022 INNER JOIN'
      
        '      dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR = dbo.Data0017.' +
        'RKEY INNER JOIN'
      
        '      dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY' +
        ' ON '
      '      dbo.Data0001.RKEY = dbo.Data0022.CURRENCY_PTR INNER JOIN'
      
        '      dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY O' +
        'N '
      
        '      dbo.Data0002.RKEY = dbo.Data0022.LOCATION_PTR_FROM INNER J' +
        'OIN'
      
        '      dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY ' +
        'ON '
      '      dbo.Data0016.RKEY = dbo.Data0022.LOCATION_PTR INNER JOIN'
      '      dbo.Data0015 ON'
      
        '      dbo.Data0456.warehouse_ptr = dbo.Data0015.RKEY LEFT OUTER ' +
        'JOIN'
      '      dbo.Data0070 ON dbo.Data0456.PO_PTR = dbo.Data0070.RKEY'
      'WHERE (dbo.Data0022.QUAN_ON_HAND > 0)'
      'ORDER BY dbo.Data0017.INV_PART_NUMBER ')
    Left = 168
    Top = 448
    object ado0022INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ado0022inv_name: TStringField
      DisplayLabel = #26448#26009#21517#31216
      DisplayWidth = 20
      FieldName = 'inv_name'
      Size = 30
    end
    object ado0022INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      DisplayWidth = 20
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ado0022GROUP_NAME: TStringField
      DisplayLabel = #31867#21035
      FieldName = 'GROUP_NAME'
      Size = 10
    end
    object ado0022code23: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'code23'
      Size = 10
    end
    object ado0022QUAN_ON_HAND: TFloatField
      DisplayLabel = #29616#26377#25968#37327
      FieldName = 'QUAN_ON_HAND'
    end
    object ado0022UNIT_NAME: TStringField
      DisplayLabel = #23384#36135#21333#20301
      FieldName = 'UNIT_NAME'
    end
    object ado0022CURR_CODE: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ado0022PRICE: TFloatField
      DisplayLabel = #21547#31246#20215
      FieldName = 'PRICE'
    end
    object ado0022WAREHOUSE_CODE: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ado0022LOCATION: TStringField
      DisplayLabel = #20179#24211
      FieldName = 'LOCATION'
      Size = 10
    end
    object ado0022EXPIRE_DATE: TDateTimeField
      DisplayLabel = #26377#25928#26399
      FieldName = 'EXPIRE_DATE'
    end
    object ado0022PO_REV_NO: TStringField
      DisplayLabel = #35831#36141#37096#38376
      FieldName = 'PO_REV_NO'
      Size = 10
    end
    object ado0022GRN_NUMBER: TStringField
      DisplayLabel = #25910#36135#21333#21495
      FieldName = 'GRN_NUMBER'
      FixedChar = True
      Size = 10
    end
    object ado0022BARCODE_ID: TStringField
      DisplayLabel = #22791#27880
      DisplayWidth = 10
      FieldName = 'BARCODE_ID'
      Size = 50
    end
    object ado0022ship_DATE: TDateTimeField
      DisplayLabel = #25910#36135#26085#26399
      FieldName = 'ship_DATE'
    end
    object ado0022tax_2: TBCDField
      DisplayLabel = #31246#29575'%'
      FieldName = 'tax_2'
      Precision = 4
      Size = 2
    end
    object ado0022EXCHANGE_RATE: TBCDField
      DisplayLabel = #27719#29575
      FieldName = 'EXCHANGE_RATE'
      Precision = 12
      Size = 8
    end
    object ado0022notax_price: TBCDField
      DisplayLabel = #19981#21547#31246#20215
      FieldName = 'notax_price'
      ReadOnly = True
      Precision = 22
      Size = 12
    end
  end
end
