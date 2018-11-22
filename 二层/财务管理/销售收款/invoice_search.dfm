object Form_invoice: TForm_invoice
  Left = 236
  Top = 126
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24212#25910#21457#31080#26597#25214
  ClientHeight = 492
  ClientWidth = 644
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
    Width = 644
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
        FieldName = 'invoice_number'
        Title.Color = clRed
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'type'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INVOICE_DATE'
        ReadOnly = False
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'due_date'
        ReadOnly = False
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INVOICE_TOTAL'
        ReadOnly = False
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXCHANGE_RATE'
        ReadOnly = False
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'yisou'
        ReadOnly = False
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'yinsou'
        ReadOnly = False
        Width = 66
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 238
    Top = 459
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 318
    Top = 459
    Width = 75
    Height = 25
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
      'SELECT invoice_number, due_date, INVOICE_TOTAL, EXCHANGE_RATE,da' +
      'ta0112.rkey,'#13#10'amount_paid + CASH_DISC AS yisou,'#13#10'INVOICE_TOTAL -' +
      ' amount_paid - CASH_DISC AS yinsou,'#13#10'case invoice_type when 1 th' +
      'en '#39#26631#20934#21457#31080#39' when 2 then '#39#24037#20855#21457#31080#39#13#10' when 3 then '#39#26434#39033#21457#31080#39' end as type,'#13#10 +
      'data0001.CURR_NAME,data0112.INVOICE_DATE'#13#10'FROM dbo.Data0112 inne' +
      'r join data0001'#13#10'on data0112.currency_ptr=data0001.rkey'#13#10'WHERE (' +
      'INVOICE_STATUS = 1)'#13#10'and INVOICE_TOTAL > 0'#13#10'and CUSTOMER_PTR = :' +
      'rkey10'#13#10'and CURRENCY_PTR = :rkey01'#13#10
    IndexFieldNames = 'invoice_number'
    Parameters = <
      item
        Name = 'rkey10'
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
    Left = 104
    Top = 448
    object ADODataSet1invoice_number: TStringField
      DisplayLabel = #21457#31080#32534#21495
      FieldName = 'invoice_number'
      FixedChar = True
      Size = 12
    end
    object ADODataSet1due_date: TDateTimeField
      DisplayLabel = #21040#26399#26085#26399
      FieldName = 'due_date'
    end
    object ADODataSet1INVOICE_TOTAL: TBCDField
      DisplayLabel = #21457#31080#37329#39069
      FieldName = 'INVOICE_TOTAL'
      Precision = 19
    end
    object ADODataSet1EXCHANGE_RATE: TFloatField
      DisplayLabel = #20837#24080#27719#29575
      FieldName = 'EXCHANGE_RATE'
    end
    object ADODataSet1yisou: TBCDField
      DisplayLabel = #24050#25910#37329#39069
      FieldName = 'yisou'
      ReadOnly = True
      Precision = 19
    end
    object ADODataSet1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADODataSet1yinsou: TBCDField
      DisplayLabel = #24212#25910#37329#39069
      FieldName = 'yinsou'
      ReadOnly = True
      Precision = 19
    end
    object ADODataSet1type: TStringField
      DisplayLabel = #21457#31080#31867#22411
      FieldName = 'type'
      ReadOnly = True
      Size = 8
    end
    object ADODataSet1CURR_NAME: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_NAME'
    end
    object ADODataSet1INVOICE_DATE: TDateTimeField
      DisplayLabel = #21457#31080#26085#26399
      FieldName = 'INVOICE_DATE'
    end
  end
end
