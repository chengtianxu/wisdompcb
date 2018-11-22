object Form_custrma: TForm_custrma
  Left = 242
  Top = 119
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #23458#25143#36864#36135#26597#35810
  ClientHeight = 547
  ClientWidth = 739
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
  object Label1: TLabel
    Left = 202
    Top = 11
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #21457#31080#32534#21495':'
  end
  object Edit1: TEdit
    Left = 264
    Top = 6
    Width = 121
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 32
    Width = 735
    Height = 474
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
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
        FieldName = 'RMA_NUMBER'
        Title.Color = clRed
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RMA_DATE'
        ReadOnly = False
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Putaway_date'
        ReadOnly = False
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sales_order'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROD_CODE'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUCT_NAME'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUCT_DESC'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTY_RECD'
        ReadOnly = False
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'price'
        ReadOnly = False
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RUSH_CHARGE'
        ReadOnly = False
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tax_in_price'
        ReadOnly = False
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUST_CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        Width = 44
        Visible = True
      end>
  end
  object Button2: TButton
    Left = 291
    Top = 513
    Width = 75
    Height = 25
    Caption = #20851#38381
    ModalResult = 2
    TabOrder = 2
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 72
    Top = 448
  end
  object ADODataSet1: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'Select t98.RMA_NUMBER,t98.RMA_DATE,'#13#10't70.sales_order,t8.PROD_COD' +
      'E,t8.PRODUCT_NAME,t8.PRODUCT_DESC,'#13#10't98.QTY_RECD,t71.price,'#13#10#39'Y'#39 +
      ' as tax_in_price, t10.CUST_CODE, t10.ABBR_NAME, '#13#10't1.CURR_NAME, ' +
      't71.tax_rate as RUSH_CHARGE, t98.Putaway_date'#13#10'From Data0098 t98' +
      #13#10'INNER JOIN WZCP0063 t63 ON t98.SO_SHIP_PTR = t63.rkey'#13#10'INNER J' +
      'OIN Data0008 t8  ON t63.prod_ptr = t8.RKEY'#13#10'INNER JOIN WZCP0070 ' +
      't70 ON t98.SO_PTR = t70.rkey'#13#10'INNER JOIN WZCP0071 t71 ON t70.rke' +
      'y = t71.so_ptr And t63.cp71_ptr = t71.rkey'#13#10'INNER JOIN Data0010 ' +
      't10 ON t98.CUSTOMER_PTR = t10.RKEY'#13#10'INNER JOIN Data0001 t1  ON t' +
      '70.currency_ptr = t1.RKEY'#13#10'WHERE t98.RMA_STATUS = 3'
    IndexFieldNames = 'RMA_NUMBER'
    Parameters = <>
    Left = 104
    Top = 448
    object ADODataSet1RMA_NUMBER: TStringField
      DisplayLabel = 'RMA'#21495#30721
      FieldName = 'RMA_NUMBER'
      Size = 10
    end
    object ADODataSet1RMA_DATE: TDateTimeField
      DisplayLabel = #36864#36135#26085#26399
      FieldName = 'RMA_DATE'
    end
    object ADODataSet1sales_order: TStringField
      DisplayLabel = #38144#21806#35746#21333
      FieldName = 'sales_order'
      Size = 12
    end
    object ADODataSet1QTY_RECD: TBCDField
      DisplayLabel = #36864#36135#25968#37327
      FieldName = 'QTY_RECD'
      Precision = 10
      Size = 2
    end
    object ADODataSet1price: TBCDField
      DisplayLabel = #20215#26684
      FieldName = 'price'
      Precision = 10
      Size = 2
    end
    object ADODataSet1tax_in_price: TStringField
      DisplayLabel = #20215#26684#21547#31246
      FieldName = 'tax_in_price'
      ReadOnly = True
      Size = 1
    end
    object ADODataSet1CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADODataSet1ABBR_NAME: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADODataSet1CURR_NAME: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_NAME'
    end
    object ADODataSet1RUSH_CHARGE: TBCDField
      DisplayLabel = #31246#29575'%'
      FieldName = 'RUSH_CHARGE'
      Precision = 4
      Size = 2
    end
    object ADODataSet1PROD_CODE: TStringField
      DisplayLabel = #20135#21697#32534#21495
      FieldName = 'PROD_CODE'
      Size = 15
    end
    object ADODataSet1PRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#21517#31216
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADODataSet1PRODUCT_DESC: TStringField
      DisplayLabel = #20135#21697#35268#26684
      FieldName = 'PRODUCT_DESC'
      Size = 200
    end
    object ADODataSet1Putaway_date: TDateTimeField
      DisplayLabel = #20837#24211#26085#26399
      FieldName = 'Putaway_date'
    end
  end
end
