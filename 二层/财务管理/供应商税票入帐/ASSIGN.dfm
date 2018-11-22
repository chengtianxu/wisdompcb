object Form_ASSIGN: TForm_ASSIGN
  Left = 285
  Top = 188
  Width = 819
  Height = 513
  Caption = #32534#30721#26448#26009#20837#24211#25628#32034
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 811
    Height = 406
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
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
        FieldName = 'INV_PART_NUMBER'
        Title.Color = clRed
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_PART_DESCRIPTION'
        Width = 173
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRN_NUMBER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DELIVER_NUMBER'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ship_DATE'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tax_price'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAX_2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTITY'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'amount'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tax_amount'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cust_decl'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INVOICE_NO'
        Width = 77
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 447
    Width = 811
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      811
      39)
    object Button1: TButton
      Left = 304
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #30830#23450
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 399
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Cancel = True
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
    object CheckBox1: TCheckBox
      Left = 35
      Top = 12
      Width = 57
      Height = 17
      Caption = #20840#36873
      TabOrder = 2
      OnClick = CheckBox1Click
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 811
    Height = 41
    Align = alTop
    TabOrder = 2
    object Label3: TLabel
      Left = 281
      Top = 13
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #26448#26009#32534#30721
    end
    object Edit1: TEdit
      Left = 338
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
  end
  object DataSource1: TDataSource
    DataSet = ads64
    OnDataChange = DataSource1DataChange
    Left = 56
    Top = 264
  end
  object ads64: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.Data0022.RKEY, dbo.Data0017.INV_PART_NUMBER, dbo.' +
      'Data0017.INV_PART_DESCRIPTION, '#13#10'dbo.Data0456.GRN_NUMBER, dbo.Da' +
      'ta0456.DELIVER_NUMBER, '#13#10'                      dbo.Data0456.ship' +
      '_DATE, dbo.Data0002.UNIT_NAME, '#13#10'dbo.Data0022.tax_price, dbo.Dat' +
      'a0022.TAX_2, dbo.Data0022.QUANTITY, '#13#10'                      ROUN' +
      'D(dbo.Data0022.QUANTITY * dbo.Data0022.tax_price, 2) AS amount, ' +
      #13#10'ROUND((dbo.Data0022.QUANTITY * dbo.Data0022.tax_price * dbo.Da' +
      'ta0022.TAX_2 * 0.01) '#13#10'                      / (1 + dbo.Data0022' +
      '.TAX_2 * 0.01), 2) AS tax_amount, dbo.Data0022.cust_decl, dbo.Da' +
      'ta0107.INVOICE_NO,'#39'0'#39' AS sType'#13#10'FROM         dbo.Data0002 INNER ' +
      'JOIN'#13#10'                      dbo.Data0022 ON dbo.Data0002.RKEY = ' +
      'dbo.Data0022.LOCATION_PTR_FROM INNER JOIN'#13#10'                     ' +
      ' dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY INNER ' +
      'JOIN'#13#10'                      dbo.Data0017 ON dbo.Data0022.INVENTO' +
      'RY_PTR = dbo.Data0017.RKEY INNER JOIN'#13#10'                      dbo' +
      '.Data0107 ON dbo.Data0456.dealiv_ptr = dbo.Data0107.RKEY'#13#10'WHERE ' +
      '  (data0107.STATUS = 1)  and  (Data0022.GLPTR_STATUS = 0)'#13#10'and (' +
      'Data0107.GLPTR_STATUS = 0)'#13#10
    IndexFieldNames = 'GRN_NUMBER'
    Parameters = <>
    Prepared = True
    Left = 112
    Top = 264
    object ads64RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ads64INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ads64INV_PART_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object ads64GRN_NUMBER: TStringField
      DisplayLabel = #20837#24211#21333#21495
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object ads64DELIVER_NUMBER: TStringField
      DisplayLabel = #36865#36135#21333#21495
      FieldName = 'DELIVER_NUMBER'
      Size = 15
    end
    object ads64ship_DATE: TDateTimeField
      DisplayLabel = #20837#24211#26085#26399
      FieldName = 'ship_DATE'
    end
    object ads64UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object ads64tax_price: TBCDField
      DisplayLabel = #21547#31246#20215
      FieldName = 'tax_price'
      Precision = 12
      Size = 3
    end
    object ads64TAX_2: TBCDField
      DisplayLabel = #31246#29575
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object ads64QUANTITY: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'QUANTITY'
    end
    object ads64amount: TFloatField
      DisplayLabel = #37329#39069
      FieldName = 'amount'
      ReadOnly = True
    end
    object ads64tax_amount: TFloatField
      DisplayLabel = #31246#37329
      FieldName = 'tax_amount'
      ReadOnly = True
    end
    object ads64cust_decl: TStringField
      DisplayLabel = #25253#20851#21333#21495
      FieldName = 'cust_decl'
      Size = 50
    end
    object ads64INVOICE_NO: TStringField
      DisplayLabel = #21457#31080#32534#30721
      FieldName = 'INVOICE_NO'
      Size = 16
    end
    object ads64sType: TStringField
      FieldName = 'sType'
      ReadOnly = True
      Size = 1
    end
  end
end
