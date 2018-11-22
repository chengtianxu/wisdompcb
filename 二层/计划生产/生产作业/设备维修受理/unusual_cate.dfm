object Frm_unusual_cate: TFrm_unusual_cate
  Left = 496
  Top = 176
  Width = 397
  Height = 553
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #35774#22791#32500#20462#24322#24120#31867#21035
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 485
    Width = 389
    Height = 41
    Align = alBottom
    TabOrder = 0
    object BitBtn2: TBitBtn
      Left = 152
      Top = 8
      Width = 80
      Height = 27
      Caption = #20851#38381
      Default = True
      ModalResult = 1
      TabOrder = 0
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
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 389
    Height = 485
    Hint = 'ctrl+del'#21024#38500#35760#24405#13'Insert'#25554#20837#35760#24405
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGridEh1KeyDown
    Columns = <
      item
        EditButtons = <>
        FieldName = 'rkey'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'unusual_cate'
        Footers = <>
        Title.Caption = #35774#22791#32500#20462#24322#24120#31867#21035
        Width = 278
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADO43
    Left = 72
    Top = 456
  end
  object ADO43: TADOTable
    Connection = DM.ADOConnection
    CursorType = ctStatic
    TableName = 'DATA0043'
    Left = 16
    Top = 456
    object ADO43rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
    object ADO43unusual_cate: TWideStringField
      FieldName = 'unusual_cate'
      Size = 50
    end
  end
end
