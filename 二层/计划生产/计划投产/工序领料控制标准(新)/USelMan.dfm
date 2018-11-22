object FrmSelMan: TFrmSelMan
  Left = 636
  Top = 236
  Width = 395
  Height = 480
  Caption = #36873#25321#30701#20449#36890#30693#20154#21592
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 49
    Width = 387
    Height = 340
    Align = alClient
    TabOrder = 0
    object dbgrdh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 385
      Height = 338
      Align = alClient
      DataSource = ds1
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnTitleClick = dbgrdh1TitleClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'IsSelected'
          Footers = <>
          Title.Caption = #36873#25321
        end
        item
          EditButtons = <>
          FieldName = 'user_login_name'
          Footers = <>
          Title.Caption = #24037#21495
          Width = 69
        end
        item
          EditButtons = <>
          FieldName = 'user_full_name'
          Footers = <>
          Title.Caption = #22995#21517
          Width = 90
        end
        item
          EditButtons = <>
          FieldName = #30005#35805
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = #26159#21542#26377#25928
          Footers = <>
          Width = 56
        end>
    end
  end
  object pnlf: TPanel
    Left = 0
    Top = 0
    Width = 387
    Height = 49
    Align = alTop
    TabOrder = 1
    object lbl_field: TLabel
      Left = 27
      Top = 15
      Width = 65
      Height = 13
      Caption = #21592#24037#24037#21495#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object edt_value: TEdit
      Left = 88
      Top = 12
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = edt_valueChange
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 389
    Width = 387
    Height = 60
    Align = alBottom
    TabOrder = 2
    object btnCancel: TButton
      Left = 256
      Top = 14
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 0
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 120
      Top = 14
      Width = 75
      Height = 25
      Caption = #30830#23450
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ModalResult = 1
      ParentFont = False
      TabOrder = 1
      OnClick = btnOKClick
    end
    object btn_SelAll: TButton
      Left = 17
      Top = 14
      Width = 49
      Height = 25
      Caption = #20840#36873
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
  object ds1: TDataSource
    DataSet = DM.qry_SelMan
    Left = 304
    Top = 136
  end
end
