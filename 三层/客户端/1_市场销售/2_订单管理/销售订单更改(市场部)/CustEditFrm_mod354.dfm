inherited frmCustEdit_mod354: TfrmCustEdit_mod354
  Caption = #23458#25143#31561#36164#26009#20462#25913
  ClientHeight = 439
  ClientWidth = 557
  Font.Height = -13
  Font.Name = #23435#20307
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 573
  ExplicitHeight = 478
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 557
    Height = 439
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 557
    ExplicitHeight = 439
    inherited pnl1: TPanel
      Width = 555
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 555
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
      inherited btnSaveAll: TBitBtn
        Left = 494
        Align = alRight
        Font.Height = -13
        Font.Name = #23435#20307
        ParentFont = False
        ExplicitLeft = 494
      end
      inherited btnCheck: TBitBtn
        Left = 464
        Align = alRight
        Font.Height = -13
        Font.Name = #23435#20307
        ParentFont = False
        ExplicitLeft = 464
      end
      inherited btnPrint: TBitBtn
        Left = 524
        Align = alRight
        Font.Height = -13
        Font.Name = #23435#20307
        ParentFont = False
        ExplicitLeft = 524
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Width = 555
      Height = 404
      ExplicitLeft = 1
      ExplicitTop = 34
      ExplicitWidth = 555
      ExplicitHeight = 404
      object lbl2: TLabel
        Left = 58
        Top = 22
        Width = 72
        Height = 13
        Alignment = taRightJustify
        Caption = #20851#32852#25991#20214#21495':'
      end
      object lbl3: TLabel
        Left = 58
        Top = 170
        Width = 72
        Height = 13
        Alignment = taRightJustify
        Caption = #23458#25143#35746#21333#21495':'
      end
      object lbl4: TLabel
        Left = 51
        Top = 197
        Width = 80
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = ' PO'#25910#21040#26085#26399':'
      end
      object lbl5: TLabel
        Left = 97
        Top = 345
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = #21442#32771':'
      end
      object lbl6: TLabel
        Left = 84
        Top = 230
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = #21512#21516#21495':'
      end
      object lbl7: TLabel
        Left = 71
        Top = 52
        Width = 59
        Height = 13
        Caption = #23458#25143#20195#30721':'
      end
      object lbl8: TLabel
        Left = 71
        Top = 260
        Width = 59
        Height = 13
        Caption = #35013#36816#22320#22336':'
      end
      object lbl9: TLabel
        Left = 296
        Top = 52
        Width = 7
        Height = 13
      end
      object lbl10: TLabel
        Left = 304
        Top = 60
        Width = 7
        Height = 13
      end
      object lbl11: TLabel
        Left = 328
        Top = 58
        Width = 7
        Height = 13
        Visible = False
      end
      object lbl12: TLabel
        Left = 472
        Top = 168
        Width = 7
        Height = 13
        Visible = False
      end
      object lbl13: TLabel
        Left = 93
        Top = 82
        Width = 33
        Height = 13
        Caption = #36135#24065':'
      end
      object lbl14: TLabel
        Left = 265
        Top = 81
        Width = 39
        Height = 13
        Caption = #27719#29575#65306
      end
      object lbl15: TLabel
        Left = 71
        Top = 290
        Width = 59
        Height = 13
        Caption = #22686#20540#31246'%'#65306
      end
      object lbl16: TLabel
        Left = 55
        Top = 316
        Width = 72
        Height = 13
        Caption = #35013#36816#32852#32476#20154':'
      end
      object lbl17: TLabel
        Left = 284
        Top = 317
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = #30005#35805':'
      end
      object lbl18: TLabel
        Left = 384
        Top = 48
        Width = 7
        Height = 13
        Visible = False
      end
      object lbl19: TLabel
        Left = 280
        Top = 197
        Width = 52
        Height = 13
        Caption = #23458#25143#20132#26399
      end
      object lbl1: TLabel
        Left = 58
        Top = 369
        Width = 72
        Height = 13
        Alignment = taRightJustify
        Caption = #20998#26512#20195#30721'1'#65306
      end
      object lbl20: TLabel
        Left = 255
        Top = 231
        Width = 80
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #19979#21333#26085#26399':'
      end
      object lbl21: TLabel
        Left = 58
        Top = 143
        Width = 72
        Height = 13
        Alignment = taRightJustify
        Caption = #21407#20851#32852#23458#25143':'
      end
      object chk1: TCheckBox
        Left = 136
        Top = 110
        Width = 77
        Height = 17
        Caption = #20215#26684#21547#31246
        Enabled = False
        TabOrder = 0
      end
      object chk2: TCheckBox
        Left = 232
        Top = 110
        Width = 77
        Height = 17
        Caption = #36716#21378#35746#21333
        Enabled = False
        TabOrder = 1
      end
      object edt_curr: TRKeyRzBtnEdit
        Left = 138
        Top = 73
        Width = 121
        Height = 21
        Text = ''
        TabOrder = 2
        ButtonKind = bkFind
        AltBtnWidth = 15
        ButtonWidth = 15
        OnButtonClick = edt_currButtonClick
        DataSource = ds60
        DataSourceField = 'CURRENCY_PTR'
        DispalyTableName = 'data0001'
        DisplaytextField = 'CURR_CODE'
        DisplayRetKeyField = 'rkey'
        DisplayPickID = '5'
        DisplayModID = 354
        ForceOnFocus = True
      end
      object edt_rate: TRKeyRzBtnEdit
        Left = 303
        Top = 76
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
        DataSource = ds60
        DataSourceField = 'EXCH_RATE'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object edt_Pnumber: TRKeyRzBtnEdit
        Left = 136
        Top = 164
        Width = 199
        Height = 21
        Text = ''
        TabOrder = 4
        OnExit = edt_PnumberExit
        ButtonKind = bkFind
        AltBtnWidth = 15
        ButtonWidth = 15
        OnButtonClick = edt_PnumberButtonClick
        DataSource = ds60
        DataSourceField = 'PO_NUMBER'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object edt_Cdate: TRKeyRzBtnEdit
        Left = 337
        Top = 194
        Width = 121
        Height = 21
        Text = ''
        TabOrder = 5
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds60
        DataSourceField = 'ORIG_REQUEST_DATE'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object edt_shipAddr: TRKeyRzBtnEdit
        Left = 136
        Top = 255
        Width = 311
        Height = 21
        Text = ''
        Color = clInfoBk
        TabOrder = 6
        ButtonKind = bkFind
        AltBtnWidth = 15
        ButtonWidth = 15
        OnButtonClick = edt_shipAddrButtonClick
        DataSource = ds60
        DataSourceField = 'LOCATION'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object edt_fob: TRKeyRzBtnEdit
        Left = 136
        Top = 225
        Width = 121
        Height = 21
        Text = ''
        TabOrder = 7
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds60
        DataSourceField = 'FOB'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object edt_tel: TRKeyRzBtnEdit
        Left = 323
        Top = 312
        Width = 121
        Height = 21
        Text = ''
        Color = clBtnFace
        Enabled = False
        FocusColor = clInfoBk
        ReadOnly = True
        TabOrder = 8
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds60
        DataSourceField = 'SHIP_CONTACT_PHONE'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object edt_refer: TRKeyRzBtnEdit
        Left = 136
        Top = 339
        Width = 310
        Height = 21
        Text = ''
        TabOrder = 9
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds60
        DataSourceField = 'REFERENCE_NUMBER'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object edt_analyse: TRKeyRzBtnEdit
        Left = 136
        Top = 367
        Width = 310
        Height = 21
        Text = ''
        TabOrder = 10
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds60
        DataSourceField = 'ANALYSIS_CODE_1'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object edt_CustNO: TRKeyRzBtnEdit
        Left = 136
        Top = 46
        Width = 123
        Height = 21
        Text = ''
        TabOrder = 11
        OnExit = edt_CustNOExit
        OnKeyDown = edt_CustNOKeyDown
        ButtonKind = bkFind
        AltBtnWidth = 15
        ButtonWidth = 15
        OnButtonClick = edt_custNoButtonClick
        DataSource = ds60
        DataSourceField = 'CUSTOMER_PTR'
        DispalyTableName = 'data0010'
        DisplaytextField = 'CUST_CODE'
        DisplayRetKeyField = 'rkey'
        DisplayNoteField = 'customer_name'
        DisplayPickID = '6'
        DisplayModID = 354
        ForceOnFocus = True
      end
      object edt_file: TEdit
        Left = 136
        Top = 19
        Width = 123
        Height = 21
        TabOrder = 12
      end
      object edt_OCustName: TRKeyRzBtnEdit
        Left = 136
        Top = 137
        Width = 123
        Height = 21
        Text = ''
        TabOrder = 13
        OnExit = edt_OCustNameExit
        ButtonKind = bkFind
        AltBtnWidth = 15
        ButtonWidth = 15
        OnButtonClick = edt_OCustNameButtonClick
        DataSource = ds60
        DataSourceField = 'ORIG_CUSTOMER'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object edt_InDate: TRKeyRzBtnEdit
        Left = 337
        Top = 224
        Width = 172
        Height = 21
        Text = ''
        TabOrder = 14
        OnExit = edt_InDateExit
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds60
        DataSourceField = 'ENT_DATE'
        DisplayModID = 0
        ForceOnFocus = True
      end
    end
  end
  object edt_PoDate: TRKeyRzBtnEdit
    Left = 138
    Top = 228
    Width = 121
    Height = 21
    Text = ''
    TabOrder = 1
    OnExit = edt_PoDateExit
    ButtonKind = bkFind
    ButtonVisible = False
    AltBtnWidth = 15
    ButtonWidth = 15
    DataSource = ds60
    DataSourceField = 'po_date'
    DisplayModID = 0
    ForceOnFocus = True
  end
  object edt_Trate: TRKeyRzBtnEdit
    Left = 137
    Top = 316
    Width = 121
    Height = 21
    Text = ''
    Color = clBtnFace
    Enabled = False
    TabOrder = 2
    ButtonKind = bkFind
    ButtonVisible = False
    AltBtnWidth = 15
    ButtonWidth = 15
    DataSource = ds60
    DataSourceField = 'RUSH_CHARGE'
    DisplayModID = 0
    ForceOnFocus = True
  end
  object edt_SMan: TRKeyRzBtnEdit
    Left = 137
    Top = 343
    Width = 121
    Height = 21
    Text = ''
    Color = clBtnFace
    Enabled = False
    FocusColor = clInfoBk
    ReadOnly = True
    TabOrder = 3
    ButtonKind = bkFind
    ButtonVisible = False
    AltBtnWidth = 15
    ButtonWidth = 15
    DataSource = ds60
    DataSourceField = 'SHIPPING_CONTACT'
    DisplayModID = 0
    ForceOnFocus = True
  end
  object ds60: TDataSource
    DataSet = cds60
    Left = 488
    Top = 144
  end
  object cds60: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT data0060.*,Data0010.rkey as rkey10,Data0010.CUST_CODE,Dat' +
      'a0010.customer_name,data0010.quote_flag,'#13#10'       Data0012.ship_t' +
      'o_address_1,Data0025.MANU_PART_NUMBER,Data0025.MANU_PART_DESC, '#13 +
      #10'       Data0097.PO_NUMBER,Data0005.EMPLOYEE_NAME  ,data0012.LOC' +
      'ATION,       '#13#10'case data0060.status when  1 then '#39#26377#25928#30340#39' when  2 t' +
      'hen '#39#26242#32531#39' when  5 then '#39#24050#21462#28040#39' when  6 then '#39#26410#25552#20132#39' end as v_status,'#13 +
      #10' Data0025.set_qty, Data0097.PO_DATE,Data0025.ttype,'#13#10'case data0' +
      '060.so_tp when 0 then '#39#33258#21046#39' when 1 then '#39#22806#21457#39' when 2 then '#39#21322#21046#31243#39' en' +
      'd sotp,'#13#10' Data0001.CURR_CODE,Data0025.ONHOLD_SALES_FLAG '#13#10'FROM  ' +
      '       dbo.Data0005 INNER JOIN'#13#10'                      dbo.Data00' +
      '97 INNER JOIN'#13#10'                      dbo.Data0060 INNER JOIN'#13#10'  ' +
      '                    dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR =' +
      ' dbo.Data0025.RKEY INNER JOIN'#13#10'                      dbo.Data001' +
      '0 ON dbo.Data0060.CUSTOMER_PTR = dbo.Data0010.RKEY ON dbo.Data00' +
      '97.RKEY = dbo.Data0060.PURCHASE_ORDER_PTR ON '#13#10'                 ' +
      '     dbo.Data0005.RKEY = dbo.Data0060.ENTERED_BY_EMPL_PTR INNER ' +
      'JOIN'#13#10'                      dbo.Data0001 ON dbo.Data0060.CURRENC' +
      'Y_PTR = dbo.Data0001.RKEY INNER JOIN'#13#10'                      dbo.' +
      'Data0012 ON dbo.Data0060.CUST_SHIP_ADDR_PTR = dbo.Data0012.RKEY'#13 +
      #10'WHERE (Data0060.STATUS not in(3,4))'
    Params = <>
    Left = 520
    Top = 144
  end
  object cdstemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 496
    Top = 216
  end
  object cdstemp2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 520
    Top = 280
  end
end
