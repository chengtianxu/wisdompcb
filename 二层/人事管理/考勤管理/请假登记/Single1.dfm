object Form_Single1: TForm_Single1
  Left = 480
  Top = 137
  Width = 428
  Height = 551
  Caption = #36873#25321#35831#20551#30331#35760#20154#21592
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 420
    Height = 41
    Align = alTop
    TabOrder = 0
    DesignSize = (
      420
      41)
    object Label1: TLabel
      Left = 112
      Top = 13
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Anchors = [akRight]
      Caption = 'Label1'
    end
    object Edit1: TEdit
      Left = 160
      Top = 10
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 483
    Width = 420
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 128
      Top = 8
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
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 420
    Height = 442
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGridEh1DblClick
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'user_login_name'
        Footers = <>
        Title.Caption = #21592#24037#20195#30721
        Title.SortIndex = 1
        Title.SortMarker = smUpEh
        Width = 81
      end
      item
        EditButtons = <>
        FieldName = 'user_full_name'
        Footers = <>
        Title.Caption = #21592#24037#22995#21517
        Width = 134
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADO0073
    Left = 152
    Top = 432
  end
  object ADO0073: TADODataSet
    Connection = DM.ADOConn
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select employee_ptr,user_login_name,user_full_name from data0073' +
      ' where user_login_name like '#39'%'#39'+:user_login_name+'#39'%'#39
    Parameters = <
      item
        Name = 'user_login_name+'#39'%'#39
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 15
        Value = Null
      end>
    Left = 96
    Top = 432
    object ADO0073employee_ptr: TIntegerField
      FieldName = 'employee_ptr'
    end
    object ADO0073user_login_name: TStringField
      FieldName = 'user_login_name'
      Size = 15
    end
    object ADO0073user_full_name: TStringField
      FieldName = 'user_full_name'
      Size = 30
    end
  end
end
