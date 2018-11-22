object Frm_Category: TFrm_Category
  Left = 496
  Top = 176
  Width = 397
  Height = 553
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #20135#21697#31867#21035
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
    Top = 478
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
    Height = 478
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
        FieldName = 'category'
        Footers = <>
        Width = 92
      end
      item
        EditButtons = <>
        FieldName = 'category_name'
        Footers = <>
        Width = 263
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADO619
    Left = 72
    Top = 456
  end
  object ADO619: TADOTable
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    TableName = 'DATA0619'
    Left = 16
    Top = 456
    object ADO619category: TStringField
      DisplayLabel = #20135#21697#31867#21035#20195#30721
      FieldName = 'category'
      Size = 2
    end
    object ADO619category_name: TWideStringField
      DisplayLabel = #20135#21697#31867#21035#21517#31216
      FieldName = 'category_name'
      Size = 50
    end
  end
end
