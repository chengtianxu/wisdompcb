inherited frmDetail_Mod623: TfrmDetail_Mod623
  Caption = #26126#32454#25968#25454
  ClientHeight = 483
  ClientWidth = 734
  ExplicitWidth = 750
  ExplicitHeight = 521
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 734
    Height = 483
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 734
    ExplicitHeight = 483
    inherited pnl1: TPanel
      Width = 732
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 732
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
      inherited btnClose: TBitBtn
        ModalResult = 2
      end
    end
    inherited pnl2: TPanel
      Width = 732
      Height = 448
      ExplicitLeft = 1
      ExplicitTop = 34
      ExplicitWidth = 732
      ExplicitHeight = 448
      object Label1: TLabel
        Left = 29
        Top = 88
        Width = 72
        Height = 13
        Caption = #23458#25143#35746#21333#21495#65306
      end
      object Label2: TLabel
        Left = 65
        Top = 24
        Width = 36
        Height = 13
        Caption = #23458#25143#65306
      end
      object Label3: TLabel
        Left = 65
        Top = 59
        Width = 36
        Height = 13
        Caption = #24037#21378#65306
      end
      object Label4: TLabel
        Left = 41
        Top = 120
        Width = 60
        Height = 13
        Caption = #26412#21378#32534#21495#65306
      end
      object Label5: TLabel
        Left = 41
        Top = 152
        Width = 60
        Height = 13
        Caption = #23458#25143#22411#21495#65306
      end
      object Label6: TLabel
        Left = 29
        Top = 184
        Width = 72
        Height = 13
        Caption = #23458#25143#29289#26009#21495#65306
      end
      object Label7: TLabel
        Left = 65
        Top = 215
        Width = 36
        Height = 13
        Caption = #36135#24065#65306
      end
      object Label8: TLabel
        Left = 65
        Top = 279
        Width = 36
        Height = 13
        Caption = #20215#26684#65306
      end
      object Label9: TLabel
        Left = 41
        Top = 311
        Width = 60
        Height = 13
        Caption = #20986#21378#26085#26399#65306
      end
      object Label10: TLabel
        Left = 41
        Top = 343
        Width = 60
        Height = 13
        Caption = #21442#32771#38468#27880#65306
      end
      object Label11: TLabel
        Left = 65
        Top = 375
        Width = 36
        Height = 13
        Caption = #22791#27880#65306
      end
      object Label12: TLabel
        Left = 410
        Top = 24
        Width = 72
        Height = 13
        Caption = #20851#32852#21407#23458#25143#65306
      end
      object Label13: TLabel
        Left = 422
        Top = 56
        Width = 60
        Height = 13
        Caption = #24211#23384#25968#37327#65306
      end
      object Label14: TLabel
        Left = 422
        Top = 88
        Width = 60
        Height = 13
        Caption = #24211#23384#38754#31215#65306
      end
      object Label15: TLabel
        Left = 446
        Top = 120
        Width = 36
        Height = 13
        Caption = #25968#37327#65306
      end
      object Label16: TLabel
        Left = 422
        Top = 151
        Width = 60
        Height = 13
        Caption = #35746#21333#38754#31215#65306
      end
      object Label17: TLabel
        Left = 422
        Top = 183
        Width = 60
        Height = 13
        Caption = #35746#21333#26032#26087#65306
      end
      object Label18: TLabel
        Left = 617
        Top = 87
        Width = 24
        Height = 13
        Caption = #24179#31859
      end
      object Label19: TLabel
        Left = 614
        Top = 148
        Width = 24
        Height = 13
        Caption = #24179#31859
      end
      object Label20: TLabel
        Left = 422
        Top = 215
        Width = 60
        Height = 13
        Caption = #35746#21333#31867#22411#65306
      end
      object Label21: TLabel
        Left = 268
        Top = 311
        Width = 84
        Height = 13
        Caption = #21512#21516#21457#36865#26085#26399#65306
      end
      object Label22: TLabel
        Left = 517
        Top = 311
        Width = 60
        Height = 13
        Caption = #20132#36135#26085#26399#65306
      end
      object Label23: TLabel
        Left = 5
        Top = 247
        Width = 96
        Height = 13
        Caption = #20108#32500#30721#25171#21360#26684#24335#65306
      end
      object Label24: TLabel
        Left = 386
        Top = 247
        Width = 96
        Height = 13
        Caption = #26032#21333#35748#21487#20070#21495#30721#65306
      end
      object edtCustomer: TRKeyRzBtnEdit
        Left = 107
        Top = 26
        Width = 121
        Height = 21
        Text = ''
        TabOrder = 1
        OnExit = edtCustomerExit
        OnKeyPress = edtCustomerKeyPress
        ButtonKind = bkFind
        AltBtnWidth = 15
        ButtonWidth = 15
        OnButtonClick = edtCustomerButtonClick
        DataSource = ds213
        DataSourceField = 'cust_code'
        DispalyTableName = 'Data0010'
        DisplayNoteField = 'CUSTOMER_NAME'
        DisplayPickID = '0'
        DisplayModID = 623
        ForceOnFocus = True
      end
      object edtFactory: TRKeyRzBtnEdit
        Left = 110
        Top = 58
        Width = 121
        Height = 21
        Text = ''
        Color = clBtnFace
        Enabled = False
        TabOrder = 3
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DisplayModID = 0
        ForceOnFocus = True
      end
      object edtPoNO: TRKeyRzBtnEdit
        Left = 107
        Top = 90
        Width = 121
        Height = 21
        Text = ''
        Color = clInfoBk
        TabOrder = 5
        OnKeyPress = edtPoNOKeyPress
        ButtonKind = bkFind
        AltBtnWidth = 15
        ButtonWidth = 15
        OnButtonClick = edtPoNOButtonClick
        DataSource = ds213
        DataSourceField = 'PO_NUMBER'
        DispalyTableName = 'Data0097'
        DisplaytextField = 'PO_NUMBER'
        DisplayRetKeyField = 'PO_NUMBER'
        DisplayPickID = '1'
        DisplayModID = 623
        ForceOnFocus = True
      end
      object edtPartNumber: TRKeyRzBtnEdit
        Left = 107
        Top = 117
        Width = 121
        Height = 21
        Text = ''
        Color = clInfoBk
        TabOrder = 7
        ButtonKind = bkFind
        AltBtnWidth = 15
        ButtonWidth = 15
        OnButtonClick = edtPartNumberButtonClick
        DataSource = ds213
        DataSourceField = 'MANU_PART_NUMBER'
        DispalyTableName = 'Data0025'
        DisplayPickID = '2'
        DisplayModID = 623
        ForceOnFocus = True
      end
      object edtRef: TRKeyRzBtnEdit
        Left = 110
        Top = 339
        Width = 589
        Height = 21
        Text = ''
        TabOrder = 22
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds213
        DataSourceField = 'REFERENCE_NUMBER'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object mnRemark: TDBMemo
        Left = 110
        Top = 375
        Width = 589
        Height = 57
        DataField = 'Remark'
        DataSource = ds213
        TabOrder = 23
      end
      object rgRate: TRzDBRadioGroup
        Left = 237
        Top = 271
        Width = 121
        Height = 32
        DataField = 'EDI_FLAG_FOR_INVOICE'
        DataSource = ds213
        Items.Strings = (
          #21547#31246
          #19981#21547#31246)
        Values.Strings = (
          '1'
          '0')
        Caption = ''
        Columns = 2
        StartYPos = -5
        TabOrder = 16
      end
      object rgMode: TRzDBRadioGroup
        Left = 410
        Top = 271
        Width = 289
        Height = 32
        DataField = 'is_alter'
        DataSource = ds213
        Items.Strings = (
          #25353#20197#21069#36164#26009
          #26377#23569#37327#26356#25913#65292#25353#38468#20214#25913#21160#36164#26009)
        Values.Strings = (
          '0'
          '1')
        Caption = ''
        Columns = 2
        Enabled = False
        ItemHeight = 25
        StartYPos = -5
        TabOrder = 17
      end
      object cbxNewOrOld: TRzDBComboBox
        Left = 488
        Top = 177
        Width = 121
        Height = 21
        DataField = 'so_oldnew'
        DataSource = ds213
        Style = csDropDownList
        TabOrder = 10
        OnChange = cbxNewOrOldChange
        Items.Strings = (
          #26087#21333
          #26032#21333)
        Values.Strings = (
          #26087#21333
          #26032#21333)
      end
      object rgType: TRzDBRadioGroup
        Left = 488
        Top = 206
        Width = 121
        Height = 28
        DataField = 'so_style'
        DataSource = ds213
        Items.Strings = (
          #27491#24335
          #22791#21697)
        Values.Strings = (
          '0'
          '1')
        Caption = ''
        Columns = 2
        StartYPos = -5
        TabOrder = 12
      end
      object dpkMake: TRzDBDateTimePicker
        Left = 110
        Top = 308
        Width = 120
        Height = 21
        Date = 43084.000000000000000000
        Format = ''
        Time = 43084.000000000000000000
        TabOrder = 19
        DataField = 'ORIG_SCHED_SHIP_DATE'
        DataSource = ds213
      end
      object dpkPODate: TRzDBDateTimePicker
        Left = 358
        Top = 308
        Width = 120
        Height = 21
        Date = 43084.000000000000000000
        Format = ''
        Time = 43084.000000000000000000
        TabOrder = 20
        DataField = 'PO_DATE'
        DataSource = ds213
      end
      object dpkSendDate: TRzDBDateTimePicker
        Left = 578
        Top = 308
        Width = 120
        Height = 21
        Date = 43084.000000000000000000
        Format = ''
        Time = 43084.000000000000000000
        TabOrder = 21
        DataField = 'ORIG_REQUEST_DATE'
        DataSource = ds213
      end
      object edtPrintType: TRKeyRzBtnEdit
        Left = 110
        Top = 246
        Width = 121
        Height = 21
        Text = ''
        Color = clInfoBk
        TabOrder = 15
        OnKeyPress = edtPrintTypeKeyPress
        ButtonKind = bkFind
        AltBtnWidth = 15
        ButtonWidth = 15
        OnButtonClick = edtPrintTypeButtonClick
        DataSource = ds213
        DataSourceField = 'Print2DKey'
        DispalyTableName = 'Print2D_BarDef'
        DisplaytextField = 'BarName'
        DisplayRetKeyField = 'rkey'
        DisplayPickID = '4'
        DisplayModID = 623
        ForceOnFocus = True
      end
      object edtOriginalCus: TRKeyRzBtnEdit
        Left = 487
        Top = 21
        Width = 121
        Height = 21
        Text = ''
        TabOrder = 0
        OnKeyPress = edtOriginalCusKeyPress
        ButtonKind = bkFind
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds213
        DataSourceField = 'orig_customer'
        DispalyTableName = 'data0010'
        DisplaytextField = 'abbr_name'
        DisplayRetKeyField = 'abbr_name'
        DisplayPickID = '3'
        DisplayModID = 623
        ForceOnFocus = True
      end
      object edtQty: TRKeyRzBtnEdit
        Left = 487
        Top = 52
        Width = 121
        Height = 21
        Text = '0'
        Color = clBtnFace
        Enabled = False
        TabOrder = 2
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DisplayModID = 0
        ForceOnFocus = True
      end
      object edtSq: TRKeyRzBtnEdit
        Left = 487
        Top = 83
        Width = 121
        Height = 21
        Text = '0'
        Color = clBtnFace
        Enabled = False
        TabOrder = 4
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DisplayModID = 0
        ForceOnFocus = True
      end
      object edtOrderQty: TRKeyRzBtnEdit
        Left = 487
        Top = 114
        Width = 121
        Height = 21
        Text = ''
        TabOrder = 6
        OnChange = edtOrderQtyChange
        OnKeyPress = edtOrderQtyKeyPress
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds213
        DataSourceField = 'PARTS_ORDERED'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object edtOrderSq: TRKeyRzBtnEdit
        Left = 487
        Top = 146
        Width = 121
        Height = 21
        Text = '0'
        Color = clBtnFace
        Enabled = False
        TabOrder = 8
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DisplayModID = 0
        ForceOnFocus = True
      end
      object edtNewNO: TRKeyRzBtnEdit
        Left = 487
        Top = 244
        Width = 121
        Height = 21
        Text = ''
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 14
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds213
        DataSourceField = 'Lis_num'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object edtDesc: TRKeyRzBtnEdit
        Left = 110
        Top = 149
        Width = 121
        Height = 21
        Text = ''
        TabOrder = 9
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds213
        DataSourceField = 'MANU_PART_DESC'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object edtINVTNO: TRKeyRzBtnEdit
        Left = 110
        Top = 182
        Width = 121
        Height = 21
        Text = ''
        TabOrder = 11
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds213
        DataSourceField = 'ANALYSIS_CODE_2'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object edtCurr: TRKeyRzBtnEdit
        Left = 110
        Top = 214
        Width = 121
        Height = 21
        Text = ''
        Color = clBtnFace
        Enabled = False
        TabOrder = 13
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds213
        DataSourceField = 'CURR_CODE'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object edtPrice: TRKeyRzBtnEdit
        Left = 110
        Top = 278
        Width = 121
        Height = 21
        Text = ''
        TabOrder = 18
        OnKeyPress = edtOrderQtyKeyPress
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds213
        DataSourceField = 'PART_PRICE'
        DisplayModID = 0
        ForceOnFocus = True
      end
    end
  end
  object cds213: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT * FROM DATA0213'#13#10
    Params = <>
    Left = 328
  end
  object ds213: TDataSource
    DataSet = cds213
    Left = 368
  end
end
