object Form_episearch: TForm_episearch
  Left = 277
  Top = 139
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #22806#21457#21152#24037#30003#35831#26597#35810
  ClientHeight = 530
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 169
    Top = 11
    Width = 72
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #25910#36135#21333#21495
  end
  object Edit1: TEdit
    Left = 247
    Top = 7
    Width = 121
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 35
    Width = 624
    Height = 249
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'DELIVER_NUMBER'
        Title.Color = clRed
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'epiboly_number'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEPT_NAME'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME_1'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENT_DATE'
        ReadOnly = False
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 213
    Top = 493
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 2
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 301
    Top = 493
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 3
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 289
    Width = 626
    Height = 196
    DataSource = DataSource2
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'MANU_PART_NUMBER'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STANDARD'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rece_quantity'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rework_qry'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REMARK'
        Width = 87
        Visible = True
      end>
  end
  object Aqwz303: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'SELECT  dbo.WZDATA303.RKEY, dbo.WZDATA300.epiboly_number,'
      '        dbo.WZDATA303.DELIVER_NUMBER, dbo.WZDATA300.dept_ptr, '
      '        dbo.Data0034.DEPT_NAME, dbo.Data0034.DEPT_CODE, '
      '        dbo.WZDATA303.SUPP_PTR, dbo.Data0023.CODE, '
      '        dbo.Data0023.SUPPLIER_NAME, dbo.Data0023.ABBR_NAME,'
      '        dbo.WZDATA303.ENT_DATE, dbo.Data0005.EMPLOYEE_NAME,'
      
        '        dbo.Data0015.WAREHOUSE_CODE,dbo.Data0015.ABBR_NAME AS AB' +
        'BR_NAME_1'
      'FROM dbo.WZDATA303 INNER JOIN'
      
        '     dbo.Data0023 ON dbo.WZDATA303.SUPP_PTR = dbo.Data0023.RKEY ' +
        'INNER JOIN'
      '     dbo.Data0034 INNER JOIN'
      
        '     dbo.WZDATA300 ON dbo.Data0034.RKEY = dbo.WZDATA300.dept_ptr' +
        ' ON dbo.WZDATA303.EPIBOLY_PTR = dbo.WZDATA300.rkey INNER JOIN'
      
        '     dbo.Data0005 ON dbo.WZDATA303.EMPL_PTR = dbo.Data0005.RKEY ' +
        'INNER JOIN'
      
        '     dbo.Data0015 ON dbo.WZDATA300.warehouse_ptr = dbo.Data0015.' +
        'RKEY'
      'WHERE (dbo.WZDATA303.STATUS > 1)'
      ''
      'ORDER BY dbo.WZDATA300.epiboly_number')
    Left = 496
    Top = 468
    object Aqwz303RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object Aqwz303epiboly_number: TStringField
      DisplayLabel = #22806#21457#32534#21495
      FieldName = 'epiboly_number'
      Size = 15
    end
    object Aqwz303DELIVER_NUMBER: TStringField
      DisplayLabel = #25910#36135#21333#21495
      FieldName = 'DELIVER_NUMBER'
      Size = 15
    end
    object Aqwz303dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object Aqwz303DEPT_NAME: TStringField
      DisplayLabel = #22806#21457#24037#24207
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object Aqwz303DEPT_CODE: TStringField
      DisplayLabel = #22806#21457#24037#24207#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object Aqwz303SUPP_PTR: TIntegerField
      FieldName = 'SUPP_PTR'
    end
    object Aqwz303CODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object Aqwz303SUPPLIER_NAME: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object Aqwz303ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object Aqwz303ENT_DATE: TDateTimeField
      DisplayLabel = #25910#36135#26085#26399
      FieldName = 'ENT_DATE'
    end
    object Aqwz303EMPLOYEE_NAME: TStringField
      DisplayLabel = #25910#36135#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object Aqwz303WAREHOUSE_CODE: TStringField
      DisplayLabel = #24037#21378#20195#30721
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object Aqwz303ABBR_NAME_1: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'ABBR_NAME_1'
      Size = 10
    end
  end
  object DataSource1: TDataSource
    DataSet = Aqwz303
    Left = 464
    Top = 468
  end
  object DataSource2: TDataSource
    DataSet = Aqwz304
    Left = 464
    Top = 500
  end
  object Aqwz304: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT dbo.WZDATA304.DELIVER_PTR, dbo.WZDATA301.CUSTPART_PTR, '
      
        '       dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DES' +
        'C, '
      '       dbo.WZDATA301.STANDARD, dbo.WZDATA301.UNIT_NAME, '
      '       dbo.WZDATA304.rece_quantity, dbo.WZDATA304.rework_qry, '
      
        '       dbo.WZDATA304.REMARK,dbo.Data0025.rkey as rkey25,dbo.WZDA' +
        'TA304.RKEY'
      'FROM dbo.WZDATA304 INNER JOIN'
      
        '     dbo.WZDATA301 ON dbo.WZDATA304.EPILIST_PTR = dbo.WZDATA301.' +
        'RKEY INNER JOIN'
      
        '     dbo.Data0025 ON dbo.WZDATA301.CUSTPART_PTR = dbo.Data0025.R' +
        'KEY'
      
        'WHERE /* (dbo.WZDATA304.rece_quantity> dbo.WZDATA304.rework_qry)' +
        ' '
      '      AND */(dbo.WZDATA304.DELIVER_PTR = :rkey )'
      'ORDER BY dbo.Data0025.MANU_PART_NUMBER')
    Left = 496
    Top = 500
    object Aqwz304DELIVER_PTR: TIntegerField
      FieldName = 'DELIVER_PTR'
    end
    object Aqwz304CUSTPART_PTR: TIntegerField
      FieldName = 'CUSTPART_PTR'
    end
    object Aqwz304MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object Aqwz304MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object Aqwz304STANDARD: TStringField
      DisplayLabel = #35268#26684
      FieldName = 'STANDARD'
      Size = 30
    end
    object Aqwz304UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
      Size = 10
    end
    object Aqwz304rece_quantity: TIntegerField
      DisplayLabel = #25910#36135#25968#37327
      FieldName = 'rece_quantity'
    end
    object Aqwz304rework_qry: TIntegerField
      DisplayLabel = #24050#36820#24037#25968#37327
      FieldName = 'rework_qry'
    end
    object Aqwz304REMARK: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REMARK'
      Size = 50
    end
    object Aqwz304rkey25: TIntegerField
      FieldName = 'rkey25'
      ReadOnly = True
    end
    object Aqwz304RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
  end
end
