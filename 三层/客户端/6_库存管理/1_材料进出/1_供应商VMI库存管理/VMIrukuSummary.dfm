inherited frmVMIrukuSummary: TfrmVMIrukuSummary
  Caption = #20837#24211#27719#24635#26597#35810
  ClientHeight = 423
  ClientWidth = 801
  ExplicitWidth = 809
  ExplicitHeight = 450
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 801
    Height = 423
    ExplicitWidth = 801
    ExplicitHeight = 423
    inherited pnlDisplayMain: TPanel
      Width = 801
      Height = 423
      ExplicitWidth = 801
      ExplicitHeight = 423
      inherited pnlChildMain: TPanel
        Width = 799
        Height = 421
        ExplicitWidth = 799
        ExplicitHeight = 421
        inherited pnlEhMainDisplay: TPanel
          Width = 797
          Height = 390
          ExplicitWidth = 797
          ExplicitHeight = 390
          inherited ehMain: TDBGridEh
            Width = 795
            Height = 388
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'inv_group_name'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #26448#26009#32452#21035
                Width = 80
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_PART_NUMBER'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #26448#26009#32534#30721
                Width = 134
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_NAME'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #26448#26009#21517#31216
                Width = 150
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
                FieldName = 'UNIT_NAME'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #21333#20301
                Width = 40
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'GROUP_DESC'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #26448#26009#31867#21035
                Width = 80
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ABBR_NAME'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20379#24212#21830
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'total_received'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #25509#25910#25968#37327
                Width = 65
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'std_price'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #37329#39069'('#26412#24065#21547#31246')'
                Width = 94
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'std_notaxprice'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #37329#39069'('#26412#24065#19981#21547#31246')'
                Width = 110
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
                Title.Caption = #25509#25910#38754#31215
                Width = 80
              end>
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 797
          ExplicitWidth = 797
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
      'bo.Data0017.INV_DESCRIPTION, dbo.Data0002.UNIT_NAME, '#13#10'      dbo' +
      '.Data0496.GROUP_DESC, dbo.Data0023.ABBR_NAME, '#13#10'      SUM(dbo.Da' +
      'ta0134.QUANTITY ) AS total_received, '#13#10'ROUND(SUM(Data0134.QUANTI' +
      'TY * Data0134.tax_PRICE * Data0133.EXCH_RATE), 3)'#13#10'             ' +
      '                          AS std_price,'#13#10'ROUND(SUM(Data0134.QUAN' +
      'TITY * Data0134.tax_PRICE * Data0133.EXCH_RATE/'#13#10'          (1+Da' +
      'ta0134.tax_2*0.01)), 3) AS std_notaxprice,'#13#10'      data0019.inv_g' +
      'roup_name, Data0017.STOCK_SELL,dbo.Data0016.code,'#13#10'ROUND(SUM(Dat' +
      'a0134.QUANTITY * Data0017.STOCK_SELL), 4) AS total_area'#13#10'FROM db' +
      'o.Data0133 INNER JOIN'#13#10'      dbo.data0019 INNER JOIN'#13#10'      dbo.' +
      'Data0134 INNER JOIN'#13#10'      dbo.Data0017 INNER JOIN'#13#10'      dbo.Da' +
      'ta0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY ON'#13#10'      d' +
      'bo.Data0134.INVENTORY_PTR = dbo.Data0017.RKEY ON'#13#10'      dbo.data' +
      '0019.rkey = dbo.Data0496.GROUP_PTR ON'#13#10'      dbo.Data0133.RKEY =' +
      ' dbo.Data0134.GRN_PTR INNER JOIN'#13#10'      dbo.Data0023 ON dbo.Data' +
      '0133.SUPP_PTR = dbo.Data0023.RKEY INNER JOIN'#13#10'      dbo.Data0002' +
      ' ON dbo.Data0134.UNIT_PTR = dbo.Data0002.RKEY inner join'#13#10'     d' +
      'bo.Data0016 ON dbo.Data0134.LOCATION_PTR = dbo.Data0016.RKEY '#13#10'W' +
      'HERE (dbo.Data0134.QUANTITY <> 0)'#13#10
  end
end
