object Frm_Supplier: TFrm_Supplier
  Left = 428
  Top = 184
  Width = 505
  Height = 620
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #20379#24212#21830#26597#25214
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 497
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 160
      Top = 14
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Label1'
    end
    object Edit1: TEdit
      Left = 208
      Top = 10
      Width = 153
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 552
    Width = 497
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 160
      Top = 8
      Width = 75
      Height = 25
      Caption = #30830' '#23450
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 256
      Top = 8
      Width = 75
      Height = 25
      Caption = #21462' '#28040
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 497
    Height = 511
    Align = alClient
    DataSource = DS23
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
        FieldName = 'code'
        Footers = <>
        Title.Caption = #20379#24212#21830#20195#30721
        Title.SortIndex = 1
        Title.SortMarker = smUpEh
        Width = 106
      end
      item
        EditButtons = <>
        FieldName = 'supplier_name'
        Footers = <>
        Title.Caption = #20379#24212#21830#21517#31216
        Width = 349
      end>
  end
  object ADO23: TADODataSet
    Connection = DM.ADOConn
    CursorType = ctStatic
    CommandText = 'select rkey,code,supplier_name from data0023 order by code'
    Parameters = <>
    Left = 24
    Top = 504
    object ADO23rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO23code: TStringField
      FieldName = 'code'
      Size = 10
    end
    object ADO23supplier_name: TStringField
      FieldName = 'supplier_name'
      Size = 100
    end
  end
  object DS23: TDataSource
    DataSet = ADO23
    Left = 64
    Top = 504
  end
end
