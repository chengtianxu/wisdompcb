inherited frmMain_OrderModiSChe_mod284: TfrmMain_OrderModiSChe_mod284
  Caption = #38144#21806#35746#21333#20462#25913#65288#35745#21010#37096#65289
  ClientHeight = 469
  ClientWidth = 933
  Font.Height = -13
  Font.Name = #23435#20307
  Position = poOwnerFormCenter
  ExplicitWidth = 949
  ExplicitHeight = 508
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 933
    Height = 469
    ExplicitWidth = 933
    ExplicitHeight = 469
    inherited pnlDisplayMain: TPanel
      Width = 933
      Height = 469
      ExplicitWidth = 933
      ExplicitHeight = 469
      inherited pnlChildMain: TPanel
        Width = 931
        Height = 467
        ExplicitWidth = 931
        ExplicitHeight = 467
        inherited pnlEhMainDisplay: TPanel
          Width = 929
          Height = 436
          ExplicitWidth = 929
          ExplicitHeight = 436
          inherited ehMain: TDBGridEh
            Width = 927
            Height = 434
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'SALES_ORDER'
                Footers = <>
                Title.Caption = #38144#21806#35746#21333
                Width = 108
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CUST_CODE'
                Footers = <>
                Title.Caption = #23458#25143#32534#21495
                Width = 94
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'MANU_PART_NUMBER'
                Footers = <>
                Title.Caption = #26412#21378#32534#21495
                Width = 100
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'MANU_PART_DESC'
                Footers = <>
                Title.Caption = #23458#25143#22411#21495
                Width = 102
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PO_NUMBER'
                Footers = <>
                Title.Caption = #23458#25143#35746#21333#21495
                Width = 83
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'EMPLOYEE_NAME'
                Footers = <>
                Title.Caption = #36755#20837#20154#21592
                Width = 69
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ORIG_SCHED_SHIP_DATE'
                Footers = <>
                Title.Caption = #35745#21010#20132#26399
                Width = 69
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PARTS_ORDERED'
                Footers = <>
                Title.Caption = #35746#21333#25968
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ISSUED_QTY'
                Footers = <>
                Title.Caption = #25237#20135#25968#37327
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PARTS_SHIPPED'
                Footers = <>
                Title.Caption = #24050#35013#36816#25968
                Width = 67
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'v_status'
                Footers = <>
                Title.Caption = #29366#24577
              end>
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 929
          ExplicitWidth = 929
          inherited lblFilter: TLabel
            Left = 461
            Top = 10
            Width = 52
            ExplicitLeft = 461
            ExplicitTop = 10
            ExplicitWidth = 52
          end
          inherited btnExportToExcel: TBitBtn
            Left = 195
            Visible = False
            ExplicitLeft = 195
          end
          inherited btnQry: TBitBtn
            Left = 130
            ExplicitLeft = 130
          end
          inherited btnAuthDispatch: TBitBtn
            Visible = False
          end
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 
      #13#10' SELECT data0060.rkey,Data0060.SALES_ORDER,Data0010.CUST_CODE ' +
      'as CUST_CODE, '#13#10'       Data0025.MANU_PART_NUMBER,data0060.part_p' +
      'rice,data0060.tax_in_price,data0010.cust_code as custcode,'#13#10'    ' +
      '      Data0097.PO_NUMBER,Data0005.EMPLOYEE_NAME,data0060.to_be_p' +
      'lanned,data0010.CREDIT_RATING,'#13#10'          Data0060.DUE_DATE,Data' +
      '0060.SCH_DATE,Data0060.CUSTOMER_PTR,data0060.RUSH_CHARGE,'#13#10'     ' +
      '     Data0060.PARTS_ORDERED,Data0060.PARTS_SHIPPED,data0060.qty_' +
      'plannned,data0010.credit_limit,'#13#10'          data0060.status,data0' +
      '060.prod_rel,Data0060.CUST_PART_PTR,RUSH_CHARGE_PCT_USED,'#13#10'     ' +
      '     data0025.set_qty,set_ordered,set_price,data0025.MFG_LEAD_TI' +
      'ME,data0010.DAYS_EARLY_SCHEDULE,'#13#10'          data0060.ORIG_REQUES' +
      'T_DATE,data0060.ORIG_SCHED_SHIP_DATE,TOTAL_ADD_L_PRICE,'#13#10'       ' +
      '   Data0060.PURCHASE_ORDER_PTR,data0097.po_date,data0060.EXCH_RA' +
      'TE,data0010.customer_name,'#13#10'          data0060.REFERENCE_NUMBER,' +
      'data0025.MANU_PART_DESC,CUST_SHIP_ADDR_PTR,data0060.ISSUED_QTY '#13 +
      #10'         ,case when data0060.Status=1  then '#39#26377#25928#30340#39'   when data00' +
      '60.Status=2  then '#39#26242#32531#39'    '#13#10'         when data0060.Status=5  the' +
      'n '#39#24050#21462#28040#39'   when data0060.Status=6  then '#39#26410#25552#20132#39'  else '#39#39' end as v_s' +
      'tatus '#13#10'         FROM Data0005 INNER JOIN Data0097 '#13#10'         IN' +
      'NER JOIN Data0060 '#13#10'         INNER JOIN Data0025 ON Data0060.CUS' +
      'T_PART_PTR = Data0025.RKEY INNER JOIN '#13#10'         Data0010 ON Dat' +
      'a0060.CUSTOMER_PTR = Data0010.RKEY ON '#13#10'         Data0097.RKEY =' +
      ' Data0060.PURCHASE_ORDER_PTR ON '#13#10'         Data0005.RKEY = Data0' +
      '060.ENTERED_BY_EMPL_PTR '#13#10'         where (Data0060.STATUS <> 3) ' +
      'and (Data0060.STATUS <> 4)'
  end
  inherited dsMain: TDataSource
    Left = 352
  end
  inherited pmZD: TPopupMenu
    Left = 816
    Top = 8
  end
  inherited pmMain: TPopupMenu
    Left = 240
    Top = 104
    object mni_PutOff: TMenuItem
      Caption = #38144#21806#35746#21333#26242#32531
      OnClick = mni_PutOffClick
    end
    object mni_reStart: TMenuItem
      Caption = #37325#26032#21551#21160
      OnClick = mni_reStartClick
    end
    object mni_modiVer: TMenuItem
      Caption = #26356#25913#20135#21697#29256#26412
      OnClick = mni_modiVerClick
    end
    object mni_WoList: TMenuItem
      Caption = #23558#35201#20462#25913#30340#24037#20316#35746#21333
      OnClick = mni_WoListClick
    end
    object mni_OrderDetail: TMenuItem
      Caption = #26597#30475#38144#21806#35746#21333#35814#24773
      OnClick = mni_OrderDetailClick
    end
  end
  inherited cdsMainWhereInit: TClientDataSet
    Left = 760
    Top = 0
  end
  object qrytemp: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=wisdompcb1077;Persist Security Info' +
      '=True;User ID=sa;Initial Catalog=SJ_V20_LIVE;Data Source=192.168' +
      '.1.37;Use Procedure for Prepare=1;Auto Translate=True;Packet Siz' +
      'e=4096;Workstation ID=HOME;Use Encryption for Data=False;Tag wit' +
      'h column collation when possible=False'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT data0060.rkey,Data0060.SALES_ORDER,Data0010.CUST_CODE as ' +
        'CUST_CODE,'
      
        ' Data0025.MANU_PART_NUMBER,data0060.part_price,data0060.tax_in_p' +
        'rice,data0010.cust_code as custcode,'
      
        ' Data0097.PO_NUMBER,Data0005.EMPLOYEE_NAME,data0060.to_be_planne' +
        'd,data0010.CREDIT_RATING,'
      
        ' Data0060.DUE_DATE,Data0060.SCH_DATE,Data0060.CUSTOMER_PTR,data0' +
        '060.RUSH_CHARGE,'
      
        ' Data0060.PARTS_ORDERED,Data0060.PARTS_SHIPPED,data0060.qty_plan' +
        'nned,data0010.credit_limit,'
      
        ' data0060.status,data0060.prod_rel,Data0060.CUST_PART_PTR,RUSH_C' +
        'HARGE_PCT_USED,'
      
        ' data0025.set_qty,set_ordered,set_price,data0025.MFG_LEAD_TIME,d' +
        'ata0010.DAYS_EARLY_SCHEDULE,'
      
        ' data0060.ORIG_REQUEST_DATE,data0060.ORIG_SCHED_SHIP_DATE,TOTAL_' +
        'ADD_L_PRICE,'
      
        ' Data0060.PURCHASE_ORDER_PTR,data0097.po_date,data0060.EXCH_RATE' +
        ',data0010.customer_name,'
      
        ' data0060.REFERENCE_NUMBER,data0025.MANU_PART_DESC,CUST_SHIP_ADD' +
        'R_PTR,data0060.ISSUED_QTY'
      
        ',case when data0060.Status=1  then '#39#26377#25928#30340#39'   when data0060.Status=' +
        '2  then '#39#26242#32531#39' '
      
        ' when data0060.Status=5  then '#39#24050#21462#28040#39'   when data0060.Status=6  th' +
        'en '#39#26410#25552#20132#39'  else '#39#39' end as v_status'
      'FROM Data0005 INNER JOIN Data0097 INNER JOIN'
      
        '      Data0060 INNER JOIN Data0025 ON Data0060.CUST_PART_PTR = D' +
        'ata0025.RKEY INNER JOIN'
      '      Data0010 ON Data0060.CUSTOMER_PTR = Data0010.RKEY ON'
      '      Data0097.RKEY = Data0060.PURCHASE_ORDER_PTR ON'
      '      Data0005.RKEY = Data0060.ENTERED_BY_EMPL_PTR'
      'WHERE (Data0060.STATUS <> 3) and (Data0060.STATUS <> 4) and'
      
        '      (data0060.ENT_DATE >='#39'2017-01-01'#39') and (data0060.ENT_DATE ' +
        '<='#39'2017-01-01'#39')')
    Left = 592
    Top = 176
    object strngfldSALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object strngfldCUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object strngfldMANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object strngfldMANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object strngfldPO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 100
    end
    object strngfldEMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object dtmfldORIG_SCHED_SHIP_DATE: TDateTimeField
      FieldName = 'ORIG_SCHED_SHIP_DATE'
    end
    object fltfldPARTS_ORDERED: TFloatField
      FieldName = 'PARTS_ORDERED'
    end
    object intgrfldISSUED_QTY: TIntegerField
      FieldName = 'ISSUED_QTY'
    end
    object fltfldPARTS_SHIPPED: TFloatField
      FieldName = 'PARTS_SHIPPED'
    end
    object strngfld_status: TStringField
      FieldName = 'v_status'
      ReadOnly = True
      Size = 6
    end
  end
  object cdsTemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 776
    Top = 168
  end
end
