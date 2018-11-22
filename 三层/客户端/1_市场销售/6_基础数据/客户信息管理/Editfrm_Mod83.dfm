inherited frmEdit_mod83: TfrmEdit_mod83
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #23458#25143#35814#32454#36164#26009
  ClientHeight = 575
  ClientWidth = 718
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitWidth = 724
  ExplicitHeight = 600
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 718
    Height = 57
    Align = alTop
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 718
    ExplicitHeight = 57
    inherited pnl1: TPanel
      Width = 716
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 716
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Top = 33
      Width = 716
      Height = 23
      Align = alBottom
      ExplicitLeft = 1
      ExplicitWidth = 716
      ExplicitHeight = 23
      object HeaderControl1: THeaderControl
        Left = 2
        Top = 1
        Width = 724
        Height = 21
        Align = alNone
        Sections = <
          item
            Alignment = taCenter
            ImageIndex = -1
            Text = #39033#30446#36873#25321
            Width = 200
          end
          item
            Alignment = taCenter
            ImageIndex = -1
            Text = #19968#33324#20449#24687
            Width = 528
          end>
      end
    end
  end
  object TreeView1: TTreeView
    Left = 0
    Top = 57
    Width = 201
    Height = 518
    Align = alLeft
    HideSelection = False
    Indent = 19
    ReadOnly = True
    TabOrder = 2
    TabStop = False
    OnChange = TreeView1Change
    OnMouseDown = TreeView1MouseDown
    Items.NodeData = {
      0303000000260000000000000000000000FFFFFFFFFFFFFFFF00000000000000
      00060000000104A25B3762448DAF8B260000000000000001000000FFFFFFFFFF
      FFFFFF0000000000000000000000000104004E2C82E14F6F6026000000000000
      0002000000FFFFFFFFFFFFFFFF0000000000000000000000000104E68BC67EE1
      4F6F60260000000000000003000000FFFFFFFFFFFFFFFF000000000000000000
      0000000104228DA152E14F6F60260000000000000004000000FFFFFFFFFFFFFF
      FF00000000000000000000000001048653F253E14F6F60260000000000000005
      000000FFFFFFFFFFFFFFFF00000000000000000000000001045480DC7EBA4E58
      54260000000000000006000000FFFFFFFFFFFFFFFF0000000000000000000000
      000104A18B1252895B9263260000000000000007000000FFFFFFFFFFFFFFFF00
      00000000000000000000000104C588D08F3057B9702600000000000000080000
      00FFFFFFFFFFFFFFFF0000000000000000000000000104F876735187656368}
  end
  object Notebook1: TNotebook
    Left = 201
    Top = 57
    Width = 517
    Height = 518
    Align = alClient
    Color = clMenu
    PageIndex = 2
    ParentColor = False
    TabOrder = 1
    object TPage
      Left = 0
      Top = 0
      Caption = 'Default'
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
    object TPage
      Left = 0
      Top = 0
      Caption = #19968#33324#20449#24687
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label3: TLabel
        Left = 74
        Top = 8
        Width = 60
        Height = 13
        Alignment = taRightJustify
        Caption = #23458#25143#20195#30721#65306
      end
      object Label4: TLabel
        Left = 42
        Top = 37
        Width = 92
        Height = 13
        Alignment = taRightJustify
        Caption = #23458#25143#21517#31216'('#20013#25991')'#65306
      end
      object Label6: TLabel
        Left = 74
        Top = 96
        Width = 60
        Height = 13
        Alignment = taRightJustify
        Caption = #21517#31216#32553#20889#65306
      end
      object Label14: TLabel
        Left = 74
        Top = 271
        Width = 60
        Height = 13
        Alignment = taRightJustify
        Caption = #35814#32454#22320#22336#65306
      end
      object Label8: TLabel
        Left = 94
        Top = 154
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = #24030'/'#30465#65306
      end
      object Label10: TLabel
        Left = 74
        Top = 184
        Width = 60
        Height = 13
        Alignment = taRightJustify
        Caption = #30005#35805#21495#30721#65306
      end
      object Label7: TLabel
        Left = 74
        Top = 125
        Width = 60
        Height = 13
        Alignment = taRightJustify
        Caption = #32593#19978#32534#21495#65306
      end
      object Label12: TLabel
        Left = 74
        Top = 214
        Width = 60
        Height = 13
        Alignment = taRightJustify
        Caption = #30005#23376#37038#20214#65306
      end
      object Label15: TLabel
        Left = 86
        Top = 355
        Width = 48
        Height = 13
        Alignment = taRightJustify
        Caption = #19994#21153#21592#65306
      end
      object Label16: TLabel
        Left = 62
        Top = 383
        Width = 72
        Height = 13
        Alignment = taRightJustify
        Caption = #22269#23478#25110#22320#21306#65306
      end
      object Label17: TLabel
        Left = 74
        Top = 411
        Width = 60
        Height = 13
        Alignment = taRightJustify
        Caption = #36135#24065#31867#22411#65306
      end
      object Label9: TLabel
        Left = 297
        Top = 154
        Width = 60
        Height = 13
        Alignment = taRightJustify
        Caption = #37038#25919#32534#30721#65306
      end
      object Label11: TLabel
        Left = 297
        Top = 184
        Width = 60
        Height = 13
        Alignment = taRightJustify
        Caption = #20256#30495#21495#30721#65306
      end
      object Label18: TLabel
        Left = 276
        Top = 355
        Width = 12
        Height = 13
        Caption = '    '
      end
      object Label19: TLabel
        Left = 276
        Top = 383
        Width = 149
        Height = 13
        AutoSize = False
      end
      object Label20: TLabel
        Left = 276
        Top = 411
        Width = 149
        Height = 13
        AutoSize = False
      end
      object Label5: TLabel
        Left = 42
        Top = 66
        Width = 92
        Height = 13
        Alignment = taRightJustify
        Caption = #23458#25143#21517#31216'('#33521#25991')'#65306
      end
      object Label13: TLabel
        Left = 98
        Top = 243
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = #32593#22336#65306
      end
      object Bevel2: TBevel
        Left = -2
        Top = 336
        Width = 533
        Height = 2
      end
      object Label116: TLabel
        Left = 80
        Top = 314
        Width = 40
        Height = 13
        Caption = #24320#21457#21592':'
      end
      object Label117: TLabel
        Left = 288
        Top = 313
        Width = 40
        Height = 13
        Caption = #36319#21333#21592':'
      end
      object RkyCustName: TRKeyRzBtnEdit
        Left = 136
        Top = 33
        Width = 337
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 1
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'CUSTOMER_NAME'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyAbbrname: TRKeyRzBtnEdit
        Left = 136
        Top = 92
        Width = 127
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 3
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'ABBR_NAME'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyState: TRKeyRzBtnEdit
        Left = 136
        Top = 150
        Width = 127
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 5
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'STATE'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyPhone: TRKeyRzBtnEdit
        Left = 136
        Top = 180
        Width = 127
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 7
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'PHONE'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyTelex: TRKeyRzBtnEdit
        Left = 136
        Top = 121
        Width = 127
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 4
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'TELEX'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyEmail: TRKeyRzBtnEdit
        Left = 136
        Top = 209
        Width = 337
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 9
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'GEN_EMAIL_ADDRESS'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyZip: TRKeyRzBtnEdit
        Left = 363
        Top = 153
        Width = 115
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 6
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'ZIP'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyFax: TRKeyRzBtnEdit
        Left = 358
        Top = 180
        Width = 115
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 8
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'FAX'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkySalesman: TRKeyRzBtnEdit
        Left = 136
        Top = 351
        Width = 105
        Height = 21
        Text = ''
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        ParentFont = False
        TabOrder = 14
        ButtonKind = bkFind
        DataSource = ds10
        DataSourceField = 'SALES_REP_PTR'
        DispalyTableName = 'data0005'
        DisplaytextField = 'EMPL_CODE'
        DisplayRetKeyField = 'rkey'
        DisplayNoteField = 'EMPLOYEE_NAME'
        DisplayPickID = '1'
        DisplayModID = 83
        ForceOnFocus = True
      end
      object RkyCountry: TRKeyRzBtnEdit
        Left = 136
        Top = 379
        Width = 105
        Height = 21
        Text = ''
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        ParentFont = False
        TabOrder = 15
        ButtonKind = bkFind
        DataSource = ds10
        DataSourceField = 'COUNTRY_PTR'
        DispalyTableName = 'data0250'
        DisplaytextField = 'country_code'
        DisplayRetKeyField = 'COUNTRY_RKEY'
        DisplayNoteField = 'country_name'
        DisplayPickID = '2'
        DisplayModID = 83
        ForceOnFocus = True
      end
      object RkyCurrency: TRKeyRzBtnEdit
        Left = 136
        Top = 407
        Width = 105
        Height = 21
        Text = ''
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        ParentFont = False
        TabOrder = 16
        ButtonKind = bkFind
        DataSource = ds10
        DataSourceField = 'CURRENCY_PTR'
        DispalyTableName = 'data0001'
        DisplaytextField = 'curr_code'
        DisplayRetKeyField = 'rkey'
        DisplayNoteField = 'curr_name'
        DisplayPickID = '3'
        DisplayModID = 83
        ForceOnFocus = True
      end
      object RkyCustcode: TRKeyRzBtnEdit
        Left = 136
        Top = 4
        Width = 126
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 0
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'CUST_CODE'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object DbmmAddress: TDBMemo
        Left = 136
        Top = 269
        Width = 337
        Height = 32
        DataField = 'BILLING_ADDRESS_1'
        DataSource = ds10
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        MaxLength = 100
        TabOrder = 11
      end
      object RkyCustName2: TRKeyRzBtnEdit
        Left = 136
        Top = 62
        Width = 337
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 2
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'BILLING_ADDRESS_4'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object DbchFzgkf: TDBCheckBox
        Left = 330
        Top = 6
        Width = 97
        Height = 17
        Caption = #38750#20027#31649#23458#25143
        DataField = 'EDI_IN_LOGGING'
        TabOrder = 18
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object Dbrdstatus: TDBRadioGroup
        Left = 24
        Top = 440
        Width = 480
        Height = 46
        Caption = #23458#25143#29366#24577
        Columns = 4
        DataField = 'CUSTOMER_TYPE'
        DataSource = ds10
        Items.Strings = (
          #27491#24120
          #26032#21512#20316
          #25511#21046
          #20572#27490)
        TabOrder = 17
        TabStop = True
        Values.Strings = (
          '1'
          '2'
          '3'
          '4')
      end
      object RkyWeb: TRKeyRzBtnEdit
        Left = 136
        Top = 239
        Width = 337
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 10
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'BILLING_ADDRESS_2'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyDeveloper: TRKeyRzBtnEdit
        Left = 136
        Top = 309
        Width = 121
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 12
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'ANALYSIS_CODE4'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyOrdersuper: TRKeyRzBtnEdit
        Left = 344
        Top = 309
        Width = 121
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 13
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'ANALYSIS_CODE5'
        DisplayModID = 0
        ForceOnFocus = True
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = #35814#32454#20449#24687
      object Label21: TLabel
        Left = 48
        Top = 28
        Width = 60
        Height = 13
        Caption = #20027#35201#20135#21697#65306
      end
      object Label22: TLabel
        Left = 35
        Top = 62
        Width = 72
        Height = 13
        Caption = #27861#23450#20195#34920#20154#65306
      end
      object Label23: TLabel
        Left = 48
        Top = 96
        Width = 60
        Height = 13
        Caption = #30005#35805#21495#30721#65306
      end
      object Label24: TLabel
        Left = 280
        Top = 96
        Width = 60
        Height = 13
        Caption = #31227#21160#30005#35805#65306
      end
      object Label25: TLabel
        Left = 48
        Top = 130
        Width = 60
        Height = 13
        Caption = #20225#19994#24615#36136#65306
      end
      object Label26: TLabel
        Left = 280
        Top = 130
        Width = 60
        Height = 13
        Caption = #25104#31435#26085#26399#65306
      end
      object Label27: TLabel
        Left = 48
        Top = 164
        Width = 60
        Height = 13
        Caption = #21592#24037#20154#25968#65306
      end
      object Label28: TLabel
        Left = 280
        Top = 164
        Width = 60
        Height = 13
        Caption = #27880#20876#36164#37329#65306
      end
      object Label29: TLabel
        Left = 48
        Top = 198
        Width = 60
        Height = 13
        Caption = #26376#38144#21806#39069#65306
      end
      object Label30: TLabel
        Left = 272
        Top = 198
        Width = 67
        Height = 13
        Caption = 'PCB'#26376#29992#37327#65306
      end
      object Label31: TLabel
        Left = 48
        Top = 254
        Width = 60
        Height = 13
        Caption = #21378#25151#36164#20135#65306
      end
      object Label32: TLabel
        Left = 22
        Top = 288
        Width = 84
        Height = 13
        Caption = #22266#23450#36164#20135#35268#27169#65306
      end
      object Label33: TLabel
        Left = 22
        Top = 318
        Width = 84
        Height = 13
        Caption = #24320#22987#21512#20316#26085#26399#65306
      end
      object Label34: TLabel
        Left = 47
        Top = 226
        Width = 60
        Height = 13
        Caption = #21407#20379#24212#21830#65306
      end
      object Label35: TLabel
        Left = 22
        Top = 377
        Width = 84
        Height = 13
        Caption = #38144#21806#22870#37329#20998#37197#65306
      end
      object Label36: TLabel
        Left = 240
        Top = 376
        Width = 17
        Height = 13
        Caption = '%  '
      end
      object Label37: TLabel
        Left = 48
        Top = 348
        Width = 60
        Height = 13
        Caption = #32467#36134#26085#26399#65306
      end
      object Bevel1: TBevel
        Left = 16
        Top = 445
        Width = 481
        Height = 40
        Shape = bsFrame
      end
      object RkyMainPro: TRKeyRzBtnEdit
        Left = 112
        Top = 24
        Width = 361
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 0
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'EDI_ID'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyLegal: TRKeyRzBtnEdit
        Left = 112
        Top = 58
        Width = 121
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 1
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'BILLING_ADDRESS_3'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyLegaltel: TRKeyRzBtnEdit
        Left = 112
        Top = 92
        Width = 121
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 2
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'OUTGOING_FORM_ADDR2'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyLegalphone: TRKeyRzBtnEdit
        Left = 352
        Top = 92
        Width = 121
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 3
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'OUTGOING_FORM_ADDR3'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyNature: TRKeyRzBtnEdit
        Left = 112
        Top = 126
        Width = 121
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 4
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'OUTGOING_FORM_ADDR1'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyQtyStaff: TRKeyRzBtnEdit
        Left = 112
        Top = 160
        Width = 121
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 6
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'SMOOTHING_THRESHOLD'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyFund: TRKeyRzBtnEdit
        Left = 352
        Top = 160
        Width = 121
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 7
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'CAPITAL'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyMonthsale: TRKeyRzBtnEdit
        Left = 112
        Top = 194
        Width = 121
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 8
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'MONTH_AMOUNT'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyPcbuse: TRKeyRzBtnEdit
        Left = 352
        Top = 194
        Width = 121
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 9
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'MONTH_PCBAMOUNT'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyFixedAssets: TRKeyRzBtnEdit
        Left = 112
        Top = 284
        Width = 121
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 12
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'FIXED_SCOPE'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyOldsupp: TRKeyRzBtnEdit
        Left = 111
        Top = 222
        Width = 361
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 10
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'OUTGOING_FORM_NAME'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyAllocation: TRKeyRzBtnEdit
        Left = 112
        Top = 373
        Width = 121
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 15
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'SALES_DISCOUNT'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object DcbxAssets: TDBComboBox
        Left = 112
        Top = 250
        Width = 121
        Height = 21
        DataField = 'INVOICE_NOTE_PAD_PTR'
        DataSource = ds10
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        Items.Strings = (
          #33258#24314
          #31199#36161)
        TabOrder = 11
      end
      object DbckSfzc: TDBCheckBox
        Left = 208
        Top = 456
        Width = 80
        Height = 17
        Caption = #26159#21542#36716#21378
        DataField = 'EDI_FLAG_FOR_SOACK'
        DataSource = ds10
        TabOrder = 16
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object RkyCheckdate: TRKeyRzBtnEdit
        Left = 112
        Top = 344
        Width = 65
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 14
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'EDI_FLAG_CREDIT_MEMO'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object DbdtBegindate: TDBDateTimeEditEh
        Left = 112
        Top = 314
        Width = 121
        Height = 21
        DataField = 'CUST_ENT_DATE'
        DataSource = ds10
        DynProps = <>
        EditButtons = <>
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        Kind = dtkDateEh
        TabOrder = 13
        Visible = True
      end
      object DdtActivedate: TDBDateTimeEditEh
        Left = 352
        Top = 126
        Width = 121
        Height = 21
        DataField = 'LAST_ACTIVE_DATE'
        DynProps = <>
        EditButtons = <>
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        Kind = dtkDateEh
        TabOrder = 5
        Visible = True
      end
      object DbckJsfs: TDBCheckBox
        Left = 308
        Top = 455
        Width = 97
        Height = 17
        Caption = #23492#21806#26041#24335
        DataField = 'DO_SMOOTHING'
        DataSource = ds10
        TabOrder = 17
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DbckAqjh: TDBCheckBox
        Left = 72
        Top = 457
        Width = 129
        Height = 17
        Caption = #32477#23545#20445#35777#25353#26399#20132#36135
        DataField = 'CONSUME_FORECASTS'
        DataSource = ds10
        TabOrder = 18
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DbrdWorktype: TDBRadioGroup
        Left = 256
        Top = 248
        Width = 217
        Height = 185
        Caption = #21512#20316#31867#22411
        DataField = 'LANGUAGE_FLAG'
        DataSource = ds10
        Items.Strings = (
          'A:'#20869#38144#24320#21333
          'B:'#20869#38144#19981#24320#21333
          'C:'#30452#25509#20986#21475
          'D:'#36716#21378#20986#21475
          'E:'#22996#25176#21152#24037#24320#21333
          'F:'#22996#25176#21152#24037#19981#24320#21333
          'H:'#24555#36882#20986#21475)
        TabOrder = 19
        Values.Strings = (
          'A'
          'B'
          'C'
          'D'
          'E'
          'F'
          'H')
      end
      object Dbckbaojia: TDBCheckBox
        Left = 114
        Top = 403
        Width = 135
        Height = 17
        Caption = #35746#21333#20215#26684#19982#25253#20215#20851#32852
        DataField = 'quote_flag'
        DataSource = ds10
        TabOrder = 20
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = #36130#21153#20449#24687
      ExplicitWidth = 0
      ExplicitHeight = 0
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 517
        Height = 269
        Align = alClient
        Caption = #36130#21153#20449#24687
        TabOrder = 0
        object Label38: TLabel
          Left = 35
          Top = 23
          Width = 60
          Height = 13
          Caption = #20184#27454#26041#24335#65306
        end
        object Label39: TLabel
          Left = 260
          Top = 23
          Width = 96
          Height = 13
          Caption = #29616#37329#25240#25187#30334#20998#27604#65306
        end
        object Label40: TLabel
          Left = 456
          Top = 23
          Width = 21
          Height = 13
          Caption = '%  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label41: TLabel
          Left = 299
          Top = 49
          Width = 60
          Height = 13
          Caption = #25240#25187#22825#25968#65306
        end
        object Label42: TLabel
          Left = 299
          Top = 75
          Width = 60
          Height = 13
          Caption = #26376#32467#22825#25968#65306
        end
        object Label43: TLabel
          Left = 260
          Top = 101
          Width = 96
          Height = 13
          Caption = #26410#20184#27454#26368#22810#36229#26399#65306
        end
        object Label44: TLabel
          Left = 456
          Top = 101
          Width = 18
          Height = 13
          Caption = #22825'  '
        end
        object Label45: TLabel
          Left = 40
          Top = 133
          Width = 54
          Height = 13
          Caption = 'A/R'#36134#30446#65306
        end
        object Label46: TLabel
          Left = 264
          Top = 133
          Width = 3
          Height = 13
        end
        object Label47: TLabel
          Left = 35
          Top = 49
          Width = 60
          Height = 13
          Caption = #20449#29992#31561#32423#65306
        end
        object Label48: TLabel
          Left = 35
          Top = 75
          Width = 60
          Height = 13
          Caption = #20449#29992#38480#39069#65306
        end
        object Label49: TLabel
          Left = 9
          Top = 101
          Width = 84
          Height = 13
          Caption = #25253#20215#25215#21463#33021#21147#65306
        end
        object Label50: TLabel
          Left = 176
          Top = 101
          Width = 21
          Height = 13
          Caption = '%  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label72: TLabel
          Left = 259
          Top = 166
          Width = 60
          Height = 13
          Caption = #21457#31080#31867#22411#65306
        end
        object Label75: TLabel
          Left = 14
          Top = 197
          Width = 76
          Height = 13
          Alignment = taRightJustify
          Caption = #30003#35831#20445#38505#37329#39069':'
        end
        object Label118: TLabel
          Left = 281
          Top = 196
          Width = 76
          Height = 13
          Alignment = taRightJustify
          Caption = #25209#20934#20445#38505#37329#39069':'
        end
        object RkyPayment: TRKeyRzBtnEdit
          Left = 95
          Top = 18
          Width = 153
          Height = 21
          Text = ''
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          TabOrder = 0
          ButtonKind = bkFind
          ButtonVisible = False
          DataSource = ds10
          DataSourceField = 'SALES_DISCOUNT'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object RkyCashcount: TRKeyRzBtnEdit
          Left = 360
          Top = 19
          Width = 81
          Height = 21
          Text = ''
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          TabOrder = 4
          ButtonKind = bkFind
          ButtonVisible = False
          DataSource = ds10
          DataSourceField = 'DISCOUNT_PCT'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object RkyCountDays: TRKeyRzBtnEdit
          Left = 360
          Top = 45
          Width = 81
          Height = 21
          Text = ''
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          TabOrder = 5
          ButtonKind = bkFind
          ButtonVisible = False
          DataSource = ds10
          DataSourceField = 'DISCOUNT_DAYS'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object RkyPaydays: TRKeyRzBtnEdit
          Left = 360
          Top = 71
          Width = 81
          Height = 21
          Text = ''
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          TabOrder = 6
          ButtonKind = bkFind
          ButtonVisible = False
          DataSource = ds10
          DataSourceField = 'NET_PAY'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object RkyLimtpaydays: TRKeyRzBtnEdit
          Left = 360
          Top = 97
          Width = 81
          Height = 21
          Text = ''
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          TabOrder = 7
          ButtonKind = bkFind
          ButtonVisible = False
          DataSource = ds10
          DataSourceField = 'INVOICE_NOTE_PAD_PTR'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object RkyCreditline: TRKeyRzBtnEdit
          Left = 96
          Top = 71
          Width = 105
          Height = 21
          Text = ''
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          TabOrder = 2
          ButtonKind = bkFind
          ButtonVisible = False
          DataSource = ds10
          DataSourceField = 'CREDIT_LIMIT'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object RkyHprice: TRKeyRzBtnEdit
          Left = 97
          Top = 98
          Width = 73
          Height = 21
          Text = ''
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          TabOrder = 3
          ButtonKind = bkFind
          ButtonVisible = False
          DataSource = ds10
          DataSourceField = 'quote_factor'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object ComboBox1: TComboBox
          Left = 96
          Top = 45
          Width = 105
          Height = 21
          Style = csDropDownList
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ItemIndex = 2
          TabOrder = 1
          Text = #24046
          Items.Strings = (
            #20248
            #33391
            #24046)
        end
        object DbckFhbz: TDBCheckBox
          Left = 33
          Top = 220
          Width = 101
          Height = 17
          Caption = #27454#21040#21457#36135#26631#35782
          DataField = 'COD_FLAG'
          DataSource = ds10
          TabOrder = 9
          ValueChecked = 'Y'
          ValueUnchecked = 'N'
        end
        object RkyAccounts: TRKeyRzBtnEdit
          Left = 96
          Top = 129
          Width = 121
          Height = 21
          Text = ''
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          TabOrder = 8
          ButtonKind = bkFind
          DataSource = ds10
          DataSourceField = 'ACC_REC_PTR'
          DispalyTableName = 'data0103'
          DisplaytextField = 'gl_acc_number'
          DisplayRetKeyField = 'rkey'
          DisplayNoteField = 'gl_description'
          DisplayPickID = '4'
          DisplayModID = 83
          ForceOnFocus = True
        end
        object DbrdInvoiceEnd: TDBRadioGroup
          Left = 43
          Top = 156
          Width = 178
          Height = 35
          Caption = #21457#31080#21040#26399#26085#35745#31639#26041#27861
          Columns = 2
          DataField = 'REG_TAX_FIXED_UNUSED'
          DataSource = ds10
          Items.Strings = (
            #26376#32467
            #36135#21040)
          TabOrder = 10
          Values.Strings = (
            '0'
            '1')
        end
        object DbckIntax: TDBCheckBox
          Left = 270
          Top = 220
          Width = 72
          Height = 17
          Caption = #20215#26684#21547#31246
          DataField = 'EDI_FLAG_FOR_INVOICE'
          DataSource = ds10
          TabOrder = 11
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DbckYszltz: TDBCheckBox
          Left = 347
          Top = 220
          Width = 126
          Height = 17
          Caption = #24212#25910#24080#40836#30701#20449#36890#30693
          DataField = 'COFC_FILENAME'
          DataSource = ds10
          TabOrder = 12
          ValueChecked = 'Y'
          ValueUnchecked = 'N'
        end
        object Dbckhdfhxd: TDBCheckBox
          Left = 144
          Top = 220
          Width = 122
          Height = 17
          Caption = #27454#21040#21457#36135#36830#32493#19979#21333
          DataField = 'QUOTE_FACTOR1'
          DataSource = ds10
          TabOrder = 13
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DbcbInvoicetype: TDBComboBox
          Left = 320
          Top = 163
          Width = 122
          Height = 21
          DataField = 'INVOICE_TYPE'
          DataSource = ds10
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          Items.Strings = (
            #26222#36890#21457#31080
            #22686#20540#31246#19987#29992#21457#31080
            #22686#20540#31246#26222#36890#21457#31080
            'Invoice')
          TabOrder = 14
        end
        object RkyApplymoney: TRKeyRzBtnEdit
          Left = 95
          Top = 194
          Width = 121
          Height = 21
          Text = ''
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          TabOrder = 15
          ButtonKind = bkFind
          ButtonVisible = False
          DataSource = ds10
          DataSourceField = 'HIGH_BALANCE'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object RkyApprovemoney: TRKeyRzBtnEdit
          Left = 362
          Top = 193
          Width = 121
          Height = 21
          Text = ''
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          TabOrder = 16
          ButtonKind = bkFind
          ButtonVisible = False
          DataSource = ds10
          DataSourceField = 'BALANCE_DUE'
          DisplayModID = 0
          ForceOnFocus = True
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 269
        Width = 517
        Height = 249
        Align = alBottom
        Caption = #21508#37096#38376#32771#26680#35780#35821
        TabOrder = 1
        object Label53: TLabel
          Left = 55
          Top = 123
          Width = 72
          Height = 13
          Caption = #24314#35758#26376#20449#29992#39069
        end
        object Label54: TLabel
          Left = 134
          Top = 123
          Width = 32
          Height = 13
          Caption = '('#19975#20803')'
        end
        object Label55: TLabel
          Left = 176
          Top = 123
          Width = 60
          Height = 13
          Caption = #26368#39640#27424#27454#39069
        end
        object Label56: TLabel
          Left = 240
          Top = 123
          Width = 32
          Height = 13
          Caption = '('#19975#20803')'
        end
        object Label57: TLabel
          Left = 20
          Top = 20
          Width = 48
          Height = 13
          Caption = #19994#21153#21592#65306
        end
        object Label58: TLabel
          Left = 20
          Top = 46
          Width = 48
          Height = 13
          Caption = #24066#22330#37096#65306
        end
        object Label59: TLabel
          Left = 20
          Top = 72
          Width = 48
          Height = 13
          Caption = #36130#21153#37096#65306
        end
        object Label60: TLabel
          Left = 20
          Top = 99
          Width = 48
          Height = 13
          Caption = #24635#32463#21150#65306
        end
        object Label61: TLabel
          Left = 306
          Top = 123
          Width = 48
          Height = 13
          Caption = #35780#23457#31614#21517
        end
        object Label62: TLabel
          Left = 422
          Top = 123
          Width = 48
          Height = 13
          Caption = #35780#23457#26085#26399
        end
        object Label63: TLabel
          Left = 20
          Top = 146
          Width = 48
          Height = 13
          Caption = #19994#21153#21592#65306
        end
        object Label64: TLabel
          Left = 20
          Top = 173
          Width = 48
          Height = 13
          Caption = #24066#22330#37096#65306
        end
        object Label65: TLabel
          Left = 20
          Top = 200
          Width = 48
          Height = 13
          Caption = #36130#21153#37096#65306
        end
        object Label66: TLabel
          Left = 20
          Top = 227
          Width = 48
          Height = 13
          Caption = #24635#32463#21150#65306
        end
        object RkySalesremark: TRKeyRzBtnEdit
          Left = 68
          Top = 16
          Width = 425
          Height = 21
          Text = ''
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          TabOrder = 0
          ButtonKind = bkFind
          ButtonVisible = False
          DataSource = ds10
          DataSourceField = 'REP_EVAL'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object RkyMaketremark: TRKeyRzBtnEdit
          Left = 68
          Top = 42
          Width = 425
          Height = 21
          Text = ''
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          TabOrder = 1
          ButtonKind = bkFind
          ButtonVisible = False
          DataSource = ds10
          DataSourceField = 'MAK_EVAL'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object RkyFinanceremark: TRKeyRzBtnEdit
          Left = 68
          Top = 69
          Width = 425
          Height = 21
          Text = ''
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          TabOrder = 2
          ButtonKind = bkFind
          ButtonVisible = False
          DataSource = ds10
          DataSourceField = 'FIN_EVAL'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object RkyHeadremark: TRKeyRzBtnEdit
          Left = 68
          Top = 95
          Width = 425
          Height = 21
          Text = ''
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          TabOrder = 3
          ButtonKind = bkFind
          ButtonVisible = False
          DataSource = ds10
          DataSourceField = 'MARMANG_EVAL'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object RkyComment1: TRKeyRzBtnEdit
          Left = 68
          Top = 142
          Width = 89
          Height = 21
          Text = ''
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          TabOrder = 4
          ButtonKind = bkFind
          ButtonVisible = False
          DataSource = ds10
          DataSourceField = 'REP_CREDIT'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object RkyComment4: TRKeyRzBtnEdit
          Left = 68
          Top = 169
          Width = 89
          Height = 21
          Text = ''
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          TabOrder = 8
          ButtonKind = bkFind
          ButtonVisible = False
          DataSource = ds10
          DataSourceField = 'MAK_CREDIT'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object RkyComment7: TRKeyRzBtnEdit
          Left = 68
          Top = 196
          Width = 89
          Height = 21
          Text = ''
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          TabOrder = 12
          ButtonKind = bkFind
          ButtonVisible = False
          DataSource = ds10
          DataSourceField = 'FIN_CREDIT'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object RkyComment10: TRKeyRzBtnEdit
          Left = 68
          Top = 223
          Width = 89
          Height = 21
          Text = ''
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          TabOrder = 16
          ButtonKind = bkFind
          ButtonVisible = False
          DataSource = ds10
          DataSourceField = 'MARMANG_CREDIT'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object RkyComment2: TRKeyRzBtnEdit
          Left = 178
          Top = 142
          Width = 89
          Height = 21
          Text = ''
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          TabOrder = 5
          ButtonKind = bkFind
          ButtonVisible = False
          DataSource = ds10
          DataSourceField = 'REP_HIGH'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object RkyComment5: TRKeyRzBtnEdit
          Left = 178
          Top = 169
          Width = 89
          Height = 21
          Text = ''
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          TabOrder = 9
          ButtonKind = bkFind
          ButtonVisible = False
          DataSource = ds10
          DataSourceField = 'MAK_HIGH'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object RkyComment8: TRKeyRzBtnEdit
          Left = 178
          Top = 196
          Width = 89
          Height = 21
          Text = ''
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          TabOrder = 13
          ButtonKind = bkFind
          ButtonVisible = False
          DataSource = ds10
          DataSourceField = 'FIN_HIGH'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object RkyComment11: TRKeyRzBtnEdit
          Left = 178
          Top = 223
          Width = 89
          Height = 21
          Text = ''
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          TabOrder = 17
          ButtonKind = bkFind
          ButtonVisible = False
          DataSource = ds10
          DataSourceField = 'MARMANG_HIGH'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object RkyComment3: TRKeyRzBtnEdit
          Left = 288
          Top = 142
          Width = 89
          Height = 21
          Text = ''
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          TabOrder = 6
          ButtonKind = bkFind
          ButtonVisible = False
          DataSource = ds10
          DataSourceField = 'REP_NAME'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object RkyComment6: TRKeyRzBtnEdit
          Left = 288
          Top = 169
          Width = 89
          Height = 21
          Text = ''
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          TabOrder = 10
          ButtonKind = bkFind
          ButtonVisible = False
          DataSource = ds10
          DataSourceField = 'MAK_NAME'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object RkyComment9: TRKeyRzBtnEdit
          Left = 288
          Top = 196
          Width = 89
          Height = 21
          Text = ''
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          TabOrder = 14
          ButtonKind = bkFind
          ButtonVisible = False
          DataSource = ds10
          DataSourceField = 'FIN_NAME'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object RkyComment12: TRKeyRzBtnEdit
          Left = 288
          Top = 223
          Width = 89
          Height = 21
          Text = ''
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          TabOrder = 18
          ButtonKind = bkFind
          ButtonVisible = False
          DataSource = ds10
          DataSourceField = 'MARMANG_NAME'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object DBDateTimeEh3: TDBDateTimeEditEh
          Left = 398
          Top = 142
          Width = 101
          Height = 21
          DataField = 'REP_DATE'
          DynProps = <>
          EditButtons = <>
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          Kind = dtkDateEh
          TabOrder = 7
          Visible = True
        end
        object DBDateTimeEh4: TDBDateTimeEditEh
          Left = 398
          Top = 169
          Width = 101
          Height = 21
          DataField = 'MAK_DATE'
          DynProps = <>
          EditButtons = <>
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          Kind = dtkDateEh
          TabOrder = 11
          Visible = True
        end
        object DBDateTimeEh5: TDBDateTimeEditEh
          Left = 398
          Top = 196
          Width = 101
          Height = 21
          DataField = 'FIN_DATE'
          DynProps = <>
          EditButtons = <>
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          Kind = dtkDateEh
          TabOrder = 15
          Visible = True
        end
        object DBDateTimeEh6: TDBDateTimeEditEh
          Left = 398
          Top = 223
          Width = 101
          Height = 21
          DataField = 'MARMANG_DATE'
          DynProps = <>
          EditButtons = <>
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          Kind = dtkDateEh
          TabOrder = 19
          Visible = True
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = #21382#21490#20449#24687
      ExplicitWidth = 0
      ExplicitHeight = 0
      object GroupBox3: TGroupBox
        Left = 8
        Top = 5
        Width = 513
        Height = 173
        Caption = #21382#21490#20449#24687#35760#24405
        TabOrder = 0
        object Label67: TLabel
          Left = 32
          Top = 24
          Width = 96
          Height = 13
          Caption = #31532#19968#24352#38144#21806#35746#21333#65306
        end
        object Label68: TLabel
          Left = 58
          Top = 60
          Width = 72
          Height = 13
          Caption = #31532#19968#24352#21457#31080#65306
        end
        object Label69: TLabel
          Left = 19
          Top = 104
          Width = 108
          Height = 13
          Caption = #26368#21518#19968#24352#38144#21806#35746#21333#65306
        end
        object Label70: TLabel
          Left = 45
          Top = 140
          Width = 84
          Height = 13
          Caption = #26368#21518#19968#24352#21457#31080#65306
        end
        object RkyLastInvoice: TRKeyRzBtnEdit
          Left = 144
          Top = 136
          Width = 329
          Height = 21
          Text = ''
          AutoSize = False
          Color = clInfoBk
          FocusColor = clMenu
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ReadOnly = True
          TabOrder = 0
          ButtonKind = bkFind
          ButtonVisible = False
          DisplayModID = 0
          ForceOnFocus = True
        end
        object RkyLastOrder: TRKeyRzBtnEdit
          Left = 144
          Top = 100
          Width = 329
          Height = 21
          Text = ''
          AutoSize = False
          Color = clInfoBk
          FocusColor = clMenu
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ReadOnly = True
          TabOrder = 1
          ButtonKind = bkFind
          ButtonVisible = False
          DisplayModID = 0
          ForceOnFocus = True
        end
        object RkyFirstInvoice: TRKeyRzBtnEdit
          Left = 144
          Top = 56
          Width = 329
          Height = 21
          Text = ''
          AutoSize = False
          Color = clInfoBk
          FocusColor = clMenu
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ReadOnly = True
          TabOrder = 2
          ButtonKind = bkFind
          ButtonVisible = False
          DisplayModID = 0
          ForceOnFocus = True
        end
        object RkyFirstOrder: TRKeyRzBtnEdit
          Left = 144
          Top = 20
          Width = 329
          Height = 21
          Text = ''
          AutoSize = False
          Color = clInfoBk
          FocusColor = clMenu
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ReadOnly = True
          TabOrder = 3
          ButtonKind = bkFind
          ButtonVisible = False
          DisplayModID = 0
          ForceOnFocus = True
        end
      end
      object GroupBox4: TGroupBox
        Left = 8
        Top = 183
        Width = 513
        Height = 314
        Caption = #29992#25143#33258#23450#20041#20449#24687
        TabOrder = 1
        object Label71: TLabel
          Left = 10
          Top = 26
          Width = 144
          Height = 13
          Caption = #21253#35013#26631#31614#23458#25143#25253#34920#25991#20214#21517#65306
        end
        object Label73: TLabel
          Left = 36
          Top = 74
          Width = 120
          Height = 13
          Caption = #26412#21378#32534#21495#23458#25143#35782#21035#30721#65306
        end
        object Label52: TLabel
          Left = 18
          Top = 143
          Width = 108
          Height = 13
          Caption = #25163#26426#30701#20449#25509#25910#20154#21592#65306
        end
        object Label74: TLabel
          Left = 50
          Top = 50
          Width = 108
          Height = 13
          Caption = #21253#35013#26631#31614#23458#20379#20195#30721#65306
        end
        object SGrid: TStringGrid
          Left = 16
          Top = 164
          Width = 482
          Height = 138
          ColCount = 4
          FixedCols = 0
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
          PopupMenu = PopupMenu1
          TabOrder = 3
        end
        object RkyBbname: TRKeyRzBtnEdit
          Left = 172
          Top = 22
          Width = 329
          Height = 21
          Text = ''
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          TabOrder = 0
          ButtonKind = bkFind
          ButtonVisible = False
          DataSource = ds10
          DataSourceField = 'ANALYSIS_CODE1'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object RkyPackcode: TRKeyRzBtnEdit
          Left = 171
          Top = 46
          Width = 329
          Height = 21
          Text = ''
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          TabOrder = 1
          ButtonKind = bkFind
          ButtonVisible = False
          DataSource = ds10
          DataSourceField = 'ANALYSIS_CODE2'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object RkyManucode: TRKeyRzBtnEdit
          Left = 171
          Top = 70
          Width = 329
          Height = 21
          Text = ''
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          TabOrder = 2
          ButtonKind = bkFind
          ButtonVisible = False
          DataSource = ds10
          DataSourceField = 'ANALYSIS_CODE3'
          DisplayModID = 0
          ForceOnFocus = True
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = #32852#32476#20154#21592
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Bevel3: TBevel
        Left = 16
        Top = 8
        Width = 497
        Height = 73
      end
      object Bevel4: TBevel
        Left = 16
        Top = 90
        Width = 497
        Height = 73
      end
      object Bevel5: TBevel
        Left = 16
        Top = 173
        Width = 497
        Height = 73
      end
      object Bevel6: TBevel
        Left = 16
        Top = 255
        Width = 497
        Height = 73
      end
      object Bevel7: TBevel
        Left = 16
        Top = 338
        Width = 497
        Height = 73
      end
      object Label76: TLabel
        Left = 46
        Top = 22
        Width = 72
        Height = 13
        Caption = #19994#21153#32852#31995#20154#65306
      end
      object Label77: TLabel
        Left = 291
        Top = 22
        Width = 60
        Height = 13
        Caption = #32852#31995#30005#35805#65306
      end
      object Label78: TLabel
        Left = 33
        Top = 54
        Width = 84
        Height = 13
        Caption = #30005#23376#37038#20214#22320#22336#65306
      end
      object Label79: TLabel
        Left = 33
        Top = 136
        Width = 84
        Height = 13
        Caption = #30005#23376#37038#20214#22320#22336#65306
      end
      object Label80: TLabel
        Left = 46
        Top = 104
        Width = 72
        Height = 13
        Caption = #24037#31243#32852#31995#20154#65306
      end
      object Label81: TLabel
        Left = 291
        Top = 104
        Width = 60
        Height = 13
        Caption = #32852#31995#30005#35805#65306
      end
      object Label82: TLabel
        Left = 46
        Top = 188
        Width = 72
        Height = 13
        Caption = #21697#31649#32852#31995#20154#65306
      end
      object Label83: TLabel
        Left = 33
        Top = 220
        Width = 84
        Height = 13
        Caption = #30005#23376#37038#20214#22320#22336#65306
      end
      object Label84: TLabel
        Left = 291
        Top = 188
        Width = 60
        Height = 13
        Caption = #32852#31995#30005#35805#65306
      end
      object Label85: TLabel
        Left = 46
        Top = 270
        Width = 72
        Height = 13
        Caption = #36130#21153#32852#31995#20154#65306
      end
      object Label86: TLabel
        Left = 33
        Top = 302
        Width = 84
        Height = 13
        Caption = #30005#23376#37038#20214#22320#22336#65306
      end
      object Label87: TLabel
        Left = 291
        Top = 270
        Width = 60
        Height = 13
        Caption = #32852#31995#30005#35805#65306
      end
      object Label88: TLabel
        Left = 46
        Top = 353
        Width = 72
        Height = 13
        Caption = #25253#20851#32852#31995#20154#65306
      end
      object Label89: TLabel
        Left = 33
        Top = 385
        Width = 84
        Height = 13
        Caption = #30005#23376#37038#20214#22320#22336#65306
      end
      object Label90: TLabel
        Left = 291
        Top = 353
        Width = 60
        Height = 13
        Caption = #32852#31995#30005#35805#65306
      end
      object Bevel8: TBevel
        Left = 16
        Top = 421
        Width = 497
        Height = 73
      end
      object Label91: TLabel
        Left = 46
        Top = 435
        Width = 67
        Height = 13
        Caption = 'IQC'#32852#31995#20154#65306
      end
      object Label92: TLabel
        Left = 33
        Top = 467
        Width = 84
        Height = 13
        Caption = #30005#23376#37038#20214#22320#22336#65306
      end
      object Label93: TLabel
        Left = 291
        Top = 435
        Width = 60
        Height = 13
        Caption = #32852#31995#30005#35805#65306
      end
      object RkyContactphone1: TRKeyRzBtnEdit
        Left = 357
        Top = 18
        Width = 137
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 17
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'CONT_PHONE_1'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyContact1: TRKeyRzBtnEdit
        Left = 125
        Top = 18
        Width = 137
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 0
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'CONTACT_NAME_1'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyContactemail1: TRKeyRzBtnEdit
        Left = 125
        Top = 50
        Width = 369
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 1
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'EMAIL_FOR_CONTACT1'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyContactemail2: TRKeyRzBtnEdit
        Left = 125
        Top = 132
        Width = 369
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 4
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'EMAIL_FOR_CONTACT2'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyContact2: TRKeyRzBtnEdit
        Left = 125
        Top = 100
        Width = 137
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 2
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'CONTACT_NAME_2'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyContactphone2: TRKeyRzBtnEdit
        Left = 357
        Top = 100
        Width = 137
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 3
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'CONT_PHONE_2'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyContact3: TRKeyRzBtnEdit
        Left = 125
        Top = 184
        Width = 137
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 5
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'CONTACT_NAME_3'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyContactemail3: TRKeyRzBtnEdit
        Left = 125
        Top = 216
        Width = 369
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 7
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'EMAIL_FOR_CONTACT3'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyContactphone3: TRKeyRzBtnEdit
        Left = 357
        Top = 184
        Width = 137
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 6
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'CONT_PHONE_3'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyContact4: TRKeyRzBtnEdit
        Left = 125
        Top = 266
        Width = 137
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 8
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'CONTACT_NAME_4'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyContactemail4: TRKeyRzBtnEdit
        Left = 125
        Top = 298
        Width = 369
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 10
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'EMAIL_FOR_CONTACT4'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyContactphone4: TRKeyRzBtnEdit
        Left = 357
        Top = 266
        Width = 137
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 9
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'CONT_PHONE_4'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyContact5: TRKeyRzBtnEdit
        Left = 125
        Top = 349
        Width = 137
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 11
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'CONTACT_NAME_5'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyContactemail5: TRKeyRzBtnEdit
        Left = 125
        Top = 381
        Width = 369
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 13
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'EMAIL_FOR_CONTACT5'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyContactphone5: TRKeyRzBtnEdit
        Left = 357
        Top = 349
        Width = 137
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 12
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'CONT_PHONE_5'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyContact6: TRKeyRzBtnEdit
        Left = 125
        Top = 431
        Width = 137
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 15
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'CONTACT_NAME_6'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyContactemail6: TRKeyRzBtnEdit
        Left = 125
        Top = 463
        Width = 369
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 14
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'EMAIL_FOR_CONTACT6'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyContactphone6: TRKeyRzBtnEdit
        Left = 357
        Top = 431
        Width = 137
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 16
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'CONT_PHONE_6'
        DisplayModID = 0
        ForceOnFocus = True
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = #35745#21010#23433#25490
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label94: TLabel
        Left = 8
        Top = 20
        Width = 84
        Height = 13
        Caption = #35745#21010#25552#21069#22825#25968#65306
      end
      object Label95: TLabel
        Left = 224
        Top = 20
        Width = 260
        Height = 13
        Caption = '('#35828#26126#65306#35745#21010#25490#31243#20132#36135#26399#27604#23458#25143#20132#36135#26399#30340#25552#21069#22825#25968')'
      end
      object Label96: TLabel
        Left = 8
        Top = 50
        Width = 84
        Height = 13
        Caption = #23458#25143#29305#21035#35201#27714#65306
      end
      object Label101: TLabel
        Left = 6
        Top = 292
        Width = 96
        Height = 13
        Caption = #19968#33324#20449#24687#35760#20107#26412#65306
      end
      object Memo1: TMemo
        Left = 8
        Top = 66
        Width = 513
        Height = 216
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        ScrollBars = ssVertical
        TabOrder = 1
      end
      object RkyPlanDays: TRKeyRzBtnEdit
        Left = 96
        Top = 16
        Width = 121
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 0
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds10
        DataSourceField = 'DAYS_EARLY_SCHEDULE'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object Memo2: TMemo
        Left = 6
        Top = 311
        Width = 513
        Height = 194
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        ScrollBars = ssVertical
        TabOrder = 2
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = #35013#36816#22320#28857
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label102: TLabel
        Left = 56
        Top = 78
        Width = 60
        Height = 13
        Caption = #35814#32454#22320#22336#65306
      end
      object Label103: TLabel
        Left = 75
        Top = 190
        Width = 40
        Height = 13
        Caption = #30465'/'#24030#65306
      end
      object Label104: TLabel
        Left = 296
        Top = 190
        Width = 60
        Height = 13
        Caption = #37038#25919#32534#30721#65306
      end
      object Label105: TLabel
        Left = 69
        Top = 230
        Width = 48
        Height = 13
        Caption = #32852#32476#20154#65306
      end
      object Label106: TLabel
        Left = 56
        Top = 271
        Width = 60
        Height = 13
        Caption = #30005#35805#21495#30721#65306
      end
      object Label107: TLabel
        Left = 296
        Top = 271
        Width = 60
        Height = 13
        Caption = #20256#30495#21495#30721#65306
      end
      object Label108: TLabel
        Left = 56
        Top = 392
        Width = 60
        Height = 13
        Caption = #30005#23376#37038#20214#65306
      end
      object Label109: TLabel
        Left = 26
        Top = 433
        Width = 76
        Height = 13
        Caption = 'Internet'#32593#22336#65306
      end
      object Label51: TLabel
        Left = 56
        Top = 311
        Width = 60
        Height = 13
        Caption = #35013#36816#26041#27861#65306
      end
      object Label110: TLabel
        Left = 270
        Top = 311
        Width = 84
        Height = 13
        Caption = #35013#36816#25552#21069#22825#25968#65306
      end
      object Label111: TLabel
        Left = 56
        Top = 352
        Width = 60
        Height = 13
        Caption = #21457#36135#22320#28857#65306
      end
      object Label112: TLabel
        Left = 296
        Top = 352
        Width = 60
        Height = 13
        Caption = #21040#36798#22320#28857#65306
      end
      object RkyShipDetAddress: TRKeyRzBtnEdit
        Left = 120
        Top = 74
        Width = 361
        Height = 89
        Text = ''
        AutoSize = False
        Color = clInfoBk
        FocusColor = clMenu
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        ReadOnly = True
        TabOrder = 0
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds12
        DataSourceField = 'SHIP_TO_ADDRESS_1'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyShipstate: TRKeyRzBtnEdit
        Left = 120
        Top = 186
        Width = 121
        Height = 21
        Text = ''
        Color = clInfoBk
        FocusColor = clMenu
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        ReadOnly = True
        TabOrder = 1
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds12
        DataSourceField = 'STATE'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyShipzip: TRKeyRzBtnEdit
        Left = 360
        Top = 186
        Width = 121
        Height = 21
        Text = ''
        Color = clInfoBk
        FocusColor = clMenu
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        ReadOnly = True
        TabOrder = 2
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds12
        DataSourceField = 'ZIP'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyShipcontact: TRKeyRzBtnEdit
        Left = 120
        Top = 226
        Width = 121
        Height = 21
        Text = ''
        Color = clInfoBk
        FocusColor = clMenu
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        ReadOnly = True
        TabOrder = 3
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds12
        DataSourceField = 'SHIP_TO_CONTACT'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyShipphone: TRKeyRzBtnEdit
        Left = 120
        Top = 267
        Width = 121
        Height = 21
        Text = ''
        Color = clInfoBk
        FocusColor = clMenu
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        ReadOnly = True
        TabOrder = 4
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds12
        DataSourceField = 'SHIP_TO_PHONE'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyShipFax: TRKeyRzBtnEdit
        Left = 360
        Top = 267
        Width = 121
        Height = 21
        Text = ''
        Color = clInfoBk
        FocusColor = clMenu
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        ReadOnly = True
        TabOrder = 5
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds12
        DataSourceField = 'SHIP_TO_FAX'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyShipEmail: TRKeyRzBtnEdit
        Left = 120
        Top = 388
        Width = 361
        Height = 21
        Text = ''
        Color = clInfoBk
        FocusColor = clMenu
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        ReadOnly = True
        TabOrder = 6
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds12
        DataSourceField = 'EMAIL_FOR_CONTACT'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyShipWeb: TRKeyRzBtnEdit
        Left = 120
        Top = 429
        Width = 361
        Height = 21
        Text = ''
        Color = clInfoBk
        FocusColor = clMenu
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        ReadOnly = True
        TabOrder = 7
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds12
        DataSourceField = 'SHIP_TO_ADDRESS_2'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object DbchMraddress: TDBCheckBox
        Left = 120
        Top = 37
        Width = 97
        Height = 17
        Caption = #40664#35748#35013#36816#22320#28857
        DataField = 'LANGUAGE_FLAG'
        DataSource = ds12
        ReadOnly = True
        TabOrder = 8
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
      end
      object RkyShipWay: TRKeyRzBtnEdit
        Left = 120
        Top = 307
        Width = 121
        Height = 21
        Text = ''
        Color = clInfoBk
        FocusColor = clMenu
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        ReadOnly = True
        TabOrder = 9
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds12
        DataSourceField = 'SHIP_SHIPPING_METHOD'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyShiptqdays: TRKeyRzBtnEdit
        Left = 360
        Top = 307
        Width = 121
        Height = 21
        Text = ''
        Color = clInfoBk
        FocusColor = clMenu
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        ReadOnly = True
        TabOrder = 10
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds12
        DataSourceField = 'SHIP_LEAD_TIME'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyBeginaddress: TRKeyRzBtnEdit
        Left = 120
        Top = 348
        Width = 121
        Height = 21
        Text = ''
        Color = clInfoBk
        FocusColor = clMenu
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        ReadOnly = True
        TabOrder = 11
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds12
        DataSourceField = 'LOCNAME_FOR_FORM'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyEndaddress: TRKeyRzBtnEdit
        Left = 360
        Top = 348
        Width = 121
        Height = 21
        Text = ''
        Color = clInfoBk
        FocusColor = clMenu
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        ReadOnly = True
        TabOrder = 12
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds12
        DataSourceField = 'SHP_ADDR1_FOR_FORM'
        DisplayModID = 0
        ForceOnFocus = True
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = #30456#20851#25991#26723
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label113: TLabel
        Left = 16
        Top = 299
        Width = 48
        Height = 13
        Caption = #25991#26723#21517#31216
      end
      object Label114: TLabel
        Left = 16
        Top = 328
        Width = 36
        Height = 13
        Caption = #22791'    '#27880
      end
      object BtnUpload: TSpeedButton
        Left = 432
        Top = 296
        Width = 34
        Height = 22
        Caption = #19978#36733
        Enabled = False
        OnClick = BtnUploadClick
      end
      object Label115: TLabel
        Left = 14
        Top = 428
        Width = 48
        Height = 13
        Caption = #23384#26723#26085#26399
      end
      object eh20: TDBGridEh
        Left = 0
        Top = 0
        Width = 517
        Height = 289
        Align = alTop
        DataSource = ds20
        DynProps = <>
        Flat = True
        FooterParams.Color = clWindow
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        PopupMenu = PM20
        ReadOnly = True
        TabOrder = 0
        Columns = <
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'file_name'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #25991#26723#21517#31216
            Width = 145
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'Indate'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #23384#26723#26085#26399
            Width = 90
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'remark'
            Footers = <>
            Title.Caption = #22791#27880
            Width = 269
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object RkyDocname: TRKeyRzBtnEdit
        Left = 72
        Top = 296
        Width = 361
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 1
        ButtonKind = bkFind
        ButtonVisible = False
        DataSource = ds20
        DataSourceField = 'file_name'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object DbmmRemark: TDBMemo
        Left = 72
        Top = 328
        Width = 424
        Height = 89
        DataField = 'remark'
        DataSource = ds20
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 2
      end
      object DbdtDocdate: TDBDateTimeEditEh
        Left = 72
        Top = 424
        Width = 137
        Height = 21
        DataField = 'Indate'
        DataSource = ds20
        DynProps = <>
        Enabled = False
        EditButtons = <>
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        Kind = dtkDateEh
        ReadOnly = True
        TabOrder = 3
        Visible = True
      end
    end
  end
  object PM1: TPopupMenu
    Left = 24
    Top = 360
    object N1: TMenuItem
      Caption = #28155#21152'(&N)'
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #32534#36753'(&E)'
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #21024#38500'(&D)'
      OnClick = N3Click
    end
  end
  object PM20: TPopupMenu
    OnPopup = PM20Popup
    Left = 56
    Top = 408
    object MenuItem1: TMenuItem
      Tag = 10
      Caption = #28155#21152'(&N)'
      OnClick = MenuItem1Click
    end
    object MenuItem2: TMenuItem
      Tag = 11
      Caption = #32534#36753'(&E)'
      OnClick = MenuItem1Click
    end
    object MenuItem3: TMenuItem
      Tag = 12
      Caption = #21024#38500'(&D)'
      OnClick = MenuItem1Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N5: TMenuItem
      Tag = 13
      Caption = #25171#24320#25991#26723
      OnClick = MenuItem1Click
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 120
    Top = 408
  end
  object ds10: TDataSource
    DataSet = cds10
    Left = 88
    Top = 224
  end
  object cds10: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select RKEY,CUST_CODE,CUSTOMER_NAME,ABBR_NAME,BILLING_ADDRESS_1,' +
      #13#10'BILLING_ADDRESS_2,BILLING_ADDRESS_3,STATE,ZIP,PHONE,FAX,TELEX,' +
      #13#10'SALES_REP_PTR,CURRENCY_PTR,INVOICE_NOTE_PAD_PTR,CONTACT_NAME_1' +
      ','#13#10'CONTACT_NAME_2,CONTACT_NAME_3,CONTACT_NAME_4,CONTACT_NAME_5,'#13 +
      #10'CONTACT_NAME_6,CONT_PHONE_1,CONT_PHONE_2,CONT_PHONE_3,CONT_PHON' +
      'E_4,'#13#10'CONT_PHONE_5,CONT_PHONE_6,FED_TAX_ID_NO,COD_FLAG,DISCOUNT_' +
      'PCT,'#13#10'CREDIT_LIMIT,CREDIT_RATING,DISCOUNT_DAYS,NET_PAY,LAST_ACTI' +
      'VE_DATE,'#13#10'BILLING_ADDRESS_4,COUNTRY_PTR,OUTGOING_FORM_NAME,OUTGO' +
      'ING_FORM_ADDR1,'#13#10'OUTGOING_FORM_ADDR2,OUTGOING_FORM_ADDR3,ANALYSI' +
      'S_CODE1,ANALYSIS_CODE2,'#13#10'ANALYSIS_CODE3,CUST_ENT_DATE,EDI_ID,EDI' +
      '_FLAG_FOR_SOACK,LANGUAGE_FLAG,'#13#10'EDI_FLAG_FOR_INVOICE,EDI_FLAG_CR' +
      'EDIT_MEMO,GEN_EMAIL_ADDRESS,'#13#10'EMAIL_FOR_CONTACT1,EMAIL_FOR_CONTA' +
      'CT2,EMAIL_FOR_CONTACT3,REG_TAX_FIXED_UNUSED,'#13#10'EMAIL_FOR_CONTACT4' +
      ',EMAIL_FOR_CONTACT5,EMAIL_FOR_CONTACT6,ACC_REC_PTR,'#13#10'DAYS_EARLY_' +
      'SCHEDULE,CUSTOMER_TYPE,DO_SMOOTHING,SMOOTHING_THRESHOLD,ANALYSIS' +
      '_CODE4,'#13#10'ANALYSIS_CODE5,EDI_IN_LOGGING,quote_factor,QUOTE_FACTOR' +
      '1,quote_flag ,'#13#10'REP_EVAL,MAK_EVAL,FIN_EVAL,COFC_FILENAME,HIGH_BA' +
      'LANCE,BALANCE_DUE,'#13#10'MARMANG_EVAL,REP_CREDIT,MAK_CREDIT,FIN_CREDI' +
      'T,MARMANG_CREDIT,REP_HIGH,'#13#10'MAK_HIGH,FIN_HIGH,MARMANG_HIGH,REP_N' +
      'AME,MAK_NAME,FIN_NAME,MARMANG_NAME,'#13#10'REP_DATE,MAK_DATE,FIN_DATE,' +
      'MARMANG_DATE,HOUSE_FIXED,FIXED_SCOPE,CONSUME_FORECASTS,'#13#10'SALES_D' +
      'ISCOUNT,MONTH_AMOUNT,MONTH_PCBAMOUNT,CAPITAL , APPLY_IN_TRANSIT ' +
      ', INVOICE_TYPE'#13#10'from Data0010'#13#10'where rkey= :ads10rkey'#13#10
    Params = <
      item
        DataType = ftUnknown
        Name = 'ads10rkey'
        ParamType = ptUnknown
      end>
    Left = 32
    Top = 216
  end
  object ds20: TDataSource
    DataSet = cds20
    Left = 552
    Top = 200
  end
  object cds20: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select  file_name, Indate, remark, RKEY, SOURCE_PTR'#13#10' from data0' +
      '020 where source_ptr=:rkey10'
    Params = <
      item
        DataType = ftUnknown
        Name = 'rkey10'
        ParamType = ptUnknown
      end>
    Left = 488
    Top = 200
  end
  object PopupMenu1: TPopupMenu
    Left = 671
    Top = 353
    object N6: TMenuItem
      Caption = #26032#22686
      OnClick = N6Click
    end
    object N8: TMenuItem
      Caption = #21024#38500
      OnClick = N8Click
    end
  end
  object ds12: TDataSource
    DataSet = cds12
    Left = 104
    Top = 288
  end
  object cds12: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 288
  end
  object cds04: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 152
    Top = 352
  end
  object cds248: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT     dbo.Data0248.RKEY, dbo.Data0248.CUST_PTR, dbo.Data024' +
      '8.sys_ptr, dbo.Data0248.position, dbo.Data0073.USER_FULL_NAME, '#13 +
      #10'                      dbo.Data0073.USER_LOGIN_NAME'#13#10'FROM       ' +
      '  dbo.Data0248 INNER JOIN'#13#10'                      dbo.Data0073 ON' +
      ' dbo.Data0248.sys_ptr = dbo.Data0073.RKEY'#13#10'where  dbo.Data0248.C' +
      'UST_PTR = :rkey'#13#10
    Params = <
      item
        DataType = ftUnknown
        Name = 'rkey'
        ParamType = ptUnknown
      end>
    Left = 440
    Top = 200
  end
  object cdstmp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 192
  end
  object cds318: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 440
    Top = 272
  end
  object cds248_2: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT     dbo.Data0248.RKEY, dbo.Data0248.CUST_PTR, dbo.Data024' +
      '8.sys_ptr, dbo.Data0248.position, dbo.Data0073.USER_FULL_NAME, '#13 +
      #10'                      dbo.Data0073.USER_LOGIN_NAME'#13#10'FROM       ' +
      '  dbo.Data0248 INNER JOIN'#13#10'                      dbo.Data0073 ON' +
      ' dbo.Data0248.sys_ptr = dbo.Data0073.RKEY'#13#10'where  dbo.Data0248.C' +
      'UST_PTR = :rkey'#13#10
    Params = <
      item
        DataType = ftUnknown
        Name = 'rkey'
        ParamType = ptUnknown
      end>
    Left = 384
    Top = 200
  end
end
