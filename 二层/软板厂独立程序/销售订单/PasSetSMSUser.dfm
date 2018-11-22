object frmSetSMSUser: TfrmSetSMSUser
  Left = 417
  Top = 413
  BorderStyle = bsDialog
  Caption = #35780#23457#20154#21592#23450#20041
  ClientHeight = 367
  ClientWidth = 313
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn2: TBitBtn
    Left = 112
    Top = 332
    Width = 73
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
    Width = 313
    Height = 321
    Hint = 'ctrl+del'#21024#38500#35760#24405
    Align = alTop
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnEditButtonClick = DBGridEh1EditButtonClick
    OnKeyDown = DBGridEh1KeyDown
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        EditButtons = <>
        FieldName = 'USER_LOGIN_NAME'
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #29992#25143#20195#30721
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'USER_FULL_NAME'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #29992#25143#21517#31216
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'DEPT_NAME'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #37096#38376
        Width = 80
      end>
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 56
    Top = 328
  end
  object ADODataSet1: TADODataSet
    Connection = dm.ADOConnection1
    CommandText = 
      'select Data0073.USER_LOGIN_NAME,Data0073.USER_FULL_NAME,Data0034' +
      '.DEPT_NAME,Data0073.RKEY '#13#10'from rb001 inner join Data0073 on rb0' +
      '01.Rkey73=Data0073.RKEY left join Data0005 on Data0073.EMPLOYEE_' +
      'PTR=Data0005.RKEY'#13#10'left join Data0034 on Data0005.EMPLOYEE_ID=Da' +
      'ta0034.RKEY where Data0073.USER_GROUP_FLAG=1 and Data0073.ACTIVE' +
      '_FLAG=0 and Data0034.TTYPE=4'
    Parameters = <>
    Left = 16
    Top = 328
    object ADODataSet1USER_LOGIN_NAME: TStringField
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
    object ADODataSet1USER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object ADODataSet1DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADODataSet1RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
  end
end
