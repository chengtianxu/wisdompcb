object FrmMain: TFrmMain
  Left = 249
  Top = 170
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #36130#21153#25253#34920#23450#20041
  ClientHeight = 416
  ClientWidth = 551
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 16
    Width = 59
    Height = 13
    Caption = #25253#34920#21517#31216':'
  end
  object user_ptr: TLabel
    Left = 296
    Top = 12
    Width = 17
    Height = 13
    AutoSize = False
    Caption = '0'
    Visible = False
  end
  object Label2: TLabel
    Left = 179
    Top = 11
    Width = 65
    Height = 13
    Caption = #20250#35745#24180#24230#65306
  end
  object StringGrid1: TStringGrid
    Left = 24
    Top = 40
    Width = 369
    Height = 345
    ColCount = 2
    DefaultRowHeight = 19
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 0
    OnDblClick = StringGrid1DblClick
    ColWidths = (
      293
      50)
  end
  object BitBtn1: TBitBtn
    Left = 440
    Top = 64
    Width = 75
    Height = 25
    Caption = #22686#21152
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 440
    Top = 104
    Width = 75
    Height = 25
    Caption = #25171#24320
    TabOrder = 2
    OnClick = StringGrid1DblClick
  end
  object BitBtn3: TBitBtn
    Left = 440
    Top = 144
    Width = 75
    Height = 25
    Caption = #21024#38500
    TabOrder = 3
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 440
    Top = 184
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 4
    OnClick = BitBtn4Click
  end
  object SpinEdit1: TSpinEdit
    Left = 240
    Top = 8
    Width = 65
    Height = 22
    MaxValue = 2100
    MinValue = 1900
    TabOrder = 5
    Value = 1900
    OnChange = SpinEdit1Change
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=wisdompcb1077;Persist Security Info' +
      '=True;User ID=sa;Initial Catalog=wisdompcb_bak;Data Source=172.1' +
      '6.8.8'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 56
    Top = 103
  end
  object ADOData0524: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'year'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 2008
      end>
    SQL.Strings = (
      'SELECT * FROM DATA0524'
      'where fyear=:year'
      'order by REPORT_FILE')
    Left = 88
    Top = 104
    object ADOData0524RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOData0524REPORT_FILE: TStringField
      FieldName = 'REPORT_FILE'
      Size = 50
    end
    object ADOData0524fyear: TIntegerField
      FieldName = 'fyear'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOData0524
    Left = 120
    Top = 104
  end
end
