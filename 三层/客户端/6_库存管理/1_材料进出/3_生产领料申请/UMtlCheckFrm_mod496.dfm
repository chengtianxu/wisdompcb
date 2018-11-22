inherited frmMtlCheck: TfrmMtlCheck
  Caption = #29289#26009#26816#26597
  ClientHeight = 540
  ClientWidth = 497
  Position = poMainFormCenter
  OnClose = FormClose
  ExplicitWidth = 513
  ExplicitHeight = 579
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 497
    Height = 540
    Align = alClient
    TabOrder = 0
    object lbl9: TLabel
      Left = 53
      Top = 11
      Width = 48
      Height = 13
      Caption = #26448#26009#32534#30721
    end
    object lbl10: TLabel
      Left = 25
      Top = 39
      Width = 76
      Height = 13
      Caption = #26448#26009#21517#31216'/'#35268#26684
    end
    object lbl11: TLabel
      Left = 53
      Top = 71
      Width = 48
      Height = 13
      Caption = #24211#23384#21333#20301
    end
    object lbl1: TLabel
      Left = -3
      Top = 102
      Width = 104
      Height = 13
      Caption = #26448#26009#24037#24207#25511#21046#26631#20934
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object lbl3: TLabel
      Left = 21
      Top = 126
      Width = 80
      Height = 19
      Caption = #26377#25928#24211#23384
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnCancel: TBitBtn
      Left = 246
      Top = 429
      Width = 75
      Height = 25
      Caption = #21462#28040
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 0
    end
    object btnOK: TBitBtn
      Left = 110
      Top = 429
      Width = 75
      Height = 25
      Caption = #30830#23450
      Default = True
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      TabOrder = 1
      OnClick = btnOKClick
    end
    object grp2: TGroupBox
      Left = 16
      Top = 271
      Width = 345
      Height = 152
      Caption = #30003#35831#20449#24687
      TabOrder = 2
      object lbl12: TLabel
        Left = 20
        Top = 52
        Width = 36
        Height = 13
        Caption = #20379#24212#21830
      end
      object lbl13: TLabel
        Left = 3
        Top = 26
        Width = 56
        Height = 13
        Caption = #30003#35831#25968#37327
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl8: TLabel
        Left = 3
        Top = 76
        Width = 56
        Height = 13
        Caption = #36229#39046#29702#30001
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object mmo_remark: TMemo
        Left = 65
        Top = 76
        Width = 265
        Height = 70
        TabOrder = 0
      end
      object edt_vendor: TRKeyRzBtnEdit
        Left = 62
        Top = 49
        Width = 163
        Height = 21
        Text = ''
        Color = clBtnFace
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMedGray
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        FocusColor = clScrollBar
        ParentFont = False
        TabOrder = 1
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds468_Sel
        DataSourceField = 'abbr_name'
        DisplayModID = 0
        ForceOnFocus = True
      end
      object edt_ReqQty: TRKeyRzBtnEdit
        Left = 62
        Top = 22
        Width = 163
        Height = 21
        Text = ''
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        FocusColor = clScrollBar
        ParentFont = False
        TabOrder = 2
        OnKeyPress = edt_ReqQtyKeyPress
        ButtonKind = bkFind
        ButtonVisible = False
        AltBtnWidth = 15
        ButtonWidth = 15
        DataSource = ds468_Sel
        DataSourceField = 'QUAN_BOM'
        DisplayModID = 0
        ForceOnFocus = True
      end
    end
    object cbb_BZ: TComboBox
      Left = 105
      Top = 99
      Width = 136
      Height = 21
      Style = csDropDownList
      TabOrder = 3
      OnChange = cbb_BZChange
    end
    object grp1: TGroupBox
      Left = 16
      Top = 152
      Width = 185
      Height = 113
      Caption = #25353#25511#21046#26631#20934#39046#26009': '
      TabOrder = 4
      object lbl2: TLabel
        Left = 13
        Top = 20
        Width = 72
        Height = 13
        Caption = #26412#26376#24635#21487#39046#25968
      end
      object lbl4: TLabel
        Left = 25
        Top = 44
        Width = 60
        Height = 13
        Caption = #26412#26376#24050#39046#25968
      end
      object lbl5: TLabel
        Left = 37
        Top = 87
        Width = 48
        Height = 13
        Caption = #36824#21487#39046#25968
      end
      object lbl7: TLabel
        Left = 37
        Top = 68
        Width = 48
        Height = 13
        Caption = #19978#26376#32467#23384
      end
      object edt_AQty: TEdit
        Left = 88
        Top = 17
        Width = 81
        Height = 21
        Color = clScrollBar
        ReadOnly = True
        TabOrder = 0
      end
      object edt_GQty: TEdit
        Left = 91
        Top = 41
        Width = 81
        Height = 21
        Color = clScrollBar
        ReadOnly = True
        TabOrder = 1
      end
      object edt_SQty: TEdit
        Left = 88
        Top = 82
        Width = 81
        Height = 21
        Color = clScrollBar
        ReadOnly = True
        TabOrder = 2
      end
      object edt_CQty: TEdit
        Left = 88
        Top = 63
        Width = 81
        Height = 21
        Color = clScrollBar
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
    end
    object edt_phone_ProdNo: TRKeyRzBtnEdit
      Left = 331
      Top = 8
      Width = 136
      Height = 21
      Text = ''
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Visible = False
      ButtonKind = bkFind
      AltBtnWidth = 15
      ButtonWidth = 15
      OnButtonClick = edt_phone_ProdNoButtonClick
      DataSource = ds468_Sel
      DataSourceField = 'rkey17'
      DispalyTableName = 'data0017'
      DisplaytextField = 'INV_PART_NUMBER'
      DisplayRetKeyField = 'rkey'
      DisplayPickID = '5'
      DisplayModID = 496
      ForceOnFocus = True
    end
    object edt_ProdDesc: TRKeyRzBtnEdit
      Left = 105
      Top = 35
      Width = 313
      Height = 21
      Text = ''
      Color = clBtnFace
      Enabled = False
      FocusColor = clScrollBar
      TabOrder = 6
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = ds468_Sel
      DataSourceField = 'INV_PART_DESCRIPTION'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object edt_UnitName: TRKeyRzBtnEdit
      Left = 107
      Top = 62
      Width = 136
      Height = 21
      Text = ''
      Color = clBtnFace
      Enabled = False
      FocusColor = clScrollBar
      TabOrder = 7
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = ds468_Sel
      DataSourceField = 'unit_name'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object edt_StockQty: TRKeyRzBtnEdit
      Left = 105
      Top = 126
      Width = 136
      Height = 21
      Text = ''
      Color = clBtnFace
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      FocusColor = clScrollBar
      ParentFont = False
      TabOrder = 8
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DisplayModID = 0
      ForceOnFocus = True
    end
    object edt_ProdNo: TRKeyRzBtnEdit
      Left = 107
      Top = 8
      Width = 121
      Height = 21
      Text = ''
      TabOrder = 9
      ButtonKind = bkFind
      AltBtnWidth = 15
      ButtonWidth = 15
      OnButtonClick = edt_ProdNoButtonClick
      DataSource = ds468_Sel
      DataSourceField = 'rkey17'
      DispalyTableName = 'data0017'
      DisplaytextField = 'INV_PART_NUMBER'
      DisplayRetKeyField = 'rkey'
      DisplayPickID = '5'
      DisplayModID = 496
      ForceOnFocus = True
    end
  end
  object cds468_Sel: TClientDataSet
    Aggregates = <>
    CommandText = 
      ' select    d468.*, d17.rkey as rkey17,d17.inv_part_number,d17.IN' +
      'V_PART_DESCRIPTION,d2.unit_name, d136.control_name ,d136.rkey as' +
      ' rkey136,d23.abbr_name,d23.rkey as rkey23,'#13#10' '#39#39' as PRINTIT_S'#13#10'fr' +
      'om Data0468 d468 '#13#10'inner join data0017 d17 on d468.INVenT_PTR = ' +
      'd17.RKEY  '#13#10'inner join data0023 d23 on d468.supplier_ptr = d23.R' +
      'KEY '#13#10'inner join data0002  d2 on d468.RUnit=d2.rkey '#13#10'inner join' +
      ' data0136 d136  on d136.rkey=d468.control_ptr'#13#10'where 1=0'
    Params = <>
    Left = 364
    Top = 96
  end
  object ds468_Sel: TDataSource
    DataSet = cds468_Sel
    Left = 428
    Top = 96
  end
end
