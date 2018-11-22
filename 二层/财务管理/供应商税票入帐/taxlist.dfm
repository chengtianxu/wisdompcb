object Form_taxlist: TForm_taxlist
  Left = 382
  Top = 199
  Width = 780
  Height = 544
  Caption = #20379#24212#21830#31246#31080#25628#32034
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
    Top = 467
    Width = 764
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      764
      39)
    object Button1: TButton
      Left = 288
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #30830#23450
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 378
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
    Width = 764
    Height = 467
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 1
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
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'invoice_no'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'invoice_date'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'account_date'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'matl_year'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'matl_month'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MATL_amount'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tax_amount'
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tax'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_TOTAL'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'remark'
        Width = 87
        Visible = True
      end>
  end
  object ads127: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT     invoice_number, invoice_no, invoice_date, account_dat' +
      'e, matl_year, matl_month, MATL_amount, tax_amount, tax, INV_TOTA' +
      'L, remark, rkey'#13#10'FROM         dbo.DATA0127'#13#10'where GLPTR_STATUS=0'
    Parameters = <>
    Prepared = True
    Left = 120
    Top = 96
    object ads127invoice_number: TStringField
      DisplayLabel = #21457#31080#32534#30721
      FieldName = 'invoice_number'
    end
    object ads127invoice_no: TStringField
      DisplayLabel = #21457#31080#21495#30721
      FieldName = 'invoice_no'
      Size = 10
    end
    object ads127invoice_date: TDateTimeField
      DisplayLabel = #21457#31080#26085#26399
      FieldName = 'invoice_date'
    end
    object ads127account_date: TDateTimeField
      DisplayLabel = #23545#24080#26085#26399
      FieldName = 'account_date'
    end
    object ads127matl_year: TSmallintField
      DisplayLabel = #36135#27454#24180#24230
      FieldName = 'matl_year'
    end
    object ads127matl_month: TSmallintField
      DisplayLabel = #36135#27454#26376#20221
      FieldName = 'matl_month'
    end
    object ads127MATL_amount: TBCDField
      DisplayLabel = #19981#21547#31246#37329#39069
      FieldName = 'MATL_amount'
      Precision = 11
      Size = 2
    end
    object ads127tax_amount: TBCDField
      DisplayLabel = #31246#37329
      FieldName = 'tax_amount'
      Precision = 10
      Size = 2
    end
    object ads127tax: TBCDField
      DisplayLabel = #31246#29575'%'
      FieldName = 'tax'
      Precision = 10
      Size = 2
    end
    object ads127INV_TOTAL: TBCDField
      DisplayLabel = #24635#35745#37329#39069
      FieldName = 'INV_TOTAL'
      Precision = 11
      Size = 2
    end
    object ads127remark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 100
    end
    object ads127rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
  end
  object DataSource1: TDataSource
    DataSet = ads127
    OnDataChange = DataSource1DataChange
    Left = 88
    Top = 96
  end
end
