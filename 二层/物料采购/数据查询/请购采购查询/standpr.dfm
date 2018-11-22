object Form2: TForm2
  Left = 250
  Top = 96
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
  OnShow = FormShow
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
      Left = 373
      Top = 12
      Width = 113
      Height = 13
      Alignment = taRightJustify
      Caption = '    '#35831#36141#25968#37327#21512#35745':'
    end
    object Label2: TLabel
      Left = 574
      Top = 12
      Width = 80
      Height = 13
      Alignment = taRightJustify
      Caption = '   '#37329#39069#21512#35745':'
    end
    object Label3: TLabel
      Left = 205
      Top = 11
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #35831#36141#32534#21495
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clDefault
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Button1: TButton
      Left = 3
      Top = 8
      Width = 67
      Height = 25
      Caption = #36864#20986
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 69
      Top = 8
      Width = 67
      Height = 25
      Caption = #23548#20986'Excel'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Edit1: TEdit
      Left = 493
      Top = 8
      Width = 89
      Height = 21
      TabStop = False
      Color = cl3DLight
      ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
      ReadOnly = True
      TabOrder = 2
      Text = '0.00'
    end
    object Edit2: TEdit
      Left = 663
      Top = 8
      Width = 121
      Height = 21
      TabStop = False
      Color = cl3DLight
      ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
      ReadOnly = True
      TabOrder = 3
      Text = '0.0000'
    end
    object Edit3: TEdit
      Left = 274
      Top = 5
      Width = 121
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
      ParentFont = False
      TabOrder = 4
      OnChange = Edit3Change
    end
  end
  object DBGrid1: TDBGridEh
    Left = 0
    Top = 41
    Width = 790
    Height = 489
    Align = alClient
    DataSource = DataSource1
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = GB2312_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    ImeName = #20013#25991'('#31616#20307') - '#26497#28857#20116#31508
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = N1Click
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'PO_REQ_NUMBER'
        Footers = <>
        Width = 92
      end
      item
        EditButtons = <>
        FieldName = 'DEPARTMENT_NAME'
        Footers = <>
        Width = 61
      end
      item
        EditButtons = <>
        FieldName = 'INV_PART_NUMBER'
        Footers = <>
        Width = 115
      end
      item
        EditButtons = <>
        FieldName = 'INV_PART_description'
        Footers = <>
        Width = 167
      end
      item
        EditButtons = <>
        FieldName = 'REQ_DATE'
        Footers = <>
        Width = 66
      end
      item
        EditButtons = <>
        FieldName = 'ENT_DATE'
        Footers = <>
        Width = 87
      end
      item
        EditButtons = <>
        FieldName = 'AUTH_DATE'
        Footers = <>
        Width = 82
      end
      item
        EditButtons = <>
        FieldName = 'EDITED_DATE'
        Footers = <>
        Width = 81
      end
      item
        EditButtons = <>
        FieldName = 'EMPLOYEE_NAME'
        Footers = <>
        Width = 67
      end
      item
        EditButtons = <>
        FieldName = 'v_status'
        Footers = <>
        Width = 73
      end
      item
        EditButtons = <>
        FieldName = 'abbr_name'
        Footers = <>
        Width = 73
      end
      item
        EditButtons = <>
        FieldName = 'CODE'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'QUANTITY'
        Footers = <>
        Width = 45
      end
      item
        EditButtons = <>
        FieldName = 'unit_name'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'tax_PRICE'
        Footers = <>
        Width = 58
      end
      item
        EditButtons = <>
        FieldName = 'total'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'reason'
        Footers = <>
        Width = 114
      end
      item
        EditButtons = <>
        FieldName = 'rohs'
        Footers = <>
        Width = 55
      end
      item
        EditButtons = <>
        FieldName = 'extra_req'
        Footers = <>
        Width = 142
      end
      item
        EditButtons = <>
        FieldName = 'names'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'note_pad_line_1'
        Footers = <>
        Title.Caption = #36864#22238#21407#22240
        Width = 100
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 592
    Top = 11
  end
  object ADOQuery1: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      
        'SELECT Data0068.PO_REQ_NUMBER,Data0068.DEPARTMENT_NAME,data0068.' +
        'AUTH_DATE,'
      
        '      Data0068.REQ_DATE,Data0068.STATUS,Data0005.EMPLOYEE_NAME,c' +
        'onvert(varchar,derivedtbl_1.names) as names,'
      
        '      Data0015.abbr_NAME,Data0017.INV_PART_NUMBER,Data0017.INV_P' +
        'ART_description,'
      
        '      Data0069.QUANTITY, Data0069.tax_PRICE, Data0023.abbr_name ' +
        'as code,'
      
        '      Data0001.CURR_CODE,data0069.reason,data0068.ENT_DATE,data0' +
        '069.extra_req,'
      
        '      Data0069.QUANTITY * Data0069.tax_PRICE * Data0001.BASE_TO_' +
        'OTHER'
      
        '       AS total,data0068.rkey,data0068.EDITED_DATE,data0069.rohs' +
        ',data0002.unit_name,data0011.note_pad_line_1'
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
      
        '        inner join data0002 on data0069.unit_ptr=data0002.rkey L' +
        'EFT OUTER join'
      
        '      dbo.Data0011 ON dbo.Data0068.rkey = dbo.Data0011.file_poin' +
        'ter'
      'LEFT OUTER JOIN (SELECT purchase_ptr, [names]=STUFF'
      '      ((SELECT '#39','#39' + Data0073.USER_FULL_NAME'
      
        '          FROM  dbo.data0276 inner join Data0073 on data0276.use' +
        'r_ptr=Data0073.RKEY'
      '          WHERE data0276.purchase_ptr=tb.purchase_ptr'
      
        '          order by data0276.ranking    FOR XML PATH('#39#39') ), 1, 1,' +
        ' '#39#39')'
      
        'FROM   dbo.data0276 AS tb GROUP BY purchase_ptr) AS derivedtbl_1' +
        ' on data0068.rkey=derivedtbl_1.purchase_ptr'
      'where Data0069.QUANTITY>0')
    Left = 624
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
      Size = 16
    end
    object ADOQuery1QUANTITY: TFloatField
      DisplayLabel = #25968#37327
      DisplayWidth = 15
      FieldName = 'QUANTITY'
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
    object ADOQuery1tax_PRICE: TFloatField
      DisplayLabel = #21547#31246#20215
      FieldName = 'tax_PRICE'
    end
    object ADOQuery1rohs: TStringField
      DisplayLabel = #29615#20445#26631#35782
      FieldName = 'rohs'
      Size = 10
    end
    object ADOQuery1unit_name: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'unit_name'
    end
    object ADOQuery1extra_req: TStringField
      DisplayLabel = #29305#21035#35201#27714
      DisplayWidth = 20
      FieldName = 'extra_req'
      Size = 50
    end
    object ADOQuery1names: TStringField
      DisplayLabel = #35831#36141#23457#25209#20154
      FieldName = 'names'
      ReadOnly = True
      Size = 30
    end
    object ADOQuery1note_pad_line_1: TStringField
      FieldName = 'note_pad_line_1'
      Size = 300
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
