inherited frmMVIkucunMX: TfrmMVIkucunMX
  Caption = #26448#26009'VMI'#24211#23384#26126#32454
  ClientHeight = 439
  ClientWidth = 950
  ExplicitWidth = 958
  ExplicitHeight = 466
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 950
    Height = 439
    ExplicitWidth = 950
    ExplicitHeight = 439
    inherited pnlDisplayMain: TPanel
      Width = 950
      Height = 439
      ExplicitWidth = 950
      ExplicitHeight = 439
      inherited pnlChildMain: TPanel
        Width = 948
        Height = 437
        ExplicitWidth = 948
        ExplicitHeight = 437
        inherited pnlEhMainDisplay: TPanel
          Width = 946
          Height = 406
          ExplicitWidth = 946
          ExplicitHeight = 406
          inherited ehMain: TDBGridEh
            Width = 944
            Height = 404
            FooterRowCount = 1
            SumList.Active = True
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_PART_NUMBER'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #26448#26009#32534#30721
                Width = 120
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_NAME'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #26448#26009#21517#31216
                Width = 130
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_DESCRIPTION'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #26448#26009#35268#26684
                Width = 150
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'GROUP_NAME'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #26448#26009#31867#21035
                Width = 65
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'inv_group_name'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #26448#26009#32452#21035
                Width = 65
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'po_number'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #37319#36141#35746#21333
                Width = 90
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'code23'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20379#24212#21830#20195#30721
                Width = 65
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'name23'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20379#24212#21830#31616#31216
                Width = 65
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'QUAN_ON_HAND'
                Footer.FieldName = 'QUAN_ON_HAND'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #24211#23384#25968#37327
                Width = 65
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CURR_CODE'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #36135#24065#20195#30721
                Width = 55
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'tax_price'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #21547#31246#20215#26684
                Visible = False
                Width = 70
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'TAX_2'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #31246#29575
                Visible = False
                Width = 40
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'amount_tax'
                Footer.FieldName = 'amount_tax'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #21547#31246#37329#39069'('#26412#20301#24065')'
                Visible = False
                Width = 100
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'amount_notax'
                Footer.FieldName = 'amount_notax'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #19981#21547#31246#37329#39069'('#26412#20301#24065')'
                Visible = False
                Width = 110
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'LOCATION'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20179#24211
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'UNIT_NAME'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #21333#20301
                Width = 40
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'GRN_NUMBER'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20837#24211#21333#21495
                Width = 70
              end
              item
                DisplayFormat = 'yyyy-MM-dd'
                DynProps = <>
                EditButtons = <>
                FieldName = 'EXPIRE_DATE'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #26377#25928#26399
                Width = 90
              end
              item
                DisplayFormat = 'yyyy-MM-dd'
                DynProps = <>
                EditButtons = <>
                FieldName = 'manu_date'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #21046#36896#26085#26399
                Width = 90
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'BARCODE_ID'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #29305#21035#35201#27714
                Width = 80
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'SUPPLIER2'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #35814#32454#20301#32622
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'WAREHOUSE_CODE'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #24037#21378
                Width = 40
              end
              item
                DisplayFormat = 'yyyy-MM-dd'
                DynProps = <>
                EditButtons = <>
                FieldName = 'ship_DATE'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #36865#36135#26085#26399
                Width = 90
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'rohs'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #29615#20445
                Width = 40
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'exch_rate'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #27719#29575
                Width = 40
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'cust_decl'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #25253#20851#21333#21495
                Width = 70
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'reason'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #35831#36141#21407#22240
                Width = 80
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CONSIGN_ONHAND_QTY'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #23433#20840#24211#23384#25968
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'employee_name'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #26448#26009#25509#25910#20154
                Width = 65
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = #35831#36141#20154#21592
                Footers = <>
                Title.Alignment = taCenter
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = #35831#36141#37096#38376
                Footers = <>
                Title.Alignment = taCenter
                Width = 60
              end>
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 946
          ExplicitWidth = 946
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
      'SELECT Data0017.INV_PART_NUMBER, Data0017.INV_NAME,Data0017.CONS' +
      'IGN_ONHAND_QTY,'#13#10'      Data0017.INV_DESCRIPTION, Data0496.GROUP_' +
      'NAME, data0019.inv_group_name, DATEDIFF(day, GETDATE(),'#13#10'  dbo.D' +
      'ata0134.EXPIRE_DATE) AS eff_day,'#13#10'      Data0023.ABBR_NAME AS na' +
      'me23,Data0023.code as code23, Data0134.QUAN_ON_HAND, '#13#10'      Dat' +
      'a0001.CURR_CODE, Data0134.tax_price, Data0016.LOCATION, '#13#10'      ' +
      'Data0002.UNIT_NAME, Data0134.EXPIRE_DATE, Data0134.BARCODE_ID, '#13 +
      #10'      ROUND(dbo.Data0134.PRICE * dbo.Data0133.exch_rate, 4) AS ' +
      'L_no_taxprice, dbo.Data0134.tax_price * dbo.Data0133.exch_rate A' +
      'S L_tax_price,'#13#10'      ROUND(dbo.Data0134.PRICE * dbo.Data0133.ex' +
      'ch_rate * dbo.Data0134.QUAN_ON_HAND, 4) AS amount_notax,'#13#10'      ' +
      'Data0134.TAX_2, Data0133.GRN_NUMBER, dbo.Data0134.tax_price * db' +
      'o.Data0133.exch_rate * dbo.Data0134.QUAN_ON_HAND AS amount_tax,'#13 +
      #10'      Data0015.WAREHOUSE_CODE, Data0133.ship_DATE, Data0134.roh' +
      's, data0134.cust_decl,'#13#10'      Data0134.SUPPLIER2, Data0133.exch_' +
      'rate,data0070.po_number,Data0134.rkey as rkey134,'#13#10'      Data013' +
      '4.manu_date,data0071.reason,Data0005.employee_name,D05_1.EMPLOYE' +
      'E_NAME as '#35831#36141#20154#21592',Data0034.DEPT_NAME  as '#35831#36141#37096#38376#13#10'FROM '#13#10'data0134 '#13#10'  ' +
      '  inner join data0017 on Data0134.INVENTORY_PTR = Data0017.RKEY ' +
      'INNER JOIN'#13#10'   Data0496 ON Data0017.GROUP_PTR = Data0496.RKEY IN' +
      'NER JOIN'#13#10'   data0133 ON Data0133.RKEY = Data0134.GRN_PTR INNER ' +
      'JOIN'#13#10'   Data0002 ON Data0134.UNIT_PTR = Data0002.RKEY INNER JOI' +
      'N'#13#10'   data0023 ON Data0023.RKEY = Data0133.SUPP_PTR INNER JOIN'#13#10 +
      '   Data0016 ON Data0134.LOCATION_PTR = Data0016.RKEY INNER JOIN'#13 +
      #10'   data0015 ON Data0015.RKEY = Data0133.warehouse_ptr INNER JOI' +
      'N'#13#10'   Data0001 ON Data0133.currency_ptr = Data0001.RKEY INNER JO' +
      'IN'#13#10'   Data0005 ON Data0133.CREATE_BY = Data0005.RKEY INNER JOIN' +
      #13#10'  data0019 on data0496.group_ptr=data0019.rkey left outer join' +
      ' '#13#10'  data0070 on data0133.po_ptr=data0070.rkey left outer join '#13 +
      #10'  data0071 on data0134.SOURCE_PTR=data0071.rkey left outer join' +
      #13#10'  data0069 on data0071.rkey69=data0069.rkey left outer join'#13#10' ' +
      ' data0068 ON Data0068.RKEY = data0069.PURCH_REQ_PTR left outer j' +
      'oin'#13#10'  data0005 D05_1 ON Data0068.REQ_BY = D05_1.RKEY left outer' +
      ' join'#13#10'  data0034 ON Data0068.DEPARTMENT_NAME = dbo.Data0034.DEP' +
      'T_CODE  '#13#10' WHERE (Data0134.QUAN_ON_HAND > 0)'
  end
  inherited pmZD: TPopupMenu
    OnPopup = pmZDPopup
  end
end
