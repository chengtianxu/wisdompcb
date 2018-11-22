object frmDeptList: TfrmDeptList
  Left = 462
  Top = 204
  Width = 523
  Height = 512
  Caption = #24037#24207#37096#38376
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 507
    Height = 41
    Align = alTop
    TabOrder = 0
    object lbl1: TLabel
      Left = 24
      Top = 13
      Width = 60
      Height = 13
      Caption = #24037#24207#20195#30721#65306
    end
    object edt1: TEdit
      Left = 116
      Top = 10
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object rg1: TRadioGroup
      Left = 307
      Top = -2
      Width = 185
      Height = 41
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #30456#20851#24037#24207
        #20854#20182#24037#24207)
      TabOrder = 1
      OnClick = rg1Click
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 433
    Width = 507
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnOK: TButton
      Left = 216
      Top = 8
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = btnOKClick
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 41
    Width = 507
    Height = 392
    Align = alClient
    TabOrder = 2
    object eh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 505
      Height = 390
      Align = alClient
      DataSource = ds1
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = eh1DblClick
      Columns = <
        item
          EditButtons = <>
          Footers = <>
          Title.Caption = #24037#24207#20195#30721
          Width = 80
        end
        item
          EditButtons = <>
          Footers = <>
          Title.Caption = #24037#24207#21517#31216
          Width = 120
        end
        item
          EditButtons = <>
          Footers = <>
          Title.Caption = #27493#39588#21495
        end>
    end
  end
  object qry1: TADOQuery
    Parameters = <>
    Left = 32
    Top = 65
  end
  object ds1: TDataSource
    DataSet = qry1
    Left = 80
    Top = 65
  end
end
