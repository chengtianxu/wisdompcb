inherited PpCutting_1_frm: TPpCutting_1_frm
  Left = 365
  Top = 228
  BorderStyle = bsDialog
  Caption = #20999#21106
  ClientHeight = 537
  ClientWidth = 785
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 785
    Height = 125
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 11
      Top = 8
      Width = 48
      Height = 12
      Caption = #26448#26009#21378#21830
    end
    object Label2: TLabel
      Left = 11
      Top = 48
      Width = 48
      Height = 12
      Caption = #26448#26009#22411#21495
    end
    object Label3: TLabel
      Left = 148
      Top = 8
      Width = 72
      Height = 12
      Caption = 'PP'#20999#21106#24635#24352#25968
    end
    object Label4: TLabel
      Left = 148
      Top = 48
      Width = 120
      Height = 12
      Caption = 'PP'#37197#39069#20999#21106#24635#38271#24230'('#31859')'
    end
    object Label5: TLabel
      Left = 452
      Top = 8
      Width = 60
      Height = 12
      Caption = #20999#21106#20154#20195#30721
    end
    object Label6: TLabel
      Left = 552
      Top = 8
      Width = 48
      Height = 12
      Caption = #20999#21106#20154#21592
    end
    object Label7: TLabel
      Left = 288
      Top = 8
      Width = 120
      Height = 12
      Caption = 'PP'#37197#39069#20999#21106#24635#21367#25968'('#21367')'
    end
    object Label8: TLabel
      Left = 288
      Top = 48
      Width = 24
      Height = 12
      Caption = #22791#27880
    end
    object Label_CODE: TLabel
      Left = 454
      Top = 87
      Width = 48
      Height = 12
      Caption = #25439#22351#20195#30721
      Visible = False
    end
    object Label_REJECT_DESCRIPTION: TLabel
      Left = 555
      Top = 87
      Width = 48
      Height = 12
      Caption = #25439#22351#21407#22240
      Visible = False
    end
    object Label_d5_2_EMPLOYEE_NAME: TLabel
      Left = 556
      Top = 48
      Width = 60
      Height = 12
      Caption = #25439#22351#36131#20219#20154
      Visible = False
    end
    object Label_d5_2_EMPL_CODE: TLabel
      Left = 452
      Top = 48
      Width = 84
      Height = 12
      Caption = #25439#22351#36131#20219#20154#20195#30721
      Visible = False
    end
    object Label_panel_qty_e: TLabel
      Left = 9
      Top = 87
      Width = 84
      Height = 12
      Caption = #25439#32791#20999#21106#24635#24352#25968
      Visible = False
    end
    object Labe_panel_qty_e1: TLabel
      Left = 145
      Top = 87
      Width = 96
      Height = 12
      Caption = #25439#32791#20999#21106#21097#20313#24352#25968
      Visible = False
    end
    object edt_lam2: TDBEdit
      Left = 11
      Top = 24
      Width = 121
      Height = 20
      DataField = 'lam2'
      DataSource = PpCutting_frm.dsMain
      TabOrder = 0
    end
    object edt_lam_ty_gp: TDBEdit
      Left = 11
      Top = 63
      Width = 121
      Height = 20
      DataField = 'lam_ty_gp'
      DataSource = PpCutting_frm.dsMain
      TabOrder = 1
    end
    object edt_EMPLOYEE_NAME: TEdit
      Left = 553
      Top = 24
      Width = 121
      Height = 20
      ReadOnly = True
      TabOrder = 2
    end
    object edt_panel_qty: TEdit
      Left = 148
      Top = 24
      Width = 121
      Height = 20
      TabOrder = 3
      OnKeyPress = edt_panel_qtyKeyPress
    end
    object edt_pp_quota_len: TEdit
      Left = 148
      Top = 63
      Width = 121
      Height = 20
      TabOrder = 4
      OnChange = edt_pp_quota_lenChange
    end
    object edt_pp_quota_roll: TEdit
      Left = 286
      Top = 24
      Width = 150
      Height = 20
      TabOrder = 5
    end
    object Memo_remark: TMemo
      Left = 286
      Top = 64
      Width = 150
      Height = 57
      MaxLength = 100
      TabOrder = 6
    end
    object edt_EMPL_CODE: TButtonEdit
      Left = 453
      Top = 24
      Width = 100
      Height = 20
      FramingPreference = fpCustomFraming
      ReadOnlyColor = clInactiveCaptionText
      TabOrder = 7
      F_DownFormWidth = 0
      F_DownListDataSet = PpCutting_frm.cdsD005
      F_DownDataSetFilterField = 'EMPL_CODE'
      F_ResultFieldName = 'EMPL_CODE'
      F_RkeyFieldName = 'rkey'
      F_Edit1 = edt_EMPLOYEE_NAME
      F_ResultFieldName1 = 'EMPLOYEE_NAME'
    end
    object edt_d5_2_EMPL_CODE: TButtonEdit
      Left = 454
      Top = 63
      Width = 100
      Height = 20
      FramingPreference = fpCustomFraming
      ReadOnlyColor = clInactiveCaptionText
      TabOrder = 8
      Visible = False
      F_DownFormWidth = 0
      F_DownListDataSet = PpCutting_frm.cdsD005
      F_DownDataSetFilterField = 'EMPL_CODE'
      F_ResultFieldName = 'EMPL_CODE'
      F_RkeyFieldName = 'rkey'
      F_Edit1 = edt_d5_2_EMPLOYEE_NAME
      F_ResultFieldName1 = 'EMPLOYEE_NAME'
    end
    object edt_d5_2_EMPLOYEE_NAME: TEdit
      Left = 554
      Top = 63
      Width = 121
      Height = 20
      ReadOnly = True
      TabOrder = 9
      Visible = False
    end
    object edt_CODE: TButtonEdit
      Left = 455
      Top = 101
      Width = 100
      Height = 20
      FramingPreference = fpCustomFraming
      ReadOnlyColor = clInactiveCaptionText
      TabOrder = 10
      Visible = False
      F_DownFormWidth = 0
      F_DownListDataSet = PpCutting_frm.cds076
      F_DownDataSetFilterField = 'CODE'
      F_ResultFieldName = 'CODE'
      F_RkeyFieldName = 'rkey'
      F_Edit1 = edt_REJECT_DESCRIPTION
      F_ResultFieldName1 = 'REJECT_DESCRIPTION'
    end
    object edt_REJECT_DESCRIPTION: TEdit
      Left = 555
      Top = 101
      Width = 121
      Height = 20
      TabOrder = 11
      Visible = False
    end
    object edt_panel_qty_e: TDBEdit
      Left = 10
      Top = 102
      Width = 121
      Height = 20
      DataField = 'panel_qty_e'
      DataSource = PpCutting_frm.dsMain
      TabOrder = 12
      Visible = False
    end
    object edt_panel_qty_e1: TEdit
      Left = 146
      Top = 102
      Width = 121
      Height = 20
      TabOrder = 13
      Text = 'edt_panel_qty_e1'
      Visible = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 125
    Width = 785
    Height = 359
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object DghMain: TDBGridEh
      Left = 0
      Top = 0
      Width = 785
      Height = 359
      Align = alClient
      DataSource = dsMain
      EditActions = [geaCopyEh, geaSelectAllEh]
      FooterColor = clWindow
      FooterFont.Charset = GB2312_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -12
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      PopupMenu = PopupMenu1
      SortLocal = True
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnKeyDown = DghMainKeyDown
      Columns = <
        item
          EditButtons = <>
          FieldName = 'pp_quota_len'
          Footers = <>
          ReadOnly = True
          Width = 74
        end
        item
          EditButtons = <>
          FieldName = 'pp_quota_roll'
          Footers = <>
          ReadOnly = True
        end
        item
          EditButtons = <>
          FieldName = 'QUANTITY'
          Footers = <>
          ReadOnly = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'QUAN_ON_HAND_1'
          Footers = <>
          ReadOnly = True
          Width = 73
        end
        item
          EditButtons = <>
          FieldName = 'QUAN_ON_HAND_2'
          Footers = <>
          ReadOnly = True
          Width = 73
        end
        item
          EditButtons = <>
          FieldName = 'ABBR_NAME'
          Footers = <>
          ReadOnly = True
        end
        item
          EditButtons = <>
          FieldName = 'EXPIRE_DATE'
          Footers = <>
          ReadOnly = True
        end
        item
          EditButtons = <>
          FieldName = 'SUPPLIER2'
          Footers = <>
          ReadOnly = True
          Width = 118
        end
        item
          EditButtons = <>
          FieldName = 'BARCODE_ID'
          Footers = <>
          ReadOnly = True
          Width = 126
        end
        item
          EditButtons = <>
          FieldName = 'rkey733'
          Footers = <>
          ReadOnly = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'rkey730'
          Footers = <>
          ReadOnly = True
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'IES_PARAMETER_VALUE3'
          Footers = <>
          ReadOnly = True
          Visible = False
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 484
    Width = 785
    Height = 53
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object bt_Cancel: TButton
      Left = 390
      Top = 17
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 0
      OnClick = bt_CancelClick
    end
    object bt_OK: TButton
      Left = 289
      Top = 17
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 1
      OnClick = bt_OKClick
    end
  end
  object dtMain: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select Data0022.SUPPLIER2,Data0022.BARCODE_ID,data0023.ABBR_NAME' +
      ',data0730.QUANTITY,'#13#10'data0730.QUAN_ON_HAND_1,data0730.QUAN_ON_HA' +
      'ND_2,data0730.EXPIRE_DATE,0 as IES_PARAMETER_VALUE2,0 as IES_PAR' +
      'AMETER_VALUE3,'#13#10'data0735.* '#13#10'from data0735'#13#10'join data0730 on dat' +
      'a0735.rkey730 =data0730.rkey'#13#10'join data0207 on data0730.D207_ptr' +
      '=data0207.rkey'#13#10'join Data0022 on data0207.D0022_PTR=Data0022.rke' +
      'y'#13#10'left join data0456 on Data0022.GRN_PTR=data0456.rkey'#13#10'left jo' +
      'in data0023 on data0456.SUPP_PTR=data0023.rkey'#13#10'where 1=2'
    EnableBCD = False
    Parameters = <>
    Left = 268
    Top = 236
    object dtMainSUPPLIER2: TStringField
      FieldName = 'SUPPLIER2'
      ProviderFlags = []
      Size = 30
    end
    object dtMainBARCODE_ID: TStringField
      FieldName = 'BARCODE_ID'
      ProviderFlags = []
      Size = 50
    end
    object dtMainABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      ProviderFlags = []
      Size = 16
    end
    object dtMainQUANTITY: TBCDField
      FieldName = 'QUANTITY'
      ProviderFlags = []
      Precision = 9
    end
    object dtMainQUAN_ON_HAND_1: TFloatField
      FieldName = 'QUAN_ON_HAND_1'
      ProviderFlags = []
    end
    object dtMainQUAN_ON_HAND_2: TFloatField
      FieldName = 'QUAN_ON_HAND_2'
      ProviderFlags = []
    end
    object dtMainEXPIRE_DATE: TDateTimeField
      FieldName = 'EXPIRE_DATE'
      ProviderFlags = []
    end
    object dtMainIES_PARAMETER_VALUE2: TIntegerField
      FieldName = 'IES_PARAMETER_VALUE2'
      ProviderFlags = []
      ReadOnly = True
    end
    object dtMainIES_PARAMETER_VALUE3: TIntegerField
      FieldName = 'IES_PARAMETER_VALUE3'
      ProviderFlags = []
      ReadOnly = True
    end
    object dtMainrkey733: TIntegerField
      FieldName = 'rkey733'
    end
    object dtMainrkey730: TIntegerField
      FieldName = 'rkey730'
    end
    object dtMainpp_quota_len: TBCDField
      FieldName = 'pp_quota_len'
      Precision = 10
      Size = 5
    end
    object dtMainpp_quota_roll: TFloatField
      FieldName = 'pp_quota_roll'
    end
  end
  object dspMain: TDataSetProvider
    DataSet = dtMain
    Options = [poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 330
    Top = 236
  end
  object cds735: Tcds
    Aggregates = <>
    CommandText = 
      'select Data0022.SUPPLIER2,Data0022.BARCODE_ID,data0023.ABBR_NAME' +
      ',data0730.QUANTITY,'#13#10'data0730.QUAN_ON_HAND_1,data0730.QUAN_ON_HA' +
      'ND_2,data0730.EXPIRE_DATE,0 as IES_PARAMETER_VALUE2,0 as IES_PAR' +
      'AMETER_VALUE3,'#13#10'data0735.* '#13#10'from data0735'#13#10'join data0730 on dat' +
      'a0735.rkey730 =data0730.rkey'#13#10'join data0207 on data0730.D207_ptr' +
      '=data0207.rkey'#13#10'join Data0022 on data0207.D0022_PTR=Data0022.rke' +
      'y'#13#10'left join data0456 on Data0022.GRN_PTR=data0456.rkey'#13#10'left jo' +
      'in data0023 on data0456.SUPP_PTR=data0023.rkey'#13#10'where 1=2'
    FilterOptions = [foCaseInsensitive]
    FieldDefs = <
      item
        Name = 'SUPPLIER2'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'BARCODE_ID'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ABBR_NAME'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'QUANTITY'
        DataType = ftBCD
        Precision = 9
        Size = 4
      end
      item
        Name = 'QUAN_ON_HAND_1'
        DataType = ftFloat
      end
      item
        Name = 'QUAN_ON_HAND_2'
        DataType = ftFloat
      end
      item
        Name = 'EXPIRE_DATE'
        DataType = ftDateTime
      end
      item
        Name = 'IES_PARAMETER_VALUE2'
        Attributes = [faReadonly]
        DataType = ftInteger
      end
      item
        Name = 'IES_PARAMETER_VALUE3'
        Attributes = [faReadonly]
        DataType = ftInteger
      end
      item
        Name = 'rkey733'
        DataType = ftInteger
      end
      item
        Name = 'rkey730'
        DataType = ftInteger
      end
      item
        Name = 'pp_quota_len'
        DataType = ftBCD
        Precision = 10
        Size = 5
      end
      item
        Name = 'pp_quota_roll'
        DataType = ftFloat
      end>
    IndexDefs = <>
    ObjectView = False
    Params = <>
    ProviderName = 'dspMain'
    StoreDefs = True
    F_UKSaveNotEdit = False
    F_AutoNumb = False
    F_AutoSave = False
    F_SQLSelectFrom = 'select * from data0730'
    Left = 384
    Top = 236
    object cds735SUPPLIER2: TStringField
      DisplayLabel = #29983#20135#25209#21495#25110#21407#20379#24212#21830
      FieldName = 'SUPPLIER2'
      ProviderFlags = []
      Size = 30
    end
    object cds735BARCODE_ID: TStringField
      DisplayLabel = #22791#27880'('#20379#24212#21830#22411#21495')'
      FieldName = 'BARCODE_ID'
      ProviderFlags = []
      Size = 50
    end
    object cds735ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'ABBR_NAME'
      ProviderFlags = []
      Size = 16
    end
    object cds735QUANTITY: TBCDField
      DisplayLabel = #39046#29992#25968#37327
      FieldName = 'QUANTITY'
      ProviderFlags = []
      Precision = 9
    end
    object cds735QUAN_ON_HAND_1: TFloatField
      DisplayLabel = #21487#29992#25968#37327'('#21367')'
      FieldName = 'QUAN_ON_HAND_1'
      ProviderFlags = []
    end
    object cds735QUAN_ON_HAND_2: TFloatField
      DisplayLabel = #21487#29992#25968#37327'('#31859')'
      FieldName = 'QUAN_ON_HAND_2'
      ProviderFlags = []
    end
    object cds735EXPIRE_DATE: TDateTimeField
      DisplayLabel = #26377#25928#26399
      FieldName = 'EXPIRE_DATE'
      ProviderFlags = []
    end
    object cds735rkey733: TIntegerField
      FieldName = 'rkey733'
    end
    object cds735rkey730: TIntegerField
      FieldName = 'rkey730'
    end
    object cds735pp_quota_len: TBCDField
      DisplayLabel = #32791#29992#38271#24230'('#31859')'
      FieldName = 'pp_quota_len'
      Precision = 10
      Size = 5
    end
    object cds735IES_PARAMETER_VALUE2: TIntegerField
      FieldName = 'IES_PARAMETER_VALUE2'
      ProviderFlags = []
    end
    object cds735IES_PARAMETER_VALUE3: TIntegerField
      FieldName = 'IES_PARAMETER_VALUE3'
      ProviderFlags = []
    end
    object cds735pp_quota_roll: TFloatField
      DisplayLabel = #32791#29992#21367
      FieldName = 'pp_quota_roll'
    end
  end
  object dsMain: TDataSource
    DataSet = cds735
    Left = 431
    Top = 236
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 112
    Top = 169
    object N_SelectItme: TMenuItem
      Caption = #36873#25321#26448#26009
      OnClick = N_SelectItmeClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object N_Delete: TMenuItem
      Caption = #21024#38500
      OnClick = N_DeleteClick
    end
  end
  object cds0730_1: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select data0017.INV_PART_NUMBER,data0017.INV_NAME,data0017.INV_D' +
      'ESCRIPTION,data0002.UNIT_CODE,'#13#10'Data0022.SUPPLIER2,Data0022.BARC' +
      'ODE_ID,data0023.ABBR_NAME,0 as QTY,data0017.IES_PARAMETER_VALUE2' +
      ',data0017.IES_PARAMETER_VALUE3,'#13#10'data0730.* '#13#10'from data0730'#13#10'joi' +
      'n data0017 on data0730.[D017_PTR]=data0017.rkey'#13#10'join data0002 o' +
      'n data0730.[D002_PTR]=data0002.rkey'#13#10'join data0207 on data0730.D' +
      '207_ptr=data0207.rkey'#13#10'join Data0022 on data0207.D0022_PTR=Data0' +
      '022.rkey'#13#10'left join data0456 on Data0022.GRN_PTR=data0456.rkey'#13#10 +
      'left join data0023 on data0456.SUPP_PTR=data0023.rkey'#13#10'where (([' +
      'QUAN_ON_HAND_1]>0) or  ([QUAN_ON_HAND_2]>0)) '
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dsp0730'
    Left = 336
    Top = 160
    object cds0730_1ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      DisplayWidth = 10
      FieldName = 'ABBR_NAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 16
    end
    object cds0730_1QUAN_ON_HAND_1: TFloatField
      DisplayLabel = #24403#21069#25968#37327'('#21367')'
      FieldName = 'QUAN_ON_HAND_1'
    end
    object cds0730_1QUAN_ON_HAND_2: TFloatField
      DisplayLabel = #24403#21069#25968#37327'('#31859')'
      FieldName = 'QUAN_ON_HAND_2'
    end
    object cds0730_1QTY: TIntegerField
      DisplayLabel = #32791#29992#37327
      FieldName = 'QTY'
      ProviderFlags = []
    end
    object cds0730_1INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#20195#30721
      DisplayWidth = 15
      FieldName = 'INV_PART_NUMBER'
      ProviderFlags = []
      ReadOnly = True
      Visible = False
      Size = 25
    end
    object cds0730_1INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      ProviderFlags = []
      ReadOnly = True
      Visible = False
      Size = 30
    end
    object cds0730_1INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      ProviderFlags = []
      ReadOnly = True
      Visible = False
      Size = 70
    end
    object cds0730_1UNIT_CODE: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_CODE'
      ProviderFlags = []
      ReadOnly = True
      Size = 5
    end
    object cds0730_1SUPPLIER2: TStringField
      DisplayLabel = #29983#20135#25209#21495#25110#21407#20379#24212#21830
      DisplayWidth = 10
      FieldName = 'SUPPLIER2'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object cds0730_1BARCODE_ID: TStringField
      DisplayLabel = #22791#27880'('#20379#24212#21830#22411#21495')'
      DisplayWidth = 10
      FieldName = 'BARCODE_ID'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object cds0730_1RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
    object cds0730_1D207_PTR: TIntegerField
      FieldName = 'D207_PTR'
      ReadOnly = True
      Visible = False
    end
    object cds0730_1D017_PTR: TIntegerField
      FieldName = 'D017_PTR'
      ReadOnly = True
      Visible = False
    end
    object cds0730_1D002_PTR: TIntegerField
      FieldName = 'D002_PTR'
      ReadOnly = True
      Visible = False
    end
    object cds0730_1QUANTITY: TBCDField
      DisplayLabel = #25968#37327
      DisplayWidth = 5
      FieldName = 'QUANTITY'
      ReadOnly = True
      Visible = False
      Precision = 9
    end
    object cds0730_1TDATE: TDateTimeField
      FieldName = 'TDATE'
      ReadOnly = True
      Visible = False
    end
    object cds0730_1empl_ptr: TIntegerField
      FieldName = 'empl_ptr'
      ReadOnly = True
      Visible = False
    end
    object cds0730_1EXPIRE_DATE: TDateTimeField
      DisplayLabel = #26377#25928#26399
      DisplayWidth = 8
      FieldName = 'EXPIRE_DATE'
      ReadOnly = True
    end
    object cds0730_1DescText: TStringField
      DisplayLabel = #22791#27880
      DisplayWidth = 20
      FieldName = 'DescText'
      ReadOnly = True
      Size = 100
    end
    object cds0730_1IES_PARAMETER_VALUE2: TStringField
      FieldName = 'IES_PARAMETER_VALUE2'
      ProviderFlags = []
      Size = 30
    end
    object cds0730_1IES_PARAMETER_VALUE3: TStringField
      FieldName = 'IES_PARAMETER_VALUE3'
      ProviderFlags = []
      Visible = False
      Size = 30
    end
  end
  object dtRead: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'select data0017.INV_PART_NUMBER,data0017.INV_NAME,data0017.INV_D' +
      'ESCRIPTION,data0002.UNIT_CODE,'#13#10'Data0022.SUPPLIER2,Data0022.BARC' +
      'ODE_ID,data0023.ABBR_NAME,0 as QTY,data0017.IES_PARAMETER_VALUE2' +
      ',data0017.IES_PARAMETER_VALUE3,'#13#10'data0730.* '#13#10'from data0730'#13#10'joi' +
      'n data0017 on data0730.[D017_PTR]=data0017.rkey'#13#10'join data0002 o' +
      'n data0730.[D002_PTR]=data0002.rkey'#13#10'join data0207 on data0730.D' +
      '207_ptr=data0207.rkey'#13#10'join Data0022 on data0207.D0022_PTR=Data0' +
      '022.rkey'#13#10'left join data0456 on Data0022.GRN_PTR=data0456.rkey'#13#10 +
      'left join data0023 on data0456.SUPP_PTR=data0023.rkey'#13#10'where [QU' +
      'AN_ON_HAND_1]>0 or  [QUAN_ON_HAND_2]>0 '
    Parameters = <>
    Left = 510
    Top = 236
  end
  object dspRead: TDataSetProvider
    DataSet = dtRead
    Options = [poAllowCommandText]
    Left = 560
    Top = 236
  end
  object cds0017: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select data0017.IES_PARAMETER_VALUE2,data0017.IES_PARAMETER_VALU' +
      'E3'#13#10'from data0017 where rkey= :rkey'
    Params = <
      item
        DataType = ftUnknown
        Name = 'rkey'
        ParamType = ptUnknown
      end>
    Left = 496
    Top = 161
  end
  object dsp0730: TDataSetProvider
    DataSet = dt0730
    Options = [poAllowCommandText]
    Left = 264
    Top = 161
  end
  object dt0730: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    EnableBCD = False
    Parameters = <>
    Left = 184
    Top = 161
    object dt0730INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      ProviderFlags = []
      Size = 25
    end
    object dt0730INV_NAME: TStringField
      FieldName = 'INV_NAME'
      ProviderFlags = []
      Size = 30
    end
    object dt0730INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      ProviderFlags = []
      Size = 70
    end
    object dt0730UNIT_CODE: TStringField
      FieldName = 'UNIT_CODE'
      ProviderFlags = []
      Size = 5
    end
    object dt0730SUPPLIER2: TStringField
      FieldName = 'SUPPLIER2'
      ProviderFlags = []
      Size = 30
    end
    object dt0730BARCODE_ID: TStringField
      FieldName = 'BARCODE_ID'
      ProviderFlags = []
      Size = 50
    end
    object dt0730ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      ProviderFlags = []
      Size = 16
    end
    object dt0730QTY: TIntegerField
      FieldName = 'QTY'
      ProviderFlags = []
      ReadOnly = True
    end
    object dt0730IES_PARAMETER_VALUE2: TStringField
      FieldName = 'IES_PARAMETER_VALUE2'
      ProviderFlags = []
      Size = 30
    end
    object dt0730IES_PARAMETER_VALUE3: TStringField
      FieldName = 'IES_PARAMETER_VALUE3'
      ProviderFlags = []
      Size = 30
    end
    object dt0730RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object dt0730D207_PTR: TIntegerField
      FieldName = 'D207_PTR'
    end
    object dt0730D017_PTR: TIntegerField
      FieldName = 'D017_PTR'
    end
    object dt0730D002_PTR: TIntegerField
      FieldName = 'D002_PTR'
    end
    object dt0730QUANTITY: TBCDField
      FieldName = 'QUANTITY'
      Precision = 9
    end
    object dt0730TDATE: TDateTimeField
      FieldName = 'TDATE'
    end
    object dt0730empl_ptr: TIntegerField
      FieldName = 'empl_ptr'
    end
    object dt0730QUAN_ON_HAND_1: TFloatField
      FieldName = 'QUAN_ON_HAND_1'
    end
    object dt0730QUAN_ON_HAND_2: TFloatField
      FieldName = 'QUAN_ON_HAND_2'
    end
    object dt0730EXPIRE_DATE: TDateTimeField
      FieldName = 'EXPIRE_DATE'
    end
    object dt0730DescText: TStringField
      FieldName = 'DescText'
      Size = 100
    end
  end
  object cds0730: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select data0017.INV_PART_NUMBER,data0017.INV_NAME,data0017.INV_D' +
      'ESCRIPTION,data0002.UNIT_CODE,'#13#10'Data0022.SUPPLIER2,Data0022.BARC' +
      'ODE_ID,data0023.ABBR_NAME,0 as QTY,data0017.IES_PARAMETER_VALUE2' +
      ',data0017.IES_PARAMETER_VALUE3,'#13#10'data0457.REF_NUMBER,data0730.* ' +
      #13#10'from data0730'#13#10'join data0017 on data0730.[D017_PTR]=data0017.r' +
      'key'#13#10'join data0002 on data0730.[D002_PTR]=data0002.rkey'#13#10'join da' +
      'ta0207 on data0730.D207_ptr=data0207.rkey'#13#10'join data0457 on data' +
      '0207.GON_PTR=data0457.rkey'#13#10'join Data0022 on data0207.D0022_PTR=' +
      'Data0022.rkey'#13#10'left join data0456 on Data0022.GRN_PTR=data0456.r' +
      'key'#13#10'left join data0023 on data0456.SUPP_PTR=data0023.rkey'#13#10'wher' +
      'e ([QUAN_ON_HAND_1]>0) '
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 176
    Top = 235
    object cds0730ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      DisplayWidth = 10
      FieldName = 'ABBR_NAME'
      ProviderFlags = []
      Size = 16
    end
    object cds0730QUAN_ON_HAND_1: TBCDField
      DisplayLabel = #24403#21069#25968#37327'('#21367')'
      DisplayWidth = 11
      FieldName = 'QUAN_ON_HAND_1'
      ProviderFlags = []
      Precision = 10
      Size = 5
    end
    object cds0730QUAN_ON_HAND_2: TBCDField
      DisplayLabel = #24403#21069#25968#37327'('#31859')'
      DisplayWidth = 11
      FieldName = 'QUAN_ON_HAND_2'
      ProviderFlags = []
      Precision = 10
      Size = 5
    end
    object cds0730QTY: TIntegerField
      DisplayLabel = #32791#29992#37327
      DisplayWidth = 8
      FieldName = 'QTY'
      ProviderFlags = []
      ReadOnly = True
      Visible = False
    end
    object cds0730REF_NUMBER: TStringField
      DisplayLabel = #39046#26009#21333#21495
      DisplayWidth = 14
      FieldName = 'REF_NUMBER'
      Size = 15
    end
    object cds0730EXPIRE_DATE: TDateTimeField
      DisplayLabel = #26377#25928#26399
      DisplayWidth = 13
      FieldName = 'EXPIRE_DATE'
      ProviderFlags = [pfInUpdate]
    end
    object cds0730SUPPLIER2: TStringField
      DisplayLabel = #29983#20135#25209#21495#25110#21407#20379#24212#21830
      DisplayWidth = 12
      FieldName = 'SUPPLIER2'
      ProviderFlags = []
      Size = 30
    end
    object cds0730BARCODE_ID: TStringField
      DisplayLabel = #22791#27880'('#20379#24212#21830#22411#21495')'
      DisplayWidth = 10
      FieldName = 'BARCODE_ID'
      ProviderFlags = []
      Size = 50
    end
    object cds0730INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      DisplayWidth = 15
      FieldName = 'INV_PART_NUMBER'
      ProviderFlags = []
      Size = 25
    end
    object cds0730INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      DisplayWidth = 25
      FieldName = 'INV_NAME'
      ProviderFlags = []
      Size = 30
    end
    object cds0730INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      DisplayWidth = 20
      FieldName = 'INV_DESCRIPTION'
      ProviderFlags = []
      Size = 70
    end
    object cds0730UNIT_CODE: TStringField
      DisplayLabel = #21333#20301
      DisplayWidth = 5
      FieldName = 'UNIT_CODE'
      ProviderFlags = []
      Size = 5
    end
    object cds0730RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
    object cds0730D207_PTR: TIntegerField
      FieldName = 'D207_PTR'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cds0730D017_PTR: TIntegerField
      FieldName = 'D017_PTR'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cds0730D002_PTR: TIntegerField
      FieldName = 'D002_PTR'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cds0730QUANTITY: TBCDField
      DisplayLabel = #25968#37327
      FieldName = 'QUANTITY'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Precision = 9
    end
    object cds0730TDATE: TDateTimeField
      FieldName = 'TDATE'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cds0730empl_ptr: TIntegerField
      FieldName = 'empl_ptr'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cds0730DescText: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'DescText'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Size = 100
    end
    object cds0730IES_PARAMETER_VALUE3: TStringField
      FieldName = 'IES_PARAMETER_VALUE3'
      ProviderFlags = []
      Visible = False
      Size = 30
    end
    object cds0730IES_PARAMETER_VALUE2: TStringField
      FieldName = 'IES_PARAMETER_VALUE2'
      ProviderFlags = []
      Visible = False
      Size = 30
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = ADODataSet1
    Options = [poAllowCommandText]
    Left = 112
    Top = 235
  end
  object ADODataSet1: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select data0017.INV_PART_NUMBER,data0017.INV_NAME,data0017.INV_D' +
      'ESCRIPTION,data0002.UNIT_CODE,'#13#10'Data0022.SUPPLIER2,Data0022.BARC' +
      'ODE_ID,data0023.ABBR_NAME,0 as QTY,data0017.IES_PARAMETER_VALUE2' +
      ',data0017.IES_PARAMETER_VALUE3,'#13#10'data0457.REF_NUMBER,data0730.* ' +
      #13#10'from data0730'#13#10'join data0017 on data0730.[D017_PTR]=data0017.r' +
      'key'#13#10'join data0002 on data0730.[D002_PTR]=data0002.rkey'#13#10'join da' +
      'ta0207 on data0730.D207_ptr=data0207.rkey'#13#10'join data0457 on data' +
      '0207.GON_PTR=data0457.rkey'#13#10'join Data0022 on data0207.D0022_PTR=' +
      'Data0022.rkey'#13#10'left join data0456 on Data0022.GRN_PTR=data0456.r' +
      'key'#13#10'left join data0023 on data0456.SUPP_PTR=data0023.rkey'#13#10'wher' +
      'e ([QUAN_ON_HAND_1]>0) '
    Parameters = <>
    Left = 32
    Top = 235
    object ADODataSet1INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      ProviderFlags = []
      Size = 25
    end
    object ADODataSet1INV_NAME: TStringField
      FieldName = 'INV_NAME'
      ProviderFlags = []
      Size = 30
    end
    object ADODataSet1INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      ProviderFlags = []
      Size = 70
    end
    object ADODataSet1UNIT_CODE: TStringField
      FieldName = 'UNIT_CODE'
      ProviderFlags = []
      Size = 5
    end
    object ADODataSet1SUPPLIER2: TStringField
      FieldName = 'SUPPLIER2'
      ProviderFlags = []
      Size = 30
    end
    object ADODataSet1BARCODE_ID: TStringField
      FieldName = 'BARCODE_ID'
      ProviderFlags = []
      Size = 50
    end
    object ADODataSet1ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      ProviderFlags = []
      Size = 16
    end
    object ADODataSet1QTY: TIntegerField
      FieldName = 'QTY'
      ProviderFlags = []
      ReadOnly = True
    end
    object ADODataSet1IES_PARAMETER_VALUE2: TStringField
      FieldName = 'IES_PARAMETER_VALUE2'
      ProviderFlags = []
      Size = 30
    end
    object ADODataSet1IES_PARAMETER_VALUE3: TStringField
      FieldName = 'IES_PARAMETER_VALUE3'
      ProviderFlags = []
      Size = 30
    end
    object ADODataSet1RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADODataSet1D207_PTR: TIntegerField
      FieldName = 'D207_PTR'
      ProviderFlags = [pfInUpdate]
    end
    object ADODataSet1D017_PTR: TIntegerField
      FieldName = 'D017_PTR'
      ProviderFlags = [pfInUpdate]
    end
    object ADODataSet1D002_PTR: TIntegerField
      FieldName = 'D002_PTR'
      ProviderFlags = [pfInUpdate]
    end
    object ADODataSet1QUANTITY: TBCDField
      FieldName = 'QUANTITY'
      ProviderFlags = [pfInUpdate]
      Precision = 9
    end
    object ADODataSet1TDATE: TDateTimeField
      FieldName = 'TDATE'
      ProviderFlags = [pfInUpdate]
    end
    object ADODataSet1empl_ptr: TIntegerField
      FieldName = 'empl_ptr'
      ProviderFlags = [pfInUpdate]
    end
    object ADODataSet1QUAN_ON_HAND_1: TBCDField
      FieldName = 'QUAN_ON_HAND_1'
      Precision = 10
      Size = 5
    end
    object ADODataSet1QUAN_ON_HAND_2: TBCDField
      FieldName = 'QUAN_ON_HAND_2'
      Precision = 10
      Size = 5
    end
    object ADODataSet1EXPIRE_DATE: TDateTimeField
      FieldName = 'EXPIRE_DATE'
      ProviderFlags = [pfInUpdate]
    end
    object ADODataSet1DescText: TStringField
      FieldName = 'DescText'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object ADODataSet1REF_NUMBER: TStringField
      FieldName = 'REF_NUMBER'
      ProviderFlags = []
      Size = 15
    end
  end
end
