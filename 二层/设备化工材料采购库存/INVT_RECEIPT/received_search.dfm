object Form3: TForm3
  Left = 204
  Top = 179
  Width = 737
  Height = 532
  Caption = #25910#36135#26126#32454#26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 729
    Height = 46
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      729
      46)
    object Label1: TLabel
      Left = 168
      Top = 16
      Width = 88
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #36865#36135#21333#21495
    end
    object Button1: TButton
      Left = 8
      Top = 11
      Width = 75
      Height = 25
      Caption = #20851#38381
      ModalResult = 1
      TabOrder = 1
    end
    object Button2: TButton
      Left = 88
      Top = 11
      Width = 75
      Height = 25
      Caption = #23548#20986#25968#25454
      TabOrder = 2
      OnClick = Button2Click
    end
    object Edit1: TEdit
      Left = 265
      Top = 12
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
    object GroupBox2: TGroupBox
      Left = 448
      Top = 0
      Width = 259
      Height = 38
      Anchors = [akTop, akRight]
      Caption = #26085#26399#33539#22260
      TabOrder = 3
      object Label8: TLabel
        Left = 8
        Top = 17
        Width = 18
        Height = 13
        Alignment = taRightJustify
        Caption = ' '#20174':'
      end
      object Label9: TLabel
        Left = 136
        Top = 17
        Width = 18
        Height = 13
        Alignment = taRightJustify
        Caption = ' '#21040':'
      end
      object dtpk1: TDateTimePicker
        Left = 30
        Top = 13
        Width = 97
        Height = 21
        CalAlignment = dtaLeft
        Date = 37600
        Time = 37600
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 0
        OnCloseUp = dtpk1Exit
        OnExit = dtpk1Exit
      end
      object DTPk2: TDateTimePicker
        Left = 156
        Top = 13
        Width = 97
        Height = 21
        CalAlignment = dtaLeft
        Date = 37600
        Time = 37600
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 1
        OnCloseUp = dtpk1Exit
        OnExit = dtpk1Exit
      end
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 46
    Width = 729
    Height = 459
    Align = alClient
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'GRN_NUMBER'
        Title.Color = clRed
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DELIVER_NUMBER'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_PART_NUMBER'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_NAME'
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_DESCRIPTION'
        Width = 142
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTITY'
        ReadOnly = False
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRICE'
        ReadOnly = False
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAX_2'
        ReadOnly = False
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_warehouse'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ship_DATE'
        ReadOnly = False
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXCHANGE_RATE'
        ReadOnly = False
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BARCODE_ID'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXPIRE_DATE'
        ReadOnly = False
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 528
    Top = 456
  end
  object ADOQuery1: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = 38657d
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = 38684d
      end>
    SQL.Strings = (
      'SELECT dbo.Data0456.GRN_NUMBER, dbo.Data0456.DELIVER_NUMBER,'
      '      dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, '
      
        '      dbo.Data0017.INV_DESCRIPTION, dbo.Data0022.QUANTITY, dbo.D' +
        'ata0022.PRICE, '
      '      dbo.Data0022.TAX_2, dbo.Data0023.ABBR_NAME, '
      
        '      dbo.Data0015.ABBR_NAME AS abbr_warehouse, dbo.Data0005.EMP' +
        'LOYEE_NAME, '
      '      dbo.Data0456.ship_DATE, dbo.Data0001.CURR_NAME,'
      '      dbo.Data0022.EXCHANGE_RATE, dbo.Data0022.BARCODE_ID, '
      '      dbo.Data0022.EXPIRE_DATE, dbo.Data0456.TTYPE, '
      '      dbo.Data0070.PO_NUMBER'
      'FROM dbo.Data0022 INNER JOIN'
      
        '      dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR = dbo.Data0017.' +
        'RKEY INNER JOIN'
      
        '      dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY I' +
        'NNER JOIN'
      
        '      dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0015 ON dbo.Data0456.warehouse_ptr = dbo.Data0015.' +
        'RKEY INNER JOIN'
      
        '      dbo.Data0005 ON dbo.Data0456.CREATE_BY = dbo.Data0005.RKEY' +
        ' INNER JOIN'
      '      dbo.Data0001 ON '
      
        '      dbo.Data0022.CURRENCY_PTR = dbo.Data0001.RKEY LEFT OUTER J' +
        'OIN'
      '      dbo.Data0070 ON dbo.Data0456.PO_PTR = dbo.Data0070.RKEY'
      'where Data0456.SHIP_DATE>=:dtpk1 and Data0456.SHIP_DATE<=:dtpk2'
      'order by  GRN_NUMBER')
    Left = 560
    Top = 456
    object ADOQuery1GRN_NUMBER: TStringField
      DisplayLabel = #20837#24211#21333#21495
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object ADOQuery1DELIVER_NUMBER: TStringField
      DisplayLabel = #36865#36135#21333#21495
      FieldName = 'DELIVER_NUMBER'
      Size = 15
    end
    object ADOQuery1INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADOQuery1INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ADOQuery1INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      DisplayWidth = 30
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ADOQuery1QUANTITY: TBCDField
      DisplayLabel = #25509#25910#25968#37327
      FieldName = 'QUANTITY'
      Precision = 9
      Size = 3
    end
    object ADOQuery1PRICE: TBCDField
      DisplayLabel = #21333#20215
      FieldName = 'PRICE'
      Precision = 9
      Size = 3
    end
    object ADOQuery1TAX_2: TBCDField
      DisplayLabel = #31246#29575'%'
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object ADOQuery1abbr_warehouse: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'abbr_warehouse'
      Size = 10
    end
    object ADOQuery1ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOQuery1CURR_NAME: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_NAME'
    end
    object ADOQuery1EXCHANGE_RATE: TBCDField
      DisplayLabel = #27719#29575
      FieldName = 'EXCHANGE_RATE'
      Precision = 12
      Size = 8
    end
    object ADOQuery1EMPLOYEE_NAME: TStringField
      DisplayLabel = #25910#36135#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOQuery1ship_DATE: TDateTimeField
      DisplayLabel = #25910#36135#26085#26399
      FieldName = 'ship_DATE'
    end
    object ADOQuery1BARCODE_ID: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'BARCODE_ID'
      Size = 50
    end
    object ADOQuery1EXPIRE_DATE: TDateTimeField
      DisplayLabel = #26377#25928#26399
      FieldName = 'EXPIRE_DATE'
    end
    object ADOQuery1TTYPE: TWordField
      FieldName = 'TTYPE'
    end
    object ADOQuery1PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#35746#21333
      FieldName = 'PO_NUMBER'
      Size = 15
    end
  end
end
