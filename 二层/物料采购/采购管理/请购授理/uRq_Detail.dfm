object frm_Rqdetail: Tfrm_Rqdetail
  Left = 302
  Top = 335
  Width = 970
  Height = 542
  Caption = #35831#36141#26126#32454#26597#35810
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 954
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      954
      41)
    object Label1: TLabel
      Left = 178
      Top = 17
      Width = 78
      Height = 13
      Alignment = taRightJustify
      Caption = #35831#36141#21333#21495#21333#21495
    end
    object Label2: TLabel
      Left = 421
      Top = 16
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #29289#26009#31867#22411
    end
    object Button1: TButton
      Left = 8
      Top = 9
      Width = 75
      Height = 25
      Caption = #20851#38381
      ModalResult = 1
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 88
      Top = 9
      Width = 75
      Height = 25
      Caption = #23548#20986#25968#25454
      TabOrder = 2
      OnClick = Button2Click
    end
    object Edit1: TEdit
      Left = 265
      Top = 13
      Width = 121
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 0
      OnChange = Edit1Change
    end
    object GroupBox2: TGroupBox
      Left = 681
      Top = 1
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
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
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
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 1
        OnCloseUp = dtpk1Exit
        OnExit = dtpk1Exit
      end
    end
    object ComboBox1: TComboBox
      Left = 477
      Top = 11
      Width = 108
      Height = 21
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      ItemHeight = 13
      ParentFont = False
      TabOrder = 4
      OnChange = ComboBox1Change
      Items.Strings = (
        #20840#37096
        #29983#20135#29289#26009
        #38750#29983#20135#29289#26009)
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 954
    Height = 420
    Align = alClient
    DataSource = DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'PO_REQ_NUMBER'
        Title.Caption = #35831#36141#21333#21495
        Title.Color = clRed
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_PART_NUMBER'
        Title.Caption = #29289#26009#32534#30721
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_NAME'
        Title.Caption = #29289#26009#21517#31216
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_DESCRIPTION'
        Title.Caption = #29289#26009#35268#26684
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEPT_NAME'
        Title.Caption = #35831#36141#37096#38376
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Title.Caption = #35831#36141#20154#21592
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTITY'
        ReadOnly = False
        Title.Caption = #35831#36141#25968#37327
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        ReadOnly = False
        Title.Caption = #35831#36141#21333#20301
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_PRICE'
        ReadOnly = False
        Title.Caption = #20215#26684'('#19981#21547#31246')'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Title.Caption = #20379#24212#21830
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_warehouse'
        Title.Caption = #24037#21378
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'stye_status'
        Title.Caption = #29366#24577
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'uSflag'
        Title.Caption = #31867#21035
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REQ_DATE'
        Title.Caption = #38656#27714#26085#26399
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'req_quantity'
        ReadOnly = False
        Title.Caption = #35831#36141#26102#38656#27714#25968#37327
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        ReadOnly = False
        Title.Caption = #36135#24065
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'extra_req'
        Title.Caption = #29305#21035#35201#27714
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'reason'
        Title.Caption = #35831#36141#21407#22240
        Width = 182
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 461
    Width = 954
    Height = 43
    Align = alBottom
    Caption = #29366#24577
    TabOrder = 2
    object CheckBox1: TCheckBox
      Left = 66
      Top = 16
      Width = 60
      Height = 17
      Caption = #24453#23457#25209
      TabOrder = 1
      OnClick = CheckBox7Click
    end
    object CheckBox2: TCheckBox
      Left = 190
      Top = 16
      Width = 62
      Height = 17
      Caption = #24453#37319#36141
      Checked = True
      State = cbChecked
      TabOrder = 3
      OnClick = CheckBox7Click
    end
    object CheckBox3: TCheckBox
      Left = 128
      Top = 16
      Width = 61
      Height = 17
      Caption = #24050#25209#20934
      Checked = True
      State = cbChecked
      TabOrder = 2
      OnClick = CheckBox7Click
    end
    object CheckBox4: TCheckBox
      Left = 252
      Top = 16
      Width = 62
      Height = 17
      Caption = #34987#36864#22238
      TabOrder = 4
      OnClick = CheckBox7Click
    end
    object CheckBox5: TCheckBox
      Left = 314
      Top = 16
      Width = 114
      Height = 17
      Caption = #35831#36141#35746#21333#24050#25764#28040
      TabOrder = 5
      OnClick = CheckBox7Click
    end
    object CheckBox6: TCheckBox
      Left = 427
      Top = 16
      Width = 121
      Height = 18
      Caption = #35831#36141#35746#21333#24050#22788#29702
      TabOrder = 6
      OnClick = CheckBox7Click
    end
    object CheckBox7: TCheckBox
      Left = 2
      Top = 16
      Width = 63
      Height = 17
      Caption = #26410#25552#20132
      TabOrder = 0
      OnClick = CheckBox7Click
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 544
    Top = 396
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'v1'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 0
      end
      item
        Name = 'v2'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 0
      end
      item
        Name = 'v3'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 0
      end
      item
        Name = 'v4'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 0
      end
      item
        Name = 'v5'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 0
      end
      item
        Name = 'v6'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 0
      end
      item
        Name = 'v7'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 0
      end
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     PO_REQ_NUMBER, DEPARTMENT_NAME, CASE Union_Db.FLAG WH' +
        'EN '#39'S'#39' THEN '#39#29983#20135#29289#26009#39' WHEN '#39'M'#39' THEN '#39#38750#29983#20135#29289#26009#39' END AS uSflag, INV_PART' +
        '_NUMBER, '
      '                      INV_NAME, INV_DESCRIPTION, '
      
        '                      CASE Union_Db.STATUS WHEN 7 THEN '#39#26410#25552#20132#39' WHE' +
        'N 1 THEN '#39#24453#23457#25209#39' WHEN 2 THEN '#39#24453#37319#36141#39' WHEN 3 THEN '#39#24050#25209#20934#39' WHEN 4 THEN '#39 +
        #34987#36864#22238#39' WHEN 5 THEN '#39#35831#36141#21333#24050#25764#28040#39
      
        '                       WHEN 6 THEN '#39#35831#36141#21333#24050#22788#29702#39' END AS stye_status, ' +
        'ABBR_NAME, CURR_NAME, UNIT_NAME, ABBR_NAME AS abbr_warehouse, EM' +
        'PLOYEE_NAME, QUANTITY, '
      
        '                      UNIT_PRICE, req_quantity, REQ_DATE, reason' +
        ', extra_req, DEPT_NAME'
      
        'FROM         (SELECT     dbo.Data0068.PO_REQ_NUMBER, dbo.Data006' +
        '8.DEPARTMENT_NAME, dbo.Data0068.FLAG, dbo.Data0017.INV_PART_NUMB' +
        'ER, dbo.Data0017.INV_NAME, '
      
        '                                              dbo.Data0017.INV_D' +
        'ESCRIPTION, dbo.Data0068.STATUS, dbo.Data0023.ABBR_NAME, dbo.Dat' +
        'a0001.CURR_NAME, dbo.Data0002.UNIT_NAME, '
      
        '                                              dbo.Data0015.ABBR_' +
        'NAME AS abbr_warehouse, dbo.Data0005.EMPLOYEE_NAME, dbo.Data0069' +
        '.QUANTITY, dbo.Data0069.UNIT_PRICE, '
      
        '                                              dbo.Data0069.req_q' +
        'uantity, dbo.Data0068.REQ_DATE, dbo.Data0069.reason, dbo.Data006' +
        '9.extra_req, dbo.Data0034.DEPT_NAME'
      '                       FROM          dbo.Data0069 INNER JOIN'
      
        '                                              dbo.Data0017 ON db' +
        'o.Data0069.INVT_PTR = dbo.Data0017.RKEY INNER JOIN'
      
        '                                              dbo.Data0068 ON db' +
        'o.Data0069.PURCH_REQ_PTR = dbo.Data0068.RKEY INNER JOIN'
      
        '                                              dbo.Data0015 ON db' +
        'o.Data0068.WHSE_PTR = dbo.Data0015.RKEY INNER JOIN'
      
        '                                              dbo.Data0005 ON db' +
        'o.Data0068.REQ_BY = dbo.Data0005.RKEY INNER JOIN'
      
        '                                              dbo.Data0002 ON db' +
        'o.Data0069.UNIT_PTR = dbo.Data0002.RKEY INNER JOIN'
      
        '                                              dbo.Data0034 ON db' +
        'o.Data0068.DEPARTMENT_NAME = dbo.Data0034.DEPT_CODE LEFT OUTER J' +
        'OIN'
      
        '                                              dbo.Data0001 ON db' +
        'o.Data0069.PO_LINK_PTR = dbo.Data0001.RKEY LEFT OUTER JOIN'
      
        '                                              dbo.Data0023 ON db' +
        'o.Data0069.SUPP_PTR = dbo.Data0023.RKEY'
      '                       UNION'
      
        '                       SELECT     Data0068_1.PO_REQ_NUMBER, Data' +
        '0068_1.DEPARTMENT_NAME, Data0068_1.FLAG, dbo.Data0204.DESCRIPTIO' +
        'N_2, dbo.Data0204.DESCRIPTION_1, '
      
        '                                             dbo.Data0204.GUI_GE' +
        ', Data0068_1.STATUS, Data0023_1.ABBR_NAME, Data0001_1.CURR_NAME,' +
        ' Data0002_1.UNIT_NAME, '
      
        '                                             Data0015_1.ABBR_NAM' +
        'E AS abbr_warehouse, Data0005_1.EMPLOYEE_NAME, dbo.Data0204.QUAN' +
        'TITY_REQUIRED, dbo.Data0204.UNIT_PRICE, '
      
        '                                             dbo.Data0204.req_qu' +
        'antity, Data0068_1.REQ_DATE, dbo.Data0204.reason, '#39#39' AS Expr1, D' +
        'ata0034_1.DEPT_NAME'
      '                       FROM         dbo.Data0204 INNER JOIN'
      
        '                                             dbo.Data0068 AS Dat' +
        'a0068_1 ON dbo.Data0204.PURCHASE_REQ_PTR = Data0068_1.RKEY INNER' +
        ' JOIN'
      
        '                                             dbo.Data0015 AS Dat' +
        'a0015_1 ON Data0068_1.WHSE_PTR = Data0015_1.RKEY INNER JOIN'
      
        '                                             dbo.Data0005 AS Dat' +
        'a0005_1 ON Data0068_1.REQ_BY = Data0005_1.RKEY INNER JOIN'
      
        '                                             dbo.Data0002 AS Dat' +
        'a0002_1 ON dbo.Data0204.G_L_PTR = Data0002_1.RKEY INNER JOIN'
      
        '                                             dbo.Data0034 AS Dat' +
        'a0034_1 ON Data0068_1.DEPARTMENT_NAME = Data0034_1.DEPT_CODE LEF' +
        'T OUTER JOIN'
      
        '                                             dbo.Data0001 AS Dat' +
        'a0001_1 ON dbo.Data0204.PO_LINK_PTR = Data0001_1.RKEY LEFT OUTER' +
        ' JOIN'
      
        '                                             dbo.Data0023 AS Dat' +
        'a0023_1 ON dbo.Data0204.SUPPLIER_PTR = Data0023_1.RKEY) AS Union' +
        '_Db'
      ' '
      ' where (Union_Db.STATUS = :v1 or'
      '       Union_Db.STATUS = :v2 or'
      '       Union_Db.STATUS = :v3 or'
      '       Union_Db.STATUS = :v4 or'
      '       Union_Db.STATUS = :v5 or'
      '       Union_Db.STATUS = :v6 or'
      '       Union_Db.STATUS = :v7) and  '
      'Union_Db.REQ_DATE>=:dtpk1 and Union_Db.REQ_DATE<=:dtpk2')
    Left = 468
    Top = 204
    object ADOQuery1PO_REQ_NUMBER: TStringField
      FieldName = 'PO_REQ_NUMBER'
      ReadOnly = True
      Size = 15
    end
    object ADOQuery1DEPARTMENT_NAME: TStringField
      FieldName = 'DEPARTMENT_NAME'
      ReadOnly = True
      Size = 10
    end
    object ADOQuery1uSflag: TStringField
      FieldName = 'uSflag'
      ReadOnly = True
      Size = 4
    end
    object ADOQuery1INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      ReadOnly = True
      Size = 25
    end
    object ADOQuery1INV_NAME: TStringField
      FieldName = 'INV_NAME'
      ReadOnly = True
      Size = 60
    end
    object ADOQuery1INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      ReadOnly = True
      Size = 200
    end
    object ADOQuery1stye_status: TStringField
      FieldName = 'stye_status'
      ReadOnly = True
      Size = 12
    end
    object ADOQuery1ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      ReadOnly = True
      Size = 16
    end
    object ADOQuery1CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
      ReadOnly = True
    end
    object ADOQuery1UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
      ReadOnly = True
    end
    object ADOQuery1abbr_warehouse: TStringField
      FieldName = 'abbr_warehouse'
      ReadOnly = True
      Size = 16
    end
    object ADOQuery1EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      ReadOnly = True
      Size = 16
    end
    object ADOQuery1QUANTITY: TFloatField
      FieldName = 'QUANTITY'
      ReadOnly = True
    end
    object ADOQuery1UNIT_PRICE: TFloatField
      FieldName = 'UNIT_PRICE'
      ReadOnly = True
    end
    object ADOQuery1req_quantity: TBCDField
      FieldName = 'req_quantity'
      ReadOnly = True
      Precision = 12
      Size = 2
    end
    object ADOQuery1REQ_DATE: TDateTimeField
      FieldName = 'REQ_DATE'
      ReadOnly = True
    end
    object ADOQuery1reason: TStringField
      FieldName = 'reason'
      ReadOnly = True
      Size = 60
    end
    object ADOQuery1extra_req: TStringField
      FieldName = 'extra_req'
      ReadOnly = True
    end
    object ADOQuery1DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      ReadOnly = True
      Size = 30
    end
  end
end
