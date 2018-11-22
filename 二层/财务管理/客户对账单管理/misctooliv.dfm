object Form_misctooliv: TForm_misctooliv
  Left = 290
  Top = 125
  Width = 836
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 440
    Width = 828
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      828
      39)
    object Button1: TButton
      Left = 276
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #30830#23450
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 460
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
    Width = 828
    Height = 37
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 250
      Top = 15
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #21457#31080#32534#21495
    end
    object Edit1: TEdit
      Left = 308
      Top = 11
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 37
    Width = 828
    Height = 403
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDrawColumnCell = DBGridEh1DrawColumnCell
    OnKeyDown = DBGridEh1KeyDown
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'invoice_number'
        Footers = <>
        Title.Color = clRed
        Title.SortIndex = 1
        Title.SortMarker = smUpEh
      end
      item
        EditButtons = <>
        FieldName = #31867#22411
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'INVOICE_DATE'
        Footers = <>
        Width = 81
      end
      item
        EditButtons = <>
        FieldName = 'TOOLING_CHARGES'
        Footers = <>
        Width = 81
      end
      item
        EditButtons = <>
        FieldName = 'ship_tax_amount'
        Footers = <>
        Width = 67
      end
      item
        EditButtons = <>
        FieldName = 'ship_amount'
        Footers = <>
        Width = 61
      end
      item
        EditButtons = <>
        FieldName = 'FED_TAX_AMOUNT'
        Footers = <>
        Width = 67
      end
      item
        EditButtons = <>
        FieldName = 'INVOICE_TOTAL'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'recon_amount'
        Footers = <>
        Title.Caption = #23545#24080#37329#39069
        Width = 75
      end
      item
        EditButtons = <>
        FieldName = 'all_amount'
        Footers = <>
        Title.Caption = #26410#23545#24080#37329#39069
        Width = 73
      end
      item
        EditButtons = <>
        FieldName = 'POSTED_DATE'
        Footers = <>
        Width = 75
      end
      item
        EditButtons = <>
        FieldName = 'abbr_name'
        Footers = <>
      end>
  end
  object ads112: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT   data0112.rkey,invoice_number,  INVOICE_DATE,'#13#10'TOOLING_C' +
      'HARGES, ship_tax_amount, INVOICE_TOTAL,'#13#10'CASE INVOICE_TYPE '#13#10'WHE' +
      'N 1 THEN '#39#26631#20934#21457#31080#39#13#10'WHEN 2 THEN '#39#24037#20855#21457#31080#39' '#13#10'WHEN 3 THEN '#39#26434#39033#21457#31080#39' END AS ' +
      #31867#22411','#13#10' INVOICE_TYPE,ship_amount,'#13#10'FED_TAX_AMOUNT,'#39#21457#31080#39' as ttype,re' +
      'con_amount,'#13#10'INVOICE_TOTAL-recon_amount as all_amount, POSTED_DA' +
      'TE,'#13#10'data0015.abbr_name'#13#10'FROM         dbo.Data0112 left outer jo' +
      'in data0015'#13#10'on data0112.warehouse_ptr=data0015.rkey'#13#10'WHERE  (IN' +
      'VOICE_STATUS = 1) AND (INVOICE_TOTAL-recon_amount>0)'#13#10
    IndexFieldNames = 'invoice_number'
    Parameters = <>
    Prepared = True
    Left = 112
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
      DisplayLabel = #21457#31080#37329#39069
      DisplayWidth = 10
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
    object ads112recon_amount: TBCDField
      FieldName = 'recon_amount'
      Precision = 19
    end
    object ads112all_amount: TBCDField
      DisplayLabel = #21487#29992#37329#39069
      FieldName = 'all_amount'
      ReadOnly = True
      Precision = 19
    end
    object ads112POSTED_DATE: TDateTimeField
      DisplayLabel = #21457#31080#26085#26399
      FieldName = 'POSTED_DATE'
    end
    object ads112abbr_name: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'abbr_name'
      Size = 10
    end
  end
  object DataSource1: TDataSource
    DataSet = ads112
    OnDataChange = DataSource1DataChange
    Left = 72
    Top = 88
  end
end
