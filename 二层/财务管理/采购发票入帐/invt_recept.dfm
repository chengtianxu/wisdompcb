object Form_invtrecept: TForm_invtrecept
  Left = 469
  Top = 155
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
    Height = 443
    Align = alTop
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'GRN_NUMBER'
        Title.Color = cl3DLight
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
        ReadOnly = False
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'amount'
        ReadOnly = False
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'exch_rate'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODE'
        Title.Color = clRed
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_type'
        Width = 55
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
    Left = 291
    Top = 499
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 379
    Top = 499
    Width = 75
    Height = 25
    Cancel = True
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
    TabOrder = 1
    object Label1: TLabel
      Left = 15
      Top = 19
      Width = 13
      Height = 13
      Caption = #20174
    end
    object Label2: TLabel
      Left = 132
      Top = 19
      Width = 13
      Height = 13
      Caption = #21040
    end
    object Label3: TLabel
      Left = 263
      Top = 20
      Width = 65
      Height = 13
      Alignment = taRightJustify
      Caption = #20379#24212#21830#20195#30721
    end
    object Edit1: TEdit
      Left = 332
      Top = 16
      Width = 140
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
    object dtpk1: TDateTimePicker
      Left = 31
      Top = 16
      Width = 94
      Height = 21
      Date = 38764.000000000000000000
      Time = 38764.000000000000000000
      TabOrder = 1
      OnCloseUp = FormActivate
      OnExit = FormActivate
    end
    object dtpk2: TDateTimePicker
      Left = 148
      Top = 16
      Width = 94
      Height = 21
      Date = 38764.000000000000000000
      Time = 38764.000000000000000000
      TabOrder = 2
      OnCloseUp = FormActivate
      OnExit = FormActivate
    end
    object ComboBox1: TComboBox
      Left = 515
      Top = 15
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 3
      OnChange = ComboBox1Change
    end
  end
  object CheckBox1: TCheckBox
    Left = 16
    Top = 505
    Width = 49
    Height = 17
    Caption = #20840#36873
    TabOrder = 4
    OnClick = CheckBox1Click
  end
  object DataSource1: TDataSource
    DataSet = aqwz456
    OnDataChange = DataSource1DataChange
    Left = 48
    Top = 368
  end
  object aqwz456: TADODataSet
    Connection = dm.ACt
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 'wzep107;1'
    CommandType = cmdStoredProc
    EnableBCD = False
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@dtpk1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 38718d
      end
      item
        Name = '@dtpk2'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 39052d
      end>
    Left = 82
    Top = 367
    object aqwz456RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aqwz456GRN_NUMBER: TStringField
      DisplayLabel = #20837#20179#21333#21495
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object aqwz456DELIVER_NUMBER: TStringField
      DisplayLabel = #36865#36135#21333#21495
      FieldName = 'DELIVER_NUMBER'
      Size = 15
    end
    object aqwz456PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#35746#21333
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object aqwz456ship_DATE: TDateTimeField
      DisplayLabel = #36865#36135#26085#26399
      FieldName = 'ship_DATE'
    end
    object aqwz456EMPLOYEE_NAME: TStringField
      DisplayLabel = #25910#36135#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object aqwz456TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object aqwz456CURR_NAME: TStringField
      DisplayLabel = #36135#24065#21517#31216
      FieldName = 'CURR_NAME'
    end
    object aqwz456CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object aqwz456amount: TBCDField
      DisplayLabel = #37329#39069
      FieldName = 'amount'
      ReadOnly = True
      Precision = 32
      Size = 6
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
    object aqwz456SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object aqwz456PAYMENT_TERMS: TSmallintField
      FieldName = 'PAYMENT_TERMS'
    end
    object aqwz456ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 16
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
    object aqwz456currency_ptr: TIntegerField
      FieldName = 'currency_ptr'
    end
    object aqwz456exch_rate: TFloatField
      DisplayLabel = #27719#29575
      FieldName = 'exch_rate'
      ReadOnly = True
    end
    object aqwz456v_type: TStringField
      DisplayLabel = #20837#20179#31867#22411
      FieldName = 'v_type'
      ReadOnly = True
      Size = 8
    end
    object aqwz456ACC_PAYABLE_PTR: TIntegerField
      FieldName = 'ACC_PAYABLE_PTR'
    end
    object aqwz456TAX_2: TFloatField
      FieldName = 'TAX_2'
      ReadOnly = True
    end
    object aqwz456name15: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'name15'
      ReadOnly = True
      Size = 10
    end
  end
end
