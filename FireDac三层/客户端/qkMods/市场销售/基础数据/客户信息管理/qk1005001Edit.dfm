inherited frmqk1005001Edit: Tfrmqk1005001Edit
  Caption = 'frmqk1005001Edit'
  ClientHeight = 645
  ClientWidth = 859
  ExplicitWidth = 875
  ExplicitHeight = 684
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBase1: TPanel
    Width = 859
    Height = 645
    ExplicitWidth = 859
    ExplicitHeight = 645
    inherited pnlTop: TPanel
      Width = 859
      ExplicitWidth = 859
    end
    object tv1: TRzTreeView
      Left = 0
      Top = 25
      Width = 225
      Height = 620
      SelectionPen.Color = clBtnShadow
      Align = alLeft
      Indent = 19
      PopupMenu = pmPM1
      ReadOnly = True
      TabOrder = 1
      OnChange = tv1Change
      Items.NodeData = {
        0303000000260000000000000000000000FFFFFFFFFFFFFFFF00000000000000
        00060000000104A25B3762E14F6F60260000000000000000000000FFFFFFFFFF
        FFFFFF0000000000000000000000000104FA572C67E14F6F6026000000000000
        0000000000FFFFFFFFFFFFFFFF0000000000000000000000000104E68BC67EE1
        4F6F60260000000000000000000000FFFFFFFFFFFFFFFF000000000000000000
        0000000104228DA152E14F6F60260000000000000000000000FFFFFFFFFFFFFF
        FF00000000000000000000000001045480FB7CBA4E5854260000000000000000
        000000FFFFFFFFFFFFFFFF0000000000000000000000000104A18B1252895B92
        63260000000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000
        000104A25B376243675096260000000000000000000000FFFFFFFFFFFFFFFF00
        000000000000000000000001040190278D305740572600000000000000000000
        00FFFFFFFFFFFFFFFF0000000000000000000000000104A25B376287656368}
    end
    object pnl1: TPanel
      Left = 225
      Top = 25
      Width = 634
      Height = 620
      Align = alClient
      TabOrder = 2
      object pgc1: TPageControl
        Left = 1
        Top = 1
        Width = 632
        Height = 618
        ActivePage = tsBaseInfo
        Align = alClient
        TabOrder = 0
        object tsBaseInfo: TTabSheet
          Caption = #22522#26412#20449#24687
          object lbl2: TLabel
            Left = 21
            Top = 61
            Width = 105
            Height = 13
            Alignment = taRightJustify
            Caption = #23458#25143#21517#31216'('#20013#25991')'#65306
            Font.Charset = GB2312_CHARSET
            Font.Color = clRed
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object lbl3: TLabel
            Left = 61
            Top = 120
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = #21517#31216#32553#20889#65306
            Font.Charset = GB2312_CHARSET
            Font.Color = clRed
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object lbl4: TLabel
            Left = 61
            Top = 295
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = #35814#32454#22320#22336#65306
          end
          object lbl5: TLabel
            Left = 80
            Top = 178
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = #24030'/'#30465#65306
          end
          object lbl6: TLabel
            Left = 61
            Top = 208
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = #30005#35805#21495#30721#65306
          end
          object lbl7: TLabel
            Left = 61
            Top = 149
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = #32593#19978#32534#21495#65306
          end
          object lbl8: TLabel
            Left = 61
            Top = 238
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = #30005#23376#37038#20214#65306
          end
          object lbl9: TLabel
            Left = 284
            Top = 178
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = #37038#25919#32534#30721#65306
          end
          object lbl10: TLabel
            Left = 284
            Top = 208
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = #20256#30495#21495#30721#65306
          end
          object lbl11: TLabel
            Left = 21
            Top = 90
            Width = 105
            Height = 13
            Alignment = taRightJustify
            Caption = #23458#25143#21517#31216'('#33521#25991')'#65306
          end
          object lbl12: TLabel
            Left = 87
            Top = 267
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = #32593#22336#65306
          end
          object lbl13: TLabel
            Left = 72
            Top = 338
            Width = 46
            Height = 13
            Caption = #24320#21457#21592':'
          end
          object lbl14: TLabel
            Left = 280
            Top = 337
            Width = 46
            Height = 13
            Caption = #36319#21333#21592':'
          end
          object lbl15: TLabel
            Left = 90
            Top = 387
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = #19994#21153#21592#65306
          end
          object lbl16: TLabel
            Left = 64
            Top = 415
            Width = 78
            Height = 13
            Alignment = taRightJustify
            Caption = #22269#23478#25110#22320#21306#65306
          end
          object lbl17: TLabel
            Left = 77
            Top = 443
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = #36135#24065#31867#22411#65306
          end
          object bvl1: TBevel
            Left = 6
            Top = 368
            Width = 533
            Height = 2
          end
          object lblpeop_ChsName: TRzDBLabel
            Left = 284
            Top = 385
            Width = 105
            Height = 13
            AutoSize = True
            DataField = 'peop_ChsName'
          end
          object lblpeop_ChsName1: TRzDBLabel
            Left = 284
            Top = 416
            Width = 112
            Height = 13
            AutoSize = True
            DataField = 'Reg_Name'
          end
          object lblReg_Name: TRzDBLabel
            Left = 284
            Top = 443
            Width = 77
            Height = 13
            AutoSize = True
            DataField = 'Curr_CHSName'
          end
          object lbl1: TLabel
            Left = 53
            Top = 30
            Width = 65
            Height = 13
            Caption = #23458#25143#20195#30721#65306
            Font.Charset = GB2312_CHARSET
            Font.Color = clRed
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object lbl108: TLabel
            Left = 400
            Top = 128
            Width = 42
            Height = 13
            Caption = 'lbl108'
            Font.Charset = GB2312_CHARSET
            Font.Color = clRed
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object dbedtCUSTOMER_NAME: TRzDBEdit
            Left = 128
            Top = 56
            Width = 337
            Height = 21
            DataSource = dsCustomer
            DataField = 'CUSTOMER_NAME'
            TabOrder = 0
          end
          object edts: TRzDBEdit
            Left = 128
            Top = 116
            Width = 127
            Height = 21
            DataSource = dsCustomer
            DataField = 'ShortName'
            TabOrder = 1
          end
          object dbedtSTATE: TRzDBEdit
            Left = 128
            Top = 174
            Width = 127
            Height = 21
            DataField = 'STATE'
            TabOrder = 2
          end
          object dbedtPHONE: TRzDBEdit
            Left = 128
            Top = 204
            Width = 127
            Height = 21
            DataField = 'PHONE'
            TabOrder = 3
          end
          object dbedtTELEX: TRzDBEdit
            Left = 128
            Top = 145
            Width = 127
            Height = 21
            DataField = 'TELEX'
            TabOrder = 4
          end
          object dbedtGEN_EMAIL_ADDRESS: TRzDBEdit
            Left = 128
            Top = 233
            Width = 337
            Height = 21
            DataField = 'GEN_EMAIL_ADDRESS'
            TabOrder = 5
          end
          object dbedtZIP: TRzDBEdit
            Left = 350
            Top = 174
            Width = 115
            Height = 21
            DataField = 'ZIP'
            TabOrder = 6
          end
          object dbedtFAX: TRzDBEdit
            Left = 350
            Top = 204
            Width = 115
            Height = 21
            DataField = 'FAX'
            TabOrder = 7
          end
          object dbmmoBILLING_ADDRESS_1: TDBMemo
            Left = 128
            Top = 293
            Width = 337
            Height = 32
            DataField = 'BILLING_ADDRESS_1'
            MaxLength = 100
            TabOrder = 8
          end
          object edtCUSTOMER_NAME_EN: TRzDBEdit
            Left = 128
            Top = 86
            Width = 337
            Height = 21
            DataSource = dsCustomer
            DataField = 'CUSTOMER_NAME_EN'
            TabOrder = 9
          end
          object dbchkEDI_IN_LOGGING: TDBCheckBox
            Left = 336
            Top = 28
            Width = 247
            Height = 17
            Hint = #21246#36873#21518#20165#26377#26435#38480#30340#20154#21592#21487#20197#26597#30475#35813#23458#25143
            Caption = #38750#20844#20849#23458#25143#65288#20010#20154#23458#25143','#20165#25480#26435#21487#35265#65289
            DataField = 'EDI_IN_LOGGING'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 10
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbedtBILLING_ADDRESS_2: TRzDBEdit
            Left = 128
            Top = 263
            Width = 337
            Height = 21
            DataField = 'BILLING_ADDRESS_2'
            TabOrder = 11
          end
          object dbedtANALYSIS_CODE4: TRzDBEdit
            Left = 128
            Top = 333
            Width = 121
            Height = 21
            DataField = 'ANALYSIS_CODE4'
            TabOrder = 12
          end
          object dbedtANALYSIS_CODE5: TRzDBEdit
            Left = 336
            Top = 333
            Width = 121
            Height = 21
            DataField = 'ANALYSIS_CODE5'
            TabOrder = 13
          end
          object btn1: TBitBtn
            Tag = 1
            Left = 255
            Top = 381
            Width = 24
            Height = 24
            Hint = #38144#21806#20195#34920#25628#32034
            Glyph.Data = {
              EE000000424DEE000000000000007600000028000000100000000F0000000100
              04000000000078000000130B0000130B00001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              888800000888880000080F000888880F00080F000888880F0008000000080000
              000800F000000F00000800F000800F00000800F000800F000008800000000000
              0088880F00080F000888880000080000088888800088800088888880F08880F0
              888888800088800088888888888888888888}
            ParentShowHint = False
            ShowHint = True
            TabOrder = 14
            TabStop = False
            OnClick = btn1Click
          end
          object btn2: TBitBtn
            Tag = 2
            Left = 255
            Top = 409
            Width = 24
            Height = 24
            Hint = #22269#23478#21644#22320#21306#25628#32034
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
              333333777777777F33333330B00000003333337F7777777F3333333000000000
              333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
              333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
              03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
              03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
              3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
              333333333377F7F33333333333330F03333333333337F7F33333333333330B03
              3333333333373733333333333333303333333333333373333333}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            TabOrder = 15
            TabStop = False
            OnClick = btn2Click
          end
          object btn3: TBitBtn
            Tag = 3
            Left = 255
            Top = 437
            Width = 24
            Height = 24
            Hint = #36135#24065#25628#32034
            Glyph.Data = {
              EE000000424DEE000000000000007600000028000000100000000F0000000100
              04000000000078000000130B0000130B00001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              888800000888880000080F000888880F00080F000888880F0008000000080000
              000800F000000F00000800F000800F00000800F000800F000008800000000000
              0088880F00080F000888880000080000088888800088800088888880F08880F0
              888888800088800088888888888888888888}
            ParentShowHint = False
            ShowHint = True
            TabOrder = 16
            TabStop = False
            OnClick = btn3Click
          end
          object dbrgrpCUSTOMER_TYPE: TRzDBRadioGroup
            Left = 32
            Top = 467
            Width = 480
            Height = 65
            DataField = 'CUSTOMER_TYPE'
            Items.Strings = (
              #27491#24120
              #26032#21512#20316
              #25511#21046
              #20572#27490)
            Values.Strings = (
              '1'
              '2'
              '3'
              '4')
            Caption = #23458#25143#29366#24577
            Columns = 4
            TabOrder = 17
            TabStop = True
          end
          object edtPeopIDCode: TRzDBEdit
            Left = 144
            Top = 382
            Width = 105
            Height = 21
            DataField = 'PeopIDCode'
            TabOrder = 18
          end
          object edtPeopIDCode1: TRzDBEdit
            Left = 144
            Top = 412
            Width = 105
            Height = 21
            DataField = 'Reg_Code'
            TabOrder = 19
          end
          object edtReg_Code: TRzDBEdit
            Left = 144
            Top = 440
            Width = 105
            Height = 21
            DataField = 'Curr_Code'
            TabOrder = 20
          end
          object cbxManuCode: TRzCheckBox
            Left = 239
            Top = 30
            Width = 71
            Height = 15
            AlignmentVertical = avBottom
            Caption = #25163#21160#32534#30721
            State = cbUnchecked
            TabOrder = 21
          end
          object edtCust_Code: TRzDBEdit
            Left = 128
            Top = 24
            Width = 100
            Height = 21
            DataSource = dsCustomer
            DataField = 'Cust_Code'
            ReadOnly = True
            Color = clInfoBk
            TabOrder = 22
          end
        end
        object tsTabSheet2: TTabSheet
          Caption = #35814#32454#20449#24687
          object lbl18: TLabel
            Left = 48
            Top = 28
            Width = 65
            Height = 13
            Caption = #20027#35201#20135#21697#65306
          end
          object lbl19: TLabel
            Left = 35
            Top = 62
            Width = 78
            Height = 13
            Caption = #27861#23450#20195#34920#20154#65306
          end
          object lbl20: TLabel
            Left = 48
            Top = 96
            Width = 65
            Height = 13
            Caption = #30005#35805#21495#30721#65306
          end
          object lbl21: TLabel
            Left = 280
            Top = 96
            Width = 65
            Height = 13
            Caption = #31227#21160#30005#35805#65306
          end
          object lbl22: TLabel
            Left = 48
            Top = 130
            Width = 65
            Height = 13
            Caption = #20225#19994#24615#36136#65306
          end
          object lbl23: TLabel
            Left = 280
            Top = 130
            Width = 65
            Height = 13
            Caption = #25104#31435#26085#26399#65306
          end
          object lbl24: TLabel
            Left = 48
            Top = 164
            Width = 65
            Height = 13
            Caption = #21592#24037#20154#25968#65306
          end
          object lbl25: TLabel
            Left = 280
            Top = 164
            Width = 65
            Height = 13
            Caption = #27880#20876#36164#37329#65306
          end
          object lbl26: TLabel
            Left = 48
            Top = 198
            Width = 65
            Height = 13
            Caption = #26376#38144#21806#39069#65306
          end
          object lbl27: TLabel
            Left = 272
            Top = 198
            Width = 73
            Height = 13
            Caption = 'PCB'#26376#29992#37327#65306
          end
          object lbl28: TLabel
            Left = 48
            Top = 254
            Width = 65
            Height = 13
            Caption = #21378#25151#36164#20135#65306
          end
          object lbl29: TLabel
            Left = 22
            Top = 288
            Width = 91
            Height = 13
            Caption = #22266#23450#36164#20135#35268#27169#65306
          end
          object lbl30: TLabel
            Left = 22
            Top = 318
            Width = 91
            Height = 13
            Caption = #24320#22987#21512#20316#26085#26399#65306
          end
          object lbl31: TLabel
            Left = 47
            Top = 226
            Width = 65
            Height = 13
            Caption = #21407#20379#24212#21830#65306
          end
          object lbl32: TLabel
            Left = 22
            Top = 377
            Width = 91
            Height = 13
            Caption = #38144#21806#22870#37329#20998#37197#65306
          end
          object lbl33: TLabel
            Left = 240
            Top = 376
            Width = 21
            Height = 13
            Caption = '%  '
          end
          object lbl34: TLabel
            Left = 48
            Top = 348
            Width = 65
            Height = 13
            Caption = #32467#36134#26085#26399#65306
          end
          object bvl2: TBevel
            Left = 16
            Top = 445
            Width = 481
            Height = 40
            Shape = bsFrame
          end
          object dbedtEDI_ID: TDBEdit
            Left = 112
            Top = 24
            Width = 361
            Height = 21
            DataField = 'EDI_ID'
            TabOrder = 0
          end
          object dbedtBILLING_ADDRESS_3: TDBEdit
            Left = 112
            Top = 58
            Width = 121
            Height = 21
            DataField = 'BILLING_ADDRESS_3'
            TabOrder = 1
          end
          object dbedtOUTGOING_FORM_ADDR2: TDBEdit
            Left = 112
            Top = 92
            Width = 121
            Height = 21
            DataField = 'OUTGOING_FORM_ADDR2'
            TabOrder = 2
          end
          object dbedtOUTGOING_FORM_ADDR3: TDBEdit
            Left = 352
            Top = 92
            Width = 121
            Height = 21
            DataField = 'OUTGOING_FORM_ADDR3'
            TabOrder = 3
          end
          object dbedtOUTGOING_FORM_ADDR1: TDBEdit
            Left = 112
            Top = 126
            Width = 121
            Height = 21
            DataField = 'OUTGOING_FORM_ADDR1'
            TabOrder = 4
          end
          object dbedtSMOOTHING_THRESHOLD: TDBEdit
            Left = 112
            Top = 160
            Width = 121
            Height = 21
            DataField = 'SMOOTHING_THRESHOLD'
            TabOrder = 5
          end
          object dbedtCAPITAL: TDBEdit
            Left = 352
            Top = 160
            Width = 121
            Height = 21
            DataField = 'CAPITAL'
            TabOrder = 6
          end
          object dbedtMONTH_AMOUNT: TDBEdit
            Left = 112
            Top = 194
            Width = 121
            Height = 21
            DataField = 'MONTH_AMOUNT'
            TabOrder = 7
          end
          object dbedtMONTH_PCBAMOUNT: TDBEdit
            Left = 352
            Top = 194
            Width = 121
            Height = 21
            DataField = 'MONTH_PCBAMOUNT'
            TabOrder = 8
          end
          object dbedtFIXED_SCOPE: TDBEdit
            Left = 112
            Top = 284
            Width = 121
            Height = 21
            DataField = 'FIXED_SCOPE'
            TabOrder = 9
          end
          object dbedtOUTGOING_FORM_NAME: TDBEdit
            Left = 111
            Top = 222
            Width = 361
            Height = 21
            DataField = 'OUTGOING_FORM_NAME'
            TabOrder = 10
          end
          object dbedtSALES_DISCOUNT: TDBEdit
            Left = 112
            Top = 373
            Width = 121
            Height = 21
            DataField = 'SALES_DISCOUNT'
            TabOrder = 11
          end
          object dbcbbHOUSE_FIXED: TDBComboBox
            Left = 112
            Top = 250
            Width = 121
            Height = 21
            DataField = 'HOUSE_FIXED'
            Items.Strings = (
              #33258#24314
              #31199#36161)
            TabOrder = 12
          end
          object dbchkEDI_FLAG_FOR_SOACK: TDBCheckBox
            Left = 208
            Top = 456
            Width = 80
            Height = 17
            Caption = #26159#21542#36716#21378
            DataField = 'EDI_FLAG_FOR_SOACK'
            TabOrder = 13
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbedtEDI_FLAG_CREDIT_MEMO: TDBEdit
            Left = 112
            Top = 344
            Width = 65
            Height = 21
            DataField = 'EDI_FLAG_CREDIT_MEMO'
            TabOrder = 14
          end
          object edtCUST_ENT_DATE: TDBDateTimeEditEh
            Left = 112
            Top = 314
            Width = 121
            Height = 21
            DataField = 'CUST_ENT_DATE'
            DynProps = <>
            EditButtons = <>
            Kind = dtkDateEh
            TabOrder = 15
            Visible = True
          end
          object edtLAST_ACTIVE_DATE: TDBDateTimeEditEh
            Left = 352
            Top = 126
            Width = 121
            Height = 21
            DataField = 'LAST_ACTIVE_DATE'
            DynProps = <>
            EditButtons = <>
            Kind = dtkDateEh
            TabOrder = 16
            Visible = True
          end
          object dbchkDO_SMOOTHING: TDBCheckBox
            Left = 308
            Top = 455
            Width = 97
            Height = 17
            Caption = #23492#21806#26041#24335
            DataField = 'DO_SMOOTHING'
            TabOrder = 17
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbchkCONSUME_FORECASTS: TDBCheckBox
            Left = 72
            Top = 457
            Width = 129
            Height = 17
            Caption = #32477#23545#20445#35777#25353#26399#20132#36135
            DataField = 'CONSUME_FORECASTS'
            TabOrder = 18
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbrgrpLANGUAGE_FLAG: TRzDBRadioGroup
            Left = 256
            Top = 248
            Width = 217
            Height = 185
            DataField = 'LANGUAGE_FLAG'
            Items.Strings = (
              'A:'#20869#38144#24320#21333
              'B:'#20869#38144#19981#24320#21333
              'C:'#30452#25509#20986#21475
              'D:'#36716#21378#20986#21475
              'E:'#22996#25176#21152#24037#24320#21333
              'F:'#22996#25176#21152#24037#19981#24320#21333
              'H:'#24555#36882#20986#21475)
            Values.Strings = (
              'A'
              'B'
              'C'
              'D'
              'E'
              'F'
              'H')
            Caption = #21512#20316#31867#22411
            TabOrder = 19
          end
          object dbchkquote_flag: TDBCheckBox
            Left = 114
            Top = 403
            Width = 135
            Height = 17
            Caption = #35746#21333#20215#26684#19982#25253#20215#20851#32852
            DataField = 'quote_flag'
            TabOrder = 20
          end
        end
        object tsTabSheet3: TTabSheet
          Caption = #36130#21153#20449#24687
          object grp1: TRzGroupBox
            Left = 0
            Top = 0
            Width = 624
            Height = 340
            Align = alClient
            Caption = #36130#21153#20449#24687
            TabOrder = 0
            object lbl35: TLabel
              Left = 35
              Top = 23
              Width = 65
              Height = 13
              Caption = #20184#27454#26041#24335#65306
            end
            object lbl36: TLabel
              Left = 260
              Top = 23
              Width = 104
              Height = 13
              Caption = #29616#37329#25240#25187#30334#20998#27604#65306
            end
            object lbl37: TLabel
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
            object lbl38: TLabel
              Left = 299
              Top = 49
              Width = 65
              Height = 13
              Caption = #25240#25187#22825#25968#65306
            end
            object lbl39: TLabel
              Left = 299
              Top = 75
              Width = 65
              Height = 13
              Caption = #26376#32467#22825#25968#65306
            end
            object lbl40: TLabel
              Left = 260
              Top = 101
              Width = 104
              Height = 13
              Caption = #26410#20184#27454#26368#22810#36229#26399#65306
            end
            object lbl41: TLabel
              Left = 456
              Top = 101
              Width = 27
              Height = 13
              Caption = #22825'  '
            end
            object lbl42: TLabel
              Left = 40
              Top = 133
              Width = 60
              Height = 13
              Caption = 'A/R'#36134#30446#65306
            end
            object lbl43: TLabel
              Left = 264
              Top = 133
              Width = 7
              Height = 13
            end
            object lbl44: TLabel
              Left = 35
              Top = 49
              Width = 65
              Height = 13
              Caption = #20449#29992#31561#32423#65306
            end
            object lbl45: TLabel
              Left = 35
              Top = 75
              Width = 65
              Height = 13
              Caption = #20449#29992#38480#39069#65306
            end
            object lbl46: TLabel
              Left = 9
              Top = 101
              Width = 91
              Height = 13
              Caption = #25253#20215#25215#21463#33021#21147#65306
            end
            object lbl47: TLabel
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
            object lbl48: TLabel
              Left = 259
              Top = 166
              Width = 65
              Height = 13
              Caption = #21457#31080#31867#22411#65306
            end
            object lbl49: TLabel
              Left = 5
              Top = 197
              Width = 85
              Height = 13
              Alignment = taRightJustify
              Caption = #30003#35831#20445#38505#37329#39069':'
            end
            object lbl50: TLabel
              Left = 272
              Top = 196
              Width = 85
              Height = 13
              Alignment = taRightJustify
              Caption = #25209#20934#20445#38505#37329#39069':'
            end
            object dbedtFED_TAX_ID_NO: TDBEdit
              Left = 96
              Top = 19
              Width = 153
              Height = 21
              DataField = 'FED_TAX_ID_NO'
              TabOrder = 0
            end
            object dbedtDISCOUNT_PCT: TDBEdit
              Left = 360
              Top = 19
              Width = 81
              Height = 21
              DataField = 'DISCOUNT_PCT'
              TabOrder = 4
            end
            object dbedtDISCOUNT_DAYS: TDBEdit
              Left = 360
              Top = 45
              Width = 81
              Height = 21
              DataField = 'DISCOUNT_DAYS'
              TabOrder = 5
            end
            object dbedtNET_PAY: TDBEdit
              Left = 360
              Top = 71
              Width = 81
              Height = 21
              DataField = 'NET_PAY'
              TabOrder = 6
            end
            object dbedtINVOICE_NOTE_PAD_PTR: TDBEdit
              Left = 360
              Top = 97
              Width = 81
              Height = 21
              DataField = 'INVOICE_NOTE_PAD_PTR'
              TabOrder = 7
            end
            object dbedtCREDIT_LIMIT: TDBEdit
              Left = 96
              Top = 71
              Width = 105
              Height = 21
              DataField = 'CREDIT_LIMIT'
              TabOrder = 2
            end
            object dbedtquote_factor: TDBEdit
              Left = 96
              Top = 97
              Width = 73
              Height = 21
              DataField = 'quote_factor'
              TabOrder = 3
            end
            object cbx1: TComboBox
              Left = 96
              Top = 45
              Width = 105
              Height = 21
              Style = csDropDownList
              ItemIndex = 2
              TabOrder = 1
              Text = #24046
              Items.Strings = (
                #20248
                #33391
                #24046)
            end
            object dbchkCOD_FLAG: TDBCheckBox
              Left = 33
              Top = 220
              Width = 101
              Height = 17
              Caption = #27454#21040#21457#36135#26631#35782
              DataField = 'COD_FLAG'
              TabOrder = 10
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
            end
            object edt1: TEdit
              Left = 96
              Top = 129
              Width = 121
              Height = 21
              TabOrder = 8
              Text = 'edt1'
            end
            object btn4: TBitBtn
              Tag = 4
              Left = 224
              Top = 125
              Width = 28
              Height = 29
              Glyph.Data = {
                5E060000424D5E06000000000000360400002800000017000000170000000100
                08000000000028020000C40E0000C40E0000000100000000000000000000E8E0
                0000D0A000006060600038383800F0700000B8B8C00020202000A8B0B000F0F0
                F800B8400000C0600800A0A0A000E0E0E800D8D8E000B8100000D0D8D800C0A0
                8800B8300000F8F8080098989800B0504000B0908800B8706000E0A86000E0D8
                C000F070380088888800F0D8B0005858580008101000E0D0B000B8504000E8C8
                A000F0B85000E8D8A800C8C8C800D8982000D8C0B00050505000C8803800F0C8
                8800F8500800D8A040007078780008080800E8C0880028283000F8980000E8F0
                F00040404000B0B8B800B8A0A000C0682800E0A87800F0800000C8D0D000C898
                8000E0A88000D8904800E0E0E000F0A0000070707000E0783000B0888800E8D0
                6800C8B8A800C8700800D8885000B850180028282000B8887800F0F0D8001818
                1800F070180090909000D8C05800E8B09800F8F0E000F8F0F00048484800B8C0
                C800F0C06000F8F8F800F8805800F8F0C80080808000B8906000B0B0B000D090
                5000F8600000D8D0C800E0A05800B8585800B8B00000B8481000D0D0B000D078
                3000C0702000F0A86800C0602000E8E8E800A8A8A800F0C0B800B0201000F0A8
                4000E0B89000B8B8B80068686800F0F0E800F0982000D8D0A800E8C88000F0E0
                C000B8380800F0800800D8E0E000C0C0C000F0680800B0B0B800C0601800E0B8
                7800F0981000C8781800C0C8C80010101800C8A09000E0B8600030303000F0F0
                F000C0B8B80028282800E8E0E000F0F8F8003838400078787800F0D8B800D8C8
                B800F0C89000E0E8E800B8601000D0883800F8680800D8D0B800E8D08800C8C8
                D000D0D0D000B8B0B00058586000D8D8D8002820200010101000E8E8F000F8F8
                F000D8D0D000B8786000B8480000F0780000F0880000E0B08000B8C0C000B818
                0000C0A88800B8300800B0504800F0E0B000E8D0B000F0D08800F8501000F880
                0800ECFD7F0002000000000000001300E8000100000001000A0000884000F877
                78004B1B00000100000000998400E6775400F71200000101010001D8F8001200
                450090FB7700801FF80077FFFF00FFFF6000F8120000AD84E6007760F8001200
                D80084E677000000000000FFFF0000003800A8F8000038A8F800001800000000
                00000000000044F8120000400000000000000000000028F81200000000000000
                00000000000000000000000C000000000200000000000101120000872B00F877
                0000ECFD7F00000000000002000000006C00001A0200804B1B00007FFF00FFFF
                000000000000804B1B00000500000000870031E6770084F8120000218600E677
                9800F81200006713000010FFFF00000020000100000038A8F800000000000000
                7000F8120000ACF8120000D8F8001200100030001000F8400000105F5400E677
                200001000000D0F8120000D8F80012000800000000000E0000005353F6808080
                8080808080808080868080808653770077005353B22424776F776F776F147E14
                141B57771D24F66C0000C5B200B2C5000000C5000000C50000008014F6B29480
                77003253532401308A7E55245524552467516C6CB26C1D14530080550E24246F
                7E2424240E242424246F86B26C80775398003231550E538D5324241B14146F51
                6F1BF66C1D14533153008653246E67310E57F600C5B2866C1D002C8086539853
                53003253524330311D006F242451142FB24C1D6C1D535353530080538A304D80
                1B53246F066F062494B2DF5786535355980080535355576C537E351235146F77
                242F80141D535331530080539855F6532402354312357714776FF61480539853
                530080535314B253AA575257431557125751801B1D535353530080535314F653
                988A245217357E43E924F65786535355980032535314805353535324527E2451
                2424801B1D5353315300865353248055535598550E241735246FF61486539853
                53001D5353536C6C535353248A242257538632511D5353535300865398535332
                145353AA7E240E551B806C6F8653535598001D535353530E1D805353535355C5
                32246C51325353315300945353559853985780B2C5B286176724F62480539853
                53006C53530E5353535355242424536E5A173224805353535300801D86555355
                98535353535353015A5700B2945353559800570E1D5353535353535353535353
                AA241753535353315300986C801D941D861D86808080868080B22C5353559853
                5300}
              TabOrder = 9
              TabStop = False
            end
            object dbrgrpREG_TAX_FIXED_UNUSED: TRzDBRadioGroup
              Left = 43
              Top = 156
              Width = 178
              Height = 35
              DataField = 'REG_TAX_FIXED_UNUSED'
              Items.Strings = (
                #26376#32467
                #36135#21040)
              Values.Strings = (
                '0'
                '1')
              Caption = #21457#31080#21040#26399#26085#35745#31639#26041#27861
              Columns = 2
              TabOrder = 11
            end
            object dbchkEDI_FLAG_FOR_INVOICE: TDBCheckBox
              Left = 270
              Top = 221
              Width = 72
              Height = 17
              Caption = #20215#26684#21547#31246
              DataField = 'EDI_FLAG_FOR_INVOICE'
              TabOrder = 12
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object dbchkCOFC_FILENAME: TDBCheckBox
              Left = 347
              Top = 219
              Width = 126
              Height = 17
              Caption = #24212#25910#24080#40836#30701#20449#36890#30693
              DataField = 'COFC_FILENAME'
              TabOrder = 13
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
            end
            object dbchkQUOTE_FACTOR1: TDBCheckBox
              Left = 144
              Top = 220
              Width = 122
              Height = 17
              Caption = #27454#21040#21457#36135#36830#32493#19979#21333
              DataField = 'QUOTE_FACTOR1'
              TabOrder = 14
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object dbcbbINVOICE_TYPE: TDBComboBox
              Left = 320
              Top = 163
              Width = 122
              Height = 21
              DataField = 'INVOICE_TYPE'
              Items.Strings = (
                #26222#36890#21457#31080
                #22686#20540#31246#19987#29992#21457#31080
                #22686#20540#31246#26222#36890#21457#31080
                'Invoice')
              TabOrder = 15
            end
            object dbedtHIGH_BALANCE: TDBEdit
              Left = 95
              Top = 194
              Width = 121
              Height = 21
              DataField = 'HIGH_BALANCE'
              TabOrder = 16
            end
            object dbedtBALANCE_DUE: TDBEdit
              Left = 362
              Top = 193
              Width = 121
              Height = 21
              DataField = 'BALANCE_DUE'
              TabOrder = 17
            end
          end
          object grp2: TRzGroupBox
            Left = 0
            Top = 340
            Width = 624
            Height = 249
            Align = alBottom
            Caption = #21508#37096#38376#32771#26680#35780#35821
            TabOrder = 1
            ExplicitTop = 344
            ExplicitWidth = 626
            object lbl51: TLabel
              Left = 55
              Top = 123
              Width = 78
              Height = 13
              Caption = #24314#35758#26376#20449#29992#39069
            end
            object lbl52: TLabel
              Left = 134
              Top = 123
              Width = 40
              Height = 13
              Caption = '('#19975#20803')'
            end
            object lbl53: TLabel
              Left = 176
              Top = 123
              Width = 65
              Height = 13
              Caption = #26368#39640#27424#27454#39069
            end
            object lbl54: TLabel
              Left = 240
              Top = 123
              Width = 40
              Height = 13
              Caption = '('#19975#20803')'
            end
            object lbl55: TLabel
              Left = 20
              Top = 20
              Width = 52
              Height = 13
              Caption = #19994#21153#21592#65306
            end
            object lbl56: TLabel
              Left = 20
              Top = 46
              Width = 52
              Height = 13
              Caption = #24066#22330#37096#65306
            end
            object lbl57: TLabel
              Left = 20
              Top = 72
              Width = 52
              Height = 13
              Caption = #36130#21153#37096#65306
            end
            object lbl58: TLabel
              Left = 20
              Top = 99
              Width = 52
              Height = 13
              Caption = #24635#32463#21150#65306
            end
            object lbl59: TLabel
              Left = 306
              Top = 123
              Width = 52
              Height = 13
              Caption = #35780#23457#31614#21517
            end
            object lbl60: TLabel
              Left = 422
              Top = 123
              Width = 52
              Height = 13
              Caption = #35780#23457#26085#26399
            end
            object lbl61: TLabel
              Left = 20
              Top = 146
              Width = 52
              Height = 13
              Caption = #19994#21153#21592#65306
            end
            object lbl62: TLabel
              Left = 20
              Top = 173
              Width = 52
              Height = 13
              Caption = #24066#22330#37096#65306
            end
            object lbl63: TLabel
              Left = 20
              Top = 200
              Width = 52
              Height = 13
              Caption = #36130#21153#37096#65306
            end
            object lbl64: TLabel
              Left = 20
              Top = 227
              Width = 52
              Height = 13
              Caption = #24635#32463#21150#65306
            end
            object dbedtREP_EVAL: TDBEdit
              Left = 68
              Top = 16
              Width = 425
              Height = 21
              DataField = 'REP_EVAL'
              TabOrder = 0
            end
            object dbedtMAK_EVAL: TDBEdit
              Left = 68
              Top = 42
              Width = 425
              Height = 21
              DataField = 'MAK_EVAL'
              TabOrder = 1
            end
            object dbedtFIN_EVAL: TDBEdit
              Left = 68
              Top = 68
              Width = 425
              Height = 21
              DataField = 'FIN_EVAL'
              TabOrder = 2
            end
            object dbedtMARMANG_EVAL: TDBEdit
              Left = 68
              Top = 95
              Width = 425
              Height = 21
              DataField = 'MARMANG_EVAL'
              TabOrder = 3
            end
            object dbedtREP_CREDIT: TDBEdit
              Left = 68
              Top = 142
              Width = 89
              Height = 21
              DataField = 'REP_CREDIT'
              TabOrder = 4
            end
            object dbedtMAK_CREDIT: TDBEdit
              Left = 68
              Top = 169
              Width = 89
              Height = 21
              DataField = 'MAK_CREDIT'
              TabOrder = 8
            end
            object dbedtFIN_CREDIT: TDBEdit
              Left = 68
              Top = 196
              Width = 89
              Height = 21
              DataField = 'FIN_CREDIT'
              TabOrder = 12
            end
            object dbedtMARMANG_CREDIT: TDBEdit
              Left = 68
              Top = 223
              Width = 89
              Height = 21
              DataField = 'MARMANG_CREDIT'
              TabOrder = 16
            end
            object dbedtREP_HIGH: TDBEdit
              Left = 178
              Top = 142
              Width = 89
              Height = 21
              DataField = 'REP_HIGH'
              TabOrder = 5
            end
            object dbedtMAK_HIGH: TDBEdit
              Left = 178
              Top = 169
              Width = 89
              Height = 21
              DataField = 'MAK_HIGH'
              TabOrder = 9
            end
            object dbedtFIN_HIGH: TDBEdit
              Left = 178
              Top = 196
              Width = 89
              Height = 21
              DataField = 'FIN_HIGH'
              TabOrder = 13
            end
            object dbedtMARMANG_HIGH: TDBEdit
              Left = 178
              Top = 223
              Width = 89
              Height = 21
              DataField = 'MARMANG_HIGH'
              TabOrder = 17
            end
            object dbedtREP_NAME: TDBEdit
              Left = 288
              Top = 142
              Width = 89
              Height = 21
              DataField = 'REP_NAME'
              TabOrder = 6
            end
            object dbedtMAK_NAME: TDBEdit
              Left = 288
              Top = 169
              Width = 89
              Height = 21
              DataField = 'MAK_NAME'
              TabOrder = 10
            end
            object dbedtFIN_NAME: TDBEdit
              Left = 288
              Top = 196
              Width = 89
              Height = 21
              DataField = 'FIN_NAME'
              TabOrder = 14
            end
            object dbedtMARMANG_NAME: TDBEdit
              Left = 288
              Top = 223
              Width = 89
              Height = 21
              DataField = 'MARMANG_NAME'
              TabOrder = 18
            end
            object edtREP_DATE: TDBDateTimeEditEh
              Left = 398
              Top = 142
              Width = 101
              Height = 21
              DataField = 'REP_DATE'
              DynProps = <>
              EditButtons = <>
              Kind = dtkDateEh
              TabOrder = 7
              Visible = True
            end
            object edtMAK_DATE: TDBDateTimeEditEh
              Left = 398
              Top = 169
              Width = 101
              Height = 21
              DataField = 'MAK_DATE'
              DynProps = <>
              EditButtons = <>
              Kind = dtkDateEh
              TabOrder = 11
              Visible = True
            end
            object edtFIN_DATE: TDBDateTimeEditEh
              Left = 398
              Top = 196
              Width = 101
              Height = 21
              DataField = 'FIN_DATE'
              DynProps = <>
              EditButtons = <>
              Kind = dtkDateEh
              TabOrder = 15
              Visible = True
            end
            object edtMARMANG_DATE: TDBDateTimeEditEh
              Left = 398
              Top = 223
              Width = 101
              Height = 21
              DataField = 'MARMANG_DATE'
              DynProps = <>
              EditButtons = <>
              Kind = dtkDateEh
              TabOrder = 19
              Visible = True
            end
          end
        end
        object tsTabSheet4: TTabSheet
          Caption = #21382#21490#20449#24687
          TabVisible = False
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
        end
        object tsTabSheet5: TTabSheet
          Caption = #32852#31995#20154#21592
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object bvl3: TBevel
            Left = 16
            Top = 8
            Width = 497
            Height = 73
          end
          object bvl4: TBevel
            Left = 16
            Top = 90
            Width = 497
            Height = 73
          end
          object bvl5: TBevel
            Left = 16
            Top = 173
            Width = 497
            Height = 73
          end
          object bvl6: TBevel
            Left = 16
            Top = 255
            Width = 497
            Height = 73
          end
          object bvl7: TBevel
            Left = 16
            Top = 338
            Width = 497
            Height = 73
          end
          object lbl65: TLabel
            Left = 46
            Top = 22
            Width = 78
            Height = 13
            Caption = #19994#21153#32852#31995#20154#65306
          end
          object lbl66: TLabel
            Left = 291
            Top = 22
            Width = 65
            Height = 13
            Caption = #32852#31995#30005#35805#65306
          end
          object lbl67: TLabel
            Left = 33
            Top = 54
            Width = 91
            Height = 13
            Caption = #30005#23376#37038#20214#22320#22336#65306
          end
          object lbl68: TLabel
            Left = 33
            Top = 136
            Width = 91
            Height = 13
            Caption = #30005#23376#37038#20214#22320#22336#65306
          end
          object lbl69: TLabel
            Left = 46
            Top = 104
            Width = 78
            Height = 13
            Caption = #24037#31243#32852#31995#20154#65306
          end
          object lbl70: TLabel
            Left = 291
            Top = 104
            Width = 65
            Height = 13
            Caption = #32852#31995#30005#35805#65306
          end
          object lbl71: TLabel
            Left = 46
            Top = 188
            Width = 78
            Height = 13
            Caption = #21697#31649#32852#31995#20154#65306
          end
          object lbl72: TLabel
            Left = 41
            Top = 228
            Width = 91
            Height = 13
            Caption = #30005#23376#37038#20214#22320#22336#65306
          end
          object lbl73: TLabel
            Left = 291
            Top = 188
            Width = 65
            Height = 13
            Caption = #32852#31995#30005#35805#65306
          end
          object lbl74: TLabel
            Left = 46
            Top = 270
            Width = 78
            Height = 13
            Caption = #36130#21153#32852#31995#20154#65306
          end
          object lbl75: TLabel
            Left = 33
            Top = 302
            Width = 91
            Height = 13
            Caption = #30005#23376#37038#20214#22320#22336#65306
          end
          object lbl76: TLabel
            Left = 291
            Top = 270
            Width = 65
            Height = 13
            Caption = #32852#31995#30005#35805#65306
          end
          object lbl77: TLabel
            Left = 46
            Top = 353
            Width = 78
            Height = 13
            Caption = #25253#20851#32852#31995#20154#65306
          end
          object lbl78: TLabel
            Left = 33
            Top = 385
            Width = 91
            Height = 13
            Caption = #30005#23376#37038#20214#22320#22336#65306
          end
          object lbl79: TLabel
            Left = 291
            Top = 353
            Width = 65
            Height = 13
            Caption = #32852#31995#30005#35805#65306
          end
          object bvl8: TBevel
            Left = 16
            Top = 421
            Width = 497
            Height = 73
          end
          object lbl80: TLabel
            Left = 46
            Top = 435
            Width = 73
            Height = 13
            Caption = 'IQC'#32852#31995#20154#65306
          end
          object lbl81: TLabel
            Left = 33
            Top = 467
            Width = 91
            Height = 13
            Caption = #30005#23376#37038#20214#22320#22336#65306
          end
          object lbl82: TLabel
            Left = 291
            Top = 435
            Width = 65
            Height = 13
            Caption = #32852#31995#30005#35805#65306
          end
          object dbedtCONTACT_NAME_1: TDBEdit
            Left = 125
            Top = 18
            Width = 137
            Height = 21
            DataField = 'CONTACT_NAME_1'
            TabOrder = 0
          end
          object dbedtCONT_PHONE_1: TDBEdit
            Left = 357
            Top = 18
            Width = 137
            Height = 21
            DataField = 'CONT_PHONE_1'
            TabOrder = 1
          end
          object dbedtEMAIL_FOR_CONTACT1: TDBEdit
            Left = 125
            Top = 50
            Width = 369
            Height = 21
            DataField = 'EMAIL_FOR_CONTACT1'
            TabOrder = 2
          end
          object dbedtEMAIL_FOR_CONTACT2: TDBEdit
            Left = 125
            Top = 132
            Width = 369
            Height = 21
            DataField = 'EMAIL_FOR_CONTACT2'
            TabOrder = 3
          end
          object dbedtCONTACT_NAME_2: TDBEdit
            Left = 125
            Top = 100
            Width = 137
            Height = 21
            DataField = 'CONTACT_NAME_2'
            TabOrder = 4
          end
          object dbedtCONT_PHONE_2: TDBEdit
            Left = 357
            Top = 100
            Width = 137
            Height = 21
            DataField = 'CONT_PHONE_2'
            TabOrder = 5
          end
          object dbedtCONTACT_NAME_3: TDBEdit
            Left = 125
            Top = 184
            Width = 137
            Height = 21
            DataField = 'CONTACT_NAME_3'
            TabOrder = 6
          end
          object dbedtEMAIL_FOR_CONTACT3: TDBEdit
            Left = 125
            Top = 216
            Width = 369
            Height = 21
            DataField = 'EMAIL_FOR_CONTACT3'
            TabOrder = 7
          end
          object dbedtCONT_PHONE_3: TDBEdit
            Left = 357
            Top = 184
            Width = 137
            Height = 21
            DataField = 'CONT_PHONE_3'
            TabOrder = 8
          end
          object dbedtCONTACT_NAME_4: TDBEdit
            Left = 125
            Top = 266
            Width = 137
            Height = 21
            DataField = 'CONTACT_NAME_4'
            TabOrder = 9
          end
          object dbedtEMAIL_FOR_CONTACT4: TDBEdit
            Left = 125
            Top = 298
            Width = 369
            Height = 21
            DataField = 'EMAIL_FOR_CONTACT4'
            TabOrder = 10
          end
          object dbedtCONT_PHONE_4: TDBEdit
            Left = 357
            Top = 266
            Width = 137
            Height = 21
            DataField = 'CONT_PHONE_4'
            TabOrder = 11
          end
          object dbedtCONTACT_NAME_5: TDBEdit
            Left = 125
            Top = 349
            Width = 137
            Height = 21
            DataField = 'CONTACT_NAME_5'
            TabOrder = 12
          end
          object dbedtEMAIL_FOR_CONTACT5: TDBEdit
            Left = 125
            Top = 381
            Width = 369
            Height = 21
            DataField = 'EMAIL_FOR_CONTACT5'
            TabOrder = 13
          end
          object dbedtCONT_PHONE_5: TDBEdit
            Left = 357
            Top = 349
            Width = 137
            Height = 21
            DataField = 'CONT_PHONE_5'
            TabOrder = 14
          end
          object dbedtCONTACT_NAME_6: TDBEdit
            Left = 125
            Top = 431
            Width = 137
            Height = 21
            DataField = 'CONTACT_NAME_6'
            TabOrder = 15
          end
          object dbedtEMAIL_FOR_CONTACT6: TDBEdit
            Left = 125
            Top = 463
            Width = 369
            Height = 21
            DataField = 'EMAIL_FOR_CONTACT6'
            TabOrder = 16
          end
          object dbedtCONT_PHONE_6: TDBEdit
            Left = 357
            Top = 431
            Width = 137
            Height = 21
            DataField = 'CONT_PHONE_6'
            TabOrder = 17
          end
        end
        object tsTabSheet6: TTabSheet
          Caption = #35745#21010#23433#25490
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object lbl83: TLabel
            Left = 8
            Top = 20
            Width = 91
            Height = 13
            Caption = #35745#21010#25552#21069#22825#25968#65306
          end
          object lbl84: TLabel
            Left = 224
            Top = 20
            Width = 287
            Height = 13
            Caption = '('#35828#26126#65306#35745#21010#25490#31243#20132#36135#26399#27604#23458#25143#20132#36135#26399#30340#25552#21069#22825#25968')'
          end
          object lbl85: TLabel
            Left = 8
            Top = 50
            Width = 91
            Height = 13
            Caption = #25253#20215#21333#35760#20107#26412#65306
          end
          object lbl86: TLabel
            Left = 8
            Top = 125
            Width = 78
            Height = 13
            Caption = #21457#31080#35760#20107#26412#65306
          end
          object lbl87: TLabel
            Left = 8
            Top = 201
            Width = 91
            Height = 13
            Caption = #35013#31665#21333#35760#20107#26412#65306
          end
          object lbl88: TLabel
            Left = 8
            Top = 276
            Width = 104
            Height = 13
            Caption = #35746#21333#30830#35748#35760#20107#26412#65306
          end
          object lbl89: TLabel
            Left = 8
            Top = 352
            Width = 104
            Height = 13
            Caption = #20449#29992#22791#24536#35760#20107#26412#65306
          end
          object lbl90: TLabel
            Left = 8
            Top = 428
            Width = 104
            Height = 13
            Caption = #19968#33324#20449#24687#35760#20107#26412#65306
          end
          object mmo1: TMemo
            Left = 8
            Top = 66
            Width = 513
            Height = 51
            ScrollBars = ssVertical
            TabOrder = 0
          end
          object mmo2: TMemo
            Left = 8
            Top = 141
            Width = 513
            Height = 51
            ScrollBars = ssVertical
            TabOrder = 1
          end
          object mmo3: TMemo
            Left = 7
            Top = 216
            Width = 513
            Height = 51
            ScrollBars = ssVertical
            TabOrder = 2
          end
          object dbedtDAYS_EARLY_SCHEDULE: TDBEdit
            Left = 96
            Top = 16
            Width = 121
            Height = 21
            DataField = 'DAYS_EARLY_SCHEDULE'
            TabOrder = 3
          end
          object mmo4: TMemo
            Left = 7
            Top = 292
            Width = 513
            Height = 51
            ScrollBars = ssVertical
            TabOrder = 4
          end
          object mmo5: TMemo
            Left = 7
            Top = 367
            Width = 513
            Height = 51
            ScrollBars = ssVertical
            TabOrder = 5
          end
          object mmo6: TMemo
            Left = 7
            Top = 443
            Width = 513
            Height = 51
            ScrollBars = ssVertical
            TabOrder = 6
          end
        end
        object tsTabSheet7: TTabSheet
          Caption = #36865#36135#22320#22336
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object lbl91: TLabel
            Left = 56
            Top = 78
            Width = 65
            Height = 13
            Caption = #35814#32454#22320#22336#65306
          end
          object lbl92: TLabel
            Left = 75
            Top = 190
            Width = 46
            Height = 13
            Caption = #30465'/'#24030#65306
          end
          object lbl93: TLabel
            Left = 296
            Top = 190
            Width = 65
            Height = 13
            Caption = #37038#25919#32534#30721#65306
          end
          object lbl94: TLabel
            Left = 69
            Top = 230
            Width = 52
            Height = 13
            Caption = #32852#32476#20154#65306
          end
          object lbl95: TLabel
            Left = 56
            Top = 271
            Width = 65
            Height = 13
            Caption = #30005#35805#21495#30721#65306
          end
          object lbl96: TLabel
            Left = 296
            Top = 271
            Width = 65
            Height = 13
            Caption = #20256#30495#21495#30721#65306
          end
          object lbl97: TLabel
            Left = 56
            Top = 392
            Width = 65
            Height = 13
            Caption = #30005#23376#37038#20214#65306
          end
          object lbl98: TLabel
            Left = 26
            Top = 433
            Width = 95
            Height = 13
            Caption = 'Internet'#32593#22336#65306
          end
          object lbl99: TLabel
            Left = 56
            Top = 311
            Width = 65
            Height = 13
            Caption = #35013#36816#26041#27861#65306
          end
          object lbl100: TLabel
            Left = 270
            Top = 311
            Width = 91
            Height = 13
            Caption = #35013#36816#25552#21069#22825#25968#65306
          end
          object lbl101: TLabel
            Left = 56
            Top = 352
            Width = 65
            Height = 13
            Caption = #21457#36135#22320#28857#65306
          end
          object lbl102: TLabel
            Left = 296
            Top = 352
            Width = 65
            Height = 13
            Caption = #21040#36798#22320#28857#65306
          end
          object dbedtSHIP_TO_ADDRESS_1: TDBEdit
            Left = 120
            Top = 74
            Width = 361
            Height = 89
            AutoSize = False
            Color = clMenu
            DataField = 'SHIP_TO_ADDRESS_1'
            DataSource = dsAddress
            TabOrder = 0
          end
          object dbedtSTATE1: TDBEdit
            Left = 120
            Top = 186
            Width = 121
            Height = 21
            Color = clMenu
            DataField = 'STATE'
            DataSource = dsAddress
            TabOrder = 1
          end
          object dbedtZIP1: TDBEdit
            Left = 360
            Top = 186
            Width = 121
            Height = 21
            Color = clMenu
            DataField = 'ZIP'
            DataSource = dsAddress
            TabOrder = 2
          end
          object dbedtSHIP_TO_CONTACT: TDBEdit
            Left = 120
            Top = 226
            Width = 121
            Height = 21
            Color = clMenu
            DataField = 'SHIP_TO_CONTACT'
            DataSource = dsAddress
            TabOrder = 3
          end
          object dbedtSHIP_TO_PHONE: TDBEdit
            Left = 120
            Top = 267
            Width = 121
            Height = 21
            Color = clMenu
            DataField = 'SHIP_TO_PHONE'
            DataSource = dsAddress
            TabOrder = 4
          end
          object dbedtSHIP_TO_FAX: TDBEdit
            Left = 360
            Top = 267
            Width = 121
            Height = 21
            Color = clMenu
            DataField = 'SHIP_TO_FAX'
            DataSource = dsAddress
            TabOrder = 5
          end
          object dbedtEMAIL_FOR_CONTACT: TDBEdit
            Left = 120
            Top = 388
            Width = 361
            Height = 21
            Color = clMenu
            DataField = 'EMAIL_FOR_CONTACT'
            DataSource = dsAddress
            TabOrder = 6
          end
          object dbedtSHIP_TO_ADDRESS_2: TDBEdit
            Left = 120
            Top = 429
            Width = 361
            Height = 21
            Color = clMenu
            DataField = 'SHIP_TO_ADDRESS_2'
            DataSource = dsAddress
            TabOrder = 7
          end
          object dbchkLANGUAGE_FLAG: TDBCheckBox
            Left = 120
            Top = 37
            Width = 97
            Height = 17
            Caption = #40664#35748#35013#36816#22320#28857
            DataField = 'LANGUAGE_FLAG'
            DataSource = dsAddress
            TabOrder = 8
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
          end
          object dbedtSHIP_SHIPPING_METHOD: TDBEdit
            Left = 120
            Top = 307
            Width = 121
            Height = 21
            Color = clMenu
            DataField = 'SHIP_SHIPPING_METHOD'
            DataSource = dsAddress
            TabOrder = 9
          end
          object dbedtSHIP_LEAD_TIME: TDBEdit
            Left = 360
            Top = 307
            Width = 121
            Height = 21
            Color = clMenu
            DataField = 'SHIP_LEAD_TIME'
            DataSource = dsAddress
            TabOrder = 10
          end
          object dbedtLOCNAME_FOR_FORM: TDBEdit
            Left = 120
            Top = 348
            Width = 121
            Height = 21
            Color = clMenu
            DataField = 'LOCNAME_FOR_FORM'
            DataSource = dsAddress
            TabOrder = 11
          end
          object dbedtSHP_ADDR1_FOR_FORM: TDBEdit
            Left = 360
            Top = 348
            Width = 121
            Height = 21
            Color = clMenu
            DataField = 'SHP_ADDR1_FOR_FORM'
            DataSource = dsAddress
            TabOrder = 12
          end
        end
        object tsTabSheet8: TTabSheet
          Caption = #23458#25143#25991#26723
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnl2: TPanel
            Left = 0
            Top = 401
            Width = 626
            Height = 192
            Align = alClient
            TabOrder = 0
            object btnBtnUpload: TSpeedButton
              Left = 527
              Top = 20
              Width = 34
              Height = 22
              Caption = #19978#36733
              OnClick = btnBtnUploadClick
            end
            object lbl103: TLabel
              Left = 40
              Top = 24
              Width = 65
              Height = 13
              Caption = #23458#25143#25991#26723#65306
            end
            object lbl104: TLabel
              Left = 61
              Top = 56
              Width = 39
              Height = 13
              Caption = #22791#27880#65306
            end
            object lbl105: TLabel
              Left = 40
              Top = 136
              Width = 65
              Height = 13
              Caption = #19978#20256#26085#26399#65306
            end
            object lbl106: TLabel
              Left = 264
              Top = 136
              Width = 52
              Height = 13
              Caption = #19978#20256#20154#65306
            end
            object lblCraeteDateTime: TRzDBLabel
              Left = 106
              Top = 136
              Width = 65
              Height = 17
              DataField = 'CraeteDateTime'
              DataSource = dsFiles
            end
            object lblUpdatePerson: TRzDBLabel
              Left = 322
              Top = 136
              Width = 65
              Height = 17
              DataField = 'UpdatePerson'
              DataSource = dsFiles
            end
            object edtOrg_FileName: TRzDBEdit
              Left = 104
              Top = 21
              Width = 417
              Height = 21
              DataSource = dsFiles
              DataField = 'Org_FileName'
              ReadOnly = True
              Color = clInfoBk
              TabOrder = 0
            end
            object mmoBakNote: TRzDBMemo
              Left = 104
              Top = 56
              Width = 417
              Height = 58
              DataField = 'BakNote'
              DataSource = dsFiles
              TabOrder = 1
            end
          end
          object pnl3: TPanel
            Left = 0
            Top = 0
            Width = 626
            Height = 401
            Align = alTop
            TabOrder = 1
            object eh1: TDBGridEh
              Left = 2
              Top = 2
              Width = 622
              Height = 397
              Align = alClient
              DataSource = dsFiles
              DynProps = <>
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
              PopupMenu = pm1
              ReadOnly = True
              TabOrder = 0
              Columns = <
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'Org_FileName'
                  Footers = <>
                  Title.Caption = #25991#20214#21517#31216
                  Width = 400
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'CraeteDateTime'
                  Footers = <>
                  Title.Caption = #19978#20256#26085#26399
                  Width = 80
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'UpdatePerson'
                  Footers = <>
                  Title.Caption = #19978#20256#20154
                  Width = 60
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
          end
        end
        object tskehuquanxian: TTabSheet
          Caption = #23458#25143#26435#38480
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object eh2: TDBGridEh
            Left = 0
            Top = 41
            Width = 626
            Height = 552
            Align = alClient
            DataSource = dsCustomerRight
            DynProps = <>
            ReadOnly = True
            TabOrder = 0
            Columns = <
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'PeopIDCode'
                Footers = <>
                Title.Caption = #24037#21495
                Width = 150
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'ChsName'
                Footers = <>
                Title.Caption = #22995#21517
                Width = 200
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
          object pnl4: TPanel
            Left = 0
            Top = 0
            Width = 626
            Height = 41
            Align = alTop
            TabOrder = 1
            object lbl107: TLabel
              Left = 248
              Top = 14
              Width = 130
              Height = 13
              Caption = #20197#19979#20154#21592#26377#35813#23458#25143#26435#38480
            end
            object btnAddRightPerson: TRzButton
              Left = 32
              Top = 8
              Caption = #28155#21152#20154#21592
              TabOrder = 0
              OnClick = btnAddRightPersonClick
            end
            object btn5: TRzButton
              Left = 128
              Top = 8
              Caption = #21024#38500#20154#21592
              TabOrder = 1
              OnClick = btn5Click
            end
          end
        end
      end
    end
  end
  object mtCustomer: TFDMemTable
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 104
    Top = 264
  end
  object mtAddress: TFDMemTable
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 60
    Top = 423
  end
  object dsAddress: TDataSource
    DataSet = mtAddress
    Left = 124
    Top = 423
  end
  object pmPM1: TPopupMenu
    AutoHotkeys = maManual
    AutoLineReduction = maManual
    Left = 48
    Top = 224
    object mniN1: TMenuItem
      Caption = #28155#21152#36865#36135#22320#22336
      OnClick = mniN1Click
    end
    object mniN2: TMenuItem
      Caption = #32534#36753#36865#36135#22320#22336
      OnClick = mniN2Click
    end
    object mniN3: TMenuItem
      Caption = #21024#38500#36865#36135#22320#22336
      OnClick = mniN3Click
    end
  end
  object mtFiles: TFDMemTable
    Filtered = True
    Filter = 'Dele = False'
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 56
    Top = 504
  end
  object dsFiles: TDataSource
    DataSet = mtFiles
    Left = 128
    Top = 504
  end
  object opdg1: TRzOpenDialog
    Left = 52
    Top = 568
  end
  object pm1: TPopupMenu
    OnPopup = pm1Popup
    Left = 452
    Top = 271
    object mniOpenFile: TMenuItem
      Caption = #25171#24320#25991#26723
      OnClick = mniOpenFileClick
    end
    object mniDeleFiles: TMenuItem
      Caption = #21024#38500
      OnClick = mniDeleFilesClick
    end
  end
  object mtCustomerRights: TFDMemTable
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 252
    Top = 423
  end
  object dsCustomerRight: TDataSource
    DataSet = mtCustomerRights
    Left = 316
    Top = 423
  end
  object mtSeed: TFDMemTable
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 144
    Top = 160
  end
  object dsCustomer: TDataSource
    DataSet = mtCustomer
    Left = 168
    Top = 264
  end
end
