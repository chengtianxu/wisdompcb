inherited FrmEditAddr_Mod83: TFrmEditAddr_Mod83
  Caption = #23458#25143#35013#36816#22320#22336
  ClientHeight = 470
  ClientWidth = 671
  ExplicitTop = 8
  ExplicitWidth = 679
  ExplicitHeight = 497
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 671
    Height = 470
    ExplicitWidth = 676
    ExplicitHeight = 491
    inherited pnl1: TPanel
      Width = 669
      ExplicitWidth = 674
      object Label1: TLabel [0]
        Left = 182
        Top = 9
        Width = 60
        Height = 13
        Alignment = taRightJustify
        Caption = #23458#25143#20195#30721#65306
      end
      object Label39: TLabel [1]
        Left = 339
        Top = 9
        Width = 60
        Height = 13
        Alignment = taRightJustify
        Caption = #23458#25143#21517#31216#65306
      end
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
      inherited btnSaveAll: TBitBtn
        Left = 201
        ExplicitLeft = 201
      end
      inherited btnCheck: TBitBtn
        Left = 141
        ExplicitLeft = 141
      end
      inherited btnPrint: TBitBtn
        Left = 171
        ExplicitLeft = 171
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
      object RkyCustomerCode: TRKeyRzBtnEdit
        Left = 237
        Top = 7
        Width = 100
        Height = 21
        Text = ''
        Color = clInfoBk
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        ReadOnly = True
        TabOrder = 5
        ButtonKind = bkFind
        ButtonVisible = False
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RkyCustomerName: TRKeyRzBtnEdit
        Left = 397
        Top = 7
        Width = 260
        Height = 21
        Text = ''
        Color = clInfoBk
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        ReadOnly = True
        TabOrder = 6
        ButtonKind = bkFind
        ButtonVisible = False
        DisplayModID = 0
        ForceOnFocus = True
      end
    end
    inherited pnl2: TPanel
      Width = 669
      Height = 435
      ExplicitWidth = 674
      ExplicitHeight = 456
      object HeaderControl1: THeaderControl
        Left = 1
        Top = 1
        Width = 667
        Height = 17
        Sections = <
          item
            Alignment = taCenter
            ImageIndex = -1
            Text = #20869#23481#36873#25321
            Width = 140
          end
          item
            Alignment = taCenter
            ImageIndex = -1
            Width = 528
          end>
        ExplicitWidth = 672
      end
      object TreeView1: TTreeView
        Left = 1
        Top = 18
        Width = 139
        Height = 416
        Align = alLeft
        HideSelection = False
        Indent = 19
        ReadOnly = True
        TabOrder = 1
        TabStop = False
        OnChange = TreeView1Change
        Items.NodeData = {
          0301000000260000000000000000000000FFFFFFFFFFFFFFFF00000000000000
          00030000000104C588D08F3057B970260000000000000001000000FFFFFFFFFF
          FFFFFF0000000000000000000000000104004E2C82E14F6F6028000000000000
          0002000000FFFFFFFFFFFFFFFF00000000000000000000000001059E583C500E
          7A0768B08B260000000000000003000000FFFFFFFFFFFFFFFF00000000000000
          000000000001047651835BE14F6F60}
        ExplicitHeight = 437
      end
      object Notebook1: TNotebook
        Left = 140
        Top = 18
        Width = 528
        Height = 416
        Align = alClient
        PageIndex = 1
        TabOrder = 2
        TabStop = True
        ExplicitWidth = 533
        ExplicitHeight = 437
        object TPage
          Left = 0
          Top = 0
          Caption = 'Default'
          ExplicitWidth = 533
          ExplicitHeight = 437
        end
        object TPage
          Left = 0
          Top = 0
          Caption = #19968#33324#20449#24687
          ExplicitWidth = 533
          ExplicitHeight = 437
          object Label2: TLabel
            Left = 59
            Top = 12
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = #35013#36816#22320#28857#65306
          end
          object Bevel1: TBevel
            Left = 0
            Top = 31
            Width = 529
            Height = 4
            Shape = bsTopLine
          end
          object Label3: TLabel
            Left = 83
            Top = 39
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = #22320#22336#65306
          end
          object Label4: TLabel
            Left = 72
            Top = 94
            Width = 40
            Height = 13
            Caption = #24030'/'#30465#65306
          end
          object Label5: TLabel
            Left = 47
            Top = 228
            Width = 72
            Height = 13
            Alignment = taRightJustify
            Caption = #22269#23478#25110#22320#21306#65306
          end
          object Label6: TLabel
            Left = 71
            Top = 120
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = #32852#32476#20154#65306
          end
          object Label7: TLabel
            Left = 59
            Top = 147
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = #30005#35805#21495#30721#65306
          end
          object Label8: TLabel
            Left = 287
            Top = 147
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = #20256#30495#21495#30721#65306
          end
          object Label10: TLabel
            Left = 59
            Top = 174
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = #30005#23376#37038#20214#65306
          end
          object Label11: TLabel
            Left = 287
            Top = 228
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = #35013#36816#26041#27861#65306
          end
          object Label13: TLabel
            Left = 35
            Top = 255
            Width = 84
            Height = 13
            Alignment = taRightJustify
            Caption = #35013#36816#25552#21069#22825#25968#65306
          end
          object Label14: TLabel
            Left = 275
            Top = 255
            Width = 72
            Height = 13
            Alignment = taRightJustify
            Caption = #22870#37329#26377#25928#26399#65306
          end
          object Label15: TLabel
            Left = 277
            Top = 94
            Width = 60
            Height = 13
            Caption = #37038#25919#32534#30721#65306
          end
          object Label12: TLabel
            Left = 197
            Top = 228
            Width = 76
            Height = 13
            AutoSize = False
          end
          object Label9: TLabel
            Left = 83
            Top = 201
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = #32593#22336#65306
          end
          object RkyLocation: TRKeyRzBtnEdit
            Left = 114
            Top = 8
            Width = 201
            Height = 21
            Text = ''
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
            TabOrder = 0
            ButtonKind = bkFind
            ButtonVisible = False
            DataSource = ds12
            DataSourceField = 'LOCATION'
            DisplayModID = 0
            ForceOnFocus = True
          end
          object RkyState: TRKeyRzBtnEdit
            Left = 114
            Top = 90
            Width = 111
            Height = 21
            Text = ''
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
            TabOrder = 2
            ButtonKind = bkFind
            ButtonVisible = False
            DataSource = ds12
            DataSourceField = 'STATE'
            DisplayModID = 0
            ForceOnFocus = True
          end
          object RkyZip: TRKeyRzBtnEdit
            Left = 344
            Top = 90
            Width = 121
            Height = 21
            Text = ''
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
            TabOrder = 3
            ButtonKind = bkFind
            ButtonVisible = False
            DataSource = ds12
            DataSourceField = 'ZIP'
            DisplayModID = 0
            ForceOnFocus = True
          end
          object RkyConstractor: TRKeyRzBtnEdit
            Left = 114
            Top = 116
            Width = 351
            Height = 21
            Text = ''
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
            TabOrder = 4
            ButtonKind = bkFind
            ButtonVisible = False
            DataSource = ds12
            DataSourceField = 'SHIP_TO_CONTACT'
            DisplayModID = 0
            ForceOnFocus = True
          end
          object RkyPhone: TRKeyRzBtnEdit
            Left = 114
            Top = 143
            Width = 111
            Height = 21
            Text = ''
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
            TabOrder = 5
            ButtonKind = bkFind
            ButtonVisible = False
            DataSource = ds12
            DataSourceField = 'SHIP_TO_PHONE'
            DisplayModID = 0
            ForceOnFocus = True
          end
          object RkyFax: TRKeyRzBtnEdit
            Left = 344
            Top = 143
            Width = 121
            Height = 21
            Text = ''
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
            TabOrder = 6
            ButtonKind = bkFind
            ButtonVisible = False
            DataSource = ds12
            DataSourceField = 'SHIP_TO_FAX'
            DisplayModID = 0
            ForceOnFocus = True
          end
          object RkyEmail: TRKeyRzBtnEdit
            Left = 114
            Top = 170
            Width = 351
            Height = 21
            Text = ''
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
            TabOrder = 7
            ButtonKind = bkFind
            ButtonVisible = False
            DataSource = ds12
            DataSourceField = 'EMAIL_FOR_CONTACT'
            DisplayModID = 0
            ForceOnFocus = True
          end
          object RkyShipMethod: TRKeyRzBtnEdit
            Left = 344
            Top = 224
            Width = 89
            Height = 21
            Text = ''
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
            TabOrder = 10
            ButtonKind = bkFind
            DataSource = ds12
            DataSourceField = 'SHIP_SHIPPING_METHOD'
            DispalyTableName = 'Data0370'
            DisplaytextField = 'DESCRIPTION'
            DisplayRetKeyField = 'DESCRIPTION'
            DisplayNoteField = 'DESCRIPTION'
            DisplayPickID = '5'
            DisplayModID = 83
            ForceOnFocus = True
          end
          object RkyEarlyDays: TRKeyRzBtnEdit
            Left = 114
            Top = 251
            Width = 111
            Height = 21
            Text = ''
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
            TabOrder = 11
            ButtonKind = bkFind
            ButtonVisible = False
            DataSource = ds12
            DataSourceField = 'SHIP_LEAD_TIME'
            DisplayModID = 0
            ForceOnFocus = True
          end
          object RkyCountry: TRKeyRzBtnEdit
            Left = 114
            Top = 224
            Width = 103
            Height = 21
            Text = ''
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
            ParentFont = False
            TabOrder = 9
            ButtonKind = bkFind
            DataSource = ds12
            DataSourceField = 'COUNTRY_PTR'
            DispalyTableName = 'data0250'
            DisplaytextField = 'country_code'
            DisplayRetKeyField = 'COUNTRY_RKEY'
            DisplayNoteField = 'country_name'
            DisplayPickID = '2'
            DisplayModID = 83
            ForceOnFocus = True
          end
          object DbmmAdress: TDBMemo
            Left = 114
            Top = 35
            Width = 351
            Height = 50
            DataField = 'SHIP_TO_ADDRESS_1'
            DataSource = ds12
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
            MaxLength = 100
            TabOrder = 1
          end
          object RkyWeb: TRKeyRzBtnEdit
            Left = 114
            Top = 197
            Width = 351
            Height = 21
            Text = ''
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
            TabOrder = 8
            ButtonKind = bkFind
            ButtonVisible = False
            DataSource = ds12
            DataSourceField = 'SHIP_TO_ADDRESS_2'
            DisplayModID = 0
            ForceOnFocus = True
          end
          object DBCheckBox1: TDBCheckBox
            Left = 363
            Top = 9
            Width = 110
            Height = 17
            Caption = #40664#35748#35013#36816#22320#28857
            DataField = 'LANGUAGE_FLAG'
            TabOrder = 13
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
          end
          object DbdtAwadDay: TDBDateTimeEditEh
            Left = 344
            Top = 251
            Width = 123
            Height = 21
            DataField = 'EXPIRED_DATE'
            DataSource = ds12
            DynProps = <>
            EditButtons = <>
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
            Kind = dtkDateEh
            TabOrder = 12
            Visible = True
          end
          object rgrpttype: TDBRadioGroup
            Left = 24
            Top = 280
            Width = 225
            Height = 105
            Caption = #35013#31665#21333#26684#24335
            Columns = 2
            DataField = 'overship_flag'
            DataSource = ds12
            Items.Strings = (
              #26684#24335#19968
              #26684#24335#20108
              #26684#24335#19977
              #26684#24335#22235)
            TabOrder = 14
            Values.Strings = (
              '0'
              '1'
              '2'
              '3')
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = #22686#20540#31246#26631#35782
          ExplicitWidth = 533
          ExplicitHeight = 437
          object Label23: TLabel
            Left = 281
            Top = 129
            Width = 30
            Height = 13
            Caption = '          '
          end
          object Bevel2: TBevel
            Left = 16
            Top = 266
            Width = 497
            Height = 110
            Shape = bsFrame
          end
          object Label24: TLabel
            Left = 195
            Top = 297
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = #35013#36816
          end
          object Label25: TLabel
            Left = 271
            Top = 297
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = #20135#21697
          end
          object Label26: TLabel
            Left = 346
            Top = 297
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = #24037#20855
          end
          object Label27: TLabel
            Left = 127
            Top = 293
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = #31867#21035
          end
          object Label28: TLabel
            Left = 421
            Top = 297
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = #31246#29575
          end
          object Label29: TLabel
            Left = 45
            Top = 325
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = #22686#20540#31246#65306
          end
          object DBCheckBox2: TDBCheckBox
            Left = 198
            Top = 323
            Width = 17
            Height = 17
            DataField = 'STATE_SHIP_TAX_FLAG'
            DataSource = ds12
            TabOrder = 0
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
          end
          object DBCheckBox3: TDBCheckBox
            Left = 274
            Top = 323
            Width = 17
            Height = 17
            DataField = 'STATE_PROD_TAX_FLAG'
            DataSource = ds12
            TabOrder = 1
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
          end
          object DBCheckBox4: TDBCheckBox
            Left = 349
            Top = 323
            Width = 17
            Height = 17
            DataField = 'STATE_TOOL_TAX_FLAG'
            DataSource = ds12
            TabOrder = 2
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
          end
          object EdtTax: TEdit
            Left = 91
            Top = 321
            Width = 80
            Height = 21
            TabStop = False
            Color = cl3DLight
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
            ReadOnly = True
            TabOrder = 3
          end
          object EdtTaxrate: TEdit
            Left = 393
            Top = 321
            Width = 78
            Height = 21
            TabStop = False
            Color = cl3DLight
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
            ReadOnly = True
            TabOrder = 4
          end
          object GroupBox1: TGroupBox
            Left = 16
            Top = 13
            Width = 497
            Height = 209
            Caption = #22686#20540#31246#20449#24687
            TabOrder = 5
            object Label21: TLabel
              Left = 39
              Top = 145
              Width = 72
              Height = 13
              Alignment = taRightJustify
              Caption = #22686#20540#31246#20195#30721#65306
            end
            object Label22: TLabel
              Left = 39
              Top = 178
              Width = 72
              Height = 13
              Alignment = taRightJustify
              Caption = #22686#20540#31246#26631#35782#65306
            end
            object Label33: TLabel
              Left = 49
              Top = 96
              Width = 60
              Height = 13
              Alignment = taRightJustify
              Caption = #24320#25143#24080#21495#65306
            end
            object Label32: TLabel
              Left = 49
              Top = 61
              Width = 60
              Height = 13
              Alignment = taRightJustify
              Caption = #24320#25143#38134#34892#65306
            end
            object Label31: TLabel
              Left = 25
              Top = 27
              Width = 84
              Height = 13
              Alignment = taRightJustify
              Caption = #32435#31246#20154#30331#35760#21495#65306
            end
            object Label42: TLabel
              Left = 272
              Top = 145
              Width = 209
              Height = 13
              AutoSize = False
            end
            object RkyTaxCode: TRKeyRzBtnEdit
              Left = 106
              Top = 141
              Width = 122
              Height = 21
              Text = ''
              Font.Charset = GB2312_CHARSET
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = #23435#20307
              Font.Style = []
              ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
              ParentFont = False
              TabOrder = 3
              ButtonKind = bkFind
              OnButtonClick = RkyTaxCodeButtonClick
              DataSource = ds12
              DataSourceField = 'SHIP_CTAX_PTR'
              DispalyTableName = 'data0189'
              DisplaytextField = 'state_id'
              DisplayRetKeyField = 'rkey'
              DisplayNoteField = 'name'
              DisplayPickID = '6'
              DisplayModID = 83
              ForceOnFocus = True
            end
            object RkyTaxMark: TRKeyRzBtnEdit
              Left = 106
              Top = 174
              Width = 122
              Height = 21
              Text = ''
              ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
              TabOrder = 4
              ButtonKind = bkFind
              ButtonVisible = False
              DataSource = ds12
              DataSourceField = 'SHIP_REG_TAX_ID'
              DisplayModID = 0
              ForceOnFocus = True
            end
            object RkyBankCode: TRKeyRzBtnEdit
              Left = 106
              Top = 92
              Width = 235
              Height = 21
              Text = ''
              ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
              TabOrder = 2
              ButtonKind = bkFind
              ButtonVisible = False
              DataSource = ds12
              DataSourceField = 'SHIP_TO_ADDRESS_3'
              DisplayModID = 0
              ForceOnFocus = True
            end
            object RkyBank: TRKeyRzBtnEdit
              Left = 106
              Top = 57
              Width = 235
              Height = 21
              Text = ''
              ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
              TabOrder = 1
              ButtonKind = bkFind
              ButtonVisible = False
              DataSource = ds12
              DataSourceField = 'SHP_ADDR3_FOR_FORM'
              DisplayModID = 0
              ForceOnFocus = True
            end
            object RkyLsrdjh: TRKeyRzBtnEdit
              Left = 106
              Top = 23
              Width = 235
              Height = 21
              Text = ''
              ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
              TabOrder = 0
              ButtonKind = bkFind
              ButtonVisible = False
              DataSource = ds12
              DataSourceField = 'SHP_ADDR2_FOR_FORM'
              DisplayModID = 0
              ForceOnFocus = True
            end
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = #20854#23427#20449#24687
          ExplicitWidth = 533
          ExplicitHeight = 437
          object Label19: TLabel
            Left = 68
            Top = 166
            Width = 72
            Height = 13
            Alignment = taRightJustify
            Caption = #25910#36135#32852#31995#20154#65306
          end
          object Label20: TLabel
            Left = 104
            Top = 198
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = #30005#35805#65306
          end
          object Label34: TLabel
            Left = 104
            Top = 230
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = #20256#30495#65306
          end
          object Label35: TLabel
            Left = 55
            Top = 19
            Width = 84
            Height = 13
            Alignment = taRightJustify
            Caption = #25910#36135#20844#21496#20013#25991#65306
          end
          object Label36: TLabel
            Left = 55
            Top = 87
            Width = 84
            Height = 13
            Alignment = taRightJustify
            Caption = #25910#36135#22320#22336#20013#25991#65306
          end
          object Label37: TLabel
            Left = 103
            Top = 54
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = #33521#25991#65306
          end
          object Label38: TLabel
            Left = 103
            Top = 117
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = #33521#25991#65306
          end
          object GroupBox2: TGroupBox
            Left = 20
            Top = 264
            Width = 489
            Height = 113
            Caption = #29992#25143#33258#23450#20041#20449#24687
            TabOrder = 7
            object Label16: TLabel
              Left = 38
              Top = 23
              Width = 90
              Height = 13
              Alignment = taRightJustify
              Caption = #35013#36816#20998#26512#20195#30721'1'#65306
            end
            object Label17: TLabel
              Left = 38
              Top = 55
              Width = 90
              Height = 13
              Alignment = taRightJustify
              Caption = #35013#36816#20998#26512#20195#30721'2'#65306
            end
            object Label18: TLabel
              Left = 38
              Top = 87
              Width = 90
              Height = 13
              Alignment = taRightJustify
              Caption = #35013#36816#20998#26512#20195#30721'3'#65306
            end
            object RkyShipRemark1: TRKeyRzBtnEdit
              Left = 130
              Top = 19
              Width = 239
              Height = 21
              Text = ''
              ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
              TabOrder = 0
              ButtonKind = bkFind
              ButtonVisible = False
              DataSource = ds12
              DataSourceField = 'SHP_ANALYSIS_CODE1'
              DisplayModID = 0
              ForceOnFocus = True
            end
            object RkyShipRemark2: TRKeyRzBtnEdit
              Left = 130
              Top = 51
              Width = 239
              Height = 21
              Text = ''
              ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
              TabOrder = 1
              ButtonKind = bkFind
              ButtonVisible = False
              DataSource = ds12
              DataSourceField = 'SHP_ANALYSIS_CODE2'
              DisplayModID = 0
              ForceOnFocus = True
            end
            object RkyShipRemark3: TRKeyRzBtnEdit
              Left = 130
              Top = 83
              Width = 239
              Height = 21
              Text = ''
              ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
              TabOrder = 2
              ButtonKind = bkFind
              ButtonVisible = False
              DataSource = ds12
              DataSourceField = 'SHP_ANALYSIS_CODE3'
              DisplayModID = 0
              ForceOnFocus = True
            end
          end
          object RkyReceivor: TRKeyRzBtnEdit
            Left = 143
            Top = 162
            Width = 239
            Height = 21
            Text = ''
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
            TabOrder = 4
            ButtonKind = bkFind
            ButtonVisible = False
            DataSource = ds12
            DataSourceField = 'S3_BARCODE_LABLE'
            DisplayModID = 0
            ForceOnFocus = True
          end
          object RkyReceivPhone: TRKeyRzBtnEdit
            Left = 144
            Top = 194
            Width = 239
            Height = 21
            Text = ''
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
            TabOrder = 5
            ButtonKind = bkFind
            ButtonVisible = False
            DataSource = ds12
            DataSourceField = 'S4_BARCODE_LABLE'
            DisplayModID = 0
            ForceOnFocus = True
          end
          object RkyReceivFax: TRKeyRzBtnEdit
            Left = 144
            Top = 226
            Width = 239
            Height = 21
            Text = ''
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
            TabOrder = 6
            ButtonKind = bkFind
            ButtonVisible = False
            DataSource = ds12
            DataSourceField = 'PACKGE_BARCODE_LABLE'
            DisplayModID = 0
            ForceOnFocus = True
          end
          object RkyCompany: TRKeyRzBtnEdit
            Left = 143
            Top = 15
            Width = 239
            Height = 21
            Text = ''
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
            TabOrder = 0
            ButtonKind = bkFind
            ButtonVisible = False
            DataSource = ds12
            DataSourceField = 'LOCNAME_FOR_FORM'
            DisplayModID = 0
            ForceOnFocus = True
          end
          object RkyShipAddress: TRKeyRzBtnEdit
            Left = 143
            Top = 83
            Width = 239
            Height = 21
            Text = ''
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
            TabOrder = 2
            ButtonKind = bkFind
            ButtonVisible = False
            DataSource = ds12
            DataSourceField = 'SHP_ADDR1_FOR_FORM'
            DisplayModID = 0
            ForceOnFocus = True
          end
          object RkyCompany2: TRKeyRzBtnEdit
            Left = 143
            Top = 50
            Width = 239
            Height = 21
            Text = ''
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
            TabOrder = 1
            ButtonKind = bkFind
            ButtonVisible = False
            DataSource = ds12
            DataSourceField = 'MISC_BARCODE_LABLE'
            DisplayModID = 0
            ForceOnFocus = True
          end
          object RkyShipAddress2: TRKeyRzBtnEdit
            Left = 143
            Top = 113
            Width = 239
            Height = 21
            Text = ''
            ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
            TabOrder = 3
            ButtonKind = bkFind
            ButtonVisible = False
            DataSource = ds12
            DataSourceField = 'COFC_FORMAT_FILENAME'
            DisplayModID = 0
            ForceOnFocus = True
          end
        end
      end
    end
  end
  object cds12: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 168
  end
  object ds12: TDataSource
    DataSet = cds12
    Left = 56
    Top = 168
  end
end
