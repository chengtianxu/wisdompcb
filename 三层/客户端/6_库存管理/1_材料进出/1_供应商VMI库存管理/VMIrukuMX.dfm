inherited frmVMIrukuMX: TfrmVMIrukuMX
  Caption = #26448#26009'VMI'#20837#24211#26126#32454
  ClientHeight = 398
  ClientWidth = 820
  ExplicitTop = -31
  ExplicitWidth = 836
  ExplicitHeight = 437
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 820
    Height = 398
    ExplicitWidth = 820
    ExplicitHeight = 398
    inherited pnlDisplayMain: TPanel
      Width = 820
      Height = 398
      ExplicitWidth = 820
      ExplicitHeight = 398
      inherited pnlChildMain: TPanel
        Width = 818
        Height = 396
        ExplicitWidth = 818
        ExplicitHeight = 396
        inherited pnlEhMainDisplay: TPanel
          Width = 816
          Height = 365
          ExplicitWidth = 816
          ExplicitHeight = 365
          inherited ehMain: TDBGridEh
            Width = 814
            Height = 363
            FooterRowCount = 1
            SumList.Active = True
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'GRN_NUMBER'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20837#24211#21333#21495
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ttypes'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20837#24211#31867#22411
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_PART_NUMBER'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #26448#26009#32534#30721
                Width = 105
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_NAME'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #26448#26009#21517#31216
                Width = 112
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_DESCRIPTION'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #26448#26009#35268#26684
                Width = 83
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'GROUP_NAME'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #26448#26009#31867#21035
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'QUANTITY'
                Footer.FieldName = 'QUANTITY'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #25509#25910#25968#37327
                Width = 81
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'inv_group_name'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #26448#26009#32452#21035
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'QUAN_ON_HAND'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #29616#25345#26377#25968#37327
                Width = 67
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'WAREHOUSE_CODE'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #24037#21378
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CODE'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20379#24212#21830#20195#30721
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ABBR_NAME'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20379#24212#21830#21517#31216
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PO_NUMBER'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #37319#36141#35746#21333#21495
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CURR_CODE'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #36135#24065#20195#30721
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'TAX_2'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #31246#29575
                Visible = False
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'tax_PRICE'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #21547#31246#20215
                Visible = False
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PRICE'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #19981#21547#31246#20215
                Visible = False
                Width = 70
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'olemoney'
                Footer.FieldName = 'olemoney'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #21407#24065#21547#31246#37329#39069#58754
                Visible = False
                Width = 88
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'olemoneys'
                Footer.FieldName = 'olemoneys'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #21407#24065#19981#21547#31246#37329#39069
                Visible = False
                Width = 99
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'LOCATION'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20179#24211
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'UNIT_NAME'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #21333#20301
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'EMPLOYEE_NAME'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #21019#24314#20154
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ship_DATE'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #36865#36135#26085#26399
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'deliver_number'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #36865#36135#21333#21495
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'BARCODE_ID'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #29305#21035#35201#27714
                Width = 113
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'rohs'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #29615#20445
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'SUPPLIER2'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #35814#32454#20301#32622
                Width = 158
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'EXPIRE_DATE'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #26377#25928#26399
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'EMPLOYEE_NAME2'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = 'IQC'#26816#26597#20154#21592
                Visible = False
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PRINTED_DATE'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = 'IQC'#26816#26597#26102#38388
                Visible = False
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'cust_decl'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #25253#20851#21333#21495
                Width = 90
              end>
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 816
          ExplicitWidth = 816
          inherited btnRefresh: TBitBtn
            Visible = False
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
      'SELECT  Data0133.GRN_NUMBER, '#13#10'      case when data0133.ttype=1 ' +
      'then '#39#25353'PO'#20837#24211#39#13#10'               when data0133.ttype=3  then '#39#30452#25509#20837#24211#39' ' +
      'end ttypes,'#13#10'      Data0017.INV_PART_NUMBER, Data0017.INV_NAME,'#13 +
      #10'      Data0017.INV_DESCRIPTION, Data0496.GROUP_NAME,data0019.in' +
      'v_group_name,'#13#10'      Data0015.WAREHOUSE_CODE, Data0070.PO_NUMBER' +
      ',Data0023.CODE ,'#13#10'      Data0023.ABBR_NAME, Data0134.QUANTITY,'#13#10 +
      '      Data0134.QUAN_ON_HAND, ROUND(dbo.Data0134.QUANTITY * dbo.D' +
      'ata0134.tax_price, 2) AS olemoney,'#13#10'      Round(dbo.Data0134.QUA' +
      'NTITY * dbo.Data0134.price, 2) AS olemoneys,'#13#10'      Data0001.CUR' +
      'R_CODE,Data0134.TAX_2, Data0134.tax_PRICE,Data0134.PRICE,Data000' +
      '2.UNIT_NAME,'#13#10'      Data0005_1.EMPLOYEE_NAME ,data0133.deliver_n' +
      'umber,'#13#10'      Data0016.LOCATION, Data0016.code,Data0133.ship_DAT' +
      'E, Data0134.SUPPLIER2,'#13#10'      Data0134.rohs, Data0134.BARCODE_ID' +
      ',Data0134.EXPIRE_DATE,'#13#10'      Data0134.cust_decl,Data0005.EMPLOY' +
      'EE_NAME, Data0071.PRINTED_DATE'#13#10'FROM dbo.Data0002 INNER JOIN'#13#10'  ' +
      '    dbo.Data0023 INNER JOIN'#13#10'      dbo.Data0019 INNER JOIN'#13#10'    ' +
      '  dbo.Data0134 INNER JOIN'#13#10'      dbo.Data0133 ON dbo.Data0134.GR' +
      'N_PTR = dbo.Data0133.RKEY INNER JOIN'#13#10'      dbo.Data0017 ON dbo.' +
      'Data0134.INVENTORY_PTR = dbo.Data0017.RKEY INNER JOIN'#13#10'      dbo' +
      '.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY ON '#13#10'   ' +
      '   dbo.Data0019.rkey = dbo.Data0496.group_ptr INNER JOIN'#13#10'      ' +
      'dbo.Data0005 as data0005_1 ON dbo.Data0133.CREATE_BY = Data0005_' +
      '1.RKEY ON '#13#10'      dbo.Data0023.RKEY = dbo.Data0133.SUPP_PTR ON '#13 +
      #10'      dbo.Data0002.RKEY = dbo.Data0134.UNIT_PTR INNER JOIN'#13#10'   ' +
      '   dbo.Data0015 ON dbo.Data0133.warehouse_ptr = dbo.Data0015.RKE' +
      'Y INNER JOIN'#13#10'      dbo.Data0016 ON dbo.Data0134.LOCATION_PTR = ' +
      'dbo.Data0016.RKEY INNER JOIN'#13#10'      dbo.Data0001 ON dbo.Data0133' +
      '.currency_ptr = dbo.Data0001.RKEY LEFT OUTER JOIN'#13#10'      dbo.Dat' +
      'a0005  INNER JOIN'#13#10'      dbo.Data0071 ON dbo.Data0005.RKEY = dbo' +
      '.Data0071.IQCEMPL_PTR ON dbo.Data0134.SOURCE_PTR = dbo.Data0071.' +
      'RKEY LEFT OUTER JOIN'#13#10'      dbo.Data0005 as data0005_2 RIGHT OUT' +
      'ER JOIN'#13#10'      dbo.Data0070 ON Data0005_2.RKEY = dbo.Data0070.EM' +
      'PLOYEE_POINTER ON dbo.Data0133.PO_PTR = dbo.Data0070.RKEY'#13#10'WHERE' +
      ' (dbo.Data0134.QUANTITY > 0)'#13#10
  end
  inherited pmZD: TPopupMenu
    OnPopup = pmZDPopup
  end
end
