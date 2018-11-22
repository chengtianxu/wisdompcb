object frmShowStock: TfrmShowStock
  Left = 218
  Top = 190
  BorderStyle = bsSingle
  Caption = #24211#23384#26126#32454#26597#30475
  ClientHeight = 481
  ClientWidth = 973
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 973
    Height = 425
    Align = alTop
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'MANU_PART_NUMBER'
        Footers = <>
        Title.Caption = #26412#21378#32534#21495
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_DESC'
        Footers = <>
        Title.Caption = #23458#25143#22411#21495
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'PRODUCT_NAME'
        Footers = <>
        Title.Caption = #20135#21697#31867#21035#21517#31216
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'ABBR_NAME'
        Footers = <>
        Title.Caption = #23458#25143#31616#31216
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'SALES_ORDER'
        Footers = <>
        Title.Caption = #38144#21806#35746#21333#21495
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'LOCATION'
        Footers = <>
        Title.Caption = #20179#24211
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'QTY_ON_HAND'
        Footers = <>
        Title.Caption = #24211#23384#25968#37327
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'so_mianji'
        Footers = <>
        Title.Caption = #24211#23384#38754#31215
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'MFG_DATE'
        Footers = <>
        Title.Caption = #20837#20179#26102#38388
        Width = 110
      end
      item
        EditButtons = <>
        FieldName = 'SCH_DATE'
        Footers = <>
        Title.Caption = #22238#22797#20132#26399
        Width = 110
      end>
  end
  object Button1: TButton
    Left = 424
    Top = 440
    Width = 78
    Height = 29
    Caption = #20851' '#38381
    TabOrder = 1
    OnClick = Button1Click
  end
  object DataSource1: TDataSource
    DataSet = dm.Ado60_53
    Left = 408
    Top = 200
  end
end
