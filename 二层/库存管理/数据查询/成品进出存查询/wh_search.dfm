object Form_Wh: TForm_Wh
  Left = 432
  Top = 84
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #25104#21697#20179#24211#25628#32034
  ClientHeight = 507
  ClientWidth = 411
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 411
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
      TabOrder = 0
      OnClick = CheckBox1Click
    end
    object edtKey: TEdit
      Left = 123
      Top = 15
      Width = 142
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 1
      OnChange = edtKeyChange
      OnKeyPress = edtKeyKeyPress
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 466
    Width = 411
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
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
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 49
    Width = 411
    Height = 417
    Align = alClient
    DataSource = dsPickWorkShop
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection]
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    TitleHeight = 20
    OnCellClick = DBGridEh1CellClick
    OnDblClick = DBGridEh1DblClick
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'IsSelected'
        Footers = <>
        Title.Caption = #36873#20013
      end
      item
        EditButtons = <>
        FieldName = 'Code'
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #20179#24211#20195#30721
        Width = 97
      end
      item
        EditButtons = <>
        FieldName = 'Location'
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #20179#24211#21517#31216
        Width = 201
      end>
  end
  object dspPickWorkShop: TDataSetProvider
    DataSet = adsPickWorkShop
    Left = 176
    Top = 320
  end
  object adsPickWorkShop: TADODataSet
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    AfterOpen = adsPickWorkShopAfterOpen
    CommandText = 
      'declare @IsSelected bit '#13#10'select @IsSelected as IsSelected, rKey' +
      ',upper(Code) as Code,'#13#10'upper(Location)+'#39' '#39' as Location from Data' +
      '0016 where location_type=1'#13#10
    Parameters = <>
    Left = 128
    Top = 320
    object adsPickWorkShopIsSelected: TBooleanField
      FieldName = 'IsSelected'
    end
    object adsPickWorkShoprKey: TIntegerField
      FieldName = 'rKey'
      ReadOnly = True
    end
    object adsPickWorkShopCode: TStringField
      FieldName = 'Code'
      ReadOnly = True
    end
    object adsPickWorkShopLocation: TStringField
      FieldName = 'Location'
      ReadOnly = True
      Size = 41
    end
  end
  object cdsPickWorkShop: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 232
    Top = 320
  end
  object dsPickWorkShop: TDataSource
    DataSet = cdsPickWorkShop
    Left = 273
    Top = 320
  end
end
