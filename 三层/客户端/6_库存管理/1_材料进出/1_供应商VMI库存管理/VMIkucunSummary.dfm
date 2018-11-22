inherited frmVMIkucunSummary: TfrmVMIkucunSummary
  Caption = #26448#26009#24211#23384#27719#24635
  ClientHeight = 450
  ClientWidth = 965
  ExplicitWidth = 973
  ExplicitHeight = 477
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 965
    Height = 450
    ExplicitWidth = 965
    ExplicitHeight = 450
    inherited pnlDisplayMain: TPanel
      Width = 965
      Height = 450
      ExplicitWidth = 965
      ExplicitHeight = 450
      inherited pnlChildMain: TPanel
        Width = 963
        Height = 448
        ExplicitWidth = 963
        ExplicitHeight = 448
        inherited pnlEhMainDisplay: TPanel
          Width = 961
          Height = 417
          ExplicitWidth = 961
          ExplicitHeight = 417
          inherited ehMain: TDBGridEh
            Width = 959
            Height = 415
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'inv_group_name'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #26448#26009#32452#21035
                Width = 55
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_PART_NUMBER'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #26448#26009#32534#30721
                Width = 115
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_NAME'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #26448#26009#21517#31216
                Width = 120
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
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ABBR_NAME23'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20379#24212#21830
                Width = 80
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'supplier2'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #21407#21046#36896#21830
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'quan_total'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #24211#23384#25968#37327
                Width = 65
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'avl_price'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #24179#22343#20215#26684
                Width = 70
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'amount'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #37329#39069'('#26412#24065#21547#31246')'
                Width = 80
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'amount_notax'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #37329#39069'('#26412#24065#19981#21547#31246')'
                Width = 90
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'UNIT_CODE'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #23384#36135#21333#20301
                Width = 55
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CONSIGN_ONHAND_QTY'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #23433#20840#24211#23384
                Width = 52
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'STOCK_SELL'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #21333#20301#38754#31215
                Width = 80
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'total_area'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #24211#23384#38754#31215
                Width = 80
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'location'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20179#24211
                Width = 60
              end>
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 961
          ExplicitWidth = 961
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
      'SELECT Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME,'#13#10'      d' +
      'bo.Data0017.INV_DESCRIPTION, dbo.Data0496.GROUP_NAME,Data0016.lo' +
      'cation,'#13#10'      SUM(Data0134.QUAN_ON_HAND) AS quan_total,'#13#10'ROUND(' +
      'avg(Data0134.tax_PRICE * Data0133.exch_rate), 4) AS avl_price,'#13#10 +
      'ROUND(SUM(Data0134.QUAN_ON_HAND * Data0134.tax_PRICE * Data0133.' +
      'exch_rate),4) AS amount,'#13#10'ROUND(SUM(Data0134.QUAN_ON_HAND * Data' +
      '0134.PRICE * Data0133.exch_rate),4) AS amount_notax,'#13#10'Data0002.U' +
      'NIT_CODE,Data0134.supplier2,'#13#10'Data0023.ABBR_NAME AS ABBR_NAME23,' +
      'Data0019.inv_group_name,'#13#10' Data0017.STOCK_SELL,'#13#10'ROUND(SUM(Data0' +
      '134.QUAN_ON_HAND * Data0017.STOCK_SELL ), 4) AS total_area,'#13#10'dat' +
      'a0017.QUAN_ON_HAND,data0017.CONSIGN_ONHAND_QTY'#13#10'FROM dbo.Data013' +
      '4 INNER JOIN'#13#10'      dbo.Data0017 ON dbo.Data0134.INVENTORY_PTR =' +
      ' dbo.Data0017.RKEY INNER JOIN'#13#10'      dbo.Data0496 ON dbo.Data001' +
      '7.GROUP_PTR = dbo.Data0496.RKEY INNER JOIN'#13#10'      dbo.Data0019 O' +
      'N dbo.Data0496.group_ptr = dbo.Data0019.rkey INNER JOIN'#13#10'      d' +
      'bo.Data0002 ON'#13#10'      dbo.Data0134.UNIT_PTR = dbo.Data0002.RKEY ' +
      'INNER JOIN'#13#10'      dbo.Data0133 ON dbo.Data0134.GRN_PTR = dbo.Dat' +
      'a0133.RKEY INNER JOIN'#13#10'      dbo.Data0023 ON dbo.Data0133.SUPP_P' +
      'TR = dbo.Data0023.RKEY INNER JOIN'#13#10'      dbo.Data0016 ON dbo.Dat' +
      'a0134.LOCATION_PTR = dbo.Data0016.RKEY INNER JOIN'#13#10'      dbo.Dat' +
      'a0015 ON dbo.Data0133.warehouse_ptr = dbo.Data0015.RKEY'#13#10'where 1' +
      '=1'#13#10
  end
end
