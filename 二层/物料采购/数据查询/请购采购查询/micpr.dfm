object Form3: TForm3
  Left = 203
  Top = 164
  Width = 798
  Height = 561
  Caption = #38750#29983#20135#29289#26009#35831#36141#21015#34920
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
    Width = 782
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 374
      Top = 12
      Width = 113
      Height = 13
      Alignment = taRightJustify
      Caption = '    '#35831#36141#25968#37327#21512#35745':'
    end
    object Label2: TLabel
      Left = 575
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
      Left = 1
      Top = 8
      Width = 68
      Height = 25
      Caption = #36864#20986
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 68
      Top = 8
      Width = 68
      Height = 25
      Caption = #23548#20986'Excel'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Edit1: TEdit
      Left = 494
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
      Left = 664
      Top = 8
      Width = 121
      Height = 21
      TabStop = False
      Color = cl3DLight
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
      ParentFont = False
      TabOrder = 4
      OnChange = Edit3Change
    end
  end
  object DBGrid1: TDBGridEh
    Left = 0
    Top = 41
    Width = 782
    Height = 482
    Align = alClient
    DataSource = DataSource1
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = GB2312_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
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
      end
      item
        EditButtons = <>
        FieldName = 'DEPARTMENT_NAME'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'DESCRIPTION_1'
        Footers = <>
        Width = 157
      end
      item
        EditButtons = <>
        FieldName = 'gui_ge'
        Footers = <>
        Width = 104
      end
      item
        EditButtons = <>
        FieldName = 'REQ_DATE'
        Footers = <>
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'ENT_DATE'
        Footers = <>
        Width = 81
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
        Width = 87
      end
      item
        EditButtons = <>
        FieldName = 'EMPLOYEE_NAME'
        Footers = <>
        Width = 59
      end
      item
        EditButtons = <>
        FieldName = 'v_status'
        Footers = <>
        Width = 73
      end
      item
        EditButtons = <>
        FieldName = 'WAREHOUSE_NAME'
        Footers = <>
        Width = 53
      end
      item
        EditButtons = <>
        FieldName = 'DESCRIPTION_2'
        Footers = <>
        Width = 59
      end
      item
        EditButtons = <>
        FieldName = 'abbr_name'
        Footers = <>
        Width = 57
      end
      item
        EditButtons = <>
        FieldName = 'QUANTITY_REQUIRED'
        Footers = <>
        Width = 34
      end
      item
        EditButtons = <>
        FieldName = 'unit_name'
        Footers = <>
        Width = 32
      end
      item
        EditButtons = <>
        FieldName = 'CURR_CODE'
        Footers = <>
        Width = 34
      end
      item
        EditButtons = <>
        FieldName = 'tax_PRICE'
        Footers = <>
        Width = 45
      end
      item
        EditButtons = <>
        FieldName = 'total'
        Footers = <>
        Width = 63
      end
      item
        EditButtons = <>
        FieldName = 'reason'
        Footers = <>
        Width = 111
      end
      item
        EditButtons = <>
        FieldName = 'rohs'
        Footers = <>
        Width = 58
      end
      item
        EditButtons = <>
        FieldName = 'names'
        Footers = <>
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 656
    Top = 3
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
      'SELECT Data0068.PO_REQ_NUMBER,Data0068.DEPARTMENT_NAME,'
      '      Data0068.REQ_DATE, Data0068.STATUS,Data0005.EMPLOYEE_NAME,'
      
        '      Data0015.abbr_NAME as warehouse_name,Data0204.DESCRIPTION_' +
        '1,'
      
        '      Data0204.DESCRIPTION_2,Data0023.abbr_name,data0068.AUTH_DA' +
        'TE,'
      
        '      Data0204.QUANTITY_REQUIRED,Data0204.tax_PRICE,data0204.roh' +
        's,'
      
        '      Data0001.CURR_CODE,data0204.gui_ge,data0204.reason,convert' +
        '(varchar,derivedtbl_1.[names]) as names,'
      
        '      Data0204.QUANTITY_REQUIRED * Data0204.tax_PRICE * Data0001' +
        '.BASE_TO_OTHER'
      
        '       AS total,data0068.rkey,data0068.ENT_DATE,data0068.EDITED_' +
        'DATE,data0002.unit_name'
      'FROM data0005 INNER JOIN  Data0068'
      '     ON dbo.Data0005.RKEY = dbo.Data0068.REQ_BY inner join'
      
        '      dbo.Data0015 ON dbo.Data0068.WHSE_PTR = dbo.Data0015.RKEY ' +
        'INNER JOIN'
      '      dbo.Data0204 ON'
      
        '      dbo.Data0068.RKEY = dbo.Data0204.PURCHASE_REQ_PTR LEFT OUT' +
        'ER JOIN'
      '      dbo.Data0001 ON'
      
        '      dbo.Data0204.PO_LINK_PTR = dbo.Data0001.RKEY LEFT OUTER JO' +
        'IN'
      
        '      dbo.Data0023 ON dbo.Data0204.SUPPLIER_PTR = dbo.Data0023.R' +
        'KEY inner join data0002 on data0204.g_l_ptr=data0002.rkey'
      'LEFT OUTER JOIN (SELECT purchase_ptr, [names]=STUFF'
      '      ((SELECT '#39','#39' + Data0073.USER_FULL_NAME'
      
        '          FROM  dbo.data0276 inner join Data0073 on data0276.use' +
        'r_ptr=Data0073.RKEY'
      '          WHERE data0276.purchase_ptr=tb.purchase_ptr'
      
        '          order by data0276.ranking    FOR XML PATH('#39#39') ), 1, 1,' +
        ' '#39#39')'
      
        'FROM   dbo.data0276 AS tb GROUP BY purchase_ptr) AS derivedtbl_1' +
        ' on data0068.rkey=derivedtbl_1.purchase_ptr'
      'where quantity_required>0')
    Left = 720
    Top = 3
    object ADOQuery1PO_REQ_NUMBER: TStringField
      DisplayLabel = #35831#36141#32534#21495
      DisplayWidth = 17
      FieldName = 'PO_REQ_NUMBER'
      Size = 15
    end
    object ADOQuery1DEPARTMENT_NAME: TStringField
      DisplayLabel = #35831#36141#37096#38376
      DisplayWidth = 10
      FieldName = 'DEPARTMENT_NAME'
    end
    object ADOQuery1DESCRIPTION_1: TStringField
      DisplayLabel = #29289#21697#21517#31216
      DisplayWidth = 25
      FieldName = 'DESCRIPTION_1'
      Size = 60
    end
    object ADOQuery1gui_ge: TStringField
      DisplayLabel = #29289#21697#35268#26684
      FieldName = 'gui_ge'
      Size = 200
    end
    object ADOQuery1REQ_DATE: TDateTimeField
      DisplayLabel = #35831#36141#26085#26399
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
      DisplayWidth = 17
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOQuery1v_status: TStringField
      DisplayLabel = #35831#36141#21333#35013#24577
      DisplayWidth = 17
      FieldKind = fkCalculated
      FieldName = 'v_status'
      Size = 14
      Calculated = True
    end
    object ADOQuery1WAREHOUSE_NAME: TStringField
      DisplayLabel = #24037#21378
      DisplayWidth = 15
      FieldName = 'WAREHOUSE_NAME'
      Size = 10
    end
    object ADOQuery1DESCRIPTION_2: TStringField
      DisplayLabel = #29289#21697#31867#21035
      DisplayWidth = 13
      FieldName = 'DESCRIPTION_2'
      FixedChar = True
    end
    object ADOQuery1CODE: TStringField
      DisplayLabel = #20379#24212#21830
      DisplayWidth = 9
      FieldName = 'abbr_name'
      Size = 16
    end
    object ADOQuery1QUANTITY_REQUIRED: TFloatField
      DisplayLabel = #25968#37327
      DisplayWidth = 15
      FieldName = 'QUANTITY_REQUIRED'
    end
    object ADOQuery1CURR_CODE: TStringField
      DisplayLabel = #36135#24065
      DisplayWidth = 7
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADOQuery1total: TFloatField
      DisplayLabel = #24635#35745#37329#39069
      DisplayWidth = 15
      FieldName = 'total'
      ReadOnly = True
      DisplayFormat = '0.000'
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
    object wdstrngfldADOQuery1reason: TWideStringField
      DisplayLabel = #35831#36141#21407#22240
      FieldName = 'reason'
      Size = 50
    end
    object ADOQuery1names: TStringField
      DisplayLabel = #35831#36141#23457#25209#20154
      FieldName = 'names'
      ReadOnly = True
      Size = 30
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 656
    Top = 184
    object N1: TMenuItem
      Caption = #23457#25209#20449#24687
      OnClick = N1Click
    end
  end
end
