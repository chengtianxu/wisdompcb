object FrmMain5: TFrmMain5
  Left = 229
  Top = 229
  Width = 696
  Height = 480
  Caption = #36710#38388#24211#23384#35843#25972
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 0
    Width = 688
    Height = 36
    Cursor = crArrow
    Align = alTop
  end
  object Label2: TLabel
    Left = 129
    Top = 15
    Width = 83
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #24037#24207#20195#21495':'
  end
  object Label6: TLabel
    Left = 240
    Top = 25
    Width = 115
    Height = 13
    AutoSize = False
  end
  object Label1: TLabel
    Left = 456
    Top = 58
    Width = 100
    Height = 13
    AutoSize = False
    Caption = #24037#24207#20195#21495
    FocusControl = DBEdit1
  end
  object Label4: TLabel
    Left = 456
    Top = 99
    Width = 100
    Height = 13
    AutoSize = False
    Caption = #26448#26009#20195#21495
    FocusControl = DBEdit3
  end
  object Label5: TLabel
    Left = 456
    Top = 139
    Width = 100
    Height = 13
    AutoSize = False
    Caption = #26448#26009#21517#31216
    FocusControl = DBEdit4
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 36
    Width = 449
    Height = 370
    Align = alLeft
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'dept_code'
        Title.Caption = #24037#24207#20195#21495
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inv_part_number'
        Title.Caption = #26448#26009#21517#31216
        Width = 163
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'unit_code'
        Title.Caption = #21333#20301
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BAL_QTY'
        Title.Caption = #36710#38388#20928#23384#37327
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LAST_DATE'
        Title.Caption = #26368#21518#26356#26032#26085#26399
        Width = 87
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 6
    Top = 5
    Width = 24
    Height = 24
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 406
    Width = 688
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object Edit1: TEdit
    Left = 216
    Top = 11
    Width = 72
    Height = 21
    TabOrder = 3
    OnExit = Edit1Exit
  end
  object DBEdit1: TDBEdit
    Left = 456
    Top = 74
    Width = 57
    Height = 21
    Color = clScrollBar
    DataField = 'dept_code'
    DataSource = DataSource1
    Enabled = False
    TabOrder = 4
  end
  object DBEdit3: TDBEdit
    Left = 456
    Top = 115
    Width = 228
    Height = 21
    Color = clScrollBar
    DataField = 'inv_part_number'
    DataSource = DataSource1
    Enabled = False
    TabOrder = 5
  end
  object DBEdit4: TDBEdit
    Left = 456
    Top = 155
    Width = 229
    Height = 21
    Color = clScrollBar
    DataField = 'inv_part_description'
    DataSource = DataSource1
    Enabled = False
    TabOrder = 6
  end
  object ADOData0458: TADOQuery
    Connection = MainForm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'select data0458.*,data0034.dept_code,data0034.dept_name,'
      
        'data0017.inv_part_number,data0017.inv_part_description,data0002.' +
        'unit_code'
      'from data0458,data0017,data0034,data0002'
      'where data0458.invent_ptr=data0017.rkey'
      'and data0458.dept_ptr=data0034.rkey'
      'and data0017.stock_unit_ptr=data0002.rkey'
      'order by data0034.dept_code,data0017.inv_part_number')
    Left = 80
    Top = 168
    object ADOData0458RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOData0458DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ADOData0458INVENT_PTR: TIntegerField
      FieldName = 'INVENT_PTR'
    end
    object ADOData0458BAL_QTY: TFloatField
      FieldName = 'BAL_QTY'
      DisplayFormat = '#0.000'
    end
    object ADOData0458LAST_DATE: TDateTimeField
      FieldName = 'LAST_DATE'
    end
    object ADOData0458dept_code: TStringField
      FieldName = 'dept_code'
      Size = 10
    end
    object ADOData0458dept_name: TStringField
      FieldName = 'dept_name'
      Size = 30
    end
    object ADOData0458inv_part_number: TStringField
      FieldName = 'inv_part_number'
      Size = 25
    end
    object ADOData0458inv_part_description: TStringField
      FieldName = 'inv_part_description'
      Size = 100
    end
    object ADOData0458unit_code: TStringField
      FieldName = 'unit_code'
      Size = 5
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOData0458
    Left = 80
    Top = 200
  end
  object PopupMenu1: TPopupMenu
    Left = 160
    Top = 200
    object N1: TMenuItem
      Caption = #36710#38388#24211#23384#35843#25972
      OnClick = N1Click
    end
  end
  object ADODate: TADOQuery
    Connection = MainForm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select vdt=current_timestamp')
    Left = 141
    Top = 167
  end
  object ADOData0455: TADOQuery
    Connection = MainForm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'select * from data0455'
      'where rkey is null')
    Left = 112
    Top = 168
  end
  object MainMenu1: TMainMenu
    Left = 120
    Top = 200
    object IQC1: TMenuItem
      Caption = #25991#20214
      object IQC2: TMenuItem
        Caption = #21015#21360#36710#38388#24211#23384#19968#35272#34920
        OnClick = IQC2Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object N4: TMenuItem
        Caption = #36864#20986
        OnClick = BitBtn1Click
      end
    end
  end
end
