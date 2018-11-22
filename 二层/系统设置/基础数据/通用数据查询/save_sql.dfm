object Form_savesql: TForm_savesql
  Left = 240
  Top = 191
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #29616#23384#30340'sql'#32508#21512#26597#35810#35821#21477
  ClientHeight = 453
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 257
    Height = 412
    Align = alLeft
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'description'
        Width = 232
        Visible = True
      end>
  end
  object DBMemo1: TDBMemo
    Left = 257
    Top = 0
    Width = 431
    Height = 412
    Align = alClient
    DataField = 'select_sql'
    DataSource = DataSource1
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 412
    Width = 688
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Button1: TButton
      Left = 248
      Top = 8
      Width = 75
      Height = 25
      Caption = #20445#23384
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 331
      Top = 8
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object ADO300: TADOQuery
    Connection = Form1.ADOConnection1
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select description,select_sql'
      'from data0300')
    Left = 56
    Top = 368
    object ADO300description: TStringField
      DisplayLabel = #25968#25454#26597#35810#35821#21477#35828#26126
      FieldName = 'description'
      Size = 50
    end
    object ADO300select_sql: TMemoField
      FieldName = 'select_sql'
      BlobType = ftMemo
    end
  end
  object DataSource1: TDataSource
    DataSet = ADO300
    Left = 24
    Top = 368
  end
end
