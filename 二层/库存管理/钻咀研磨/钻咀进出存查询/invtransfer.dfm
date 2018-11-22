object Form5: TForm5
  Left = 226
  Top = 224
  Width = 802
  Height = 510
  Caption = #38075#21632#36716#31227#26597#35810
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 794
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      794
      41)
    object Label3: TLabel
      Left = 297
      Top = 13
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop]
      Caption = #38075#21632#32534#30721
    end
    object Label1: TLabel
      Left = 518
      Top = 12
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = '  '#25968#37327#21512#35745
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
    object Button3: TButton
      Left = 200
      Top = 8
      Width = 75
      Height = 25
      Caption = #23383#27573
      PopupMenu = PopupMenu1
      TabOrder = 2
      OnClick = Button3Click
    end
    object Edit3: TEdit
      Left = 351
      Top = 9
      Width = 152
      Height = 21
      Anchors = [akTop]
      TabOrder = 3
      OnChange = Edit3Change
    end
    object Edit1: TEdit
      Left = 590
      Top = 8
      Width = 89
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 4
      Text = '0.00'
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 794
    Height = 442
    Align = alClient
    DataSource = DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
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
        FieldName = 'INV_PART_NUMBER'
        ReadOnly = True
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_PART_DESCRIPTION'
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODE'
        ReadOnly = True
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        ReadOnly = True
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUPPLIER_NAME'
        ReadOnly = True
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'LOCATION_CODE_FROM'
        ReadOnly = True
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'LOCATION_NAME_FROM'
        ReadOnly = True
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCATION_CODE_TO'
        ReadOnly = True
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'LOCATION_NAME_TO'
        ReadOnly = True
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTITY'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TDATE'
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPL_CODE'
        ReadOnly = True
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        ReadOnly = True
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TYPE_CHS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REF_NUMBER'
        ReadOnly = True
        Width = 121
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = ado27
    Left = 232
    Top = 360
  end
  object ado27: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_PART_D' +
        'ESCRIPTION, dbo.Data0023.CODE, dbo.Data0023.SUPPLIER_NAME,'
      
        '                      dbo.Data0023.ABBR_NAME, dbo.DATA0160.LOCAT' +
        'ION_CODE AS LOCATION_CODE_FROM, '
      
        '                      dbo.DATA0160.LOCATION_NAME AS LOCATION_NAM' +
        'E_FROM, DATA0160_1.LOCATION_CODE AS LOCATION_CODE_TO, '
      
        '                      DATA0160_1.LOCATION_NAME AS LOCATION_NAME_' +
        'TO, dbo.DATA0270.QUANTITY, dbo.DATA0270.TDATE, dbo.Data0005.EMPL' +
        '_CODE, '
      '                      dbo.Data0005.EMPLOYEE_NAME, '
      
        '                      CASE dbo.DATA0270.TYPE WHEN 1 THEN '#39#24211#25151#21040#38075#26426#39 +
        ' WHEN 2 THEN '#39#38075#26426#22238#20179#39' WHEN 3 THEN '#39#20379#24212#21830#30740#30952#39' WHEN 4 THEN '#39#30740#30952#22238#20179#39' END A' +
        'S TYPE_CHS,'
      '                       dbo.DATA0270.REF_NUMBER'
      'FROM         dbo.DATA0270 INNER JOIN'
      
        '                      dbo.DATA0220 ON dbo.DATA0270.bach_fromptr ' +
        '= dbo.DATA0220.RKEY INNER JOIN'
      
        '                      dbo.DATA0220 AS DATA0220_1 ON dbo.DATA0270' +
        '.bach_endptr = DATA0220_1.RKEY INNER JOIN'
      
        '                      dbo.Data0005 ON dbo.DATA0270.EMPL_PTR = db' +
        'o.Data0005.RKEY INNER JOIN'
      
        '                      dbo.Data0017 ON dbo.DATA0220.INVENTORY_PTR' +
        ' = dbo.Data0017.RKEY INNER JOIN'
      
        '                      dbo.Data0023 ON dbo.DATA0220.SUPPLIER_PTR ' +
        '= dbo.Data0023.RKEY INNER JOIN'
      
        '                      dbo.DATA0160 ON dbo.DATA0220.LOCATION_PTR ' +
        '= dbo.DATA0160.RKEY INNER JOIN'
      
        '                      dbo.DATA0160 AS DATA0160_1 ON DATA0220_1.L' +
        'OCATION_PTR = DATA0160_1.RKEY'
      'WHERE 1=1')
    Left = 266
    Top = 360
    object ado27INV_PART_NUMBER: TStringField
      DisplayLabel = #38075#21632#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ado27INV_PART_DESCRIPTION: TStringField
      DisplayLabel = #38075#21632#35268#26684
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object ado27CODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object ado27SUPPLIER_NAME: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object ado27ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ado27LOCATION_CODE_FROM: TStringField
      DisplayLabel = #36716#31227#21069#20301#32622#20195#30721
      FieldName = 'LOCATION_CODE_FROM'
      Size = 10
    end
    object ado27LOCATION_NAME_FROM: TStringField
      DisplayLabel = #36716#31227#21069#20301#32622
      FieldName = 'LOCATION_NAME_FROM'
      Size = 50
    end
    object ado27LOCATION_CODE_TO: TStringField
      DisplayLabel = #36716#31227#21518#20301#32622#20195#30721
      FieldName = 'LOCATION_CODE_TO'
      Size = 10
    end
    object ado27LOCATION_NAME_TO: TStringField
      DisplayLabel = #36716#31227#21518#20301#32622
      FieldName = 'LOCATION_NAME_TO'
      Size = 50
    end
    object ado27QUANTITY: TIntegerField
      DisplayLabel = #36716#31227#25968#37327
      FieldName = 'QUANTITY'
    end
    object ado27TDATE: TDateTimeField
      DisplayLabel = #36716#31227#26085#26399
      FieldName = 'TDATE'
    end
    object ado27EMPL_CODE: TStringField
      DisplayLabel = #36716#31227#21592#24037#20195#30721
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object ado27EMPLOYEE_NAME: TStringField
      DisplayLabel = #36716#31227#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ado27TYPE_CHS: TStringField
      DisplayLabel = #36716#31227#31867#22411
      FieldName = 'TYPE_CHS'
      ReadOnly = True
      Size = 10
    end
    object ado27REF_NUMBER: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REF_NUMBER'
      Size = 100
    end
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    Left = 740
    Top = 6
  end
end
