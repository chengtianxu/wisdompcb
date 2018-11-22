inherited frmVMIjieshuSummary: TfrmVMIjieshuSummary
  Caption = #26448#26009#25130#25968#27719#24635
  ClientHeight = 490
  ClientWidth = 1102
  WindowState = wsMaximized
  ExplicitWidth = 1110
  ExplicitHeight = 517
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 1102
    Height = 490
    ExplicitWidth = 480
    ExplicitHeight = 254
    inherited pnlDisplayMain: TPanel
      Width = 1102
      Height = 490
      ExplicitWidth = 480
      ExplicitHeight = 254
      inherited pnlChildMain: TPanel
        Width = 1100
        Height = 488
        ExplicitWidth = 478
        ExplicitHeight = 252
        inherited pnlEhMainDisplay: TPanel
          Width = 1098
          Height = 457
          ExplicitWidth = 476
          ExplicitHeight = 221
          inherited ehMain: TDBGridEh
            Width = 1096
            Height = 455
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_PART_NUMBER'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #26448#26009#32534#30721
                Width = 140
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
                FieldName = 'INV_NAME'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #26448#26009#21517#31216
                Width = 140
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_DESCRIPTION'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #26448#26009#35268#26684
                Width = 200
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ABBR_NAME23'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20379#24212#21830
                Width = 120
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'code'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20379#24212#21830#20195#30721
                Width = 65
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'quan_total'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #24211#23384#24635#25968
                Width = 70
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'avl_price'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #24179#22343#20215#26684'('#21547#31246')'
                Width = 100
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'amount'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #37329#39069'('#26412#24065#21547#31246')'
                Width = 140
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'amount_notax'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #37329#39069'('#26412#24065#19981#21547#31246')'
                Width = 140
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'UNIT_CODE'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #23384#36135#21333#20301
                Width = 60
              end>
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 1098
          ExplicitWidth = 476
          inherited lblFilter: TLabel
            Visible = False
          end
          inherited btnRefresh: TBitBtn
            Visible = False
          end
          inherited btnQry: TBitBtn
            Visible = False
          end
          inherited btnZD: TBitBtn
            Visible = False
          end
          inherited edtFliter: TEdit
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
      'bo.Data0017.INV_DESCRIPTION, dbo.Data0496.GROUP_NAME,'#13#10'      SUM' +
      '(Data0172.QUAN_ON_HAND) AS quan_total,'#13#10'ROUND(avg(Data0134.tax_P' +
      'RICE * Data0133.exch_rate), 4) AS avl_price,'#13#10'ROUND(SUM(Data0172' +
      '.QUAN_ON_HAND * Data0134.tax_PRICE * Data0133.exch_rate),4) AS a' +
      'mount,'#13#10'ROUND(SUM(Data0172.QUAN_ON_HAND * Data0134.PRICE * Data0' +
      '133.exch_rate),4) AS amount_notax,'#13#10'Data0002.UNIT_CODE,'#13#10'Data002' +
      '3.ABBR_NAME AS ABBR_NAME23,Data0023.code,Data0019.inv_group_name' +
      #13#10'FROM dbo.Data0172 INNER JOIN'#13#10'dbo.Data0134 ON dbo.Data0172.d01' +
      '34_ptr=dbo.Data0134.rkey INNER JOIN'#13#10'dbo.Data0171 ON dbo.Data017' +
      '2.header_ptr=dbo.Data0171.rkey INNER JOIN   '#13#10'dbo.Data0017 ON db' +
      'o.Data0134.INVENTORY_PTR = dbo.Data0017.RKEY INNER JOIN'#13#10'dbo.Dat' +
      'a0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY INNER JOIN'#13#10 +
      'dbo.Data0019 ON dbo.Data0496.group_ptr = dbo.Data0019.rkey INNER' +
      ' JOIN'#13#10'dbo.Data0002 ON'#13#10'dbo.Data0134.UNIT_PTR = dbo.Data0002.RKE' +
      'Y INNER JOIN'#13#10'dbo.Data0133 ON dbo.Data0134.GRN_PTR = dbo.Data013' +
      '3.RKEY INNER JOIN'#13#10'dbo.Data0023 ON dbo.Data0133.SUPP_PTR = dbo.D' +
      'ata0023.RKEY INNER JOIN'#13#10'dbo.Data0016 ON dbo.Data0134.LOCATION_P' +
      'TR = dbo.Data0016.RKEY INNER JOIN'#13#10'dbo.Data0015 ON dbo.Data0133.' +
      'warehouse_ptr = dbo.Data0015.RKEY'#13#10' where 1=1'
  end
end
