object EditForm1: TEditForm1
  Left = 750
  Top = 158
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #32534#36753
  ClientHeight = 500
  ClientWidth = 606
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label36: TLabel
    Left = 3
    Top = 472
    Width = 562
    Height = 19
    Caption = #25552#31034':'#25552#20132#20837#25104#21697#20179','#35831#19968#23450#36873#25321#38144#21806#35746#21333#21495','#21452#20987#38144#21806#35746#21333#21495#21487#21462#28040
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object btnOK: TBitBtn
    Left = 513
    Top = 429
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 1
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
  object btnCancel: TBitBtn
    Left = 511
    Top = 316
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 2
    OnClick = btnCancelClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object GroupBox1: TGroupBox
    Left = 3
    Top = 4
    Width = 500
    Height = 92
    Caption = #24403#21069#22312#32447#20449#24687
    Enabled = False
    TabOrder = 3
    object Label1: TLabel
      Left = 64
      Top = 18
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = #20316#19994#21333#21495':'
    end
    object Label6: TLabel
      Left = 43
      Top = 42
      Width = 80
      Height = 13
      Alignment = taRightJustify
      Caption = #24050#25552#20132#25968'pcs:'
    end
    object Label5: TLabel
      Left = 290
      Top = 43
      Width = 94
      Height = 13
      Alignment = taRightJustify
      Caption = #24050#25552#20132#25968'panel:'
    end
    object Label10: TLabel
      Left = 4
      Top = 67
      Width = 119
      Height = 13
      Alignment = taRightJustify
      Caption = #24403#21069#22312#32447#26377#25928#25968'pcs:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 251
      Top = 68
      Width = 133
      Height = 13
      Alignment = taRightJustify
      Caption = #24403#21069#22312#32447#26377#25928#25968'panel:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 328
      Top = 17
      Width = 62
      Height = 13
      Alignment = taRightJustify
      Caption = 'PCS/PNL'#65306
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object edtWORK_ORDER_NUMBER: TDBEdit
      Left = 129
      Top = 14
      Width = 144
      Height = 21
      Color = cl3DLight
      DataField = 'WORK_ORDER_NUMBER'
      DataSource = ds1
      ReadOnly = True
      TabOrder = 0
    end
    object edtCanUsePCS: TDBEdit
      Left = 129
      Top = 63
      Width = 73
      Height = 21
      Color = cl3DLight
      DataField = 'CanUsePCS'
      DataSource = ds1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object edtTO_BE_STOCKED: TDBEdit
      Left = 129
      Top = 38
      Width = 73
      Height = 21
      Color = cl3DLight
      DataField = 'TO_BE_STOCKED'
      DataSource = ds1
      ReadOnly = True
      TabOrder = 2
    end
    object edtCanUsePNL: TDBEdit
      Left = 387
      Top = 64
      Width = 73
      Height = 21
      Color = cl3DLight
      DataField = 'CanUsePNL'
      DataSource = ds1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object edtTO_BE_CA: TDBEdit
      Left = 387
      Top = 39
      Width = 73
      Height = 21
      Color = cl3DLight
      DataField = 'TO_BE_CANCD'
      DataSource = ds1
      ReadOnly = True
      TabOrder = 4
    end
    object edtPARTS_PER_PANEL: TDBEdit
      Left = 387
      Top = 14
      Width = 73
      Height = 21
      Color = cl3DLight
      DataField = 'PARTS_PER_PANEL'
      DataSource = ds1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
  end
  object GroupBox2: TGroupBox
    Left = 3
    Top = 349
    Width = 500
    Height = 112
    Caption = #25552#20132
    TabOrder = 0
    object Label3: TLabel
      Left = 5
      Top = 60
      Width = 80
      Height = 13
      Alignment = taRightJustify
      Caption = #25552#20132#20837#20179'pcs:'
    end
    object Label7: TLabel
      Left = 153
      Top = 60
      Width = 94
      Height = 13
      Alignment = taRightJustify
      Caption = #25552#20132#20837#20179'panel:'
    end
    object Label2: TLabel
      Left = 6
      Top = 89
      Width = 119
      Height = 13
      Caption = #22791#27880'('#26368#22810'20'#23383#31526')'#65306
    end
    object Label15: TLabel
      Left = 9
      Top = 17
      Width = 72
      Height = 13
      Alignment = taRightJustify
      Caption = #38144#21806#35746#21333#21495':'
    end
    object SpeedButton1: TSpeedButton
      Left = 236
      Top = 12
      Width = 25
      Height = 22
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        04000000000078000000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888800000888880000080F000888880F00080F000888880F0008000000080000
        000800F000000F00000800F000800F00000800F000800F000008800000000000
        0088880F00080F000888880000080000088888800088800088888880F08880F0
        888888800088800088888888888888888888}
      OnClick = SpeedButton1Click
    end
    object Label27: TLabel
      Left = 4
      Top = 39
      Width = 85
      Height = 13
      Alignment = taRightJustify
      Caption = #35746#21333#21152#36864#36135#25968':'
    end
    object Label28: TLabel
      Left = 153
      Top = 39
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = #27424#36135#25968':'
    end
    object Label29: TLabel
      Left = 266
      Top = 39
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = #24050#25552#20132#25968':'
    end
    object Label30: TLabel
      Left = 390
      Top = 39
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = #24211#23384#25968':'
    end
    object Label31: TLabel
      Left = 93
      Top = 39
      Width = 21
      Height = 13
      Caption = '   '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label32: TLabel
      Left = 203
      Top = 39
      Width = 28
      Height = 13
      Caption = '    '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label33: TLabel
      Left = 329
      Top = 39
      Width = 21
      Height = 13
      Caption = '   '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label34: TLabel
      Left = 442
      Top = 39
      Width = 14
      Height = 13
      Caption = 'L4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label35: TLabel
      Left = 277
      Top = 16
      Width = 72
      Height = 13
      Caption = #23458#25143#35746#21333#21495':'
    end
    object lbl1: TLabel
      Left = 328
      Top = 61
      Width = 60
      Height = 13
      Caption = #21333'pcs'#37325#65306
    end
    object lbl2: TLabel
      Left = 459
      Top = 59
      Width = 13
      Height = 13
      Caption = #20811
    end
    object Edit1: TEdit
      Left = 94
      Top = 57
      Width = 54
      Height = 21
      TabOrder = 0
      OnExit = Edit1Exit
      OnKeyPress = Edit1KeyPress
    end
    object Edit7: TEdit
      Left = 249
      Top = 57
      Width = 67
      Height = 21
      Color = clScrollBar
      Enabled = False
      ReadOnly = True
      TabOrder = 1
      Text = '0'
      OnKeyPress = Edit1KeyPress
    end
    object Edit14: TEdit
      Left = 354
      Top = 12
      Width = 137
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 2
    end
    object Edit17: TEdit
      Left = 88
      Top = 13
      Width = 139
      Height = 21
      Hint = #21452#20987#21487#21462#28040#38144#21806#35746#21333#21495
      Color = cl3DLight
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 3
      OnDblClick = Edit17DblClick
    end
    object edtWeight: TEdit
      Left = 392
      Top = 56
      Width = 57
      Height = 21
      TabOrder = 4
      OnExit = edtWeightExit
      OnKeyPress = edtWeightKeyPress
    end
    object edtBZ: TEdit
      Left = 128
      Top = 84
      Width = 353
      Height = 21
      MaxLength = 40
      TabOrder = 5
    end
  end
  object GroupBox3: TGroupBox
    Left = 3
    Top = 190
    Width = 500
    Height = 158
    Caption = #35746#21333#12289#24211#23384#20449#24687
    TabOrder = 4
    object Label4: TLabel
      Left = 8
      Top = 30
      Width = 73
      Height = 13
      Caption = #35746#21333#24635#25968'pcs'
    end
    object Label8: TLabel
      Left = 8
      Top = 62
      Width = 73
      Height = 13
      Caption = #35746#21333#27424#25968'pcs'
    end
    object Label9: TLabel
      Left = 8
      Top = 91
      Width = 73
      Height = 13
      Caption = #20837#24211#24453#23457'pcs'
    end
    object Label13: TLabel
      Left = 8
      Top = 122
      Width = 73
      Height = 13
      Caption = #24403#21069#24211#23384'pcs'
    end
    object edt9: TEdit
      Left = 84
      Top = 27
      Width = 89
      Height = 21
      Color = cl3DLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Text = '0'
    end
    object edt10: TEdit
      Left = 84
      Top = 57
      Width = 89
      Height = 21
      Color = cl3DLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Text = '0'
    end
    object Edit11: TEdit
      Left = 84
      Top = 86
      Width = 89
      Height = 21
      Color = cl3DLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      Text = '0'
    end
    object DBGridEh1: TDBGridEh
      Left = 176
      Top = 15
      Width = 322
      Height = 141
      Align = alRight
      DataSource = ds2
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      ReadOnly = True
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'CODE'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #20179#24211#20195#30721
          Width = 61
        end
        item
          EditButtons = <>
          FieldName = 'LOCATION'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #20179#24211#21517#31216
          Width = 84
        end
        item
          EditButtons = <>
          FieldName = 'qTY'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #24211#23384#25968
          Width = 78
        end
        item
          EditButtons = <>
          FieldName = 'WAREHOUSE_code'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #24037#21378
          Width = 45
        end>
    end
    object Edit13: TEdit
      Left = 84
      Top = 117
      Width = 89
      Height = 21
      Color = cl3DLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      Text = '0'
    end
  end
  object GroupBox4: TGroupBox
    Left = 4
    Top = 98
    Width = 499
    Height = 91
    Caption = #25237#20135#20449#24687
    TabOrder = 5
    object Label14: TLabel
      Left = 65
      Top = 18
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = #37197#26009#21333#21495':'
    end
    object Label16: TLabel
      Left = 21
      Top = 48
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = #25237#20135#25968
    end
    object Label17: TLabel
      Left = 117
      Top = 48
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = #22312#32447#25968
    end
    object Label18: TLabel
      Left = 197
      Top = 48
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = #20837#24211#25968
    end
    object Label19: TLabel
      Left = 400
      Top = 48
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #24453#21457#25918#25968
    end
    object Label20: TLabel
      Left = 293
      Top = 48
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = #25253#24223#25968
    end
    object Label21: TLabel
      Left = 22
      Top = 69
      Width = 39
      Height = 13
      Caption = #25237#20135#25968
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label22: TLabel
      Left = 118
      Top = 69
      Width = 39
      Height = 13
      Caption = #22312#32447#25968
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label23: TLabel
      Left = 198
      Top = 69
      Width = 39
      Height = 13
      Caption = #20837#24211#25968
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label24: TLabel
      Left = 401
      Top = 69
      Width = 52
      Height = 13
      Caption = #24453#21457#25918#25968
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label25: TLabel
      Left = 294
      Top = 69
      Width = 39
      Height = 13
      Caption = #25253#24223#25968
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label26: TLabel
      Left = 273
      Top = 18
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = #24453#35745#21010#25968':'
    end
    object edtcut_no: TDBEdit
      Left = 128
      Top = 16
      Width = 110
      Height = 21
      Color = cl3DLight
      DataField = 'cut_no'
      DataSource = ds1
      ReadOnly = True
      TabOrder = 0
    end
    object edtORD_REQ_QTY: TDBEdit
      Left = 336
      Top = 16
      Width = 110
      Height = 21
      Color = cl3DLight
      DataField = 'ORD_REQ_QTY'
      DataSource = ds1
      ReadOnly = True
      TabOrder = 1
    end
  end
  object ads1: TADODataSet
    Connection = dm1.con1
    CommandText = 
      'select d06.work_order_number,d25.manu_part_number,d25.manu_part_' +
      'desc,d25.report_unit_value1,'#13#10'd56.STEP,d34.DEPT_NAME,d56.INTIME,' +
      'd56.QTY_BACKLOG - d06.QUAN_ALLREJ AS CanUsePCS,'#13#10'd56.TO_BE_STOCK' +
      'ED,d60.SALES_ORDER,CASE WHEN d60.customer_ptr IS NOT NULL THEN d' +
      '10_1.cust_code ELSE d10.cust_code END AS cust_code,'#13#10'd97.PO_NUMB' +
      'ER,d60.PARTS_ORDERED + d60.PARTS_RETURNED - d60.PARTS_SHIPPED - ' +
      'd60.RETURNED_SHIP AS NeedPcs,'#13#10'd56.panels-d06.QUAN_ALLPNL as Can' +
      'UsePNL,d56.QTY_BACKLOG * d25.unit_sq AS OnlineSQ,d56.TO_BE_CANCD' +
      ',d15.ABBR_NAME,'#13#10'd56.REFERENCE,d06.rkey as rkey06,d06.PARTS_PER_' +
      'PANEL,d492.cut_no,d492.ORD_REQ_QTY,d492.issued_qty,d492.WIP_QTY,' +
      'd492.FG_QTY,'#13#10'd492.waitfor_release,d492.QTY_reject'#13#10'from data005' +
      '6 d56 '#13#10'inner join Data0006 d06 ON d56.WO_PTR = d06.RKEY '#13#10'INNER' +
      ' JOIN Data0034 d34 ON d56.DEPT_PTR = d34.RKEY '#13#10'INNER JOIN Data0' +
      '025 d25 ON d06.BOM_PTR = d25.RKEY '#13#10'INNER JOIN Data0015 d15 ON d' +
      '56.LOC_PTR = d15.RKEY '#13#10'INNER JOIN Data0010 d10 ON d25.CUSTOMER_' +
      'PTR = d10.RKEY '#13#10'INNER JOIN data0492 d492 ON d06.CUT_NO = d492.C' +
      'UT_NO '#13#10'LEFT JOIN Data0060 d60 ON d492.SO_NO = d60.SALES_ORDER '#13 +
      #10'LEFT  JOIN Data0097 d97 ON d97.RKEY = d60.PURCHASE_ORDER_PTR'#13#10'L' +
      'EFT  JOIN Data0010 d10_1 ON d60.CUSTOMER_PTR = d10_1.RKEY'#13#10'WHERE' +
      ' (d25.PARENT_PTR IS NULL) AND (d56.QTY_BACKLOG > 0) AND (d06.PRO' +
      'D_STATUS = 5) AND (d06.WIPMAT_STATUS = 1)'#13#10'and d06.rkey = :P1'
    Parameters = <
      item
        Name = 'P1'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 520
    Top = 16
    object ads1work_order_number: TStringField
      FieldName = 'work_order_number'
      Size = 22
    end
    object ads1manu_part_number: TStringField
      FieldName = 'manu_part_number'
    end
    object ads1manu_part_desc: TStringField
      FieldName = 'manu_part_desc'
      Size = 80
    end
    object ads1report_unit_value1: TBCDField
      FieldName = 'report_unit_value1'
      Precision = 9
    end
    object ads1STEP: TSmallintField
      FieldName = 'STEP'
    end
    object ads1DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ads1INTIME: TDateTimeField
      FieldName = 'INTIME'
    end
    object ads1CanUsePCS: TFloatField
      FieldName = 'CanUsePCS'
      ReadOnly = True
    end
    object ads1TO_BE_STOCKED: TFloatField
      FieldName = 'TO_BE_STOCKED'
    end
    object ads1SALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ads1cust_code: TStringField
      FieldName = 'cust_code'
      ReadOnly = True
      Size = 10
    end
    object ads1PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 32
    end
    object ads1NeedPcs: TFloatField
      FieldName = 'NeedPcs'
      ReadOnly = True
    end
    object ads1CanUsePNL: TIntegerField
      FieldName = 'CanUsePNL'
      ReadOnly = True
    end
    object ads1OnlineSQ: TFloatField
      FieldName = 'OnlineSQ'
      ReadOnly = True
    end
    object ads1TO_BE_CANCD: TIntegerField
      FieldName = 'TO_BE_CANCD'
    end
    object ads1ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ads1REFERENCE: TStringField
      FieldName = 'REFERENCE'
    end
    object ads1rkey06: TAutoIncField
      FieldName = 'rkey06'
      ReadOnly = True
    end
    object ads1PARTS_PER_PANEL: TFloatField
      FieldName = 'PARTS_PER_PANEL'
    end
    object ads1cut_no: TStringField
      FieldName = 'cut_no'
      FixedChar = True
      Size = 12
    end
    object ads1ORD_REQ_QTY: TIntegerField
      FieldName = 'ORD_REQ_QTY'
    end
    object ads1issued_qty: TIntegerField
      FieldName = 'issued_qty'
    end
    object ads1WIP_QTY: TIntegerField
      FieldName = 'WIP_QTY'
    end
    object ads1FG_QTY: TIntegerField
      FieldName = 'FG_QTY'
    end
    object ads1waitfor_release: TIntegerField
      FieldName = 'waitfor_release'
    end
    object ads1QTY_reject: TIntegerField
      FieldName = 'QTY_reject'
    end
  end
  object ads2: TADODataSet
    Connection = dm1.con1
    CommandText = 
      'SELECT d16.CODE, d16.LOCATION,d15.WAREHOUSE_code,'#13#10'SUM(d53.QTY_O' +
      'N_HAND-d53.QTY_ALLOC) qTY '#13#10'FROM Data0025 d25 INNER JOIN '#13#10'data0' +
      '053 d53 ON d25.RKEY = d53.CUST_PART_PTR INNER JOIN'#13#10'data0016 d16' +
      ' ON d53.LOC_PTR = d16.RKEY INNER JOIN'#13#10'data0015 d15 ON d53.WHSE_' +
      'PTR = d15.RKEY '#13#10'where (d25.MANU_PART_NUMBER LIKE :P1) '#13#10'Group B' +
      'Y d16.CODE, d16.LOCATION,d15.WAREHOUSE_code'
    Parameters = <
      item
        Name = 'P1'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end>
    Left = 520
    Top = 56
    object ads2CODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object ads2LOCATION: TStringField
      FieldName = 'LOCATION'
    end
    object ads2WAREHOUSE_code: TStringField
      FieldName = 'WAREHOUSE_code'
      Size = 5
    end
    object ads2qTY: TFloatField
      FieldName = 'qTY'
      ReadOnly = True
    end
  end
  object ds1: TDataSource
    DataSet = ads1
    Left = 560
    Top = 16
  end
  object ds2: TDataSource
    DataSet = ads2
    Left = 560
    Top = 56
  end
end
