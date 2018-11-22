object Form_rma: TForm_rma
  Left = 284
  Top = 154
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #23458#25143#36864#36135#26597#25214
  ClientHeight = 490
  ClientWidth = 678
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
    Width = 675
    Height = 417
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ReadOnly = True
    TabOrder = 1
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
        FieldName = 'sys_date'
        ReadOnly = False
        Width = 90
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
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUCT_NAME'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUCT_DESC'
        Width = 130
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
        FieldName = 'PART_PRICE'
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
      end>
  end
  object Button1: TButton
    Left = 267
    Top = 459
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 347
    Top = 459
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 3
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
      'SELECT t98.RMA_NUMBER, t98.RMA_DATE,'#13#10#9't70.sales_order, t8.PROD_' +
      'CODE,'#13#10#9't8.PRODUCT_NAME,t8.PRODUCT_DESC,'#13#10#9't71.tax_rate as RUSH_' +
      'CHARGE,t98.Putaway_date as sys_date,'#13#10#9't98.QTY_RECD,t71.price as' +
      ' PART_PRICE, '#39'Y'#39' as tax_in_price'#13#10'FROM dbo.Data0098 t98'#13#10'INNER J' +
      'OIN WZCP0063 t63 ON t98.SO_SHIP_PTR = t63.rkey'#13#10'INNER JOIN Data0' +
      '008 t8  ON t63.prod_ptr = t8.RKEY'#13#10'INNER JOIN WZCP0070 t70 ON t9' +
      '8.SO_PTR = t70.rkey'#13#10'INNER JOIN WZCP0071 t71 ON t70.rkey = t71.s' +
      'o_ptr And t63.cp71_ptr = t71.rkey'#13#10'WHERE (t98.RMA_STATUS = 3)'#13#10' ' +
      '        and (t98.CUSTOMER_PTR=:rkey10)'#13#10'         and (t70.curren' +
      'cy_ptr=:rkey01)'
    IndexFieldNames = 'RMA_NUMBER'
    Parameters = <
      item
        Name = 'rkey10'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end
      item
        Name = 'rkey01'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
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
    object ADODataSet1PART_PRICE: TFloatField
      DisplayLabel = #20215#26684
      FieldName = 'PART_PRICE'
    end
    object ADODataSet1tax_in_price: TStringField
      DisplayLabel = #20215#26684#21547#31246
      FieldName = 'tax_in_price'
      ReadOnly = True
      Size = 1
    end
    object ADODataSet1RUSH_CHARGE: TBCDField
      DisplayLabel = #31246#29575'%'
      FieldName = 'RUSH_CHARGE'
      Precision = 5
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
    object ADODataSet1sys_date: TDateTimeField
      DisplayLabel = #20837#24211#26085#26399
      FieldName = 'sys_date'
    end
  end
end
