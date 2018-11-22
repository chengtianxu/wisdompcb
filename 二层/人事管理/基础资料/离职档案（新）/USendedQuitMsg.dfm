object FrmSendedQuitMsg: TFrmSendedQuitMsg
  Left = 433
  Top = 122
  Width = 689
  Height = 555
  Caption = #24050#21457#36865#30340#33258#31163#30701#20449
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 681
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
    end
    object Edit1: TEdit
      Left = 176
      Top = 11
      Width = 121
      Height = 21
      TabOrder = 1
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 681
    Height = 487
    Align = alClient
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
