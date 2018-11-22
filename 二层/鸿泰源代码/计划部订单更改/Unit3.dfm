object Form3: TForm3
  Left = 469
  Top = 171
  Width = 497
  Height = 480
  Caption = #20462#25913#35745#21010#20132#26399
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 48
    Top = 21
    Width = 60
    Height = 16
    Caption = #38144#21806#35746#21333#65306
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 48
    Top = 63
    Width = 60
    Height = 16
    Caption = #26412#21378#32534#21495#65306
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbl3: TLabel
    Left = 48
    Top = 107
    Width = 60
    Height = 16
    Caption = #35746#21333#25968#37327#65306
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbl4: TLabel
    Left = 48
    Top = 155
    Width = 60
    Height = 16
    Caption = #24066#22330#20132#26399#65306
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object dbedtSALES_ORDER: TDBEdit
    Left = 136
    Top = 19
    Width = 193
    Height = 24
    DataField = 'SALES_ORDER'
    DataSource = DM.ds1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object dbedtPARTS_ORDERED: TDBEdit
    Left = 138
    Top = 61
    Width = 193
    Height = 24
    DataField = 'PARTS_ORDERED'
    DataSource = DM.ds1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object dbedtPARTS_ORDERED1: TDBEdit
    Left = 138
    Top = 109
    Width = 193
    Height = 24
    DataField = 'PARTS_ORDERED'
    DataSource = DM.ds1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object dbedtSCH_DATE: TDBEdit
    Left = 138
    Top = 149
    Width = 193
    Height = 24
    DataField = 'SCH_DATE'
    DataSource = DM.ds1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object dbgrdh1: TDBGridEh
    Left = 48
    Top = 184
    Width = 369
    Height = 201
    DataSource = DM.ds2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    ParentFont = False
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'sch_date'
        Footers = <>
        Title.Caption = #23436#24037#26085#26399
        Width = 141
      end
      item
        EditButtons = <>
        FieldName = 'quantity'
        Footers = <>
        Title.Caption = #23436#24037#25968#37327
        Width = 144
      end>
  end
  object btn1: TBitBtn
    Left = 152
    Top = 408
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 5
    OnClick = btn1Click
  end
  object btn2: TBitBtn
    Left = 256
    Top = 408
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 6
    OnClick = btn2Click
  end
end
