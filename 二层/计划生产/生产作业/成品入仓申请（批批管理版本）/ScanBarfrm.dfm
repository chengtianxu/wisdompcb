object frmScanBar: TfrmScanBar
  Left = 336
  Top = 102
  Width = 988
  Height = 653
  Caption = #26465#30721#20837#20179
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 972
    Height = 41
    Align = alTop
    TabOrder = 0
    object lbl1: TLabel
      Left = 202
      Top = 10
      Width = 80
      Height = 16
      AutoSize = False
      Caption = #26465#24418#30721#65306
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edtbar: TEdit
      Left = 276
      Top = 8
      Width = 193
      Height = 21
      TabOrder = 0
      Text = '120981-1'
      OnKeyPress = edtbarKeyPress
    end
    object rg1: TRadioGroup
      Left = 1
      Top = 1
      Width = 185
      Height = 39
      Align = alLeft
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #25209#37327#20837#20179
        #21333#20010#20837#20179)
      TabOrder = 1
      OnClick = rg1Click
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 41
    Width = 972
    Height = 232
    Align = alTop
    TabOrder = 1
    object pgc1: TPageControl
      Left = 1
      Top = 1
      Width = 970
      Height = 230
      ActivePage = ts1
      Align = alClient
      TabOrder = 0
      object ts1: TTabSheet
        Caption = 'ts1'
        TabVisible = False
        object ehMutiPost: TDBGridEh
          Left = 0
          Top = 0
          Width = 962
          Height = 220
          Align = alClient
          DataSource = dsMutiBar
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          PopupMenu = pm1
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = ehMutiPostDblClick
          OnGetCellParams = ehMutiPostGetCellParams
          Columns = <
            item
              EditButtons = <>
              FieldName = 'barid'
              Footers = <>
              ReadOnly = True
              Title.Caption = #26465#30721'ID'
              Width = 70
            end
            item
              EditButtons = <>
              FieldName = 'postNote'
              Footers = <>
              ReadOnly = True
              Title.Caption = #25805#20316#29366#24577
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'MANU_PART_NUMBER'
              Footers = <>
              ReadOnly = True
              Title.Caption = #26412#21378#32534#21495
              Width = 80
            end
            item
              EditButtons = <>
              FieldName = 'MANU_PART_DESC'
              Footers = <>
              ReadOnly = True
              Title.Caption = #23458#25143#22411#21495
              Width = 80
            end
            item
              EditButtons = <>
              FieldName = 'Qty'
              Footers = <>
              ReadOnly = True
              Title.Caption = #25968#37327
              Width = 40
            end
            item
              EditButtons = <>
              FieldName = 'SALES_ORDER'
              Footers = <>
              ReadOnly = True
              Title.Caption = #38144#21806#35746#21333
              Width = 70
            end
            item
              EditButtons = <>
              FieldName = 'PO_NUMBER'
              Footers = <>
              ReadOnly = True
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'CUST_CODE'
              Footers = <>
              ReadOnly = True
              Title.Caption = #23458#25143#20195#30721
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'qty_ordered'
              Footers = <>
              ReadOnly = True
              Title.Caption = #35746#21333'+'#36864#36135
            end
            item
              EditButtons = <>
              FieldName = 'Rkey'
              Footers = <>
              ReadOnly = True
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'parts_margin'
              Footers = <>
              ReadOnly = True
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'REPUT_APPR_BY'
              Footers = <>
              ReadOnly = True
              Title.Caption = #24050#25552#20132#25968
            end
            item
              EditButtons = <>
              FieldName = 'cut_no'
              Footers = <>
              ReadOnly = True
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'HXRK'
              Footers = <>
              ReadOnly = True
              Title.Caption = #36824#38656#20837#24211
            end
            item
              EditButtons = <>
              FieldName = 'rkey60'
              Footers = <>
              ReadOnly = True
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'Pcsweight'
              Footers = <>
              Title.Caption = 'PCS'#37325#37327
            end>
        end
      end
      object ts2: TTabSheet
        Caption = 'ts2'
        ImageIndex = 1
        TabVisible = False
        object grp1: TGroupBox
          Left = 16
          Top = 8
          Width = 593
          Height = 89
          Caption = #26465#30721#20449#24687
          TabOrder = 0
          object lbl2: TLabel
            Left = 11
            Top = 26
            Width = 60
            Height = 13
            Caption = #26412#21378#32534#21495#65306
          end
          object lbl5: TLabel
            Left = 11
            Top = 51
            Width = 60
            Height = 13
            Caption = #26412#31665#25968#37327#65306
          end
          object lbl8: TLabel
            Left = 180
            Top = 52
            Width = 21
            Height = 13
            Caption = 'PCS'
          end
          object lbl6: TLabel
            Left = 211
            Top = 24
            Width = 60
            Height = 13
            Caption = #23458#25143#22411#21495#65306
          end
          object lbl7: TLabel
            Left = 395
            Top = 20
            Width = 72
            Height = 13
            Caption = #23458#25143#35746#21333#21495#65306
          end
          object lbl10: TLabel
            Left = 212
            Top = 52
            Width = 60
            Height = 13
            Caption = #37197#26009#21333#21495#65306
          end
          object lbl3: TLabel
            Left = 397
            Top = 49
            Width = 60
            Height = 13
            Caption = #23458#25143#20195#30721#65306
          end
          object edtBCBH: TDBEdit
            Left = 79
            Top = 22
            Width = 121
            Height = 21
            Color = clMoneyGreen
            DataField = 'MANU_PART_NUMBER'
            DataSource = dsbarinfo
            ReadOnly = True
            TabOrder = 0
          end
          object edtBXSL: TDBEdit
            Left = 80
            Top = 48
            Width = 97
            Height = 21
            Color = clMoneyGreen
            DataField = 'qty'
            DataSource = dsbarinfo
            ReadOnly = True
            TabOrder = 1
          end
          object edtKHXH: TDBEdit
            Left = 271
            Top = 19
            Width = 121
            Height = 21
            Color = clMoneyGreen
            DataField = 'MANU_PART_DESC'
            DataSource = dsbarinfo
            ReadOnly = True
            TabOrder = 2
          end
          object edtKHDDH: TDBEdit
            Left = 464
            Top = 16
            Width = 121
            Height = 21
            Color = clMoneyGreen
            DataField = 'PO_NUMBER'
            DataSource = dsbarinfo
            ReadOnly = True
            TabOrder = 3
          end
          object edtPLDH: TDBEdit
            Left = 272
            Top = 47
            Width = 121
            Height = 21
            Color = clMoneyGreen
            DataField = 'CUT_NO'
            DataSource = dsbarinfo
            ReadOnly = True
            TabOrder = 4
          end
          object edtKHDM: TDBEdit
            Left = 465
            Top = 43
            Width = 121
            Height = 21
            Color = clMoneyGreen
            DataField = 'CUST_CODE'
            DataSource = dsbarinfo
            ReadOnly = True
            TabOrder = 5
          end
        end
        object grp2: TGroupBox
          Left = 16
          Top = 112
          Width = 593
          Height = 105
          Caption = #35746#21333#20449#24687
          TabOrder = 1
          object lbl4: TLabel
            Left = 12
            Top = 30
            Width = 60
            Height = 13
            Caption = #38144#21806#35746#21333#65306
          end
          object lbl9: TLabel
            Left = 208
            Top = 30
            Width = 66
            Height = 13
            Caption = #35746#21333'+'#36864#36135#65306
          end
          object lbl11: TLabel
            Left = 11
            Top = 62
            Width = 60
            Height = 13
            Caption = #24050#25552#20132#25968#65306
          end
          object lbl12: TLabel
            Left = 210
            Top = 60
            Width = 60
            Height = 13
            Caption = #21253#35013#27424#25968#65306
          end
          object lbl13: TLabel
            Left = 418
            Top = 63
            Width = 60
            Height = 13
            Caption = #26412#27425#20837#24211#65306
          end
          object lbl15: TLabel
            Left = 409
            Top = 29
            Width = 69
            Height = 13
            Caption = #21333'PCS'#37325#37327#65306
          end
          object edtXSSD: TDBEdit
            Left = 83
            Top = 26
            Width = 121
            Height = 21
            Color = clMoneyGreen
            DataField = 'SALES_ORDER'
            DataSource = dsbarinfo
            ReadOnly = True
            TabOrder = 0
          end
          object edtDDZS: TDBEdit
            Left = 279
            Top = 26
            Width = 121
            Height = 21
            Color = clMoneyGreen
            DataField = 'qty_ordered'
            DataSource = dsbarinfo
            ReadOnly = True
            TabOrder = 1
          end
          object edtrkdsh: TDBEdit
            Left = 83
            Top = 57
            Width = 121
            Height = 21
            Color = clMoneyGreen
            DataField = 'REPUT_APPR_BY'
            DataSource = dsbarinfo
            ReadOnly = True
            TabOrder = 2
          end
          object edtHXRK: TDBEdit
            Left = 279
            Top = 57
            Width = 121
            Height = 21
            Color = clMoneyGreen
            DataField = 'HXRK'
            DataSource = dsbarinfo
            ReadOnly = True
            TabOrder = 3
          end
          object edtbcrk: TDBEdit
            Left = 480
            Top = 57
            Width = 65
            Height = 21
            Color = clMoneyGreen
            DataField = 'Qty'
            DataSource = dsbarinfo
            ReadOnly = True
            TabOrder = 4
          end
          object edtPcsWeight: TEdit
            Left = 484
            Top = 24
            Width = 59
            Height = 21
            TabOrder = 5
            OnExit = edtPcsWeightExit
            OnKeyPress = edtPcsWeightKeyPress
          end
        end
      end
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 273
    Width = 972
    Height = 301
    Align = alClient
    TabOrder = 2
    object lbl14: TLabel
      Left = 12
      Top = 275
      Width = 93
      Height = 13
      Caption = #22791#27880'('#26368#22810'20'#23383#31526'):'
    end
    object ehWOInfo: TDBGridEh
      Left = 8
      Top = 8
      Width = 617
      Height = 257
      DataSource = dsWOInfo
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      FooterRowCount = 1
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      UseMultiTitle = True
      Columns = <
        item
          EditButtons = <>
          FieldName = 'selected'
          Footers = <>
          ReadOnly = True
          Title.Caption = #36873
        end
        item
          Color = clMoneyGreen
          EditButtons = <>
          FieldName = 'work_order_number'
          Footers = <>
          ReadOnly = True
          Title.Caption = #20316#19994#21333
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'dept_name'
          Footers = <>
          ReadOnly = True
          Title.Caption = #24037#24207
          Width = 50
        end
        item
          Color = clMoneyGreen
          EditButtons = <>
          FieldName = 'QTY_BACKLOG'
          Footer.ValueType = fvtSum
          Footers = <>
          ReadOnly = True
          Title.Caption = #22312#32447'|PCS'
          Width = 40
        end
        item
          EditButtons = <>
          FieldName = 'PANELS'
          Footers = <>
          ReadOnly = True
          Title.Caption = #22312#32447'|PNL'
          Width = 40
        end
        item
          Color = clMoneyGreen
          EditButtons = <>
          FieldName = 'TO_BE_STOCKED'
          Footer.ValueType = fvtSum
          Footers = <>
          ReadOnly = True
          Title.Caption = #20837#24211#24453#23457'|PCS'
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'TO_BE_CANCD'
          Footers = <>
          ReadOnly = True
          Title.Caption = #20837#24211#24453#23457'|PNL'
          Width = 50
        end
        item
          Color = clMoneyGreen
          EditButtons = <>
          FieldName = 'canstockpcs'
          Footers = <>
          Title.Caption = #21487#25552#20132'|PCS'
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'canstockpnl'
          Footers = <>
          Title.Caption = #21487#25552#20132'|PNL'
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'UNIT_PTR'
          Footers = <>
          ReadOnly = True
          Visible = False
        end
        item
          Color = clMoneyGreen
          EditButtons = <>
          FieldName = 'postPcs'
          Footer.ValueType = fvtSum
          Footers = <>
          ReadOnly = True
          Title.Caption = #26412#27425#25552#20132'|PCS'
          Width = 50
        end
        item
          EditButtons = <>
          FieldName = 'Postpnl'
          Footers = <>
          Title.Caption = #26412#27425#25552#20132'|PNL'
          Width = 50
        end>
    end
    object edtBZ: TEdit
      Left = 120
      Top = 271
      Width = 433
      Height = 21
      MaxLength = 20
      TabOrder = 1
    end
  end
  object pnl4: TPanel
    Left = 0
    Top = 574
    Width = 972
    Height = 41
    Align = alBottom
    TabOrder = 3
    object btnOK: TButton
      Left = 272
      Top = 8
      Width = 75
      Height = 25
      Caption = #25552#20132
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnClose: TButton
      Left = 495
      Top = 8
      Width = 75
      Height = 25
      Caption = #20851#38381
      TabOrder = 1
      OnClick = btnCloseClick
    end
  end
  object qryNow56: TADOQuery
    Parameters = <
      item
        Name = 'P1'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select  d06.work_order_number, d34.dept_name, d56.QTY_BACKLOG,d5' +
        '6.UNIT_PTR,d492.SO_NO,'
      
        'D56.PANELS, d56.TO_BE_STOCKED,d56.TO_BE_CANCD, (d56.qty_backlog ' +
        '- d56.TO_BE_STOCKED) as canstockpcs,'
      '(D56.PANELS - d56.TO_BE_CANCD) as canstockpnl'
      'from data0056 d56'
      'inner join data0006 d06 on d56.wo_ptr = d06.rkey'
      'inner join data0034 d34 on d56.DEPT_PTR = d34.rkey'
      'inner join data0025 d25 on d25.rkey = d06.bom_ptr'
      'inner join data0492 d492 on d492.CUT_NO = d06.CUT_NO'
      
        'where (D25.PARENT_PTR IS NULL) AND (d56.QTY_BACKLOG > 0) AND (d0' +
        '6.PROD_STATUS = 5) AND (d06.WIPMAT_STATUS = 1)'
      ' and D06.rkey = :P1'
      'order by d06.work_order_number asc')
    Left = 560
    Top = 153
  end
  object adsbarInfo: TADODataSet
    CursorType = ctStatic
    CommandText = 
      'declare @barid varchar(30), @postNote varchar(200), @postSucc bi' +
      't,@pcsWeight float'#13#10'set @barid = '#39#39#13#10'set @postNote = '#39#39#13#10'set @po' +
      'stSucc = 0'#13#10'SELECT @postSucc as postSucc, @barid as barid, @post' +
      'Note as postNote,d699.MANU_PART_NUMBER,d699.MANU_PART_DESC,D699.' +
      'Qty,'#13#10'd60.SALES_ORDER, D97.PO_NUMBER,D10.CUST_CODE,d60.rkey as r' +
      'key60,'#13#10'isnull(D60.PARTS_ORDERED,0) + isnull(D60.PARTS_RETURNED,' +
      '0) AS qty_ordered,D60.Rkey,'#13#10'isnull(D60.PARTS_ORDERED,0) + isnul' +
      'l(D60.PARTS_RETURNED,0) - isnull(D60.REPUT_APPR_BY,0) AS HXRK,'#13#10 +
      'ISNULL(D60.REPUT_APPR_BY, 0) AS REPUT_APPR_BY,'#13#10'd492.cut_no,d25.' +
      'report_unit_value1,d25.rkey as rkey25,@pcsWeight as Pcsweight'#13#10'f' +
      'rom data0699 d699 inner join data0698 d698 on d699.pack_ptr = d6' +
      '98.rkey'#13#10'inner join data0060 d60 on d60.rkey = d698.so_ptr'#13#10'inne' +
      'r join data0097 d97 on D60.PURCHASE_ORDER_PTR = D97.RKEY'#13#10'inner ' +
      'join data0010 d10 on d10.rkey = d60.CUSTOMER_PTR'#13#10'inner join dat' +
      'a0025 d25 on d25.manu_part_number = d699.manu_part_number'#13#10'inner' +
      ' join data0492 d492 on d492.BOM_PTR = d25.rkey'#13#10'WHERE pack_ptr =' +
      ':P1 AND order_no = :p2'#13#10'and d698.type = '#39#22806#31665#39' and d60.so_tp <> 1'
    Parameters = <
      item
        Name = 'P1'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'p2'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end>
    Left = 560
    Top = 89
    object adsbarInfoMANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object adsbarInfoMANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object adsbarInfoQty: TIntegerField
      FieldName = 'Qty'
    end
    object adsbarInfoSALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object adsbarInfoPO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object adsbarInfoCUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object adsbarInfoqty_ordered: TFloatField
      FieldName = 'qty_ordered'
    end
    object adsbarInfoRkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object adsbarInfoREPUT_APPR_BY: TIntegerField
      FieldName = 'REPUT_APPR_BY'
    end
    object adsbarInfocut_no: TStringField
      FieldName = 'cut_no'
      FixedChar = True
      Size = 12
    end
    object adsbarInforkey60: TAutoIncField
      FieldName = 'rkey60'
      ReadOnly = True
    end
    object adsbarInfobarid: TStringField
      FieldName = 'barid'
      Size = 30
    end
    object adsbarInfopostNote: TStringField
      FieldName = 'postNote'
      Size = 200
    end
    object adsbarInfopostSucc: TBooleanField
      FieldName = 'postSucc'
    end
    object adsbarInfoHXRK: TFloatField
      FieldName = 'HXRK'
    end
    object adsbarInforeport_unit_value1: TBCDField
      FieldName = 'report_unit_value1'
      Precision = 9
    end
    object adsbarInforkey25: TAutoIncField
      FieldName = 'rkey25'
      ReadOnly = True
    end
    object fltfldInfoPcsweight: TFloatField
      FieldName = 'Pcsweight'
    end
  end
  object dsbarinfo: TDataSource
    DataSet = adsbarInfo
    Left = 592
    Top = 89
  end
  object adsWOInfo: TADODataSet
    CursorType = ctStatic
    OnCalcFields = adsWOInfoCalcFields
    CommandText = 
      'declare @selected bit, @postPCS int, @postPNL int'#13#10'set @postPCS ' +
      '= 0 set @postPNL = 0'#13#10'select @selected as selected,@postPCS as p' +
      'ostPcs,@postPnl as Postpnl, d06.work_order_number, d34.dept_name' +
      ', d56.QTY_BACKLOG,d56.UNIT_PTR,d60.sales_order,'#13#10'D56.PANELS, d56' +
      '.TO_BE_STOCKED,d56.TO_BE_CANCD, d06.rkey as rkey06,d56.rkey as r' +
      'key56'#13#10'from data0056 d56'#13#10'inner join data0006 d06 on d56.wo_ptr ' +
      '= d06.rkey'#13#10'inner join data0034 d34 on d56.DEPT_PTR = d34.rkey'#13#10 +
      'inner join data0025 d25 on d25.rkey = d06.bom_ptr'#13#10'inner join da' +
      'ta0060 d60 on d25.rkey = d60.CUST_PART_PTR'#13#10'where d25.manu_part_' +
      'number = :p1 and'#13#10'd60.sales_order = :p2 and'#13#10'(D25.PARENT_PTR IS ' +
      'NULL) AND (d56.QTY_BACKLOG > 0) AND (d06.PROD_STATUS = 5) AND (d' +
      '06.WIPMAT_STATUS = 1)'#13#10'/*and (d56.TO_BE_STOCKED <= 0)*/'#13#10'order b' +
      'y d06.work_order_number asc'
    Parameters = <
      item
        Name = 'p1'
        Size = -1
        Value = Null
      end
      item
        Name = 'p2'
        Size = -1
        Value = Null
      end>
    Left = 560
    Top = 121
    object adsWOInfoselected: TBooleanField
      FieldName = 'selected'
    end
    object adsWOInfowork_order_number: TStringField
      FieldName = 'work_order_number'
      Size = 22
    end
    object adsWOInfodept_name: TStringField
      FieldName = 'dept_name'
      Size = 30
    end
    object adsWOInfoQTY_BACKLOG: TFloatField
      FieldName = 'QTY_BACKLOG'
    end
    object adsWOInfoPANELS: TIntegerField
      FieldName = 'PANELS'
    end
    object adsWOInfoTO_BE_STOCKED: TFloatField
      FieldName = 'TO_BE_STOCKED'
    end
    object adsWOInfoTO_BE_CANCD: TIntegerField
      FieldName = 'TO_BE_CANCD'
    end
    object adsWOInfoUNIT_PTR: TIntegerField
      FieldName = 'UNIT_PTR'
    end
    object adsWOInfopostPcs: TIntegerField
      FieldName = 'postPcs'
    end
    object adsWOInfoPostpnl: TIntegerField
      FieldName = 'Postpnl'
    end
    object adsWOInfoSO_NO: TStringField
      FieldName = 'sales_order'
      FixedChar = True
      Size = 12
    end
    object adsWOInforkey06: TAutoIncField
      FieldName = 'rkey06'
      ReadOnly = True
    end
    object adsWOInforkey56: TAutoIncField
      FieldName = 'rkey56'
      ReadOnly = True
    end
    object adsWOInfocanstockpcs: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'canstockpcs'
      Calculated = True
    end
    object adsWOInfocanstockpnl: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'canstockpnl'
      Calculated = True
    end
  end
  object dsWOInfo: TDataSource
    DataSet = cdsWOinfo
    Left = 592
    Top = 121
  end
  object dspWOInfo: TDataSetProvider
    DataSet = adsWOInfo
    Left = 528
    Top = 121
  end
  object cdsWOinfo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 496
    Top = 121
    object cdsWOinfowork_order_number: TStringField
      FieldName = 'work_order_number'
      Size = 22
    end
    object cdsWOinfodept_name: TStringField
      FieldName = 'dept_name'
      Size = 30
    end
    object cdsWOinfoQTY_BACKLOG: TFloatField
      FieldName = 'QTY_BACKLOG'
    end
    object cdsWOinfoPANELS: TIntegerField
      FieldName = 'PANELS'
    end
    object cdsWOinfoTO_BE_STOCKED: TFloatField
      FieldName = 'TO_BE_STOCKED'
    end
    object cdsWOinfoTO_BE_CANCD: TIntegerField
      FieldName = 'TO_BE_CANCD'
    end
    object cdsWOinfoUNIT_PTR: TIntegerField
      FieldName = 'UNIT_PTR'
    end
    object cdsWOinfoselected: TBooleanField
      FieldName = 'selected'
    end
    object cdsWOinfopostPcs: TIntegerField
      FieldName = 'postPcs'
    end
    object cdsWOinfoPostpnl: TIntegerField
      FieldName = 'Postpnl'
    end
    object cdsWOinforkey06: TAutoIncField
      FieldName = 'rkey06'
      ReadOnly = True
    end
    object cdsWOinforkey56: TAutoIncField
      FieldName = 'rkey56'
      ReadOnly = True
    end
    object cdsWOinfocanstockpcs: TIntegerField
      FieldName = 'canstockpcs'
      ReadOnly = True
    end
    object cdsWOinfocanstockpnl: TIntegerField
      FieldName = 'canstockpnl'
      ReadOnly = True
    end
    object strngfldWOinfosales_order: TStringField
      FieldName = 'sales_order'
      FixedChar = True
      Size = 12
    end
  end
  object dspMutiBar: TDataSetProvider
    DataSet = adsbarInfo
    Left = 533
    Top = 216
  end
  object cdsMutiBar: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 477
    Top = 216
    object cdsMutiBarMANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object cdsMutiBarMANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object cdsMutiBarQty: TIntegerField
      FieldName = 'Qty'
    end
    object cdsMutiBarSALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object cdsMutiBarPO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object cdsMutiBarCUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object cdsMutiBarqty_ordered: TFloatField
      FieldName = 'qty_ordered'
    end
    object cdsMutiBarRkey: TAutoIncField
      FieldName = 'Rkey'
    end
    object cdsMutiBarREPUT_APPR_BY: TIntegerField
      FieldName = 'REPUT_APPR_BY'
    end
    object cdsMutiBarcut_no: TStringField
      FieldName = 'cut_no'
      FixedChar = True
      Size = 12
    end
    object cdsMutiBarrkey60: TAutoIncField
      FieldName = 'rkey60'
    end
    object cdsMutiBarbarid: TStringField
      FieldName = 'barid'
      Size = 30
    end
    object cdsMutiBarpostNote: TStringField
      FieldName = 'postNote'
      Size = 200
    end
    object cdsMutiBarpostSucc: TBooleanField
      FieldName = 'postSucc'
    end
    object cdsMutiBarHXRK: TFloatField
      FieldName = 'HXRK'
    end
    object cdsMutiBarreport_unit_value1: TBCDField
      FieldName = 'report_unit_value1'
      Precision = 9
    end
    object cdsMutiBarrkey25: TAutoIncField
      FieldName = 'rkey25'
      ReadOnly = True
    end
    object fltfldMutiBarPcsweight: TFloatField
      FieldName = 'Pcsweight'
    end
  end
  object dsMutiBar: TDataSource
    DataSet = cdsMutiBar
    Left = 565
    Top = 216
  end
  object qrytmp: TADOQuery
    Parameters = <>
    Left = 61
    Top = 200
  end
  object pm1: TPopupMenu
    Left = 61
    Top = 104
    object mniN2: TMenuItem
      Caption = #35299#26512#27492#26465
      OnClick = mniN2Click
    end
    object N1: TMenuItem
      Caption = #28165#31354
      OnClick = N1Click
    end
  end
end
