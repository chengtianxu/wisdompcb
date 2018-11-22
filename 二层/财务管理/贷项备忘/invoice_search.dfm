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
        FieldName = 'SALES_ORDER'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_NUMBER'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Width = 118
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
      'SELECT dbo.Data0098.RMA_NUMBER, dbo.Data0098.RMA_DATE, '#13#10'      d' +
      'bo.Data0060.SALES_ORDER, Data0025.MANU_PART_NUMBER, '#13#10'      dbo.' +
      'Data0025.MANU_PART_DESC,data0098.Putaway_date as sys_date,'#13#10'    ' +
      '  dbo.Data0098.QTY_RECD, dbo.Data0060.PART_PRICE, dbo.Data0060.t' +
      'ax_in_price, '#13#10'      dbo.Data0098.tax_2 as RUSH_CHARGE'#13#10'FROM Dat' +
      'a0098 INNER JOIN Data0025 ON '#13#10'      Data0098.CUSTOMER_PART_PTR ' +
      '= Data0025.RKEY INNER JOIN'#13#10'      Data0060 ON dbo.Data0098.SO_PT' +
      'R = dbo.Data0060.RKEY'#13#10'WHERE (dbo.Data0098.RMA_STATUS = 3)'#13#10'    ' +
      ' AND  (dbo.Data0098.NOTE_PAD_PTR = 0)'#13#10'         and (data0098.CU' +
      'STOMER_PTR=:rkey10)'#13#10'         and (data0060.currency_ptr=:rkey01' +
      ')'#13#10'     and (data0060.SHIP_REG_TAX_ID=:rkey15)'
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
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end
      item
        Name = 'rkey15'
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
      FixedChar = True
      Size = 10
    end
    object ADODataSet1RMA_DATE: TDateTimeField
      DisplayLabel = #36864#36135#26085#26399
      FieldName = 'RMA_DATE'
    end
    object ADODataSet1SALES_ORDER: TStringField
      DisplayLabel = #38144#21806#35746#21333
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ADODataSet1QTY_RECD: TIntegerField
      DisplayLabel = #36864#36135#25968#37327
      FieldName = 'QTY_RECD'
    end
    object ADODataSet1PART_PRICE: TFloatField
      DisplayLabel = #20215#26684
      FieldName = 'PART_PRICE'
    end
    object ADODataSet1tax_in_price: TStringField
      DisplayLabel = #20215#26684#21547#31246
      FieldName = 'tax_in_price'
      FixedChar = True
      Size = 1
    end
    object ADODataSet1RUSH_CHARGE: TBCDField
      DisplayLabel = #31246#29575'%'
      FieldName = 'RUSH_CHARGE'
      Precision = 5
      Size = 2
    end
    object ADODataSet1MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADODataSet1MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADODataSet1sys_date: TDateTimeField
      DisplayLabel = #20837#24211#26085#26399
      FieldName = 'sys_date'
    end
  end
end
