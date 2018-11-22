object Form3: TForm3
  Left = 202
  Top = 114
  Width = 797
  Height = 556
  Caption = #26448#26009#21457#25918#28165#21333
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 789
    Height = 485
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
        FieldName = 'REF457_NUMBER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GON_NUMBER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_PART_NUMBER'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inv_name'
        Width = 166
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_DESCRIPTION'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inv_group_name'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GROUP_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEPT_NAME'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TDATE'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTITY'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRICE'
        Title.Caption = #21547#31246#20215
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = #19981#21547#31246#20215
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26412#24065#19981#21547#31246#37329#39069
        Width = 121
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total_price'
        Title.Caption = #21547#31246#37329#39069'('#26412#20301#24065'))'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RTN_QUANTITY'
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
        FieldName = 'recd_employee'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BARCODE_ID'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 789
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      789
      41)
    object Label1: TLabel
      Left = 558
      Top = 4
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = '  '#25968#37327#21512#35745
    end
    object Label2: TLabel
      Left = 660
      Top = 3
      Width = 78
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = #19981#21547#37329#39069#21512#35745
    end
    object Label3: TLabel
      Left = 307
      Top = 21
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop]
      Caption = #26448#26009#32534#30721
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
      OnClick = Button3Click
    end
    object Edit1: TEdit
      Left = 566
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
    object Edit2: TEdit
      Left = 663
      Top = 18
      Width = 113
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 4
      Text = '0.0000'
    end
    object Edit3: TEdit
      Left = 368
      Top = 18
      Width = 152
      Height = 21
      Anchors = [akTop]
      TabOrder = 5
      OnChange = Edit3Change
    end
  end
  object ado207: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'SELECT dbo.Data0457.REF_NUMBER AS REF457_NUMBER,'
      '      dbo.Data0457.GON_NUMBER, dbo.Data0017.INV_PART_NUMBER,'
      '      dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION,'
      
        '      dbo.Data0496.GROUP_NAME, dbo.Data0034.DEPT_NAME, dbo.Data0' +
        '207.TDATE,'
      
        '      Data0207.QUANTITY, Data0207.RTN_QUANTITY,Data0001.CURR_COD' +
        'E,'
      '      ROUND(dbo.Data0022.PRICE * dbo.Data0022.EXCHANGE_RATE, 4)'
      
        '      AS STANDARD_COST, Data0022.BARCODE_ID, data0019.inv_group_' +
        'name,'
      
        '      Data0022.PRICE, round(Data0022.PRICE/(1+Data0022.TAX_2*0.0' +
        '1),2) as '#19981#21547#31246#20215','
      
        '      ROUND(Data0207.QUANTITY * Data0022.PRICE * Data0022.EXCHAN' +
        'GE_RATE,'
      '       4) AS total_price,'
      
        '      ROUND(Data0207.QUANTITY * Data0022.PRICE * Data0022.EXCHAN' +
        'GE_RATE/'
      '      (1+Data0022.TAX_2*0.01), 2) AS '#26412#24065#19981#21547#31246#37329#39069','
      '        Data0023.ABBR_NAME, Data0002.UNIT_NAME,'
      
        '      Data0005.EMPLOYEE_NAME, Data0005_1.EMPLOYEE_NAME AS recd_e' +
        'mployee'
      'FROM dbo.Data0207 INNER JOIN'
      
        '      dbo.Data0457 ON dbo.Data0207.GON_PTR = dbo.Data0457.RKEY I' +
        'NNER JOIN'
      
        '      dbo.Data0034 ON dbo.Data0207.DEPT_PTR = dbo.Data0034.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0017 ON dbo.Data0207.INVENTORY_PTR = dbo.Data0017.' +
        'RKEY INNER JOIN'
      
        '      dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY' +
        ' INNER JOIN'
      
        '      dbo.Data0022 ON dbo.Data0207.D0022_PTR = dbo.Data0022.RKEY' +
        ' INNER JOIN'
      
        '      dbo.data0019 ON dbo.Data0496.GROUP_PTR = dbo.data0019.rkey' +
        ' INNER JOIN'
      
        '      dbo.Data0001 ON dbo.Data0022.CURRENCY_PTR = dbo.Data0001.R' +
        'KEY INNER JOIN'
      '      dbo.Data0002 ON'
      
        '      dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0002.RKEY INNER J' +
        'OIN'
      
        '      dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY I' +
        'NNER JOIN'
      
        '      dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY ' +
        'INNER JOIN'
      '      dbo.Data0005 ON'
      '      dbo.Data0457.CREATE_BY = dbo.Data0005.RKEY LEFT OUTER JOIN'
      
        '      dbo.Data0005 Data0005_1 ON dbo.Data0457.RECD_BY = Data0005' +
        '_1.RKEY'
      'WHERE (dbo.Data0207.QUANTITY <> 0)')
    Left = 208
    Top = 464
    object ado207GON_NUMBER: TStringField
      DisplayLabel = #20986#20179#21333#21495
      FieldName = 'GON_NUMBER'
      FixedChar = True
      Size = 10
    end
    object ado207INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ado207INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ado207inv_group_name: TStringField
      DisplayLabel = #26448#26009#32452#21035
      FieldName = 'inv_group_name'
    end
    object ado207GROUP_NAME: TStringField
      DisplayLabel = #26448#26009#31867#21035
      FieldName = 'GROUP_NAME'
      Size = 10
    end
    object ado207DEPT_NAME: TStringField
      DisplayLabel = #21457#25918#37096#38376
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ado207TDATE: TDateTimeField
      DisplayLabel = #21457#25918#26085#26399
      FieldName = 'TDATE'
    end
    object ado207QUANTITY: TBCDField
      DisplayLabel = #21457#25918#25968#37327
      FieldName = 'QUANTITY'
      Precision = 19
    end
    object ado207RTN_QUANTITY: TFloatField
      DisplayLabel = #36864#36135#25968#37327
      FieldName = 'RTN_QUANTITY'
    end
    object ado207CURR_CODE: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ado207PRICE: TFloatField
      DisplayLabel = #20215#26684
      FieldName = 'PRICE'
    end
    object ado207STANDARD_COST: TFloatField
      DisplayLabel = #20215#26684'('#26412#20301#24065')'
      FieldName = 'STANDARD_COST'
      ReadOnly = True
    end
    object ado207total_price: TFloatField
      DisplayLabel = #21547#31246#37329#39069'('#26412#20301#24065')'
      FieldName = 'total_price'
      ReadOnly = True
    end
    object ado207BARCODE_ID: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'BARCODE_ID'
      FixedChar = True
      Size = 12
    end
    object ado207REF_NUMBER: TStringField
      DisplayLabel = #39046#26009#21333#21495
      FieldName = 'REF457_NUMBER'
      FixedChar = True
      Size = 15
    end
    object ado207ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ado207inv_name: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'inv_name'
      Size = 30
    end
    object ado207UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      DisplayWidth = 10
      FieldName = 'UNIT_NAME'
    end
    object ado207EMPLOYEE_NAME: TStringField
      DisplayLabel = #21457#25918#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ado207recd_employee: TStringField
      DisplayLabel = #39046#26009#20154#21592
      FieldName = 'recd_employee'
      Size = 16
    end
    object ado207DSDesigner: TBCDField
      FieldName = #19981#21547#31246#20215
      ReadOnly = True
      Precision = 22
      Size = 12
    end
    object ado207DSDesigner2: TBCDField
      DisplayLabel = #19981#21547#31246#37329#39069'('#26412#20301#24065')'
      FieldName = #26412#24065#19981#21547#31246#37329#39069
      ReadOnly = True
      Precision = 38
      Size = 7
    end
  end
  object DataSource1: TDataSource
    DataSet = ado207
    Left = 176
    Top = 464
  end
end
