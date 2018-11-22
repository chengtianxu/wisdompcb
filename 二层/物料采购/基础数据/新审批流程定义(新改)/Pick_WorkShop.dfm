object frmPick_WorkShop: TfrmPick_WorkShop
  Left = 451
  Top = 185
  BorderStyle = bsDialog
  Caption = #36873#25321#29992#25143
  ClientHeight = 471
  ClientWidth = 448
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 448
    Height = 49
    Align = alTop
    TabOrder = 0
    object labelKey: TLabel
      Left = 88
      Top = 19
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = #25628#32034#65306
    end
    object CheckBox1: TCheckBox
      Left = 336
      Top = 17
      Width = 97
      Height = 17
      Caption = #20840#36873
      TabOrder = 1
      OnClick = CheckBox1Click
    end
    object edtKey: TEdit
      Left = 123
      Top = 15
      Width = 142
      Height = 21
      TabOrder = 0
      OnChange = edtKeyChange
      OnKeyPress = edtKeyKeyPress
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 49
    Width = 448
    Height = 381
    Align = alClient
    DataSource = DataSource1
    Flat = True
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
    TitleHeight = 20
    OnDblClick = DBGridEh1DblClick
    OnKeyDown = DBGridEh1KeyDown
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        Checkboxes = True
        EditButtons = <>
        FieldName = 'IsSelected'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #36873#20013
        Width = 68
      end
      item
        EditButtons = <>
        FieldName = 'USER_LOGIN_NAME'
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #29992#25143#20195#30721
        Width = 97
      end
      item
        EditButtons = <>
        FieldName = 'USER_FULL_NAME'
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #29992#25143#22995#21517
        Width = 201
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 430
    Width = 448
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object OKBtn: TButton
      Left = 119
      Top = 8
      Width = 75
      Height = 25
      Caption = #30830#23450'(Y)'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object CancelBtn: TButton
      Left = 247
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = #21462#28040'(&C)'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object ads73: TADODataSet
    AutoCalcFields = False
    Connection = DM.ADOCon
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'declare @IsSelected bit '#13#10'select @IsSelected as IsSelected,'#13#10' rK' +
      'ey, USER_LOGIN_NAME ,USER_FULL_NAME'#13#10'from Data0073'#13#10'where (ACTIV' +
      'E_FLAG=0) and (USER_GROUP_FLAG=1)'#13#10
    Parameters = <>
    Left = 288
    Top = 240
    object ads73IsSelected: TBooleanField
      FieldName = 'IsSelected'
    end
    object ads73rKey: TIntegerField
      FieldName = 'rKey'
      ReadOnly = True
    end
    object ads73USER_LOGIN_NAME: TStringField
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
    object ads73USER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
  end
  object DataSource1: TDataSource
    DataSet = ads73clientds
    Left = 176
    Top = 240
  end
  object ads73clientds: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'ads73provide'
    OnFilterRecord = ads73clientdsFilterRecord
    Left = 216
    Top = 240
    object ads73clientdsIsSelected: TBooleanField
      FieldName = 'IsSelected'
    end
    object ads73clientdsrKey: TIntegerField
      FieldName = 'rKey'
      ReadOnly = True
    end
    object ads73clientdsUSER_LOGIN_NAME: TStringField
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
    object ads73clientdsUSER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
  end
  object ads73provide: TDataSetProvider
    DataSet = ads73
    Left = 248
    Top = 240
  end
end
