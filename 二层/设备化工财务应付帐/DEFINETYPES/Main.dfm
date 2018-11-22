object FrmMain: TFrmMain
  Left = 192
  Top = 122
  Width = 696
  Height = 480
  Caption = #25910#20837'/'#25903#20986#31867#21035#23450#20041
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 0
    Width = 688
    Height = 39
    Cursor = crArrow
    Align = alTop
  end
  object Label1: TLabel
    Left = 395
    Top = 51
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #21517#31216':'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 395
    Top = 79
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = #35828#26126':'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 402
    Top = 107
    Width = 26
    Height = 13
    Alignment = taRightJustify
    Caption = #31867#21035
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 350
    Top = 136
    Width = 78
    Height = 13
    Alignment = taRightJustify
    Caption = #23545#24212#20250#35745#31185#30446
    FocusControl = DBEdit4
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
    Top = 39
    Width = 320
    Height = 395
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
    Columns = <
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Caption = #25910#20837'/'#25903#20986#21517#31216
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CTYPE'
        Title.Caption = #31867#21035
        Width = 150
        Visible = True
      end>
  end
  object BitBtn2: TBitBtn
    Left = 8
    Top = 8
    Width = 24
    Height = 24
    TabOrder = 1
    OnClick = N14Click
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
    Top = 434
    Width = 688
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object DBEdit1: TDBEdit
    Left = 432
    Top = 46
    Width = 153
    Height = 21
    Color = clScrollBar
    DataField = 'NAME'
    DataSource = DataSource1
    Enabled = False
    TabOrder = 3
  end
  object DBEdit2: TDBEdit
    Left = 432
    Top = 74
    Width = 234
    Height = 21
    Color = clScrollBar
    DataField = 'DESCRIPTION'
    DataSource = DataSource1
    Enabled = False
    TabOrder = 4
  end
  object DBEdit3: TDBEdit
    Left = 432
    Top = 103
    Width = 81
    Height = 21
    Color = clScrollBar
    DataField = 'CTYPE'
    DataSource = DataSource1
    Enabled = False
    TabOrder = 5
  end
  object DBEdit4: TDBEdit
    Left = 432
    Top = 131
    Width = 121
    Height = 21
    Color = clScrollBar
    DataField = 'gl_acc_number'
    DataSource = DataSource1
    Enabled = False
    TabOrder = 6
  end
  object DBEdit5: TDBEdit
    Left = 432
    Top = 160
    Width = 185
    Height = 21
    Color = clScrollBar
    DataField = 'gl_description'
    DataSource = DataSource1
    Enabled = False
    TabOrder = 7
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 359
    Top = 327
  end
  object DataSource1: TDataSource
    DataSet = ADOData0520
    Left = 327
    Top = 240
  end
  object ADOData0520: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = ADOData0520CalcFields
    ParamCheck = False
    Parameters = <>
    SQL.Strings = (
      
        'SELECT  data0520.*,data0103.gl_acc_number,data0103.gl_descriptio' +
        'n'
      'FROM  Data0520 left outer join data0103'
      'on data0520.gl_acct_ptr=data0103.rkey'
      'ORDER BY data0520.ttype,data0520.name')
    Left = 359
    Top = 240
    object ADOData0520RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOData0520TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object ADOData0520NAME: TStringField
      FieldName = 'NAME'
      FixedChar = True
    end
    object ADOData0520DESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      FixedChar = True
      Size = 50
    end
    object ADOData0520GL_ACCT_PTR: TIntegerField
      FieldName = 'GL_ACCT_PTR'
    end
    object ADOData0520CTYPE: TStringField
      FieldKind = fkCalculated
      FieldName = 'CTYPE'
      Calculated = True
    end
    object ADOData0520gl_acc_number: TStringField
      FieldName = 'gl_acc_number'
      FixedChar = True
      Size = 18
    end
    object ADOData0520gl_description: TStringField
      FieldName = 'gl_description'
      Size = 30
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 144
    Top = 224
    object N2: TMenuItem
      Caption = #26032#22686
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #20462#25913
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #21024#38500
      OnClick = N4Click
    end
  end
  object ADO0520: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = ADOData0520CalcFields
    Parameters = <
      item
        Name = 'vptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT  * FROM  Data0520'
      'where rkey=:vptr')
    Left = 359
    Top = 288
  end
end
