object Form1: TForm1
  Left = 220
  Top = 222
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #36135#24065#20195#30721
  ClientHeight = 390
  ClientWidth = 657
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  DesignSize = (
    657
    390)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 312
    Top = 60
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #36135#24065#20195#30721':'
  end
  object Label2: TLabel
    Left = 312
    Top = 92
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #36135#24065#21517#31216':'
  end
  object Label3: TLabel
    Left = 312
    Top = 124
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #35760#24080#27719#29575':'
  end
  object Label4: TLabel
    Left = 312
    Top = 153
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #35760#24080#27719#29575':'
  end
  object Label5: TLabel
    Left = 338
    Top = 240
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #26085#26399':'
  end
  object Label6: TLabel
    Left = 312
    Top = 182
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #25253#20215#27719#29575':'
  end
  object Label7: TLabel
    Left = 312
    Top = 211
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #25253#20215#27719#29575':'
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 26
    Width = 282
    Height = 345
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = editClick
    OnKeyPress = FormKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'CURR_CODE'
        Title.Caption = #36135#24065#20195#30721
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        Title.Caption = #36135#24065#21517#31216
        Width = 175
        Visible = True
      end>
  end
  object Bar1: TStatusBar
    Left = 0
    Top = 371
    Width = 657
    Height = 19
    Panels = <>
    SimpleText = #25628#32034':'
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 0
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
    Left = 376
    Top = 56
    Width = 70
    Height = 21
    Color = cl3DLight
    DataField = 'CURR_CODE'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 3
    OnKeyPress = FormKeyPress
  end
  object DBEdit2: TDBEdit
    Left = 376
    Top = 88
    Width = 211
    Height = 21
    Color = cl3DLight
    DataField = 'CURR_NAME'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 4
    OnKeyPress = FormKeyPress
  end
  object DBEdit3: TDBEdit
    Left = 376
    Top = 121
    Width = 87
    Height = 21
    Color = cl3DLight
    DataField = 'EXCH_RATE'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 5
    OnKeyPress = FormKeyPress
  end
  object DBEdit4: TDBEdit
    Left = 376
    Top = 150
    Width = 87
    Height = 21
    Color = cl3DLight
    DataField = 'BASE_TO_OTHER'
    DataSource = DataSource1
    MaxLength = 10
    ReadOnly = True
    TabOrder = 6
    OnKeyPress = FormKeyPress
  end
  object DBEdit5: TDBEdit
    Left = 376
    Top = 235
    Width = 87
    Height = 21
    Color = cl3DLight
    DataField = 'TDATE'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 7
    OnKeyPress = FormKeyPress
  end
  object DBEdit6: TDBEdit
    Left = 466
    Top = 121
    Width = 121
    Height = 21
    Color = cl3DLight
    DataField = 'exch1'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 8
    OnKeyPress = FormKeyPress
  end
  object DBEdit7: TDBEdit
    Left = 466
    Top = 150
    Width = 121
    Height = 21
    Color = cl3DLight
    DataField = 'exch2'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 9
    OnKeyPress = FormKeyPress
  end
  object DBEdit8: TDBEdit
    Left = 376
    Top = 178
    Width = 87
    Height = 21
    Color = cl3DLight
    DataField = 'QTE_EXCH_RATE'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 10
    OnKeyPress = FormKeyPress
  end
  object DBEdit9: TDBEdit
    Left = 376
    Top = 207
    Width = 87
    Height = 21
    Color = cl3DLight
    DataField = 'QTE_BASE_TO_OTHER'
    DataSource = DataSource1
    MaxLength = 10
    ReadOnly = True
    TabOrder = 11
    OnKeyPress = FormKeyPress
  end
  object DBEdit10: TDBEdit
    Left = 466
    Top = 178
    Width = 121
    Height = 21
    Color = cl3DLight
    DataField = 'exch1'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 12
    OnKeyPress = FormKeyPress
  end
  object DBEdit11: TDBEdit
    Left = 466
    Top = 207
    Width = 121
    Height = 21
    Color = cl3DLight
    DataField = 'exch2'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 13
    OnKeyPress = FormKeyPress
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 328
    Top = 328
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 390
    Top = 328
    object add: TMenuItem
      Caption = #26032#22686
      OnClick = addClick
    end
    object edit: TMenuItem
      Caption = #32534#36753
      OnClick = editClick
    end
    object copydate: TMenuItem
      Caption = #22797#21046
      OnClick = copydateClick
    end
    object delete: TMenuItem
      Caption = #21024#38500
      OnClick = deleteClick
    end
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    AfterDelete = ADOTable1AfterDelete
    OnCalcFields = ADOTable1CalcFields
    OnDeleteError = ADOTable1DeleteError
    OnPostError = ADOTable1PostError
    IndexFieldNames = 'curr_code'
    TableName = 'Data0001'
    Left = 360
    Top = 328
    object ADOTable1RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOTable1CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADOTable1CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object ADOTable1EXCH_RATE: TFloatField
      Alignment = taLeftJustify
      FieldName = 'EXCH_RATE'
      DisplayFormat = '0.00000000'
    end
    object ADOTable1TDATE: TDateTimeField
      FieldName = 'TDATE'
      DisplayFormat = 'yyyy-mm-dd'
    end
    object ADOTable1TREADONLY: TIntegerField
      FieldName = 'TREADONLY'
    end
    object ADOTable1BASE_TO_OTHER: TFloatField
      Alignment = taLeftJustify
      FieldName = 'BASE_TO_OTHER'
      DisplayFormat = '0.00000000'
    end
    object ADOTable1exch1: TStringField
      FieldKind = fkCalculated
      FieldName = 'exch1'
      Size = 10
      Calculated = True
    end
    object ADOTable1exch2: TStringField
      FieldKind = fkCalculated
      FieldName = 'exch2'
      Size = 10
      Calculated = True
    end
    object ADOTable1QUOTE_BASED: TWordField
      FieldName = 'QUOTE_BASED'
    end
    object ADOTable1QTE_EXCH_RATE: TFloatField
      Alignment = taLeftJustify
      FieldName = 'QTE_EXCH_RATE'
      DisplayFormat = '0.00000000'
    end
    object ADOTable1QTE_BASE_TO_OTHER: TFloatField
      Alignment = taLeftJustify
      FieldName = 'QTE_BASE_TO_OTHER'
      DisplayFormat = '0.00000000'
    end
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=koimy1234;Persist Security Info=Tru' +
      'e;User ID=sa;Initial Catalog=sj_v20_live;Data Source=172.16.0.8'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 296
    Top = 328
  end
end
