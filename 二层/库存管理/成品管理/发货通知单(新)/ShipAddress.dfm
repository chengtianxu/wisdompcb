object Form_ShipAddress: TForm_ShipAddress
  Left = 386
  Top = 135
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #35013#36816#22320#28857#26597#25214
  ClientHeight = 416
  ClientWidth = 484
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
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
    Left = 41
    Top = 13
    Width = 94
    Height = 13
    Alignment = taRightJustify
    Caption = '     '#35013#36816#22320#28857':'
  end
  object Edit1: TEdit
    Left = 138
    Top = 9
    Width = 180
    Height = 21
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 0
    OnChange = Edit1Change
  end
  object BitBtn1: TBitBtn
    Left = 319
    Top = 7
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
    Left = -1
    Top = 36
    Width = 482
    Height = 347
    DataSource = DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
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
        FieldName = 'location'
        Title.Caption = #35013#36816#22320#28857
        Width = 154
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ship_to_address_1'
        Title.Caption = #22320#22336
        Width = 153
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'state'
        Title.Caption = #24030'/'#30465
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'zip'
        Title.Caption = #37038#32534
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 159
    Top = 388
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 239
    Top = 388
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
    Parameters = <>
    SQL.Strings = (
      'select * from   data0012'
      '')
    Left = 380
    Top = 382
    object ADOQuery1rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery1location: TStringField
      FieldName = 'location'
      Size = 80
    end
    object ADOQuery1ship_to_address_1: TStringField
      FieldName = 'ship_to_address_1'
      Size = 100
    end
    object ADOQuery1state: TStringField
      FieldName = 'state'
      Size = 10
    end
    object ADOQuery1zip: TStringField
      FieldName = 'zip'
      Size = 10
    end
    object ADOQuery1SHIP_SHIPPING_METHOD: TStringField
      FieldName = 'SHIP_SHIPPING_METHOD'
    end
    object ADOQuery1CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object ADOQuery1SHIP_TO_ADDRESS_2: TStringField
      FieldName = 'SHIP_TO_ADDRESS_2'
      Size = 50
    end
    object ADOQuery1SHIP_TO_ADDRESS_3: TStringField
      FieldName = 'SHIP_TO_ADDRESS_3'
      Size = 30
    end
    object ADOQuery1SHIP_TO_CONTACT: TStringField
      FieldName = 'SHIP_TO_CONTACT'
    end
    object ADOQuery1SHIP_TO_PHONE: TStringField
      FieldName = 'SHIP_TO_PHONE'
    end
    object ADOQuery1SHIP_TO_FAX: TStringField
      FieldName = 'SHIP_TO_FAX'
    end
    object ADOQuery1SREP_PTR_1: TIntegerField
      FieldName = 'SREP_PTR_1'
    end
    object ADOQuery1SREP_PTR_2: TIntegerField
      FieldName = 'SREP_PTR_2'
    end
    object ADOQuery1SREP_PTR_3: TIntegerField
      FieldName = 'SREP_PTR_3'
    end
    object ADOQuery1SREP_PTR_4: TIntegerField
      FieldName = 'SREP_PTR_4'
    end
    object ADOQuery1SREP_PTR_5: TIntegerField
      FieldName = 'SREP_PTR_5'
    end
    object ADOQuery1SREP_1_COMM: TBCDField
      FieldName = 'SREP_1_COMM'
      Precision = 5
      Size = 2
    end
    object ADOQuery1SREP_2_COMM: TBCDField
      FieldName = 'SREP_2_COMM'
      Precision = 5
      Size = 2
    end
    object ADOQuery1SREP_3_COMM: TBCDField
      FieldName = 'SREP_3_COMM'
      Precision = 5
      Size = 2
    end
    object ADOQuery1SREP_4_COMM: TBCDField
      FieldName = 'SREP_4_COMM'
      Precision = 5
      Size = 2
    end
    object ADOQuery1SREP_5_COMM: TBCDField
      FieldName = 'SREP_5_COMM'
      Precision = 5
      Size = 2
    end
    object ADOQuery1SREP_1_ALLOC: TBCDField
      FieldName = 'SREP_1_ALLOC'
      Precision = 5
      Size = 2
    end
    object ADOQuery1SREP_2_ALLOC: TBCDField
      FieldName = 'SREP_2_ALLOC'
      Precision = 5
      Size = 2
    end
    object ADOQuery1SREP_3_ALLOC: TBCDField
      FieldName = 'SREP_3_ALLOC'
      Precision = 5
      Size = 2
    end
    object ADOQuery1SREP_4_ALLOC: TBCDField
      FieldName = 'SREP_4_ALLOC'
      Precision = 5
      Size = 2
    end
    object ADOQuery1SREP_5_ALLOC: TBCDField
      FieldName = 'SREP_5_ALLOC'
      Precision = 5
      Size = 2
    end
    object ADOQuery1SHIP_CTAX_PTR: TIntegerField
      FieldName = 'SHIP_CTAX_PTR'
    end
    object ADOQuery1SHIP_LEAD_TIME: TSmallintField
      FieldName = 'SHIP_LEAD_TIME'
    end
    object ADOQuery1SHIP_FOB: TStringField
      FieldName = 'SHIP_FOB'
    end
    object ADOQuery1SHIP_REG_TAX_ID: TStringField
      FieldName = 'SHIP_REG_TAX_ID'
      Size = 15
    end
    object ADOQuery1STATE_SHIP_TAX_FLAG: TStringField
      FieldName = 'STATE_SHIP_TAX_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1STATE_PROD_TAX_FLAG: TStringField
      FieldName = 'STATE_PROD_TAX_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1STATE_TOOL_TAX_FLAG: TStringField
      FieldName = 'STATE_TOOL_TAX_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1LANGUAGE_FLAG: TStringField
      FieldName = 'LANGUAGE_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1OVERSHIP_BY_QTY_1: TFloatField
      FieldName = 'OVERSHIP_BY_QTY_1'
    end
    object ADOQuery1OVERSHIP_BY_QTY_2: TFloatField
      FieldName = 'OVERSHIP_BY_QTY_2'
    end
    object ADOQuery1OVERSHIP_BY_QTY_3: TFloatField
      FieldName = 'OVERSHIP_BY_QTY_3'
    end
    object ADOQuery1ORDER_QTY_RANGE_1: TFloatField
      FieldName = 'ORDER_QTY_RANGE_1'
    end
    object ADOQuery1ORDER_QTY_RANGE_2: TFloatField
      FieldName = 'ORDER_QTY_RANGE_2'
    end
    object ADOQuery1COUNTRY_PTR: TIntegerField
      FieldName = 'COUNTRY_PTR'
    end
    object ADOQuery1LOCNAME_FOR_FORM: TStringField
      FieldName = 'LOCNAME_FOR_FORM'
      Size = 100
    end
    object ADOQuery1SHP_ADDR1_FOR_FORM: TStringField
      FieldName = 'SHP_ADDR1_FOR_FORM'
      Size = 100
    end
    object ADOQuery1SHP_ADDR2_FOR_FORM: TStringField
      FieldName = 'SHP_ADDR2_FOR_FORM'
      Size = 40
    end
    object ADOQuery1SHP_ADDR3_FOR_FORM: TStringField
      FieldName = 'SHP_ADDR3_FOR_FORM'
      Size = 40
    end
    object ADOQuery1SHP_ANALYSIS_CODE1: TStringField
      FieldName = 'SHP_ANALYSIS_CODE1'
    end
    object ADOQuery1SHP_ANALYSIS_CODE2: TStringField
      FieldName = 'SHP_ANALYSIS_CODE2'
    end
    object ADOQuery1SHP_ANALYSIS_CODE3: TStringField
      FieldName = 'SHP_ANALYSIS_CODE3'
    end
    object ADOQuery1EMAIL_FOR_CONTACT: TStringField
      FieldName = 'EMAIL_FOR_CONTACT'
      Size = 50
    end
    object ADOQuery1DAYS_EARLY: TIntegerField
      FieldName = 'DAYS_EARLY'
    end
    object ADOQuery1DAYS_LATE: TIntegerField
      FieldName = 'DAYS_LATE'
    end
    object ADOQuery1S4_BARCODE_LABLE: TStringField
      FieldName = 'S4_BARCODE_LABLE'
      Size = 100
    end
    object ADOQuery1S3_BARCODE_LABLE: TStringField
      FieldName = 'S3_BARCODE_LABLE'
      Size = 100
    end
    object ADOQuery1PACKGE_BARCODE_LABLE: TStringField
      FieldName = 'PACKGE_BARCODE_LABLE'
      Size = 100
    end
    object ADOQuery1MISC_BARCODE_LABLE: TStringField
      FieldName = 'MISC_BARCODE_LABLE'
      Size = 100
    end
    object ADOQuery1COFC_FORMAT_FILENAME: TStringField
      FieldName = 'COFC_FORMAT_FILENAME'
      Size = 100
    end
    object ADOQuery1overship_flag: TWordField
      FieldName = 'overship_flag'
    end
    object ADOQuery1EXPIRED_DATE: TDateTimeField
      FieldName = 'EXPIRED_DATE'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 344
    Top = 384
  end
end
