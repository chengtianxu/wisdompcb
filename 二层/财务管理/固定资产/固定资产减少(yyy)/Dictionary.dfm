object FrmDictionary: TFrmDictionary
  Left = 366
  Top = 262
  Width = 528
  Height = 383
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #20973#35777#25688#35201
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 198
    Top = 16
    Width = 115
    Height = 13
    AutoSize = False
    Caption = #20973#35777#25688#35201
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 16
    Width = 179
    Height = 313
    Caption = #25688#35201#31867#21035
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 6
      Top = 18
      Width = 166
      Height = 287
      DataSource = DataSource1
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'DICT_GRP'
          Title.Alignment = taCenter
          Title.Caption = #25688#35201#31867#21035
          Visible = True
        end>
    end
  end
  object BitBtn7: TBitBtn
    Left = 430
    Top = 32
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object DBGrid2: TDBGrid
    Left = 191
    Top = 34
    Width = 224
    Height = 295
    DataSource = DataSource2
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid2DblClick
    OnKeyPress = DBGrid2KeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'DESCRIPTION'
        Title.Alignment = taCenter
        Title.Caption = #25688#35201
        Width = 206
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 430
    Top = 64
    Width = 75
    Height = 25
    TabOrder = 3
    Kind = bkCancel
  end
  object DataSource1: TDataSource
    DataSet = ADOData0512
    Left = 112
  end
  object DataSource2: TDataSource
    DataSet = ADOData0513
    Left = 144
  end
  object ADOData0513: TADOQuery
    Connection = DM.ADOCon
    CursorType = ctStatic
    Filtered = True
    DataSource = DataSource1
    Parameters = <>
    SQL.Strings = (
      'select * from data0513'
      '')
    Left = 80
    Top = 65535
  end
  object ADOData0512: TADOQuery
    Connection = DM.ADOCon
    CursorType = ctStatic
    Filtered = True
    AfterScroll = ADOData0512AfterScroll
    Parameters = <>
    SQL.Strings = (
      'select * from data0512'
      'order by rkey')
    Left = 48
    Top = 65535
  end
end
