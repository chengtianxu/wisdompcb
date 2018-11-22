object Form_stockqty: TForm_stockqty
  Left = 211
  Top = 201
  BorderStyle = bsSingle
  Caption = #24211#23384#26126#32454
  ClientHeight = 375
  ClientWidth = 855
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
    Width = 855
    Height = 375
    Align = alClient
    DataSource = DsStockQyt
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'INV_PART_NUMBER'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_NAME'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_DESCRIPTION'
        Width = 155
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GROUP_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inv_group_name'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUPPLIER2'
        Width = 132
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quan_total'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'avl_price'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'amount'
        Width = 100
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
        FieldName = 'type'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'reason'
        Width = 210
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BARCODE_ID'
        Width = 201
        Visible = True
      end>
  end
  object AQStockQty: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'ivname'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'ivname'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT Data0017.INV_PART_NUMBER,Data0017.INV_NAME,Data0017.INV_D' +
        'ESCRIPTION,Data0496.GROUP_NAME, Data0022.SUPPLIER2,'
      
        '       Data0016.LOCATION,SUM(Data0022.QUAN_ON_HAND) AS quan_tota' +
        'l,'
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
      ' and (Data0017.INV_PART_NUMBER = :ivname)'
      'GROUP BY Data0017.INV_PART_NUMBER, Data0017.INV_NAME, '
      
        '       Data0017.INV_DESCRIPTION,Data0496.GROUP_NAME,Data0002.UNI' +
        'T_CODE, Data0071.reason, Data0022.BARCODE_ID, Data0022.SUPPLIER2' +
        ','
      
        '       Data0023.ABBR_NAME,Data0019.inv_group_name,Data0016.LOCAT' +
        'ION'
      ' '
      'union all'
      ''
      
        'SELECT Data0017.INV_PART_NUMBER,Data0017.INV_NAME,Data0017.INV_D' +
        'ESCRIPTION,Data0496.GROUP_NAME,Data0134.SUPPLIER2,'
      
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
      '   and  (Data0017.INV_PART_NUMBER = :ivname)'
      
        'GROUP BY Data0017.INV_PART_NUMBER,Data0017.INV_NAME,Data0017.INV' +
        '_DESCRIPTION,Data0496.GROUP_NAME,Data0002.UNIT_CODE,'
      
        ' Data0134.SUPPLIER2, Data0071.reason, Data0134.BARCODE_ID, Data0' +
        '023.ABBR_NAME,Data0019.inv_group_name,Data0016.LOCATION'
      'ORDER BY Data0017.INV_PART_NUMBER, Data0017.INV_DESCRIPTION')
    Left = 252
    Top = 116
    object AQStockQtyINV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      ReadOnly = True
      Size = 25
    end
    object AQStockQtyINV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      ReadOnly = True
      Size = 30
    end
    object AQStockQtyINV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      ReadOnly = True
      Size = 70
    end
    object AQStockQtyGROUP_NAME: TStringField
      DisplayLabel = #26448#26009#32423#21035
      FieldName = 'GROUP_NAME'
      ReadOnly = True
      Size = 10
    end
    object AQStockQtyinv_group_name: TStringField
      DisplayLabel = #26448#26009#31867#21035
      FieldName = 'inv_group_name'
      ReadOnly = True
    end
    object AQStockQtyABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      FieldName = 'ABBR_NAME'
      ReadOnly = True
      Size = 16
    end
    object AQStockQtyquan_total: TBCDField
      DisplayLabel = #24211#23384#25968#37327
      FieldName = 'quan_total'
      ReadOnly = True
      Precision = 38
    end
    object AQStockQtyavl_price: TFloatField
      DisplayLabel = #24179#22343#21547#31246#20215#26684'('#26412#24065#20301')'
      FieldName = 'avl_price'
      ReadOnly = True
    end
    object AQStockQtyamount: TBCDField
      DisplayLabel = #21547#31246#37329#39069'('#26412#24065#20301')'
      FieldName = 'amount'
      ReadOnly = True
      Precision = 38
      Size = 8
    end
    object AQStockQtyLOCATION: TStringField
      DisplayLabel = #20179#24211
      FieldName = 'LOCATION'
      ReadOnly = True
    end
    object AQStockQtytype: TStringField
      DisplayLabel = #24211#23384#31867#22411
      FieldName = 'type'
      ReadOnly = True
      Size = 8
    end
    object AQStockQtyUNIT_CODE: TStringField
      DisplayLabel = #23384#36135#21333#20301
      FieldName = 'UNIT_CODE'
      ReadOnly = True
      Size = 5
    end
    object AQStockQtyreason: TStringField
      DisplayLabel = #35831#36141#21407#22240
      FieldName = 'reason'
      ReadOnly = True
      Size = 60
    end
    object AQStockQtyBARCODE_ID: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'BARCODE_ID'
      ReadOnly = True
      Size = 50
    end
    object AQStockQtySUPPLIER2: TStringField
      DisplayLabel = #21407#20379#24212#21830
      FieldName = 'SUPPLIER2'
      ReadOnly = True
      Size = 30
    end
  end
  object DsStockQyt: TDataSource
    DataSet = AQStockQty
    Left = 352
    Top = 116
  end
end
