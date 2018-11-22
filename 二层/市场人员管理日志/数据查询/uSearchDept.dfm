object frmSearchDept: TfrmSearchDept
  Left = 327
  Top = 151
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #25628#32034#37096#38376
  ClientHeight = 462
  ClientWidth = 455
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 0
    Width = 455
    Height = 35
    Cursor = crVSplit
    Align = alTop
  end
  object Label1: TLabel
    Left = 81
    Top = 12
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #37096#38376#20195#30721':'
  end
  object Edit1: TEdit
    Left = 143
    Top = 8
    Width = 162
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
  end
  object BitBtn1: TBitBtn
    Left = 310
    Top = 7
    Width = 25
    Height = 25
    Hint = #21047#26032
    ParentShowHint = False
    ShowHint = True
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
  object Button2: TButton
    Left = 219
    Top = 424
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
  end
  object Button1: TButton
    Left = 139
    Top = 424
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 3
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 40
    Width = 455
    Height = 369
    DataSource = DataSource1
    Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = ANSI_CHARSET
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
        Width = 152
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dept_name'
        Width = 282
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = AQuery34
    OnDataChange = DataSource1DataChange
    Left = 219
    Top = 208
  end
  object AQuery34: TADOQuery
    Connection = DM.Conn
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select rkey,dept_code,dept_name'
      'from data0034'
      'where ttype=4')
    Left = 256
    Top = 208
    object AQuery34rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object AQuery34dept_code: TStringField
      DisplayLabel = #37096#38376#20195#30721
      FieldName = 'dept_code'
      Size = 10
    end
    object AQuery34dept_name: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'dept_name'
      Size = 30
    end
  end
end
