object FrmMain: TFrmMain
  Left = 270
  Top = 207
  Width = 658
  Height = 460
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #29616#37329#24080#25143#35774#32622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowMenu = edit
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 0
    Width = 650
    Height = 40
    Cursor = crArrow
    Align = alTop
  end
  object Label1: TLabel
    Left = 351
    Top = 52
    Width = 75
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #24080#25143#21517#31216':'
  end
  object Label2: TLabel
    Left = 367
    Top = 143
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #38134#34892#22320#22336':'
  end
  object Label4: TLabel
    Left = 393
    Top = 228
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #21306#21495':'
  end
  object Label5: TLabel
    Left = 351
    Top = 257
    Width = 75
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #30005#35805':'
  end
  object Label6: TLabel
    Left = 352
    Top = 284
    Width = 74
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '   '#20256#30495':'
  end
  object Label7: TLabel
    Left = 352
    Top = 313
    Width = 74
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '  '#24080#21495':'
  end
  object Label3: TLabel
    Left = 394
    Top = 80
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #24065#31181':'
  end
  object Label8: TLabel
    Left = 351
    Top = 107
    Width = 75
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #24403#21069#20313#39069':'
  end
  object user_ptr: TLabel
    Left = 360
    Top = 12
    Width = 17
    Height = 13
    AutoSize = False
    Caption = '0'
    Visible = False
  end
  object db_ptr: TLabel
    Left = 384
    Top = 12
    Width = 17
    Height = 13
    AutoSize = False
    Caption = '0'
    Visible = False
  end
  object vpass: TLabel
    Left = 403
    Top = 12
    Width = 17
    Height = 13
    AutoSize = False
    Caption = '0'
    Visible = False
  end
  object vprev: TLabel
    Left = 424
    Top = 12
    Width = 17
    Height = 13
    AutoSize = False
    Caption = '0'
    Visible = False
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 40
    Width = 289
    Height = 374
    Align = alLeft
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = editClick
    OnKeyPress = DBGrid1KeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'BANK_NAME'
        Title.Alignment = taCenter
        Title.Caption = #24080#25143#21517#31216
        Width = 264
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 8
    Width = 25
    Height = 25
    Hint = #36864#20986
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = BitBtn1Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
      F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
      000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
      338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
      45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
      3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
      F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
      000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
      338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
      4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
      8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
      333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
      0000}
    NumGlyphs = 2
  end
  object DBEdit1: TDBEdit
    Left = 432
    Top = 48
    Width = 121
    Height = 21
    Color = cl3DLight
    DataField = 'BANK_NAME'
    DataSource = DataSource1
    Enabled = False
    ReadOnly = True
    TabOrder = 2
  end
  object DBEdit2: TDBEdit
    Left = 432
    Top = 142
    Width = 192
    Height = 21
    Color = cl3DLight
    DataField = 'BANK_ADDRESS_LINE1'
    DataSource = DataSource1
    Enabled = False
    ReadOnly = True
    TabOrder = 3
  end
  object DBEdit3: TDBEdit
    Left = 432
    Top = 170
    Width = 192
    Height = 21
    Color = cl3DLight
    DataField = 'BANK_ADDRESS_LINE2'
    DataSource = DataSource1
    Enabled = False
    ReadOnly = True
    TabOrder = 4
  end
  object DBEdit4: TDBEdit
    Left = 432
    Top = 198
    Width = 192
    Height = 21
    Color = cl3DLight
    DataField = 'BANK_ADDRESS_LINE3'
    DataSource = DataSource1
    Enabled = False
    ReadOnly = True
    TabOrder = 5
  end
  object DBEdit6: TDBEdit
    Left = 432
    Top = 225
    Width = 97
    Height = 21
    Color = cl3DLight
    DataField = 'BANK_ZIPCODE'
    DataSource = DataSource1
    Enabled = False
    ReadOnly = True
    TabOrder = 6
  end
  object DBEdit7: TDBEdit
    Left = 432
    Top = 253
    Width = 192
    Height = 21
    Color = cl3DLight
    DataField = 'BANK_PHONE'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 7
  end
  object DBEdit8: TDBEdit
    Left = 432
    Top = 281
    Width = 192
    Height = 21
    Color = cl3DLight
    DataField = 'BANK_FX'
    DataSource = DataSource1
    Enabled = False
    ReadOnly = True
    TabOrder = 8
  end
  object DBEdit9: TDBEdit
    Left = 432
    Top = 309
    Width = 192
    Height = 21
    Color = cl3DLight
    DataField = 'BANK_ACCOUNT_NUMBER'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 9
  end
  object DBEdit5: TDBEdit
    Left = 433
    Top = 76
    Width = 121
    Height = 21
    Color = cl3DLight
    DataField = 'curr_code'
    DataSource = DataSource1
    Enabled = False
    ReadOnly = True
    TabOrder = 10
  end
  object DBEdit10: TDBEdit
    Left = 432
    Top = 103
    Width = 121
    Height = 21
    Color = cl3DLight
    DataField = 'BAL_AMOUNT'
    DataSource = DataSource1
    Enabled = False
    ReadOnly = True
    TabOrder = 11
  end
  object Bar1: TStatusBar
    Left = 0
    Top = 414
    Width = 650
    Height = 19
    Panels = <>
    SimplePanel = False
    SimpleText = 'Searching:'
  end
  object DataSource1: TDataSource
    DataSet = ADOdata0128
    Left = 304
    Top = 328
  end
  object PopupMenu1: TPopupMenu
    Left = 158
    Top = 272
    object add: TMenuItem
      Caption = #26032#24314
      OnClick = addClick
    end
    object edit: TMenuItem
      Caption = #32534#36753
      OnClick = editClick
    end
    object delete: TMenuItem
      Caption = #21024#38500
      OnClick = deleteClick
    end
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 224
    Top = 8
  end
  object ADOdata0128: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'select data0128.*'#13#10' from data0128 '#13#10'order by bank_name'
    Parameters = <>
    Left = 304
    Top = 296
    object ADOdata0128RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOdata0128BANK_NAME: TStringField
      FieldName = 'BANK_NAME'
      Size = 30
    end
    object ADOdata0128BANK_ANAME: TStringField
      FieldName = 'BANK_ANAME'
      Size = 10
    end
    object ADOdata0128BANK_ADDRESS_LINE1: TStringField
      FieldName = 'BANK_ADDRESS_LINE1'
      FixedChar = True
      Size = 30
    end
    object ADOdata0128BANK_ADDRESS_LINE2: TStringField
      FieldName = 'BANK_ADDRESS_LINE2'
      FixedChar = True
      Size = 30
    end
    object ADOdata0128BANK_ADDRESS_LINE3: TStringField
      FieldName = 'BANK_ADDRESS_LINE3'
      FixedChar = True
      Size = 30
    end
    object ADOdata0128BANK_ZIPCODE: TStringField
      FieldName = 'BANK_ZIPCODE'
      FixedChar = True
      Size = 10
    end
    object ADOdata0128BANK_PHONE: TStringField
      FieldName = 'BANK_PHONE'
      FixedChar = True
      Size = 14
    end
    object ADOdata0128BANK_FX: TStringField
      FieldName = 'BANK_FX'
      FixedChar = True
      Size = 14
    end
    object ADOdata0128BANK_ACCOUNT_NUMBER: TStringField
      FieldName = 'BANK_ACCOUNT_NUMBER'
      FixedChar = True
      Size = 14
    end
    object ADOdata0128BANK_CURRENT_CHECK: TStringField
      FieldName = 'BANK_CURRENT_CHECK'
      FixedChar = True
      Size = 10
    end
    object ADOdata0128BANK_CONTACT1: TStringField
      FieldName = 'BANK_CONTACT1'
      FixedChar = True
    end
    object ADOdata0128BANK_CONTACT2: TStringField
      FieldName = 'BANK_CONTACT2'
      FixedChar = True
    end
    object ADOdata0128BANK_CONTACT3: TStringField
      FieldName = 'BANK_CONTACT3'
      FixedChar = True
    end
    object ADOdata0128BANK_CON_PHONE1: TStringField
      FieldName = 'BANK_CON_PHONE1'
      FixedChar = True
      Size = 14
    end
    object ADOdata0128BANK_CON_PHONE2: TStringField
      FieldName = 'BANK_CON_PHONE2'
      FixedChar = True
      Size = 14
    end
    object ADOdata0128BANK_CON_PHONE3: TStringField
      FieldName = 'BANK_CON_PHONE3'
      FixedChar = True
      Size = 14
    end
    object ADOdata0128GL_ACCT_PTR: TIntegerField
      FieldName = 'GL_ACCT_PTR'
    end
    object ADOdata0128CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object ADOdata0128BAL_AMOUNT: TFloatField
      FieldName = 'BAL_AMOUNT'
    end
    object ADOdata0128GL_ACC_NUMBER: TStringField
      FieldKind = fkLookup
      FieldName = 'GL_ACC_NUMBER'
      LookupDataSet = ADOData0103
      LookupKeyFields = 'rkey'
      LookupResultField = 'gl_acc_number'
      KeyFields = 'GL_ACCT_PTR'
      Lookup = True
    end
    object ADOdata0128GL_DESCRIPTION: TStringField
      FieldKind = fkLookup
      FieldName = 'GL_DESCRIPTION'
      LookupDataSet = ADOData0103
      LookupKeyFields = 'rkey'
      LookupResultField = 'gl_description'
      KeyFields = 'GL_ACCT_PTR'
      Lookup = True
    end
    object ADOdata0128CURR_CODE: TStringField
      FieldKind = fkLookup
      FieldName = 'CURR_CODE'
      LookupDataSet = ADOData0001
      LookupKeyFields = 'rkey'
      LookupResultField = 'curr_code'
      KeyFields = 'CURRENCY_PTR'
      Lookup = True
    end
  end
  object ADOData0001: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select rkey,curr_code,curr_name'#13#10'from data0001 order by curr_cod' +
      'e'#13#10
    Parameters = <>
    Left = 336
    Top = 296
  end
  object ADOData0103: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select rkey,gl_acc_number,gl_description'#13#10'from data0103'#13#10
    Parameters = <>
    Left = 344
    Top = 328
  end
end
