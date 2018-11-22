inherited frmMain_OrderEditMarket_mod354: TfrmMain_OrderEditMarket_mod354
  Caption = #35746#21333#20462#25913'('#24066#22330#37096')'
  ClientHeight = 480
  ClientWidth = 1019
  Font.Height = -13
  Font.Name = #23435#20307
  Position = poOwnerFormCenter
  ExplicitWidth = 1035
  ExplicitHeight = 519
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 1019
    Height = 480
    ExplicitWidth = 1019
    ExplicitHeight = 480
    inherited pnlDisplayMain: TPanel
      Width = 1019
      Height = 480
      ExplicitWidth = 1019
      ExplicitHeight = 480
      inherited pnlChildMain: TPanel
        Width = 1017
        Height = 478
        ExplicitWidth = 1017
        ExplicitHeight = 478
        inherited pnlEhMainDisplay: TPanel
          Width = 1015
          Height = 447
          ExplicitWidth = 1015
          ExplicitHeight = 447
          inherited ehMain: TDBGridEh
            Width = 1013
            Height = 445
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'SALES_ORDER'
                Footers = <>
                Title.Caption = #38144#21806#35746#21333
                Width = 124
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CUST_CODE'
                Footers = <>
                Title.Caption = #23458#25143
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'MANU_PART_NUMBER'
                Footers = <>
                Title.Caption = #26412#21378#32534#21495
                Width = 121
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'MANU_PART_DESC'
                Footers = <>
                Title.Caption = #23458#25143#22411#21495
                Width = 96
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PO_NUMBER'
                Footers = <>
                Title.Caption = #23458#25143#35746#21333#21495
                Width = 97
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
                FieldName = 'PARTS_SHIPPED'
                Footers = <>
                Title.Caption = #24050#35013#36816#25968
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'EMPLOYEE_NAME'
                Footers = <>
                Title.Caption = #36755#20837#20154#21592
                Width = 67
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ENT_DATE'
                Footers = <>
                Title.Caption = #36755#20837#26085#26399
                Width = 86
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ORIG_SCHED_SHIP_DATE'
                Footers = <>
                Title.Caption = #35746#21333#20132#26399
                Width = 96
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'v_status'
                Footers = <>
                Title.Caption = #29366#24577
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'sotp'
                Footers = <>
                Title.Caption = #21152#24037#24418#24335
                Width = 65
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'FOB'
                Footers = <>
                Title.Caption = #21512#21516#21495
              end>
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 1015
          ExplicitWidth = 1015
          inherited lblFilter: TLabel
            Left = 463
            Width = 52
            ExplicitLeft = 463
            ExplicitWidth = 52
          end
          inherited btnDY: TBitBtn
            Left = 885
            Align = alRight
            ExplicitLeft = 885
          end
          inherited btnAuthDispatch: TBitBtn
            Left = 950
            Align = alRight
            ExplicitLeft = 950
          end
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 
      'SELECT Data0060.RKEY,Data0060.SALES_ORDER,Data0010.rkey as rkey1' +
      '0,Data0010.CUST_CODE,Data0010.customer_name,data0010.quote_flag,' +
      #13#10'       Data0012.ship_to_address_1,Data0025.MANU_PART_NUMBER,Da' +
      'ta0025.MANU_PART_DESC,Data0060.RUSH_CHARGE,'#13#10'       Data0097.PO_' +
      'NUMBER,Data0005.EMPLOYEE_NAME,Data0060.TO_BE_PLANNED,Data0060.DU' +
      'E_DATE,data0012.LOCATION,'#13#10'       Data0060.PARTS_RETURNED,Data00' +
      '60.SCH_DATE,Data0060.CUSTOMER_PTR,Data0060.RETURNED_SHIP,'#13#10'     ' +
      '  Data0060.PARTS_ORDERED,Data0060.PARTS_SHIPPED,Data0060.QTY_PLA' +
      'NNNED,Data0060.STATUS,'#13#10'case data0060.status when  1 then '#39#26377#25928#30340#39' ' +
      'when  2 then '#39#26242#32531#39' when  5 then '#39#24050#21462#28040#39' when  6 then '#39#26410#25552#20132#39' end as v' +
      '_status,'#13#10'Data0060.PROD_REL,data0060.ANALYSIS_CODE_1,'#13#10'       Da' +
      'ta0060.CUST_PART_PTR,Data0060.RUSH_CHARGE_PCT_USED,Data0025.set_' +
      'qty,Data0060.set_ordered,'#13#10'       Data0060.set_price,Data0060.ta' +
      'x_in_price,Data0060.ORIG_REQUEST_DATE,Data0060.ORIG_SCHED_SHIP_D' +
      'ATE,'#13#10'       Data0060.TOTAL_ADD_L_PRICE,Data0060.PURCHASE_ORDER_' +
      'PTR,Data0097.PO_DATE,Data0060.EXCH_RATE,'#13#10'       Data0060.REFERE' +
      'NCE_NUMBER,Data0060.CUST_SHIP_ADDR_PTR,Data0025.ttype,Data0060.F' +
      'OB, '#13#10'       Data0060.PART_PRICE,Data0060.PARTS_ALLOC,Data0060.s' +
      'o_style,Data0060.so_tp,data0060.bp06_ptr,'#13#10'case data0060.so_tp w' +
      'hen 0 then '#39#33258#21046#39' when 1 then '#39#22806#21457#39' when 2 then '#39#21322#21046#31243#39' end sotp,'#13#10'Da' +
      'ta0060.QTE_PTR, Data0001.CURR_CODE,data0060.CURRENCY_PTR,data006' +
      '0.COMMISION_ON_TOOLING,Data0060.ISSUED_QTY,'#13#10'data0060.SHIPPING_C' +
      'ONTACT,data0060.SHIP_CONTACT_PHONE,data0060.REPUT_QTY,data0060.R' +
      'EPUT_APPR_BY,data0060.ENT_DATE,Data0060.rkey213,'#13#10'Data0025.ONHOL' +
      'D_SALES_FLAG,data0060.parts_alloc1,data0060.ORIG_CUSTOMER'#13#10'FROM ' +
      '        dbo.Data0005 INNER JOIN'#13#10'                      dbo.Data0' +
      '097 INNER JOIN'#13#10'                      dbo.Data0060 INNER JOIN'#13#10' ' +
      '                     dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR ' +
      '= dbo.Data0025.RKEY INNER JOIN'#13#10'                      dbo.Data00' +
      '10 ON dbo.Data0060.CUSTOMER_PTR = dbo.Data0010.RKEY ON dbo.Data0' +
      '097.RKEY = dbo.Data0060.PURCHASE_ORDER_PTR ON '#13#10'                ' +
      '      dbo.Data0005.RKEY = dbo.Data0060.ENTERED_BY_EMPL_PTR INNER' +
      ' JOIN'#13#10'                      dbo.Data0001 ON dbo.Data0060.CURREN' +
      'CY_PTR = dbo.Data0001.RKEY INNER JOIN'#13#10'                      dbo' +
      '.Data0012 ON dbo.Data0060.CUST_SHIP_ADDR_PTR = dbo.Data0012.RKEY' +
      #13#10'WHERE (Data0060.STATUS not in(3,4)) '#13#10
  end
  inherited dsMain: TDataSource
    Left = 344
    Top = 192
  end
  inherited pmZD: TPopupMenu
    Top = 88
  end
  inherited pmMain: TPopupMenu
    Left = 152
    Top = 112
    object mni_QtyModi: TMenuItem
      Caption = #26356#25913#25968#37327'/'#20215#26684'/'#35745#21010#20132#26399
      OnClick = mni_QtyModiClick
    end
    object mni_CustModi: TMenuItem
      Caption = #26356#25913#23458#25143#20195#30721'/'#23458#25143#35746#21333#21495'/'#23458#25143#20132#26399
      OnClick = mni_CustModiClick
    end
    object mni_FeesModi: TMenuItem
      Caption = #26356#25913#24037#20855#36153#29992
      OnClick = mni_FeesModiClick
    end
    object mni_splitOrder: TMenuItem
      Caption = #38144#21806#35746#21333#25286#20998
      OnClick = mni_splitOrderClick
    end
    object mni_OrderDetail: TMenuItem
      Caption = #26597#30475#38144#21806#35746#21333#35814#24773
      OnClick = mni_OrderDetailClick
    end
  end
  inherited cdsMainWhereInit: TClientDataSet
    Left = 392
    Top = 65528
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
      
        'SELECT Data0060.RKEY,Data0060.SALES_ORDER,Data0010.rkey as rkey1' +
        '0,Data0010.CUST_CODE,Data0010.customer_name,data0010.quote_flag,'
      
        '       Data0012.ship_to_address_1,Data0025.MANU_PART_NUMBER,Data' +
        '0025.MANU_PART_DESC,Data0060.RUSH_CHARGE,'
      
        '       Data0097.PO_NUMBER,Data0005.EMPLOYEE_NAME,Data0060.TO_BE_' +
        'PLANNED,Data0060.DUE_DATE,data0012.LOCATION,'
      
        '       Data0060.PARTS_RETURNED,Data0060.SCH_DATE,Data0060.CUSTOM' +
        'ER_PTR,Data0060.RETURNED_SHIP,'
      
        '       Data0060.PARTS_ORDERED,Data0060.PARTS_SHIPPED,Data0060.QT' +
        'Y_PLANNNED,Data0060.STATUS,'
      
        'case data0060.status when  1 then '#39#26377#25928#30340#39' when  2 then '#39#26242#32531#39' when  ' +
        '5 then '#39#24050#21462#28040#39' when  6 then '#39#26410#25552#20132#39' end as v_status,'
      'Data0060.PROD_REL,data0060.ANALYSIS_CODE_1,'
      
        '       Data0060.CUST_PART_PTR,Data0060.RUSH_CHARGE_PCT_USED,Data' +
        '0025.set_qty,Data0060.set_ordered,'
      
        '       Data0060.set_price,Data0060.tax_in_price,Data0060.ORIG_RE' +
        'QUEST_DATE,Data0060.ORIG_SCHED_SHIP_DATE,'
      
        '       Data0060.TOTAL_ADD_L_PRICE,Data0060.PURCHASE_ORDER_PTR,Da' +
        'ta0097.PO_DATE,Data0060.EXCH_RATE,'
      
        '       Data0060.REFERENCE_NUMBER,Data0060.CUST_SHIP_ADDR_PTR,Dat' +
        'a0025.ttype,Data0060.FOB, '
      
        '       Data0060.PART_PRICE,Data0060.PARTS_ALLOC,Data0060.so_styl' +
        'e,Data0060.so_tp,data0060.bp06_ptr,'
      
        'case data0060.so_tp when 0 then '#39#33258#21046#39' when 1 then '#39#22806#21457#39' when 2 the' +
        'n '#39#21322#21046#31243#39' end sotp,'
      
        'Data0060.QTE_PTR, Data0001.CURR_CODE,data0060.CURRENCY_PTR,data0' +
        '060.COMMISION_ON_TOOLING,Data0060.ISSUED_QTY,'
      
        'data0060.SHIPPING_CONTACT,data0060.SHIP_CONTACT_PHONE,data0060.R' +
        'EPUT_QTY,data0060.REPUT_APPR_BY,data0060.ENT_DATE,Data0060.rkey2' +
        '13,'
      'Data0025.ONHOLD_SALES_FLAG,data0060.parts_alloc1'
      'FROM         dbo.Data0005 INNER JOIN'
      '                      dbo.Data0097 INNER JOIN'
      '                      dbo.Data0060 INNER JOIN'
      
        '                      dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR' +
        ' = dbo.Data0025.RKEY INNER JOIN'
      
        '                      dbo.Data0010 ON dbo.Data0060.CUSTOMER_PTR ' +
        '= dbo.Data0010.RKEY ON dbo.Data0097.RKEY = dbo.Data0060.PURCHASE' +
        '_ORDER_PTR ON '
      
        '                      dbo.Data0005.RKEY = dbo.Data0060.ENTERED_B' +
        'Y_EMPL_PTR INNER JOIN'
      
        '                      dbo.Data0001 ON dbo.Data0060.CURRENCY_PTR ' +
        '= dbo.Data0001.RKEY INNER JOIN'
      
        '                      dbo.Data0012 ON dbo.Data0060.CUST_SHIP_ADD' +
        'R_PTR = dbo.Data0012.RKEY'
      'WHERE (Data0060.STATUS not in(3,4))'
      
        'and      (data0060.ENT_DATE >='#39'2017-01-01'#39') and (data0060.ENT_DA' +
        'TE <='#39'2017-01-01'#39')')
    Left = 696
    Top = 256
    object strngfldSALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object strngfldCUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object strngfld_name: TStringField
      FieldName = 'customer_name'
      Size = 100
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
    object fltfldPARTS_ORDERED: TFloatField
      FieldName = 'PARTS_ORDERED'
    end
    object fltfldPARTS_SHIPPED: TFloatField
      FieldName = 'PARTS_SHIPPED'
    end
    object strngfldEMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object dtmfldENT_DATE: TDateTimeField
      FieldName = 'ENT_DATE'
    end
    object dtmfldORIG_SCHED_SHIP_DATE: TDateTimeField
      FieldName = 'ORIG_SCHED_SHIP_DATE'
    end
    object strngfld_status: TStringField
      FieldName = 'v_status'
      ReadOnly = True
      Size = 6
    end
    object strngfldqrytempsotp: TStringField
      FieldName = 'sotp'
      ReadOnly = True
      Size = 6
    end
    object strngfldFOB: TStringField
      FieldName = 'FOB'
      Size = 50
    end
  end
  object cdsTemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 776
    Top = 168
  end
end
