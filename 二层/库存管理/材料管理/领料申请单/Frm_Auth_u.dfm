object Frm_Auth: TFrm_Auth
  Left = 218
  Top = 191
  BorderStyle = bsDialog
  Caption = #23457#25209#27969#31243#26723
  ClientHeight = 404
  ClientWidth = 533
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
    Top = 177
    Width = 533
    Height = 184
    Align = alTop
    TabOrder = 1
    object Label11: TLabel
      Left = 8
      Top = 11
      Width = 52
      Height = 13
      Caption = #23457#25209#20154#21592
    end
    object DBGridEh2: TDBGridEh
      Left = 1
      Top = 32
      Width = 531
      Height = 151
      Align = alBottom
      DataSource = DS22
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = ANSI_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'USER_LOGIN_NAME'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'USER_FULL_NAME'
          Footers = <>
          Title.Alignment = taCenter
          Width = 141
        end
        item
          EditButtons = <>
          FieldName = 'LOWER_LIMIT'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'UPPER_LIMIT'
          Footers = <>
          Title.Alignment = taCenter
          Width = 86
        end>
    end
  end
  object BitBtn1: TBitBtn
    Left = 136
    Top = 368
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 2
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 288
    Top = 371
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 3
    Kind = bkCancel
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 533
    Height = 35
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 29
      Top = 9
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #30003#35831#20195#30721
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clDefault
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 86
      Top = 5
      Width = 121
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = Edit1Change
    end
  end
  object Grd1: TDBGridEh
    Left = 0
    Top = 35
    Width = 533
    Height = 142
    Align = alTop
    DataSource = DS11
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    TabOrder = 4
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = Grd1DblClick
    OnKeyDown = Grd1KeyDown
    OnTitleClick = Grd1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'CODE'
        Footers = <>
        Title.Alignment = taCenter
        Width = 62
      end
      item
        EditButtons = <>
        FieldName = 'PURCHASE_APPROV_DESC'
        Footers = <>
        Title.Alignment = taCenter
        Width = 131
      end
      item
        EditButtons = <>
        FieldName = 'DEPT_CODE'
        Footers = <>
        Title.Alignment = taCenter
      end
      item
        EditButtons = <>
        FieldName = 'DEPT_NAME'
        Footers = <>
        Title.Alignment = taCenter
        Width = 121
      end
      item
        EditButtons = <>
        FieldName = 'type_c'
        Footers = <>
        Title.Alignment = taCenter
        Width = 77
      end>
  end
  object DS11: TDataSource
    DataSet = ADO94
    Left = 256
    Top = 72
  end
  object DS22: TDataSource
    DataSet = ADO275
    Left = 256
    Top = 241
  end
  object ADO94: TADOQuery
    Connection = DM.ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterOpen = ADO94AfterScroll
    AfterScroll = ADO94AfterScroll
    Parameters = <
      item
        Name = 'DEPT_CODE'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.Data0094.*, dbo.Data0034.DEPT_CODE, dbo.Data0034.' +
        'DEPT_NAME,'
      'case when Data0094.type=0 then '#39#35831#36141#23457#25209#39
      '      when Data0094.type=1 then '#39#22806#21457#23457#25209#39' '
      '      when Data0094.type=2 then '#39#39046#26009#23457#25209#39' end type_c'
      'FROM         dbo.Data0094 INNER JOIN'
      
        '                      dbo.Data0034 ON dbo.Data0094.dept_ptr = db' +
        'o.Data0034.RKEY'
      'where  dbo.Data0034.DEPT_CODE=:DEPT_CODE and'
      ' dbo.Data0094.type=2 and '
      '(data0034.ACTIVE_FLAG=0) ')
    Left = 352
    Top = 72
    object ADO94CODE: TStringField
      DisplayLabel = #23457#25209#20195#30721
      FieldName = 'CODE'
      Size = 15
    end
    object ADO94PURCHASE_APPROV_DESC: TStringField
      DisplayLabel = #35828#26126
      FieldName = 'PURCHASE_APPROV_DESC'
      Size = 40
    end
    object ADO94DEPT_CODE: TStringField
      DisplayLabel = #37096#38376#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADO94DEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADO94type_c: TStringField
      DisplayLabel = #23457#25209#31867#21035
      FieldName = 'type_c'
      ReadOnly = True
      Size = 8
    end
    object ADO94dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object ADO94type: TWordField
      FieldName = 'type'
    end
    object ADO94mode: TWordField
      FieldName = 'mode'
    end
    object ADO94RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
  end
  object ADO275: TADOQuery
    Connection = DM.ADOCon
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey94'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.Data0275.*, dbo.Data0073.USER_FULL_NAME, dbo.Data' +
        '0073.USER_LOGIN_NAME'
      'FROM         dbo.Data0275 INNER JOIN'
      
        '                      dbo.Data0073 ON dbo.Data0275.USER_PTR = db' +
        'o.Data0073.RKEY'
      'where dbo.DATA0275.auth_group_ptr=:rkey94')
    Left = 352
    Top = 240
    object ADO275USER_LOGIN_NAME: TStringField
      DisplayLabel = #20154#21592#20195#30721
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
    object ADO275USER_FULL_NAME: TStringField
      DisplayLabel = #20154#21592#21517#31216
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object ADO275LOWER_LIMIT: TFloatField
      DisplayLabel = #37329#39069#19979#38480
      FieldName = 'LOWER_LIMIT'
    end
    object ADO275UPPER_LIMIT: TFloatField
      DisplayLabel = #37329#39069#19978#38480
      FieldName = 'UPPER_LIMIT'
    end
    object ADO275RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO275AUTH_GROUP_PTR: TIntegerField
      FieldName = 'AUTH_GROUP_PTR'
    end
    object ADO275USER_PTR: TIntegerField
      FieldName = 'USER_PTR'
    end
  end
end
