object form_dept: Tform_dept
  Left = 340
  Top = 166
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26597#25214#37096#38376
  ClientHeight = 436
  ClientWidth = 404
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 0
    Width = 404
    Height = 33
    Cursor = crArrow
    Align = alTop
  end
  object Label1: TLabel
    Left = 75
    Top = 11
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #37096#38376#20195#30721':'
  end
  object Edit1: TEdit
    Left = 135
    Top = 7
    Width = 130
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
    OnKeyPress = DBGrid1KeyPress
  end
  object BitBtn1: TBitBtn
    Left = 270
    Top = 7
    Width = 25
    Height = 23
    TabOrder = 1
    OnClick = BitBtn1Click
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000120B0000120B00001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
      DADABFBFBDADADADADADDADADBFADADADADAADADAD000DADADADDADAD0FBF0DA
      DADAADAD0F7FBF0DADADDAD0F7F87BF0DADAAD0F7F87BFB70DADD0F7F87BFB78
      80DA000F87BFB78880ADDAD00BFB78880ADAADADA0B7888740ADDADADA088804
      440AADADADA000A04440DADADADADADA0440ADADADADADADA00D}
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 33
    Width = 404
    Height = 368
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    OnKeyPress = DBGrid1KeyPress
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'dept_code'
        Title.Caption = #37096#38376#20195#30721
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dept_name'
        Title.Caption = #37096#38376#21517#31216
        Width = 199
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ctype'
        Title.Caption = #24615#36136
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 401
    Width = 404
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object Button1: TButton
      Left = 125
      Top = 7
      Width = 75
      Height = 25
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 205
      Top = 7
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    OnDataChange = DataSource1DataChange
    Left = 304
    Top = 400
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'SELECT rkey, dept_code, dept_name,'
      '      CASE ttype WHEN 4 THEN '#39#34892#25919#37096#38376#39
      '       WHEN 5 THEN '#39#29983#20135#29677#32452#39' ELSE '#39#29983#20135#24037#24207#39' END AS'
      '       ctype'
      'FROM data0034'
      'WHERE (ACTIVE_FLAG=0) and'
      '     (IS_cost_dept = 1 OR'
      '      ttype = 4 OR'
      '      ttype = 5)'
      'ORDER BY ttype, dept_code')
    Left = 336
    Top = 400
    object ADOQuery1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery1dept_code: TStringField
      FieldName = 'dept_code'
      Size = 10
    end
    object ADOQuery1dept_name: TStringField
      FieldName = 'dept_name'
      Size = 30
    end
    object ADOQuery1ctype: TStringField
      FieldName = 'ctype'
      ReadOnly = True
      Size = 8
    end
  end
end
