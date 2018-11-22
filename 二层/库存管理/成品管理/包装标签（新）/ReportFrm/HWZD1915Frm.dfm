object frmHWZD1915: TfrmHWZD1915
  Left = 271
  Top = 211
  BorderStyle = bsSingle
  Caption = #26631#31614#32534#36753
  ClientHeight = 699
  ClientWidth = 911
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 911
    Height = 49
    Align = alTop
    TabOrder = 2
    TabStop = True
    object lblKHMC: TLabel
      Left = 248
      Top = 1
      Width = 319
      Height = 16
      Align = alCustom
      Alignment = taCenter
      AutoSize = False
      Caption = #23458#25143#21517#31216
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSaleCustName: TLabel
      Left = 288
      Top = 25
      Width = 280
      Height = 16
      Align = alCustom
      Alignment = taCenter
      AutoSize = False
      Caption = #23458#25143#21517#31216
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl123: TLabel
      Left = 229
      Top = 28
      Width = 60
      Height = 13
      Caption = #35746#21333#23458#25143#65306
    end
    object btnOK: TBitBtn
      Left = 0
      Top = 1
      Width = 75
      Height = 30
      Caption = #20445#23384
      TabOrder = 0
      TabStop = False
      OnClick = btnOKClick
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
    end
    object btnClose: TBitBtn
      Left = 76
      Top = 1
      Width = 75
      Height = 30
      Caption = #20851#38381
      TabOrder = 1
      TabStop = False
      OnClick = btnCloseClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
    end
    object btnReset: TBitBtn
      Left = 151
      Top = 1
      Width = 75
      Height = 30
      Caption = #28165#31354
      TabOrder = 2
      TabStop = False
      OnClick = btnResetClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
        33333333333F8888883F33330000324334222222443333388F3833333388F333
        000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
        F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
        223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
        3338888300003AAAAAAA33333333333888888833333333330000333333333333
        333333333333333333FFFFFF000033333333333344444433FFFF333333888888
        00003A444333333A22222438888F333338F3333800003A2243333333A2222438
        F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
        22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
        33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
        3333333333338888883333330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 49
    Width = 911
    Height = 416
    Align = alTop
    TabOrder = 0
    object grp1: TGroupBox
      Left = 7
      Top = 7
      Width = 282
      Height = 394
      Caption = #26631#31614#36755#20837
      TabOrder = 0
      object lbl1: TLabel
        Left = 8
        Top = 56
        Width = 69
        Height = 13
        AutoSize = False
        Caption = #26631#31614#31867#22411#65306
      end
      object lbl2: TLabel
        Left = 8
        Top = 83
        Width = 69
        Height = 13
        AutoSize = False
        Caption = #26412#21378#32534#21495#65306
      end
      object lbl4: TLabel
        Left = 8
        Top = 110
        Width = 69
        Height = 13
        AutoSize = False
        Caption = #38144#21806#35746#21333#65306
      end
      object lbl6: TLabel
        Left = 8
        Top = 136
        Width = 69
        Height = 13
        AutoSize = False
        Caption = #29983#20135#21608#26399#65306
      end
      object lbl12: TLabel
        Left = 8
        Top = 247
        Width = 53
        Height = 13
        AutoSize = False
        Caption = #20928#37325#65306
      end
      object lbl13: TLabel
        Left = 134
        Top = 247
        Width = 38
        Height = 13
        AutoSize = False
        Caption = #27611#37325#65306
      end
      object lbl14: TLabel
        Left = 8
        Top = 274
        Width = 69
        Height = 13
        AutoSize = False
        Caption = #32440#31665#35268#26684#65306
      end
      object lbl16: TLabel
        Left = 8
        Top = 301
        Width = 69
        Height = 13
        AutoSize = False
        Caption = #22791#27880#65306
      end
      object lbl17: TLabel
        Left = 8
        Top = 329
        Width = 56
        Height = 30
        AutoSize = False
        Caption = #34920#38754#22788#29702#35828#26126#65306
        WordWrap = True
      end
      object btnBCBH: TSpeedButton
        Left = 199
        Top = 79
        Width = 23
        Height = 22
        Caption = #26597
        OnClick = btnBCBHClick
      end
      object btnXSDD: TSpeedButton
        Left = 199
        Top = 107
        Width = 23
        Height = 22
        Caption = #26597
        OnClick = btnXSDDClick
      end
      object lbl19: TLabel
        Left = 8
        Top = 364
        Width = 69
        Height = 13
        AutoSize = False
        Caption = #20135#21697#25551#36848#65306
      end
      object lbl22: TLabel
        Left = 8
        Top = 164
        Width = 69
        Height = 13
        AutoSize = False
        Caption = #27599#31665#25968#37327#65306
      end
      object lbl10: TLabel
        Left = 152
        Top = 165
        Width = 39
        Height = 14
        AutoSize = False
        Caption = '(SET)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblDDS: TLabel
        Left = 226
        Top = 89
        Width = 50
        Height = 13
        AutoSize = False
        Caption = '0'
      end
      object lbl24: TLabel
        Left = 226
        Top = 108
        Width = 50
        Height = 13
        AutoSize = False
        Caption = #24050#25171#21360#65306
      end
      object lblYDY: TLabel
        Left = 226
        Top = 123
        Width = 50
        Height = 13
        AutoSize = False
        Caption = '0'
      end
      object lbl26: TLabel
        Left = 226
        Top = 75
        Width = 50
        Height = 13
        AutoSize = False
        Caption = #35746#21333#25968#65306
      end
      object lbl23: TLabel
        Left = 120
        Top = 136
        Width = 12
        Height = 13
        Caption = #24180
      end
      object lbl25: TLabel
        Left = 179
        Top = 137
        Width = 12
        Height = 13
        Caption = #21608
      end
      object lbl27: TLabel
        Left = 9
        Top = 20
        Width = 72
        Height = 13
        AutoSize = False
        Caption = #25195#25551#20869#31665#65306
        Visible = False
      end
      object rgLX: TRadioGroup
        Left = 76
        Top = 44
        Width = 121
        Height = 32
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          #20869#31665
          #22806#31665)
        TabOrder = 0
        OnClick = rgLXClick
      end
      object edtBCBH: TEdit
        Left = 76
        Top = 81
        Width = 121
        Height = 21
        TabOrder = 1
        OnExit = edtBCBHExit
      end
      object edtXSDD: TEdit
        Left = 76
        Top = 108
        Width = 121
        Height = 21
        Color = clMoneyGreen
        ReadOnly = True
        TabOrder = 2
        OnExit = edtXSDDExit
      end
      object edtSLSet: TEdit
        Left = 76
        Top = 162
        Width = 69
        Height = 21
        TabOrder = 3
        OnExit = edtSLSetExit
      end
      object edtJZ: TEdit
        Left = 76
        Top = 245
        Width = 53
        Height = 21
        TabOrder = 4
      end
      object edtZXGG: TEdit
        Left = 76
        Top = 273
        Width = 121
        Height = 21
        TabOrder = 6
      end
      object edtBZ: TEdit
        Left = 76
        Top = 300
        Width = 121
        Height = 21
        TabOrder = 7
      end
      object edtBMCL: TEdit
        Left = 76
        Top = 328
        Width = 121
        Height = 21
        TabOrder = 8
      end
      object edtMZ: TEdit
        Left = 177
        Top = 245
        Width = 53
        Height = 21
        TabOrder = 5
      end
      object edtCPMS: TEdit
        Left = 76
        Top = 358
        Width = 121
        Height = 21
        TabOrder = 9
        Text = #21360#21046#26495
      end
      object seYear: TSpinEdit
        Left = 76
        Top = 132
        Width = 40
        Height = 22
        MaxLength = 2
        MaxValue = 99
        MinValue = 10
        TabOrder = 10
        Value = 10
      end
      object seMoth: TSpinEdit
        Left = 137
        Top = 131
        Width = 39
        Height = 22
        MaxLength = 2
        MaxValue = 52
        MinValue = 1
        TabOrder = 11
        Value = 1
      end
      object edtSCZQ: TEdit
        Left = 76
        Top = 133
        Width = 121
        Height = 21
        TabOrder = 12
        Visible = False
      end
      object edt1: TEdit
        Left = 80
        Top = 16
        Width = 121
        Height = 21
        TabOrder = 13
        Visible = False
        OnKeyPress = edt1KeyPress
      end
      object cbx1: TCheckBox
        Left = 8
        Top = 192
        Width = 65
        Height = 17
        Caption = #25171#21449#26495
        TabOrder = 14
        OnClick = cbx1Click
      end
      object grp4: TGroupBox
        Left = 74
        Top = 187
        Width = 185
        Height = 54
        TabOrder = 15
        object lbl30: TLabel
          Left = 8
          Top = 8
          Width = 36
          Height = 13
          Caption = #21333#20301#65306
        end
        object lbl31: TLabel
          Left = 8
          Top = 32
          Width = 36
          Height = 13
          Caption = #25968#37327#65306
        end
        object cbx2: TComboBox
          Left = 48
          Top = 6
          Width = 89
          Height = 21
          Style = csDropDownList
          Enabled = False
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 0
          Text = 'PCS'
          OnChange = cbx2Change
          Items.Strings = (
            'PCS'
            #21306#22495)
        end
        object se1: TSpinEdit
          Left = 50
          Top = 26
          Width = 57
          Height = 22
          Enabled = False
          MaxValue = 0
          MinValue = 0
          TabOrder = 1
          Value = 0
          OnChange = se1Change
        end
      end
    end
    object grp2: TGroupBox
      Left = 304
      Top = 7
      Width = 227
      Height = 214
      Caption = #26631#31614#20449#24687
      TabOrder = 1
      object lbl7: TLabel
        Left = 10
        Top = 81
        Width = 66
        Height = 13
        AutoSize = False
        Caption = #23458#20379#20195#30721#65306
      end
      object lbl8: TLabel
        Left = 10
        Top = 107
        Width = 66
        Height = 13
        AutoSize = False
        Caption = #23458#25143#35746#21333#65306
      end
      object lbl9: TLabel
        Left = 10
        Top = 133
        Width = 66
        Height = 13
        AutoSize = False
        Caption = #23458#25143#29289#26009#65306
      end
      object lbl15: TLabel
        Left = 10
        Top = 55
        Width = 66
        Height = 13
        AutoSize = False
        Caption = #26631#31614#20195#30721#65306
      end
      object lbl11: TLabel
        Left = 11
        Top = 160
        Width = 66
        Height = 13
        AutoSize = False
        Caption = #23458#25143#22411#21495#65306
      end
      object lbl3: TLabel
        Left = 9
        Top = 29
        Width = 66
        Height = 13
        AutoSize = False
        Caption = #23458#25143#20195#30721#65306
      end
      object lbl20: TLabel
        Left = 10
        Top = 186
        Width = 66
        Height = 13
        AutoSize = False
        Caption = #25968#37327'(Pcs)'#65306
      end
      object lblPcsPerSet: TLabel
        Left = 145
        Top = 180
        Width = 42
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl21: TLabel
        Left = 190
        Top = 180
        Width = 34
        Height = 13
        AutoSize = False
        Caption = '/ Set  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl28: TLabel
        Left = 185
        Top = 194
        Width = 34
        Height = 13
        AutoSize = False
        Caption = '/'#21306#22495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl29: TLabel
        Left = 141
        Top = 194
        Width = 42
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtKHDM: TEdit
        Left = 77
        Top = 24
        Width = 121
        Height = 21
        TabStop = False
        Color = clMoneyGreen
        ReadOnly = True
        TabOrder = 0
      end
      object edtBQDM: TEdit
        Left = 77
        Top = 50
        Width = 121
        Height = 21
        TabStop = False
        Color = clMoneyGreen
        ReadOnly = True
        TabOrder = 1
      end
      object edtKGDM: TEdit
        Left = 77
        Top = 76
        Width = 121
        Height = 21
        TabStop = False
        Color = clMoneyGreen
        ReadOnly = True
        TabOrder = 2
      end
      object edtKHDD: TEdit
        Left = 77
        Top = 103
        Width = 121
        Height = 21
        TabStop = False
        Color = clMoneyGreen
        ReadOnly = True
        TabOrder = 3
      end
      object edtKHWL: TEdit
        Left = 77
        Top = 129
        Width = 121
        Height = 21
        TabStop = False
        Color = clMoneyGreen
        ReadOnly = True
        TabOrder = 4
      end
      object edtKHXH: TEdit
        Left = 77
        Top = 156
        Width = 121
        Height = 21
        TabStop = False
        Color = clMoneyGreen
        ReadOnly = True
        TabOrder = 5
      end
      object edtSLPCS: TEdit
        Left = 77
        Top = 182
        Width = 68
        Height = 21
        TabStop = False
        Color = clMoneyGreen
        ReadOnly = True
        TabOrder = 6
      end
    end
    object grp3: TGroupBox
      Left = 304
      Top = 223
      Width = 228
      Height = 94
      TabOrder = 2
      object lbl5: TLabel
        Left = 3
        Top = 17
        Width = 95
        Height = 20
        Caption = #36215#22987#31665#21495':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl18: TLabel
        Left = 3
        Top = 56
        Width = 95
        Height = 20
        Caption = #26631#31614#25968#37327':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnSC: TSpeedButton
        Left = 176
        Top = 54
        Width = 41
        Height = 22
        Caption = #29983#25104
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnSCClick
      end
      object edtQSXH: TEdit
        Left = 104
        Top = 16
        Width = 113
        Height = 24
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object edtBQSL: TEdit
        Left = 104
        Top = 54
        Width = 66
        Height = 24
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object ehWO: TDBGridEh
      Left = 536
      Top = 16
      Width = 361
      Height = 305
      DataSource = ds06
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      ReadOnly = True
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'WORK_ORDER_NUMBER'
          Footers = <>
          Title.Caption = #20316#19994#21333#21495
          Width = 110
        end
        item
          EditButtons = <>
          FieldName = 'QTY_BACKLOG'
          Footers = <>
          Title.Caption = #22312#32447
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'RMA_PTR'
          Footers = <>
          Title.Caption = #25171#21360#25968
        end
        item
          EditButtons = <>
          FieldName = 'SALES_ORDER'
          Footers = <>
          Title.Caption = #35746#21333#21495
          Width = 90
        end>
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 465
    Width = 911
    Height = 234
    Align = alClient
    TabOrder = 1
    object eh699: TDBGridEh
      Left = 1
      Top = 1
      Width = 909
      Height = 232
      Align = alClient
      ColumnDefValues.Title.Alignment = taCenter
      DataSource = ds1
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'CaseNo'
          Footers = <>
          ReadOnly = True
          Title.Caption = #31665#21495
          Width = 50
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'description'
          Footers = <>
          ReadOnly = True
          Title.Caption = #20135#21697#25551#36848
          Width = 100
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'qty'
          Footers = <>
          Title.Caption = #25968#37327
          Width = 50
          OnUpdateData = eh699Columns2UpdateData
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'lotno'
          Footers = <>
          ReadOnly = True
          Title.Caption = #21608#26399
          Width = 50
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'notes'
          Footers = <>
          Title.Caption = #22791#27880
          Width = 100
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'barcode_id'
          Footers = <>
          ReadOnly = True
          Title.Caption = #26465#30721
          Width = 190
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'MANU_PART_NUMBER'
          Footers = <>
          ReadOnly = True
          Title.Caption = #26412#21378#32534#21495
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'MANU_PART_DESC'
          Footers = <>
          ReadOnly = True
          Title.Caption = #23458#25143#22411#21495
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'ANALYSIS_CODE_2'
          Footers = <>
          ReadOnly = True
          Title.Caption = #23458#25143#29289#26009#21495
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'PO_NUMBER'
          Footers = <>
          ReadOnly = True
          Title.Caption = #23458#25143#35746#21333#21495
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'code'
          Footers = <>
          ReadOnly = True
          Title.Caption = #23458#20379#20195#30721
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'pack_ptr'
          Footers = <>
          ReadOnly = True
          Visible = False
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'order_no'
          Footers = <>
          ReadOnly = True
          Title.Caption = #24207#21495
          Width = 30
        end>
    end
  end
  object ads699: TADODataSet
    Connection = DM1.con1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'SELECT * FROM Data0699 WHERE pack_ptr = :Rkey698'
    Parameters = <
      item
        Name = 'Rkey698'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 48
    Top = 393
  end
  object ds1: TDataSource
    DataSet = ads699
    Left = 88
    Top = 393
  end
  object ads06: TADODataSet
    Connection = DM1.con1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'SELECT d06.RKEY,d06.WORK_ORDER_NUMBER,d56.QTY_BACKLOG,d06.RMA_PT' +
      'R,d60.SALES_ORDER FROM data0060 d60'#13#10'INNER JOIN data0492 d492 ON' +
      ' d60.SALES_ORDER = d492.SO_NO'#13#10'INNER JOIN Data0006 d06 ON d06.CU' +
      'T_NO = d492.CUT_NO'#13#10'INNER JOIN data0056 d56 ON d56.WO_PTR = d06.' +
      'RKEY'#13#10'inner join data0025 d25 on d25.RKEY = d06.BOM_PTR'#13#10'WHERE d' +
      '06.PROD_STATUS = 5 AND d25.manu_part_number = :p1'#13#10'ORDER BY d06.' +
      'RMA_PTR ASC'
    Parameters = <
      item
        Name = 'p1'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end>
    Left = 592
    Top = 225
    object ads06RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ads06WORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object ads06QTY_BACKLOG: TFloatField
      FieldName = 'QTY_BACKLOG'
    end
    object ads06RMA_PTR: TIntegerField
      FieldName = 'RMA_PTR'
    end
    object ads06SALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
  end
  object ds06: TDataSource
    DataSet = ads06
    Left = 680
    Top = 225
  end
end
