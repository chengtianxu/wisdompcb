object Frm_employee: TFrm_employee
  Left = 445
  Top = 190
  Width = 497
  Height = 543
  Caption = #35774#22791#32500#20462#20154#21592#21517#21333
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
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 489
    Height = 465
    Hint = 'ctrl+del'#21024#38500#35760#24405#13'Insert'#25554#20837#35760#24405
    Align = alTop
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
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
        FieldName = 'empl_code'
        Footers = <>
        ReadOnly = True
        Title.Caption = #24037#21495
        Width = 59
      end
      item
        EditButtons = <>
        FieldName = 'employee_name'
        Footers = <>
        ReadOnly = True
        Title.Caption = #22995#21517
        Width = 78
      end
      item
        EditButtons = <>
        FieldName = 'phone'
        Footers = <>
        Title.Caption = #32852#31995#30005#35805
      end
      item
        EditButtons = <>
        FieldName = 'job'
        Footers = <>
        Title.Caption = #32844#21153
        Width = 67
      end
      item
        EditButtons = <>
        FieldName = 'territory'
        Footers = <>
        Title.Caption = #36127#36131#21306#22495
        Width = 154
      end>
  end
  object BitBtn2: TBitBtn
    Left = 192
    Top = 474
    Width = 80
    Height = 27
    Caption = #20851#38381
    Default = True
    ModalResult = 1
    TabOrder = 1
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
  object ADO32: TADODataSet
    Connection = DM.ADOCon
    CursorType = ctStatic
    CommandText = 
      'select D32.userName,D05.empl_code,D05.employee_name,D32.phone,D3' +
      '2.job,D32.territory '#13#10'from Data0032 D32 INNER JOIN'#13#10'     Data000' +
      '5 D05 ON D32.userName=D05.RKEY'
    Parameters = <>
    Left = 24
    Top = 432
    object ADO32empl_code: TStringField
      FieldName = 'empl_code'
      Size = 10
    end
    object ADO32employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object ADO32phone: TWideStringField
      FieldName = 'phone'
      Size = 11
    end
    object ADO32job: TWideStringField
      FieldName = 'job'
    end
    object ADO32territory: TWideStringField
      FieldName = 'territory'
      Size = 50
    end
    object ADO32userName: TIntegerField
      FieldName = 'userName'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADO32
    Left = 80
    Top = 432
  end
end
