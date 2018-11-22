object Form4: TForm4
  Left = 184
  Top = 103
  Width = 818
  Height = 574
  Caption = #25104#21697#24211#23384#27719#24635#28165#21333
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 49
    Width = 810
    Height = 498
    Align = alClient
    DataSource = DataSource1
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
        FieldName = 'MANU_PART_NUMBER'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Width = 133
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANALYSIS_CODE_2'
        Width = 175
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTY_ON_HAND'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROD_CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUCT_NAME'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUST_CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUSTOMER_NAME'
        Width = 157
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 810
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 297
      Top = 19
      Width = 80
      Height = 13
      Alignment = taRightJustify
      Caption = '   '#26412#21378#32534#21495':'
    end
    object Button1: TButton
      Left = 40
      Top = 12
      Width = 75
      Height = 25
      Caption = #36864#20986
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 120
      Top = 12
      Width = 75
      Height = 25
      Caption = #23548#20986'Excel'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 202
      Top = 12
      Width = 75
      Height = 25
      Caption = #25171#21360#25253#34920
      TabOrder = 2
      Visible = False
      OnClick = Button3Click
    end
    object Edit1: TEdit
      Left = 381
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 3
      OnChange = Edit1Change
    end
  end
  object Aq53: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     TOP 100 PERCENT dbo.Data0025.MANU_PART_NUMBER, dbo.Da' +
        'ta0025.MANU_PART_DESC, dbo.Data0025.ANALYSIS_CODE_2, dbo.Data000' +
        '8.PROD_CODE,'
      
        '                      dbo.Data0008.PRODUCT_NAME, dbo.Data0010.CU' +
        'ST_CODE, dbo.Data0010.CUSTOMER_NAME, dbo.Data0010.ABBR_NAME,'
      
        '                      SUM(dbo.DATA0153.QTY_ON_HAND) AS QTY_ON_HA' +
        'ND'
      'FROM         dbo.DATA0153 INNER JOIN'
      
        '                      dbo.Data0025 ON dbo.DATA0153.CUSTPART_PTR ' +
        '= dbo.Data0025.RKEY INNER JOIN'
      
        '                      dbo.Data0001 ON dbo.DATA0153.CURRENCY_PTR ' +
        '= dbo.Data0001.RKEY INNER JOIN'
      
        '                      dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR' +
        ' = dbo.Data0008.RKEY INNER JOIN'
      
        '                      dbo.Data0010 ON dbo.DATA0153.CUSTOMER_PTR ' +
        '= dbo.Data0010.RKEY'
      'where      dbo.DATA0153.QTY_ON_HAND > 0'
      
        'GROUP BY dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_D' +
        'ESC, dbo.Data0025.ANALYSIS_CODE_2, dbo.Data0008.PROD_CODE, dbo.D' +
        'ata0008.PRODUCT_NAME,'
      
        '                      dbo.Data0010.CUST_CODE, dbo.Data0010.CUSTO' +
        'MER_NAME, dbo.Data0010.ABBR_NAME'
      
        'ORDER BY dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_D' +
        'ESC')
    Left = 416
    Top = 456
    object Aq53MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object Aq53MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object Aq53PROD_CODE: TStringField
      DisplayLabel = #20135#21697#31867#22411#20195#30721
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object Aq53PRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#31867#22411#21517#31216
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object Aq53CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object Aq53CUSTOMER_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object Aq53ABBR_NAME: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object Aq53QTY_ON_HAND: TIntegerField
      DisplayLabel = #24211#23384#25968#37327
      FieldName = 'QTY_ON_HAND'
      ReadOnly = True
    end
    object Aq53ANALYSIS_CODE_2: TStringField
      DisplayLabel = #23458#25143#29289#26009#21495
      FieldName = 'ANALYSIS_CODE_2'
      Size = 50
    end
  end
  object DataSource1: TDataSource
    DataSet = Aq53
    Left = 384
    Top = 456
  end
end
