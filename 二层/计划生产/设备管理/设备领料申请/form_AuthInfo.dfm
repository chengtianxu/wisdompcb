inherited frm_AuthInfo: Tfrm_AuthInfo
  Left = 300
  Top = 215
  Width = 444
  Height = 296
  Caption = #23457#26680#20449#24687
  PixelsPerInch = 96
  TextHeight = 12
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 436
    Height = 208
    Align = alTop
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = GB2312_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -12
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'USER_ID'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #23457#26680#21592#20195#30721
        Width = 73
      end
      item
        EditButtons = <>
        FieldName = 'USER_FULL_NAME'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #23457#26680#21592#21517#31216
        Width = 71
      end
      item
        EditButtons = <>
        FieldName = 'auth_flag'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #23457#26680#26631#24535
        Width = 56
      end
      item
        EditButtons = <>
        FieldName = 'auth_date'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #23457#26680#26085#26399
        Width = 109
      end
      item
        EditButtons = <>
        FieldName = 'ranking'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #23457#26680#39034#24207
        Width = 59
      end>
  end
  object Button1: TButton
    Left = 162
    Top = 213
    Width = 69
    Height = 23
    Caption = #20851#38381
    TabOrder = 1
    OnClick = Button1Click
  end
  object DataSource1: TDataSource
    DataSet = cdsRead
    Left = 359
    Top = 104
  end
  object dtRead: TADODataSet
    Connection = DM_frm.ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select dbo.data0831.rkey,PlanMainDate,DeviNumb,dbo.DATA0417.FASS' +
      'ET_NAME,MainCycl'#13#10'from dbo.data0831'#13#10'join dbo.DATA0417 on dbo.da' +
      'ta0831.DeviNumb=dbo.DATA0417.FASSET_CODE'#13#10'where RKEY832<>2'
    Parameters = <>
    Left = 173
    Top = 108
  end
  object dspRead: TDataSetProvider
    DataSet = dtRead
    Options = [poAllowCommandText]
    Left = 227
    Top = 108
  end
  object cdsRead: TClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspRead'
    ReadOnly = True
    Left = 274
    Top = 108
  end
end
