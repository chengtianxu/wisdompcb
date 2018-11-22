inherited frmSelShipAddr_mod284: TfrmSelShipAddr_mod284
  Caption = #35013#36816#22320#28857#25628#32034
  ClientHeight = 500
  ClientWidth = 510
  ExplicitWidth = 526
  ExplicitHeight = 539
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 510
    Height = 36
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 547
    object lbl1: TLabel
      Left = 83
      Top = 12
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #35013#36816#22320#28857':'
    end
    object edt_qry: TEdit
      Left = 138
      Top = 8
      Width = 180
      Height = 21
      TabOrder = 0
      OnChange = edt_qryChange
      OnKeyDown = edt_qryKeyDown
    end
    object btn_Reset: TBitBtn
      Left = 315
      Top = 8
      Width = 25
      Height = 25
      Hint = #21047#26032
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADABFBFBDADADADADADDADADBFADADADADAADADAD000DADADADDADAD0FBF0DA
        DADAADAD0F7FBF0DADADDAD0F7F87BF0DADAAD0F7F87BFB70DADD0F7F87BFB78
        80DA000F87BFB78880ADDAD00BFB78880ADAADADA0B7888740ADDADADA088804
        440AADADADA000A04440DADADADADADA0440ADADADADADADA00D}
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = False
      OnClick = btn_ResetClick
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 459
    Width = 510
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 386
    ExplicitWidth = 547
    DesignSize = (
      510
      41)
    object btn2: TButton
      Left = 175
      Top = 12
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
      ExplicitLeft = 190
    end
    object btn3: TButton
      Left = 263
      Top = 12
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
      ExplicitLeft = 285
    end
  end
  object dbctrlgrd1: TDBCtrlGrid
    Left = 0
    Top = 36
    Width = 510
    Height = 423
    Align = alClient
    AllowDelete = False
    AllowInsert = False
    DataSource = ds1
    PanelHeight = 141
    PanelWidth = 493
    TabOrder = 2
    OnDblClick = dbctrlgrd1DblClick
    ExplicitWidth = 547
    ExplicitHeight = 350
    object lbl2: TLabel
      Left = 16
      Top = 10
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Caption = '  '#35013#36816#22320#28857
      FocusControl = dbedt_location
    end
    object lbl3: TLabel
      Left = 34
      Top = 35
      Width = 34
      Height = 13
      Alignment = taRightJustify
      Caption = '  '#24030'/'#30465
      FocusControl = dbedt_state
    end
    object lbl4: TLabel
      Left = 223
      Top = 34
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = '  '#37038#32534
      FocusControl = dbedt_zip
    end
    object lbl5: TLabel
      Left = 42
      Top = 63
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = ' '#22320#22336
    end
    object dbedt_location: TDBEdit
      Left = 76
      Top = 7
      Width = 350
      Height = 21
      DataField = 'location'
      DataSource = ds1
      TabOrder = 0
    end
    object dbedt_state: TDBEdit
      Left = 76
      Top = 32
      Width = 134
      Height = 21
      DataField = 'state'
      DataSource = ds1
      TabOrder = 1
    end
    object dbedt_zip: TDBEdit
      Left = 259
      Top = 29
      Width = 134
      Height = 21
      DataField = 'zip'
      DataSource = ds1
      TabOrder = 2
    end
    object dbmmo_ship_to_address_1: TDBMemo
      Left = 75
      Top = 56
      Width = 359
      Height = 53
      DataField = 'ship_to_address_1'
      DataSource = ds1
      TabOrder = 3
    end
  end
  object ds1: TDataSource
    DataSet = cds1
    Left = 336
    Top = 286
  end
  object cds1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 376
    Top = 285
  end
end
