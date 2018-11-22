object Form_req: TForm_req
  Left = 269
  Top = 129
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #37319#36141#35831#27714#26597#35810
  ClientHeight = 499
  ClientWidth = 611
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 99
    Top = 12
    Width = 85
    Height = 13
    Alignment = taRightJustify
    Caption = #37319#36141#35831#27714#32534#21495':'
  end
  object DBGrid3: TDBGrid
    Left = 0
    Top = 301
    Width = 609
    Height = 155
    DataSource = DataSource3
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 6
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DESCRIPTION_1'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GUI_GE'
        Width = 171
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_name'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'curr_name'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'unit_name'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTITY_REQUIRED'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tax_price'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tax'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'reply_date'
        Width = 63
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 301
    Width = 609
    Height = 155
    DataSource = DataSource2
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 5
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'inv_name'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inv_description'
        Width = 168
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'extra_req'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_name'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'curr_name'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'unit_name'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTITY'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tax_price'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tax'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'reply_date'
        Width = 63
        Visible = True
      end>
  end
  object Edit1: TEdit
    Left = 192
    Top = 8
    Width = 169
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object BitBtn1: TBitBtn
    Left = 368
    Top = 6
    Width = 25
    Height = 25
    Hint = #21047#26032
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TabStop = False
    OnClick = BitBtn1Click
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000120B0000120B00001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
      DADABFBFBDADADADADADDADADBFADADADADAADADAD000DADADADDADAD0FBF0DA
      DADAADAD0F7FBF0DADADDAD0F7F87BF0DADAAD0F7F87BFB70DADD0F7F87BFB78
      80DA000F87BFB78880ADDAD00BFB78880ADAADADA0B7888740ADDADADA088804
      440AADADADA000A04440DADADADADADA0440ADADADADADADA00D}
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 36
    Width = 609
    Height = 259
    DataSource = DataSource1
    Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'PO_REQ_NUMBER'
        Title.Caption = #35831#36141#32534#21495
        Width = 126
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_name'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Title.Caption = #35831#36141#32773
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REQ_DATE'
        Title.Caption = #38656#27714#26085#26399
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'employee_name_appd'
        Title.Caption = #26368#21518#25480#26435#20154#21592
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_flag'
        Title.Caption = #31867#21035
        Width = 88
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 227
    Top = 469
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 307
    Top = 469
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Data0068.RKEY,Data0068.PO_REQ_NUMBER,data0015.abbr_name,'
      '       Data0068.REQ_DATE,Data0068.FLAG,Data0068.STATUS,'
      '       Data0068.DEPARTMENT_NAME, Data0005_2.EMPLOYEE_NAME,'
      '       Data0005_1.EMPLOYEE_NAME AS employee_name_appd,'
      '       Data0015.WAREHOUSE_NAME,data0068.WHSE_PTR'
      'FROM   Data0068 INNER JOIN'
      '       Data0073 ON Data0068.APPD_BY = Data0073.RKEY INNER JOIN'
      '       Data0005 Data0005_1 ON'
      '       Data0073.EMPLOYEE_PTR = Data0005_1.RKEY INNER JOIN'
      '       Data0005 Data0005_2 ON'
      '       Data0068.REQ_BY = Data0005_2.RKEY INNER JOIN'
      '       Data0015 ON Data0068.WHSE_PTR = Data0015.RKEY'
      'WHERE  (Data0068.STATUS = 3) and'
      
        '       ((Data0068.BUYER_PTR =:rkey) or (data0068.buyer_ptr is nu' +
        'll))'
      'ORDER BY  Data0068.PO_REQ_NUMBER'
      '')
    Left = 582
    Top = 462
    object ADOQuery1RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQuery1PO_REQ_NUMBER: TStringField
      FieldName = 'PO_REQ_NUMBER'
      Size = 15
    end
    object ADOQuery1REQ_DATE: TDateTimeField
      FieldName = 'REQ_DATE'
    end
    object ADOQuery1EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOQuery1FLAG: TStringField
      FieldName = 'FLAG'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1STATUS: TWordField
      FieldName = 'STATUS'
    end
    object ADOQuery1v_flag: TStringField
      FieldKind = fkCalculated
      FieldName = 'v_flag'
      Size = 10
      Calculated = True
    end
    object ADOQuery1DEPARTMENT_NAME: TStringField
      DisplayLabel = #35831#36141#20154#21592
      FieldName = 'DEPARTMENT_NAME'
      Size = 10
    end
    object ADOQuery1employee_name_appd: TStringField
      DisplayLabel = #23457#25209#20154#21592
      FieldName = 'employee_name_appd'
      Size = 16
    end
    object ADOQuery1WAREHOUSE_NAME: TStringField
      DisplayLabel = #24037#21378#20840#31216
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
    object ADOQuery1WHSE_PTR: TIntegerField
      FieldName = 'WHSE_PTR'
    end
    object ADOQuery1abbr_name: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'abbr_name'
      Size = 10
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    OnDataChange = DataSource1DataChange
    Left = 552
    Top = 462
  end
  object DataSource2: TDataSource
    DataSet = DM.ADO0069
    Left = 523
    Top = 462
  end
  object DataSource3: TDataSource
    DataSet = DM.ADO0204
    Left = 493
    Top = 463
  end
end
