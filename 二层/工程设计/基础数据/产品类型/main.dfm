object Form1: TForm1
  Left = 284
  Top = 232
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20135#21697#31867#22411
  ClientHeight = 499
  ClientWidth = 832
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 321
    Top = 9
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #31867#22411#20195#30721':'
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 32
    Width = 832
    Height = 448
    Align = alBottom
    DataSource = DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = editClick
    OnKeyPress = FormKeyPress
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'PROD_CODE'
        Title.Caption = #31867#22411#20195#30721
        Title.Color = clRed
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUCT_NAME'
        Title.Caption = #31867#22411#21517#31216
        Width = 194
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'grp_code'
        ReadOnly = False
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'grp_name'
        ReadOnly = False
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LEAD_TIME'
        Title.Caption = #29983#20135#21608#26399
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OPT_LOT_SIZE'
        Title.Caption = #26368#20339#25209
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MAX_DAYS_EARLY_BUILD'
        Title.Caption = #21046#36896#25552#21069#26399
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REVIEW_DAYS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EST_SCRAP'
        Title.Caption = #37327#20135#25253#24223#29575'%'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EST_SCRAP1'
        Title.Caption = #26679#26495#25253#24223#29575'%'
        Visible = True
      end>
  end
  object Bar1: TStatusBar
    Left = 0
    Top = 480
    Width = 832
    Height = 19
    Panels = <>
    SimpleText = #25628#32034':'
  end
  object Edit1: TEdit
    Left = 385
    Top = 6
    Width = 121
    Height = 21
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 0
    OnChange = Edit1Change
  end
  object BtnClose: TBitBtn
    Left = 1
    Top = 1
    Width = 60
    Height = 30
    Caption = #36864#20986
    TabOrder = 3
    OnClick = BtnCloseClick
    Kind = bkClose
  end
  object BtnBrush: TBitBtn
    Left = 61
    Top = 1
    Width = 60
    Height = 30
    Caption = #21047#26032
    TabOrder = 4
    OnClick = BtnBrushClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000120B0000120B00001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
      DADABFBFBDADADADADADDADADBFADADADADAADADAD000DADADADDADAD0FBF0DA
      DADAADAD0F7FBF0DADADDAD0F7F87BF0DADAAD0F7F87BFB70DADD0F7F87BFB78
      80DA000F87BFB78880ADDAD00BFB78880ADAADADA0B7888740ADDADADA088804
      440AADADADA000A04440DADADADADADA0440ADADADADADADA00D}
  end
  object Button2: TButton
    Left = 120
    Top = 0
    Width = 75
    Height = 30
    Caption = #23548#20986#25968#25454
    TabOrder = 5
    OnClick = Button2Click
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 363
    Top = 348
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 408
    Top = 204
    object new: TMenuItem
      Caption = #26032#22686
      OnClick = newClick
    end
    object edit: TMenuItem
      Caption = #32534#36753
      OnClick = editClick
    end
    object N1: TMenuItem
      Caption = #26597#30475
      OnClick = N1Click
    end
    object copydate: TMenuItem
      Caption = #22797#21046
      OnClick = copydateClick
    end
    object delete: TMenuItem
      Caption = #21024#38500
      OnClick = deleteClick
    end
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 303
    Top = 248
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    AfterDelete = ADOTable1AfterDelete
    OnDeleteError = ADOTable1DeleteError
    OnPostError = ADOTable1PostError
    IndexFieldNames = 'PROD_CODE'
    TableName = 'Data0008'
    Left = 478
    Top = 344
    object ADOTable1RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOTable1PROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object ADOTable1PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADOTable1PR_GRP_POINTER: TIntegerField
      FieldName = 'PR_GRP_POINTER'
    end
    object ADOTable1LEAD_TIME: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'LEAD_TIME'
    end
    object ADOTable1OPT_LOT_SIZE: TIntegerField
      FieldName = 'OPT_LOT_SIZE'
    end
    object ADOTable1MAX_DAYS_EARLY_BUILD: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'MAX_DAYS_EARLY_BUILD'
    end
    object ADOTable1PROD_SEEDVALUE: TStringField
      FieldName = 'PROD_SEEDVALUE'
    end
    object ADOTable1PROD_INCREMENTBY: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'PROD_INCREMENTBY'
    end
    object ADOTable1ANALYSIS_CODE1: TStringField
      FieldName = 'ANALYSIS_CODE1'
      FixedChar = True
    end
    object ADOTable1ANALYSIS_CODE2: TStringField
      FieldName = 'ANALYSIS_CODE2'
      FixedChar = True
    end
    object ADOTable1ANALYSIS_CODE3: TStringField
      FieldName = 'ANALYSIS_CODE3'
      FixedChar = True
    end
    object ADOTable1ANALYSIS_CODE4: TStringField
      FieldName = 'ANALYSIS_CODE4'
      FixedChar = True
    end
    object ADOTable1ANALYSIS_CODE5: TStringField
      FieldName = 'ANALYSIS_CODE5'
      FixedChar = True
    end
    object ADOTable1G_L_POINTER: TIntegerField
      FieldName = 'G_L_POINTER'
    end
    object ADOTable1EST_SCRAP: TFloatField
      Alignment = taLeftJustify
      FieldName = 'EST_SCRAP'
    end
    object ADOTable1EST_SCRAP1: TFloatField
      Alignment = taLeftJustify
      FieldName = 'EST_SCRAP1'
    end
    object ADOTable1EST_SCRAP_LTM: TFloatField
      FieldName = 'EST_SCRAP_LTM'
    end
    object ADOTable1EST_SCRAP1_LMT: TFloatField
      FieldName = 'EST_SCRAP1_LMT'
    end
    object ADOTable1DG_ADJ_PTH: TBCDField
      FieldName = 'DG_ADJ_PTH'
      Precision = 6
      Size = 2
    end
    object ADOTable1DG_ADJ_NPTH: TBCDField
      FieldName = 'DG_ADJ_NPTH'
      Precision = 6
      Size = 2
    end
    object ADOTable1batch_flag: TBooleanField
      FieldName = 'batch_flag'
    end
    object ADOTable1former_flag: TBooleanField
      FieldName = 'former_flag'
    end
    object ADOTable1IESMODEL_PTR: TIntegerField
      FieldName = 'IESMODEL_PTR'
    end
    object ADOTable1layer_pre: TIntegerField
      FieldName = 'layer_pre'
    end
    object ADOTable1PRECHAR1: TStringField
      FieldName = 'PRECHAR1'
      Size = 15
    end
    object ADOTable1PRECHAR2: TStringField
      FieldName = 'PRECHAR2'
      Size = 15
    end
    object ADOTable1REVIEW_DAYS: TSmallintField
      DisplayLabel = #26377#25928#26399'('#22825#25968')'
      FieldName = 'REVIEW_DAYS'
    end
    object ADOTable1difficulty_grade: TIntegerField
      DisplayLabel = 'HDI/'#38750'HDI'
      FieldName = 'difficulty_grade'
    end
    object ADOTable1grp_code: TStringField
      DisplayLabel = #32452#21035#20195#30721
      FieldKind = fkLookup
      FieldName = 'grp_code'
      LookupDataSet = ADOTable07
      LookupKeyFields = 'RKEY'
      LookupResultField = 'PR_GRP_CODE'
      KeyFields = 'PR_GRP_POINTER'
      Size = 5
      Lookup = True
    end
    object ADOTable1grp_name: TStringField
      DisplayLabel = #32452#21035#21517#31216
      FieldKind = fkLookup
      FieldName = 'grp_name'
      LookupDataSet = ADOTable07
      LookupKeyFields = 'RKEY'
      LookupResultField = 'PRODUCT_GROUP_NAME'
      KeyFields = 'PR_GRP_POINTER'
      Size = 30
      Lookup = True
    end
    object ADOTable1difficulty_grade_value: TFloatField
      FieldName = 'difficulty_grade_value'
    end
  end
  object ADOTable07: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    TableName = 'Data0007'
    Left = 572
    Top = 340
    object ADOTable07RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOTable07PR_GRP_CODE: TStringField
      FieldName = 'PR_GRP_CODE'
      Size = 5
    end
    object ADOTable07PRODUCT_GROUP_NAME: TStringField
      FieldName = 'PRODUCT_GROUP_NAME'
      Size = 30
    end
    object ADOTable07PR_GRP_SEEDVALUE: TStringField
      FieldName = 'PR_GRP_SEEDVALUE'
    end
    object ADOTable07PR_GRP_INCREMENTBY: TSmallintField
      FieldName = 'PR_GRP_INCREMENTBY'
    end
  end
end
