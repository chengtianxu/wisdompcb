object Frm_Cust: TFrm_Cust
  Left = 459
  Top = 156
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #23458#25143#25628#32034
  ClientHeight = 432
  ClientWidth = 403
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000330000000000000000000000033303303303300000000000000
    0003303330333003003300000000000000033003330330002333000000000000
    0030000033003033333000000000000033333330000003330003330000000803
    33333333333333300233330000000F033333333333333302333BB03000004F83
    33333333333333333BB003BB00004FF3333333333333B33BB0033BBB00004FF3
    33333333B3BB3BB0033BBBB000004FF83B333B3B3B3BBBB03BBBBB0300F04FFF
    33B3B3B3BBBBBBBBBBBB00330FF04FFF8B3B3333BBBBBBBBBB0033330FF044FF
    F8BBB03033BBBBB330333330FFF444FFF8BB0BB3003B330003333330FF44444F
    F88B3BBB300000033333B33FFF44444FFF3BB0BBB3000333B33BB38FF4444444
    FF003B0BB333333BBBBBB3FFF44444444FF00030BBBBBBBBBBBBBBFF44444444
    0000000303BBB3300000BFF444444400000000000000000000000FF444440000
    0000000000000000000000444444000000000000000000000000000044440000
    0000000000000000000000000444000000000000000000000000000000040000
    000000000000000000000000000000000000000000000000000000000000FFFF
    FFFFFFFFFFFFFFFF1FFFFF8003FFFC0000FFF800007FF800007FE000003F0000
    001F0000001F0000000F00000007000000070000000000000000000000000000
    00000000000000000000000000000000000000000000000000000000000000C0
    00000FE01F003FFFFF80FFFFFFC0FFFFFFF0FFFFFFF8FFFFFFFEFFFFFFFF}
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 10
    Top = 18
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #23458#25143#20195#30721':'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 45
    Width = 402
    Height = 347
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
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
        FieldName = 'cust_code'
        Title.Caption = #23458#25143#20195#21495
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'customer_name'
        Title.Caption = #23458#25143#21517#31216
        Width = 280
        Visible = True
      end>
  end
  object BitBtn2: TBitBtn
    Left = 257
    Top = 11
    Width = 25
    Height = 25
    Hint = #21047#26032
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TabStop = False
    OnClick = BitBtn2Click
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
  object Edit1: TEdit
    Left = 80
    Top = 14
    Width = 171
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyDown = DBGrid1KeyDown
  end
  object Button1: TButton
    Left = 120
    Top = 396
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 3
    OnKeyDown = DBGrid1KeyDown
  end
  object Button2: TButton
    Left = 200
    Top = 396
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
    OnKeyDown = DBGrid1KeyDown
  end
  object RadioGroup1: TRadioGroup
    Left = 292
    Top = 0
    Width = 110
    Height = 43
    Caption = #26597#25214#23383#27573
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #20195#30721
      #21517#31216)
    TabOrder = 5
    OnClick = RadioGroup1Click
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 304
    Top = 394
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <
      item
        Name = 'code'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'declare @code varchar(10)'
      'set @code=:code'
      'select'
      ' rkey,cust_code,customer_name,currency_ptr,cod_flag,'
      ' CONTACT_NAME_1,CONTACT_NAME_2,CONTACT_NAME_3,'
      ' CONTACT_NAME_4,CONTACT_NAME_5,CONTACT_NAME_6,'
      ' INTERNAL_ECN_COUNT,EXTERNAL_ECN_COUNT, EDI_FLAG_FOR_INVOICE,'
      ' reg_tax_fixed_unused,credit_rating,credit_limit,'
      ' EDI_FLAG_FOR_SOACK,FED_TAX_ID_NO'
      'from data0010'
      'where cust_code like '#39'%'#39'+@code+'#39'%'#39
      'and CUSTOMER_TYPE<>4')
    Left = 336
    Top = 392
    object ADOQuery1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery1cust_code: TStringField
      FieldName = 'cust_code'
      Size = 10
    end
    object ADOQuery1customer_name: TStringField
      FieldName = 'customer_name'
      Size = 100
    end
    object ADOQuery1currency_ptr: TIntegerField
      FieldName = 'currency_ptr'
    end
    object ADOQuery1cod_flag: TStringField
      FieldName = 'cod_flag'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1CONTACT_NAME_1: TStringField
      FieldName = 'CONTACT_NAME_1'
      FixedChar = True
    end
    object ADOQuery1CONTACT_NAME_2: TStringField
      FieldName = 'CONTACT_NAME_2'
      FixedChar = True
    end
    object ADOQuery1CONTACT_NAME_3: TStringField
      FieldName = 'CONTACT_NAME_3'
      FixedChar = True
    end
    object ADOQuery1CONTACT_NAME_4: TStringField
      FieldName = 'CONTACT_NAME_4'
      FixedChar = True
    end
    object ADOQuery1CONTACT_NAME_5: TStringField
      FieldName = 'CONTACT_NAME_5'
      FixedChar = True
    end
    object ADOQuery1CONTACT_NAME_6: TStringField
      FieldName = 'CONTACT_NAME_6'
      FixedChar = True
    end
    object ADOQuery1INTERNAL_ECN_COUNT: TSmallintField
      FieldName = 'INTERNAL_ECN_COUNT'
    end
    object ADOQuery1EXTERNAL_ECN_COUNT: TSmallintField
      FieldName = 'EXTERNAL_ECN_COUNT'
    end
    object ADOQuery1EDI_FLAG_FOR_INVOICE: TSmallintField
      FieldName = 'EDI_FLAG_FOR_INVOICE'
    end
    object ADOQuery1reg_tax_fixed_unused: TStringField
      FieldName = 'reg_tax_fixed_unused'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1credit_rating: TWordField
      FieldName = 'credit_rating'
    end
    object ADOQuery1credit_limit: TFloatField
      FieldName = 'credit_limit'
    end
    object ADOQuery1EDI_FLAG_FOR_SOACK: TSmallintField
      FieldName = 'EDI_FLAG_FOR_SOACK'
    end
    object ADOQuery1FED_TAX_ID_NO: TStringField
      FieldName = 'FED_TAX_ID_NO'
      Size = 50
    end
  end
end
