object Form_Custpart: TForm_Custpart
  Left = 494
  Top = 160
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #23458#25143#37096#20214#25628#32034
  ClientHeight = 520
  ClientWidth = 540
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 5
    Top = 17
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = ' '#26412#21378#32534#21495':'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 43
    Width = 536
    Height = 430
    DataSource = DataSource1
    FixedColor = cl3DLight
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'MANU_PART_NUMBER'
        Title.Caption = #26412#21378#32534#21495
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Title.Caption = #23458#25143#22411#21495
        Width = 134
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANALYSIS_CODE_2'
        Title.Caption = #23458#25143#29289#26009#32534#21495
        Width = 192
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'product_name'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bachorfam'
        Width = 70
        Visible = True
      end>
  end
  object Edit1: TEdit
    Left = 74
    Top = 13
    Width = 166
    Height = 21
    TabOrder = 1
    OnChange = Edit1Change
  end
  object BitBtn3: TBitBtn
    Left = 241
    Top = 11
    Width = 25
    Height = 25
    Hint = #21047#26032
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    TabStop = False
    OnClick = BitBtn3Click
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
  object Button1: TButton
    Left = 179
    Top = 481
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 259
    Top = 481
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
  end
  object RadioGroup1: TRadioGroup
    Left = 272
    Top = 3
    Width = 240
    Height = 39
    Caption = #26597#25214#23383#27573
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      #26412#21378#32534#21495
      #23458#25143#22411#21495
      #23458#25143#26009#21495)
    TabOrder = 5
    OnClick = RadioGroup1Click
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 274
    Top = 288
  end
  object ADOQuery11: TADOStoredProc
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    ProcedureName = 'ep032;5'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@v_flag'
        Attributes = [paNullable]
        DataType = ftWord
        Precision = 3
        Value = Null
      end
      item
        Name = '@rkey10'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@part_number'
        Attributes = [paNullable]
        DataType = ftString
        Size = 20
        Value = Null
      end>
    Left = 353
    Top = 280
    object ADOQuery11ENG_NOTE: TStringField
      FieldName = 'ENG_NOTE'
      Size = 200
    end
    object ADOQuery11PROD_CODE_PTR: TIntegerField
      FieldName = 'PROD_CODE_PTR'
    end
    object ADOQuery11REMARK: TMemoField
      FieldName = 'REMARK'
      BlobType = ftMemo
    end
    object ADOQuery11rkey25: TAutoIncField
      FieldName = 'rkey25'
      ReadOnly = True
    end
    object ADOQuery11MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOQuery11MANU_PART_DESC: TStringField
      DisplayWidth = 40
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ADOQuery11ttype: TWordField
      FieldName = 'ttype'
    end
    object ADOQuery11QTY_ON_HAND: TIntegerField
      FieldName = 'QTY_ON_HAND'
    end
    object ADOQuery11CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object ADOQuery11SHELF_LIFE: TIntegerField
      FieldName = 'SHELF_LIFE'
    end
    object ADOQuery11ONHOLD_SALES_FLAG: TWordField
      FieldName = 'ONHOLD_SALES_FLAG'
    end
    object ADOQuery11ANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      Size = 50
    end
    object ADOQuery11set_lngth: TBCDField
      FieldName = 'set_lngth'
      Precision = 6
      Size = 2
    end
    object ADOQuery11set_width: TBCDField
      FieldName = 'set_width'
      Precision = 6
      Size = 2
    end
    object ADOQuery11unit_sq: TFloatField
      FieldName = 'unit_sq'
    end
    object ADOQuery11set_qty: TIntegerField
      FieldName = 'set_qty'
    end
    object ADOQuery11qty_alloc: TIntegerField
      FieldName = 'qty_alloc'
    end
    object ADOQuery11bachorfam: TStringField
      DisplayLabel = #37327#20135'/'#26679#26495
      FieldName = 'bachorfam'
      ReadOnly = True
      Size = 4
    end
    object ADOQuery11product_name: TStringField
      DisplayLabel = #20135#21697#31867#22411
      FieldName = 'product_name'
      Size = 30
    end
    object ADOQuery11prod_route_ptr: TIntegerField
      FieldName = 'prod_route_ptr'
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'SELECT TOP 100 PERCENT ENG_NOTE, PROD_CODE_PTR, REMARK, data0025' +
        '.RKEY AS rkey25, '
      '      MANU_PART_NUMBER, MANU_PART_DESC, ttype, QTY_ON_HAND, '
      
        '      CUSTOMER_PTR, SHELF_LIFE, ONHOLD_SALES_FLAG, ANALYSIS_CODE' +
        '_2, '
      '      set_lngth, set_width, unit_sq, set_qty,qty_alloc,'
      
        'case data0025.ttype when 0 then '#39#37327#20135#39' when 1 then '#39#26679#26495#39' end as bac' +
        'horfam,'
      'data0008.product_name,data0025.prod_route_ptr'
      'FROM Data0025 inner join data0008'
      'on data0025.PROD_CODE_PTR=data0008.rkey'
      'WHERE (PARENT_PTR IS NULL) AND (ONHOLD_SALES_FLAG <> 1) '
      '')
    Left = 344
    Top = 328
    object ADOQuery1ENG_NOTE: TStringField
      FieldName = 'ENG_NOTE'
      Size = 200
    end
    object ADOQuery1PROD_CODE_PTR: TIntegerField
      FieldName = 'PROD_CODE_PTR'
    end
    object ADOQuery1REMARK: TMemoField
      FieldName = 'REMARK'
      BlobType = ftMemo
    end
    object ADOQuery1rkey25: TAutoIncField
      FieldName = 'rkey25'
      ReadOnly = True
    end
    object ADOQuery1MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOQuery1MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object ADOQuery1ttype: TWordField
      FieldName = 'ttype'
    end
    object ADOQuery1QTY_ON_HAND: TIntegerField
      FieldName = 'QTY_ON_HAND'
    end
    object ADOQuery1CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object ADOQuery1SHELF_LIFE: TIntegerField
      FieldName = 'SHELF_LIFE'
    end
    object ADOQuery1ONHOLD_SALES_FLAG: TWordField
      FieldName = 'ONHOLD_SALES_FLAG'
    end
    object ADOQuery1ANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      Size = 80
    end
    object ADOQuery1set_lngth: TBCDField
      FieldName = 'set_lngth'
      Precision = 7
      Size = 3
    end
    object ADOQuery1set_width: TBCDField
      FieldName = 'set_width'
      Precision = 7
      Size = 3
    end
    object ADOQuery1unit_sq: TFloatField
      FieldName = 'unit_sq'
    end
    object ADOQuery1set_qty: TIntegerField
      FieldName = 'set_qty'
    end
    object ADOQuery1qty_alloc: TIntegerField
      FieldName = 'qty_alloc'
    end
    object ADOQuery1bachorfam: TStringField
      FieldName = 'bachorfam'
      ReadOnly = True
      Size = 4
    end
    object ADOQuery1product_name: TStringField
      FieldName = 'product_name'
      Size = 30
    end
    object ADOQuery1prod_route_ptr: TIntegerField
      FieldName = 'prod_route_ptr'
    end
  end
end
