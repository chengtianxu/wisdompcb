object Form4: TForm4
  Left = 204
  Top = 169
  Width = 748
  Height = 528
  Caption = #20215#26684#21464#21160#35760#24405
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 37
    Width = 740
    Height = 464
    Align = alClient
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'INV_PART_NUMBER'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_PART_DESCRIPTION'
        Width = 126
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'old_price'
        ReadOnly = False
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'new_price'
        ReadOnly = False
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'reason'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sys_longdate'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GROUP_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GROUP_DESC'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODE'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 740
    Height = 37
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 147
      Top = 11
      Width = 73
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #26448#26009#32534#30721
    end
    object Label2: TLabel
      Left = 409
      Top = 12
      Width = 60
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #26356#25913#26085#26399#20174
    end
    object Label3: TLabel
      Left = 559
      Top = 13
      Width = 17
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #21040
    end
    object Button1: TButton
      Left = 16
      Top = 6
      Width = 60
      Height = 25
      Caption = #20851#38381
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 82
      Top = 6
      Width = 61
      Height = 25
      Caption = #23548#20986'Excel'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Edit1: TEdit
      Left = 227
      Top = 8
      Width = 129
      Height = 21
      TabOrder = 2
      OnChange = Edit1Change
    end
    object dtpk1: TDateTimePicker
      Left = 472
      Top = 8
      Width = 81
      Height = 21
      Date = 38595.000000000000000000
      Time = 38595.000000000000000000
      TabOrder = 3
      OnExit = dtpk1Exit
    end
    object dtpk2: TDateTimePicker
      Left = 580
      Top = 8
      Width = 81
      Height = 21
      Date = 38595.000000000000000000
      Time = 38595.000000000000000000
      TabOrder = 4
      OnExit = dtpk1Exit
    end
  end
  object ADO328: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 38477d
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 38596d
      end>
    SQL.Strings = (
      'SELECT Data0496.GROUP_NAME, Data0496.GROUP_DESC,'
      '      Data0017.INV_PART_NUMBER, Data0017.INV_PART_DESCRIPTION,'
      '      Data0023.CODE, data0328.old_price,'
      
        '      data0328.new_price, data0328.sys_longdate, data0328.reason' +
        ','
      '      Data0005.EMPLOYEE_NAME'
      'FROM Data0017 INNER JOIN'
      
        '      Data0028 ON Data0017.RKEY = Data0028.INVENTORY_PTR INNER J' +
        'OIN'
      '      data0328 ON Data0028.RKEY = data0328.price_ptr INNER JOIN'
      '      Data0496 ON Data0017.GROUP_PTR = Data0496.RKEY INNER JOIN'
      
        '      Data0023 ON Data0028.SUPPLIER_PTR = Data0023.RKEY INNER JO' +
        'IN'
      '      Data0005 ON data0328.user_ptr = Data0005.RKEY'
      
        'where data0328.sys_longdate>=:dtpk1 and data0328.sys_longdate<=:' +
        'dtpk2'
      'order by'
      'data0328.sys_longdate')
    Left = 344
    Top = 312
    object ADO328GROUP_NAME: TStringField
      DisplayLabel = #31867#22411#20195#30721
      FieldName = 'GROUP_NAME'
      Size = 10
    end
    object ADO328GROUP_DESC: TStringField
      DisplayLabel = #31867#22411#21517#31216
      FieldName = 'GROUP_DESC'
      Size = 30
    end
    object ADO328INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADO328INV_PART_DESCRIPTION: TStringField
      DisplayLabel = #21517#31216#35268#26684
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object ADO328CODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object ADO328old_price: TFloatField
      DisplayLabel = #26087#20215#26684
      FieldName = 'old_price'
    end
    object ADO328new_price: TFloatField
      DisplayLabel = #26032#20215#26684
      FieldName = 'new_price'
    end
    object ADO328sys_longdate: TDateTimeField
      DisplayLabel = #26356#25913#26085#26399
      FieldName = 'sys_longdate'
    end
    object ADO328reason: TStringField
      DisplayLabel = #26356#25913#21407#22240
      FieldName = 'reason'
      Size = 50
    end
    object ADO328EMPLOYEE_NAME: TStringField
      DisplayLabel = #26356#25913#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
  end
  object DataSource1: TDataSource
    DataSet = ADO328
    Left = 312
    Top = 312
  end
end
