object frmApprv: TfrmApprv
  Left = 389
  Top = 253
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #23457#25209#20449#24687
  ClientHeight = 256
  ClientWidth = 478
  Color = clBtnFace
  DefaultMonitor = dmDesktop
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
    Top = 31
    Width = 478
    Height = 225
    Align = alBottom
    DataSource = DM.ds265
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
        FieldName = 'user_login_name'
        Footers = <>
        Title.Caption = #21592#24037#20195#30721
      end
      item
        EditButtons = <>
        FieldName = 'user_full_name'
        Footers = <>
        Title.Caption = #21592#24037#22995#21517
      end
      item
        EditButtons = <>
        FieldName = 'ranking'
        Footers = <>
        Title.Caption = #23457#25209#39034#24207
      end
      item
        EditButtons = <>
        FieldName = 'status85'
        Footers = <>
        Title.Caption = #23457#25209#29366#24577
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = 'auth_date'
        Footers = <>
        Title.Caption = #23457#25209#26102#38388
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'auth_flag'
        Footers = <>
        Title.Caption = #24403#21069#23457#25209
        Width = 64
      end>
  end
  object BitBtn1: TBitBtn
    Left = 0
    Top = 3
    Width = 75
    Height = 26
    Caption = #20851#38381
    TabOrder = 1
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
end
