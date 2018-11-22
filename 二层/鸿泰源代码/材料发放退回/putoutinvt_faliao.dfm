object Form9: TForm9
  Left = 460
  Top = 184
  Width = 940
  Height = 565
  Caption = #21457#36135#26126#32454#26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 924
    Height = 39
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      924
      39)
    object Label1: TLabel
      Left = 204
      Top = 16
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #20986#36135#21333#21495
    end
    object Button1: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = #20851#38381
      ModalResult = 1
      TabOrder = 1
    end
    object Button2: TButton
      Left = 88
      Top = 8
      Width = 75
      Height = 25
      Caption = #23548#20986#25968#25454
      TabOrder = 2
      OnClick = Button2Click
    end
    object Edit1: TEdit
      Left = 265
      Top = 12
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
    object GroupBox2: TGroupBox
      Left = 450
      Top = 0
      Width = 259
      Height = 38
      Anchors = [akTop, akRight]
      Caption = #26085#26399#33539#22260
      TabOrder = 3
      object Label8: TLabel
        Left = 6
        Top = 17
        Width = 20
        Height = 13
        Alignment = taRightJustify
        Caption = #20174':'
      end
      object Label9: TLabel
        Left = 127
        Top = 17
        Width = 27
        Height = 13
        Alignment = taRightJustify
        Caption = ' '#21040':'
      end
      object dtpk1: TDateTimePicker
        Left = 30
        Top = 13
        Width = 97
        Height = 21
        Date = 37600.000000000000000000
        Time = 37600.000000000000000000
        TabOrder = 0
        OnCloseUp = dtpk1Exit
        OnExit = dtpk1Exit
      end
      object DTPk2: TDateTimePicker
        Left = 156
        Top = 13
        Width = 97
        Height = 21
        Date = 37600.000000000000000000
        Time = 37600.000000000000000000
        TabOrder = 1
        OnCloseUp = dtpk1Exit
        OnExit = dtpk1Exit
      end
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 39
    Width = 924
    Height = 488
    Align = alClient
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'GRN_NUMBER'
        Title.Color = clRed
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DELIVER_NUMBER'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_PART_NUMBER'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_NAME'
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_DESCRIPTION'
        Width = 142
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTITY'
        ReadOnly = False
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRICE'
        ReadOnly = False
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAX_2'
        ReadOnly = False
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_warehouse'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_type'
        Title.Caption = #20837#20179#31867#22411
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ship_DATE'
        ReadOnly = False
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'exch_rate'
        ReadOnly = False
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BARCODE_ID'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXPIRE_DATE'
        ReadOnly = False
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rohs'
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 39
    Width = 924
    Height = 488
    Align = alClient
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid2KeyDown
    OnTitleClick = DBGrid2TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = #20986#20179#21333#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = #39046#26009#21333#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26448#26009#32534#30721
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26448#26009#21517#31216
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26448#26009#35268#26684
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26448#26009#31867#22411
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20379#24212#21830
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = #39046#26009#37096#38376#20195#30721
        Visible = True
      end
      item
        Expanded = False
        FieldName = #39046#26009#37096#38376#21517#31216
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = #39046#26009#24037#21378
        Visible = True
      end
      item
        Expanded = False
        FieldName = #37096#38376#31867#22411
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21457#26009#25968#37327
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21333#20301
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21457#26009#26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21407#20379#24212#21830#25110#25209#21495
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = #39046#26009#20154#21592
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21457#26009#20179#24211
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21457#26009#20154#21592
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21457#26009#22791#27880
        Width = 160
        Visible = True
      end>
  end
  object AD457: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'dtpk1'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'dtpk2'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'select     s.REF_NUMBER AS '#39046#26009#21333#21495', s.GON_NUMBER as '#20986#20179#21333#21495','
      '           s.INV_PART_NUMBER as '#26448#26009#32534#30721', s.INV_NAME as '#26448#26009#21517#31216' , '
      #9#9'   s.INV_DESCRIPTION as '#26448#26009#35268#26684', s.GROUP_DESC as '#26448#26009#31867#22411', '
      #9#9'   s.ABBR_NAME as '#20379#24212#21830', s.a_abbm as '#39046#26009#24037#21378' ,'
      #9#9'   s.DEPT_CODE as '#39046#26009#37096#38376#20195#30721', s.DEPT_NAME as '#39046#26009#37096#38376#21517#31216' ,'
      #9#9'   CASE s.ttype WHEN  '#39'1'#39' THEN '#39#24037#24207#39'  else '#39#38750#24037#24207#39' END as '#37096#38376#31867#22411', '
      #9#9'   s.QUANTITY as '#21457#26009#25968#37327', s.UNIT_NAME as '#21333#20301' ,s.TDATE as '#21457#26009#26085#26399','
      #9#9'   s.SUPPLIER2 as '#21407#20379#24212#21830#25110#25209#21495', '
      #9#9'   s.EMPLOYEE_NAME as '#39046#26009#20154#21592', s.Cut_NO AS '#21457#26009#22791#27880', '
      #9#9'   s.LOCATION as '#21457#26009#20179#24211', '
      #9#9'   s. a_EMPLOYEE_NAME as   '#21457#26009#20154#21592
      'from ('
      '                      '
      'SELECT     dbo.Data0457.REF_NUMBER, dbo.Data0457.GON_NUMBER ,'
      
        '           dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME ,' +
        ' '
      
        '           dbo.Data0017.INV_DESCRIPTION , dbo.Data0496.GROUP_DES' +
        'C, '
      
        '           dbo.Data0023.ABBR_NAME , dbo.Data0015.ABBR_NAME as a_' +
        'abbm,'
      '           dbo.Data0034.DEPT_CODE, dbo.Data0034.DEPT_NAME ,'
      
        '           CASE dbo.Data0034.ttype WHEN  '#39'1'#39' THEN '#39#24037#24207#39' else '#39#38750#24037#24207 +
        #39' END AS ttype, '
      
        '           dbo.Data0207.QUANTITY , dbo.Data0002.UNIT_NAME ,dbo.D' +
        'ata0207.TDATE ,'
      '           dbo.Data0022.SUPPLIER2 , '
      '           dbo.Data0005.EMPLOYEE_NAME , dbo.Data0457.Cut_NO, '
      '           dbo.Data0016.LOCATION , '
      '           Data0005_1.EMPLOYEE_NAME as a_EMPLOYEE_NAME '
      'FROM       dbo.Data0071 RIGHT OUTER JOIN'
      '           dbo.Data0207 INNER JOIN'
      
        '           dbo.Data0457 ON dbo.Data0207.GON_PTR = dbo.Data0457.R' +
        'KEY INNER JOIN'
      
        '           dbo.Data0017 ON dbo.Data0207.INVENTORY_PTR = dbo.Data' +
        '0017.RKEY INNER JOIN'
      
        '           dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496' +
        '.RKEY INNER JOIN'
      
        '           dbo.Data0022 ON dbo.Data0207.D0022_PTR = dbo.Data0022' +
        '.RKEY INNER JOIN'
      
        '           dbo.Data0002 ON dbo.Data0022.LOCATION_PTR_FROM = dbo.' +
        'Data0002.RKEY INNER JOIN'
      
        '           dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.R' +
        'KEY INNER JOIN'
      
        '           dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.' +
        'RKEY INNER JOIN'
      
        '           dbo.Data0034 ON dbo.Data0457.dept_ptr = dbo.Data0034.' +
        'RKEY INNER JOIN'
      
        '           dbo.Data0005 ON dbo.Data0457.RECD_BY = dbo.Data0005.R' +
        'KEY INNER JOIN'
      
        '           dbo.Data0016 ON dbo.Data0022.LOCATION_PTR = dbo.Data0' +
        '016.RKEY INNER JOIN'
      
        '           dbo.Data0015 ON dbo.Data0457.warehouse_ptr = dbo.Data' +
        '0015.RKEY INNER JOIN'
      
        '           dbo.Data0005 AS Data0005_1 ON dbo.Data0457.CREATE_BY ' +
        '= Data0005_1.RKEY ON dbo.Data0071.RKEY = dbo.Data0022.SOURCE_PTR'
      'union '
      ''
      'SELECT     dbo.Data0457.REF_NUMBER, dbo.Data0457.GON_NUMBER, '
      '           dbo.Data0235.goods_name, dbo.Data0235.goods_guige, '
      '           null, dbo.Data0235.goods_type, '
      
        '           dbo.Data0023.ABBR_NAME, dbo.Data0015.ABBR_NAME  as a_' +
        'abbm,'
      '           dbo.Data0034.DEPT_CODE, dbo.Data0034.DEPT_NAME, '
      
        '           CASE dbo.Data0034.ttype when '#39'1'#39' THEN '#39#24037#24207#39' else '#39#38750#24037#24207#39 +
        ' END AS ttype, '
      
        '           dbo.DATA0208.QUANTITY, dbo.Data0002.UNIT_NAME, dbo.DA' +
        'TA0208.TDATE, '
      
        '           dbo.Data0235.REF_NUMBER AS Expr2, dbo.Data0005.EMPLOY' +
        'EE_NAME, '
      
        '           dbo.Data0457.Cut_NO, dbo.Data0016.LOCATION, Data0005_' +
        '1.EMPLOYEE_NAME as a_EMPLOYEE_NAME '
      'FROM       dbo.DATA0208 INNER JOIN'
      
        '           dbo.Data0457 ON dbo.DATA0208.GON_PTR = dbo.Data0457.R' +
        'KEY INNER JOIN'
      
        '           dbo.Data0235 ON dbo.DATA0208.SOURCE_PTR = dbo.Data023' +
        '5.RKEY INNER JOIN'
      
        '           dbo.Data0456 ON dbo.Data0235.GRN_PTR = dbo.Data0456.R' +
        'KEY INNER JOIN'
      
        '           dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.' +
        'RKEY INNER JOIN'
      
        '           dbo.Data0016 ON dbo.Data0235.location_ptr = dbo.Data0' +
        '016.RKEY INNER JOIN'
      
        '           dbo.Data0015 ON dbo.Data0457.warehouse_ptr = dbo.Data' +
        '0015.RKEY INNER JOIN'
      
        '           dbo.Data0034 ON dbo.Data0457.dept_ptr = dbo.Data0034.' +
        'RKEY INNER JOIN'
      
        '           dbo.Data0002 ON dbo.Data0235.unit_ptr = dbo.Data0002.' +
        'RKEY INNER JOIN'
      
        '           dbo.Data0005 ON dbo.Data0457.RECD_BY = dbo.Data0005.R' +
        'KEY INNER JOIN'
      
        '           dbo.Data0005 AS Data0005_1 ON dbo.Data0457.CREATE_BY ' +
        '= Data0005_1.RKEY'
      ') as s'
      'WHERE    ( s.TDATE >=:dtpk1)  AND (s.TDATE <=:dtpk2)'
      'order by s.GON_NUMBER')
    Left = 560
    Top = 456
    object AD457DSDesigner: TStringField
      FieldName = #39046#26009#21333#21495
      ReadOnly = True
      Size = 15
    end
    object AD457DSDesigner2: TStringField
      FieldName = #20986#20179#21333#21495
      ReadOnly = True
      Size = 10
    end
    object AD457DSDesigner3: TStringField
      FieldName = #26448#26009#32534#30721
      ReadOnly = True
      Size = 60
    end
    object AD457DSDesigner4: TStringField
      FieldName = #26448#26009#21517#31216
      ReadOnly = True
      Size = 200
    end
    object AD457DSDesigner5: TStringField
      FieldName = #26448#26009#35268#26684
      ReadOnly = True
      Size = 70
    end
    object AD457DSDesigner6: TStringField
      FieldName = #26448#26009#31867#22411
      ReadOnly = True
      Size = 30
    end
    object AD457DSDesigner7: TStringField
      FieldName = #20379#24212#21830
      ReadOnly = True
      Size = 16
    end
    object AD457DSDesigner9: TStringField
      FieldName = #39046#26009#37096#38376#20195#30721
      ReadOnly = True
      Size = 10
    end
    object AD457DSDesigner10: TStringField
      FieldName = #39046#26009#37096#38376#21517#31216
      ReadOnly = True
      Size = 30
    end
    object AD457DSDesigner11: TStringField
      FieldName = #37096#38376#31867#22411
      ReadOnly = True
      Size = 6
    end
    object AD457DSDesigner12: TFloatField
      FieldName = #21457#26009#25968#37327
      ReadOnly = True
    end
    object AD457DSDesigner13: TStringField
      FieldName = #21333#20301
      ReadOnly = True
    end
    object AD457DSDesigner14: TDateTimeField
      FieldName = #21457#26009#26085#26399
      ReadOnly = True
    end
    object AD457DSDesigner15: TStringField
      FieldName = #21407#20379#24212#21830#25110#25209#21495
      ReadOnly = True
      Size = 30
    end
    object AD457DSDesigner16: TStringField
      FieldName = #39046#26009#20154#21592
      ReadOnly = True
      Size = 16
    end
    object AD457DSDesigner17: TStringField
      FieldName = #21457#26009#22791#27880
      ReadOnly = True
      Size = 40
    end
    object AD457DSDesigner18: TStringField
      FieldName = #21457#26009#20179#24211
      ReadOnly = True
    end
    object AD457DSDesigner19: TStringField
      FieldName = #21457#26009#20154#21592
      ReadOnly = True
      Size = 16
    end
    object AD457DSDesigner8: TStringField
      FieldName = #39046#26009#24037#21378
      ReadOnly = True
      Size = 10
    end
  end
  object DataSource1: TDataSource
    DataSet = AD457
    Left = 528
    Top = 456
  end
end
