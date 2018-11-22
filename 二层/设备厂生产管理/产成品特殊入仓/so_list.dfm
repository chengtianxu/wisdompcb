object Form_solist: TForm_solist
  Left = 419
  Top = 290
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #38144#21806#26126#32454
  ClientHeight = 371
  ClientWidth = 538
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
    Width = 538
    Height = 321
    Align = alTop
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'PROD_CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUCT_NAME'
        Width = 139
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qvl_qty'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODE'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'remark'
        Width = 155
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 176
    Top = 336
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 272
    Top = 336
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
  end
  object DataSource1: TDataSource
    DataSet = AqD63
    Left = 8
    Top = 331
  end
  object AqD63: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT dbo.Data0008.PROD_CODE, dbo.Data0008.PRODUCT_NAME, dbo.Da' +
      'ta0016.CODE, '#13#10'      dbo.Data0016.LOCATION, '#13#10'      dbo.WZCP0063' +
      '.quantity - dbo.WZCP0063.returen_qty AS qvl_qty, '#13#10'      dbo.WZC' +
      'P0063.remark, dbo.Data0002.UNIT_NAME, dbo.WZCP0063.prod_ptr, '#13#10' ' +
      '     dbo.WZCP0063.location_ptr'#13#10'FROM dbo.Data0008 INNER JOIN'#13#10'  ' +
      '    dbo.WZCP0063 ON dbo.Data0008.RKEY = dbo.WZCP0063.prod_ptr IN' +
      'NER JOIN'#13#10'      dbo.Data0016 ON dbo.WZCP0063.location_ptr = dbo.' +
      'Data0016.RKEY INNER JOIN'#13#10'      dbo.Data0002 ON dbo.Data0008.uni' +
      't_ptr = dbo.Data0002.RKEY'#13#10'WHERE (dbo.WZCP0063.so_ptr = :rkey) A' +
      'ND '#13#10'      (dbo.WZCP0063.quantity - dbo.WZCP0063.returen_qty > 0' +
      ')'
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 40
    Top = 331
    object AqD63PROD_CODE: TStringField
      DisplayLabel = #20135#21697#32534#30721
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object AqD63PRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#21517#31216
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object AqD63CODE: TStringField
      DisplayLabel = #20179#24211
      FieldName = 'CODE'
      FixedChar = True
      Size = 5
    end
    object AqD63remark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 50
    end
    object AqD63UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object AqD63qvl_qty: TBCDField
      DisplayLabel = #21487#36864#36135#25968#37327
      FieldName = 'qvl_qty'
      ReadOnly = True
      Precision = 11
      Size = 2
    end
    object AqD63prod_ptr: TIntegerField
      FieldName = 'prod_ptr'
    end
    object AqD63location_ptr: TIntegerField
      FieldName = 'location_ptr'
    end
    object AqD63LOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 10
    end
  end
end
