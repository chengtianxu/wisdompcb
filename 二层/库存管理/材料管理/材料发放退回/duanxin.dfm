object Form_duanxin: TForm_duanxin
  Left = 442
  Top = 279
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #23433#20840#24211#23384#30701#20449#36890#30693#20154#21592#23450#20041
  ClientHeight = 399
  ClientWidth = 337
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn2: TBitBtn
    Left = 136
    Top = 360
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
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 337
    Height = 345
    Hint = 'ctrl+del'#21024#38500#35760#24405#13'Insert'#25554#20837#35760#24405
    Align = alTop
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnEditButtonClick = DBGridEh1EditButtonClick
    OnKeyDown = DBGridEh1KeyDown
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        EditButtons = <>
        FieldName = 'GROUP_NAME'
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #26448#26009#32452#21035#20195#30721
        Width = 100
      end
      item
        ButtonStyle = cbsEllipsis
        EditButtons = <>
        FieldName = 'USER_LOGIN_NAME'
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'USER_FULL_NAME'
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Width = 80
      end>
  end
  object ads21: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    CommandText = 
      'select data0021.USER_LOGIN_NAME,data0073.USER_FULL_NAME,data0021' +
      '.GROUP_NAME,data0019.inv_group_desc'#13#10'from data0021 '#13#10'inner join ' +
      'data0073 on data0021.USER_LOGIN_NAME=data0073.USER_LOGIN_NAME'#13#10'i' +
      'nner join data0019 on data0021.GROUP_NAME=data0019.inv_group_nam' +
      'e'#13#10'order by data0021.GROUP_NAME'
    Parameters = <>
    Left = 16
    Top = 352
    object ads21GROUP_NAME: TStringField
      FieldName = 'GROUP_NAME'
    end
    object ads21USER_LOGIN_NAME: TStringField
      DisplayLabel = #29992#25143#20195#30721
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
    object ads21USER_FULL_NAME: TStringField
      DisplayLabel = #29992#25143#21517#31216
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
  end
  object DataSource1: TDataSource
    DataSet = ads21
    Left = 48
    Top = 352
  end
end
