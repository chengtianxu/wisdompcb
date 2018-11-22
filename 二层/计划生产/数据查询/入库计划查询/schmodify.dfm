object Form4: TForm4
  Left = 228
  Top = 195
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20837#20179#35745#21010#20462#25913
  ClientHeight = 413
  ClientWidth = 543
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 335
    Top = 32
    Width = 64
    Height = 16
    Caption = #20837#24211#35745#21010
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 40
    Top = 10
    Width = 52
    Height = 13
    Caption = #35746#21333#32534#21495
    FocusControl = DBEdit1
  end
  object Label3: TLabel
    Left = 40
    Top = 38
    Width = 52
    Height = 13
    Caption = #23458#25143#32534#21495
    FocusControl = DBEdit2
  end
  object Label4: TLabel
    Left = 40
    Top = 69
    Width = 52
    Height = 13
    Caption = #23458#25143#31616#31216
    FocusControl = DBEdit3
  end
  object Label5: TLabel
    Left = 40
    Top = 102
    Width = 52
    Height = 13
    Caption = #26412#21378#32534#21495
    FocusControl = DBEdit4
  end
  object Label7: TLabel
    Left = 40
    Top = 134
    Width = 52
    Height = 13
    Caption = #23458#25143#22411#21495
    FocusControl = DBEdit6
  end
  object Label8: TLabel
    Left = 45
    Top = 158
    Width = 47
    Height = 13
    Caption = 'PCS'#38754#31215
    FocusControl = DBEdit7
  end
  object Label9: TLabel
    Left = 27
    Top = 189
    Width = 65
    Height = 13
    Caption = #23458#25143#35746#21333#21495
    FocusControl = DBEdit8
  end
  object Label12: TLabel
    Left = 40
    Top = 222
    Width = 52
    Height = 13
    Caption = #35746#21333#25968#37327
    FocusControl = DBEdit9
  end
  object Label13: TLabel
    Left = 40
    Top = 254
    Width = 52
    Height = 13
    Caption = #27424#36135#25968#37327
    FocusControl = DBEdit12
  end
  object Label14: TLabel
    Left = 40
    Top = 286
    Width = 52
    Height = 13
    Caption = #24211#23384#25968#37327
    FocusControl = DBEdit13
  end
  object Label10: TLabel
    Left = 268
    Top = 9
    Width = 59
    Height = 13
    Caption = #24403#21069#26085#26399':'
  end
  object BitBtn1: TBitBtn
    Left = 286
    Top = 363
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 0
    Visible = False
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 209
    Top = 363
    Width = 75
    Height = 25
    Caption = #20851#38381
    ModalResult = 2
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object BitBtn4: TBitBtn
    Left = 134
    Top = 363
    Width = 75
    Height = 25
    Caption = #33258#21160#35843#25972
    TabOrder = 2
    Visible = False
    OnClick = BitBtn4Click
  end
  object DBGrid1: TDBGrid
    Left = 334
    Top = 56
    Width = 203
    Height = 281
    DataSource = DataSource2
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'sch_date'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantity'
        Visible = True
      end>
  end
  object DBEdit1: TDBEdit
    Left = 96
    Top = 6
    Width = 130
    Height = 21
    Color = cl3DLight
    DataField = 'SALES_ORDER'
    DataSource = DataSource1
    TabOrder = 4
  end
  object DBEdit2: TDBEdit
    Left = 96
    Top = 34
    Width = 130
    Height = 21
    Color = cl3DLight
    DataField = 'CUST_CODE'
    DataSource = DataSource1
    TabOrder = 5
  end
  object DBEdit3: TDBEdit
    Left = 96
    Top = 65
    Width = 130
    Height = 21
    Color = cl3DLight
    DataField = 'ABBR_NAME'
    DataSource = DataSource1
    TabOrder = 6
  end
  object DBEdit4: TDBEdit
    Left = 96
    Top = 98
    Width = 130
    Height = 21
    Color = cl3DLight
    DataField = 'MANU_PART_NUMBER'
    DataSource = DataSource1
    TabOrder = 7
  end
  object DBEdit6: TDBEdit
    Left = 96
    Top = 129
    Width = 193
    Height = 21
    Color = cl3DLight
    DataField = 'MANU_PART_DESC'
    DataSource = DataSource1
    TabOrder = 8
  end
  object DBEdit7: TDBEdit
    Left = 96
    Top = 153
    Width = 134
    Height = 21
    Color = cl3DLight
    DataField = 'unit_sq'
    DataSource = DataSource1
    TabOrder = 9
  end
  object DBEdit8: TDBEdit
    Left = 96
    Top = 184
    Width = 193
    Height = 21
    Color = cl3DLight
    DataField = 'PO_NUMBER'
    DataSource = DataSource1
    TabOrder = 10
  end
  object DBEdit9: TDBEdit
    Left = 96
    Top = 216
    Width = 134
    Height = 21
    Color = cl3DLight
    DataField = 'PARTS_ORDERED'
    DataSource = DataSource1
    TabOrder = 11
  end
  object DBEdit12: TDBEdit
    Left = 96
    Top = 248
    Width = 134
    Height = 21
    Color = cl3DLight
    DataField = 'qty_qianhuo'
    DataSource = DataSource1
    TabOrder = 12
  end
  object DBEdit13: TDBEdit
    Left = 96
    Top = 280
    Width = 134
    Height = 21
    Color = cl3DLight
    DataField = 'QTY_ON_HAND'
    DataSource = DataSource1
    TabOrder = 13
  end
  object Edit1: TEdit
    Left = 335
    Top = 6
    Width = 121
    Height = 21
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 14
  end
  object aq06: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'so'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 12
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      
        'SELECT dbo.Data0060.RKEY, dbo.Data0060.SALES_ORDER, dbo.Data0010' +
        '.CUST_CODE, '
      '      dbo.Data0010.ABBR_NAME, dbo.Data0097.PO_NUMBER, '
      '      dbo.Data0060.PARTS_ORDERED, '
      
        '      dbo.Data0060.PARTS_ORDERED + dbo.Data0060.PARTS_RETURNED -' +
        ' dbo.Data0060.PARTS_SHIPPED'
      '       - dbo.Data0060.RETURNED_SHIP AS qty_qianhuo, '
      
        '      dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC' +
        ', '
      '      dbo.Data0025.QTY_ON_HAND,data0025.unit_sq'
      'FROM dbo.Data0060 INNER JOIN'
      
        '      dbo.Data0010 ON dbo.Data0060.CUSTOMER_PTR = dbo.Data0010.R' +
        'KEY INNER JOIN'
      '      dbo.Data0097 ON '
      
        '      dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY INNER ' +
        'JOIN'
      
        '      dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.' +
        'RKEY'
      'where data0060.SALES_ORDER=:so')
    Left = 32
    Top = 356
    object aq06RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aq06SALES_ORDER: TStringField
      DisplayLabel = #35746#21333#32534#21495
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object aq06CUST_CODE: TStringField
      DisplayLabel = #23458#25143#32534#21495
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object aq06ABBR_NAME: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object aq06unit_sq: TFloatField
      DisplayLabel = 'PCS'#38754#31215
      FieldName = 'unit_sq'
      ReadOnly = True
    end
    object aq06PO_NUMBER: TStringField
      DisplayLabel = #23458#25143#35746#21333#21495
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object aq06PARTS_ORDERED: TFloatField
      DisplayLabel = #35746#21333#25968#37327
      FieldName = 'PARTS_ORDERED'
    end
    object aq06qty_qianhuo: TFloatField
      DisplayLabel = #27424#36135#25968#37327
      FieldName = 'qty_qianhuo'
      ReadOnly = True
    end
    object aq06MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object aq06MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object aq06QTY_ON_HAND: TIntegerField
      FieldName = 'QTY_ON_HAND'
    end
  end
  object ADO360: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    MarshalOptions = moMarshalModifiedOnly
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 8049
      end>
    SQL.Strings = (
      'SELECT so_ptr, quantity, sch_date'
      'FROM data0360'
      'WHERE data0360.so_ptr=:rkey'
      'ORDER BY sch_date')
    Left = 64
    Top = 356
    object ADO360so_ptr: TIntegerField
      FieldName = 'so_ptr'
    end
    object ADO360sch_date: TDateTimeField
      DisplayLabel = #35745#21010#20837#20179#26085#26399
      FieldName = 'sch_date'
    end
    object ADO360quantity: TIntegerField
      DisplayLabel = #35745#21010#20837#20179#25968#37327
      FieldName = 'quantity'
    end
  end
  object DataSource1: TDataSource
    DataSet = aq06
    Left = 32
    Top = 385
  end
  object DataSource2: TDataSource
    DataSet = ADO360
    Left = 64
    Top = 385
  end
end
