object Form7: TForm7
  Left = 368
  Top = 171
  Width = 654
  Height = 429
  Caption = #36864#22238#20449#24687
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrdh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 638
    Height = 329
    Align = alTop
    DataSource = DM.ds1
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
    UseMultiTitle = True
    Columns = <
      item
        EditButtons = <>
        FieldName = 'TDATEtime'
        Footers = <>
        Title.Caption = #26085#26399
        Width = 93
      end
      item
        EditButtons = <>
        FieldName = 'MANU_PART_NUMBER'
        Footers = <>
        Title.Caption = #26412#21378#32534#21495
        Width = 87
      end
      item
        EditButtons = <>
        FieldName = 'ttype'
        Footers = <>
        Title.Caption = #25805#20316#31867#22411
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'EMPLOYEE_NAME'
        Footers = <>
        Title.Caption = #25805#20316#20154
        Width = 67
      end
      item
        EditButtons = <>
        FieldName = 'tc'
        Footers = <>
        Title.Caption = #26159#21542#25237#20135#26242#32531
        Width = 42
      end
      item
        EditButtons = <>
        FieldName = 'gd'
        Footers = <>
        Title.Caption = #26159#21542#24037#21333#26242#32531
        Width = 41
      end
      item
        EditButtons = <>
        FieldName = 'pj'
        Footers = <>
        Title.Caption = #26159#21542#20801#35768#32534#36753
        Width = 41
      end
      item
        EditButtons = <>
        FieldName = 'NOTE_INFO'
        Footers = <>
        Title.Caption = #22791#27880
        Width = 139
      end>
  end
  object btn1: TButton
    Left = 240
    Top = 360
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    OnClick = btn1Click
  end
end
