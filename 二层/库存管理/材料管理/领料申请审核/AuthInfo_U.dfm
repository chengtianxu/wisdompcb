object AuthInfo: TAuthInfo
  Left = 395
  Top = 263
  BorderIcons = [biMinimize]
  BorderStyle = bsSingle
  Caption = #23457#25209#20449#24687
  ClientHeight = 444
  ClientWidth = 437
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 437
    Height = 397
    Align = alClient
    Ctl3D = False
    DataSource = DataSource1
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'USER_FULL_NAME'
        Title.Caption = #21407#23457#25209#20154
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RPL_USER_FULL_NAME'
        Title.Caption = #25480#26435#23457#25209#20154
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'auth_date'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ranking'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'auth_flag'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'remark'
        Width = 149
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'user_ptr'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'draw_materiel_ptr'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'apply_ptr'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 397
    Width = 437
    Height = 47
    Align = alBottom
    BevelOuter = bvNone
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 0
    object Button1: TButton
      Left = 180
      Top = 12
      Width = 75
      Height = 25
      Caption = #20851#38381
      ModalResult = 1
      TabOrder = 0
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    DataSource = DM.DataSource1
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 11
      end>
    SQL.Strings = (
      
        'SELECT     Data0073.USER_FULL_NAME, Data0073_1.USER_FULL_NAME AS' +
        ' RPL_USER_FULL_NAME, DATA0368.auth_date, DATA0368.ranking, DATA0' +
        '368.auth_flag, DATA0368.remark, DATA0368.apply_ptr,DATA0368.user' +
        '_ptr, dbo.Data0073.draw_materiel_ptr'
      'FROM         dbo.DATA0368 INNER JOIN'
      
        '                      dbo.Data0073 ON dbo.DATA0368.user_ptr = db' +
        'o.Data0073.RKEY INNER JOIN'
      
        '                      dbo.Data0073 AS Data0073_1 ON dbo.Data0073' +
        '.draw_materiel_ptr = Data0073_1.RKEY'
      'WHERE     DATA0368.apply_ptr = :rkey'
      'ORDER BY DATA0368.ranking')
    Left = 68
    Top = 316
    object ADOQuery1USER_FULL_NAME: TStringField
      DisplayLabel = #23457#25209#20154
      DisplayWidth = 13
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object ADOQuery1RPL_USER_FULL_NAME: TStringField
      FieldName = 'RPL_USER_FULL_NAME'
      Size = 30
    end
    object ADOQuery1auth_date: TDateTimeField
      DisplayLabel = #23457#25209#26102#38388
      DisplayWidth = 13
      FieldName = 'auth_date'
    end
    object ADOQuery1ranking: TWordField
      DisplayLabel = #23457#25209#39034#24207
      DisplayWidth = 10
      FieldName = 'ranking'
    end
    object ADOQuery1auth_flag: TStringField
      DisplayLabel = #24403#21069#23457#25209
      DisplayWidth = 10
      FieldName = 'auth_flag'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1remark: TStringField
      DisplayLabel = #22791#27880
      DisplayWidth = 31
      FieldName = 'remark'
      Size = 50
    end
    object ADOQuery1user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object ADOQuery1apply_ptr: TIntegerField
      FieldName = 'apply_ptr'
    end
    object ADOQuery1draw_materiel_ptr: TIntegerField
      FieldName = 'draw_materiel_ptr'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 100
    Top = 316
  end
end
