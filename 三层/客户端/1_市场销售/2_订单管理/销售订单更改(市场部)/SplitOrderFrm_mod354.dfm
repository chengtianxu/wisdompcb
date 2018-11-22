inherited frmSplitOrder_mod354: TfrmSplitOrder_mod354
  Caption = #35746#21333#25286#20998
  ClientHeight = 455
  ClientWidth = 654
  Font.Height = -13
  Font.Name = #23435#20307
  OnClose = FormClose
  ExplicitWidth = 670
  ExplicitHeight = 494
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 654
    Height = 455
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 654
    ExplicitHeight = 455
    inherited pnl1: TPanel
      Width = 652
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 652
      inherited btnSave: TBitBtn
        OnClick = btnSaveClick
      end
      inherited btnSaveAll: TBitBtn
        Left = 561
        Align = alRight
        ExplicitLeft = 561
      end
      inherited btnCheck: TBitBtn
        Left = 591
        Align = alRight
        ExplicitLeft = 591
      end
      inherited btnPrint: TBitBtn
        Left = 621
        Align = alRight
        ExplicitLeft = 621
      end
      inherited btnClose: TBitBtn
        OnClick = btnCloseClick
      end
    end
    inherited pnl2: TPanel
      Width = 652
      Height = 420
      ExplicitLeft = 1
      ExplicitTop = 34
      ExplicitWidth = 652
      ExplicitHeight = 420
      object pnl3: TPanel
        Left = 1
        Top = 1
        Width = 465
        Height = 418
        Align = alClient
        TabOrder = 0
        object pnl5: TPanel
          Left = 1
          Top = 1
          Width = 463
          Height = 200
          Align = alTop
          TabOrder = 0
          object lbl1: TLabel
            Left = 48
            Top = 16
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = #35746#21333#32534#21495':'
          end
          object lbl2: TLabel
            Left = 48
            Top = 176
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = #23458#25143#20132#26399':'
          end
          object lbl3: TLabel
            Left = 276
            Top = 176
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = #35745#21010#20132#26399':'
          end
          object lbl4: TLabel
            Left = 276
            Top = 43
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = #23458#25143#31616#31216':'
          end
          object lbl5: TLabel
            Left = 48
            Top = 43
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = #20135#21697#32534#21495':'
          end
          object lbl6: TLabel
            Left = 48
            Top = 69
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = #37096#20214#25551#36848':'
          end
          object lbl7: TLabel
            Left = 61
            Top = 93
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = #21512#21516#21495':'
          end
          object lbl8: TLabel
            Left = 0
            Top = 146
            Width = 107
            Height = 13
            Alignment = taRightJustify
            Caption = #21407#35746#21333#25968#37327'(PCS):'
          end
          object lbl9: TLabel
            Left = 254
            Top = 151
            Width = 81
            Height = 13
            Alignment = taRightJustify
            Caption = #24050#35013#36816'(PCS):'
          end
          object lbl10: TLabel
            Left = 0
            Top = 120
            Width = 107
            Height = 13
            Alignment = taRightJustify
            Caption = #21407#35746#21333#25968#37327'(SET):'
          end
          object lbl11: TLabel
            Left = 263
            Top = 124
            Width = 72
            Height = 13
            Alignment = taRightJustify
            Caption = #20986#36135#26495#26041#24335':'
          end
          object lbl_SetQty: TLabel
            Left = 336
            Top = 124
            Width = 14
            Height = 13
            Caption = '..'
          end
          object lbl13: TLabel
            Left = 263
            Top = 97
            Width = 72
            Height = 13
            Alignment = taRightJustify
            Caption = #20851#32852#25991#20214#21495':'
          end
          object lbl14: TLabel
            Left = 276
            Top = 16
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = #35746#21333#29366#24577':'
          end
          object dbedtSALES_ORDER: TDBEdit
            Left = 113
            Top = 12
            Width = 114
            Height = 21
            Color = cl3DLight
            DataField = 'SALES_ORDER'
            DataSource = ds60
            Enabled = False
            TabOrder = 0
          end
          object dbedtORIG_REQUEST_DATE: TDBEdit
            Left = 113
            Top = 172
            Width = 114
            Height = 21
            Color = cl3DLight
            DataField = 'ORIG_REQUEST_DATE'
            DataSource = ds60
            Enabled = False
            TabOrder = 1
          end
          object dbedtORIG_SCHED_SHIP_DATE: TDBEdit
            Left = 336
            Top = 172
            Width = 95
            Height = 21
            Color = cl3DLight
            DataField = 'ORIG_SCHED_SHIP_DATE'
            DataSource = ds60
            Enabled = False
            TabOrder = 2
          end
          object dbedtABBR_NAME: TDBEdit
            Left = 336
            Top = 40
            Width = 95
            Height = 21
            Color = cl3DLight
            DataField = 'ABBR_NAME'
            DataSource = ds60
            Enabled = False
            TabOrder = 3
          end
          object dbedtMANU_PART_NUMBER: TDBEdit
            Left = 113
            Top = 39
            Width = 114
            Height = 21
            Color = cl3DLight
            DataField = 'MANU_PART_NUMBER'
            DataSource = ds60
            Enabled = False
            TabOrder = 4
          end
          object dbedtMANU_PART_DESC: TDBEdit
            Left = 113
            Top = 65
            Width = 318
            Height = 21
            Color = cl3DLight
            DataField = 'MANU_PART_DESC'
            DataSource = ds60
            Enabled = False
            TabOrder = 5
          end
          object dbedtPO_NUMBER: TDBEdit
            Left = 113
            Top = 90
            Width = 114
            Height = 21
            Color = cl3DLight
            DataField = 'PO_NUMBER'
            DataSource = ds60
            Enabled = False
            TabOrder = 6
          end
          object dbedtPARTS_SHIPPED: TDBEdit
            Left = 336
            Top = 146
            Width = 95
            Height = 21
            Color = cl3DLight
            DataField = 'PARTS_SHIPPED'
            DataSource = ds60
            Enabled = False
            ReadOnly = True
            TabOrder = 7
          end
          object edt_qtyPcs: TEdit
            Left = 113
            Top = 146
            Width = 114
            Height = 21
            Color = cl3DLight
            Enabled = False
            ReadOnly = True
            TabOrder = 8
          end
          object edt_qtySet: TEdit
            Left = 113
            Top = 120
            Width = 114
            Height = 21
            Color = cl3DLight
            Enabled = False
            ReadOnly = True
            TabOrder = 9
          end
          object edt_file: TEdit
            Left = 336
            Top = 93
            Width = 95
            Height = 21
            Enabled = False
            MaxLength = 50
            TabOrder = 10
          end
          object dbedtSTATUS: TDBEdit
            Left = 336
            Top = 13
            Width = 95
            Height = 21
            Color = cl3DLight
            DataField = 'STATUS'
            DataSource = ds60
            Enabled = False
            TabOrder = 11
          end
        end
        object eh60: TDBGridEh
          Left = 1
          Top = 201
          Width = 463
          Height = 216
          Align = alClient
          DataSource = ds60N
          DynProps = <>
          PopupMenu = pm1
          TabOrder = 1
          OnDblClick = eh60DblClick
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'sales_order'
              Footers = <>
              Title.Caption = #35746#21333#32534#21495
              Width = 88
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'PARTS_ORDERED'
              Footers = <>
              Title.Caption = #35746#21333#25968#37327'pcs'
              Width = 83
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'set_ORDERED'
              Footers = <>
              Title.Caption = #35746#21333#25968#37327'SET'
              Width = 81
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'ORIG_REQUEST_DATE'
              Footers = <>
              Title.Caption = #23458#25143#20132#26399
              Width = 99
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'ORIG_SCHED_SHIP_DATE'
              Footers = <>
              Title.Caption = #35013#36816#20132#26399
              Width = 81
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object pnl4: TPanel
        Left = 466
        Top = 1
        Width = 185
        Height = 418
        Align = alRight
        TabOrder = 1
        object eh360: TDBGridEh
          Left = 1
          Top = 1
          Width = 183
          Height = 416
          Align = alClient
          DataSource = ds360
          DynProps = <>
          FooterRowCount = 1
          FooterParams.Color = clRed
          FrozenCols = 1
          PopupMenu = pm2
          SumList.Active = True
          TabOrder = 0
          OnExit = eh360Exit
          Columns = <
            item
              Color = clScrollBar
              DynProps = <>
              EditButtons = <>
              FieldName = 'sch_date'
              Footer.Value = #21512#35745
              Footer.ValueType = fvtStaticText
              Footers = <>
              ReadOnly = True
              Title.Caption = #23436#24037#26085#26399
              Width = 68
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'quantity'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #23436#24037#25968#37327
              Width = 85
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
  end
  object ds360: TDataSource
    DataSet = cds360
    Left = 528
    Top = 208
  end
  object cds360: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from Data0360 where 1=1'#13#10' '
    Params = <>
    Left = 560
    Top = 208
  end
  object ds60: TDataSource
    DataSet = cds60
    Left = 376
    Top = 8
  end
  object cds60: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT dbo.Data0060.*,dbo.Data0097.PO_NUMBER,  '#13#10'      dbo.Data0' +
      '097.PO_DATE,dbo.Data0010.ABBR_NAME,    '#13#10'      dbo.Data0008.PROD' +
      'UCT_NAME, dbo.Data0001.CURR_NAME,      '#13#10'      dbo.Data0023.CODE' +
      ', dbo.Data0023.SUPPLIER_NAME,  '#13#10'      dbo.Data0060.PARTS_ORDERE' +
      'D * dbo.Data0025.unit_sq AS orders_sqft,  '#13#10'      dbo.Data0025.M' +
      'ANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC,dbo.Data0025.ANALYS' +
      'IS_CODE_2,  '#13#10'      dbo.Data0025.ANALYSIS_CODE_5,dbo.Data0025.AN' +
      'ALYSIS_CODE_1,dbo.Data0025.memo_text,  '#13#10'      dbo.Data0025.set_' +
      'qty,  '#13#10'      dbo.Data0025.set_qty_org,CONVERT(varchar(20),set_l' +
      'ngth_org)+'#39'mmX'#39'+CONVERT(varchar(20),set_width_org)+'#39'mm'#39' as Size_' +
      'org,   '#13#10'      case Data0025.ttype when 0 then '#39#37327#20135#39' when 1 then ' +
      #39#26679#21697#39' end as pro_type,  '#13#10'      CASE dbo.Data0060.STATUS  '#13#10'     ' +
      '  WHEN 1 THEN '#39#26377#25928#30340#39'  '#13#10'       WHEN 2 THEN '#39#24050#26242#32531#39'  '#13#10'       WHEN 3' +
      ' THEN '#39#24050#20851#38381#39'  '#13#10'       WHEN 4 THEN '#39#24050#23436#25104#39'  '#13#10'       WHEN 5 THEN '#39#24050 +
      #21462#28040#39'  '#13#10'       WHEN 6 THEN '#39#26410#25552#20132#39'  '#13#10'      END AS STATUS,dbo.data0' +
      '025.ORIG_CUSTOMER,dbo.data0015.ABBR_NAME as ABBR_NAME15  '#13#10'FROM ' +
      'dbo.Data0023 RIGHT OUTER JOIN  '#13#10'      dbo.Data0060 INNER JOIN  ' +
      #13#10'      dbo.Data0010 ON dbo.Data0060.CUSTOMER_PTR = dbo.Data0010' +
      '.RKEY INNER JOIN  '#13#10'      dbo.Data0097 ON  '#13#10'      dbo.Data0060.' +
      'PURCHASE_ORDER_PTR = dbo.Data0097.RKEY INNER JOIN  '#13#10'      dbo.D' +
      'ata0001 ON dbo.Data0060.CURRENCY_PTR = dbo.Data0001.RKEY INNER J' +
      'OIN  '#13#10'      dbo.Data0025 INNER JOIN  '#13#10'      dbo.Data0008 ON db' +
      'o.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY ON  '#13#10'      dbo.Dat' +
      'a0060.CUST_PART_PTR = dbo.Data0025.RKEY ON  '#13#10'      dbo.Data0023' +
      '.RKEY = dbo.Data0060.supplier_ptr INNER JOIN  '#13#10'      dbo.Data00' +
      '15 ON dbo.Data0060.SHIP_REG_TAX_ID = dbo.Data0015.RKEY '#13#10'where 1' +
      '=1 '
    Params = <>
    Left = 408
    Top = 8
  end
  object ds60N: TDataSource
    DataSet = cds60N
    Left = 176
    Top = 368
  end
  object cds60N: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 320
  end
  object qrytemp: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=wisdompcb1077;Persist Security Info' +
      '=True;User ID=sa;Initial Catalog=SJ_V20_LIVE;Data Source=192.168' +
      '.8.37;Use Procedure for Prepare=1;Auto Translate=True;Packet Siz' +
      'e=4096;Workstation ID=HOME;Use Encryption for Data=False;Tag wit' +
      'h column collation when possible=False'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select  sales_order ,PARTS_ORDERED,set_ORDERED,ORIG_REQUEST_DATE' +
        ',ORIG_SCHED_SHIP_DATE from data0060 where 1=2')
    Left = 351
    Top = 280
    object strngfld_order: TStringField
      FieldName = 'sales_order'
      FixedChar = True
      Size = 12
    end
    object fltfldPARTS_ORDERED: TFloatField
      FieldName = 'PARTS_ORDERED'
    end
    object intgrfld_ORDERED: TIntegerField
      FieldName = 'set_ORDERED'
    end
    object dtmfldORIG_REQUEST_DATE: TDateTimeField
      FieldName = 'ORIG_REQUEST_DATE'
    end
    object dtmfldORIG_SCHED_SHIP_DATE: TDateTimeField
      FieldName = 'ORIG_SCHED_SHIP_DATE'
    end
  end
  object pm1: TPopupMenu
    Left = 146
    Top = 308
    object mni_Add: TMenuItem
      Caption = #26032#22686
      OnClick = mni_AddClick
    end
    object mni_edit: TMenuItem
      Caption = #32534#36753
      OnClick = mni_editClick
    end
    object mni_edit60: TMenuItem
      Caption = #21024#38500
      OnClick = mni_edit60Click
    end
  end
  object pm2: TPopupMenu
    Left = 536
    Top = 152
    object mni_del360: TMenuItem
      Caption = #21024#38500
      OnClick = mni_del360Click
    end
  end
  object cdsTemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 523
    Top = 304
  end
end
