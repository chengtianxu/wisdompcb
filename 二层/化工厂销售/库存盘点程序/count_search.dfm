object Form_loc_search: TForm_loc_search
  Left = 376
  Top = 254
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20179#24211#25628#32034
  ClientHeight = 389
  ClientWidth = 392
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
    Width = 392
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 48
      Top = 16
      Width = 59
      Height = 13
      Caption = #20179#24211#32534#21495':'
    end
    object Edit1: TEdit
      Left = 119
      Top = 10
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
    object BitBtn1: TBitBtn
      Left = 272
      Top = 8
      Width = 33
      Height = 25
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
    Width = 392
    Height = 307
    Align = alClient
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyPress = DBGrid1KeyPress
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CODE'
        Title.Color = clRed
        Width = 159
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCATION'
        Width = 203
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 348
    Width = 392
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Button1: TButton
      Left = 104
      Top = 9
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 216
      Top = 8
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object DataSource1: TDataSource
    DataSet = adoquery1
    Left = 312
    Top = 352
  end
  object adoquery1: TADOQuery
    Connection = dm.ADOConnection1
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * '
      'from data0016'
      'where LOCATION_TYPE=1'
      'order by code')
    Left = 344
    Top = 352
    object adoquery1RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object adoquery1CODE: TStringField
      DisplayLabel = #20179#24211#32534#21495
      FieldName = 'CODE'
      FixedChar = True
      Size = 10
    end
    object adoquery1LOCATION: TStringField
      DisplayLabel = #20179#24211#21517#31216
      FieldName = 'LOCATION'
    end
    object adoquery1LOCATION_TYPE: TWordField
      FieldName = 'LOCATION_TYPE'
    end
    object adoquery1whouse_ptr: TIntegerField
      FieldName = 'whouse_ptr'
    end
  end
end
