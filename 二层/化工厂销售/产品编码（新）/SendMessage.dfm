object FrmMessage: TFrmMessage
  Left = 423
  Top = 250
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #21457#36865#30701#20449
  ClientHeight = 356
  ClientWidth = 608
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn2: TBitBtn
    Left = 198
    Top = 324
    Width = 80
    Height = 28
    Caption = #30830#23450#21457#36865
    TabOrder = 0
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 340
    Top = 324
    Width = 80
    Height = 28
    Caption = #21462#28040
    TabOrder = 1
    OnClick = BitBtn3Click
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 608
    Height = 206
    Align = alTop
    Caption = #20154#21592#36873#25321
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object StringGrid1: TStringGrid
      Left = 349
      Top = 15
      Width = 257
      Height = 189
      Align = alRight
      ColCount = 3
      DefaultRowHeight = 16
      FixedCols = 0
      RowCount = 2
      TabOrder = 0
      ColWidths = (
        70
        87
        40)
    end
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 15
      Width = 263
      Height = 189
      Align = alLeft
      DataSource = ds1
      FooterColor = clWindow
      FooterFont.Charset = ANSI_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      TabOrder = 1
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'USER_LOGIN_NAME'
          Footers = <>
          Title.Caption = #24037#21495
          Width = 61
        end
        item
          EditButtons = <>
          FieldName = 'USER_FULL_NAME'
          Footers = <>
          Title.Caption = #22995#21517
          Width = 89
        end>
    end
    object Button1: TButton
      Left = 280
      Top = 90
      Width = 55
      Height = 30
      Caption = '>'
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 206
    Width = 608
    Height = 114
    Align = alTop
    Caption = #28040#24687#20869#23481
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object Memo1: TMemo
      Left = 2
      Top = 15
      Width = 604
      Height = 97
      Align = alClient
      TabOrder = 0
    end
  end
  object qry1: TADOQuery
    Connection = DM.ADOCon
    Parameters = <>
    SQL.Strings = (
      
        'select  data0073 .RKEY, data0073 .USER_FULL_NAME, data0073 .USER' +
        '_LOGIN_NAME'
      'from data0073 '
      'inner join data0005 on data0073.EMPLOYEE_PTR=data0005.rkey'
      'where data0073.active_flag=0 '
      'and data0005.employee_id=17 ')
    Left = 115
    Top = 72
    object qry1RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object qry1USER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object qry1USER_LOGIN_NAME: TStringField
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
  end
  object ds1: TDataSource
    DataSet = qry1
    Left = 162
    Top = 72
  end
end
