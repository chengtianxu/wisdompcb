object Form20: TForm20
  Left = 377
  Top = 189
  Width = 699
  Height = 480
  Caption = #24211#23384#26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 691
    Height = 405
    Align = alClient
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'INV_PART_NUMBER'
        Title.Caption = #26448#26009#32534#30721
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_NAME'
        Title.Caption = #26448#26009#21517#31216
        Width = 135
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_DESCRIPTION'
        Title.Caption = #26448#26009#35268#26684
        Width = 208
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GROUP_NAME'
        Title.Caption = #26448#26009#32423#21035
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inv_group_name'
        Title.Caption = #26448#26009#31867#21035
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Title.Caption = #20379#24212#21830#31616#31216
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quan_total'
        Title.Caption = #24211#23384#25968#37327
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'avl_price'
        Title.Caption = #24179#22343#21547#31246#20215#26684'('#26412#24065#20301')'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'amount'
        Title.Caption = #21547#31246#37329#39069'('#26412#24065#20301')'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCATION'
        Title.Caption = #20179#24211
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'type'
        Title.Caption = #24211#23384#31867#22411
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_CODE'
        Title.Caption = #23384#36135#21333#20301
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'reason'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BARCODE_ID'
        Width = 150
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 405
    Width = 691
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Button1: TButton
      Left = 296
      Top = 8
      Width = 75
      Height = 25
      Caption = #20851#38381
      ModalResult = 2
      TabOrder = 0
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'INVT_PTR'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'INVT_PTR'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT Data0017.INV_PART_NUMBER,Data0017.INV_NAME,Data0017.INV_D' +
        'ESCRIPTION,Data0496.GROUP_NAME,'
      
        '       Data0016.LOCATION,SUM(Data0022.QUAN_ON_HAND) AS quan_tota' +
        'l, '
      '       CASE SUM(Data0022.QUANTITY) WHEN 0 THEN NULL'
      
        '       ELSE ROUND(SUM(Data0022.QUANTITY * Data0022.tax_price * D' +
        'ata0456.exch_rate)'
      '       / SUM(Data0022.QUANTITY),4) END AS avl_price,'
      
        '       ROUND(SUM(Data0022.QUAN_ON_HAND * Data0022.tax_price * Da' +
        'ta0456.exch_rate),3) AS amount,'
      
        '       Data0002.UNIT_CODE,Data0071.reason, Data0022.BARCODE_ID, ' +
        'Data0023.ABBR_NAME,Data0019.inv_group_name,'#39#36890#29992#24211#23384#39' AS type'
      'FROM   Data0022 INNER JOIN'
      
        '       Data0017 ON Data0022.INVENTORY_PTR = Data0017.RKEY INNER ' +
        'JOIN'
      '       Data0496 ON Data0017.GROUP_PTR = Data0496.RKEY INNER JOIN'
      '       Data0019 ON Data0496.group_ptr = Data0019.rkey INNER JOIN'
      
        '       Data0002 ON Data0022.LOCATION_PTR_FROM = Data0002.RKEY IN' +
        'NER JOIN'
      '       Data0456 ON Data0022.GRN_PTR = Data0456.RKEY INNER JOIN'
      
        '       Data0015 ON Data0456.warehouse_ptr = Data0015.RKEY INNER ' +
        'JOIN'
      
        '       Data0023 ON Data0456.SUPP_PTR = Data0023.RKEY LEFT OUTER ' +
        'JOIN'
      
        '       Data0016 ON Data0022.LOCATION_PTR = Data0016.RKEY left jo' +
        'in'
      '       Data0071 ON Data0022.SOURCE_PTR = dbo.Data0071.RKEY'
      'WHERE  (Data0022.QUAN_ON_HAND <> 0) '
      ' and (data0017.rkey=:INVT_PTR)'
      'GROUP BY Data0017.INV_PART_NUMBER, Data0017.INV_NAME, '
      
        '       Data0017.INV_DESCRIPTION,Data0496.GROUP_NAME,Data0002.UNI' +
        'T_CODE, Data0071.reason, Data0022.BARCODE_ID,'
      
        '       Data0023.ABBR_NAME,Data0019.inv_group_name,Data0016.LOCAT' +
        'ION'
      ''
      'union all'
      ''
      
        'SELECT Data0017.INV_PART_NUMBER,Data0017.INV_NAME,Data0017.INV_D' +
        'ESCRIPTION,Data0496.GROUP_NAME,'
      
        '       Data0016.LOCATION,SUM(DATA0134.QUAN_ON_HAND) AS quan_tota' +
        'l,'
      '       CASE SUM(Data0134.QUANTITY) WHEN 0 THEN NULL'
      
        '       ELSE ROUND(SUM(Data0134.QUANTITY * Data0134.tax_price * D' +
        'ata0133.exch_rate)'
      '       / SUM(Data0134.QUANTITY),4) END AS avl_price,'
      
        '       ROUND(SUM(Data0134.QUAN_ON_HAND * Data0134.tax_price * Da' +
        'ta0133.exch_rate),3) AS amount,'
      
        '       Data0002.UNIT_CODE,Data0071.reason, Data0134.BARCODE_ID,D' +
        'ata0023.ABBR_NAME,Data0019.inv_group_name,'#39'VMI'#24211#23384#39' AS type'
      'FROM   Data0017 INNER JOIN'
      '       Data0496 ON Data0017.GROUP_PTR = Data0496.RKEY INNER JOIN'
      '       Data0019 ON Data0496.group_ptr = Data0019.rkey INNER JOIN'
      
        '       DATA0134 ON Data0017.RKEY = DATA0134.INVENTORY_PTR INNER ' +
        'JOIN'
      '       Data0002 ON DATA0134.UNIT_PTR = Data0002.RKEY INNER JOIN'
      '       DATA0133 INNER JOIN'
      
        '       Data0023 ON DATA0133.SUPP_PTR = Data0023.RKEY ON DATA0134' +
        '.GRN_PTR = DATA0133.RKEY INNER JOIN'
      
        '       Data0016 ON DATA0134.LOCATION_PTR = Data0016.RKEY LEFT JO' +
        'IN'
      
        '       dbo.Data0071 ON dbo.DATA0134.SOURCE_PTR = dbo.Data0071.RK' +
        'EY'
      'WHERE  (data0134.quan_on_hand>0) '
      '     and  (DATA0134.INVENTORY_ptr =:INVT_PTR)'
      
        'GROUP BY Data0017.INV_PART_NUMBER,Data0017.INV_NAME,Data0017.INV' +
        '_DESCRIPTION,Data0496.GROUP_NAME,Data0002.UNIT_CODE,'
      
        '                 Data0071.reason, Data0134.BARCODE_ID, Data0023.' +
        'ABBR_NAME,Data0019.inv_group_name,Data0016.LOCATION'
      'ORDER BY Data0017.INV_PART_NUMBER, Data0017.INV_DESCRIPTION')
    Left = 488
    Top = 128
    object ADOQuery1INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      ReadOnly = True
      Size = 25
    end
    object ADOQuery1INV_NAME: TStringField
      FieldName = 'INV_NAME'
      ReadOnly = True
      Size = 30
    end
    object ADOQuery1INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      ReadOnly = True
      Size = 70
    end
    object ADOQuery1GROUP_NAME: TStringField
      FieldName = 'GROUP_NAME'
      ReadOnly = True
      Size = 10
    end
    object ADOQuery1LOCATION: TStringField
      FieldName = 'LOCATION'
      ReadOnly = True
    end
    object ADOQuery1quan_total: TBCDField
      FieldName = 'quan_total'
      ReadOnly = True
      Precision = 32
    end
    object ADOQuery1avl_price: TFloatField
      FieldName = 'avl_price'
      ReadOnly = True
    end
    object ADOQuery1amount: TBCDField
      FieldName = 'amount'
      ReadOnly = True
      Precision = 32
      Size = 8
    end
    object ADOQuery1UNIT_CODE: TStringField
      FieldName = 'UNIT_CODE'
      ReadOnly = True
      Size = 5
    end
    object ADOQuery1ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      ReadOnly = True
      Size = 16
    end
    object ADOQuery1inv_group_name: TStringField
      FieldName = 'inv_group_name'
      ReadOnly = True
    end
    object ADOQuery1type: TStringField
      FieldName = 'type'
      ReadOnly = True
      Size = 8
    end
    object ADOQuery1reason: TStringField
      DisplayLabel = #35831#36141#21407#22240
      FieldName = 'reason'
      ReadOnly = True
      Size = 60
    end
    object ADOQuery1BARCODE_ID: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'BARCODE_ID'
      ReadOnly = True
      Size = 50
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 552
    Top = 120
  end
end
