object Form4: TForm4
  Left = 207
  Top = 103
  Width = 501
  Height = 480
  Caption = #35745#31639#20844#26597#25214
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBCtrlGrid1: TDBCtrlGrid
    Left = 0
    Top = 0
    Width = 493
    Height = 385
    Align = alTop
    ColCount = 1
    DataSource = DataSource1
    PanelHeight = 128
    PanelWidth = 477
    TabOrder = 0
    RowCount = 3
    OnDblClick = DBCtrlGrid1DblClick
    OnKeyDown = DBCtrlGrid1KeyDown
    object DBMemo1: TDBMemo
      Left = 35
      Top = 16
      Width = 417
      Height = 89
      DataField = 'calculate_method'
      DataSource = DataSource1
      TabOrder = 0
    end
  end
  object Button1: TButton
    Left = 160
    Top = 416
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 248
    Top = 416
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 32
    Top = 400
  end
  object ADOQuery1: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT calculate_method'
      'FROM dbo.WZDATA303'
      'where calculate_method is not null'
      'GROUP BY calculate_method')
    Left = 64
    Top = 400
    object ADOQuery1calculate_method: TStringField
      FieldName = 'calculate_method'
      Size = 200
    end
  end
end
