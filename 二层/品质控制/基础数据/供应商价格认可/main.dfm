object Form1: TForm1
  Left = 204
  Top = 129
  Width = 715
  Height = 500
  Caption = #20379#24212#21830#36164#26684#35748#21487'(AVL)'
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 43
    Width = 707
    Height = 427
    Align = alClient
    DataSource = DataSource1
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = PopupMenu1
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
        Width = 138
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_PART_DESCRIPTION'
        Width = 275
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        ReadOnly = True
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        ReadOnly = True
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRICE_1'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'avl_state'
        Width = 61
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 707
    Height = 43
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      707
      43)
    object Label1: TLabel
      Left = 149
      Top = 16
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = #29289#26009#32534#30721':'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 581
      Top = 2
      Width = 73
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = '  '#35748#21487#26631#35760':'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Button1: TButton
      Left = 1
      Top = 12
      Width = 64
      Height = 24
      Caption = ' '#36864#20986
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object CheckBox1: TCheckBox
      Left = 442
      Top = 20
      Width = 139
      Height = 14
      Anchors = [akTop, akRight]
      Caption = #38656#35201#35748#21487#30340#26448#26009#39033#30446' '
      Checked = True
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 2
      OnClick = CheckBox1Click
    end
    object Edit1: TEdit
      Left = 213
      Top = 12
      Width = 128
      Height = 21
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      MaxLength = 25
      ParentFont = False
      TabOrder = 1
      OnChange = Edit1Change
    end
    object ComboBox1: TComboBox
      Left = 592
      Top = 17
      Width = 96
      Height = 21
      Style = csDropDownList
      Anchors = [akTop, akRight]
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ItemHeight = 13
      ItemIndex = 3
      ParentFont = False
      TabOrder = 3
      Text = #20840#37096
      OnChange = ComboBox1Change
      Items.Strings = (
        #24050#35748#21487
        #26410#35748#21487
        #26242#26102#35748#21487
        #20840#37096)
    end
    object Button2: TButton
      Left = 66
      Top = 12
      Width = 64
      Height = 24
      Caption = ' '#23548'EXCEL'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = Button2Click
    end
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 594
    Top = 383
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <
      item
        Name = 'avl'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 1
        Value = 'Y'
      end>
    SQL.Strings = (
      'SELECT Data0023.CODE, Data0023.ABBR_NAME,'
      ' Data0017.INV_PART_NUMBER,Data0017.INV_PART_DESCRIPTION,'
      ' Data0028.PRICE_1,Data0028.LEAD_TIME,data0028.qte_price,'
      ' Data0028.TAX_2,Data0028.AVL_FLAG,data0028.EDI_OUT_FORCST,'
      ' Data0023.SUPPLIER_NAME,Data0028.TDATE,'
      ' Data0028.SUPPLIER_PART_NO,Data0028.SUGG_REORDER_QTY,'
      ' Data0028.AMT_QUAN_FLAG,Data0028.MIN_ORDER_QTY,'
      ' Data0028.MIN_ORDER_AMT,Data0028.PRICE_2,'
      ' Data0028.PRICE_3,Data0028.PRICE_4, dbo.Data0028.PRICE_5,'
      ' Data0028.PRICE_6,Data0028.QUAN_VOL_1,'
      ' Data0028.QUAN_VOL_2,Data0028.QUAN_VOL_3,'
      ' Data0028.QUAN_VOL_4,Data0028.QUAN_VOL_5,'
      ' Data0028.DISC_1,Data0028.DISC_2,Data0028.DISC_3,'
      ' Data0028.DISC_4,Data0028.DISC_5,Data0028.DISC_6,'
      ' Data0028.CONVERSION_FACTOR,Data0001.CURR_CODE,'
      ' Data0001.CURR_NAME,Data0002.UNIT_NAME AS '#37319#36141#21333#20301','
      ' Data0002_1.UNIT_NAME AS '#24211#23384#21333#20301',Data0028.RKEY,'
      ' Data0073.USER_FULL_NAME,Data0073.USER_LOGIN_NAME'
      'FROM Data0017 INNER JOIN Data0028 ON'
      '     Data0017.RKEY = Data0028.INVENTORY_PTR INNER JOIN'
      
        '     Data0023 ON Data0028.SUPPLIER_PTR = Data0023.RKEY INNER JOI' +
        'N'
      
        '     Data0001 ON Data0028.CURRENCY_PTR = Data0001.RKEY INNER JOI' +
        'N'
      
        '     Data0002 ON Data0028.PURCHASE_UNIT_PTR = Data0002.RKEY INNE' +
        'R JOIN'
      '     Data0002 Data0002_1 ON'
      '     Data0017.STOCK_UNIT_PTR = Data0002_1.RKEY INNER JOIN'
      '     Data0073 ON Data0028.CSI_USER_PTR = Data0073.RKEY'
      'where data0017.avl_flag=:avl'
      '')
    Left = 635
    Top = 415
    object ADOQuery1CODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      DisplayWidth = 12
      FieldName = 'CODE'
      Size = 10
    end
    object ADOQuery1ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#31616#20889
      DisplayWidth = 12
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOQuery1INV_PART_NUMBER: TStringField
      DisplayLabel = #29289#26009#32534#30721
      DisplayWidth = 30
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADOQuery1INV_PART_DESCRIPTION: TStringField
      DisplayLabel = #29289#26009#21517#31216#21450#35268#26684
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object ADOQuery1PRICE_1: TFloatField
      DisplayLabel = #20215#26684
      DisplayWidth = 12
      FieldName = 'PRICE_1'
    end
    object ADOQuery1LEAD_TIME: TSmallintField
      DisplayWidth = 12
      FieldName = 'LEAD_TIME'
    end
    object ADOQuery1TAX_2: TFloatField
      DisplayWidth = 12
      FieldName = 'TAX_2'
    end
    object ADOQuery1AVL_FLAG: TStringField
      DisplayWidth = 11
      FieldName = 'AVL_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1SUPPLIER_NAME: TStringField
      DisplayWidth = 48
      FieldName = 'SUPPLIER_NAME'
      Size = 40
    end
    object ADOQuery1TDATE: TDateTimeField
      DisplayWidth = 22
      FieldName = 'TDATE'
    end
    object ADOQuery1SUPPLIER_PART_NO: TStringField
      DisplayWidth = 24
      FieldName = 'SUPPLIER_PART_NO'
    end
    object ADOQuery1SUGG_REORDER_QTY: TFloatField
      DisplayWidth = 24
      FieldName = 'SUGG_REORDER_QTY'
    end
    object ADOQuery1AMT_QUAN_FLAG: TWordField
      DisplayWidth = 19
      FieldName = 'AMT_QUAN_FLAG'
    end
    object ADOQuery1MIN_ORDER_QTY: TFloatField
      DisplayWidth = 19
      FieldName = 'MIN_ORDER_QTY'
    end
    object ADOQuery1MIN_ORDER_AMT: TFloatField
      DisplayWidth = 19
      FieldName = 'MIN_ORDER_AMT'
    end
    object ADOQuery1PRICE_2: TFloatField
      DisplayWidth = 12
      FieldName = 'PRICE_2'
    end
    object ADOQuery1PRICE_3: TFloatField
      DisplayWidth = 12
      FieldName = 'PRICE_3'
    end
    object ADOQuery1PRICE_4: TFloatField
      DisplayWidth = 12
      FieldName = 'PRICE_4'
    end
    object ADOQuery1PRICE_5: TFloatField
      DisplayWidth = 12
      FieldName = 'PRICE_5'
    end
    object ADOQuery1PRICE_6: TFloatField
      DisplayWidth = 12
      FieldName = 'PRICE_6'
    end
    object ADOQuery1QUAN_VOL_1: TFloatField
      DisplayWidth = 14
      FieldName = 'QUAN_VOL_1'
    end
    object ADOQuery1QUAN_VOL_2: TFloatField
      DisplayWidth = 14
      FieldName = 'QUAN_VOL_2'
    end
    object ADOQuery1QUAN_VOL_3: TFloatField
      DisplayWidth = 14
      FieldName = 'QUAN_VOL_3'
    end
    object ADOQuery1QUAN_VOL_4: TFloatField
      DisplayWidth = 14
      FieldName = 'QUAN_VOL_4'
    end
    object ADOQuery1QUAN_VOL_5: TFloatField
      DisplayWidth = 14
      FieldName = 'QUAN_VOL_5'
    end
    object ADOQuery1DISC_1: TFloatField
      DisplayWidth = 12
      FieldName = 'DISC_1'
    end
    object ADOQuery1DISC_2: TFloatField
      DisplayWidth = 12
      FieldName = 'DISC_2'
    end
    object ADOQuery1DISC_3: TFloatField
      DisplayWidth = 12
      FieldName = 'DISC_3'
    end
    object ADOQuery1DISC_4: TFloatField
      DisplayWidth = 12
      FieldName = 'DISC_4'
    end
    object ADOQuery1DISC_5: TFloatField
      DisplayWidth = 12
      FieldName = 'DISC_5'
    end
    object ADOQuery1DISC_6: TFloatField
      DisplayWidth = 12
      FieldName = 'DISC_6'
    end
    object ADOQuery1CONVERSION_FACTOR: TFloatField
      DisplayWidth = 24
      FieldName = 'CONVERSION_FACTOR'
    end
    object ADOQuery1CURR_CODE: TStringField
      DisplayWidth = 14
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADOQuery1CURR_NAME: TStringField
      DisplayLabel = #36135#24065
      DisplayWidth = 24
      FieldName = 'CURR_NAME'
    end
    object ADOQuery1DSDesigner: TStringField
      DisplayWidth = 24
      FieldName = #37319#36141#21333#20301
    end
    object ADOQuery1DSDesigner2: TStringField
      DisplayWidth = 24
      FieldName = #24211#23384#21333#20301
    end
    object ADOQuery1RKEY: TAutoIncField
      DisplayWidth = 12
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQuery1USER_FULL_NAME: TStringField
      DisplayWidth = 36
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object ADOQuery1USER_LOGIN_NAME: TStringField
      DisplayWidth = 21
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
    object ADOQuery1avl_state: TStringField
      DisplayLabel = #35748#21487#26631#35760
      FieldKind = fkCalculated
      FieldName = 'avl_state'
      Size = 8
      Calculated = True
    end
    object ADOQuery1EDI_OUT_FORCST: TIntegerField
      FieldName = 'EDI_OUT_FORCST'
    end
    object ADOQuery1qte_price: TFloatField
      FieldName = 'qte_price'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 595
    Top = 416
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 112
    Top = 240
    object N1: TMenuItem
      Caption = #35748#21487#20379#24212#21830
      OnClick = N1Click
    end
  end
  object ADO2811: TADOStoredProc
    Connection = ADOConnection1
    LockType = ltReadOnly
    ProcedureName = 'ep053;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@v_type'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 28
      end
      item
        Name = '@v_rkey'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 632
    Top = 382
    object ADO2811RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO2811FILE_POINTER: TIntegerField
      FieldName = 'FILE_POINTER'
    end
    object ADO2811SOURCE_TYPE: TSmallintField
      FieldName = 'SOURCE_TYPE'
    end
    object ADO2811NOTE_PAD_LINE_1: TStringField
      FieldName = 'NOTE_PAD_LINE_1'
      Size = 70
    end
    object ADO2811NOTE_PAD_LINE_2: TStringField
      FieldName = 'NOTE_PAD_LINE_2'
      Size = 70
    end
    object ADO2811NOTE_PAD_LINE_3: TStringField
      FieldName = 'NOTE_PAD_LINE_3'
      Size = 70
    end
    object ADO2811NOTE_PAD_LINE_4: TStringField
      FieldName = 'NOTE_PAD_LINE_4'
      Size = 70
    end
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'EDI_OUT_FORCST'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    SQL.Strings = (
      'select user_login_name,user_full_name'
      'from data0073'
      'where rkey = :EDI_OUT_FORCST')
    Left = 488
    Top = 416
    object ADOQuery2user_full_name: TStringField
      FieldName = 'user_full_name'
      Size = 30
    end
    object ADOQuery2user_login_name: TStringField
      FieldName = 'user_login_name'
      Size = 15
    end
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 456
    Top = 416
  end
end
