object FrmSelMateriel: TFrmSelMateriel
  Left = 612
  Top = 84
  Width = 690
  Height = 628
  Caption = #36873#25321#29289#26009
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
    Width = 682
    Height = 488
    Align = alClient
    TabOrder = 0
    object dbgrdh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 680
      Height = 486
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
          FieldName = #26448#26009#32534#21495
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = #29289#26009#35268#26684
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = #26448#26009#21517#31216
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = #24211#23384#21333#20301
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = #37319#36141#21333#20301
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = #26631#20934#21333#20301#38754#31215
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = #26631#20934#21333#20301#37325#37327
          Footers = <>
        end>
    end
  end
  object pnlf: TPanel
    Left = 0
    Top = 0
    Width = 682
    Height = 49
    Align = alTop
    TabOrder = 1
    object lbl_field: TLabel
      Left = 27
      Top = 15
      Width = 52
      Height = 13
      Caption = #26448#26009#32534#21495
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
    Top = 537
    Width = 682
    Height = 60
    Align = alBottom
    TabOrder = 2
    object btnCancel: TButton
      Left = 272
      Top = 14
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 0
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 160
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
    object chk_all: TCheckBox
      Left = 24
      Top = 8
      Width = 97
      Height = 17
      Caption = #20840#36873
      TabOrder = 2
      OnClick = chk_allClick
    end
  end
  object ds1: TDataSource
    DataSet = DM.qry_SelMateriel
    Left = 304
    Top = 136
  end
end
