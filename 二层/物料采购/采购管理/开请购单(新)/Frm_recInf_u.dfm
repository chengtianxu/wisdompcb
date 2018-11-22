object Frm_recInf: TFrm_recInf
  Left = 248
  Top = 211
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #25910#36135#20449#24687
  ClientHeight = 329
  ClientWidth = 580
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 580
    Height = 129
    Align = alTop
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = FormKeyDown
  end
  object Button1: TButton
    Left = 258
    Top = 300
    Width = 75
    Height = 25
    Caption = #20851#38381
    ModalResult = 1
    TabOrder = 1
    OnKeyDown = FormKeyDown
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 164
    Width = 580
    Height = 130
    Align = alTop
    DataSource = DataSource2
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = FormKeyDown
  end
  object Panel1: TPanel
    Left = 0
    Top = 129
    Width = 580
    Height = 35
    Align = alTop
    BevelOuter = bvNone
    Caption = #20179#24211#25910#36135#20449#24687
    TabOrder = 3
  end
  object ADOQuery3: TADOQuery
    Connection = DM.ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    DataSource = DM.DS1
    Parameters = <
      item
        Name = 'po_req_number'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 15
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Data0070.PO_NUMBER, dbo.Data0017.INV_PART_NUMBER,'
      '       Data0017.INV_PART_DESCRIPTION, dbo.Data0071.QUAN_ORD,'
      '       Data0071.QUAN_RECD,data0071.rkey'
      'FROM   Data0070 INNER JOIN'
      
        '       Data0071 ON dbo.Data0070.RKEY = dbo.Data0071.PO_PTR INNER' +
        ' JOIN'
      '       Data0017 ON dbo.Data0071.INVT_PTR = dbo.Data0017.RKEY'
      'where data0071.quan_recd>0 and'
      '      data0070.fob = :po_req_number       ')
    Left = 343
    Top = 30
    object ADOQuery3PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#35746#21333#21495
      DisplayWidth = 18
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object ADOQuery3INV_PART_NUMBER: TStringField
      DisplayLabel = #29289#26009#32534#21495
      DisplayWidth = 31
      FieldName = 'INV_PART_NUMBER'
    end
    object ADOQuery3INV_PART_DESCRIPTION: TStringField
      DisplayLabel = #29289#26009#25551#36848
      DisplayWidth = 42
      FieldName = 'INV_PART_DESCRIPTION'
      Size = 40
    end
    object ADOQuery3QUAN_ORD: TFloatField
      DisplayLabel = #37319#36141#25968#37327
      DisplayWidth = 12
      FieldName = 'QUAN_ORD'
    end
    object ADOQuery3QUAN_RECD: TFloatField
      DisplayLabel = #25910#36135#25968#37327
      DisplayWidth = 12
      FieldName = 'QUAN_RECD'
    end
    object ADOQuery3rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
  end
  object ADOQuery4: TADOQuery
    Connection = DM.ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    DataSource = DM.DS1
    Parameters = <
      item
        Name = 'po_req_number'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 15
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Data0070.PO_NUMBER, dbo.Data0072.DESCRIPTION,'
      '       Data0072.GUI_GE, dbo.Data0072.QUAN_ORD,'
      '       Data0072.QUANTITY_RECEIVED,data0072.rkey'
      'FROM   Data0070 INNER JOIN'
      '       Data0072 ON dbo.Data0070.RKEY = dbo.Data0072.POPTR'
      'where  data0072.QUANTITY_RECEIVED>0 and'
      '       data0070.fob = :po_req_number')
    Left = 348
    Top = 71
    object ADOQuery4PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#35746#21333#32534#21495
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object ADOQuery4DESCRIPTION: TStringField
      DisplayLabel = #29289#21697#21517#31216
      FieldName = 'DESCRIPTION'
      Size = 60
    end
    object ADOQuery4GUI_GE: TStringField
      DisplayLabel = #29289#21697#35268#26684
      FieldName = 'GUI_GE'
      Size = 50
    end
    object ADOQuery4QUAN_ORD: TFloatField
      DisplayLabel = #37319#36141#25968#37327
      FieldName = 'QUAN_ORD'
    end
    object ADOQuery4QUANTITY_RECEIVED: TFloatField
      DisplayLabel = #25910#36135#25968#37327
      FieldName = 'QUANTITY_RECEIVED'
    end
    object ADOQuery4rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
  end
  object ADOQuery5: TADOQuery
    Connection = DM.ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    DataSource = DataSource1
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
      
        'SELECT dbo.Data0456.GRN_NUMBER, dbo.Data0022.TDATE, dbo.Data0022' +
        '.QUANTITY, '
      '      dbo.Data0015.WAREHOUSE_CODE, dbo.Data0016.LOCATION, '
      '      dbo.Data0022.BARCODE_ID, dbo.Data0456.REF_NUMBER, '
      '      dbo.Data0005.EMPLOYEE_NAME'
      'FROM dbo.Data0456 INNER JOIN'
      
        '      dbo.Data0022 ON dbo.Data0456.RKEY = dbo.Data0022.GRN_PTR I' +
        'NNER JOIN'
      
        '      dbo.Data0005 ON dbo.Data0456.CREATE_BY = dbo.Data0005.RKEY' +
        ' INNER JOIN'
      '      dbo.Data0015 ON '
      
        '      dbo.Data0456.warehouse_ptr = dbo.Data0015.RKEY LEFT OUTER ' +
        'JOIN'
      
        '      dbo.Data0016 ON dbo.Data0022.LOCATION_PTR = dbo.Data0016.R' +
        'KEY'
      'where data0022.source_ptr=:rkey      ')
    Left = 344
    Top = 195
    object ADOQuery5GRN_NUMBER: TStringField
      DisplayLabel = #25910#36135#21333#21495
      FieldName = 'GRN_NUMBER'
      FixedChar = True
      Size = 10
    end
    object ADOQuery5TDATE: TDateTimeField
      DisplayLabel = #25509#25910#26085#26399
      FieldName = 'TDATE'
    end
    object ADOQuery5QUANTITY: TFloatField
      DisplayLabel = #25509#25910#25968#37327
      FieldName = 'QUANTITY'
    end
    object ADOQuery5WAREHOUSE_CODE: TStringField
      DisplayLabel = #23384#25918#24037#21378
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ADOQuery5LOCATION: TStringField
      DisplayLabel = #23384#25918#20179#24211
      FieldName = 'LOCATION'
      Size = 10
    end
    object ADOQuery5BARCODE_ID: TStringField
      DisplayLabel = #26465#24418#21527#32534#21495
      FieldName = 'BARCODE_ID'
      FixedChar = True
      Size = 12
    end
    object ADOQuery5REF_NUMBER: TStringField
      DisplayLabel = #36865#36135#21333#21495
      FieldName = 'REF_NUMBER'
      FixedChar = True
      Size = 15
    end
    object ADOQuery5EMPLOYEE_NAME: TStringField
      DisplayLabel = #25910#36135#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
  end
  object ADOQuery6: TADOQuery
    Connection = DM.ADOCon
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
      'SELECT Data0456.GRN_NUMBER, dbo.Data0235.DATE_RECD,'
      '       Data0235.QUAN_RECD, dbo.Data0456.REF_NUMBER,'
      '       Data0005.EMPLOYEE_NAME'
      'FROM   Data0456 INNER JOIN'
      
        '       Data0235 ON dbo.Data0456.RKEY = dbo.Data0235.GRN_PTR INNE' +
        'R JOIN'
      '       Data0005 ON dbo.Data0235.EMPL_PTR = dbo.Data0005.RKEY'
      'where data0235.d0072_ptr=:rkey       ')
    Left = 341
    Top = 235
    object ADOQuery6GRN_NUMBER: TStringField
      DisplayLabel = #25910#36135#21333#21495
      FieldName = 'GRN_NUMBER'
      FixedChar = True
      Size = 10
    end
    object ADOQuery6DATE_RECD: TDateTimeField
      DisplayLabel = #25509#25910#26085#26399
      FieldName = 'DATE_RECD'
    end
    object ADOQuery6QUAN_RECD: TFloatField
      DisplayLabel = #25509#25910#25968#37327
      FieldName = 'QUAN_RECD'
    end
    object ADOQuery6REF_NUMBER: TStringField
      DisplayLabel = #36865#36135#21333#21495
      FieldName = 'REF_NUMBER'
      FixedChar = True
      Size = 15
    end
    object ADOQuery6EMPLOYEE_NAME: TStringField
      DisplayLabel = #25910#36135#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
  end
  object DataSource1: TDataSource
    Left = 288
    Top = 48
  end
  object DataSource2: TDataSource
    Left = 272
    Top = 200
  end
end
