inherited frmEditDetail_Mod27: TfrmEditDetail_Mod27
  Caption = #29983#20135#29289#26009#35831#36141#25480#29702
  ClientHeight = 454
  ClientWidth = 639
  ExplicitWidth = 655
  ExplicitHeight = 493
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 639
    Height = 454
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 639
    ExplicitHeight = 454
    inherited pnl1: TPanel
      Width = 637
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 637
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Width = 637
      Height = 419
      ExplicitLeft = 1
      ExplicitTop = 34
      ExplicitWidth = 637
      ExplicitHeight = 419
      object Label1: TLabel
        Left = 88
        Top = 13
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = #24037#21378':'
      end
      object Label2: TLabel
        Left = 76
        Top = 39
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = #21407#26448#26009':'
      end
      object Label3: TLabel
        Left = 76
        Top = 119
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = #20379#24212#21830':'
      end
      object Label4: TLabel
        Left = 45
        Top = 387
        Width = 71
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '   '#37319#36141#21333#20301':'
      end
      object Label5: TLabel
        Left = 64
        Top = 171
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = #37319#36141#25968#37327':'
      end
      object Label6: TLabel
        Left = 41
        Top = 283
        Width = 75
        Height = 13
        Alignment = taRightJustify
        Caption = ' '#20215#26684'('#19981#21547#31246'):'
      end
      object Label7: TLabel
        Left = 40
        Top = 200
        Width = 76
        Height = 13
        Alignment = taRightJustify
        Caption = #35201#27714#21040#36135#26085#26399':'
      end
      object Label8: TLabel
        Left = 77
        Top = 79
        Width = 3
        Height = 13
      end
      object Label9: TLabel
        Left = 254
        Top = 140
        Width = 3
        Height = 13
      end
      object Label10: TLabel
        Left = 13
        Top = 360
        Width = 103
        Height = 13
        Alignment = taRightJustify
        Caption = ' '#23384#36135'/'#37319#36141'('#36716#25442#29575'):'
      end
      object Label11: TLabel
        Left = 232
        Top = 284
        Width = 38
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '   '#36135#24065':'
      end
      object Label12: TLabel
        Left = 32
        Top = 231
        Width = 84
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #22238#22797#20132#36135#26399':'
      end
      object Label13: TLabel
        Left = 64
        Top = 334
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = #35831#36141#21407#22240':'
      end
      object Label14: TLabel
        Left = 64
        Top = 90
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = #29305#21035#35201#27714':'
      end
      object avl_flag: TLabel
        Left = 45
        Top = 38
        Width = 7
        Height = 13
        Caption = 'N'
        Visible = False
      end
      object Label15: TLabel
        Left = 53
        Top = 309
        Width = 63
        Height = 13
        Alignment = taRightJustify
        Caption = ' '#20215#26684'('#21547#31246'):'
      end
      object Label16: TLabel
        Left = 228
        Top = 310
        Width = 42
        Height = 13
        Alignment = taRightJustify
        Caption = ' '#31246#29575'%:'
      end
      object Label17: TLabel
        Left = 64
        Top = 258
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = #29615#20445#31561#32423':'
      end
      object Label18: TLabel
        Left = 372
        Top = 91
        Width = 52
        Height = 13
        Caption = #37325#35201#29289#26009':'
      end
      object Label19: TLabel
        Left = 201
        Top = 257
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = #32784'CAF:'
      end
      object Label20: TLabel
        Left = 64
        Top = 144
        Width = 52
        Height = 13
        Caption = #20215#26684#22791#27880':'
      end
      object Label21: TLabel
        Left = 128
        Top = 176
        Width = 24
        Height = 13
        Caption = '        '
      end
      object lbl1: TLabel
        Left = 223
        Top = 170
        Width = 88
        Height = 13
        Alignment = taRightJustify
        Caption = #35831#36141#26102#38656#27714#25968#37327':'
      end
      object Label22: TLabel
        Left = 64
        Top = 65
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = #21517#31216#35268#26684':'
      end
      object DrdgForm: TDBRadioGroup
        Left = 300
        Top = 193
        Width = 138
        Height = 51
        Caption = #37319#36141#35746#21333#26684#24335
        Columns = 2
        DataField = 'o_i_flag'
        DataSource = ds69
        Items.Strings = (
          #26684#24335#19968
          #26684#24335#20108)
        TabOrder = 0
        Values.Strings = (
          '0'
          '1')
      end
      object BtnHisPrice: TBitBtn
        Left = 377
        Top = 34
        Width = 57
        Height = 23
        Caption = #21382#21490#20215#26684
        TabOrder = 1
        OnClick = BtnHisPriceClick
      end
      object BtnStock: TButton
        Left = 435
        Top = 34
        Width = 57
        Height = 23
        Caption = #24211#23384#26597#35810
        TabOrder = 2
        OnClick = BtnStockClick
      end
      object BtnZtcy: TButton
        Left = 493
        Top = 34
        Width = 57
        Height = 23
        Caption = #22312#36884#26597#35810
        TabOrder = 3
        OnClick = BtnZtcyClick
      end
      object CkbxHbrk: TCheckBox
        Left = 500
        Top = 90
        Width = 76
        Height = 17
        Caption = #29615#20445#35748#21487
        Enabled = False
        TabOrder = 4
      end
      object dbchkIF_urgency: TDBCheckBox
        Left = 256
        Top = 143
        Width = 97
        Height = 17
        Caption = #26159#21542#32039#24613#29289#26009
        DataField = 'IF_urgency'
        DataSource = ds69
        TabOrder = 5
      end
      object RedtNeedFac: TRKeyRzBtnEdit
        Left = 122
        Top = 9
        Width = 255
        Height = 21
        Text = ''
        Color = clSilver
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 6
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RedtMaterCode: TRKeyRzBtnEdit
        Left = 122
        Top = 36
        Width = 255
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 7
        OnExit = RedtMaterCodeExit
        OnKeyDown = RedtMaterCodeKeyDown
        ButtonKind = bkFind
        AltBtnWidth = 15
        ButtonWidth = 15
        OnButtonClick = RedtMaterCodeButtonClick
        DataSource = ds69
        DataSourceField = 'INVT_PTR'
        DispalyTableName = 'data0017'
        DisplaytextField = 'inv_part_number'
        DisplayRetKeyField = 'rkey'
        DisplayPickID = '4'
        DisplayModID = 280
        ForceOnFocus = True
      end
      object RedtSpecReq: TRKeyRzBtnEdit
        Left = 122
        Top = 87
        Width = 241
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 8
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds69
        DataSourceField = 'extra_req'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RedtRqNeedQty: TRKeyRzBtnEdit
        Left = 317
        Top = 166
        Width = 129
        Height = 21
        Text = ''
        Color = clBtnFace
        Enabled = False
        FocusColor = clSilver
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 9
        OnKeyPress = RedtRqNeedQtyKeyPress
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds69
        DataSourceField = 'req_quantity'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object DtpkYqdhrq: TDBDateTimeEditEh
        Left = 122
        Top = 196
        Width = 146
        Height = 21
        DataField = 'REQ_DATE'
        DataSource = ds69
        DynProps = <>
        EditButtons = <>
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        Kind = dtkDateEh
        TabOrder = 10
        Visible = True
      end
      object DtpkReplyRq: TDBDateTimeEditEh
        Left = 122
        Top = 226
        Width = 146
        Height = 21
        DataField = 'reply_date'
        DataSource = ds69
        DynProps = <>
        EditButtons = <>
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        Kind = dtkDateEh
        TabOrder = 11
        Visible = True
      end
      object RedtRqQty: TRKeyRzBtnEdit
        Left = 122
        Top = 168
        Width = 84
        Height = 21
        Text = '0'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 12
        OnExit = RedtRqQtyExit
        OnKeyPress = RedtRqQtyKeyPress
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds69
        DataSourceField = 'QUANTITY'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RedtPrice: TRKeyRzBtnEdit
        Left = 122
        Top = 279
        Width = 84
        Height = 21
        Text = '0'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 13
        OnExit = RedtPriceExit
        OnKeyPress = RedtPriceKeyPress
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds69
        DataSourceField = 'unit_price'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RedtTax_price: TRKeyRzBtnEdit
        Left = 122
        Top = 306
        Width = 84
        Height = 21
        Text = '0'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 14
        OnExit = RedtTax_priceExit
        OnKeyPress = RedtTax_priceKeyPress
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds69
        DataSourceField = 'tax_price'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RedtRqReason: TRKeyRzBtnEdit
        Left = 122
        Top = 331
        Width = 240
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 15
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds69
        DataSourceField = 'reason'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RedtTranRate: TRKeyRzBtnEdit
        Left = 122
        Top = 357
        Width = 130
        Height = 21
        Text = ''
        Color = clInfoBk
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        ReadOnly = True
        TabOrder = 16
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds69
        DataSourceField = 'CONVERSION_FACTOR'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RedtPurUnit1: TRKeyRzBtnEdit
        Left = 122
        Top = 384
        Width = 56
        Height = 21
        Text = ''
        Color = clInfoBk
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        ReadOnly = True
        TabOrder = 17
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds69
        DataSourceField = 'UNIT_PTR'
        DispalyTableName = 'data0002'
        DisplaytextField = 'unit_code'
        DisplayRetKeyField = 'rkey'
        DisplayPickID = '6'
        DisplayModID = 280
        ForceOnFocus = True
      end
      object RedtPriceBz: TRKeyRzBtnEdit
        Left = 122
        Top = 141
        Width = 129
        Height = 21
        Text = ''
        Color = clSilver
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 18
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSourceField = 'req_quantity'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RedtHbdj: TRKeyRzBtnEdit
        Left = 122
        Top = 254
        Width = 76
        Height = 21
        Text = ''
        Color = clSilver
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 19
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds69
        DataSourceField = 'rohs'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RedtCaf: TRKeyRzBtnEdit
        Left = 240
        Top = 254
        Width = 76
        Height = 21
        Text = ''
        Color = clSilver
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 20
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds69
        DataSourceField = 'IF_CAF'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RedtSupp: TRKeyRzBtnEdit
        Left = 122
        Top = 114
        Width = 146
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 21
        OnExit = RedtSuppExit
        OnKeyPress = RedtSuppKeyPress
        ButtonKind = bkFind
        AltBtnWidth = 15
        ButtonWidth = 15
        OnButtonClick = RedtSuppButtonClick
        DataSource = ds69
        DataSourceField = 'SUPP_PTR'
        DispalyTableName = 'data0023'
        DisplaytextField = 'code'
        DisplayRetKeyField = 'rkey'
        DisplayNoteField = 'SUPPLIER_NAME'
        DisplayPickID = '1'
        DisplayModID = 27
        ForceOnFocus = True
      end
      object RedtPurUnit2: TRKeyRzBtnEdit
        Left = 180
        Top = 384
        Width = 62
        Height = 21
        Text = ''
        Color = clInfoBk
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        ReadOnly = True
        TabOrder = 22
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds69
        DataSourceField = 'UNIT_PTR'
        DispalyTableName = 'data0002'
        DisplaytextField = 'unit_name'
        DisplayRetKeyField = 'rkey'
        DisplayPickID = '6'
        DisplayModID = 280
        ForceOnFocus = True
      end
      object RedtIfMajor: TRKeyRzBtnEdit
        Left = 426
        Top = 87
        Width = 71
        Height = 21
        Text = ''
        Color = clInfoBk
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        ReadOnly = True
        TabOrder = 23
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RedtCurr: TRKeyRzBtnEdit
        Left = 276
        Top = 280
        Width = 73
        Height = 21
        Text = ''
        Color = clInfoBk
        FocusColor = clSilver
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        ReadOnly = True
        TabOrder = 24
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds69
        DataSourceField = 'PO_LINK_PTR'
        DispalyTableName = 'data0001'
        DisplaytextField = 'curr_name'
        DisplayRetKeyField = 'rkey'
        DisplayPickID = '3'
        DisplayModID = 27
        ForceOnFocus = True
      end
      object RedtRate: TRKeyRzBtnEdit
        Left = 276
        Top = 306
        Width = 73
        Height = 21
        Text = ''
        Color = clInfoBk
        FocusColor = clSilver
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        ReadOnly = True
        TabOrder = 25
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds69
        DataSourceField = 'tax'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RKeyRzBtnEdit1: TRKeyRzBtnEdit
        Left = 122
        Top = 63
        Width = 442
        Height = 21
        Text = ''
        Color = clBtnFace
        Enabled = False
        FocusColor = clWhite
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 26
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds69
        DataSourceField = 'INVT_PTR'
        DispalyTableName = 'data0017'
        DisplaytextField = 'inv_part_description'
        DisplayRetKeyField = 'rkey'
        DisplayPickID = '4'
        DisplayModID = 280
        ForceOnFocus = True
      end
    end
  end
  object cds69: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 472
    Top = 232
  end
  object ds69: TDataSource
    DataSet = cds69
    Left = 472
    Top = 288
  end
  object cds28: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 536
    Top = 208
  end
  object cds17: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 536
    Top = 272
  end
end
