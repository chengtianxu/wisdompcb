object Form_product: TForm_product
  Left = 194
  Top = 45
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  ClientHeight = 595
  ClientWidth = 589
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 136
    Top = 11
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #26412#21378#32534#21495':'
  end
  object Button1: TButton
    Left = 208
    Top = 564
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 2
  end
  object Button2: TButton
    Left = 288
    Top = 564
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 3
  end
  object Edit1: TEdit
    Left = 199
    Top = 7
    Width = 167
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object BitBtn1: TBitBtn
    Left = 373
    Top = 5
    Width = 25
    Height = 25
    Hint = #21047#26032
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    TabStop = False
    OnClick = BitBtn1Click
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000120B0000120B00001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
      DADABFBFBDADADADADADDADADBFADADADADAADADAD000DADADADDADAD0FBF0DA
      DADAADAD0F7FBF0DADADDAD0F7F87BF0DADAAD0F7F87BFB70DADD0F7F87BFB78
      80DA000F87BFB78880ADDAD00BFB78880ADAADADA0B7888740ADDADADA088804
      440AADADADA000A04440DADADADADADA0440ADADADADADADA00D}
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 35
    Width = 589
    Height = 517
    Ctl3D = True
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
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
        FieldName = 'MANU_PART_NUMBER'
        Title.Color = clRed
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Width = 162
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUCT_NAME'
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUST_CODE'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LAYERS'
        ReadOnly = False
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'batch_or_former'
        Width = 45
        Visible = True
      end>
  end
  object CheckBox1: TCheckBox
    Left = 424
    Top = 8
    Width = 121
    Height = 17
    Caption = #21482#26174#31034#26631#20934#27169#26495
    TabOrder = 5
    Visible = False
    OnClick = CheckBox1Click
  end
  object DataSource1: TDataSource
    DataSet = adoquery1
    Left = 407
    Top = 557
  end
  object adoquery1: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT data0025.rkey,Data0025.MANU_PART_NUMBER,'#13#10'              d' +
      'bo.Data0025.MANU_PART_DESC, dbo.Data0025.PROD_CODE_PTR,dbo.Data0' +
      '025.CUSTOMER_PTR,'#13#10'dbo.Data0025.PROD_ROUTE_PTR,dbo.Data0025.ONHO' +
      'LD_SALES_FLAG,'#13#10'  Data0008.PRODUCT_NAME, dbo.Data0010.CUST_CODE,' +
      ' '#13#10'dbo.Data0025.LAYERS, '#13#10'case   Data0025.ttype'#13#10'  when 0 then '#39 +
      #37327#20135#39' when 1 then '#39#26679#26495#39'  end as batch_or_former'#13#10'FROM dbo.Data0008 ' +
      'INNER JOIN'#13#10'      dbo.Data0025 ON '#13#10'      dbo.Data0008.RKEY = db' +
      'o.Data0025.PROD_CODE_PTR INNER JOIN'#13#10'      dbo.Data0010 ON dbo.D' +
      'ata0025.CUSTOMER_PTR = dbo.Data0010.RKEY'#13#10'where ( Data0025.MANU_' +
      'PART_NUMBER like :part_number ) '#13#10
    IndexFieldNames = 'MANU_PART_NUMBER'
    Parameters = <
      item
        Name = 'part_number'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = '%'
      end>
    Left = 440
    Top = 557
    object adoquery1rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object adoquery1MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object adoquery1MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object adoquery1PRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#31867#22411
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object adoquery1CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object adoquery1LAYERS: TWordField
      DisplayLabel = #23618#25968
      FieldName = 'LAYERS'
    end
    object adoquery1batch_or_former: TStringField
      DisplayLabel = #23646#24615
      FieldName = 'batch_or_former'
      ReadOnly = True
      Size = 4
    end
    object adoquery1PROD_CODE_PTR: TIntegerField
      FieldName = 'PROD_CODE_PTR'
    end
    object adoquery1CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object adoquery1PROD_ROUTE_PTR: TIntegerField
      FieldName = 'PROD_ROUTE_PTR'
    end
    object adoquery1ONHOLD_SALES_FLAG: TWordField
      FieldName = 'ONHOLD_SALES_FLAG'
    end
  end
end
