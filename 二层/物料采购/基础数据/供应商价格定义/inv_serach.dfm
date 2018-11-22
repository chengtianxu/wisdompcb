object form_inv: Tform_inv
  Left = 514
  Top = 147
  Width = 485
  Height = 590
  Caption = #24211#23384#21407#26448#26009#25628#32034
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    469
    552)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 11
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #26448#26009#32534#30721':'
  end
  object Edit1: TEdit
    Left = 73
    Top = 6
    Width = 193
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object Button1: TButton
    Left = 128
    Top = 522
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 229
    Top = 521
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
  end
  object DBGridEh1: TDBGridEh
    Left = -1
    Top = 31
    Width = 468
    Height = 482
    Anchors = [akLeft, akTop, akRight]
    DataSource = DataSource1
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    FooterColor = clWindow
    FooterFont.Charset = GB2312_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGridEh1DblClick
    OnKeyDown = DBGridEh1KeyDown
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'INV_PART_NUMBER'
        Footers = <>
        Title.Caption = #29289#26009#32534#30721
        Width = 79
      end
      item
        EditButtons = <>
        FieldName = 'INV_PART_DESCRIPTION'
        Footers = <>
        Title.Caption = #29289#26009#25551#36848
        Width = 200
      end
      item
        EditButtons = <>
        FieldName = 'manufacturer_name'
        Footers = <>
        Title.Caption = #29305#21035#35201#27714
        Width = 68
      end
      item
        EditButtons = <>
        FieldName = 'STOP_PURCH'
        Footers = <>
        Title.Caption = #20572#27490#37319#36141
        Width = 50
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    OnDataChange = DataSource1DataChange
    Left = 342
    Top = 187
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'SELECT Data0017.RKEY, Data0017.INV_PART_NUMBER,INV_NAME, Data001' +
        '7.INV_PART_DESCRIPTION, manufacturer_name,'
      
        #9'   PREF_SUPPLIER_PTR, stock_purch,STOP_PURCH, purch_unit_ptr, A' +
        'VL_FLAG,'
      
        '           MANUFACTURER_CODE,isnull(CATALOG_NUM,'#39#39') as CATALOG_N' +
        'UM'
      'FROM Data0017  where (1=1)'
      'ORDER BY  INV_PART_NUMBER ')
    Left = 313
    Top = 188
    object ADOQuery1RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQuery1INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADOQuery1INV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object ADOQuery1manufacturer_name: TStringField
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
    object ADOQuery1STOP_PURCH: TStringField
      FieldName = 'STOP_PURCH'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1MANUFACTURER_CODE: TStringField
      FieldName = 'MANUFACTURER_CODE'
    end
    object ADOQuery1INV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ADOQuery1CATALOG_NUM: TStringField
      FieldName = 'CATALOG_NUM'
      FixedChar = True
      Size = 10
    end
  end
end
