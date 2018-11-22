inherited frmEditDetailZx_Mod27: TfrmEditDetailZx_Mod27
  Caption = #26434#39033#29289#26009#35831#36141#25480#29702
  ClientHeight = 368
  ClientWidth = 550
  ExplicitWidth = 558
  ExplicitHeight = 395
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 550
    Height = 368
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 550
    ExplicitHeight = 368
    inherited pnl1: TPanel
      Width = 548
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 548
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Width = 548
      Height = 333
      ExplicitLeft = 1
      ExplicitTop = 34
      ExplicitWidth = 548
      ExplicitHeight = 333
      object Label1: TLabel
        Left = 59
        Top = 31
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = #20379#24212#21830':'
      end
      object Label2: TLabel
        Left = 47
        Top = 102
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = #29289#21697#21517#31216':'
      end
      object Label3: TLabel
        Left = 130
        Top = 53
        Width = 3
        Height = 13
      end
      object Label6: TLabel
        Left = 24
        Top = 193
        Width = 75
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #37319#36141#25968#37327':'
      end
      object Label7: TLabel
        Left = 0
        Top = 251
        Width = 99
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '    '#35201#27714#21040#36135#26085#26399':'
      end
      object Label4: TLabel
        Left = 266
        Top = 70
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = #36135#24065':'
      end
      object Label5: TLabel
        Left = 71
        Top = 164
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = #31867#21035':'
      end
      object Label9: TLabel
        Left = 34
        Top = 278
        Width = 65
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #37319#36141#21333#20301':'
      end
      object Label10: TLabel
        Left = 252
        Top = 266
        Width = 3
        Height = 13
      end
      object Label11: TLabel
        Left = 47
        Top = 133
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = #29289#21697#35268#26684':'
      end
      object Label12: TLabel
        Left = 247
        Top = 251
        Width = 86
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #22238#22797#20132#36135#26399':'
      end
      object Label13: TLabel
        Left = 47
        Top = 306
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = #35831#36141#21407#22240':'
      end
      object Label14: TLabel
        Left = 30
        Top = 222
        Width = 69
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#20215#26684'('#21547#31246'):'
      end
      object Label15: TLabel
        Left = 209
        Top = 222
        Width = 39
        Height = 13
        Alignment = taRightJustify
        Caption = #31246#29575'%:'
      end
      object Label16: TLabel
        Left = 302
        Top = 133
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = #29615#20445#31561#32423':'
      end
      object lbl1: TLabel
        Left = 193
        Top = 193
        Width = 103
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #35831#36141#26102#38656#27714#25968#37327':'
      end
      object Label8: TLabel
        Left = 322
        Top = 222
        Width = 81
        Height = 13
        Alignment = taRightJustify
        Caption = '   '#20215#26684'('#19981#21547#31246'):'
      end
      object DrdgForm: TDBRadioGroup
        Left = 105
        Top = 51
        Width = 150
        Height = 41
        Caption = #37319#36141#35746#21333#26684#24335
        Columns = 2
        DataField = 'o_i_flag'
        DataSource = ds204
        Items.Strings = (
          #26684#24335#19968
          #26684#24335#20108)
        TabOrder = 0
        Values.Strings = (
          '0'
          '1')
      end
      object BtnHisPrice: TBitBtn
        Left = 302
        Top = 100
        Width = 75
        Height = 19
        Caption = #21382#21490#20215#26684
        TabOrder = 1
        OnClick = BtnHisPriceClick
      end
      object BtnCurr: TButton
        Left = 376
        Top = 68
        Width = 75
        Height = 19
        Caption = #26356#25913#36135#24065
        TabOrder = 2
        OnClick = BtnCurrClick
      end
      object DcmbHbdj: TDBComboBox
        Left = 361
        Top = 130
        Width = 104
        Height = 21
        Ctl3D = True
        DataField = 'rohs'
        DataSource = ds204
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        Items.Strings = (
          #8544#32423
          #8545#32423)
        ParentCtl3D = False
        TabOrder = 3
      end
      object dbchkIF_urgency: TDBCheckBox
        Left = 105
        Top = 6
        Width = 97
        Height = 17
        Caption = #26159#21542#32039#24613#29289#26009
        DataField = 'IF_urgency'
        DataSource = ds204
        TabOrder = 4
      end
      object RedtSupp: TRKeyRzBtnEdit
        Left = 105
        Top = 28
        Width = 146
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 5
        OnExit = RedtSuppExit
        ButtonKind = bkFind
        AltBtnWidth = 15
        ButtonWidth = 15
        OnButtonClick = RedtSuppButtonClick
        DataSource = ds204
        DataSourceField = 'supplier_ptr'
        DispalyTableName = 'data0023'
        DisplaytextField = 'code'
        DisplayRetKeyField = 'rkey'
        DisplayNoteField = 'SUPPLIER_NAME'
        DisplayPickID = '2'
        DisplayModID = 27
        ForceOnFocus = True
      end
      object RedtMaterName: TRKeyRzBtnEdit
        Left = 105
        Top = 99
        Width = 192
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 6
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds204
        DataSourceField = 'DESCRIPTION_1'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RedtMaterGuige: TRKeyRzBtnEdit
        Left = 105
        Top = 130
        Width = 192
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 7
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds204
        DataSourceField = 'GUI_GE'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RedtUnitName: TRKeyRzBtnEdit
        Left = 105
        Top = 275
        Width = 121
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 8
        ButtonKind = bkFind
        AltBtnWidth = 15
        ButtonWidth = 15
        OnButtonClick = RedtUnitNameButtonClick
        DataSource = ds204
        DataSourceField = 'G_L_PTR'
        DispalyTableName = 'data0002'
        DisplaytextField = 'unit_code'
        DisplayRetKeyField = 'rkey'
        DisplayNoteField = 'unit_name'
        DisplayPickID = '6'
        DisplayModID = 29
        ForceOnFocus = True
      end
      object RedtRqReason: TRKeyRzBtnEdit
        Left = 105
        Top = 303
        Width = 338
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 9
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds204
        DataSourceField = 'reason'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object DtpkXqrq: TDBDateTimeEditEh
        Left = 105
        Top = 248
        Width = 146
        Height = 21
        DataField = 'REQ_DATE'
        DataSource = ds204
        DynProps = <>
        EditButtons = <>
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        Kind = dtkDateEh
        TabOrder = 10
        Visible = True
      end
      object DtpkReply: TDBDateTimeEditEh
        Left = 336
        Top = 248
        Width = 146
        Height = 21
        DataField = 'reply_date'
        DataSource = ds204
        DynProps = <>
        EditButtons = <>
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        Kind = dtkDateEh
        TabOrder = 11
        Visible = True
      end
      object RedtQuantity: TRKeyRzBtnEdit
        Left = 105
        Top = 190
        Width = 86
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 12
        OnChange = RedtQuantityChange
        OnExit = RedtQuantityExit
        OnKeyPress = RedtQuantityKeyPress
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds204
        DataSourceField = 'QUANTITY_REQUIRED'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RedtTax_price: TRKeyRzBtnEdit
        Left = 105
        Top = 219
        Width = 86
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 13
        OnExit = RedtTax_priceExit
        OnKeyPress = RedtTax_priceKeyPress
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds204
        DataSourceField = 'tax_price'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RedtRqNeedQty: TRKeyRzBtnEdit
        Left = 302
        Top = 190
        Width = 73
        Height = 21
        Text = ''
        Color = clBtnFace
        Enabled = False
        FocusColor = clSilver
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        ReadOnly = True
        TabOrder = 14
        OnKeyPress = RedtRqNeedQtyKeyPress
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds204
        DataSourceField = 'req_quantity'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RedtRate: TRKeyRzBtnEdit
        Left = 253
        Top = 219
        Width = 73
        Height = 21
        Text = ''
        Color = clSilver
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 15
        OnExit = RedtRateExit
        OnKeyPress = RedtRateKeyPress
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds204
        DataSourceField = 'tax'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RedtPrice: TRKeyRzBtnEdit
        Left = 407
        Top = 219
        Width = 73
        Height = 21
        Text = ''
        Color = clInfoBk
        FocusColor = clSilver
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        ReadOnly = True
        TabOrder = 16
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds204
        DataSourceField = 'unit_price'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object RKeyRzBtnEdit1: TRKeyRzBtnEdit
        Left = 297
        Top = 67
        Width = 73
        Height = 21
        Text = ''
        Color = clInfoBk
        FocusColor = clSilver
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        ReadOnly = True
        TabOrder = 17
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds204
        DataSourceField = 'PO_LINK_PTR'
        DispalyTableName = 'data0001'
        DisplaytextField = 'curr_name'
        DisplayRetKeyField = 'rkey'
        DisplayPickID = '3'
        DisplayModID = 27
        ForceOnFocus = True
      end
      object dbcbbDESCRIPTION_2: TDBComboBox
        Left = 105
        Top = 159
        Width = 146
        Height = 21
        DataField = 'DESCRIPTION_2'
        DataSource = ds204
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 18
      end
    end
  end
  object ds204: TDataSource
    DataSet = cds204
    Left = 448
    Top = 40
  end
  object cds204: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 393
    Top = 40
  end
end
