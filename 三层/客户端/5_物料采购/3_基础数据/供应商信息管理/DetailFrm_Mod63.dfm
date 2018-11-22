inherited FrmDetail_Mod63: TFrmDetail_Mod63
  Left = 534
  Top = 165
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #20379#24212#21830#35814#32454#20449#24687
  ClientHeight = 506
  ClientWidth = 746
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitWidth = 754
  ExplicitHeight = 540
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 746
    Height = 506
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 746
    ExplicitHeight = 506
    inherited pnl1: TPanel
      Width = 744
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 744
      object Label1: TLabel [0]
        Left = 263
        Top = 9
        Width = 64
        Height = 13
        Caption = #20379#24212#21830#20195#30721':'
      end
      object Label2: TLabel [1]
        Left = 447
        Top = 9
        Width = 64
        Height = 13
        Caption = #20379#24212#21830#21517#31216':'
      end
      inherited btnSave: TBitBtn
        TabOrder = 1
        OnClick = btnSaveClick
      end
      inherited btnSaveAll: TBitBtn
        TabOrder = 0
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
      object DBEdit1: TDBEdit
        Left = 333
        Top = 6
        Width = 90
        Height = 21
        DataField = 'code'
        DataSource = ds23
        ReadOnly = True
        TabOrder = 5
      end
      object DBEdit2: TDBEdit
        Left = 517
        Top = 6
        Width = 196
        Height = 21
        DataField = 'supplier_name'
        DataSource = ds23
        ReadOnly = True
        TabOrder = 6
      end
    end
    inherited pnl2: TPanel
      Width = 744
      Height = 471
      ExplicitLeft = 1
      ExplicitTop = 34
      ExplicitWidth = 744
      ExplicitHeight = 471
      object HeaderControl1: THeaderControl
        Left = 1
        Top = 1
        Width = 742
        Height = 17
        Sections = <
          item
            Alignment = taCenter
            ImageIndex = -1
            Text = #39033#30446#36873#25321
            Width = 200
          end
          item
            Alignment = taCenter
            AutoSize = True
            ImageIndex = -1
            Text = #19968#33324#20449#24687
            Width = 542
          end>
      end
      object TreeView1: TTreeView
        Left = 1
        Top = 18
        Width = 200
        Height = 452
        Align = alLeft
        Indent = 19
        TabOrder = 0
        OnChange = TreeView1Change
        OnDblClick = TreeView1DblClick
        OnMouseDown = TreeView1MouseDown
        Items.NodeData = {
          0302000000280000000000000000000000FFFFFFFFFFFFFFFF00000000000000
          000400000001059B4F945E4655448DAF8B260000000000000001000000FFFFFF
          FFFFFFFFFF0000000000000000000000000104004E2C82E14F6F602600000000
          00000002000000FFFFFFFFFFFFFFFF0000000000000000000000000104228DA1
          52E14F6F60260000000000000003000000FFFFFFFFFFFFFFFF00000000000000
          000000000001045480DC7EBA4E5854260000000000000004000000FFFFFFFFFF
          FFFFFF00000000000000000000000001047651835BE14F6F6026000000000000
          0005000000FFFFFFFFFFFFFFFF0000000000000000000000000104C588D08F30
          57B970}
      end
      object Notebook1: TNotebook
        Left = 203
        Top = 18
        Width = 540
        Height = 452
        Align = alRight
        PageIndex = 1
        TabOrder = 2
        ExplicitLeft = 207
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
          object Label3: TLabel
            Left = 28
            Top = 11
            Width = 64
            Height = 13
            Caption = #20379#24212#21830#20195#30721':'
          end
          object Label4: TLabel
            Left = 28
            Top = 38
            Width = 64
            Height = 13
            Caption = #20379#24212#21830#21517#31216':'
          end
          object Label5: TLabel
            Left = 64
            Top = 67
            Width = 28
            Height = 13
            Caption = #32553#20889':'
          end
          object Label6: TLabel
            Left = 40
            Top = 128
            Width = 52
            Height = 13
            Caption = #35814#32454#22320#22336':'
          end
          object Label7: TLabel
            Left = 60
            Top = 168
            Width = 32
            Height = 13
            Caption = #24030'/'#30465':'
          end
          object Label14: TLabel
            Left = 326
            Top = 167
            Width = 52
            Height = 13
            Caption = #37038#25919#32534#30721':'
          end
          object Label15: TLabel
            Left = 326
            Top = 198
            Width = 52
            Height = 13
            Caption = #20256#30495#21495#30721':'
          end
          object Label8: TLabel
            Left = 42
            Top = 200
            Width = 52
            Height = 13
            Caption = #30005#35805#21495#30721':'
          end
          object Label9: TLabel
            Left = 42
            Top = 232
            Width = 52
            Height = 13
            Caption = #24320#25143#38134#34892':'
          end
          object Label10: TLabel
            Left = 40
            Top = 264
            Width = 52
            Height = 13
            Caption = #38134#34892#24080#25143':'
          end
          object Label11: TLabel
            Left = 28
            Top = 295
            Width = 64
            Height = 13
            Caption = #22269#23478#25110#22320#21306':'
          end
          object Label12: TLabel
            Left = 40
            Top = 323
            Width = 52
            Height = 13
            Caption = #36135#24065#31867#22411':'
          end
          object Label13: TLabel
            Left = 4
            Top = 357
            Width = 88
            Height = 13
            Caption = #20379#24212#21830#26080#25928#35828#26126':'
          end
          object Label26: TLabel
            Left = 313
            Top = 67
            Width = 52
            Height = 13
            Caption = #33829#19994#25191#29031':'
          end
          object Label64: TLabel
            Left = 28
            Top = 96
            Width = 64
            Height = 13
            Caption = #20379#24212#21830#35780#20998':'
          end
          object Label74: TLabel
            Left = 161
            Top = 96
            Width = 36
            Height = 13
            Caption = #26080#38468#20214
          end
          object Label82: TLabel
            Left = 240
            Top = 96
            Width = 64
            Height = 13
            Caption = #19978'/'#19979#36733#38468#20214
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            PopupMenu = PM2
            OnClick = Label82Click
          end
          object Label83: TLabel
            Left = 313
            Top = 96
            Width = 76
            Height = 13
            Caption = #20379#24212#21830#24320#21457#20154':'
          end
          object MaskEdit1: TMaskEdit
            Left = 100
            Top = 6
            Width = 121
            Height = 21
            TabOrder = 0
            Text = 'MaskEdit1'
          end
          object DBCheckBox1: TDBCheckBox
            Left = 368
            Top = 8
            Width = 97
            Height = 17
            Caption = #20851#32852#20844#21496
            DataField = 'brother_flag'
            DataSource = ds23
            TabOrder = 1
          end
          object DBEdit3: TDBEdit
            Left = 100
            Top = 35
            Width = 405
            Height = 21
            DataField = 'supplier_name'
            DataSource = ds23
            TabOrder = 2
          end
          object DBEdit4: TDBEdit
            Left = 100
            Top = 64
            Width = 121
            Height = 21
            DataField = 'abbr_name'
            DataSource = ds23
            TabOrder = 3
          end
          object DBMemo1: TDBMemo
            Left = 100
            Top = 122
            Width = 405
            Height = 32
            DataField = 'billing_address_1'
            DataSource = ds23
            TabOrder = 4
          end
          object DBEdit5: TDBEdit
            Left = 100
            Top = 165
            Width = 121
            Height = 21
            DataField = 'state'
            DataSource = ds23
            TabOrder = 5
          end
          object DBEdit6: TDBEdit
            Left = 384
            Top = 164
            Width = 121
            Height = 21
            DataField = 'zip'
            DataSource = ds23
            TabOrder = 6
          end
          object DBEdit8: TDBEdit
            Left = 384
            Top = 195
            Width = 121
            Height = 21
            DataField = 'fax'
            DataSource = ds23
            TabOrder = 7
          end
          object DBEdit7: TDBEdit
            Left = 100
            Top = 197
            Width = 121
            Height = 21
            DataField = 'phone'
            DataSource = ds23
            TabOrder = 8
          end
          object DBEdit9: TDBEdit
            Left = 100
            Top = 229
            Width = 405
            Height = 21
            DataField = 'telex'
            DataSource = ds23
            TabOrder = 9
          end
          object DBEdit10: TDBEdit
            Left = 100
            Top = 261
            Width = 405
            Height = 21
            DataField = 'gen_email_address'
            DataSource = ds23
            TabOrder = 10
          end
          object RKeyRzBtnEdit1: TRKeyRzBtnEdit
            Left = 100
            Top = 291
            Width = 121
            Height = 21
            Text = ''
            TabOrder = 11
            ButtonKind = bkFind
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds23
            DataSourceField = 'COUNTRY_PTR'
            DispalyTableName = 'data0250'
            DisplaytextField = 'country_code'
            DisplayRetKeyField = 'country_rkey'
            DisplayNoteField = 'country_name'
            DisplayPickID = '1'
            DisplayModID = 63
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit2: TRKeyRzBtnEdit
            Left = 100
            Top = 320
            Width = 121
            Height = 21
            Text = ''
            TabOrder = 12
            ButtonKind = bkFind
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds23
            DataSourceField = 'CURRENCY_PTR'
            DispalyTableName = 'data0001'
            DisplaytextField = 'curr_code'
            DisplayRetKeyField = 'rkey'
            DisplayNoteField = 'curr_name'
            DisplayPickID = '2'
            DisplayModID = 63
            ForceOnFocus = True
          end
          object DBRadioGroup1: TDBRadioGroup
            Left = 422
            Top = 287
            Width = 83
            Height = 60
            Caption = #29366#24577
            DataField = 'status'
            DataSource = ds23
            Items.Strings = (
              #26377#25928
              #26080#25928)
            TabOrder = 13
            Values.Strings = (
              '0'
              '1')
            OnChange = DBRadioGroup1Change
          end
          object DBEdit11: TDBEdit
            Left = 100
            Top = 353
            Width = 405
            Height = 21
            DataField = 'invalid_explain'
            DataSource = ds23
            TabOrder = 14
          end
          object DBRadioGroup2: TDBRadioGroup
            Left = 4
            Top = 393
            Width = 501
            Height = 46
            Caption = #20379#24212#21830#31867#22411
            Columns = 3
            DataField = 'ttype'
            DataSource = ds23
            Items.Strings = (
              #26448#26009#20379#24212#21830
              #22806#21457#20379#24212#21830
              #20004#20010#37117#26159)
            TabOrder = 15
            Values.Strings = (
              '0'
              '1'
              '2')
          end
          object DBEdit40: TDBEdit
            Left = 372
            Top = 64
            Width = 121
            Height = 21
            DataField = 'EDI_ID'
            DataSource = ds23
            TabOrder = 16
          end
          object DBEdit50: TDBEdit
            Left = 100
            Top = 93
            Width = 57
            Height = 21
            DataField = 'TAX_1'
            DataSource = ds23
            TabOrder = 17
            OnExit = DBEdit50Exit
            OnKeyPress = DBEdit50KeyPress
          end
          object DBEdit53: TDBEdit
            Left = 395
            Top = 93
            Width = 97
            Height = 21
            DataField = 'developer'
            DataSource = ds23
            TabOrder = 18
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = #36130#21153#20449#24687
          object Label17: TLabel
            Left = 92
            Top = 51
            Width = 60
            Height = 13
            Caption = #20184#27454#26041#24335#65306
          end
          object Label28: TLabel
            Left = 92
            Top = 85
            Width = 60
            Height = 13
            Caption = #20184#27454#22320#28857#65306
          end
          object Label27: TLabel
            Left = 92
            Top = 118
            Width = 60
            Height = 13
            Caption = #31080#25454#31181#31867#65306
          end
          object Label77: TLabel
            Left = 66
            Top = 153
            Width = 84
            Height = 13
            Caption = #32435#31246#20154#35782#21035#30721#65306
          end
          object Label24: TLabel
            Left = 80
            Top = 184
            Width = 72
            Height = 13
            Caption = #20928#20184#27454#22825#25968#65306
          end
          object Label18: TLabel
            Left = 86
            Top = 217
            Width = 66
            Height = 13
            Caption = #20184#27454#25240#25187'1'#65306
          end
          object Label19: TLabel
            Left = 270
            Top = 217
            Width = 11
            Height = 13
            Caption = '%'
          end
          object Label20: TLabel
            Left = 86
            Top = 250
            Width = 66
            Height = 13
            Caption = #25240#25187#22825#25968'1'#65306
          end
          object Label21: TLabel
            Left = 86
            Top = 284
            Width = 66
            Height = 13
            Caption = #20184#27454#25240#25187'2'#65306
          end
          object Label22: TLabel
            Left = 271
            Top = 284
            Width = 11
            Height = 13
            Caption = '%'
          end
          object Label23: TLabel
            Left = 86
            Top = 315
            Width = 66
            Height = 13
            Caption = #25240#25187#22825#25968'2'#65306
          end
          object Label80: TLabel
            Left = 20
            Top = 348
            Width = 132
            Height = 13
            Alignment = taRightJustify
            Caption = #22996#22806#21152#24037#20837#24211#25104#26412#25240#29575#65306
          end
          object Label81: TLabel
            Left = 272
            Top = 344
            Width = 11
            Height = 13
            Caption = '%'
          end
          object Label25: TLabel
            Left = 99
            Top = 383
            Width = 53
            Height = 13
            Caption = 'A/P'#24080#30446#65306
          end
          object DBEdit12: TDBEdit
            Left = 158
            Top = 48
            Width = 185
            Height = 21
            DataField = 'tax_id_number'
            DataSource = ds23
            TabOrder = 0
          end
          object DBEdit13: TDBEdit
            Left = 158
            Top = 81
            Width = 185
            Height = 21
            DataField = 'analysis_code2'
            DataSource = ds23
            TabOrder = 1
          end
          object DBEdit52: TDBEdit
            Left = 158
            Top = 148
            Width = 185
            Height = 21
            DataField = 'EDI_ID'
            DataSource = ds23
            TabOrder = 2
          end
          object DBEdit14: TDBEdit
            Left = 158
            Top = 180
            Width = 49
            Height = 21
            DataField = 'payment_terms'
            DataSource = ds23
            TabOrder = 3
          end
          object DBEdit15: TDBEdit
            Left = 158
            Top = 213
            Width = 105
            Height = 21
            DataField = 'discount'
            DataSource = ds23
            TabOrder = 4
          end
          object DBEdit16: TDBEdit
            Left = 158
            Top = 246
            Width = 49
            Height = 21
            DataField = 'discount_days'
            DataSource = ds23
            TabOrder = 5
          end
          object DBEdit17: TDBEdit
            Left = 158
            Top = 280
            Width = 105
            Height = 21
            DataField = 'discount2'
            DataSource = ds23
            TabOrder = 6
          end
          object DBEdit18: TDBEdit
            Left = 158
            Top = 311
            Width = 49
            Height = 21
            DataField = 'discount2_days'
            DataSource = ds23
            TabOrder = 7
          end
          object DBEdit54: TDBEdit
            Left = 158
            Top = 344
            Width = 107
            Height = 21
            DataField = 'TAX_2'
            DataSource = ds23
            TabOrder = 8
          end
          object DBCheckBox2: TDBCheckBox
            Left = 186
            Top = 16
            Width = 97
            Height = 17
            Caption = #26242#32531#39044#20184#27454#39033
            DataField = 'put_all_inv_hold'
            DataSource = ds23
            TabOrder = 9
          end
          object DBComboBox1: TDBComboBox
            Left = 158
            Top = 115
            Width = 187
            Height = 21
            DataField = 'analysis_code1'
            DataSource = ds23
            Items.Strings = (
              #26222#36890#21457#31080
              #19987#29992#22686#20540#31246#21457#31080'17%'
              #19987#29992#22686#20540#31246#21457#31080'3%'
              #36827#21475#21457#31080
              #19987#29992#22686#20540#31246#21457#31080'6%')
            TabOrder = 10
          end
          object RKeyRzBtnEdit3: TRKeyRzBtnEdit
            Left = 158
            Top = 380
            Width = 121
            Height = 21
            Text = ''
            TabOrder = 11
            ButtonKind = bkFind
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds23
            DataSourceField = 'ACC_PAYABLE_PTR'
            DispalyTableName = 'data0103'
            DisplaytextField = 'gl_acc_number'
            DisplayRetKeyField = 'rkey'
            DisplayNoteField = 'gl_description'
            DisplayPickID = '3'
            DisplayModID = 63
            ForceOnFocus = True
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = #32852#32476#20154#21592
          object Bevel6: TBevel
            Left = 8
            Top = 349
            Width = 473
            Height = 60
          end
          object Label46: TLabel
            Left = 24
            Top = 386
            Width = 60
            Height = 13
            Caption = #30005#23376#37038#20214#65306
          end
          object Label38: TLabel
            Left = 24
            Top = 359
            Width = 57
            Height = 13
            Caption = #32852#31995#20154' 6'#65306
          end
          object Label42: TLabel
            Left = 252
            Top = 359
            Width = 60
            Height = 13
            Caption = #30005#35805#21495#30721#65306
          end
          object Bevel5: TBevel
            Left = 8
            Top = 280
            Width = 473
            Height = 60
          end
          object Label45: TLabel
            Left = 24
            Top = 317
            Width = 60
            Height = 13
            Caption = #30005#23376#37038#20214#65306
          end
          object Label37: TLabel
            Left = 24
            Top = 290
            Width = 57
            Height = 13
            Caption = #32852#31995#20154' 5'#65306
          end
          object Label41: TLabel
            Left = 252
            Top = 290
            Width = 60
            Height = 13
            Caption = #30005#35805#21495#30721#65306
          end
          object Bevel4: TBevel
            Left = 8
            Top = 212
            Width = 473
            Height = 60
          end
          object Label44: TLabel
            Left = 24
            Top = 250
            Width = 60
            Height = 13
            Caption = #30005#23376#37038#20214#65306
          end
          object Label36: TLabel
            Left = 24
            Top = 223
            Width = 57
            Height = 13
            Caption = #32852#31995#20154' 4'#65306
          end
          object Label40: TLabel
            Left = 252
            Top = 223
            Width = 60
            Height = 13
            Caption = #30005#35805#21495#30721#65306
          end
          object Bevel3: TBevel
            Left = 8
            Top = 144
            Width = 473
            Height = 60
          end
          object Label43: TLabel
            Left = 24
            Top = 181
            Width = 60
            Height = 13
            Caption = #30005#23376#37038#20214#65306
          end
          object Label35: TLabel
            Left = 24
            Top = 154
            Width = 57
            Height = 13
            Caption = #32852#31995#20154' 3'#65306
          end
          object Label39: TLabel
            Left = 252
            Top = 154
            Width = 60
            Height = 13
            Caption = #30005#35805#21495#30721#65306
          end
          object Bevel2: TBevel
            Left = 8
            Top = 76
            Width = 473
            Height = 60
          end
          object Label34: TLabel
            Left = 24
            Top = 113
            Width = 60
            Height = 13
            Caption = #30005#23376#37038#20214#65306
          end
          object Label32: TLabel
            Left = 24
            Top = 87
            Width = 57
            Height = 13
            Caption = #32852#31995#20154' 2'#65306
          end
          object Label33: TLabel
            Left = 252
            Top = 87
            Width = 60
            Height = 13
            Caption = #30005#35805#21495#30721#65306
          end
          object Label30: TLabel
            Left = 252
            Top = 18
            Width = 60
            Height = 13
            Caption = #30005#35805#21495#30721#65306
          end
          object Label29: TLabel
            Left = 24
            Top = 18
            Width = 57
            Height = 13
            Caption = #32852#31995#20154' 1'#65306
          end
          object Bevel1: TBevel
            Left = 8
            Top = 8
            Width = 473
            Height = 60
          end
          object Label31: TLabel
            Left = 24
            Top = 45
            Width = 60
            Height = 13
            Caption = #30005#23376#37038#20214#65306
          end
          object DBEdit36: TDBEdit
            Left = 90
            Top = 382
            Width = 377
            Height = 21
            DataField = 'email_for_contact6'
            DataSource = ds23
            TabOrder = 0
          end
          object DBEdit34: TDBEdit
            Left = 88
            Top = 355
            Width = 149
            Height = 21
            DataField = 'contact_name_6'
            DataSource = ds23
            TabOrder = 1
          end
          object DBEdit35: TDBEdit
            Left = 316
            Top = 355
            Width = 149
            Height = 21
            DataField = 'cont_phone_6'
            DataSource = ds23
            TabOrder = 2
          end
          object DBEdit33: TDBEdit
            Left = 88
            Top = 313
            Width = 377
            Height = 21
            DataField = 'email_for_contact5'
            DataSource = ds23
            TabOrder = 3
          end
          object DBEdit31: TDBEdit
            Left = 88
            Top = 286
            Width = 149
            Height = 21
            DataField = 'contact_name_5'
            DataSource = ds23
            TabOrder = 4
          end
          object DBEdit32: TDBEdit
            Left = 316
            Top = 286
            Width = 149
            Height = 21
            DataField = 'cont_phone_5'
            DataSource = ds23
            TabOrder = 5
          end
          object DBEdit30: TDBEdit
            Left = 88
            Top = 246
            Width = 377
            Height = 21
            DataField = 'email_for_contact4'
            DataSource = ds23
            TabOrder = 6
          end
          object DBEdit28: TDBEdit
            Left = 88
            Top = 219
            Width = 149
            Height = 21
            DataField = 'contact_name_4'
            DataSource = ds23
            TabOrder = 7
          end
          object DBEdit29: TDBEdit
            Left = 316
            Top = 219
            Width = 149
            Height = 21
            DataField = 'cont_phone_4'
            DataSource = ds23
            TabOrder = 8
          end
          object DBEdit27: TDBEdit
            Left = 88
            Top = 177
            Width = 377
            Height = 21
            DataField = 'email_for_contact3'
            DataSource = ds23
            TabOrder = 9
          end
          object DBEdit25: TDBEdit
            Left = 88
            Top = 150
            Width = 149
            Height = 21
            DataField = 'contact_name_3'
            DataSource = ds23
            TabOrder = 10
          end
          object DBEdit26: TDBEdit
            Left = 316
            Top = 150
            Width = 149
            Height = 21
            DataField = 'cont_phone_3'
            DataSource = ds23
            TabOrder = 11
          end
          object DBEdit24: TDBEdit
            Left = 88
            Top = 109
            Width = 377
            Height = 21
            DataField = 'email_for_contact2'
            DataSource = ds23
            TabOrder = 12
          end
          object DBEdit22: TDBEdit
            Left = 88
            Top = 83
            Width = 149
            Height = 21
            DataField = 'contact_name_2'
            DataSource = ds23
            TabOrder = 13
          end
          object DBEdit23: TDBEdit
            Left = 316
            Top = 83
            Width = 149
            Height = 21
            DataField = 'cont_phone_2'
            DataSource = ds23
            TabOrder = 14
          end
          object DBEdit21: TDBEdit
            Left = 88
            Top = 41
            Width = 377
            Height = 21
            DataField = 'email_for_contact1'
            DataSource = ds23
            TabOrder = 15
          end
          object DBEdit20: TDBEdit
            Left = 316
            Top = 14
            Width = 149
            Height = 21
            DataField = 'cont_phone_1'
            DataSource = ds23
            TabOrder = 16
          end
          object DBEdit19: TDBEdit
            Left = 88
            Top = 14
            Width = 149
            Height = 21
            DataField = 'contact_name_1'
            DataSource = ds23
            TabOrder = 17
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = #20854#23427#20449#24687
          object Label47: TLabel
            Left = 16
            Top = 18
            Width = 76
            Height = 13
            Caption = #26495#26448#19987#29992#20195#30721':'
          end
          object Label78: TLabel
            Left = 28
            Top = 46
            Width = 64
            Height = 13
            Caption = #20379#24212#21830#24615#36136':'
          end
          object Label79: TLabel
            Left = 40
            Top = 71
            Width = 52
            Height = 13
            Caption = #20379#24212#29289#26009':'
          end
          object Label48: TLabel
            Left = 42
            Top = 392
            Width = 60
            Height = 13
            Caption = #21019#24314#26085#26399#65306
          end
          object Label76: TLabel
            Left = 259
            Top = 392
            Width = 96
            Height = 13
            Caption = #20379#24212#21830#24320#21457#20154#21592#65306
          end
          object Label49: TLabel
            Left = 272
            Top = 418
            Width = 84
            Height = 13
            Caption = #26368#21518#20462#25913#20154#21592#65306
          end
          object Label50: TLabel
            Left = 16
            Top = 418
            Width = 84
            Height = 13
            Caption = #26368#21518#20462#25913#26085#26399#65306
          end
          object DBEdit37: TDBEdit
            Left = 104
            Top = 14
            Width = 145
            Height = 21
            DataField = 'analysis_code3'
            DataSource = ds23
            TabOrder = 0
          end
          object DBComboBox2: TDBComboBox
            Left = 104
            Top = 41
            Width = 146
            Height = 21
            DataField = 'ADDRESS2_FOR_FORM'
            DataSource = ds23
            Items.Strings = (
              #22269#20869#21046#36896
              #22269#22806#21046#36896
              #20195#29702#36152#26131
              #20854#23427)
            TabOrder = 1
          end
          object GroupBox1: TGroupBox
            Left = 17
            Top = 90
            Width = 479
            Height = 292
            Caption = #35760#20107#26412#20449#24687
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 2
            object Label51: TLabel
              Left = 8
              Top = 17
              Width = 96
              Height = 13
              Caption = #37319#36141#35746#21333#35760#20107#26412#65306
            end
            object Label16: TLabel
              Left = 8
              Top = 150
              Width = 64
              Height = 13
              Caption = #26222#36890#35760#20107#26412':'
            end
            object Memo1: TMemo
              Left = 10
              Top = 30
              Width = 465
              Height = 113
              TabOrder = 0
            end
            object Memo4: TMemo
              Left = 8
              Top = 168
              Width = 467
              Height = 117
              TabOrder = 1
            end
          end
          object DBEdit38: TDBEdit
            Left = 104
            Top = 388
            Width = 145
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'suppier_ent_date'
            DataSource = ds23
            Enabled = False
            TabOrder = 3
          end
          object DBEdit49: TDBEdit
            Left = 360
            Top = 388
            Width = 113
            Height = 21
            DataField = 'developer'
            DataSource = ds23
            TabOrder = 4
          end
          object Edit8: TEdit
            Left = 362
            Top = 415
            Width = 113
            Height = 21
            TabStop = False
            Color = clMenu
            Enabled = False
            TabOrder = 5
          end
          object DBEdit39: TDBEdit
            Left = 104
            Top = 414
            Width = 145
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'update_date'
            DataSource = ds23
            Enabled = False
            TabOrder = 6
          end
          object RKeyRzBtnEdit4: TRKeyRzBtnEdit
            Left = 104
            Top = 69
            Width = 393
            Height = 21
            Text = ''
            TabOrder = 7
            ButtonKind = bkFind
            AltBtnWidth = 15
            ButtonWidth = 15
            OnButtonClick = RKeyRzBtnEdit4ButtonClick
            DataSource = ds23
            DataSourceField = 'ADDRESS1_FOR_FORM'
            DispalyTableName = 'data0496'
            DisplayPickID = '4'
            DisplayModID = 63
            ForceOnFocus = True
          end
          object DBCheckBox3: TDBCheckBox
            Left = 255
            Top = 18
            Width = 106
            Height = 17
            Caption = 'VMI'#20379#24212#21830'('#23492#21334')'
            DataField = 'edi_out_new_po'
            DataSource = ds23
            TabOrder = 8
            ValueChecked = '1'
            ValueUnchecked = '0'
            OnClick = DBCheckBox3Click
          end
          object DBRadioGroup3: TDBRadioGroup
            Left = 367
            Top = 6
            Width = 135
            Height = 57
            Caption = 'VMI'#20837#24211#20215#26684#21462#20540#26041#27861
            DataField = 'EDI_FLAG_FOR_PO'
            DataSource = ds23
            Items.Strings = (
              #20174#26368#26032#20215#26684#20132#20184#20013#21462
              #20174#21407'VMI'#37319#36141#35746#21333#21462)
            TabOrder = 9
            Values.Strings = (
              '0'
              '1')
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = #35013#36816#22320#28857
          object Bevel8: TBevel
            Left = 0
            Top = 31
            Width = 494
            Height = 2
          end
          object Label54: TLabel
            Left = 35
            Top = 11
            Width = 60
            Height = 13
            Caption = #35013#36816#22320#28857#65306
          end
          object Label55: TLabel
            Left = 35
            Top = 48
            Width = 60
            Height = 13
            Caption = #35814#32454#22320#22336#65306
          end
          object Label56: TLabel
            Left = 53
            Top = 108
            Width = 40
            Height = 13
            Caption = #24030'/'#30465#65306
          end
          object Label57: TLabel
            Left = 307
            Top = 108
            Width = 36
            Height = 13
            Caption = #37038#32534#65306
          end
          object Label60: TLabel
            Left = 21
            Top = 137
            Width = 72
            Height = 13
            Caption = #22269#23478#25110#22320#21306#65306
          end
          object Label61: TLabel
            Left = 43
            Top = 166
            Width = 48
            Height = 13
            Caption = #32852#32476#20154#65306
          end
          object Label58: TLabel
            Left = 35
            Top = 197
            Width = 60
            Height = 13
            Caption = #30005#35805#21495#30721#65306
          end
          object Label59: TLabel
            Left = 281
            Top = 197
            Width = 60
            Height = 13
            Caption = #20256#30495#21495#30721#65306
          end
          object Label62: TLabel
            Left = 35
            Top = 226
            Width = 60
            Height = 13
            Caption = #30005#23376#37038#31665#65306
          end
          object Label63: TLabel
            Left = 9
            Top = 257
            Width = 84
            Height = 13
            Caption = #35013#36816#25552#21069#22825#25968#65306
          end
          object Label66: TLabel
            Left = 281
            Top = 257
            Width = 60
            Height = 13
            Caption = #31163#23736#20215#26684#65306
          end
          object Label65: TLabel
            Left = 35
            Top = 287
            Width = 60
            Height = 13
            Caption = #35013#36816#26041#27861#65306
          end
          object DBEdit41: TDBEdit
            Left = 97
            Top = 7
            Width = 209
            Height = 21
            DataField = 'FACTORY_LOCATION'
            DataSource = ds24
            Enabled = False
            TabOrder = 0
          end
          object BitBtn10: TBitBtn
            Left = 346
            Top = 5
            Width = 57
            Height = 21
            Cursor = crHandPoint
            Hint = #20445#23384
            Caption = #30830#23450
            Enabled = False
            Glyph.Data = {
              36060000424D3606000000000000360400002800000020000000100000000100
              08000000000000020000610B0000610B00000001000000000000000000003300
              00006600000099000000CC000000FF0000000033000033330000663300009933
              0000CC330000FF33000000660000336600006666000099660000CC660000FF66
              000000990000339900006699000099990000CC990000FF99000000CC000033CC
              000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
              0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
              330000333300333333006633330099333300CC333300FF333300006633003366
              33006666330099663300CC663300FF6633000099330033993300669933009999
              3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
              330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
              66006600660099006600CC006600FF0066000033660033336600663366009933
              6600CC336600FF33660000666600336666006666660099666600CC666600FF66
              660000996600339966006699660099996600CC996600FF99660000CC660033CC
              660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
              6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
              990000339900333399006633990099339900CC339900FF339900006699003366
              99006666990099669900CC669900FF6699000099990033999900669999009999
              9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
              990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
              CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
              CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
              CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
              CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
              CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
              FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
              FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
              FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
              FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
              000000808000800000008000800080800000C0C0C00080808000191919004C4C
              4C00B2B2B200E5E5E5005A1E1E00783C3C0096646400C8969600FFC8C800465F
              82005591B9006EB9D7008CD2E600B4E6F000D8E9EC0099A8AC00646F7100E2EF
              F100C56A31000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000EEEEEEEEEEEE
              EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
              EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE180C
              EEEEEEEEEEEEEEEEEEEEEEEEEEEEE2DFEEEEEEEEEEEEEEEEEEEEEEEEEE181212
              0CEEEEEEEEEEEEEEEEEEEEEEEEE28181DFEEEEEEEEEEEEEEEEEEEEEE18121212
              120CEEEEEEEEEEEEEEEEEEEEE281818181DFEEEEEEEEEEEEEEEEEE1812121212
              12120CEEEEEEEEEEEEEEEEE2818181818181DFEEEEEEEEEEEEEEEE1812120C18
              1212120CEEEEEEEEEEEEEEE28181DFE2818181DFEEEEEEEEEEEEEE18120CEEEE
              181212120CEEEEEEEEEEEEE281DFEEEEE2818181DFEEEEEEEEEEEE180CEEEEEE
              EE181212120CEEEEEEEEEEE2DFEEEEEEEEE2818181DFEEEEEEEEEEEEEEEEEEEE
              EEEE181212120CEEEEEEEEEEEEEEEEEEEEEEE2818181DFEEEEEEEEEEEEEEEEEE
              EEEEEE181212120CEEEEEEEEEEEEEEEEEEEEEEE2818181DFEEEEEEEEEEEEEEEE
              EEEEEEEE1812120CEEEEEEEEEEEEEEEEEEEEEEEEE28181DFEEEEEEEEEEEEEEEE
              EEEEEEEEEE18120CEEEEEEEEEEEEEEEEEEEEEEEEEEE281DFEEEEEEEEEEEEEEEE
              EEEEEEEEEEEE180CEEEEEEEEEEEEEEEEEEEEEEEEEEEEE2DFEEEEEEEEEEEEEEEE
              EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
              EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = BitBtn10Click
          end
          object BitBtn11: TBitBtn
            Left = 409
            Top = 4
            Width = 57
            Height = 21
            Cursor = crHandPoint
            Hint = #20445#23384
            Caption = #21462#28040
            Enabled = False
            Glyph.Data = {
              36060000424D3606000000000000360400002800000020000000100000000100
              08000000000000020000610B0000610B00000001000000000000000000003300
              00006600000099000000CC000000FF0000000033000033330000663300009933
              0000CC330000FF33000000660000336600006666000099660000CC660000FF66
              000000990000339900006699000099990000CC990000FF99000000CC000033CC
              000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
              0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
              330000333300333333006633330099333300CC333300FF333300006633003366
              33006666330099663300CC663300FF6633000099330033993300669933009999
              3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
              330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
              66006600660099006600CC006600FF0066000033660033336600663366009933
              6600CC336600FF33660000666600336666006666660099666600CC666600FF66
              660000996600339966006699660099996600CC996600FF99660000CC660033CC
              660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
              6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
              990000339900333399006633990099339900CC339900FF339900006699003366
              99006666990099669900CC669900FF6699000099990033999900669999009999
              9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
              990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
              CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
              CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
              CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
              CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
              CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
              FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
              FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
              FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
              FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
              000000808000800000008000800080800000C0C0C00080808000191919004C4C
              4C00B2B2B200E5E5E5005A1E1E00783C3C0096646400C8969600FFC8C800465F
              82005591B9006EB9D7008CD2E600B4E6F000D8E9EC0099A8AC00646F7100E2EF
              F100C56A31000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000EEEEEEEEEEEE
              EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
              EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
              EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEB46C6C6CEE
              EEEEEEEEB46C6C6CEEEEEEE2DFDFDFEEEEEEEEEEE2DFDFDFEEEEEEB49090906C
              EEEEEEB49090906CEEEEEEE2818181DFEEEEEEE2818181DFEEEEEEEEB4909090
              6CEEB49090906CEEEEEEEEEEE2818181DFEEE2818181DFEEEEEEEEEEEEB49090
              906C9090906CEEEEEEEEEEEEEEE2818181DF818181DFEEEEEEEEEEEEEEEEB490
              909090906CEEEEEEEEEEEEEEEEEEE28181818181DFEEEEEEEEEEEEEEEEEEEEB4
              9090906CEEEEEEEEEEEEEEEEEEEEEEE2818181DFEEEEEEEEEEEEEEEEEEEEB490
              909090906CEEEEEEEEEEEEEEEEEEE28181818181DFEEEEEEEEEEEEEEEEB49090
              906C9090906CEEEEEEEEEEEEEEE2818181DF818181DFEEEEEEEEEEEEB4909090
              6CEEB49090906CEEEEEEEEEEE2818181DFEEE2818181DFEEEEEEEEB49090906C
              EEEEEEB49090906CEEEEEEE2818181DFEEEEEEE2818181DFEEEEEEB4B4B4B4EE
              EEEEEEEEB4B4B4B4EEEEEEE2E2E2E2EEEEEEEEEEE2E2E2E2EEEEEEEEEEEEEEEE
              EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
              EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = BitBtn11Click
          end
          object DBMemo2: TDBMemo
            Left = 97
            Top = 37
            Width = 369
            Height = 60
            DataField = 'FACTORY_ADDRESS_1'
            DataSource = ds24
            Enabled = False
            TabOrder = 3
          end
          object DBEdit42: TDBEdit
            Left = 99
            Top = 103
            Width = 121
            Height = 21
            DataField = 'STATE'
            DataSource = ds24
            Enabled = False
            TabOrder = 4
          end
          object DBEdit43: TDBEdit
            Left = 345
            Top = 104
            Width = 121
            Height = 21
            DataField = 'ZIP'
            DataSource = ds24
            Enabled = False
            TabOrder = 5
          end
          object DBEdit44: TDBEdit
            Left = 97
            Top = 163
            Width = 121
            Height = 21
            DataField = 'CONTACT'
            DataSource = ds24
            Enabled = False
            TabOrder = 6
          end
          object DBEdit45: TDBEdit
            Left = 97
            Top = 193
            Width = 121
            Height = 21
            DataField = 'PHONE'
            DataSource = ds24
            Enabled = False
            TabOrder = 7
          end
          object DBEdit46: TDBEdit
            Left = 345
            Top = 193
            Width = 121
            Height = 21
            DataField = 'FAX'
            DataSource = ds24
            Enabled = False
            TabOrder = 8
          end
          object DBEdit47: TDBEdit
            Left = 97
            Top = 223
            Width = 369
            Height = 21
            DataField = 'EMAIL_FOR_CONTACT'
            DataSource = ds24
            Enabled = False
            TabOrder = 9
          end
          object DBEdit48: TDBEdit
            Left = 97
            Top = 253
            Width = 121
            Height = 21
            DataField = 'SHIPPING_LEAD_TIME'
            DataSource = ds24
            Enabled = False
            TabOrder = 10
          end
          object DBEdit51: TDBEdit
            Left = 347
            Top = 253
            Width = 121
            Height = 21
            DataField = 'FOB'
            DataSource = ds24
            Enabled = False
            TabOrder = 11
          end
          object GroupBox2: TGroupBox
            Left = 8
            Top = 306
            Width = 476
            Height = 103
            Caption = 
              '----------------------------------------------------------------' +
              '-----------------------------------'#22686#20540#31246#20449#24687
            TabOrder = 12
            object Label67: TLabel
              Left = 13
              Top = 20
              Width = 72
              Height = 13
              Caption = #22686#20540#31246#20195#30721#65306
            end
            object Label75: TLabel
              Left = 248
              Top = 20
              Width = 209
              Height = 13
              AutoSize = False
            end
            object Bevel7: TBevel
              Left = 8
              Top = 43
              Width = 457
              Height = 53
            end
            object Label70: TLabel
              Left = 172
              Top = 52
              Width = 24
              Height = 13
              Caption = #35013#36816
            end
            object Label69: TLabel
              Left = 95
              Top = 52
              Width = 24
              Height = 13
              Caption = #31867#21035
            end
            object Label68: TLabel
              Left = 24
              Top = 74
              Width = 48
              Height = 13
              Caption = #22686#20540#31246#65306
            end
            object Label71: TLabel
              Left = 248
              Top = 52
              Width = 24
              Height = 13
              Caption = #26448#26009
            end
            object Label72: TLabel
              Left = 324
              Top = 52
              Width = 24
              Height = 13
              Caption = #26434#39033
            end
            object Label73: TLabel
              Left = 399
              Top = 52
              Width = 24
              Height = 13
              Caption = #31246#29575
            end
            object Edit6: TEdit
              Left = 78
              Top = 71
              Width = 57
              Height = 21
              TabStop = False
              AutoSize = False
              Color = clMenu
              Enabled = False
              TabOrder = 3
            end
            object Edit7: TEdit
              Left = 384
              Top = 70
              Width = 57
              Height = 21
              TabStop = False
              AutoSize = False
              Color = clMenu
              Enabled = False
              TabOrder = 4
            end
            object DBCheckBox4: TDBCheckBox
              Left = 177
              Top = 72
              Width = 17
              Height = 17
              DataField = 'STATE_SHIP_TAX_FLAG'
              DataSource = ds24
              Enabled = False
              TabOrder = 0
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
            end
            object DBCheckBox5: TDBCheckBox
              Left = 253
              Top = 72
              Width = 17
              Height = 17
              DataField = 'STATE_INVT_TAX_FLAG'
              DataSource = ds24
              Enabled = False
              TabOrder = 1
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
            end
            object DBCheckBox6: TDBCheckBox
              Left = 329
              Top = 72
              Width = 17
              Height = 17
              DataField = 'STATE_MISC_TAX_FLAG'
              DataSource = ds24
              Enabled = False
              TabOrder = 2
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
            end
            object RKeyRzBtnEdit7: TRKeyRzBtnEdit
              Left = 91
              Top = 16
              Width = 121
              Height = 21
              Text = ''
              Color = clBtnFace
              Enabled = False
              TabOrder = 5
              ButtonKind = bkFind
              AltBtnWidth = 15
              ButtonWidth = 15
              OnButtonClick = RKeyRzBtnEdit7ButtonClick
              DataSource = ds24
              DataSourceField = 'CITY_TAX_PTR'
              DispalyTableName = 'data0189'
              DisplaytextField = 'state_id'
              DisplayRetKeyField = 'rkey'
              DisplayNoteField = 'name'
              DisplayPickID = '5'
              DisplayModID = 63
              ForceOnFocus = True
            end
          end
          object RKeyRzBtnEdit6: TRKeyRzBtnEdit
            Left = 101
            Top = 280
            Width = 121
            Height = 21
            Text = ''
            Color = clBtnFace
            Enabled = False
            TabOrder = 13
            ButtonKind = bkFind
            AltBtnWidth = 15
            ButtonWidth = 15
            OnButtonClick = RKeyRzBtnEdit6ButtonClick
            DataSource = ds24
            DataSourceField = 'SHIPPING_METHOD'
            DisplayModID = 63
            ForceOnFocus = True
          end
          object RKeyRzBtnEdit8: TRKeyRzBtnEdit
            Left = 99
            Top = 136
            Width = 121
            Height = 21
            Text = ''
            Color = clBtnFace
            Enabled = False
            TabOrder = 14
            ButtonKind = bkFind
            AltBtnWidth = 15
            ButtonWidth = 15
            DataSource = ds23
            DataSourceField = 'COUNTRY_PTR'
            DispalyTableName = 'data0250'
            DisplaytextField = 'country_code'
            DisplayRetKeyField = 'country_rkey'
            DisplayNoteField = 'country_name'
            DisplayPickID = '1'
            DisplayModID = 63
            ForceOnFocus = True
          end
        end
      end
    end
  end
  object ds23: TDataSource
    DataSet = cds23
    Left = 40
    Top = 120
  end
  object ds24: TDataSource
    DataSet = cds24
    Left = 40
    Top = 168
  end
  object cds23: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 80
    Top = 120
  end
  object cds24: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 80
    Top = 168
  end
  object cds04: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 88
    Top = 216
  end
  object PM1: TPopupMenu
    Left = 152
    Top = 272
    object N1: TMenuItem
      Caption = #28155#21152
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #32534#36753
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #21024#38500
      OnClick = N3Click
    end
  end
  object PM2: TPopupMenu
    OnPopup = PM2Popup
    Left = 440
    Top = 105
    object N4: TMenuItem
      Caption = #19978#20256#25991#20214
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = #25171#24320#25991#20214
      OnClick = N5Click
    end
  end
end
