object FrmCustPart: TFrmCustPart
  Left = 221
  Top = 186
  Width = 777
  Height = 477
  Caption = #36716#20135#31649#29702
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    761
    439)
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 0
    Width = 761
    Height = 96
    Cursor = crArrow
    Align = alTop
  end
  object SpeedButton1: TSpeedButton
    Left = 7
    Top = 8
    Width = 29
    Height = 30
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
  object Label5: TLabel
    Left = 72
    Top = 66
    Width = 67
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '  '#23458#25143#20195#21495':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 238
    Top = 66
    Width = 11
    Height = 13
    AutoSize = False
    Visible = False
  end
  object db_ptr: TLabel
    Left = 232
    Top = 12
    Width = 17
    Height = 13
    AutoSize = False
    Caption = '0'
    Visible = False
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 96
    Width = 761
    Height = 324
    Align = alClient
    DataSource = DataSource1
    FixedColor = clSilver
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyPress = DBGrid1KeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'cust_code'
        Title.Caption = #23458#25143
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_NUMBER'
        Title.Caption = #26412#21378#32534#21495
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Title.Caption = #23458#25143#22411#21495
        Width = 172
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENT_DATE'
        Title.Caption = #24314#26723#26085#26399
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CSTATUS'
        Title.Caption = #29366#24577
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROD_CONF_DATE'
        Title.Caption = #30830#35748#26085#26399
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'employee'
        Title.Caption = #30830#35748#20154
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SO_AMT_LTD'
        Title.Caption = #25509#21333#38480#39069
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFERENCE'
        Title.Caption = #22791#27880#20449#24687'('#26679#21697')'
        Width = 99
        Visible = True
      end>
  end
  object BitBtn2: TBitBtn
    Left = 211
    Top = 62
    Width = 21
    Height = 21
    Hint = #26597#25214#23458#25143#32534#21495
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = BitBtn2Click
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000120B0000120B00001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
      DADA000000000000ADAD0FFFFFFFFFF0DADA0F00F00000F0ADAD0FFFFFFFFFF0
      DADA0F00F00000F0ADAD0FFFFFFFFFF0DADA0FFFFFFF0FF0ADAD0FF0FFF080F0
      DAD40F080F0808000D440FF08080808880440000080808888844DADAD0808888
      8844ADADAD0888888044DADADAD000000A44ADADADADADADADAD}
  end
  object Edit1: TEdit
    Left = 144
    Top = 61
    Width = 64
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
    OnExit = Edit1Exit
  end
  object Bar1: TStatusBar
    Left = 0
    Top = 420
    Width = 761
    Height = 19
    Panels = <>
    SimpleText = 'Searching:'
  end
  object GroupBox1: TGroupBox
    Left = 477
    Top = 4
    Width = 288
    Height = 43
    Anchors = [akTop, akRight]
    Caption = #26597#35810#26399#38388'('#24314#26723#26085#26399')'
    TabOrder = 4
    object Label6: TLabel
      Left = 15
      Top = 20
      Width = 36
      Height = 13
      AutoSize = False
      Caption = 'From'#65306
    end
    object Label7: TLabel
      Left = 164
      Top = 20
      Width = 25
      Height = 13
      AutoSize = False
      Caption = 'To'#65306
    end
    object DateTimePicker1: TDateTimePicker
      Left = 56
      Top = 16
      Width = 91
      Height = 21
      Date = 37814.438236770800000000
      Time = 37814.438236770800000000
      TabOrder = 0
      OnCloseUp = DateTimePicker1CloseUp
      OnExit = DateTimePicker1Exit
    end
    object DateTimePicker2: TDateTimePicker
      Left = 192
      Top = 16
      Width = 84
      Height = 21
      Date = 37814.438236770800000000
      Time = 37814.438236770800000000
      TabOrder = 1
      OnCloseUp = DateTimePicker2CloseUp
      OnExit = DateTimePicker2Exit
    end
  end
  object GroupBox2: TGroupBox
    Left = 260
    Top = 49
    Width = 465
    Height = 43
    Caption = #26597#25214
    TabOrder = 5
    object Label2: TLabel
      Left = 9
      Top = 20
      Width = 60
      Height = 13
      Caption = #26412#21378#32534#21495#65306
    end
    object Label4: TLabel
      Left = 171
      Top = 20
      Width = 60
      Height = 13
      Caption = #23458#25143#22411#21495#65306
    end
    object Edit3: TEdit
      Left = 73
      Top = 15
      Width = 89
      Height = 21
      TabOrder = 0
      OnChange = Edit2Change
    end
    object Edit2: TEdit
      Left = 235
      Top = 15
      Width = 142
      Height = 21
      TabOrder = 1
      OnChange = Edit2Change
    end
    object CheckBox1: TCheckBox
      Left = 384
      Top = 17
      Width = 75
      Height = 18
      Caption = #27169#31946#26597#35810
      Checked = True
      State = cbChecked
      TabOrder = 2
      OnClick = Edit2Change
    end
  end
  object RadioGroup1: TRadioGroup
    Left = 103
    Top = 4
    Width = 328
    Height = 43
    Caption = #30830#35748#29366#24577
    Columns = 4
    ItemIndex = 0
    Items.Strings = (
      #26410#30830#35748
      #20551#30830#35748
      #30495#30830#35748
      #20840#37096)
    TabOrder = 6
    OnClick = RadioGroup1Click
  end
  object BitBtn1: TBitBtn
    Left = 40
    Top = 7
    Width = 57
    Height = 30
    Hint = #23548#20986#25968#25454#21040'Excel'
    Caption = #23548#20986
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = BitBtn1Click
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000120B0000120B00001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DADADADADADA
      DADAADADADADADADADADDADADADADAD00000000000000006666007777777706E
      EF0AA0E6666606EEF0ADDA0E66606EEF060AADA0E606EEF0000DDADA006EEF0A
      DADAADAD06EEF00DADADDAD06EEF0670DADAAD06EEF0E6670DADD06EEF0A0E66
      70DA0FFFF0ADA0EEEE0D00000ADADA00000AADADADADADADADAD}
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 192
    Top = 119
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select RKEY,employee_name from data0005')
    Left = 288
    Top = 122
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 120
    Top = 112
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select rkey,cust_code,customer_name from data0010')
    Left = 224
    Top = 120
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <
      item
        Name = 'vdate1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'vdate2'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'vptr'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 0
      end>
    SQL.Strings = (
      'select data0010.cust_code,data0025.MANU_PART_NUMBER,'
      'data0025.MANU_PART_DESC,data0119.*'
      'from data0010,data0119,data0025'
      'where data0119.cust_part_ptr=data0025.rkey'
      'and data0025.customer_ptr=data0010.rkey'
      'and (data0119.ent_date>=:vdate1 and data0119.ent_date<=:vdate2) '
      'and data0119.PROD_CONF=:vptr'
      'order by data0025.MANU_PART_NUMBER')
    Left = 160
    Top = 117
  end
  object DateADO: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'select vdt=current_timestamp')
    Left = 256
    Top = 121
  end
  object PopupMenu1: TPopupMenu
    Left = 240
    Top = 192
    object N1: TMenuItem
      Caption = #30830#35748'/'#21462#28040#30830#35748
      OnClick = N1Click
    end
  end
end
