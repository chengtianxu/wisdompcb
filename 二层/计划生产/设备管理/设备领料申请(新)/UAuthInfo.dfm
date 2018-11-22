object frmAuthInfo: TfrmAuthInfo
  Left = 361
  Top = 268
  Width = 527
  Height = 409
  Caption = #23457#26680#20449#24687
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object eh275: TDBGridEh
    Left = 0
    Top = 0
    Width = 519
    Height = 378
    Align = alClient
    DataSource = ds1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'USER_ID'
        Footers = <>
        Title.Caption = #23457#26680#21592#20195#30721
        Width = 94
      end
      item
        EditButtons = <>
        FieldName = 'USER_FULL_NAME'
        Footers = <>
        Title.Caption = #23457#26680#21592#21517#31216
        Width = 113
      end
      item
        EditButtons = <>
        FieldName = 'auth_flag'
        Footers = <>
        Title.Caption = #23457#26680#26631#24535
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'auth_date'
        Footers = <>
        Title.Caption = #23457#26680#26085#26399
      end
      item
        EditButtons = <>
        FieldName = 'ranking'
        Footers = <>
        Title.Caption = #39034#24207
      end>
  end
  object ds1: TDataSource
    DataSet = qry1
    Left = 216
    Top = 120
  end
  object qry1: TADOQuery
    Connection = DM.con1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'p1'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT Data0073.user_login_name USER_ID,Data0073.USER_FULL_NAME,' +
        'data0368.user_ptr, '
      
        'data0368.auth_date,data0368.ranking,data0368.auth_flag FROM dbo.' +
        'Data0073 INNER JOIN dbo.data0368  '
      'ON dbo.Data0073.RKEY = dbo.data0368.user_ptr  '
      'WHERE dbo.data0368.apply_ptr=:p1'
      'order by dbo.data0368.ranking')
    Left = 352
    Top = 152
    object strngfldqry1USER_ID: TStringField
      FieldName = 'USER_ID'
      Size = 15
    end
    object strngfldqry1USER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object intgrfldqry1user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object dtmfldqry1auth_date: TDateTimeField
      FieldName = 'auth_date'
    end
    object wrdfldqry1ranking: TWordField
      FieldName = 'ranking'
    end
    object strngfldqry1auth_flag: TStringField
      FieldName = 'auth_flag'
      FixedChar = True
      Size = 1
    end
  end
end
