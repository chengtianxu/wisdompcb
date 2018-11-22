object frm_infohistory: Tfrm_infohistory
  Left = 176
  Top = 143
  Width = 696
  Height = 480
  Caption = #24050#21457#30701#20449#36890#30693#30340#33258#31163#20154#21592
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 112
      Top = 15
      Width = 57
      Height = 13
      AutoSize = False
    end
    object Label2: TLabel
      Left = 355
      Top = 16
      Width = 69
      Height = 13
      AutoSize = False
    end
    object Button1: TButton
      Left = 3
      Top = 8
      Width = 75
      Height = 27
      Caption = #36864#20986
      TabOrder = 0
      OnClick = Button1Click
    end
    object Edit1: TEdit
      Left = 176
      Top = 11
      Width = 121
      Height = 21
      TabOrder = 1
      OnChange = Edit1Change
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 688
    Height = 412
    Align = alClient
    DataSource = DM.DataSource4
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'orginal_employeecode'
        Footers = <>
        Title.Caption = #24037#21495
      end
      item
        EditButtons = <>
        FieldName = 'chinesename'
        Footers = <>
        Title.Caption = #22995#21517
      end
      item
        EditButtons = <>
        FieldName = 'orginal_ondutytime'
        Footers = <>
        Title.Caption = #20837#32844#26085#26399
      end
      item
        EditButtons = <>
        FieldName = 'alterdate'
        Footers = <>
        Title.Caption = #31163#32844#26085#26399
      end>
  end
end
