object FrmWInfo: TFrmWInfo
  Left = 306
  Top = 206
  BorderStyle = bsSingle
  Caption = #22806#26469#20154#21592#20303#23487#20449#24687
  ClientHeight = 400
  ClientWidth = 782
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 782
    Height = 400
    Align = alClient
    DataSource = damo.dsWCinfo
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'employeecode'
        Footers = <>
        Title.Caption = #21592#24037#24037#21495
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = 'chinesename'
        Footers = <>
        Title.Caption = #22995#21517
        Width = 59
      end
      item
        EditButtons = <>
        FieldName = 'sexName'
        Footers = <>
        Title.Caption = #24615#21035
        Width = 41
      end
      item
        EditButtons = <>
        FieldName = 'departmentname'
        Footers = <>
        Title.Caption = #37096#38376
        Width = 84
      end
      item
        EditButtons = <>
        FieldName = 'factoryarea'
        Footers = <>
        Title.Caption = #25152#23646#21333#20301
        Width = 102
      end
      item
        EditButtons = <>
        FieldName = 'regdate'
        Footers = <>
        Title.Caption = #27880#20876#26102#38388
        Width = 84
      end
      item
        EditButtons = <>
        FieldName = 'roomcode'
        Footers = <>
        Title.Caption = #25151#38388#21495#30721
        Width = 67
      end
      item
        EditButtons = <>
        FieldName = 'IDCard'
        Footers = <>
        Title.Caption = #36523#20221#35777#21495
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'province'
        Footers = <>
        Title.Caption = #30465#20221
        Width = 117
      end>
  end
end
