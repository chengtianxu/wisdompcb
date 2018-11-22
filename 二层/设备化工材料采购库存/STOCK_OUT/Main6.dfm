object FrmMain6: TFrmMain6
  Left = 239
  Top = 190
  Width = 696
  Height = 480
  Caption = #26816#35270'/'#37325#21360#20986#20179#21333
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 0
    Width = 688
    Height = 52
    Cursor = crArrow
    Align = alTop
  end
  object Label1: TLabel
    Left = 516
    Top = 80
    Width = 55
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #23457#35745#20154':'
  end
  object Label3: TLabel
    Left = 504
    Top = 110
    Width = 67
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #23457#35745#26085#26399':'
  end
  object user_ptr: TLabel
    Left = 520
    Top = 24
    Width = 38
    Height = 13
    AutoSize = False
    Caption = 'user_ptr'
    Visible = False
  end
  object Label4: TLabel
    Left = 512
    Top = 256
    Width = 55
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #24320#22987#26085':'
  end
  object Label5: TLabel
    Left = 512
    Top = 280
    Width = 55
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #25130#27490#26085':'
  end
  object Label2: TLabel
    Left = 48
    Top = 24
    Width = 83
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #20986#20179#21333#21495':'
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 52
    Width = 497
    Height = 371
    Align = alLeft
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
        FieldName = 'GON_NUMBER'
        Title.Caption = #20986#20179#21333#21495
        Width = 76
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'cTYpe'
        Title.Alignment = taCenter
        Title.Caption = #31867#21035
        Width = 62
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'REF_NUMBER'
        Title.Alignment = taCenter
        Title.Caption = #21442#32771#21495
        Width = 87
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'employee_name'
        Title.Alignment = taCenter
        Title.Caption = #21019#24314#20154
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CREATE_DATE'
        Title.Alignment = taCenter
        Title.Caption = #21019#24314#26102#38388
        Width = 116
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TStatus'
        Title.Alignment = taCenter
        Title.Caption = #29366#24577
        Width = 54
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 8
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
    Top = 423
    Width = 688
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object DBEdit1: TDBEdit
    Left = 575
    Top = 106
    Width = 107
    Height = 21
    DataField = 'AUDITED_DATE'
    DataSource = DataSource1
    TabOrder = 3
  end
  object DBEdit2: TDBEdit
    Left = 575
    Top = 74
    Width = 107
    Height = 21
    DataField = 'auditor'
    DataSource = DataSource1
    TabOrder = 4
  end
  object RadioGroup1: TRadioGroup
    Left = 520
    Top = 152
    Width = 145
    Height = 81
    Caption = #23457#35745#29366#24577
    ItemIndex = 0
    Items.Strings = (
      #24453#23457#35745
      #24050#23457#35745
      #20840#37096)
    TabOrder = 5
    OnClick = RadioGroup1Click
  end
  object DateTimePicker1: TDateTimePicker
    Left = 576
    Top = 248
    Width = 100
    Height = 21
    CalAlignment = dtaLeft
    Date = 37512.4226642708
    Time = 37512.4226642708
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 6
    OnCloseUp = DateTimePicker1CloseUp
  end
  object DateTimePicker2: TDateTimePicker
    Left = 576
    Top = 280
    Width = 101
    Height = 21
    CalAlignment = dtaLeft
    Date = 37512.4226686806
    Time = 37512.4226686806
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 7
    OnCloseUp = DateTimePicker2CloseUp
    OnExit = DateTimePicker2Exit
  end
  object Edit1: TEdit
    Left = 136
    Top = 20
    Width = 121
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 8
    OnExit = Edit1Exit
    OnKeyPress = Edit1KeyPress
  end
  object ADOData0457: TADOQuery
    Connection = MainForm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = ADOData0457CalcFields
    Parameters = <>
    SQL.Strings = (
      'select data0457.*,data0005.employee_name'
      'from data0457,data0005'
      'where data0457.create_by=data0005.rkey'
      'and status=0'
      'order by gon_number')
    Left = 80
    Top = 168
    object ADOData0457TStatus: TStringField
      FieldKind = fkCalculated
      FieldName = 'TStatus'
      Calculated = True
    end
    object ADOData0457auditor: TStringField
      FieldKind = fkLookup
      FieldName = 'auditor'
      LookupDataSet = ADOData0005
      LookupKeyFields = 'RKEY'
      LookupResultField = 'employee_name'
      KeyFields = 'AUDITED_BY'
      Lookup = True
    end
    object ADOData0457cTYpe: TStringField
      FieldKind = fkCalculated
      FieldName = 'cTYpe'
      Calculated = True
    end
    object ADOData0457RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOData0457GON_NUMBER: TStringField
      FieldName = 'GON_NUMBER'
      FixedChar = True
      Size = 10
    end
    object ADOData0457TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object ADOData0457CREATE_DATE: TDateTimeField
      FieldName = 'CREATE_DATE'
    end
    object ADOData0457CREATE_BY: TIntegerField
      FieldName = 'CREATE_BY'
    end
    object ADOData0457STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object ADOData0457AUDITED_BY: TIntegerField
      FieldName = 'AUDITED_BY'
    end
    object ADOData0457AUDITED_DATE: TDateTimeField
      FieldName = 'AUDITED_DATE'
    end
    object ADOData0457REF_NUMBER: TStringField
      FieldName = 'REF_NUMBER'
      FixedChar = True
      Size = 15
    end
    object ADOData0457employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object ADOData0457RECD_BY: TIntegerField
      FieldName = 'RECD_BY'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOData0457
    Left = 80
    Top = 200
  end
  object ADOData0005: TADOQuery
    Connection = MainForm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    OnCalcFields = ADOData0457CalcFields
    Parameters = <>
    SQL.Strings = (
      'select rkey,employee_name from data0005')
    Left = 112
    Top = 168
    object AutoIncField1: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object StringField3: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 208
    Top = 160
    object N1: TMenuItem
      Caption = #26816#35270'/'#21015#21360#20986#20179#21333
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
  object tmpADO2: TADOQuery
    Connection = MainForm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'vptr'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select employee_name from data0005 where rkey=:vptr')
    Left = 176
    Top = 208
  end
end
