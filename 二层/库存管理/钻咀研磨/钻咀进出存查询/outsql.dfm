object Form3: TForm3
  Left = 196
  Top = 125
  Width = 814
  Height = 578
  Caption = #38075#21632#20986#20179#26126#32454
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 806
    Height = 510
    Align = alClient
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'number'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'type'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_PART_NUMBER'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_PART_DESCRIPTION'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OH_degree'
        ReadOnly = False
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantity222'
        ReadOnly = False
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantity221'
        ReadOnly = False
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'sys_date'
        ReadOnly = False
        Width = 139
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPL_CODE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'auth_EMPL_CODE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'auth_EMPLOYEE_NAME'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'auth_date'
        ReadOnly = False
        Width = 136
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCATION_CODE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'LOCATION_NAME'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUPPLIER_NAME'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'reference221'
        Width = -1
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'reference222'
        Width = 168
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 806
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      806
      41)
    object Label1: TLabel
      Left = 458
      Top = 4
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = '  '#25968#37327#21512#35745
    end
    object Label3: TLabel
      Left = 225
      Top = 13
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop]
      Caption = #20986#20179#21333#21495
    end
    object Button1: TButton
      Left = 7
      Top = 8
      Width = 68
      Height = 25
      Caption = #36864#20986
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 77
      Top = 8
      Width = 68
      Height = 25
      Caption = #23548#20986'Excel'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 147
      Top = 8
      Width = 68
      Height = 25
      Caption = #25171#21360#25253#34920
      TabOrder = 2
      Visible = False
      OnClick = Button3Click
    end
    object Edit1: TEdit
      Left = 466
      Top = 18
      Width = 89
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 3
      Text = '0.00'
    end
    object Edit3: TEdit
      Left = 289
      Top = 10
      Width = 152
      Height = 21
      Anchors = [akTop]
      TabOrder = 4
      OnChange = Edit3Change
    end
    object Button4: TButton
      Left = 147
      Top = 8
      Width = 68
      Height = 25
      Caption = #23383#27573
      PopupMenu = PopupMenu2
      TabOrder = 5
      OnClick = Button4Click
    end
  end
  object ado207: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'SELECT     dbo.DATA0221.number, '
      
        '                      CASE dbo.DATA0221.type WHEN 1 THEN '#39#30452#25509#20986#20179#39' ' +
        'WHEN 2 THEN '#39#24453#32763#30952#20179#20986#20179#39' WHEN 3 THEN '#39#26426#22120#20986#20179#39' WHEN 5 THEN '#39#25253#24223#20986#20179#39' END A' +
        'S type, '
      
        '                      dbo.DATA0221.status, dbo.Data0005.EMPL_COD' +
        'E, dbo.Data0005.EMPLOYEE_NAME, dbo.DATA0221.sys_date, dbo.DATA02' +
        '21.quantity AS quantity221, '
      
        '                      Data0005_1.EMPL_CODE AS auth_EMPL_CODE, Da' +
        'ta0005_1.EMPLOYEE_NAME AS auth_EMPLOYEE_NAME, dbo.DATA0221.auth_' +
        'date, '
      
        '                      dbo.DATA0221.reference AS reference221, db' +
        'o.DATA0222.quantity AS quantity222, dbo.DATA0222.reference AS re' +
        'ference222, '
      
        '                      dbo.Data0017.INV_PART_NUMBER, dbo.Data0017' +
        '.INV_PART_DESCRIPTION, dbo.DATA0160.LOCATION_CODE, dbo.DATA0160.' +
        'LOCATION_NAME, '
      
        '                      dbo.DATA0220.OH_degree, dbo.Data0023.CODE,' +
        ' dbo.Data0023.SUPPLIER_NAME, dbo.Data0023.ABBR_NAME'
      'FROM         dbo.DATA0221 INNER JOIN'
      
        '                      dbo.DATA0222 ON dbo.DATA0221.rkey = dbo.DA' +
        'TA0222.head_ptr INNER JOIN'
      
        '                      dbo.DATA0220 ON dbo.DATA0222.bach_ptr = db' +
        'o.DATA0220.RKEY INNER JOIN'
      
        '                      dbo.Data0005 ON dbo.DATA0221.empl_ptr = db' +
        'o.Data0005.RKEY INNER JOIN'
      
        '                      dbo.Data0017 ON dbo.DATA0220.INVENTORY_PTR' +
        ' = dbo.Data0017.RKEY INNER JOIN'
      
        '                      dbo.Data0023 ON dbo.DATA0220.SUPPLIER_PTR ' +
        '= dbo.Data0023.RKEY INNER JOIN'
      
        '                      dbo.DATA0160 ON dbo.DATA0220.LOCATION_PTR ' +
        '= dbo.DATA0160.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0005 AS Data0005_1 ON dbo.DATA0221' +
        '.auth_empl_ptr = Data0005_1.RKEY'
      'WHERE     (dbo.DATA0221.status = 2)')
    Left = 208
    Top = 464
    object ado207number: TStringField
      DisplayLabel = #20986#20179#21333#21495
      FieldName = 'number'
      Size = 10
    end
    object ado207type: TStringField
      DisplayLabel = #20986#20179#31867#22411
      FieldName = 'type'
      ReadOnly = True
      Size = 12
    end
    object ado207status: TWordField
      DisplayLabel = #29366#24577
      FieldName = 'status'
    end
    object ado207EMPL_CODE: TStringField
      DisplayLabel = #20986#20179#21592#24037#20195#30721
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object ado207EMPLOYEE_NAME: TStringField
      DisplayLabel = #20986#20179#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ado207sys_date: TDateTimeField
      DisplayLabel = #20986#20179#26085#26399
      FieldName = 'sys_date'
    end
    object ado207quantity221: TIntegerField
      DisplayLabel = #20986#20179#21333#24635#25968#37327
      FieldName = 'quantity221'
    end
    object ado207auth_EMPL_CODE: TStringField
      DisplayLabel = #23457#25209#20154#20195#30721
      FieldName = 'auth_EMPL_CODE'
      Size = 10
    end
    object ado207auth_EMPLOYEE_NAME: TStringField
      DisplayLabel = #23457#25209#20154
      FieldName = 'auth_EMPLOYEE_NAME'
      Size = 16
    end
    object ado207auth_date: TDateTimeField
      DisplayLabel = #23457#25209#26085#26399
      FieldName = 'auth_date'
    end
    object ado207reference221: TStringField
      DisplayLabel = #20986#20179#21333#22791#27880
      FieldName = 'reference221'
      Size = 100
    end
    object ado207quantity222: TIntegerField
      DisplayLabel = #20986#20179#25968#37327
      FieldName = 'quantity222'
    end
    object ado207reference222: TStringField
      DisplayLabel = #20986#20179#26126#32454#22791#27880
      FieldName = 'reference222'
      Size = 50
    end
    object ado207INV_PART_NUMBER: TStringField
      DisplayLabel = #38075#21632#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ado207INV_PART_DESCRIPTION: TStringField
      DisplayLabel = #38075#21632#35268#26684
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object ado207LOCATION_CODE: TStringField
      DisplayLabel = #20301#32622#20195#30721
      FieldName = 'LOCATION_CODE'
      Size = 10
    end
    object ado207LOCATION_NAME: TStringField
      DisplayLabel = #20301#32622#35828#26126
      FieldName = 'LOCATION_NAME'
      Size = 50
    end
    object ado207OH_degree: TWordField
      DisplayLabel = #32763#30952#27425#25968
      FieldName = 'OH_degree'
    end
    object ado207CODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object ado207SUPPLIER_NAME: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object ado207ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
  end
  object DataSource1: TDataSource
    DataSet = ado207
    Left = 176
    Top = 464
  end
  object PopupMenu2: TPopupMenu
    AutoHotkeys = maManual
    Left = 576
    Top = 6
  end
end
