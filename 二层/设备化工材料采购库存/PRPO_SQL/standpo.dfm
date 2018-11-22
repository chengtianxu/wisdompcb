object Form4: TForm4
  Left = 214
  Top = 151
  Width = 798
  Height = 561
  Caption = #29983#20135#29289#26009#37319#36141#21015#34920
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
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_DATE'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATE_EDITED'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXPIRED_DATE'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_PART_NUMBER'
        Width = 157
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inv_part_description'
        Width = 163
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FOB'
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
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_status'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANALYSIS_CODE_2'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_ORD'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_RECD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'no_recd'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRICE'
        Width = 46
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
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'req_date'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'recd_date'
        Width = 94
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 232
    Top = 7
  end
  object ADOQuery1: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <>
    SQL.Strings = (
      'SELECT Data0070.PO_NUMBER, Data0070.PO_DATE, Data0070.FOB,'
      
        'Data0005.EMPLOYEE_NAME,Data0017.INV_PART_NUMBER,data0070.DATE_ED' +
        'ITED,'
      
        'Data0023.ABBR_NAME,Data0071.QUAN_ORD,Data0071.PRICE,data0070.EXP' +
        'IRED_DATE,'
      
        'data0071.QUAN_RECD,Data0071.QUAN_ORD-data0071.QUAN_RECD as no_re' +
        'cd,'
      'Data0071.QUAN_ORD * Data0071.PRICE * Data0001.BASE_TO_OTHER AS'
      'total,Data0001.CURR_CODE,Data0070.STATUS,data0070.PO_REV_NO,'
      'Data0002.UNIT_NAME,data0017.inv_part_description,'
      'data0071.recd_date,data0071.req_date,ANALYSIS_CODE_2'
      'FROM dbo.Data0005 INNER JOIN'
      '      dbo.Data0070 ON'
      
        '      dbo.Data0005.RKEY = dbo.Data0070.EMPLOYEE_POINTER INNER JO' +
        'IN'
      
        '      dbo.Data0071 ON dbo.Data0070.RKEY = dbo.Data0071.PO_PTR IN' +
        'NER JOIN'
      
        '      dbo.Data0017 ON dbo.Data0071.INVT_PTR = dbo.Data0017.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0001 ON dbo.Data0070.CURRENCY_PTR = dbo.Data0001.R' +
        'KEY INNER JOIN'
      '      dbo.Data0023 ON'
      
        '      dbo.Data0070.SUPPLIER_POINTER = dbo.Data0023.RKEY INNER JO' +
        'IN'
      
        '      dbo.Data0002 ON dbo.Data0071.PURCHASE_UNIT_PTR = dbo.Data0' +
        '002.RKEY'
      'where quan_ord>0      ')
    Left = 264
    Top = 7
    object ADOQuery1PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#32534#21495
      DisplayWidth = 18
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object ADOQuery1PO_DATE: TDateTimeField
      DisplayLabel = #37319#36141#26085#26399
      DisplayWidth = 22
      FieldName = 'PO_DATE'
    end
    object ADOQuery1DATE_EDITED: TDateTimeField
      DisplayLabel = #25552#20132#23457#25209#26085#26399
      FieldName = 'DATE_EDITED'
    end
    object ADOQuery1EXPIRED_DATE: TDateTimeField
      DisplayLabel = #26368#21518#23457#25209#26085#26399
      FieldName = 'EXPIRED_DATE'
    end
    object ADOQuery1FOB: TStringField
      DisplayLabel = #35831#36141#32534#21495
      DisplayWidth = 13
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
      DisplayWidth = 16
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOQuery1v_status: TStringField
      DisplayLabel = #37319#36141#35746#21333#29366#24577
      FieldKind = fkCalculated
      FieldName = 'v_status'
      Size = 6
      Calculated = True
    end
    object ADOQuery1INV_PART_NUMBER: TStringField
      DisplayLabel = #29289#26009#32534#30721
      DisplayWidth = 28
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADOQuery1inv_part_description: TStringField
      DisplayLabel = #29289#26009#25551#36848
      FieldName = 'inv_part_description'
      Size = 100
    end
    object ADOQuery1UNIT_NAME: TStringField
      DisplayLabel = #37319#36141#21333#20301
      DisplayWidth = 15
      FieldName = 'UNIT_NAME'
    end
    object ADOQuery1CODE: TStringField
      DisplayLabel = #20379#24212#21830
      DisplayWidth = 7
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOQuery1QUAN_ORD: TFloatField
      DisplayLabel = #35746#36141#25968#37327
      DisplayWidth = 12
      FieldName = 'QUAN_ORD'
    end
    object ADOQuery1QUAN_RECD: TFloatField
      DisplayLabel = #24050#25910#25968#37327
      FieldName = 'QUAN_RECD'
    end
    object ADOQuery1no_recd: TFloatField
      DisplayLabel = #26410#25910#25968#37327
      FieldName = 'no_recd'
      ReadOnly = True
    end
    object ADOQuery1PRICE: TFloatField
      DisplayLabel = #20215#26684
      DisplayWidth = 12
      FieldName = 'PRICE'
    end
    object ADOQuery1CURR_CODE: TStringField
      DisplayLabel = #36135#24065
      DisplayWidth = 6
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADOQuery1total: TFloatField
      DisplayLabel = #24635#35745#37329#39069'('#26412#20301#24065')'
      FieldName = 'total'
      ReadOnly = True
      DisplayFormat = '0.000'
    end
    object ADOQuery1STATUS: TWordField
      FieldName = 'STATUS'
      Visible = False
    end
    object ADOQuery1req_date: TDateTimeField
      DisplayLabel = #35201#27714#21040#36135#26085#26399
      FieldName = 'req_date'
    end
    object ADOQuery1recd_date: TDateTimeField
      DisplayLabel = #26368#21518#25910#36135#26085#26399
      FieldName = 'recd_date'
    end
    object ADOQuery1ANALYSIS_CODE_2: TStringField
      DisplayLabel = #37319#36141#29289#26009#31867#21035
      FieldName = 'ANALYSIS_CODE_2'
    end
  end
end
