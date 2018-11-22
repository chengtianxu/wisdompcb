object Form_misctooliv: TForm_misctooliv
  Left = 305
  Top = 199
  Width = 675
  Height = 513
  Caption = #24037#20855','#26434#39033#21457#31080#25628#32034
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
  object Panel2: TPanel
    Left = 0
    Top = 436
    Width = 659
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      659
      39)
    object Button1: TButton
      Left = 243
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #30830#23450
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 321
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 659
    Height = 436
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
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
        FieldName = 'invoice_number'
        Visible = True
      end
      item
        Expanded = False
        FieldName = #31867#22411
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INVOICE_DATE'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOOLING_CHARGES'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ship_tax_amount'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ship_amount'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FED_TAX_AMOUNT'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INVOICE_TOTAL'
        Width = 77
        Visible = True
      end>
  end
  object ads112: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT   rkey,invoice_number,  INVOICE_DATE,'#13#10'TOOLING_CHARGES, s' +
      'hip_tax_amount, INVOICE_TOTAL,'#13#10'CASE INVOICE_TYPE '#13#10'WHEN 1 THEN ' +
      #39#26631#20934#21457#31080#39#13#10'WHEN 2 THEN '#39#24037#20855#21457#31080#39' '#13#10'WHEN 3 THEN '#39#26434#39033#21457#31080#39' END AS '#31867#22411','#13#10' INV' +
      'OICE_TYPE,ship_amount,'#13#10'FED_TAX_AMOUNT'#13#10'FROM         dbo.Data011' +
      '2'#13#10'WHERE  (INVOICE_STATUS = 1) '#13#10'AND (INVOICE_TYPE = 1)'#13#10
    IndexFieldNames = 'invoice_number'
    Parameters = <>
    Prepared = True
    Left = 104
    Top = 88
    object ads112rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ads112invoice_number: TStringField
      DisplayLabel = #21457#31080#32534#21495
      FieldName = 'invoice_number'
      FixedChar = True
      Size = 12
    end
    object ads112INVOICE_DATE: TDateTimeField
      DisplayLabel = #24080#40836#26085#26399
      FieldName = 'INVOICE_DATE'
    end
    object ads112TOOLING_CHARGES: TBCDField
      DisplayLabel = #24037#20855#36153#29992
      FieldName = 'TOOLING_CHARGES'
      Precision = 19
    end
    object ads112ship_tax_amount: TBCDField
      DisplayLabel = #24037#20855#31246#37329
      FieldName = 'ship_tax_amount'
      Precision = 19
    end
    object ads112INVOICE_TOTAL: TBCDField
      DisplayLabel = #24635#35745#37329#39069
      FieldName = 'INVOICE_TOTAL'
      Precision = 19
    end
    object ads112DSDesigner: TStringField
      FieldName = #31867#22411
      ReadOnly = True
      Size = 8
    end
    object ads112INVOICE_TYPE: TWordField
      FieldName = 'INVOICE_TYPE'
    end
    object ads112ship_amount: TBCDField
      DisplayLabel = #20986#36135#20215#27454
      FieldName = 'ship_amount'
      Precision = 19
    end
    object ads112FED_TAX_AMOUNT: TBCDField
      DisplayLabel = #20986#36135#31246#37329
      FieldName = 'FED_TAX_AMOUNT'
      Precision = 19
    end
  end
  object DataSource1: TDataSource
    DataSet = ads112
    OnDataChange = DataSource1DataChange
    Left = 72
    Top = 88
  end
end
