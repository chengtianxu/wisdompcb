object Form5: TForm5
  Left = 211
  Top = 151
  Width = 798
  Height = 561
  Caption = #38750#29983#20135#29289#26009#37319#36141#21015#34920
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
    Width = 790
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
      Caption = '    '#37319#36141#25968#37327#21512#35745':'
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
    Width = 790
    Height = 493
    Align = alClient
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_DATE'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATE_EDITED'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXPIRED_DATE'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPTION'
        Width = 154
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'gui_ge'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FOB'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_REV_NO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_status'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPTION2'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_ORD'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantity_received'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'no_recd'
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
        FieldName = 'CURR_CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'del_date'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'recd_date'
        Width = 96
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
      
        'SELECT Data0070.PO_NUMBER,Data0070.FOB,Data0070.PO_DATE,data0070' +
        '.DATE_EDITED,'
      
        '      Data0005.EMPLOYEE_NAME,Data0023.ABBR_NAME,Data0001.CURR_CO' +
        'DE,'
      
        '      Data0072.DESCRIPTION,Data0072.DESCRIPTION2,data0072.gui_ge' +
        ','
      '      Data0072.QUAN_ORD,Data0072.UNIT_PRICE,data0070.PO_REV_NO,'
      
        '      data0072.quantity_received,Data0072.QUAN_ORD-data0072.quan' +
        'tity_received as no_recd,'
      
        '      Data0072.QUAN_ORD * Data0072.UNIT_PRICE * Data0001.BASE_TO' +
        '_OTHER'
      
        '       AS total, Data0002.UNIT_NAME,Data0070.STATUS,data0070.EXP' +
        'IRED_DATE,'
      '      data0072.del_date,data0072.recd_date '
      'FROM dbo.Data0005 INNER JOIN'
      '      dbo.Data0070 ON '
      
        '      dbo.Data0005.RKEY = dbo.Data0070.EMPLOYEE_POINTER INNER JO' +
        'IN'
      
        '      dbo.Data0072 ON dbo.Data0070.RKEY = dbo.Data0072.POPTR INN' +
        'ER JOIN'
      '      dbo.Data0023 ON '
      
        '      dbo.Data0070.SUPPLIER_POINTER = dbo.Data0023.RKEY INNER JO' +
        'IN'
      
        '      dbo.Data0001 ON dbo.Data0070.CURRENCY_PTR = dbo.Data0001.R' +
        'KEY INNER JOIN'
      '      dbo.Data0002 ON dbo.Data0072.UNIT_PTR = dbo.Data0002.RKEY'
      'where quan_ord>0            ')
    Left = 264
    Top = 11
    object ADOQuery1PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#32534#21495
      DisplayWidth = 18
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object ADOQuery1PO_DATE: TDateTimeField
      DisplayLabel = #37319#36141#26085#26399
      DisplayWidth = 15
      FieldName = 'PO_DATE'
    end
    object ADOQuery1FOB: TStringField
      DisplayLabel = #35831#36141#32534#21495
      DisplayWidth = 27
      FieldName = 'FOB'
      Size = 15
    end
    object ADOQuery1PO_REV_NO: TStringField
      DisplayLabel = #35831#36141#37096#38376
      FieldName = 'PO_REV_NO'
      Size = 10
    end
    object ADOQuery1EMPLOYEE_NAME: TStringField
      DisplayLabel = #37319#36141#21592#24037
      DisplayWidth = 18
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOQuery1v_status: TStringField
      DisplayLabel = #37319#36141#35746#21333#29366#24577
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'v_status'
      Size = 6
      Calculated = True
    end
    object ADOQuery1CODE: TStringField
      DisplayLabel = #20379#24212#21830
      DisplayWidth = 11
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOQuery1DESCRIPTION: TStringField
      DisplayLabel = #29289#21697#21517#31216
      DisplayWidth = 30
      FieldName = 'DESCRIPTION'
      Size = 60
    end
    object ADOQuery1gui_ge: TStringField
      DisplayLabel = #29289#21697#35268#26684
      FieldName = 'gui_ge'
      Size = 200
    end
    object ADOQuery1DESCRIPTION2: TStringField
      DisplayLabel = #29289#21697#31867#21035
      DisplayWidth = 20
      FieldName = 'DESCRIPTION2'
      FixedChar = True
    end
    object ADOQuery1UNIT_NAME: TStringField
      DisplayLabel = #37319#36141#21333#20301
      DisplayWidth = 14
      FieldName = 'UNIT_NAME'
    end
    object ADOQuery1QUAN_ORD: TFloatField
      DisplayLabel = #35746#36141#25968#37327
      DisplayWidth = 12
      FieldName = 'QUAN_ORD'
    end
    object ADOQuery1quantity_received: TFloatField
      DisplayLabel = #24050#25910#25968#37327
      FieldName = 'quantity_received'
    end
    object ADOQuery1no_recd: TFloatField
      DisplayLabel = #26410#25910#25968#37327
      FieldName = 'no_recd'
      ReadOnly = True
    end
    object ADOQuery1UNIT_PRICE: TFloatField
      DisplayLabel = #20215#26684
      DisplayWidth = 12
      FieldName = 'UNIT_PRICE'
    end
    object ADOQuery1CURR_CODE: TStringField
      DisplayLabel = #36135#24065
      DisplayWidth = 9
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADOQuery1total: TFloatField
      DisplayLabel = #24635#35745#37329#39069'('#26412#20301#24065')'
      DisplayWidth = 14
      FieldName = 'total'
      ReadOnly = True
    end
    object ADOQuery1STATUS: TWordField
      FieldName = 'STATUS'
      Visible = False
    end
    object ADOQuery1DATE_EDITED: TDateTimeField
      DisplayLabel = #25552#20132#23457#25209#26085#26399
      FieldName = 'DATE_EDITED'
    end
    object ADOQuery1EXPIRED_DATE: TDateTimeField
      DisplayLabel = #26368#21518#23457#25209#26085#26399
      FieldName = 'EXPIRED_DATE'
    end
    object ADOQuery1del_date: TDateTimeField
      DisplayLabel = #35201#27714#21040#36135#26085#26399
      FieldName = 'del_date'
    end
    object ADOQuery1recd_date: TDateTimeField
      DisplayLabel = #26368#21518#25910#36135#26085#26399
      FieldName = 'recd_date'
    end
  end
end
