object Form_ASSIGN: TForm_ASSIGN
  Left = 285
  Top = 188
  Width = 819
  Height = 513
  Caption = #35013#36816#25351#27966#25628#32034
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
    Width = 803
    Height = 395
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
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'SALES_ORDER'
        Title.Color = clRed
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_NUMBER'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'delivery_no'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHIPMENT_NO'
        Width = 28
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'invoice_number'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATE_ASSIGN'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_SHIPPED'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cost_2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cust_decl'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'date_sailing'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PARTS_ALLOC'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAX_2'
        Width = 29
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 436
    Width = 803
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      803
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
    Width = 803
    Height = 41
    Align = alTop
    TabOrder = 2
    object Label3: TLabel
      Left = 281
      Top = 13
      Width = 52
      Height = 13
      Caption = #38144#21806#35746#21333
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
      'SELECT     TOP (100) PERCENT dbo.Data0064.RKEY, dbo.Data0060.SAL' +
      'ES_ORDER, dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_' +
      'DESC, '#13#10'                      dbo.Data0097.PO_NUMBER, dbo.data04' +
      '39.delivery_no, dbo.data0439.date_sailing, dbo.Data0064.QUAN_SHI' +
      'PPED, dbo.Data0060.PARTS_ALLOC, data0064.DATE_ASSIGN,'#13#10'         ' +
      '             dbo.Data0064.cust_decl, dbo.Data0064.TAX_2, dbo.Dat' +
      'a0112.invoice_number, dbo.Data0064.SHIPMENT_NO, derivedtbl_1.cos' +
      't_2'#13#10'FROM         dbo.Data0064 INNER JOIN'#13#10'                     ' +
      ' dbo.Data0060 ON dbo.Data0064.SO_PTR = dbo.Data0060.RKEY INNER J' +
      'OIN'#13#10'                      dbo.Data0025 ON dbo.Data0060.CUST_PAR' +
      'T_PTR = dbo.Data0025.RKEY INNER JOIN'#13#10'                      dbo.' +
      'Data0097 ON dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY ' +
      'INNER JOIN'#13#10'                      dbo.data0439 ON dbo.Data0064.p' +
      'acking_list_ptr = dbo.data0439.rkey INNER JOIN'#13#10'                ' +
      '      dbo.Data0112 ON dbo.data0439.invoice_ptr = dbo.Data0112.RK' +
      'EY INNER JOIN'#13#10'                          (SELECT     dbo.Data005' +
      '2.SO_SHP_PTR,  '#13#10'                      SUM(dbo.Data0052.QUAN_SHP' +
      ' * ISNULL(dbo.Data0006.MATL_COST + dbo.Data0006.OVHD_COST, 0)) A' +
      'S cost_2'#13#10'FROM         dbo.Data0052 INNER JOIN'#13#10'                ' +
      '      dbo.Data0053 ON dbo.Data0052.DATA0053_PTR = dbo.Data0053.R' +
      'KEY INNER JOIN'#13#10'                      dbo.Data0064 ON dbo.Data00' +
      '52.SO_SHP_PTR = dbo.Data0064.RKEY INNER JOIN'#13#10'                  ' +
      '    dbo.Data0060 ON dbo.Data0064.SO_PTR = dbo.Data0060.RKEY LEFT' +
      ' OUTER JOIN'#13#10'                      dbo.Data0006 ON dbo.Data0053.' +
      'WORK_ORDER_PTR = dbo.Data0006.RKEY'#13#10'WHERE     (dbo.Data0064.GLPT' +
      'R_STAUTS2 = 0) and (data0060.customer_ptr=:cust_ptr)'#13#10'GROUP BY d' +
      'bo.Data0052.SO_SHP_PTR) AS derivedtbl_1 ON dbo.Data0064.RKEY = d' +
      'erivedtbl_1.SO_SHP_PTR'#13#10'WHERE     (dbo.Data0064.GLPTR_STAUTS2 = ' +
      '0) '#13#10'and (data0112.CUSTOMER_PTR=:cust_ptr1)'#13#10
    IndexFieldNames = 'SALES_ORDER'
    Parameters = <
      item
        Name = 'cust_ptr'
        DataType = ftInteger
        Size = 3
        Value = Null
      end
      item
        Name = 'cust_ptr1'
        DataType = ftInteger
        Size = 3
        Value = Null
      end>
    Prepared = True
    Left = 112
    Top = 264
    object ads64RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ads64SALES_ORDER: TStringField
      DisplayLabel = #38144#21806#35746#21333
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ads64MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ads64MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ads64PO_NUMBER: TStringField
      DisplayLabel = #23458#25143#35746#21333#21495
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ads64delivery_no: TStringField
      DisplayLabel = #35013#31665#21333#21495
      FieldName = 'delivery_no'
      Size = 10
    end
    object ads64date_sailing: TDateTimeField
      DisplayLabel = #20986#36135#26085#26399
      FieldName = 'date_sailing'
    end
    object ads64QUAN_SHIPPED: TIntegerField
      DisplayLabel = #25968#37327
      FieldName = 'QUAN_SHIPPED'
    end
    object ads64PARTS_ALLOC: TFloatField
      DisplayLabel = #20215#26684
      FieldName = 'PARTS_ALLOC'
    end
    object ads64TAX_2: TBCDField
      DisplayLabel = #31246#29575
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object ads64invoice_number: TStringField
      DisplayLabel = #21457#31080#21495
      FieldName = 'invoice_number'
      FixedChar = True
      Size = 12
    end
    object ads64SHIPMENT_NO: TSmallintField
      DisplayLabel = #25209#27425
      FieldName = 'SHIPMENT_NO'
    end
    object ads64cust_decl: TStringField
      DisplayLabel = #25253#20851#21333#21495
      FieldName = 'cust_decl'
      Size = 50
    end
    object ads64cost_2: TFloatField
      DisplayLabel = #25104#26412
      FieldName = 'cost_2'
      ReadOnly = True
    end
    object ads64DATE_ASSIGN: TDateTimeField
      DisplayLabel = #25351#27966#26085#26399
      FieldName = 'DATE_ASSIGN'
    end
  end
end
