inherited FrmMain_Mod50: TFrmMain_Mod50
  Caption = 'FrmMain_Mod50'
  ClientHeight = 345
  ClientWidth = 712
  Font.Height = -13
  Font.Name = #23435#20307
  ExplicitWidth = 720
  ExplicitHeight = 379
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 712
    Height = 345
    ExplicitWidth = 712
    ExplicitHeight = 345
    inherited pnlDisplayMain: TPanel
      Width = 712
      Height = 345
      ExplicitWidth = 712
      ExplicitHeight = 345
      inherited pnlChildMain: TPanel
        Width = 710
        Height = 343
        ExplicitWidth = 710
        ExplicitHeight = 343
        inherited pnlEhMainDisplay: TPanel
          Width = 708
          Height = 268
          ExplicitWidth = 708
          ExplicitHeight = 268
          inherited ehMain: TDBGridEh
            Width = 706
            Height = 266
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_PART_NUMBER'
                Footers = <>
                Width = 135
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_NAME'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_DESCRIPTION'
                Footers = <>
                Width = 225
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'SUPPLIER_NAME'
                Footers = <>
                Width = 111
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'v_state'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'QUAN_TO_BE_SHIPPED'
                Footers = <>
                Width = 127
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'QUAN_REJD'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'UNIT_NAME'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'rohs'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 't_price'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'tax_amount'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CURR_NAME'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'TAX_2'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'exch_rate'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PO_NUMBER'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'TDATE'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ename'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'SHIPPING_METHOD'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'TRAN_DATE'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'uname'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'reject_description'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ABBR_NAME'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'LOCATION'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'REFERENCE_NUMBER'
                Footers = <>
              end>
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 708
          ExplicitWidth = 708
          inherited lblFilter: TLabel
            Left = 463
            Width = 52
            ExplicitLeft = 463
            ExplicitWidth = 52
          end
          inherited btnDY: TBitBtn
            OnClick = btnDYClick
          end
        end
        object Panel1: TPanel
          Left = 1
          Top = 298
          Width = 708
          Height = 44
          Align = alBottom
          TabOrder = 2
          object GroupBox1: TGroupBox
            Left = 1
            Top = 1
            Width = 208
            Height = 42
            Align = alLeft
            Caption = #29366#24577
            TabOrder = 0
            object cbx1: TCheckBox
              Left = 17
              Top = 16
              Width = 64
              Height = 17
              Caption = #26410#35013#36816
              Checked = True
              State = cbChecked
              TabOrder = 0
              OnClick = cbx1Click
            end
            object cbx2: TCheckBox
              Left = 120
              Top = 16
              Width = 97
              Height = 17
              Caption = #24050#35013#36816
              TabOrder = 1
              OnClick = cbx1Click
            end
          end
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 
      'SELECT     dbo.Data0022.RKEY , dbo.Data0022.SOURCE_PTR ,dbo.Data' +
      '0022.INVENTORY_PTR, dbo.Data0017.INV_PART_NUMBER,'#13#10'            d' +
      'bo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION, dbo.Data0023' +
      '.CODE, dbo.Data0023.SUPPLIER_NAME,data0023.rkey as rkey23,'#13#10'    ' +
      '        dbo.Data0023.CONTACT_NAME_1,dbo.Data0023.BILLING_ADDRESS' +
      '_1, dbo.Data0456.ship_DATE, dbo.Data0022.PRICE, '#13#10'           dbo' +
      '.Data0015.WAREHOUSE_CODE,dbo.Data0015.WAREHOUSE_NAME,dbo.Data002' +
      '2.QUAN_TO_BE_SHIPPED, dbo.Data0022.QUAN_RETURNED,  '#13#10'           ' +
      'dbo.Data0456.TTYPE, dbo.Data0022.QUANTITY, dbo.Data0002.UNIT_NAM' +
      'E, dbo.Data0022.rohs, dbo.Data0022.SUPPLIER2,'#13#10'           dbo.Da' +
      'ta0022.QUAN_ON_HAND, dbo.Data0096.RKEY as rkey96, dbo.Data0096.I' +
      'NVT_PTR, dbo.Data0096.REJ_PTR,dbo.Data0022.BARCODE_ID, '#13#10'       ' +
      '    dbo.Data0096.INV_TRAN_PTR, dbo.Data0096.EMPL_PTR, dbo.Data00' +
      '96.USER_PTR, dbo.Data0096.TDATE, dbo.Data0096.QUAN_REJD, '#13#10'     ' +
      '      dbo.Data0096.FLAG, dbo.Data0096.REFERENCE_NUMBER, d05.rkey' +
      ' as rkey5, d05.EMPL_CODE,data0070.PO_NUMBER,'#13#10'           case db' +
      'o.Data0096.status when '#39'1'#39' then '#39#24050#35013#36816#39' when '#39'0'#39' then '#39#26410#35013#36816#39' end  a' +
      's '#39'v_state'#39','#13#10'           d05.EMPLOYEE_NAME as ename ,dbo.Data007' +
      '6.reject_description,d05_1.rkey as rkey56, d05_1.EMPL_CODE,'#13#10'   ' +
      '        d05_1.EMPLOYEE_NAME as uname,dbo.Data0096.TRAN_DATE,dbo.' +
      'Data0096.SHIPPING_METHOD,'#13#10'           dbo.Data0017.rkey as key17' +
      ',dbo.data0076.rkey as rkey76,Data0022.tax_price AS t_price,data0' +
      '015.rkey as rkey15,'#13#10'           Data0022.tax_price*Data0096.QUAN' +
      '_REJD as tax_amount,Data0022.TAX_2,dbo.Data0456.exch_rate,'#13#10'    ' +
      '       Data0001.RKEY as rkey1,Data0001.CURR_CODE,Data0001.CURR_N' +
      'AME,dbo.Data0015.ABBR_NAME,dbo.Data0016.LOCATION'#13#10'FROM        db' +
      'o.Data0096    INNER JOIN'#13#10'            dbo.Data0005 AS d05  ON d0' +
      '5.RKEY = dbo.Data0096.EMPL_PTR INNER JOIN'#13#10'              dbo.Dat' +
      'a0076 ON dbo.Data0096.REJ_PTR = dbo.Data0076.RKEY INNER JOIN'#13#10'  ' +
      '            dbo.Data0022 ON dbo.Data0096.INV_TRAN_PTR = dbo.Data' +
      '0022.RKEY  INNER JOIN '#13#10'              dbo.Data0456 ON dbo.Data00' +
      '22.GRN_PTR = dbo.Data0456.RKEY INNER JOIN'#13#10'              dbo.Dat' +
      'a0017 ON dbo.Data0022.INVENTORY_PTR = dbo.Data0017.RKEY INNER JO' +
      'IN'#13#10'              dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Da' +
      'ta0023.RKEY INNER JOIN'#13#10'              dbo.Data0015 ON dbo.Data04' +
      '56.warehouse_ptr = dbo.Data0015.RKEY INNER JOIN'#13#10'              d' +
      'bo.Data0002 ON dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0002.RKE' +
      'Y  INNER JOIN'#13#10'              dbo.Data0016 ON dbo.Data0022.LOCATI' +
      'ON_PTR = dbo.Data0016.RKEY inner  JOIN   '#13#10'              dbo.Dat' +
      'a0001 ON dbo.Data0456.currency_ptr = dbo.Data0001.RKEY LEFT OUTE' +
      'R JOIN'#13#10'              dbo.Data0005 AS d05_1 ON dbo.Data0096.USER' +
      '_PTR = d05_1.RKEY  left join'#13#10'              dbo.Data0070 ON data' +
      '0456.PO_PTR=data0070.rkey'#13#10'where 1=1'#13#10
    ProviderName = 'DataSetProvider1'
    object cdsMainINV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object cdsMainINV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object cdsMainINV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object cdsMainSUPPLIER_NAME: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object cdsMainQUAN_TO_BE_SHIPPED: TFMTBCDField
      DisplayLabel = #26448#26009#36864#36135#24453#35013#36816#24635#25968#37327
      FieldName = 'QUAN_TO_BE_SHIPPED'
      Precision = 18
      Size = 6
    end
    object cdsMainQUAN_REJD: TFloatField
      DisplayLabel = #26412#27425#36864#36135#24453#35013#36816#25968#37327
      FieldName = 'QUAN_REJD'
    end
    object cdsMainUNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object cdsMainv_state: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'v_state'
      ReadOnly = True
      Size = 6
    end
    object cdsMainrohs: TStringField
      DisplayLabel = #29615#20445#26631#35782
      FieldName = 'rohs'
      Size = 10
    end
    object cdsMaint_price: TBCDField
      DisplayLabel = #25509#25910#21333#20215'('#21547#31246')'
      FieldName = 't_price'
      Precision = 13
    end
    object cdsMaintax_amount: TFloatField
      DisplayLabel = #21547#31246#24635#37329#39069
      FieldName = 'tax_amount'
      ReadOnly = True
    end
    object cdsMainTAX_2: TBCDField
      DisplayLabel = #31246#29575'%'
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object cdsMainexch_rate: TFMTBCDField
      DisplayLabel = #27719#29575
      FieldName = 'exch_rate'
      Precision = 12
    end
    object cdsMainCURR_NAME: TStringField
      DisplayLabel = #36135#24065
      FieldName = 'CURR_NAME'
    end
    object cdsMainPO_NUMBER: TStringField
      DisplayLabel = #37319#36141#35746#21333#21495
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object cdsMainename: TStringField
      DisplayLabel = #36864#36135#20154#21592
      FieldName = 'ename'
      Size = 16
    end
    object cdsMainuname: TStringField
      DisplayLabel = #35013#36816#20154#21592
      FieldName = 'uname'
      Size = 16
    end
    object cdsMainTDATE: TDateTimeField
      DisplayLabel = #36864#36135#26085#26399
      FieldName = 'TDATE'
    end
    object cdsMainTRAN_DATE: TDateTimeField
      DisplayLabel = #35013#36816#26085#26399
      FieldName = 'TRAN_DATE'
    end
    object cdsMainSHIPPING_METHOD: TWideStringField
      DisplayLabel = #35013#36816#26041#27861
      FieldName = 'SHIPPING_METHOD'
    end
    object cdsMainreject_description: TStringField
      DisplayLabel = #36864#36135#21407#22240
      FieldName = 'reject_description'
      Size = 30
    end
    object cdsMainREFERENCE_NUMBER: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REFERENCE_NUMBER'
      FixedChar = True
    end
    object cdsMainSOURCE_PTR: TIntegerField
      FieldName = 'SOURCE_PTR'
    end
    object cdsMainINVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object cdsMainCONTACT_NAME_1: TStringField
      FieldName = 'CONTACT_NAME_1'
    end
    object cdsMainBILLING_ADDRESS_1: TStringField
      FieldName = 'BILLING_ADDRESS_1'
      Size = 100
    end
    object cdsMainship_DATE: TDateTimeField
      FieldName = 'ship_DATE'
    end
    object cdsMainCODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object cdsMainPRICE: TFMTBCDField
      FieldName = 'PRICE'
      Precision = 15
      Size = 6
    end
    object cdsMainWAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object cdsMainWAREHOUSE_NAME: TStringField
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
    object cdsMainRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object cdsMainQUAN_RETURNED: TFMTBCDField
      FieldName = 'QUAN_RETURNED'
      Precision = 18
      Size = 6
    end
    object cdsMainBARCODE_ID: TStringField
      FieldName = 'BARCODE_ID'
      Size = 50
    end
    object cdsMainTTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object cdsMainQUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
    object cdsMainSUPPLIER2: TStringField
      FieldName = 'SUPPLIER2'
      Size = 30
    end
    object cdsMainQUAN_ON_HAND: TBCDField
      FieldName = 'QUAN_ON_HAND'
      Precision = 19
    end
    object cdsMainrkey96: TAutoIncField
      FieldName = 'rkey96'
      ReadOnly = True
    end
    object cdsMainINVT_PTR: TIntegerField
      FieldName = 'INVT_PTR'
    end
    object cdsMainREJ_PTR: TIntegerField
      FieldName = 'REJ_PTR'
    end
    object cdsMainINV_TRAN_PTR: TIntegerField
      FieldName = 'INV_TRAN_PTR'
    end
    object cdsMainEMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
    end
    object cdsMainUSER_PTR: TIntegerField
      FieldName = 'USER_PTR'
    end
    object cdsMainFLAG: TStringField
      FieldName = 'FLAG'
      FixedChar = True
      Size = 1
    end
    object cdsMainrkey5: TAutoIncField
      FieldName = 'rkey5'
      ReadOnly = True
    end
    object cdsMainEMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object cdsMainrkey56: TAutoIncField
      FieldName = 'rkey56'
      ReadOnly = True
    end
    object cdsMainEMPL_CODE_1: TStringField
      FieldName = 'EMPL_CODE_1'
      Size = 10
    end
    object cdsMainkey17: TAutoIncField
      FieldName = 'key17'
      ReadOnly = True
    end
    object cdsMainrkey76: TAutoIncField
      FieldName = 'rkey76'
      ReadOnly = True
    end
    object cdsMainrkey1: TAutoIncField
      FieldName = 'rkey1'
      ReadOnly = True
    end
    object cdsMainCURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object cdsMainABBR_NAME: TStringField
      DisplayLabel = #24037#21378#21517#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object cdsMainLOCATION: TStringField
      DisplayLabel = #20179#24211#20301#32622
      FieldName = 'LOCATION'
    end
    object cdsMainrkey23: TAutoIncField
      FieldName = 'rkey23'
      ReadOnly = True
    end
    object cdsMainrkey15: TAutoIncField
      FieldName = 'rkey15'
      ReadOnly = True
    end
  end
  inherited pmMain: TPopupMenu
    OnPopup = pmMainPopup
    Left = 120
    Top = 200
    object N1: TMenuItem
      Caption = #35013#36816
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #21462#28040#35013#36816
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #25171#21360
      OnClick = N3Click
    end
  end
end
