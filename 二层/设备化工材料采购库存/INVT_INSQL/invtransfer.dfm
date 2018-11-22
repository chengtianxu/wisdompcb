object Form5: TForm5
  Left = 197
  Top = 147
  Width = 801
  Height = 480
  Caption = #26448#26009#36716#31227#26597#35810
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 793
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Button1: TButton
      Left = 40
      Top = 8
      Width = 75
      Height = 25
      Caption = #36864#20986
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 120
      Top = 8
      Width = 75
      Height = 25
      Caption = #23548#20986'Excel'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 793
    Height = 412
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'TDATE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REF_NUMBER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_PART_NUMBER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WAREHOUSE_CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'warehouse_in'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'code_in'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BARCODE_ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTITY'
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = ado27
    Left = 232
    Top = 360
  end
  object ado27: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'SELECT TOP 100 PERCENT dbo.Data0027.REF_NUMBER, dbo.Data0027.QUA' +
        'NTITY, '
      '      dbo.Data0005.EMPLOYEE_NAME, Data0015_1.WAREHOUSE_CODE, '
      
        '      data0015_2.WAREHOUSE_CODE AS warehouse_in, Data0016_1.CODE' +
        ', '
      
        '      data0016_2.CODE AS code_in, dbo.Data0027.TDATE, dbo.Data00' +
        '22.BARCODE_ID, '
      '      dbo.Data0017.INV_PART_NUMBER, dbo.Data0002.UNIT_NAME'
      'FROM dbo.Data0027 INNER JOIN'
      
        '      dbo.Data0005 ON dbo.Data0027.EMPL_PTR = dbo.Data0005.RKEY ' +
        'INNER JOIN'
      '      dbo.Data0015 Data0015_1 ON '
      '      dbo.Data0027.FM_WHOUSE_PTR = Data0015_1.RKEY INNER JOIN'
      '      dbo.Data0015 data0015_2 ON '
      '      dbo.Data0027.TO_WHOUSE_PTR = data0015_2.RKEY INNER JOIN'
      '      dbo.Data0016 Data0016_1 ON '
      '      dbo.Data0027.FM_LOCATION_PTR = Data0016_1.RKEY INNER JOIN'
      '      dbo.Data0016 data0016_2 ON '
      '      dbo.Data0027.TO_LOCATION_PTR = data0016_2.RKEY INNER JOIN'
      
        '      dbo.Data0022 ON dbo.Data0027.D0022_PTR = dbo.Data0022.RKEY' +
        ' INNER JOIN'
      
        '      dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR = dbo.Data0017.' +
        'RKEY INNER JOIN'
      
        '      dbo.Data0002 ON dbo.Data0017.STOCK_UNIT_PTR = dbo.Data0002' +
        '.RKEY'
      'WHERE (dbo.Data0027.QUANTITY <> 0)'
      'ORDER BY dbo.Data0027.TDATE')
    Left = 264
    Top = 360
    object ado27TDATE: TDateTimeField
      DisplayLabel = #36716#31227#26085#26399
      FieldName = 'TDATE'
    end
    object ado27EMPLOYEE_NAME: TStringField
      DisplayLabel = #36716#31227#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ado27REF_NUMBER: TStringField
      DisplayLabel = #21442#32771#21495
      FieldName = 'REF_NUMBER'
      FixedChar = True
    end
    object ado27INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#20195#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ado27UNIT_NAME: TStringField
      DisplayLabel = #23384#36135#21333#20301
      FieldName = 'UNIT_NAME'
    end
    object ado27WAREHOUSE_CODE: TStringField
      DisplayLabel = #36716#20986#24037#21378
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ado27CODE: TStringField
      DisplayLabel = #36716#20986#20179#24211
      FieldName = 'CODE'
      FixedChar = True
      Size = 5
    end
    object ado27warehouse_in: TStringField
      DisplayLabel = #36716#20837#24037#21378
      FieldName = 'warehouse_in'
      Size = 5
    end
    object ado27code_in: TStringField
      DisplayLabel = #36716#20837#20179#24211
      FieldName = 'code_in'
      FixedChar = True
      Size = 5
    end
    object ado27BARCODE_ID: TStringField
      DisplayLabel = 'BARCODE'
      FieldName = 'BARCODE_ID'
      FixedChar = True
      Size = 12
    end
    object ado27QUANTITY: TFloatField
      DisplayLabel = #36716#31227#25968#37327
      FieldName = 'QUANTITY'
    end
  end
end
