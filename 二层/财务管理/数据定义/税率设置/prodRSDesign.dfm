object FrmProdRSDesign: TFrmProdRSDesign
  Left = 232
  Top = 186
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #22686#20540#31246#31246#29575#34920
  ClientHeight = 381
  ClientWidth = 597
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 336
    Top = 48
    Width = 75
    Height = 13
    AutoSize = False
    Caption = #20195#21495
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 336
    Top = 88
    Width = 75
    Height = 13
    AutoSize = False
    Caption = #21517#31216
    FocusControl = DBEdit2
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 33
    Width = 321
    Height = 329
    Align = alLeft
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = MeditClick
    OnKeyPress = DBGrid1KeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'STATE_ID'
        Title.Caption = #20195#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Caption = #21517#31216
        Width = 161
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATE_TAX'
        Title.Caption = #31246#29575'(%)'
        Width = 67
        Visible = True
      end>
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 597
    Height = 33
    ButtonHeight = 25
    Caption = 'ToolBar1'
    Indent = 10
    TabOrder = 1
    object SpeedButton1: TSpeedButton
      Left = 10
      Top = 2
      Width = 28
      Height = 25
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
      OnClick = SpeedButton1Click
    end
  end
  object DBEdit1: TDBEdit
    Left = 336
    Top = 64
    Width = 134
    Height = 21
    DataField = 'STATE_ID'
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBEdit2: TDBEdit
    Left = 336
    Top = 104
    Width = 245
    Height = 21
    DataField = 'NAME'
    DataSource = DataSource1
    TabOrder = 3
  end
  object Bar1: TStatusBar
    Left = 0
    Top = 362
    Width = 597
    Height = 19
    Panels = <>
    SimpleText = 'Searching:'
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'select * from data0189'
      'order by state_id')
    Left = 101
    Top = 323
    object ADOQuery1RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQuery1STATE_ID: TStringField
      FieldName = 'STATE_ID'
      Size = 10
    end
    object ADOQuery1STATE_TAX: TFloatField
      FieldName = 'STATE_TAX'
    end
    object ADOQuery1NAME: TStringField
      FieldName = 'NAME'
      FixedChar = True
      Size = 30
    end
    object ADOQuery1GL_ACCT_PTR: TIntegerField
      FieldName = 'GL_ACCT_PTR'
    end
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 44
    Top = 323
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 73
    Top = 321
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    Left = 135
    Top = 320
    object MAdd: TMenuItem
      Caption = #26032#22686
      OnClick = MAddClick
    end
    object Medit: TMenuItem
      Caption = #32534#36753
      OnClick = MeditClick
    end
    object Mview: TMenuItem
      Caption = #26816#26597
      OnClick = MviewClick
    end
    object Mdelete: TMenuItem
      Caption = #21024#38500
      OnClick = MdeleteClick
    end
  end
end
