object Form_Single: TForm_Single
  Left = 480
  Top = 136
  Width = 428
  Height = 551
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #36873#25321#35831#20551#21592#24037
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
    DataSource = DM.DataSource2
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
        FieldName = 'employeecode'
        Footers = <>
        Title.Caption = #21592#24037#20195#30721
      end
      item
        EditButtons = <>
        FieldName = 'chinesename'
        Footers = <>
        Title.Caption = #21592#24037#22995#21517
      end>
  end
end
