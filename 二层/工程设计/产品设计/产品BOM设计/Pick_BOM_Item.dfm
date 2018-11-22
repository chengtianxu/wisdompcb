object frmPickBomItem1: TfrmPickBomItem1
  Left = 283
  Top = 231
  Width = 784
  Height = 545
  Caption = 'BOM'#26448#26009
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 273
    Height = 507
    Align = alLeft
    TabOrder = 0
    object tv1: TTreeView
      Left = 1
      Top = 1
      Width = 271
      Height = 505
      Align = alClient
      Indent = 19
      ReadOnly = True
      TabOrder = 0
      OnChange = tv1Change
      Items.Data = {
        01000000210000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
        08CBF9D3D0B2C4C1CF}
    end
  end
  object pnl2: TPanel
    Left = 273
    Top = 0
    Width = 495
    Height = 507
    Align = alClient
    TabOrder = 1
    object pnl3: TPanel
      Left = 1
      Top = 1
      Width = 493
      Height = 48
      Align = alTop
      TabOrder = 0
      object lbl1: TLabel
        Left = 112
        Top = 10
        Width = 48
        Height = 13
        Alignment = taRightJustify
        Caption = #26448#26009#20195#21495
      end
      object edt1: TEdit
        Left = 176
        Top = 6
        Width = 109
        Height = 21
        TabOrder = 0
        OnChange = edt1Change
      end
    end
    object dbgrdh1: TDBGridEh
      Left = 1
      Top = 49
      Width = 493
      Height = 416
      Align = alClient
      DataSource = ds1
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
      OnDblClick = dbgrdh1DblClick
      OnTitleClick = dbgrdh1TitleClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'inv_part_number'
          Footers = <>
          Title.Caption = #26448#26009#20195#21495
          Width = 150
        end
        item
          EditButtons = <>
          FieldName = 'inv_part_description'
          Footers = <>
          Title.Caption = #26448#26009#25551#36848
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'unit_code'
          Footers = <>
          Title.Caption = #21333#20301
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'quan_on_hand'
          Footers = <>
          Title.Caption = #24211#23384
        end>
    end
    object pnl4: TPanel
      Left = 1
      Top = 465
      Width = 493
      Height = 41
      Align = alBottom
      TabOrder = 2
      object btn1: TButton
        Left = 192
        Top = 8
        Width = 75
        Height = 25
        Caption = 'OK'
        TabOrder = 0
        OnClick = btn1Click
      end
    end
  end
  object qry1: TADOQuery
    Connection = dmcon.ADOConnection1
    Filtered = True
    Parameters = <>
    Left = 322
    Top = 9
  end
  object ds1: TDataSource
    DataSet = qry1
    Left = 370
    Top = 9
  end
end
