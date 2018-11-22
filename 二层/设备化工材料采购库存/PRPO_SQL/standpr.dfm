object Form2: TForm2
  Left = 212
  Top = 151
  Width = 798
  Height = 561
  Caption = #29983#20135#29289#26009#35831#36141#21015#34920
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 782
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 296
      Top = 12
      Width = 113
      Height = 13
      Alignment = taRightJustify
      Caption = '    '#35831#36141#25968#37327#21512#35745':'
    end
    object Label2: TLabel
      Left = 497
      Top = 12
      Width = 80
      Height = 13
      Alignment = taRightJustify
      Caption = '   '#37329#39069#21512#35745':'
    end
    object Button1: TButton
      Left = 40
      Top = 8
      Width = 75
      Height = 25
      Caption = #36864#20986
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 120
      Top = 8
      Width = 75
      Height = 25
      Caption = #23548#20986'Excel'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Edit1: TEdit
      Left = 416
      Top = 8
      Width = 89
      Height = 21
      TabStop = False
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 2
      Text = '0.00'
    end
    object Edit2: TEdit
      Left = 586
      Top = 8
      Width = 121
      Height = 21
      TabStop = False
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 3
      Text = '0.0000'
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 782
    Height = 482
    Align = alClient
    DataSource = DataSource1
    PopupMenu = PopupMenu1
    TabOrder = 1
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = N1Click
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'PO_REQ_NUMBER'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEPARTMENT_NAME'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_PART_NUMBER'
        Width = 137
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_PART_description'
        Width = 206
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REQ_DATE'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENT_DATE'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AUTH_DATE'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EDITED_DATE'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_status'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_name'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTITY'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_PRICE'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'reason'
        Width = 134
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 232
    Top = 11
  end
  object ADOQuery1: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <>
    SQL.Strings = (
      
        'SELECT Data0068.PO_REQ_NUMBER,Data0068.DEPARTMENT_NAME,data0068.' +
        'AUTH_DATE,'
      '      Data0068.REQ_DATE,Data0068.STATUS,Data0005.EMPLOYEE_NAME,'
      
        '      Data0015.abbr_NAME,Data0017.INV_PART_NUMBER,Data0017.INV_P' +
        'ART_description,'
      
        '      Data0069.QUANTITY, Data0069.UNIT_PRICE, Data0023.abbr_name' +
        ' as code,'
      '      Data0001.CURR_CODE,data0069.reason,data0068.ENT_DATE,'
      
        '      Data0069.QUANTITY * Data0069.UNIT_PRICE * Data0001.BASE_TO' +
        '_OTHER'
      '       AS total,data0068.rkey,data0068.EDITED_DATE'
      'FROM dbo.Data0005 INNER JOIN'
      
        '      dbo.Data0068 ON dbo.Data0005.RKEY = dbo.Data0068.REQ_BY IN' +
        'NER JOIN'
      
        '      dbo.Data0015 ON dbo.Data0068.WHSE_PTR = dbo.Data0015.RKEY ' +
        'INNER JOIN'
      '      dbo.Data0069 ON'
      '      dbo.Data0068.RKEY = dbo.Data0069.PURCH_REQ_PTR INNER JOIN'
      
        '      dbo.Data0017 ON dbo.Data0069.INVT_PTR = dbo.Data0017.RKEY ' +
        'LEFT OUTER JOIN'
      '      dbo.Data0001 ON'
      
        '      dbo.Data0069.PO_LINK_PTR = dbo.Data0001.RKEY LEFT OUTER JO' +
        'IN'
      '      dbo.Data0023 ON dbo.Data0069.SUPP_PTR = dbo.Data0023.RKEY'
      'where Data0069.QUANTITY>0')
    Left = 264
    Top = 11
    object ADOQuery1PO_REQ_NUMBER: TStringField
      DisplayLabel = #35831#36141#32534#21495
      DisplayWidth = 22
      FieldName = 'PO_REQ_NUMBER'
      Size = 15
    end
    object ADOQuery1DEPARTMENT_NAME: TStringField
      DisplayLabel = #35831#36141#37096#38376
      DisplayWidth = 15
      FieldName = 'DEPARTMENT_NAME'
      Size = 10
    end
    object ADOQuery1REQ_DATE: TDateTimeField
      DisplayLabel = #35831#36141#26085#26399
      DisplayWidth = 27
      FieldName = 'REQ_DATE'
    end
    object ADOQuery1ENT_DATE: TDateTimeField
      DisplayLabel = #25552#20132#23457#25209#26085#26399
      FieldName = 'ENT_DATE'
    end
    object ADOQuery1AUTH_DATE: TDateTimeField
      DisplayLabel = #25552#20132#37319#36141#26085#26399
      FieldName = 'AUTH_DATE'
    end
    object ADOQuery1EDITED_DATE: TDateTimeField
      DisplayLabel = #26368#21518#23457#25209#26085#26399
      FieldName = 'EDITED_DATE'
    end
    object ADOQuery1EMPLOYEE_NAME: TStringField
      DisplayLabel = #35831#36141#21592#24037
      DisplayWidth = 23
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOQuery1v_status: TStringField
      DisplayLabel = #35831#36141#21333#35013#24577
      DisplayWidth = 21
      FieldKind = fkCalculated
      FieldName = 'v_status'
      Size = 14
      Calculated = True
    end
    object ADOQuery1WAREHOUSE_NAME: TStringField
      DisplayLabel = #24037#21378
      DisplayWidth = 19
      FieldName = 'abbr_name'
      Size = 10
    end
    object ADOQuery1INV_PART_NUMBER: TStringField
      DisplayLabel = #29289#26009#32534#21495
      DisplayWidth = 29
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADOQuery1INV_PART_description: TStringField
      DisplayLabel = #29289#26009#21517#31216#21450#35268#26684
      FieldName = 'INV_PART_description'
      Size = 100
    end
    object ADOQuery1CODE: TStringField
      DisplayLabel = #20379#24212#21830
      DisplayWidth = 9
      FieldName = 'CODE'
      Size = 10
    end
    object ADOQuery1QUANTITY: TFloatField
      DisplayLabel = #25968#37327
      DisplayWidth = 15
      FieldName = 'QUANTITY'
    end
    object ADOQuery1UNIT_PRICE: TFloatField
      DisplayLabel = #20215#26684
      DisplayWidth = 15
      FieldName = 'UNIT_PRICE'
    end
    object ADOQuery1CURR_CODE: TStringField
      DisplayLabel = #36135#24065
      DisplayWidth = 7
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADOQuery1total: TFloatField
      DisplayLabel = #24635#35745#37329#39069'('#26412#20301#24065')'
      DisplayWidth = 16
      FieldName = 'total'
      ReadOnly = True
      DisplayFormat = '0.000'
    end
    object ADOQuery1reason: TStringField
      DisplayLabel = #35831#36141#21407#22240
      FieldName = 'reason'
      Size = 60
    end
    object ADOQuery1STATUS: TWordField
      FieldName = 'STATUS'
      Visible = False
    end
    object ADOQuery1rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 304
    Top = 184
    object N1: TMenuItem
      Caption = #23457#25209#20449#24687
      OnClick = N1Click
    end
  end
end
