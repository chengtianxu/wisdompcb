object Form_miscmatil: TForm_miscmatil
  Left = 243
  Top = 157
  Width = 834
  Height = 536
  Caption = #26434#39033#26448#26009#20837#24211#25628#32034
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 826
    Height = 38
    Align = alTop
    TabOrder = 0
    object Label3: TLabel
      Left = 281
      Top = 13
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #29289#21697#21517#31216
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 38
    Width = 826
    Height = 432
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 1
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
        FieldName = 'goods_name'
        Title.Color = clRed
        Width = 148
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'goods_guige'
        Width = 132
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'goods_type'
        Width = 73
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
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ship_DATE'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_RECD'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'unit_price'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'state_tax'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'amount'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tax_amount'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INVOICE_NO'
        Width = 76
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 470
    Width = 826
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      826
      39)
    object Button1: TButton
      Left = 310
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #30830#23450
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 407
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
  object DataSource1: TDataSource
    DataSet = ads235
    OnDataChange = DataSource1DataChange
    Left = 56
    Top = 264
  end
  object ads235: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.Data0235.RKEY, dbo.Data0235.goods_name, dbo.Data0' +
      '235.goods_guige, dbo.Data0456.GRN_NUMBER, dbo.Data0456.DELIVER_N' +
      'UMBER, '#13#10'                      dbo.Data0456.ship_DATE, dbo.Data0' +
      '235.QUAN_RECD, dbo.Data0002.UNIT_NAME, dbo.Data0235.unit_price, ' +
      'dbo.Data0235.state_tax, '#13#10'                      ROUND(dbo.Data02' +
      '35.QUAN_RECD * dbo.Data0235.unit_price, 2) AS amount, '#13#10'        ' +
      '              ROUND((dbo.Data0235.QUAN_RECD * dbo.Data0235.unit_' +
      'price * dbo.Data0235.state_tax * 0.01) / (1 + dbo.Data0235.state' +
      '_tax * 0.01), 2) AS tax_amount, '#13#10'                      dbo.Data' +
      '0107.INVOICE_NO,Data0235.goods_type,'#39'0'#39' AS sType'#13#10'FROM         d' +
      'bo.Data0235 INNER JOIN'#13#10'                      dbo.Data0456 ON db' +
      'o.Data0235.GRN_PTR = dbo.Data0456.RKEY INNER JOIN'#13#10'             ' +
      '         dbo.Data0002 ON dbo.Data0235.unit_ptr = dbo.Data0002.RK' +
      'EY INNER JOIN'#13#10'                      dbo.Data0107 ON dbo.Data045' +
      '6.dealiv_ptr = dbo.Data0107.RKEY'#13#10'WHERE   (data0107.STATUS = 1) ' +
      ' and  (Data0235.GLPTR_STATUS = 0)'#13#10'and (Data0107.GLPTR_STATUS = ' +
      '0)'#13#10
    IndexFieldNames = 'GRN_NUMBER'
    Parameters = <>
    Prepared = True
    Left = 88
    Top = 264
    object ads235RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ads235goods_name: TStringField
      DisplayLabel = #29289#21697#21517#31216
      FieldName = 'goods_name'
      Size = 60
    end
    object ads235goods_guige: TStringField
      DisplayLabel = #35268#26684
      FieldName = 'goods_guige'
      Size = 200
    end
    object ads235GRN_NUMBER: TStringField
      DisplayLabel = #20837#24211#21333#21495
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object ads235DELIVER_NUMBER: TStringField
      DisplayLabel = #36865#36135#21333#21495
      FieldName = 'DELIVER_NUMBER'
      Size = 15
    end
    object ads235ship_DATE: TDateTimeField
      DisplayLabel = #20837#24211#26085#26399
      FieldName = 'ship_DATE'
    end
    object ads235QUAN_RECD: TBCDField
      DisplayLabel = #25968#37327
      FieldName = 'QUAN_RECD'
      Precision = 10
      Size = 3
    end
    object ads235UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object ads235unit_price: TBCDField
      DisplayLabel = #21547#31246#20215
      FieldName = 'unit_price'
      Precision = 10
      Size = 3
    end
    object ads235state_tax: TBCDField
      DisplayLabel = #31246#29575
      FieldName = 'state_tax'
      Precision = 4
      Size = 2
    end
    object ads235amount: TBCDField
      DisplayLabel = #37329#39069
      FieldName = 'amount'
      ReadOnly = True
      Precision = 21
      Size = 6
    end
    object ads235tax_amount: TBCDField
      DisplayLabel = #31246#37329
      FieldName = 'tax_amount'
      ReadOnly = True
      Precision = 32
      Size = 15
    end
    object ads235INVOICE_NO: TStringField
      DisplayLabel = #21457#31080#32534#30721
      FieldName = 'INVOICE_NO'
      Size = 16
    end
    object ads235goods_type: TStringField
      DisplayLabel = #29289#21697#31867#22411
      FieldName = 'goods_type'
    end
    object ads235sType: TStringField
      FieldName = 'sType'
      ReadOnly = True
      Size = 1
    end
  end
end
