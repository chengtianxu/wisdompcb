object FrmWorPace: TFrmWorPace
  Left = 763
  Top = 229
  Width = 663
  Height = 364
  BorderIcons = [biMinimize, biMaximize]
  Caption = #39033#30446#36827#24230#26597#35810#34920
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 180
    Top = 20
    Width = 26
    Height = 13
    Caption = #37096#38376
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 390
    Top = 20
    Width = 52
    Height = 13
    Caption = #24037#26102#26102#38388
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 536
    Top = 19
    Width = 13
    Height = 13
    Caption = #33267
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object BitBtn1: TBitBtn
    Left = 2
    Top = 7
    Width = 80
    Height = 28
    Caption = #20851#38381
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = BitBtn1Click
    Glyph.Data = {
      EE000000424DEE000000000000007600000028000000100000000F0000000100
      0400000000007800000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFF0FFFFFF
      FFFFFFFF00FFFFFFFFFFFFF030FFFFFFFFFFFF0330FFFFFFFFFF003330000000
      0FFFF03330FF0FFFFFFFF03300FF0FFFF4FFF03330FF0FFF44FFF03330FF0FF4
      4444F03330FF0F444444F03330FF0FF44444F0330FFF0FFF44FFF030FFFF0FFF
      F4FFF00FFFFF0FFFFFFFF00000000FFFFFFF}
  end
  object edt_1: TEdit
    Left = 235
    Top = 15
    Width = 110
    Height = 21
    TabOrder = 1
    OnChange = edt_1Change
  end
  object DateTimePicker1: TDateTimePicker
    Left = 446
    Top = 15
    Width = 89
    Height = 21
    Date = 42121.624051828700000000
    Time = 42121.624051828700000000
    TabOrder = 2
    OnChange = DateTimePicker1Change
  end
  object DateTimePicker2: TDateTimePicker
    Left = 552
    Top = 15
    Width = 89
    Height = 21
    Date = 42121.626781851850000000
    Time = 42121.626781851850000000
    TabOrder = 3
    OnChange = DateTimePicker1Change
  end
  object DBGridEh1: TDBGridEh
    Left = 4
    Top = 40
    Width = 637
    Height = 249
    DataSource = damo.ds4
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = #29983#20135#21333#21495
        Footers = <>
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = #20135#21697#32534#30721
        Footers = <>
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = #20135#21697#21517#31216
        Footers = <>
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = #24635#24037#26102
        Footers = <>
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = #24405#20837#24037#26102
        Footers = <>
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = #36827#24230
        Footers = <>
        Width = 100
      end>
  end
end
