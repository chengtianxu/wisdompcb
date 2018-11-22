object Form1: TForm1
  Left = 229
  Top = 172
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #35013#36816#26041#27861
  ClientHeight = 396
  ClientWidth = 634
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 310
    Top = 48
    Width = 80
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#22791#27880#20195#30721':'
  end
  object Label2: TLabel
    Left = 328
    Top = 77
    Width = 61
    Height = 13
    Alignment = taRightJustify
    Caption = '    '#36710#36742':'
  end
  object Label3: TLabel
    Left = 310
    Top = 103
    Width = 80
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#25552#21069#26102#38388':'
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 8
    Width = 25
    Height = 25
    Cursor = crHandPoint
    Hint = #36864#20986
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TabStop = False
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
  object Bar1: TStatusBar
    Left = 0
    Top = 377
    Width = 634
    Height = 19
    Panels = <>
    SimpleText = #25628#32034':'
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 40
    Width = 318
    Height = 337
    DataSource = DataSource1
    Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyPress = FormKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'CODE'
        Title.Caption = #20195#30721
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPTION'
        Title.Caption = #35013#36816#21517#31216
        Width = 183
        Visible = True
      end>
  end
  object DBEdit1: TDBEdit
    Left = 397
    Top = 44
    Width = 215
    Height = 21
    Color = cl3DLight
    DataField = 'SCAC_CODE'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 3
    OnKeyPress = FormKeyPress
  end
  object DBEdit2: TDBEdit
    Left = 397
    Top = 72
    Width = 215
    Height = 21
    Color = cl3DLight
    DataField = 'VEHICLE'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 4
    OnKeyPress = FormKeyPress
  end
  object DBEdit3: TDBEdit
    Left = 397
    Top = 99
    Width = 73
    Height = 21
    Color = cl3DLight
    DataField = 'SHIPPERS_LEAD_TIME'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 5
    OnKeyPress = FormKeyPress
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 352
    Top = 232
  end
  object AT370: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    AfterDelete = AT370AfterDelete
    IndexFieldNames = 'code'
    TableName = 'Data0370'
    Left = 424
    Top = 285
    object AT370RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AT370CODE: TStringField
      FieldName = 'CODE'
      FixedChar = True
    end
    object AT370DESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      FixedChar = True
      Size = 40
    end
    object AT370SCAC_CODE: TStringField
      FieldName = 'SCAC_CODE'
      FixedChar = True
      Size = 40
    end
    object AT370VEHICLE: TStringField
      FieldName = 'VEHICLE'
      FixedChar = True
      Size = 40
    end
    object AT370SHIPPERS_LEAD_TIME: TIntegerField
      FieldName = 'SHIPPERS_LEAD_TIME'
    end
    object AT370customer_ptr: TIntegerField
      FieldName = 'customer_ptr'
    end
  end
  object DataSource1: TDataSource
    DataSet = AT370
    Left = 392
    Top = 285
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 456
    Top = 285
    object N1: TMenuItem
      Caption = #26032#22686
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #32534#36753
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #21024#38500
      OnClick = N3Click
    end
  end
end
