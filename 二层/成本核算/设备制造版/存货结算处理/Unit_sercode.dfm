object Form_Sercode: TForm_Sercode
  Left = 341
  Top = 120
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24037#24207#26597#35810
  ClientHeight = 436
  ClientWidth = 410
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 410
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 61
      Top = 15
      Width = 59
      Height = 13
      Caption = #36164#28304#32534#21495':'
    end
    object Edit1: TEdit
      Left = 122
      Top = 11
      Width = 121
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
      TabOrder = 0
      OnChange = Edit1Change
      OnKeyDown = DBGrid1KeyDown
    end
    object BitBtn1: TBitBtn
      Left = 255
      Top = 10
      Width = 26
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
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 410
    Height = 354
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'dept_code'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Color = clRed
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowFrame
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dept_name'
        Width = 173
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ctype'
        Width = 106
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 395
    Width = 410
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Button1: TButton
      Left = 120
      Top = 8
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 224
      Top = 8
      Width = 75
      Height = 26
      Caption = #21462#28040
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 280
    Top = 272
  end
  object ADOQuery1: TADOQuery
    Connection = DM.Conn
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'SELECT rkey, dept_code, dept_name,'
      '      CASE ttype WHEN 4 THEN '#39#34892#25919#37096#38376#39
      '       WHEN 5 THEN '#39#29983#20135#37096#32452#39' ELSE '#39#29983#20135#24037#24207#39' END AS'
      '       ctype'
      'FROM data0034'
      'WHERE IS_cost_dept = 1 OR'
      '      ttype = 4 OR'
      '      ttype = 5'
      'ORDER BY ttype, dept_code'
      '')
    Left = 308
    Top = 272
    object ADOQuery1dept_code: TStringField
      DisplayLabel = #36164#28304#32534#21495
      FieldName = 'dept_code'
      Size = 10
    end
    object ADOQuery1dept_name: TStringField
      DisplayLabel = #36164#28304#21517#31216
      FieldName = 'dept_name'
      Size = 30
    end
    object ADOQuery1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery1ctype: TStringField
      DisplayLabel = #24615#36136
      FieldName = 'ctype'
      ReadOnly = True
      Size = 8
    end
  end
end
