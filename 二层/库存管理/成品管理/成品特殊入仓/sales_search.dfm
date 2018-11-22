object Form4: TForm4
  Left = 236
  Top = 152
  Width = 830
  Height = 517
  Caption = #22806#21457#35746#21333#25628#32034
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 437
    Width = 814
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      814
      41)
    object Button1: TButton
      Left = 320
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 423
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 814
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 150
      Top = 17
      Width = 138
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #35746#21333#21495
    end
    object Edit1: TEdit
      Left = 292
      Top = 13
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
      OnKeyDown = DBGrid1KeyDown
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 814
    Height = 396
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
        FieldName = 'SALES_ORDER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'manu_PART_NUMBER'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'manu_PART_DESC'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SCH_DATE'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PARTS_ORDERED'
        ReadOnly = False
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REPUT_APPR_BY'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PARTS_SHIPPED'
        ReadOnly = False
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = #27424#36135#25968#37327
        ReadOnly = False
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'supp_ABBRNAME'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WAREHOUSE_CODE'
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    OnDataChange = DataSource1DataChange
    Left = 520
    Top = 280
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     TOP (100) PERCENT dbo.Data0060.RKEY, dbo.Data0060.CUS' +
        'TOMER_PTR, dbo.Data0060.SALES_ORDER, dbo.Data0060.CUST_PART_PTR,' +
        ' '
      
        '                      dbo.Data0060.PARTS_ORDERED, dbo.Data0060.S' +
        'TATUS, dbo.Data0060.DUE_DATE, dbo.Data0060.SCH_DATE, dbo.Data006' +
        '0.PARTS_SHIPPED, dbo.Data0060.PARTS_ALLOC,'
      
        '                      dbo.Data0010.ABBR_NAME, dbo.Data0010.CUST_' +
        'CODE, dbo.Data0010.CUSTOMER_NAME, dbo.Data0097.PO_NUMBER, dbo.Da' +
        'ta0025.MANU_PART_DESC, '
      
        '                      dbo.Data0025.MANU_PART_NUMBER, dbo.Data006' +
        '0.PARTS_ORDERED - dbo.Data0060.PARTS_SHIPPED AS '#27424#36135#25968#37327', isnull(dat' +
        'a0060.REPUT_APPR_BY,0) as REPUT_APPR_BY,'
      
        '                      dbo.Data0023.ABBR_NAME AS supp_ABBRNAME, d' +
        'bo.Data0015.RKEY AS rkey15, dbo.Data0015.WAREHOUSE_CODE, dbo.Dat' +
        'a0015.ABBR_NAME AS abbrname,'
      
        '                    data0060.PARTS_RETURNED,data0060.EXCH_RATE,d' +
        'bo.Data0025.ttype,'
      
        ' data0060.PARTS_ALLOC*data0060.tax_2*0.01/data0060.EXCH_RATE  as' +
        ' cost_pcs'
      'FROM         dbo.Data0060 INNER JOIN'
      
        '                      dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDE' +
        'R_PTR = dbo.Data0097.RKEY INNER JOIN'
      
        '                      dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR' +
        ' = dbo.Data0025.RKEY INNER JOIN'
      
        '                      dbo.Data0010 ON dbo.Data0060.CUSTOMER_PTR ' +
        '= dbo.Data0010.RKEY INNER JOIN'
      
        '                      dbo.Data0015 ON dbo.Data0060.SHIP_REG_TAX_' +
        'ID = dbo.Data0015.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0023 ON dbo.Data0060.supplier_ptr ' +
        '= dbo.Data0023.RKEY'
      
        'WHERE     (dbo.Data0060.PROD_REL <> 1) AND (dbo.Data0060.STATUS ' +
        '= 1) AND (dbo.Data0060.so_tp = 1)'
      'ORDER BY dbo.Data0060.SALES_ORDER')
    Left = 562
    Top = 279
    object ADOQuery1RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQuery1CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object ADOQuery1SALES_ORDER: TStringField
      DisplayLabel = #35746#21333#21495
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ADOQuery1CUST_PART_PTR: TIntegerField
      FieldName = 'CUST_PART_PTR'
    end
    object ADOQuery1PARTS_ORDERED: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'PARTS_ORDERED'
    end
    object ADOQuery1STATUS: TWordField
      FieldName = 'STATUS'
    end
    object ADOQuery1DUE_DATE: TDateTimeField
      FieldName = 'DUE_DATE'
    end
    object ADOQuery1SCH_DATE: TDateTimeField
      DisplayLabel = #22238#22797#20132#26399
      FieldName = 'SCH_DATE'
    end
    object ADOQuery1PARTS_SHIPPED: TFloatField
      DisplayLabel = #24050#25351#27966#25968#37327
      FieldName = 'PARTS_SHIPPED'
    end
    object ADOQuery1ABBR_NAME: TStringField
      DisplayLabel = #23458#25143
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOQuery1CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADOQuery1CUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object ADOQuery1PO_NUMBER: TStringField
      DisplayLabel = #23458#25143#35746#21333#21495
      DisplayWidth = 25
      FieldName = 'PO_NUMBER'
      Size = 100
    end
    object ADOQuery1DSDesigner: TFloatField
      FieldName = #27424#36135#25968#37327
      ReadOnly = True
    end
    object ADOQuery1manu_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'manu_PART_DESC'
      Size = 40
    end
    object ADOQuery1manu_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'manu_PART_NUMBER'
    end
    object ADOQuery1supp_ABBRNAME: TStringField
      DisplayLabel = #22806#21457#20379#24212#21830
      FieldName = 'supp_ABBRNAME'
      Size = 16
    end
    object ADOQuery1rkey15: TIntegerField
      FieldName = 'rkey15'
      ReadOnly = True
    end
    object ADOQuery1WAREHOUSE_CODE: TStringField
      DisplayLabel = #24037#21378#20195#30721
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ADOQuery1abbrname: TStringField
      FieldName = 'abbrname'
      Size = 10
    end
    object ADOQuery1PARTS_ALLOC: TFloatField
      FieldName = 'PARTS_ALLOC'
    end
    object ADOQuery1REPUT_APPR_BY: TIntegerField
      DisplayLabel = #24050#25552#20132#20837#24211#25968
      FieldName = 'REPUT_APPR_BY'
    end
    object ADOQuery1PARTS_RETURNED: TFloatField
      FieldName = 'PARTS_RETURNED'
    end
    object ADOQuery1EXCH_RATE: TFloatField
      FieldName = 'EXCH_RATE'
    end
    object ADOQuery1ttype: TWordField
      FieldName = 'ttype'
      Visible = False
    end
    object ADOQuery1cost_pcs: TFloatField
      DisplayLabel = #20837#24211#25104#26412#20215
      FieldName = 'cost_pcs'
      ReadOnly = True
    end
  end
end
