object Form_invtrecept: TForm_invtrecept
  Left = 198
  Top = 133
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20837#20179#21333#26597#25214
  ClientHeight = 530
  ClientWidth = 736
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 45
    Width = 736
    Height = 439
    Align = alTop
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ReadOnly = True
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
        FieldName = 'GRN_NUMBER'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DELIVER_NUMBER'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ship_DATE'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'amount'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODE'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_name'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_type'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WAREHOUSE_CODE'
        Width = 60
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 259
    Top = 495
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 347
    Top = 495
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 3
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 736
    Height = 45
    Align = alTop
    Caption = #36865#36135#26085#26399
    TabOrder = 0
    object Label1: TLabel
      Left = 15
      Top = 19
      Width = 13
      Height = 13
      Caption = #20174
    end
    object Label2: TLabel
      Left = 128
      Top = 19
      Width = 13
      Height = 13
      Caption = #21040
    end
    object Edit1: TEdit
      Left = 340
      Top = 16
      Width = 96
      Height = 21
      TabOrder = 0
    end
    object ComboBox1: TComboBox
      Left = 249
      Top = 16
      Width = 89
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 2
      Text = #20379#24212#21830#20195#30721
      Items.Strings = (
        #20379#24212#21830#20195#30721
        #20379#24212#21830#31616#31216
        #36865#36135#21333#21495
        #20837#20179#21333#21495
        #37319#36141#35746#21333)
    end
    object BitBtn1: TBitBtn
      Left = 443
      Top = 14
      Width = 56
      Height = 25
      Caption = #26597#25214
      TabOrder = 1
      OnClick = BitBtn1Click
    end
    object dtpk1: TDateTimePicker
      Left = 31
      Top = 16
      Width = 94
      Height = 21
      Date = 38764.000000000000000000
      Time = 38764.000000000000000000
      TabOrder = 3
    end
    object dtpk2: TDateTimePicker
      Left = 144
      Top = 16
      Width = 94
      Height = 21
      Date = 38764.000000000000000000
      Time = 38764.000000000000000000
      TabOrder = 4
    end
  end
  object CheckBox1: TCheckBox
    Left = 16
    Top = 496
    Width = 49
    Height = 17
    Caption = #20840#36873
    TabOrder = 4
    OnClick = CheckBox1Click
  end
  object DataSource1: TDataSource
    DataSet = aqwz456
    Left = 48
    Top = 368
  end
  object aqwz456: TADOQuery
    Connection = dm.ACt
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = aqwz456CalcFields
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = 38718d
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = 38764d
      end>
    SQL.Strings = (
      'SELECT dbo.Data0456.RKEY, dbo.Data0456.GRN_NUMBER, '
      '      dbo.Data0456.DELIVER_NUMBER, dbo.Data0070.PO_NUMBER, '
      
        '      dbo.Data0456.ship_DATE, dbo.Data0005.EMPLOYEE_NAME, dbo.Da' +
        'ta0456.TTYPE,'
      
        '      dbo.Data0001.CURR_NAME, SUM(dbo.Data0022.QUANTITY * dbo.Da' +
        'ta0022.PRICE)'
      
        '      AS amount, dbo.Data0022.CURRENCY_PTR, dbo.Data0022.EXCHANG' +
        'E_RATE, '
      
        '      dbo.Data0456.SUPP_PTR, dbo.Data0456.warehouse_ptr, dbo.Dat' +
        'a0023.CODE, '
      
        '      Data0023.SUPPLIER_NAME,data0023.PAYMENT_TERMS,data0023.abb' +
        'r_name,'
      '      Data0015.WAREHOUSE_CODE,Data0015.WAREHOUSE_NAME'
      'FROM dbo.Data0456 INNER JOIN'
      
        '      dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0015 ON dbo.Data0456.warehouse_ptr = dbo.Data0015.' +
        'RKEY INNER JOIN'
      
        '      dbo.Data0005 ON dbo.Data0456.CREATE_BY = dbo.Data0005.RKEY' +
        ' INNER JOIN'
      
        '      dbo.Data0022 ON dbo.Data0456.RKEY = dbo.Data0022.GRN_PTR I' +
        'NNER JOIN'
      '      dbo.Data0001 ON '
      
        '      dbo.Data0022.CURRENCY_PTR = dbo.Data0001.RKEY LEFT OUTER J' +
        'OIN'
      '      dbo.Data0070 ON dbo.Data0456.PO_PTR = dbo.Data0070.RKEY'
      'WHERE (Data0456.STATUS =3) and'
      '      (data0456.ship_date>=:dtpk1) and'
      '      (data0456.ship_date<=:dtpk2)'
      ''
      'GROUP BY dbo.Data0456.GRN_NUMBER, dbo.Data0456.DELIVER_NUMBER,'
      
        '      dbo.Data0070.PO_NUMBER, dbo.Data0456.ship_DATE,data0023.PA' +
        'YMENT_TERMS,'
      
        '      dbo.Data0005.EMPLOYEE_NAME, dbo.Data0456.TTYPE, dbo.Data00' +
        '01.CURR_NAME,'
      
        '      dbo.Data0456.RKEY, dbo.Data0022.CURRENCY_PTR,data0023.abbr' +
        '_name,'
      
        '      dbo.Data0022.EXCHANGE_RATE, dbo.Data0456.SUPP_PTR,Data0456' +
        '.warehouse_ptr,'
      
        '      Data0023.CODE, Data0023.SUPPLIER_NAME,data0023.PAYMENT_TER' +
        'MS,'
      '      Data0015.WAREHOUSE_CODE,Data0015.WAREHOUSE_NAME')
    Left = 80
    Top = 368
    object aqwz456RKEY: TIntegerField
      DisplayWidth = 12
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aqwz456GRN_NUMBER: TStringField
      DisplayLabel = #20837#20179#21333#21495
      DisplayWidth = 16
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object aqwz456DELIVER_NUMBER: TStringField
      DisplayLabel = #36865#36135#21333#21495
      DisplayWidth = 20
      FieldName = 'DELIVER_NUMBER'
      Size = 15
    end
    object aqwz456PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#35746#21333
      DisplayWidth = 16
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object aqwz456ship_DATE: TDateTimeField
      DisplayLabel = #36865#36135#26085#26399
      DisplayWidth = 22
      FieldName = 'ship_DATE'
    end
    object aqwz456EMPLOYEE_NAME: TStringField
      DisplayLabel = #25910#36135#21592#24037
      DisplayWidth = 19
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object aqwz456TTYPE: TWordField
      DisplayWidth = 12
      FieldName = 'TTYPE'
    end
    object aqwz456CURR_NAME: TStringField
      DisplayLabel = #36135#24065
      DisplayWidth = 15
      FieldName = 'CURR_NAME'
    end
    object aqwz456amount: TBCDField
      DisplayLabel = #37329#39069
      DisplayWidth = 18
      FieldName = 'amount'
      Precision = 32
      Size = 6
    end
    object aqwz456v_type: TStringField
      DisplayLabel = #20837#20179#31867#22411
      FieldKind = fkCalculated
      FieldName = 'v_type'
      Size = 8
      Calculated = True
    end
    object aqwz456CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object aqwz456EXCHANGE_RATE: TBCDField
      FieldName = 'EXCHANGE_RATE'
      Precision = 12
      Size = 8
    end
    object aqwz456SUPP_PTR: TIntegerField
      FieldName = 'SUPP_PTR'
    end
    object aqwz456warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object aqwz456CODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object aqwz456abbr_name: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      FieldName = 'abbr_name'
      Size = 10
    end
    object aqwz456SUPPLIER_NAME: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object aqwz456WAREHOUSE_CODE: TStringField
      DisplayLabel = #24037#21378#20195#30721
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object aqwz456WAREHOUSE_NAME: TStringField
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
    object aqwz456PAYMENT_TERMS: TSmallintField
      DisplayLabel = #20379#24212#21830#20184#27454#22825#25968
      FieldName = 'PAYMENT_TERMS'
    end
  end
end
