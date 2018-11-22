object FrmMain: TFrmMain
  Left = 399
  Top = 270
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26434#39033#29289#21697#31867#21035
  ClientHeight = 357
  ClientWidth = 370
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 16
    Width = 249
    Height = 313
    Caption = #25688#35201#31867#21035
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 6
      Top = 18
      Width = 235
      Height = 287
      DataSource = DataSource1
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
          FieldName = 'Description'
          Title.Alignment = taCenter
          Title.Caption = #21517#31216
          Width = 211
          Visible = True
        end>
    end
  end
  object BitBtn7: TBitBtn
    Left = 278
    Top = 48
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 1
    Kind = bkClose
  end
  object BitBtn1: TBitBtn
    Left = 278
    Top = 112
    Width = 75
    Height = 25
    Caption = #22686#21152
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 278
    Top = 144
    Width = 75
    Height = 25
    Caption = #20462#25913
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 278
    Top = 176
    Width = 75
    Height = 25
    Caption = #21024#38500
    TabOrder = 4
    OnClick = BitBtn3Click
  end
  object ADOData0075: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'select * from data0075'
      'order by rkey')
    Left = 48
    Top = 65535
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 16
    Top = 65535
  end
  object DataSource1: TDataSource
    DataSet = ADOData0075
    Left = 112
  end
end
