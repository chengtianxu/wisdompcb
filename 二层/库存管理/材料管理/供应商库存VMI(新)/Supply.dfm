object Form_Supply: TForm_Supply
  Left = 375
  Top = 112
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20379#24212#21830#25628#32034
  ClientHeight = 473
  ClientWidth = 432
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
    Left = 10
    Top = 15
    Width = 72
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #20379#24212#21830#20195#30721':'
  end
  object Edit1: TEdit
    Left = 84
    Top = 11
    Width = 158
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
  end
  object BitBtn1: TBitBtn
    Left = 247
    Top = 9
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
  object RadioGroup1: TRadioGroup
    Left = 276
    Top = -1
    Width = 148
    Height = 42
    Caption = #26597#25214#23383#27573
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #20195#21495
      #21517#31216)
    TabOrder = 2
    OnClick = RadioGroup1Click
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 45
    Width = 425
    Height = 384
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 3
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
        FieldName = 'CODE'
        Title.Caption = #20379#24212#21830#20195#30721
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUPPLIER_NAME'
        Title.Caption = #20379#24212#21830#22995#21517
        Width = 308
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 132
    Top = 434
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 4
  end
  object Button2: TButton
    Left = 212
    Top = 434
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 5
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 64
    Top = 312
  end
  object ADOQuery1: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'select * from data0023  where EDI_OUT_NEW_PO=1')
    Left = 208
    Top = 160
    object ADOQuery1RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQuery1CODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object ADOQuery1SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object ADOQuery1ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object ADOQuery1BILLING_ADDRESS_1: TStringField
      FieldName = 'BILLING_ADDRESS_1'
      Size = 100
    end
    object ADOQuery1STATE: TStringField
      FieldName = 'STATE'
      Size = 10
    end
    object ADOQuery1ZIP: TStringField
      FieldName = 'ZIP'
      Size = 10
    end
    object ADOQuery1PHONE: TStringField
      FieldName = 'PHONE'
    end
    object ADOQuery1FAX: TStringField
      FieldName = 'FAX'
    end
    object ADOQuery1TELEX: TStringField
      FieldName = 'TELEX'
      Size = 40
    end
    object ADOQuery1CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object ADOQuery1PO_NOTE_PAD_PTR: TIntegerField
      FieldName = 'PO_NOTE_PAD_PTR'
    end
    object ADOQuery1DEBMEM_NOTE_PAD_PTR: TIntegerField
      FieldName = 'DEBMEM_NOTE_PAD_PTR'
    end
    object ADOQuery1RFQ_NOTE_PAD_PTR: TIntegerField
      FieldName = 'RFQ_NOTE_PAD_PTR'
    end
    object ADOQuery1common_pad_ptr: TIntegerField
      FieldName = 'common_pad_ptr'
    end
    object ADOQuery1CONTACT_NAME_1: TStringField
      FieldName = 'CONTACT_NAME_1'
    end
    object ADOQuery1CONTACT_NAME_2: TStringField
      FieldName = 'CONTACT_NAME_2'
    end
    object ADOQuery1CONTACT_NAME_3: TStringField
      FieldName = 'CONTACT_NAME_3'
    end
    object ADOQuery1CONTACT_NAME_4: TStringField
      FieldName = 'CONTACT_NAME_4'
    end
    object ADOQuery1CONTACT_NAME_5: TStringField
      FieldName = 'CONTACT_NAME_5'
    end
    object ADOQuery1CONTACT_NAME_6: TStringField
      FieldName = 'CONTACT_NAME_6'
    end
    object ADOQuery1CONT_PHONE_1: TStringField
      FieldName = 'CONT_PHONE_1'
      FixedChar = True
      Size = 14
    end
    object ADOQuery1CONT_PHONE_2: TStringField
      FieldName = 'CONT_PHONE_2'
      FixedChar = True
      Size = 14
    end
    object ADOQuery1CONT_PHONE_3: TStringField
      FieldName = 'CONT_PHONE_3'
      FixedChar = True
      Size = 14
    end
    object ADOQuery1CONT_PHONE_4: TStringField
      FieldName = 'CONT_PHONE_4'
      FixedChar = True
      Size = 14
    end
    object ADOQuery1CONT_PHONE_5: TStringField
      FieldName = 'CONT_PHONE_5'
      FixedChar = True
      Size = 14
    end
    object ADOQuery1CONT_PHONE_6: TStringField
      FieldName = 'CONT_PHONE_6'
      FixedChar = True
      Size = 14
    end
    object ADOQuery1TAX_1: TFloatField
      FieldName = 'TAX_1'
    end
    object ADOQuery1TAX_2: TFloatField
      FieldName = 'TAX_2'
    end
    object ADOQuery1CURRENT_BALANCE: TFloatField
      FieldName = 'CURRENT_BALANCE'
    end
    object ADOQuery1OUTSTANDING_DEBITS: TFloatField
      FieldName = 'OUTSTANDING_DEBITS'
    end
    object ADOQuery1PAYMENT_TERMS: TSmallintField
      FieldName = 'PAYMENT_TERMS'
    end
    object ADOQuery1DISCOUNT: TFloatField
      FieldName = 'DISCOUNT'
    end
    object ADOQuery1DISCOUNT_DAYS: TSmallintField
      FieldName = 'DISCOUNT_DAYS'
    end
    object ADOQuery1PRNT_ONE_INV_PER_CHK: TStringField
      FieldName = 'PRNT_ONE_INV_PER_CHK'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1PUT_ALL_INV_HOLD: TStringField
      FieldName = 'PUT_ALL_INV_HOLD'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1LANGUAGE_FLAG: TStringField
      FieldName = 'LANGUAGE_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1TAX_ID_NUMBER: TStringField
      FieldName = 'TAX_ID_NUMBER'
    end
    object ADOQuery1DISCOUNT2: TFloatField
      FieldName = 'DISCOUNT2'
    end
    object ADOQuery1DISCOUNT2_DAYS: TSmallintField
      FieldName = 'DISCOUNT2_DAYS'
    end
    object ADOQuery1COUNTRY_PTR: TIntegerField
      FieldName = 'COUNTRY_PTR'
    end
    object ADOQuery1NAME_FOR_FORM: TStringField
      FieldName = 'NAME_FOR_FORM'
      Size = 40
    end
    object ADOQuery1ADDRESS1_FOR_FORM: TStringField
      FieldName = 'ADDRESS1_FOR_FORM'
      Size = 70
    end
    object ADOQuery1ADDRESS2_FOR_FORM: TStringField
      FieldName = 'ADDRESS2_FOR_FORM'
      Size = 30
    end
    object ADOQuery1ADDRESS3_FOR_FORM: TStringField
      FieldName = 'ADDRESS3_FOR_FORM'
      Size = 30
    end
    object ADOQuery1ANALYSIS_CODE1: TStringField
      FieldName = 'ANALYSIS_CODE1'
    end
    object ADOQuery1ANALYSIS_CODE2: TStringField
      FieldName = 'ANALYSIS_CODE2'
    end
    object ADOQuery1ANALYSIS_CODE3: TStringField
      FieldName = 'ANALYSIS_CODE3'
    end
    object ADOQuery1SUPPIER_ENT_DATE: TDateTimeField
      FieldName = 'SUPPIER_ENT_DATE'
    end
    object ADOQuery1EDI_ID: TStringField
      FieldName = 'EDI_ID'
      FixedChar = True
      Size = 50
    end
    object ADOQuery1EDI_FLAG_FOR_PO: TSmallintField
      FieldName = 'EDI_FLAG_FOR_PO'
    end
    object ADOQuery1EDI_FLAG_DEBIT_MEMO: TSmallintField
      FieldName = 'EDI_FLAG_DEBIT_MEMO'
    end
    object ADOQuery1GEN_EMAIL_ADDRESS: TStringField
      FieldName = 'GEN_EMAIL_ADDRESS'
      FixedChar = True
      Size = 30
    end
    object ADOQuery1EMAIL_FOR_CONTACT1: TStringField
      FieldName = 'EMAIL_FOR_CONTACT1'
      FixedChar = True
      Size = 50
    end
    object ADOQuery1EMAIL_FOR_CONTACT2: TStringField
      FieldName = 'EMAIL_FOR_CONTACT2'
      FixedChar = True
      Size = 50
    end
    object ADOQuery1EMAIL_FOR_CONTACT3: TStringField
      FieldName = 'EMAIL_FOR_CONTACT3'
      FixedChar = True
      Size = 50
    end
    object ADOQuery1EMAIL_FOR_CONTACT4: TStringField
      FieldName = 'EMAIL_FOR_CONTACT4'
      FixedChar = True
      Size = 50
    end
    object ADOQuery1EMAIL_FOR_CONTACT5: TStringField
      FieldName = 'EMAIL_FOR_CONTACT5'
      FixedChar = True
      Size = 50
    end
    object ADOQuery1EMAIL_FOR_CONTACT6: TStringField
      FieldName = 'EMAIL_FOR_CONTACT6'
      FixedChar = True
      Size = 50
    end
    object ADOQuery1ACC_PAYABLE_PTR: TIntegerField
      FieldName = 'ACC_PAYABLE_PTR'
    end
    object ADOQuery1EDI_OUT_NEW_PO: TWordField
      FieldName = 'EDI_OUT_NEW_PO'
    end
    object ADOQuery1EDI_OUT_CHG_PO: TWordField
      FieldName = 'EDI_OUT_CHG_PO'
    end
    object ADOQuery1ttype: TWordField
      FieldName = 'ttype'
    end
    object ADOQuery1brother_flag: TBooleanField
      FieldName = 'brother_flag'
    end
    object ADOQuery1update_date: TDateTimeField
      FieldName = 'update_date'
    end
    object ADOQuery1user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object ADOQuery1status: TWordField
      FieldName = 'status'
    end
  end
end
