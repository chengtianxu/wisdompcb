object Form1: TForm1
  Left = 361
  Top = 223
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26448#26009#37319#36141#23457#25209#25480#26435#20154#21592
  ClientHeight = 417
  ClientWidth = 742
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 376
    Width = 742
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 14
      Width = 52
      Height = 13
      Caption = #23457#25209#31867#22411
    end
    object Edit1: TEdit
      Left = 66
      Top = 10
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'Edit1'
      OnChange = Edit1Change
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 376
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel2'
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 0
      Top = 0
      Width = 742
      Height = 376
      Align = alClient
      DataSource = dsMain
      FooterColor = clWindow
      FooterFont.Charset = GB2312_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      PopupMenu = PopupMenu1
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnTitleClick = DBGridEh1TitleClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'PURCHASE_TYPE'
          Footers = <>
          Width = 110
        end
        item
          EditButtons = <>
          FieldName = 'warehouse_code'
          Footers = <>
          Width = 65
        end
        item
          EditButtons = <>
          FieldName = 'ABBR_NAME'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'user_id'
          Footers = <>
          Width = 74
        end
        item
          EditButtons = <>
          FieldName = 'USER_FULL_NAME'
          Footers = <>
          Width = 108
        end
        item
          EditButtons = <>
          FieldName = 'seq_no'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'lower_limit'
          Footers = <>
          Width = 83
        end
        item
          EditButtons = <>
          FieldName = 'upper_limit'
          Footers = <>
          Width = 79
        end
        item
          EditButtons = <>
          FieldName = 'user_ptr'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'warehouse_ptr'
          Footers = <>
          Visible = False
        end>
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 400
    Top = 224
    object N_New: TMenuItem
      Caption = #26032#22686
      OnClick = N_NewClick
    end
    object N_Edit: TMenuItem
      Caption = #32534#36753
      OnClick = N_EditClick
    end
    object N_Delete: TMenuItem
      Caption = #21024#38500
      OnClick = N_DeleteClick
    end
  end
  object MainMenu1: TMainMenu
    Left = 328
    Top = 224
    object N4: TMenuItem
      Caption = #31995#32479
      object N5: TMenuItem
        Caption = #36864#20986
        OnClick = N5Click
      end
    end
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 56
  end
  object AQdistinctPURCHASE_TYPE: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select distinct(PURCHASE_TYPE) from dbo.data0077')
    Left = 520
    Top = 232
  end
  object dtMain: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'SELECT dbo.Data0073.USER_LOGIN_NAME AS user_id, '#13#10'dbo.Data0073.U' +
      'SER_FULL_NAME, dbo.data0077.user_ptr, dbo.data0077.upper_limit, ' +
      #13#10'dbo.data0077.lower_limit, dbo.data0077.seq_no, dbo.Data0015.AB' +
      'BR_NAME,'#13#10'data0077.warehouse_ptr,data0015.warehouse_code,data007' +
      '7.PURCHASE_TYPE,data0077.rkey'#13#10'FROM         dbo.data0077 INNER J' +
      'OIN'#13#10'  dbo.Data0073 ON dbo.data0077.user_ptr = dbo.Data0073.RKEY' +
      ' INNER JOIN'#13#10'  dbo.Data0015 ON dbo.data0077.warehouse_ptr = dbo.' +
      'Data0015.RKEY'#13#10'ORDER BY Data0015.ABBR_NAME,data0077.seq_no'
    Parameters = <>
    Left = 48
    Top = 129
    object dtMainuser_id: TStringField
      FieldName = 'user_id'
      ProviderFlags = []
      Size = 15
    end
    object dtMainUSER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      ProviderFlags = []
      Size = 30
    end
    object dtMainuser_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object dtMainupper_limit: TBCDField
      FieldName = 'upper_limit'
      Precision = 19
    end
    object dtMainlower_limit: TBCDField
      FieldName = 'lower_limit'
      Precision = 19
    end
    object dtMainseq_no: TIntegerField
      FieldName = 'seq_no'
    end
    object dtMainABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      ProviderFlags = []
      Size = 10
    end
    object dtMainwarehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object dtMainwarehouse_code: TStringField
      FieldName = 'warehouse_code'
      ProviderFlags = []
      Size = 5
    end
    object dtMainPURCHASE_TYPE: TWideStringField
      FieldName = 'PURCHASE_TYPE'
      Size = 50
    end
  end
  object cdsMain: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT dbo.Data0073.USER_LOGIN_NAME AS user_id, '#13#10'dbo.Data0073.U' +
      'SER_FULL_NAME, dbo.data0077.user_ptr, dbo.data0077.upper_limit, ' +
      #13#10'dbo.data0077.lower_limit, dbo.data0077.seq_no, dbo.Data0015.AB' +
      'BR_NAME,'#13#10'data0077.warehouse_ptr,data0015.warehouse_code,data007' +
      '7.PURCHASE_TYPE,data0077.rkey'#13#10'FROM         dbo.data0077 INNER J' +
      'OIN'#13#10'  dbo.Data0073 ON dbo.data0077.user_ptr = dbo.Data0073.RKEY' +
      ' INNER JOIN'#13#10'  dbo.Data0015 ON dbo.data0077.warehouse_ptr = dbo.' +
      'Data0015.RKEY'#13#10'ORDER BY Data0015.ABBR_NAME,data0077.seq_no'
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ProviderName = 'DataSetProvider1'
    AfterInsert = cdsMainAfterInsert
    OnFilterRecord = cdsMainFilterRecord
    OnReconcileError = cdsMainReconcileError
    AfterApplyUpdates = cdsMainAfterApplyUpdates
    Left = 200
    Top = 129
    object cdsMainPURCHASE_TYPE: TWideStringField
      DisplayLabel = #23457#25209#31867#22411
      FieldName = 'PURCHASE_TYPE'
      Size = 50
    end
    object cdsMainwarehouse_code: TStringField
      DisplayLabel = #24037#21378#20195#30721#13#10
      FieldName = 'warehouse_code'
      ProviderFlags = []
      OnChange = cdsMainwarehouse_codeChange
      Size = 5
    end
    object cdsMainABBR_NAME: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'ABBR_NAME'
      ProviderFlags = []
      Size = 10
    end
    object cdsMainuser_id: TStringField
      DisplayLabel = #29992#25143#20195#30721
      FieldName = 'user_id'
      ProviderFlags = []
      OnChange = cdsMainuser_idChange
      Size = 15
    end
    object cdsMainUSER_FULL_NAME: TStringField
      DisplayLabel = #29992#25143#21517
      FieldName = 'USER_FULL_NAME'
      ProviderFlags = []
      Size = 30
    end
    object cdsMainseq_no: TIntegerField
      DisplayLabel = #39034#24207
      FieldName = 'seq_no'
    end
    object cdsMainlower_limit: TBCDField
      DisplayLabel = #39069#24230#19979#38480
      FieldName = 'lower_limit'
      Precision = 19
    end
    object cdsMainupper_limit: TBCDField
      DisplayLabel = #39069#24230#19978#38480
      FieldName = 'upper_limit'
      Precision = 19
    end
    object cdsMainwarehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
      Visible = False
    end
    object cdsMainuser_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = dtMain
    Options = [poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 128
    Top = 129
  end
  object dsMain: TDataSource
    DataSet = cdsMain
    OnStateChange = dsMainStateChange
    Left = 328
    Top = 113
  end
  object AQTemp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 56
    Top = 305
  end
  object AQ0015: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT warehouse_code,ABBR_NAME,RKEY FROM Data0015')
    Left = 56
    Top = 185
    object AQ0015warehouse_code: TStringField
      DisplayLabel = #24037#21378#20195#30721
      FieldName = 'warehouse_code'
      Size = 5
    end
    object AQ0015ABBR_NAME: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object AQ0015RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
  end
  object AQ073: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT USER_LOGIN_NAME,USER_FULL_NAME,RKEY'
      ' FROM Data0073 where ACTIVE_FLAG=0 and USER_GROUP_FLAG =1')
    Left = 56
    Top = 249
    object AQ073USER_LOGIN_NAME: TStringField
      DisplayLabel = #29992#25143#20195#30721
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
    object AQ073USER_FULL_NAME: TStringField
      DisplayLabel = #29992#25143#21517
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object AQ073RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
  end
  object dsp0015: TDataSetProvider
    DataSet = AQ0015
    Options = [poAllowCommandText]
    Left = 128
    Top = 185
  end
  object cds0015: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT warehouse_code,ABBR_NAME,RKEY FROM Data0015'#13#10
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ProviderName = 'dsp0015'
    ReadOnly = True
    Left = 192
    Top = 185
    object cds0015warehouse_code: TStringField
      DisplayLabel = #24037#21378#20195#30721
      FieldName = 'warehouse_code'
      Size = 5
    end
    object cds0015ABBR_NAME: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object cds0015RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
  end
  object dsp0073: TDataSetProvider
    DataSet = AQ073
    Options = [poAllowCommandText]
    Left = 128
    Top = 257
  end
  object cds0073: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT USER_LOGIN_NAME,USER_FULL_NAME,RKEY'#13#10' FROM Data0073 where' +
      ' ACTIVE_FLAG=0 and USER_GROUP_FLAG =1'#13#10
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ProviderName = 'dsp0073'
    ReadOnly = True
    Left = 200
    Top = 257
    object cds0073USER_LOGIN_NAME: TStringField
      DisplayLabel = #29992#25143#20195#30721
      DisplayWidth = 10
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
    object cds0073USER_FULL_NAME: TStringField
      DisplayLabel = #29992#25143#21517
      DisplayWidth = 15
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object cds0073RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
  end
end
