inherited frmINVTM_Mod29: TfrmINVTM_Mod29
  Left = 380
  Top = 235
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26434#39033#29289#26009#36873#25321
  ClientHeight = 539
  ClientWidth = 526
  ExplicitWidth = 532
  ExplicitHeight = 568
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 325
    Top = 132
    Width = 60
    Height = 13
    Caption = #29615#20445#26631#35782#65306
  end
  object Label6: TLabel
    Left = 65
    Top = 167
    Width = 60
    Height = 13
    Caption = #37319#36141#21333#20301#65306
  end
  object Label8: TLabel
    Left = 77
    Top = 198
    Width = 48
    Height = 13
    Caption = #20379#24212#21830#65306
  end
  object Label9: TLabel
    Left = 89
    Top = 233
    Width = 36
    Height = 13
    Caption = #24037#21378#65306
  end
  object Label10: TLabel
    Left = 65
    Top = 268
    Width = 60
    Height = 13
    Caption = #20132#36135#26085#26399#65306
  end
  object Label12: TLabel
    Left = 65
    Top = 303
    Width = 60
    Height = 13
    Caption = #20132#36135#25209#27425#65306
  end
  object Label14: TLabel
    Left = 307
    Top = 301
    Width = 36
    Height = 13
    Caption = #38388#38548#65306
  end
  object Label15: TLabel
    Left = 422
    Top = 300
    Width = 24
    Height = 13
    Caption = #22825#25968
  end
  object Label16: TLabel
    Left = 89
    Top = 334
    Width = 36
    Height = 13
    Caption = #25968#37327#65306
  end
  object Label17: TLabel
    Left = 53
    Top = 371
    Width = 72
    Height = 13
    Caption = #19981#21547#31246#20215#26684#65306
  end
  object Label18: TLabel
    Left = 283
    Top = 371
    Width = 60
    Height = 13
    Caption = #21547#31246#20215#26684#65306
  end
  object Label19: TLabel
    Left = 307
    Top = 335
    Width = 36
    Height = 13
    Caption = #31246#29575#65306
  end
  object Label21: TLabel
    Left = 385
    Top = 334
    Width = 11
    Height = 13
    Caption = '%'
  end
  object Label22: TLabel
    Left = 65
    Top = 63
    Width = 60
    Height = 13
    Caption = #24211#23384#26448#26009#65306
  end
  object Label23: TLabel
    Left = 65
    Top = 98
    Width = 60
    Height = 13
    Caption = #26448#26009#35268#26684#65306
  end
  object Label25: TLabel
    Left = 65
    Top = 443
    Width = 60
    Height = 13
    Caption = #35831#36141#32534#21495#65306
  end
  object Label26: TLabel
    Left = 283
    Top = 405
    Width = 60
    Height = 13
    Caption = #35831#36141#37096#38376#65306
  end
  object Label27: TLabel
    Left = 67
    Top = 407
    Width = 60
    Height = 13
    Caption = #35831#36141#20154#21592#65306
  end
  object Label1: TLabel
    Left = 422
    Top = 334
    Width = 11
    Height = 13
    Caption = '%'
  end
  object Label28: TLabel
    Left = 89
    Top = 132
    Width = 36
    Height = 13
    Caption = #31867#21035#65306
  end
  object Label4: TLabel
    Left = 283
    Top = 443
    Width = 60
    Height = 13
    Caption = #35831#36141#21407#22240#65306
  end
  object rkyINVTM: TRKeyRzBtnEdit
    Left = 131
    Top = 63
    Width = 329
    Height = 21
    Text = ''
    TabOrder = 8
    ButtonKind = bkFind
    ButtonVisible = False
    AltBtnWidth = 15
    ButtonWidth = 15
    DataSource = ds72
    DataSourceField = 'DESCRIPTION'
    DisplayModID = 0
    ForceOnFocus = True
  end
  object rgRule: TRzRadioGroup
    Left = 213
    Top = 8
    Width = 147
    Height = 44
    Caption = #37319#36141#35746#21333#26684#24335
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #26684#24335#19968
      #26684#24335#20108)
    StartXPos = 15
    TabOrder = 0
  end
  object cbxRoSH: TRzComboBox
    Left = 391
    Top = 129
    Width = 67
    Height = 21
    Style = csDropDownList
    Color = clInfoBk
    TabOrder = 1
    Items.Strings = (
      'RoSH'
      #38750'RoSH')
  end
  object rkyUnit: TRKeyRzBtnEdit
    Left = 131
    Top = 163
    Width = 109
    Height = 21
    Text = ''
    TabOrder = 2
    ButtonKind = bkFind
    AltBtnWidth = 15
    ButtonWidth = 15
    DataSource = ds72
    DataSourceField = 'UNIT_PTR'
    DispalyTableName = 'DATA0002'
    DisplaytextField = 'UNIT_CODE'
    DisplayRetKeyField = 'rkey'
    DisplayNoteField = 'UNIT_NAME'
    DisplayPickID = '6'
    DisplayModID = 29
    ForceOnFocus = True
  end
  object rkySupplier: TRKeyRzBtnEdit
    Left = 131
    Top = 196
    Width = 109
    Height = 21
    Text = ''
    TabOrder = 3
    OnExit = rkySupplierExit
    ButtonKind = bkFind
    AltBtnWidth = 15
    ButtonWidth = 15
    OnButtonClick = rkySupplierButtonClick
    DataSource = ds72
    DataSourceField = 'SUPPLIER_POINTER'
    DispalyTableName = 'DATA0023'
    DisplaytextField = 'CODE'
    DisplayRetKeyField = 'RKEY'
    DisplayNoteField = 'SUPPLIER_NAME'
    DisplayPickID = '1'
    DisplayModID = 29
    ForceOnFocus = True
  end
  object rkyQuan: TRKeyRzBtnEdit
    Left = 131
    Top = 334
    Width = 109
    Height = 21
    Text = ''
    TabOrder = 4
    OnExit = rkyQuanExit
    OnKeyPress = rkyQuanKeyPress
    ButtonKind = bkFind
    ButtonVisible = False
    AltBtnWidth = 15
    ButtonWidth = 15
    DataSource = ds72
    DataSourceField = 'QUAN_ORD'
    DisplayModID = 0
    ForceOnFocus = True
  end
  object rkyTaxRate: TRKeyRzBtnEdit
    Left = 349
    Top = 332
    Width = 67
    Height = 21
    Text = ''
    TabOrder = 5
    OnExit = edtTaxExit
    ButtonKind = bkFind
    ButtonVisible = False
    AltBtnWidth = 15
    ButtonWidth = 15
    DataSource = ds72
    DataSourceField = 'STATE_TAX'
    DisplayModID = 0
    ForceOnFocus = True
  end
  object btnCommit: TBitBtn
    Left = 153
    Top = 489
    Width = 75
    Height = 25
    Caption = #30830#35748
    TabOrder = 6
    OnClick = btnCommitClick
  end
  object btnCancel: TBitBtn
    Left = 325
    Top = 489
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 7
  end
  object rkyDesc: TRKeyRzBtnEdit
    Left = 131
    Top = 96
    Width = 329
    Height = 21
    Text = ''
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 9
    ButtonKind = bkFind
    ButtonVisible = False
    AltBtnWidth = 15
    ButtonWidth = 15
    DataSource = ds72
    DataSourceField = 'GUI_GE'
    DisplayModID = 0
    ForceOnFocus = True
  end
  object rkyReqNo: TRKeyRzBtnEdit
    Left = 131
    Top = 440
    Width = 109
    Height = 21
    Text = ''
    Color = clBtnFace
    Enabled = False
    TabOrder = 10
    ButtonKind = bkFind
    ButtonVisible = False
    AltBtnWidth = 15
    ButtonWidth = 15
    DisplayModID = 0
    ForceOnFocus = True
  end
  object rkyUser: TRKeyRzBtnEdit
    Left = 133
    Top = 405
    Width = 107
    Height = 21
    Text = ''
    Color = clBtnFace
    Enabled = False
    TabOrder = 11
    ButtonKind = bkFind
    ButtonVisible = False
    AltBtnWidth = 15
    ButtonWidth = 15
    DisplayModID = 0
    ForceOnFocus = True
  end
  object rkyDepName: TRKeyRzBtnEdit
    Left = 349
    Top = 402
    Width = 109
    Height = 21
    Text = ''
    Color = clBtnFace
    Enabled = False
    TabOrder = 12
    ButtonKind = bkFind
    ButtonVisible = False
    AltBtnWidth = 15
    ButtonWidth = 15
    DisplayModID = 0
    ForceOnFocus = True
  end
  object edtBatch: TEdit
    Left = 131
    Top = 299
    Width = 109
    Height = 21
    TabOrder = 13
    Text = '1'
    OnExit = edtBatchExit
    OnKeyPress = edtBatchKeyPress
  end
  object edtDays: TEdit
    Left = 348
    Top = 297
    Width = 68
    Height = 21
    ReadOnly = True
    TabOrder = 14
    Text = '0'
    OnKeyPress = edtBatchKeyPress
  end
  object cbxFactory: TRzComboBox
    Left = 133
    Top = 230
    Width = 310
    Height = 21
    Style = csDropDownList
    TabOrder = 15
  end
  object edtDate: TEdit
    Left = 131
    Top = 263
    Width = 109
    Height = 21
    TabOrder = 16
    OnExit = edtDateExit
  end
  object cbxType: TComboBox
    Left = 131
    Top = 129
    Width = 142
    Height = 21
    Style = csDropDownList
    TabOrder = 17
  end
  object rkyReason: TRKeyRzBtnEdit
    Left = 349
    Top = 440
    Width = 109
    Height = 21
    Text = ''
    TabOrder = 18
    ButtonKind = bkFind
    ButtonVisible = False
    AltBtnWidth = 15
    ButtonWidth = 15
    DataSource = ds72
    DataSourceField = 'reason'
    DisplayModID = 0
    ForceOnFocus = True
  end
  object chkIF_urgency: TDBCheckBox
    Left = 348
    Top = 266
    Width = 97
    Height = 17
    Caption = #32039#24613#29289#26009
    DataField = 'IF_urgency'
    DataSource = ds72
    TabOrder = 19
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object edtTax: TEdit
    Left = 348
    Top = 366
    Width = 110
    Height = 21
    TabOrder = 20
    Text = '0.0000'
    OnExit = edtTaxExit
    OnKeyPress = edtTaxKeyPress
  end
  object edtUnTax: TEdit
    Left = 131
    Top = 368
    Width = 109
    Height = 21
    Enabled = False
    TabOrder = 21
    Text = '0'
  end
  object cds72: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT Data0070.SUPPLIER_POINTER,Data0070.WAREHOUSE_POINTER,Data' +
      '0072.*'#13#10'FROM Data0072 INNER JOIN'#13#10#9#9'Data0070 ON Data0072.POPTR =' +
      ' Data0070.RKEY'
    Params = <>
    Left = 8
    Top = 480
  end
  object ds72: TDataSource
    DataSet = cds72
    Left = 48
    Top = 488
  end
end
