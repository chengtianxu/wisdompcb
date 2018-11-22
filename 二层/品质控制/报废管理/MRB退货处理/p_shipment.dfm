object F_shipment: TF_shipment
  Left = 226
  Top = 155
  Width = 752
  Height = 480
  Caption = #20986#20179#21333#26597#25214
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 744
    Height = 371
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
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
        FieldName = 'number'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_NUMBER'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_name10'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantity'
        ReadOnly = False
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qty_received'
        ReadOnly = False
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sys_date'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'reference'
        Width = 74
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 412
    Width = 744
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Button1: TButton
      Left = 277
      Top = 10
      Width = 75
      Height = 25
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 365
      Top = 10
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 744
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Label1: TLabel
      Left = 198
      Top = 11
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #20986#20179#21333#21495
    end
    object Edit1: TEdit
      Left = 256
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
      OnKeyDown = DBGrid1KeyDown
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'SELECT data0415.rkey,data0415.number,data0415.sys_date,'
      
        '      data0415.quantity,data0415.qty_received,data0415.reference' +
        ','
      '      Data0025.MANU_PART_NUMBER,'
      '      Data0025.MANU_PART_DESC,'
      '      data0415.custpart_ptr,'
      '      Data0005.EMPLOYEE_NAME,data0415.type,'
      '      Data0010.ABBR_NAME as abbr_name10,'
      '      data0010.cust_code,data0010.CUSTOMER_NAME'
      'FROM data0415 INNER JOIN'
      
        '      Data0025 ON data0415.custpart_ptr = Data0025.RKEY INNER JO' +
        'IN'
      '      Data0005 ON data0415.empl_ptr = Data0005.RKEY INNER JOIN'
      '      Data0010 ON Data0025.CUSTOMER_PTR = Data0010.RKEY'
      'where (data0415.type=3 ) and (data0415.status=3)'
      ''
      'order by data0415.number')
    Left = 408
    Top = 256
    object ADOQuery1number: TStringField
      DisplayLabel = #20986#20179#21333#21495
      FieldName = 'number'
      Size = 15
    end
    object ADOQuery1rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery1sys_date: TDateTimeField
      DisplayLabel = #26085#26399
      FieldName = 'sys_date'
    end
    object ADOQuery1EMPLOYEE_NAME: TStringField
      DisplayLabel = #21592#24037
      DisplayWidth = 10
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOQuery1quantity: TIntegerField
      DisplayLabel = #20986#20179#25968#37327
      FieldName = 'quantity'
    end
    object ADOQuery1qty_received: TIntegerField
      DisplayLabel = #24050#22788#29702#25968#37327
      FieldName = 'qty_received'
    end
    object ADOQuery1reference: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'reference'
      Size = 50
    end
    object ADOQuery1abbr_name10: TStringField
      DisplayLabel = #23458#25143
      FieldName = 'abbr_name10'
      Size = 10
    end
    object ADOQuery1cust_code: TStringField
      FieldName = 'cust_code'
      Size = 10
    end
    object ADOQuery1CUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object ADOQuery1custpart_ptr: TIntegerField
      FieldName = 'custpart_ptr'
    end
    object ADOQuery1type: TWordField
      FieldName = 'type'
    end
    object ADOQuery1MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      DisplayWidth = 10
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOQuery1MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      DisplayWidth = 20
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 374
    Top = 256
  end
end
