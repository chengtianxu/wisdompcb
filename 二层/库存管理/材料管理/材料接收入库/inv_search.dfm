object form_inv: Tform_inv
  Left = 229
  Top = 148
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24211#23384#21407#26448#26009#25628#32034
  ClientHeight = 485
  ClientWidth = 556
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 19
    Width = 72
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #26448#26009#32534#30721':'
  end
  object RadioGroup1: TRadioGroup
    Left = 363
    Top = 3
    Width = 185
    Height = 42
    Caption = #26597#25214#23383#27573
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #26448#26009#32534#30721
      #26448#26009#25551#36848)
    TabOrder = 5
    OnClick = RadioGroup1Click
  end
  object Edit1: TEdit
    Left = 112
    Top = 15
    Width = 210
    Height = 21
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object BitBtn1: TBitBtn
    Left = 329
    Top = 13
    Width = 25
    Height = 25
    TabOrder = 2
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
  object Button1: TButton
    Left = 183
    Top = 451
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 263
    Top = 451
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 51
    Width = 557
    Height = 394
    DataSource = DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
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
        FieldName = 'INV_PART_NUMBER'
        Title.Caption = #26448#26009#32534#30721
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_PART_DESCRIPTION'
        Title.Caption = #26448#26009#25551#36848
        Width = 301
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'manufacturer_name'
        Width = 100
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 408
    Top = 447
  end
  object ADOQuery1: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'INV_NAME'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 25
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'SELECT'
      '  Data0017.RKEY ,'
      '  Data0017.INV_PART_NUMBER ,'
      '  Data0017.INV_NAME ,'
      '  data0017.INV_DESCRIPTION,'
      '  data0017.INV_PART_DESCRIPTION,'
      '  Data0017.manufacturer_name,'
      '  Data0017.PREF_SUPPLIER_PTR,'
      '  Data0017.stock_purch,data0017.STOCK_BASE,'
      '  data0017.STOCK_UNIT_PTR,'
      '  Data0017.purch_unit_ptr,data0017.SHELF_LIFE,'
      '  Data0017.AVL_FLAG,data0002.unit_code,data0002.unit_name'
      'FROM'
      '  Data0017 inner join data0002 on STOCK_UNIT_PTR=data0002.rkey'
      'WHERE'
      '  data0017.INV_PART_NUMBER like :INV_NAME'
      'ORDER BY INV_PART_NUMBER')
    Left = 440
    Top = 448
    object ADOQuery1RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQuery1INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADOQuery1INV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ADOQuery1INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ADOQuery1INV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object ADOQuery1manufacturer_name: TStringField
      DisplayLabel = #29305#21029#35201#27714
      FieldName = 'manufacturer_name'
    end
    object ADOQuery1PREF_SUPPLIER_PTR: TIntegerField
      FieldName = 'PREF_SUPPLIER_PTR'
    end
    object ADOQuery1stock_purch: TFloatField
      FieldName = 'stock_purch'
    end
    object ADOQuery1purch_unit_ptr: TIntegerField
      FieldName = 'purch_unit_ptr'
    end
    object ADOQuery1AVL_FLAG: TStringField
      FieldName = 'AVL_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1STOCK_UNIT_PTR: TIntegerField
      FieldName = 'STOCK_UNIT_PTR'
    end
    object ADOQuery1unit_code: TStringField
      FieldName = 'unit_code'
      Size = 5
    end
    object ADOQuery1unit_name: TStringField
      FieldName = 'unit_name'
    end
    object ADOQuery1SHELF_LIFE: TSmallintField
      FieldName = 'SHELF_LIFE'
    end
    object ADOQuery1STOCK_BASE: TFloatField
      FieldName = 'STOCK_BASE'
    end
  end
end
