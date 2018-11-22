object Form_StockSearch: TForm_StockSearch
  Left = 200
  Top = 107
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26377#25928#24211#23384#26597#25214
  ClientHeight = 422
  ClientWidth = 835
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 835
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 204
      Top = 15
      Width = 60
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #26448#26009#32534#30721
    end
    object Edit1: TEdit
      Left = 271
      Top = 11
      Width = 169
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 381
    Width = 835
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      835
      41)
    object Button1: TButton
      Left = 309
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #21457#25918
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 416
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #36864#20986
      ModalResult = 2
      TabOrder = 1
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 835
    Height = 340
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
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
        FieldName = 'INV_PART_NUMBER'
        Title.Caption = #26448#26009#32534#30721
        Title.Color = clRed
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_NAME'
        Title.Caption = #26448#26009#21517#31216
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_DESCRIPTION'
        Title.Caption = #26448#26009#35268#26684
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCATION'
        Title.Caption = #23384#20179#20301#32622
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Title.Caption = #21333#20301
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_ON_HAND'
        ReadOnly = False
        Title.Caption = #24211#23384#25968#37327
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Title.Caption = #20379#24212#21830
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXPIRE_DATE'
        ReadOnly = False
        Title.Caption = #26377#25928#26399
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'barcode_id'
        Title.Caption = #22791#27880
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUPPLIER2'
        Title.Caption = #20379#24212#21830#29289#26009#25209#27425
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rohs'
        Title.Caption = #29615#20445
        Width = 57
        Visible = True
      end>
  end
  object ADS134: TADODataSet
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'SELECT dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, '#13#10'  ' +
      '    dbo.Data0017.INV_DESCRIPTION, dbo.Data0016.LOCATION, '#13#10'     ' +
      ' dbo.Data0002.UNIT_NAME, dbo.Data0134.QUAN_ON_HAND, '#13#10'      dbo.' +
      'Data0134.EXPIRE_DATE, dbo.Data0134.rohs, dbo.Data0023.ABBR_NAME,' +
      ' '#13#10'      dbo.Data0134.SUPPLIER2, dbo.Data0017.STD_COST, '#13#10'      ' +
      'dbo.Data0134.INVENTORY_PTR, dbo.Data0134.RKEY,data0134.barcode_i' +
      'd,'#13#10'      dbo.data0134.tax_price,dbo.data0134.tax_2'#13#10'FROM dbo.Da' +
      'ta0134 INNER JOIN'#13#10'      dbo.Data0016 ON dbo.Data0134.LOCATION_P' +
      'TR = dbo.Data0016.RKEY INNER JOIN'#13#10'      dbo.Data0017 ON dbo.Dat' +
      'a0134.INVENTORY_PTR = dbo.Data0017.RKEY INNER JOIN'#13#10'      dbo.Da' +
      'ta0002 ON dbo.Data0134.UNIT_PTR= dbo.Data0002.RKEY INNER JOIN'#13#10' ' +
      '     dbo.Data0133 ON dbo.Data0134.GRN_PTR = dbo.Data0133.RKEY IN' +
      'NER JOIN'#13#10'      dbo.Data0023 ON dbo.Data0133.SUPP_PTR = dbo.Data' +
      '0023.RKEY'#13#10'WHERE (dbo.Data0134.QUAN_ON_HAND > 0)  and (data0133.' +
      'supp_ptr=:rkey23) and (data0133.currency_ptr=:rkey01)'#13#10
    IndexFieldNames = 'INV_PART_NUMBER'
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
    Left = 232
    Top = 392
    object ADS134INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADS134INV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ADS134INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ADS134LOCATION: TStringField
      FieldName = 'LOCATION'
    end
    object ADS134UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object ADS134QUAN_ON_HAND: TBCDField
      FieldName = 'QUAN_ON_HAND'
      Precision = 19
    end
    object ADS134EXPIRE_DATE: TDateTimeField
      FieldName = 'EXPIRE_DATE'
    end
    object ADS134rohs: TStringField
      FieldName = 'rohs'
      Size = 10
    end
    object ADS134ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object ADS134SUPPLIER2: TStringField
      FieldName = 'SUPPLIER2'
      Size = 30
    end
    object ADS134STD_COST: TFloatField
      FieldName = 'STD_COST'
    end
    object ADS134INVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object ADS134RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADS134barcode_id: TStringField
      FieldName = 'barcode_id'
      Size = 50
    end
    object ADS134tax_price: TBCDField
      FieldName = 'tax_price'
      Precision = 12
      Size = 3
    end
    object ADS134tax_2: TBCDField
      FieldName = 'tax_2'
      Precision = 4
      Size = 2
    end
  end
  object DataSource1: TDataSource
    DataSet = ADS134
    Left = 176
    Top = 391
  end
end
