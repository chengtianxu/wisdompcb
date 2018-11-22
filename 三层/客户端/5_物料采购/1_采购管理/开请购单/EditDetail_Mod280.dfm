inherited frmDetailEdit_Mod280: TfrmDetailEdit_Mod280
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #29983#20135#29289#26009#35831#36141#32534#36753
  ClientHeight = 347
  ClientWidth = 603
  OnShow = FormShow
  ExplicitWidth = 609
  ExplicitHeight = 376
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 603
    Height = 347
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 603
    ExplicitHeight = 347
    inherited pnl1: TPanel
      Width = 601
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 601
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Width = 601
      Height = 312
      ExplicitLeft = 1
      ExplicitTop = 34
      ExplicitWidth = 601
      ExplicitHeight = 312
      object Label9: TLabel
        Left = 12
        Top = 11
        Width = 48
        Height = 12
        Caption = #38656#27714#24037#21378
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 12
        Top = 37
        Width = 48
        Height = 12
        Caption = #26448#26009#32534#30721
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object GroupBox1: TGroupBox
        Left = 9
        Top = 66
        Width = 264
        Height = 241
        Caption = #26448#26009#22522#26412#20449#24687
        TabOrder = 0
        object Label2: TLabel
          Left = 11
          Top = 21
          Width = 48
          Height = 12
          Caption = #26448#26009#21517#31216
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 11
          Top = 48
          Width = 48
          Height = 12
          Caption = #26448#26009#35268#26684
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 10
          Top = 74
          Width = 48
          Height = 12
          Caption = #37319#36141#21333#20301
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 10
          Top = 152
          Width = 48
          Height = 12
          Caption = #24403#21069#24211#23384
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 10
          Top = 181
          Width = 48
          Height = 12
          Caption = #22312#36884#25968#37327
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label12: TLabel
          Left = 7
          Top = 102
          Width = 114
          Height = 12
          Caption = #23384#36135'/'#37319#36141#21333#20301#36716#25442#29575
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label13: TLabel
          Left = 10
          Top = 127
          Width = 54
          Height = 12
          Caption = 'IQC'#26816#26597#21542
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label14: TLabel
          Left = 105
          Top = 126
          Width = 52
          Height = 13
          Caption = #37325#35201#29289#26009':'
        end
        object Label15: TLabel
          Left = 9
          Top = 207
          Width = 48
          Height = 13
          Caption = #26368#39640#24211#23384
        end
        object Label16: TLabel
          Left = 136
          Top = 207
          Width = 48
          Height = 13
          Caption = #23433#20840#24211#23384
        end
        object RedtMaterName: TRKeyRzBtnEdit
          Left = 65
          Top = 16
          Width = 192
          Height = 21
          Text = ''
          Color = clInfoBk
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ReadOnly = True
          TabOrder = 0
          ButtonKind = bkFind
          ButtonVisible = False
          AltBtnWidth = 15
          ButtonWidth = 15
          DataSource = ds69
          DataSourceField = 'INVT_PTR'
          DispalyTableName = 'data0017'
          DisplaytextField = 'INV_NAME'
          DisplayRetKeyField = 'rkey'
          DisplayPickID = '6'
          DisplayModID = 280
          ForceOnFocus = True
        end
        object RedtMaterGuige: TRKeyRzBtnEdit
          Left = 65
          Top = 43
          Width = 192
          Height = 21
          Text = ''
          Color = clInfoBk
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ReadOnly = True
          TabOrder = 1
          ButtonKind = bkFind
          ButtonVisible = False
          AltBtnWidth = 15
          ButtonWidth = 15
          DataSource = ds69
          DataSourceField = 'INVT_PTR'
          DispalyTableName = 'data0017'
          DisplaytextField = 'INV_DESCRIPTION'
          DisplayRetKeyField = 'rkey'
          DisplayPickID = '6'
          DisplayModID = 280
          ForceOnFocus = True
        end
        object RedtPurUnit1: TRKeyRzBtnEdit
          Left = 65
          Top = 70
          Width = 56
          Height = 21
          Text = ''
          Color = clInfoBk
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ReadOnly = True
          TabOrder = 2
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
        object RedtPurUnit2: TRKeyRzBtnEdit
          Left = 127
          Top = 70
          Width = 130
          Height = 21
          Text = ''
          Color = clInfoBk
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ReadOnly = True
          TabOrder = 3
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
        object RedtPercent: TRKeyRzBtnEdit
          Left = 127
          Top = 97
          Width = 130
          Height = 21
          Text = ''
          Color = clInfoBk
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ReadOnly = True
          TabOrder = 4
          ButtonKind = bkFind
          ButtonVisible = False
          AltBtnWidth = 15
          ButtonWidth = 15
          DataSource = ds69
          DataSourceField = 'CONVERSION_FACTOR'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object RedtIfCheck: TRKeyRzBtnEdit
          Left = 64
          Top = 121
          Width = 35
          Height = 21
          Text = ''
          Color = clInfoBk
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ReadOnly = True
          TabOrder = 5
          ButtonKind = bkFind
          ButtonVisible = False
          AltBtnWidth = 15
          ButtonWidth = 15
          DataSource = ds69
          DataSourceField = 'INVT_PTR'
          DispalyTableName = 'data0017'
          DisplaytextField = 'INSPECT'
          DisplayRetKeyField = 'rkey'
          DisplayPickID = '6'
          DisplayModID = 280
          ForceOnFocus = True
        end
        object RedtIfMajor: TRKeyRzBtnEdit
          Left = 163
          Top = 121
          Width = 94
          Height = 21
          Text = ''
          Color = clInfoBk
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ReadOnly = True
          TabOrder = 6
          ButtonKind = bkFind
          ButtonVisible = False
          AltBtnWidth = 15
          ButtonWidth = 15
          DisplayModID = 0
          ForceOnFocus = True
        end
        object RedtStock: TRKeyRzBtnEdit
          Left = 64
          Top = 148
          Width = 193
          Height = 21
          Text = ''
          Color = clInfoBk
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          TabOrder = 7
          ButtonKind = bkFind
          AltBtnWidth = 15
          ButtonWidth = 15
          OnButtonClick = RedtStockButtonClick
          DisplayModID = 0
          ForceOnFocus = True
        end
        object RedtTranQty: TRKeyRzBtnEdit
          Left = 64
          Top = 175
          Width = 193
          Height = 21
          Text = ''
          Color = clInfoBk
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          TabOrder = 8
          ButtonKind = bkFind
          AltBtnWidth = 15
          ButtonWidth = 15
          OnButtonClick = RedtTranQtyButtonClick
          DisplayModID = 0
          ForceOnFocus = True
        end
        object RedtMaxStock: TRKeyRzBtnEdit
          Left = 64
          Top = 202
          Width = 66
          Height = 21
          Text = ''
          Color = clInfoBk
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ReadOnly = True
          TabOrder = 9
          ButtonKind = bkFind
          ButtonVisible = False
          AltBtnWidth = 15
          ButtonWidth = 15
          DataSource = ds69
          DataSourceField = 'INVT_PTR'
          DispalyTableName = 'data0017'
          DisplaytextField = 'REPORT_VALUE2'
          DisplayRetKeyField = 'rkey'
          DisplayPickID = '6'
          DisplayModID = 280
          ForceOnFocus = True
        end
        object RedtSafeStock: TRKeyRzBtnEdit
          Left = 190
          Top = 202
          Width = 67
          Height = 21
          Text = ''
          Color = clInfoBk
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ReadOnly = True
          TabOrder = 10
          ButtonKind = bkFind
          ButtonVisible = False
          AltBtnWidth = 15
          ButtonWidth = 15
          DataSource = ds69
          DataSourceField = 'INVT_PTR'
          DispalyTableName = 'data0017'
          DisplaytextField = 'CONSIGN_ONHAND_QTY'
          DisplayRetKeyField = 'rkey'
          DisplayPickID = '6'
          DisplayModID = 280
          ForceOnFocus = True
        end
      end
      object GroupBox2: TGroupBox
        Left = 273
        Top = 66
        Width = 322
        Height = 241
        Caption = #35831#36141#20449#24687
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object Label5: TLabel
          Left = 20
          Top = 27
          Width = 48
          Height = 12
          Caption = #35831#36141#25968#37327
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 9
          Top = 94
          Width = 60
          Height = 12
          Caption = #35201#27714#21040#36135#26085
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 19
          Top = 129
          Width = 48
          Height = 12
          Caption = #35831#36141#21407#22240
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 18
          Top = 165
          Width = 48
          Height = 12
          Caption = #29305#21035#35201#27714
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object lbl1: TLabel
          Left = 4
          Top = 61
          Width = 84
          Height = 12
          Caption = #35831#36141#26102#38656#27714#25968#37327
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object DtpkYqdhrq: TDBDateTimeEditEh
          Left = 72
          Top = 88
          Width = 146
          Height = 21
          DataField = 'REQ_DATE'
          DataSource = ds69
          DynProps = <>
          EditButtons = <>
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          Kind = dtkDateEh
          TabOrder = 0
          Visible = True
        end
        object RedtRqQty: TRKeyRzBtnEdit
          Left = 69
          Top = 22
          Width = 84
          Height = 21
          Text = '0'
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          TabOrder = 1
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
        object RedtRqUnit: TRKeyRzBtnEdit
          Left = 157
          Top = 23
          Width = 60
          Height = 21
          Text = ''
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          TabOrder = 2
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
        object RedtRqNeedQty: TRKeyRzBtnEdit
          Left = 89
          Top = 54
          Width = 129
          Height = 21
          Text = ''
          Color = clBtnFace
          Enabled = False
          FocusColor = clSilver
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          ReadOnly = True
          TabOrder = 3
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
        object RedtRqReason: TRKeyRzBtnEdit
          Left = 69
          Top = 123
          Width = 240
          Height = 21
          Text = ''
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          TabOrder = 4
          ButtonKind = bkFind
          ButtonVisible = False
          AltBtnWidth = 15
          ButtonWidth = 15
          DataSource = ds69
          DataSourceField = 'reason'
          DisplayModID = 0
          ForceOnFocus = True
        end
        object RedtSpecReq: TRKeyRzBtnEdit
          Left = 69
          Top = 161
          Width = 241
          Height = 21
          Text = ''
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          TabOrder = 5
          ButtonKind = bkFind
          ButtonVisible = False
          AltBtnWidth = 15
          ButtonWidth = 15
          DataSource = ds69
          DataSourceField = 'extra_req'
          DisplayModID = 0
          ForceOnFocus = True
        end
      end
      object BtnRqHis: TBitBtn
        Left = 352
        Top = 29
        Width = 75
        Height = 25
        Caption = #21382#21490#35831#36141
        TabOrder = 2
        OnClick = BtnRqHisClick
      end
      object dbchkIF_urgency: TDBCheckBox
        Left = 352
        Top = 8
        Width = 97
        Height = 17
        Caption = #26159#21542#32039#24613#29289#26009
        DataField = 'IF_urgency'
        DataSource = ds69
        TabOrder = 3
      end
      object BtSave: TBitBtn
        Left = 208
        Top = 313
        Width = 70
        Height = 29
        Caption = #20445#23384
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
        TabOrder = 4
        OnClick = BtSaveClick
      end
      object BtCan: TBitBtn
        Left = 315
        Top = 313
        Width = 70
        Height = 29
        Caption = #20851#38381
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 5
      end
      object RedtNeedFac: TRKeyRzBtnEdit
        Left = 66
        Top = 6
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
        Left = 66
        Top = 33
        Width = 255
        Height = 21
        Text = ''
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 7
        OnExit = RedtMaterCodeExit
        ButtonKind = bkFind
        AltBtnWidth = 15
        ButtonWidth = 15
        OnButtonClick = RedtMaterCodeButtonClick
        DataSource = ds69
        DataSourceField = 'INVT_PTR'
        DispalyTableName = 'data0017'
        DisplaytextField = 'inv_part_number'
        DisplayRetKeyField = 'rkey'
        DisplayPickID = '6'
        DisplayModID = 280
        ForceOnFocus = True
      end
      object BtnSupp: TBitBtn
        Left = 432
        Top = 29
        Width = 75
        Height = 25
        Caption = #20379#24212#21830
        TabOrder = 8
        OnClick = BtnSuppClick
      end
    end
  end
  object cds69: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 536
    Top = 40
  end
  object ds69: TDataSource
    DataSet = cds69
    Left = 576
    Top = 48
  end
  object cds17: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 544
    Top = 144
  end
end
