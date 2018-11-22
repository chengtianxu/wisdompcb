inherited frmSupplier_Mode29: TfrmSupplier_Mode29
  Left = 334
  Top = 228
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #20379#24212#21830#20215#26684#25628#32034
  ClientHeight = 453
  ClientWidth = 721
  ExplicitLeft = 334
  ExplicitTop = 228
  ExplicitWidth = 737
  ExplicitHeight = 491
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 400
    Width = 721
    Height = 53
    Align = alBottom
    TabOrder = 0
    object btnS: TBitBtn
      Left = 254
      Top = 9
      Width = 91
      Height = 33
      Caption = #30830#23450
      TabOrder = 0
      OnClick = btnSClick
    end
    object btnC: TBitBtn
      Left = 428
      Top = 9
      Width = 88
      Height = 33
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 0
    Width = 313
    Height = 400
    Align = alLeft
    TabOrder = 1
    object Label14: TLabel
      Left = 8
      Top = 381
      Width = 37
      Height = 13
      Caption = 'Label14'
    end
    object eh23: TDBGridEh
      Left = 1
      Top = 1
      Width = 311
      Height = 376
      Align = alTop
      DataSource = ds23
      DynProps = <>
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
      ReadOnly = True
      TabOrder = 0
      OnDblClick = eh23DblClick
      Columns = <
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'CODE'
          Footers = <>
          Title.Caption = #20379#24212#21830#20195#30721
          Width = 64
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'SUPPLIER_NAME'
          Footers = <>
          Title.Caption = #20379#24212#21830#21517#31216
          Width = 209
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object pnl3: TPanel
    Left = 313
    Top = 0
    Width = 408
    Height = 400
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 318
    ExplicitTop = 3
    object Label1: TLabel
      Left = 40
      Top = 24
      Width = 96
      Height = 13
      Caption = #20379#24212#21830#37096#20214#21495#30721#65306
    end
    object Label2: TLabel
      Left = 40
      Top = 53
      Width = 96
      Height = 13
      Caption = #20379#24212#21830#30005#35805#21495#30721#65306
    end
    object Label3: TLabel
      Left = 40
      Top = 83
      Width = 96
      Height = 13
      Caption = #20379#24212#21830#20132#36135#26102#38388#65306
    end
    object Label4: TLabel
      Left = 232
      Top = 82
      Width = 12
      Height = 13
      Caption = #22825
    end
    object Label5: TLabel
      Left = 100
      Top = 112
      Width = 36
      Height = 13
      Caption = #36135#24065#65306
    end
    object Label6: TLabel
      Left = 76
      Top = 141
      Width = 60
      Height = 13
      Caption = #37319#36141#21333#20301#65306
    end
    object Label7: TLabel
      Left = 72
      Top = 171
      Width = 64
      Height = 13
      Caption = #23384#36135'/'#37319#36141#65306
    end
    object Label8: TLabel
      Left = 232
      Top = 171
      Width = 60
      Height = 13
      Caption = #29615#20445#26631#35782#65306
    end
    object Label9: TLabel
      Left = 76
      Top = 200
      Width = 60
      Height = 13
      Caption = #35748#21487#26631#35782#65306
    end
    object Label10: TLabel
      Left = 248
      Top = 200
      Width = 44
      Height = 13
      Caption = #32784'CAF'#65306
    end
    object Label11: TLabel
      Left = 24
      Top = 230
      Width = 112
      Height = 13
      Caption = #26368#23567#35746#36141#25968#37327'/'#37329#39069#65306
    end
    object Label12: TLabel
      Left = 52
      Top = 259
      Width = 84
      Height = 13
      Caption = #24314#35758#37325#36141#25968#37327#65306
    end
    object Label13: TLabel
      Left = 244
      Top = 259
      Width = 48
      Height = 13
      Caption = #22686#20540#31246#65306
    end
    object dbtxt1: TDBText
      Left = 232
      Top = 112
      Width = 41
      Height = 17
      DataField = 'CURR_NAME'
      DataSource = ds23
    end
    object dbtxt2: TDBText
      Left = 232
      Top = 138
      Width = 41
      Height = 17
      DataField = 'UNIT_NAME'
      DataSource = ds23
    end
    object sg: TStringGrid
      Left = 6
      Top = 286
      Width = 395
      Height = 108
      ColCount = 4
      DefaultRowHeight = 18
      FixedCols = 0
      RowCount = 7
      TabOrder = 0
      ColWidths = (
        84
        89
        109
        72)
    end
    object rky1: TRKeyRzBtnEdit
      Left = 142
      Top = 21
      Width = 105
      Height = 21
      Text = ''
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 1
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = ds23
      DataSourceField = 'supplier_part_no'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object rky2: TRKeyRzBtnEdit
      Left = 142
      Top = 50
      Width = 105
      Height = 21
      Text = ''
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 2
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = ds23
      DataSourceField = 'phone'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object rky3: TRKeyRzBtnEdit
      Left = 142
      Top = 79
      Width = 84
      Height = 21
      Text = ''
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 3
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = ds23
      DataSourceField = 'lead_time'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object rky4: TRKeyRzBtnEdit
      Left = 142
      Top = 108
      Width = 83
      Height = 21
      Text = ''
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 4
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = ds23
      DataSourceField = 'curr_code'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object rky5: TRKeyRzBtnEdit
      Left = 142
      Top = 137
      Width = 83
      Height = 21
      Text = ''
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 5
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = ds23
      DataSourceField = 'unit_code'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object rky6: TRKeyRzBtnEdit
      Left = 142
      Top = 169
      Width = 75
      Height = 21
      Text = ''
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 6
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = ds23
      DataSourceField = 'CONVERSION_FACTOR'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object rky7: TRKeyRzBtnEdit
      Left = 294
      Top = 168
      Width = 67
      Height = 21
      Text = ''
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 7
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = ds23
      DataSourceField = 'rohs'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object rky8: TRKeyRzBtnEdit
      Left = 142
      Top = 199
      Width = 75
      Height = 21
      Text = ''
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 8
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = ds23
      DataSourceField = 'FLAG'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object rky9: TRKeyRzBtnEdit
      Left = 295
      Top = 200
      Width = 66
      Height = 21
      Text = ''
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 9
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = ds23
      DataSourceField = 'IF_CAF'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object rky10: TRKeyRzBtnEdit
      Left = 142
      Top = 229
      Width = 75
      Height = 21
      Text = ''
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 10
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = ds23
      DataSourceField = 'VALUE'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object rky11: TRKeyRzBtnEdit
      Left = 142
      Top = 258
      Width = 75
      Height = 21
      Text = ''
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 11
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = ds23
      DataSourceField = 'SUGG_REORDER_QTY'
      DisplayModID = 0
      ForceOnFocus = True
    end
    object rky12: TRKeyRzBtnEdit
      Left = 298
      Top = 256
      Width = 63
      Height = 21
      Text = ''
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 12
      ButtonKind = bkFind
      ButtonVisible = False
      AltBtnWidth = 15
      ButtonWidth = 15
      DataSource = ds23
      DataSourceField = 'tax_2'
      DisplayModID = 0
      ForceOnFocus = True
    end
  end
  object ds23: TDataSource
    DataSet = cds23
    Left = 632
    Top = 408
  end
  object cds23: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT  dbo.Data0028.SUPPLIER_PART_NO, dbo.Data0023.PHONE, dbo.D' +
      'ata0028.LEAD_TIME'#13#10#9#9#9', dbo.Data0001.CURR_CODE, dbo.Data0001.CUR' +
      'R_NAME'#13#10#9#9#9', dbo.Data0002.UNIT_CODE, dbo.Data0002.UNIT_NAME'#13#10#9#9#9 +
      ', dbo.Data0028.CONVERSION_FACTOR, dbo.Data0028.rohs'#13#10#9#9#9', dbo.Da' +
      'ta0028.IF_CAF,dbo.Data0028.SUGG_REORDER_QTY'#13#10#9#9#9', dbo.Data0028.T' +
      'AX_2, dbo.Data0028.PRICE_1'#13#10#9#9#9', dbo.Data0028.PRICE_2, dbo.Data0' +
      '028.PRICE_3'#13#10#9#9#9', dbo.Data0028.PRICE_4,dbo.Data0028.PRICE_5'#13#10#9#9#9 +
      ', dbo.Data0028.PRICE_6, dbo.Data0028.DISC_1'#13#10#9#9#9', dbo.Data0028.D' +
      'ISC_2, dbo.Data0028.DISC_3'#13#10#9#9#9', dbo.Data0028.DISC_4, dbo.Data00' +
      '28.DISC_5'#13#10#9#9#9', dbo.Data0028.DISC_6, dbo.Data0028.QUAN_VOL_5'#13#10#9#9 +
      #9', dbo.Data0028.QUAN_VOL_4, dbo.Data0028.QUAN_VOL_3'#13#10#9#9#9', dbo.Da' +
      'ta0028.QUAN_VOL_2,dbo.Data0028.QUAN_VOL_1'#13#10#9#9'                , d' +
      'bo.Data0023.CODE, dbo.Data0023.SUPPLIER_NAME'#13#10#9#9'                ' +
      ', CASE dbo.Data0028.AVL_FLAG WHEN '#39'Y'#39' THEN '#39#24050#35748#21487#39' WHEN '#39'N'#39' THEN '#39 +
      #26410#35748#21487#39' '#13#10'                                                         ' +
      ' WHEN '#39'T'#39' THEN '#39#26242#26102#35748#21487#39' END AS FLAG'#13#10#9#9'                , CASE dbo.' +
      'Data0028.AMT_QUAN_FLAG WHEN 1 THEN dbo.Data0028.MIN_ORDER_QTY '#13#10 +
      #9#9#9'          WHEN 2 THEN dbo.Data0028.MIN_ORDER_AMT END AS VALUE' +
      #13#10'                                                , dbo.Data0017' +
      '.PREF_SUPPLIER_PTR, dbo.Data0023.RKEY'#13#10'                         ' +
      '                       ,dbo.Data0028.AVL_FLAG, dbo.Data0028.PURC' +
      'HASE_UNIT_PTR'#13#10'                                                ,' +
      'dbo.Data0028.tax_flag,dbo.Data0028.CURRENCY_PTR'#13#10'               ' +
      '                                 ,dbo.Data0023.EDI_OUT_NEW_PO,db' +
      'o.Data0023.EDI_FLAG_FOR_PO'#13#10'                                    ' +
      '            ,dbo.data0028.prot_report_ptr'#13#10'FROM   dbo.Data0017 I' +
      'NNER JOIN'#13#10'                      dbo.Data0028 ON dbo.Data0017.RK' +
      'EY = dbo.Data0028.INVENTORY_PTR INNER JOIN'#13#10'                    ' +
      '  dbo.Data0023 ON dbo.Data0028.SUPPLIER_PTR = dbo.Data0023.RKEY ' +
      'INNER JOIN'#13#10'                      dbo.Data0001 ON dbo.Data0028.C' +
      'URRENCY_PTR = dbo.Data0001.RKEY INNER JOIN'#13#10'                    ' +
      '  dbo.Data0002 ON dbo.Data0028.PURCHASE_UNIT_PTR = dbo.Data0002.' +
      'RKEY'#13#10'WHERE (dbo.Data0023.status = 0)'
    Params = <>
    AfterScroll = cds23AfterScroll
    Left = 592
    Top = 408
  end
end
