inherited frmVMIchukuSummary: TfrmVMIchukuSummary
  Caption = #26448#26009#20986#24211#27719#24635
  ClientHeight = 436
  ClientWidth = 907
  ExplicitWidth = 915
  ExplicitHeight = 463
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 907
    Height = 436
    ExplicitWidth = 480
    ExplicitHeight = 254
    inherited pnlDisplayMain: TPanel
      Width = 907
      Height = 436
      ExplicitWidth = 480
      ExplicitHeight = 254
      inherited pnlChildMain: TPanel
        Width = 905
        Height = 434
        ExplicitWidth = 478
        ExplicitHeight = 252
        inherited pnlEhMainDisplay: TPanel
          Width = 903
          Height = 403
          ExplicitWidth = 476
          ExplicitHeight = 221
          inherited ehMain: TDBGridEh
            Width = 901
            Height = 401
            Columns = <
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
                FieldName = 'INV_PART_NUMBER'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #26448#26009#32534#30721
                Width = 90
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
                Width = 200
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'UNIT_NAME'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #21333#20301
                Width = 45
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'GROUP_DESC'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #26448#26009#31867#21035
                Width = 100
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
                FieldName = 'Stype'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20986#24211#31867#22411
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'put_total'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #25968#37327
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'put_price'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #37329#39069'('#26412#24065#21547#31246')'
                Width = 90
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'put_notax'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #37329#39069'('#26412#24065#19981#21547#31246')'
                Width = 100
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'STOCK_SELL'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #21333#20301#38754#31215
                Width = 85
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'total_area'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #21457#25918#38754#31215
                Width = 80
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'REPORT_VALUE1'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #26631#20934#20135#20986'('#24179#31859')'
                Width = 100
              end>
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 903
          ExplicitWidth = 476
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
      'SELECT   TOP (100) PERCENT dbo.Data0017.INV_PART_NUMBER, dbo.Dat' +
      'a0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION, dbo.Data0002.UNIT_' +
      'NAME, '#13#10'                      dbo.Data0496.GROUP_DESC, dbo.Data0' +
      '023.ABBR_NAME, '#13#10'                      case when dbo.data0724.tt' +
      'ype=0 then '#39#36864#36135#20986#20179#39' when dbo.data0724.ttype=1 then '#39#39046#26009#20986#20179#39'  end  St' +
      'ype,'#13#10'                      case when data0724.ttype=1 then SUM(' +
      'dbo.Data0149.QUANTITY) else sum(Data0149.RTN_QUANTITY) end AS pu' +
      't_total, dbo.Data0017.STOCK_SELL, '#13#10'                      case w' +
      'hen data0724.ttype=1 then ROUND(SUM(dbo.Data0149.QUANTITY * dbo.' +
      'Data0134.tax_price * dbo.Data0133.exch_rate), 3) '#13#10'             ' +
      '         else ROUND(SUM(dbo.Data0149.RTN_QUANTITY * dbo.Data0134' +
      '.tax_price * dbo.Data0133.exch_rate), 3) end AS put_price, '#13#10'   ' +
      '                   dbo.Data0019.inv_group_name,dbo.Data0017.REPO' +
      'RT_VALUE1, '#13#10'                      case when data0724.ttype=1 th' +
      'en ROUND(SUM((dbo.Data0149.QUANTITY * dbo.Data0134.tax_price * d' +
      'bo.Data0133.exch_rate) '#13#10'                      / (1 + dbo.Data01' +
      '34.TAX_2 * 0.01)), 3) else ROUND(SUM((dbo.Data0149.RTN_QUANTITY ' +
      '* dbo.Data0134.tax_price * dbo.Data0133.exch_rate) '#13#10'           ' +
      '           / (1 + dbo.Data0134.TAX_2 * 0.01)), 3)end AS put_nota' +
      'x,  dbo.data0016.code, '#13#10'                      case when data072' +
      '4.ttype=1 then ROUND(SUM(dbo.Data0149.QUANTITY * dbo.Data0017.ST' +
      'OCK_SELL), 4) else ROUND(SUM(dbo.Data0149.QUANTITY * dbo.Data001' +
      '7.STOCK_SELL),4) end as total_area'#13#10'FROM                  dbo.Da' +
      'ta0724 INNER JOIN'#13#10'                      dbo.Data0133 INNER JOIN' +
      #13#10'                      dbo.Data0002 INNER JOIN'#13#10'               ' +
      '       dbo.Data0134 INNER JOIN'#13#10'                      dbo.Data01' +
      '49 ON dbo.Data0134.RKEY = dbo.Data0149.D0134_PTR ON '#13#10'          ' +
      '            dbo.Data0002.RKEY = dbo.Data0134.unit_ptr ON '#13#10'     ' +
      '                 dbo.Data0133.RKEY = dbo.Data0134.GRN_PTR INNER ' +
      'JOIN'#13#10'                      dbo.Data0023 ON dbo.Data0133.SUPP_PT' +
      'R = dbo.Data0023.RKEY INNER JOIN'#13#10'                      dbo.Data' +
      '0496 INNER JOIN'#13#10'                      dbo.Data0017 ON dbo.Data0' +
      '496.RKEY = dbo.Data0017.GROUP_PTR INNER JOIN'#13#10'                  ' +
      '    dbo.Data0019 ON dbo.Data0496.group_ptr = dbo.Data0019.rkey O' +
      'N dbo.Data0149.INVENTORY_PTR = dbo.Data0017.RKEY ON '#13#10'          ' +
      '            dbo.Data0724.RKEY = dbo.Data0149.GON_PTR  inner join' +
      #13#10'                     dbo.Data0016 ON dbo.Data0134.LOCATION_PTR' +
      ' = dbo.Data0016.RKEY'#13#10'WHERE     (dbo.Data0149.QUANTITY <> 0) or ' +
      '(dbo.Data0149.RTN_QUANTITY<>0)'#13#10
  end
end
