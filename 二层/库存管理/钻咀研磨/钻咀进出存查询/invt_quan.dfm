object Form4: TForm4
  Left = 186
  Top = 121
  Width = 876
  Height = 548
  Caption = #26448#26009#24211#23384#27719#24635
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 43
    Width = 868
    Height = 478
    Align = alClient
    DataSource = DataSource1
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'inv_group_name'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_PART_NUMBER'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inv_name'
        Width = 87
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
        FieldName = 'GROUP_NAME'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME23'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'supplier2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quan_total'
        Title.Alignment = taRightJustify
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'avl_price'
        ReadOnly = False
        Title.Alignment = taRightJustify
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'amount'
        Title.Alignment = taRightJustify
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'amount_notax'
        ReadOnly = False
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STOCK_BASE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total_weigth'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STOCK_SELL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total_area'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 868
    Height = 43
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      868
      43)
    object Label1: TLabel
      Left = 288
      Top = 16
      Width = 81
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #26448#26009#32534#30721
    end
    object Button1: TButton
      Left = 12
      Top = 8
      Width = 75
      Height = 25
      Caption = #36864#20986
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 92
      Top = 8
      Width = 75
      Height = 25
      Caption = #23548#20986'Excel'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 172
      Top = 8
      Width = 75
      Height = 25
      Caption = #25171#21360#25253#34920
      TabOrder = 2
      OnClick = Button3Click
    end
    object Edit1: TEdit
      Left = 373
      Top = 12
      Width = 204
      Height = 21
      BevelEdges = [beLeft, beTop, beBottom]
      TabOrder = 3
      OnChange = Edit1Change
    end
    object CheckBox1: TCheckBox
      Left = 648
      Top = 16
      Width = 153
      Height = 17
      Anchors = [akTop, akRight]
      Caption = #26174#31034#24211#23384#20026#38646#30340#26448#26009
      Checked = True
      State = cbChecked
      TabOrder = 4
      OnClick = Edit1Change
    end
  end
  object ADO22: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'SELECT Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME,'
      '      dbo.Data0017.INV_DESCRIPTION, dbo.Data0496.GROUP_NAME,'
      '      SUM(dbo.Data0022.QUAN_ON_HAND) AS quan_total,'
      
        'ROUND(avg(Data0022.tax_PRICE * Data0456.exch_rate), 4) AS avl_pr' +
        'ice,'
      
        'ROUND(SUM(Data0022.QUAN_ON_HAND * Data0022.tax_PRICE * Data0456.' +
        'exch_rate),4) AS amount,'
      
        'ROUND(SUM(Data0022.QUAN_ON_HAND * Data0022.PRICE * Data0456.exch' +
        '_rate),4) AS amount_notax,'
      'Data0002.UNIT_CODE,data0022.supplier2,'
      'Data0023.ABBR_NAME AS ABBR_NAME23,Data0019.inv_group_name,'
      'Data0017.STOCK_BASE, Data0017.STOCK_SELL,'
      
        'SUM(Data0022.QUAN_ON_HAND * Data0017.STOCK_BASE) AS total_weigth' +
        ','
      
        'ROUND(SUM(Data0022.QUAN_ON_HAND * Data0017.STOCK_SELL ), 4) AS t' +
        'otal_area,'
      'data0017.QUAN_ON_HAND,data0017.CONSIGN_ONHAND_QTY'
      'FROM dbo.Data0022 INNER JOIN'
      
        '      dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR = dbo.Data0017.' +
        'RKEY INNER JOIN'
      
        '      dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY' +
        ' INNER JOIN'
      
        '      dbo.Data0019 ON dbo.Data0496.group_ptr = dbo.Data0019.rkey' +
        ' INNER JOIN'
      '      dbo.Data0002 ON'
      
        '      dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0002.RKEY INNER J' +
        'OIN'
      
        '      dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY I' +
        'NNER JOIN'
      
        '      dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0016 ON dbo.Data0022.LOCATION_PTR = dbo.Data0016.R' +
        'KEY INNER JOIN'
      
        '      dbo.Data0015 ON dbo.Data0456.warehouse_ptr = dbo.Data0015.' +
        'RKEY'
      'WHERE (dbo.Data0022.QUAN_ON_HAND <> 0)'
      'GROUP BY dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME,'
      '      dbo.Data0017.INV_DESCRIPTION, dbo.Data0496.GROUP_NAME,'
      '      dbo.Data0002.UNIT_CODE, dbo.Data0023.ABBR_NAME,'
      '      dbo.Data0019.inv_group_name, dbo.Data0017.STOCK_BASE,'
      '      dbo.Data0017.STOCK_SELL,data0022.supplier2,'
      '      data0017.QUAN_ON_HAND,data0017.CONSIGN_ONHAND_QTY'
      'ORDER BY dbo.Data0017.INV_PART_NUMBER')
    Left = 400
    Top = 472
    object ADO22inv_group_name: TStringField
      DisplayLabel = #26448#26009#32452#21035
      FieldName = 'inv_group_name'
    end
    object ADO22INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      DisplayWidth = 29
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADO22inv_name: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'inv_name'
      Size = 30
    end
    object ADO22INV_PART_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      DisplayWidth = 100
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ADO22GROUP_NAME: TStringField
      DisplayLabel = #26448#26009#31867#21035
      DisplayWidth = 15
      FieldName = 'GROUP_NAME'
      Size = 10
    end
    object ADO22UNIT_CODE: TStringField
      DisplayLabel = #23384#36135#21333#20301
      DisplayWidth = 5
      FieldName = 'UNIT_CODE'
      Size = 5
    end
    object ADO22ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'ABBR_NAME23'
      Size = 10
    end
    object ADO22quan_total: TFloatField
      DisplayLabel = #24211#23384#25968#37327
      DisplayWidth = 18
      FieldName = 'quan_total'
    end
    object ADO22avl_price: TFloatField
      DisplayLabel = #24179#22343#20215#26684'('#21547#31246')'
      DisplayWidth = 15
      FieldName = 'avl_price'
      ReadOnly = True
      DisplayFormat = '0.0000'
    end
    object ADO22amount: TFloatField
      DisplayLabel = #37329#39069'('#26412#24065#21547#31246')'
      DisplayWidth = 15
      FieldName = 'amount'
    end
    object ADO22amount_notax: TBCDField
      DisplayLabel = #37329#39069'('#26412#24065#19981#21547#31246')'
      DisplayWidth = 10
      FieldName = 'amount_notax'
      ReadOnly = True
      Precision = 32
      Size = 8
    end
    object ADO22STOCK_BASE: TFloatField
      DisplayLabel = #21333#20301#37325#37327'KG'
      FieldName = 'STOCK_BASE'
    end
    object ADO22STOCK_SELL: TFloatField
      DisplayLabel = #21333#20301#38754#31215
      FieldName = 'STOCK_SELL'
    end
    object ADO22total_weigth: TFloatField
      DisplayLabel = #24211#23384#24635#37325'KG'
      FieldName = 'total_weigth'
    end
    object ADO22total_area: TFloatField
      DisplayLabel = #24211#23384#38754#31215
      FieldName = 'total_area'
      ReadOnly = True
    end
    object ADO22supplier2: TStringField
      DisplayLabel = #21407#21046#36896#21830
      FieldName = 'supplier2'
      Size = 10
    end
    object ADO22QUAN_ON_HAND: TBCDField
      FieldName = 'QUAN_ON_HAND'
      Precision = 19
    end
    object ADO22CONSIGN_ONHAND_QTY: TFloatField
      FieldName = 'CONSIGN_ONHAND_QTY'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADO22
    Left = 368
    Top = 473
  end
end
