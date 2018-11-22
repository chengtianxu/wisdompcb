object Form1: TForm1
  Left = 237
  Top = 187
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #22269#23478#25110#22320#21306
  ClientHeight = 406
  ClientWidth = 674
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
    674
    406)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 325
    Top = 65
    Width = 60
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#22269#23478#20195#30721':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 325
    Top = 89
    Width = 60
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#22269#23478#21517#31216':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object BitBtn1: TBitBtn
    Left = 6
    Top = 4
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
  object DBGrid1: TDBGrid
    Left = -1
    Top = 31
    Width = 313
    Height = 356
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 1
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
        FieldName = 'COUNTRY_CODE'
        Title.Caption = #22269#23478#20195#30721
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COUNTRY_NAME'
        Title.Caption = #22269#23478#21517#31216
        Width = 206
        Visible = True
      end>
  end
  object Bar1: TStatusBar
    Left = 0
    Top = 387
    Width = 674
    Height = 19
    Panels = <>
    SimpleText = #25628#32034':'
  end
  object DBEdit1: TDBEdit
    Left = 402
    Top = 61
    Width = 121
    Height = 21
    Color = cl3DLight
    DataField = 'COUNTRY_CODE'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 3
    OnKeyPress = FormKeyPress
  end
  object DBEdit2: TDBEdit
    Left = 402
    Top = 86
    Width = 248
    Height = 21
    Color = cl3DLight
    DataField = 'COUNTRY_NAME'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 4
    OnKeyPress = FormKeyPress
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 425
    Top = 328
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 488
    Top = 328
    object append: TMenuItem
      Caption = #26032#22686
      OnClick = appendClick
    end
    object edit: TMenuItem
      Caption = #32534#36753
      OnClick = editClick
    end
    object copydata: TMenuItem
      Caption = #22797#21046
      OnClick = copydataClick
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
    OnDeleteError = ADOTable1DeleteError
    OnPostError = ADOTable1PostError
    IndexFieldNames = 'country_code'
    TableName = 'Data0250'
    Left = 456
    Top = 328
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 440
    Top = 192
  end
end
