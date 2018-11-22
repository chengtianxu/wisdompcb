object Form1: TForm1
  Left = 259
  Top = 127
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24037#21378#23450#20041
  ClientHeight = 414
  ClientWidth = 744
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 345
    Top = 62
    Width = 72
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '   '#24037#21378#20195#30721':'
  end
  object Label2: TLabel
    Left = 343
    Top = 90
    Width = 74
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '   '#24037#21378#21517#31216':'
  end
  object Label3: TLabel
    Left = 345
    Top = 119
    Width = 72
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '   '#32553#20889#21517#31216':'
  end
  object Label4: TLabel
    Left = 375
    Top = 148
    Width = 42
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '   '#22320#22336':'
  end
  object Label5: TLabel
    Left = 364
    Top = 176
    Width = 53
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '   '#24030'/'#30465':'
  end
  object Label6: TLabel
    Left = 373
    Top = 205
    Width = 44
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '   '#30005#35805':'
  end
  object Label7: TLabel
    Left = 371
    Top = 234
    Width = 46
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '   '#20256#30495':'
  end
  object Label9: TLabel
    Left = 513
    Top = 175
    Width = 47
    Height = 13
    Alignment = taRightJustify
    Caption = '  '#37038#32534':'
  end
  object Label8: TLabel
    Left = 533
    Top = 61
    Width = 52
    Height = 13
    Caption = #26159#21542#26377#25928
  end
  object Bar1: TStatusBar
    Left = 0
    Top = 395
    Width = 744
    Height = 19
    Panels = <>
    SimpleText = #25628#32034':'
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 40
    Width = 337
    Height = 353
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    TabOrder = 1
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = edit_wareClick
    OnKeyPress = FormKeyPress
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'WAREHOUSE_CODE'
        Title.Caption = '*'#24037#21378#20195#30721
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WAREHOUSE_NAME'
        Title.Caption = #24037#21378#21517#31216
        Width = 248
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 11
    Width = 25
    Height = 25
    Cursor = crHandPoint
    Hint = #36864#20986
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
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
    Left = 421
    Top = 58
    Width = 72
    Height = 21
    Color = cl3DLight
    DataField = 'WAREHOUSE_CODE'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 3
    OnKeyPress = FormKeyPress
  end
  object DBEdit2: TDBEdit
    Left = 421
    Top = 87
    Width = 309
    Height = 21
    Color = cl3DLight
    DataField = 'WAREHOUSE_NAME'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 4
    OnKeyPress = FormKeyPress
  end
  object DBEdit3: TDBEdit
    Left = 421
    Top = 115
    Width = 97
    Height = 21
    Color = cl3DLight
    DataField = 'ABBR_NAME'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 5
    OnKeyPress = FormKeyPress
  end
  object DBEdit4: TDBEdit
    Left = 421
    Top = 144
    Width = 309
    Height = 21
    Color = cl3DLight
    DataField = 'ADDRESS_LINE_1'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 6
    OnKeyPress = FormKeyPress
  end
  object DBEdit5: TDBEdit
    Left = 421
    Top = 172
    Width = 97
    Height = 21
    Color = cl3DLight
    DataField = 'STATE'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 7
    OnKeyPress = FormKeyPress
  end
  object DBEdit6: TDBEdit
    Left = 421
    Top = 201
    Width = 121
    Height = 21
    Color = cl3DLight
    DataField = 'PHONE'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 8
    OnKeyPress = FormKeyPress
  end
  object DBEdit7: TDBEdit
    Left = 421
    Top = 229
    Width = 121
    Height = 21
    Color = cl3DLight
    DataField = 'FAX'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 9
    OnKeyPress = FormKeyPress
  end
  object DBEdit9: TDBEdit
    Left = 565
    Top = 172
    Width = 92
    Height = 21
    Color = cl3DLight
    DataField = 'ZIP'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 10
    OnKeyPress = FormKeyPress
  end
  object DBEdit8: TDBEdit
    Left = 592
    Top = 58
    Width = 41
    Height = 21
    Color = clMenuBar
    DataField = 'active_flag'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 11
  end
  object ADOTable1: TADOTable
    AutoCalcFields = False
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    AfterDelete = ADOTable1AfterDelete
    OnDeleteError = ADOTable1DeleteError
    IndexFieldNames = 'warehouse_code'
    TableName = 'Data0015'
    Left = 365
    Top = 360
    object ADOTable1RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOTable1WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ADOTable1WAREHOUSE_NAME: TStringField
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
    object ADOTable1ENG_NAME: TStringField
      FieldName = 'ENG_NAME'
      Size = 70
    end
    object ADOTable1ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOTable1ADDRESS_LINE_1: TStringField
      FieldName = 'ADDRESS_LINE_1'
      FixedChar = True
      Size = 70
    end
    object ADOTable1ADDRESS_LINE_2: TStringField
      FieldName = 'ADDRESS_LINE_2'
      FixedChar = True
      Size = 70
    end
    object ADOTable1ADDRESS_LINE_3: TStringField
      FieldName = 'ADDRESS_LINE_3'
      FixedChar = True
      Size = 30
    end
    object ADOTable1STATE: TStringField
      FieldName = 'STATE'
      Size = 10
    end
    object ADOTable1ZIP: TStringField
      FieldName = 'ZIP'
      FixedChar = True
      Size = 10
    end
    object ADOTable1PHONE: TStringField
      FieldName = 'PHONE'
      FixedChar = True
      Size = 14
    end
    object ADOTable1FAX: TStringField
      FieldName = 'FAX'
      FixedChar = True
      Size = 14
    end
    object ADOTable1TELEX: TStringField
      FieldName = 'TELEX'
      Size = 30
    end
    object ADOTable1WEB: TStringField
      FieldName = 'WEB'
      Size = 50
    end
    object ADOTable1EMPLOYEE_PTR_1: TIntegerField
      FieldName = 'EMPLOYEE_PTR_1'
    end
    object ADOTable1EMPLOYEE_PTR_2: TIntegerField
      FieldName = 'EMPLOYEE_PTR_2'
    end
    object ADOTable1EMPLOYEE_PTR_3: TIntegerField
      FieldName = 'EMPLOYEE_PTR_3'
    end
    object ADOTable1WAREHOUSE_TYPE: TStringField
      FieldName = 'WAREHOUSE_TYPE'
      FixedChar = True
      Size = 2
    end
    object ADOTable1o_warehouse_name: TStringField
      FieldName = 'o_warehouse_name'
      Size = 70
    end
    object ADOTable1o_eng_name: TStringField
      FieldName = 'o_eng_name'
      Size = 70
    end
    object ADOTable1o_address_1: TStringField
      FieldName = 'o_address_1'
      Size = 70
    end
    object ADOTable1o_address_2: TStringField
      FieldName = 'o_address_2'
      Size = 80
    end
    object ADOTable1o_address_3: TStringField
      FieldName = 'o_address_3'
      Size = 50
    end
    object ADOTable1o_state: TStringField
      FieldName = 'o_state'
      FixedChar = True
      Size = 10
    end
    object ADOTable1o_zip: TStringField
      FieldName = 'o_zip'
      FixedChar = True
      Size = 10
    end
    object ADOTable1o_phone: TStringField
      FieldName = 'o_phone'
      FixedChar = True
      Size = 14
    end
    object ADOTable1o_fax: TStringField
      FieldName = 'o_fax'
      FixedChar = True
      Size = 14
    end
    object ADOTable1o_telex: TStringField
      FieldName = 'o_telex'
      Size = 30
    end
    object ADOTable1o_web: TStringField
      FieldName = 'o_web'
      Size = 50
    end
    object ADOTable1purchase_order: TStringField
      FieldName = 'purchase_order'
      Size = 15
    end
    object ADOTable1o_purchase_order: TStringField
      FieldName = 'o_purchase_order'
      Size = 15
    end
    object ADOTable1picture: TBlobField
      FieldName = 'picture'
    end
    object ADOTable1o_picture: TBlobField
      FieldName = 'o_picture'
    end
    object ADOTable1part_batch: TStringField
      FieldName = 'part_batch'
      Size = 5
    end
    object ADOTable1part_templet: TStringField
      FieldName = 'part_templet'
      Size = 5
    end
    object ADOTable1active_flag: TStringField
      FieldName = 'active_flag'
      FixedChar = True
      Size = 1
    end
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 399
    Top = 327
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 365
    Top = 328
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 397
    Top = 360
    object add_ware: TMenuItem
      Caption = #26032#24314
      OnClick = add_wareClick
    end
    object edit_ware: TMenuItem
      Caption = #32534#36753
      OnClick = edit_wareClick
    end
    object copy_ware: TMenuItem
      Caption = #22797#21046
      OnClick = copy_wareClick
    end
    object del_ware: TMenuItem
      Caption = #21024#38500
      OnClick = del_wareClick
    end
  end
  object AQ04: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select seed_value,seed_flag from  data0004 where rkey=19')
    Left = 429
    Top = 360
    object AQ04seed_value: TStringField
      FieldName = 'seed_value'
    end
    object AQ04seed_flag: TWordField
      FieldName = 'seed_flag'
    end
  end
end
