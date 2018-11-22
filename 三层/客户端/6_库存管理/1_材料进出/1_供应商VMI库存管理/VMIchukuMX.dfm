inherited frmVMIchukuMX: TfrmVMIchukuMX
  Caption = 'VMI'#20986#24211#26126#32454
  ClientHeight = 439
  ClientWidth = 782
  ExplicitWidth = 790
  ExplicitHeight = 466
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 782
    Height = 439
    ExplicitWidth = 782
    ExplicitHeight = 439
    inherited pnlDisplayMain: TPanel
      Width = 782
      Height = 439
      ExplicitWidth = 782
      ExplicitHeight = 439
      inherited pnlChildMain: TPanel
        Width = 780
        Height = 437
        ExplicitWidth = 780
        ExplicitHeight = 437
        inherited pnlEhMainDisplay: TPanel
          Width = 778
          Height = 406
          ExplicitWidth = 778
          ExplicitHeight = 406
          inherited ehMain: TDBGridEh
            Width = 776
            Height = 404
            FooterRowCount = 1
            SumList.Active = True
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'GON_NUMBER'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20986#20179#21333#21495
                Width = 74
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = #20986#24211#31867#22411
                Footers = <>
                Title.Alignment = taCenter
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = #29366#24577
                Footers = <>
                Title.Alignment = taCenter
                Width = 45
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
                Width = 65
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
                Width = 100
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'po_number'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #37319#36141#35746#21333
                Width = 80
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'QUANTITY'
                Footer.FieldName = 'QUANTITY'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #21457#25918#25968#37327
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'rtn_quantity'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #36864#20179#25968#37327
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ref_number'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #22791#27880#20449#24687' '
                Width = 120
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
                Width = 40
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'tax_price'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #21547#31246#21333#20215
                Visible = False
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'Price'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #19981#21547#31246#21333#20215
                Visible = False
                Width = 70
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = #21547#31246#37329#39069
                Footer.FieldName = #21547#31246#37329#39069
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Alignment = taCenter
                Visible = False
                Width = 85
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = #19981#21547#31246#37329#39069
                Footer.FieldName = #19981#21547#31246#37329#39069
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Alignment = taCenter
                Visible = False
                Width = 85
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'code'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20379#24212#21830#20195#30721
                Width = 70
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ABBR_NAME'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20379#24212#21830#31616#31216
                Width = 70
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
                FieldName = 'create_date'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20986#24211#26085#26399
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
                FieldName = 'GRN_NUMBER'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20837#24211#21333#21495
                Width = 70
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = #25805#20316#20154#21592
                Footers = <>
                Title.Alignment = taCenter
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = #39046#26009#20154#21592
                Footers = <>
                Title.Alignment = taCenter
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'LOCATION'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #20179#24211
                Width = 80
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'workhour_abbr'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #24037#21378
                Width = 40
              end>
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 778
          ExplicitWidth = 778
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
      'SELECT    dbo.Data0724.GON_NUMBER,'#13#10'                  case when ' +
      'dbo.data0724.ttype=0 then '#39#36864#36135#20986#20179#39#13#10'                           whe' +
      'n dbo.data0724.ttype=1 then '#39#39046#26009#20986#20179#39'  end  '#20986#24211#31867#22411','#13#10'                ' +
      '  case when dbo.data0724.status=0 then '#39#26410#23457#26680#39'  '#13#10'                ' +
      '          when dbo.data0724.status=1 then '#39#24050#23457#26680#39'    end '#29366#24577','#13#10'dbo.' +
      'Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME,'#13#10'dbo.Data0017.I' +
      'NV_DESCRIPTION, dbo.Data0496.GROUP_NAME, '#13#10'dbo.Data0149.QUANTITY' +
      ',dbo.data0149.rtn_quantity,dbo.data0724.ref_number,'#13#10'dbo.Data000' +
      '1.CURR_CODE,'#13#10'dbo.Data0134.BARCODE_ID, dbo.Data0019.inv_group_na' +
      'me, dbo.Data0149.TAX_2,'#13#10'dbo.Data0149.tax_price, dbo.Data0134.SU' +
      'PPLIER2,Data0134.Price,case data0724.ttype when 0 then '#13#10'round(d' +
      'ata0134.price*data0149.rtn_quantity,2) when 1 then'#13#10'round(data01' +
      '34.price*data0149.quantity,2) end as '#19981#21547#31246#37329#39069', '#13#10'case data0724.ttyp' +
      'e when 0 then '#13#10'round(data0149.tax_price*data0149.rtn_quantity,2' +
      ') when 1 then'#13#10'round(data0149.tax_price*data0149.quantity,2) end' +
      ' as '#21547#31246#37329#39069', '#13#10'dbo.Data0023.ABBR_NAME, data0023.code,dbo.Data0002.U' +
      'NIT_NAME, dbo.Data0724.create_date,'#13#10'dbo.Data0134.rohs, dbo.Data' +
      '0133.GRN_NUMBER,'#13#10'd05.employee_name as '#25805#20316#20154#21592',dbo.data0005.employe' +
      'e_name as '#39046#26009#20154#21592','#13#10'dbo.Data0016.LOCATION,dbo.Data0016.code, dbo.Da' +
      'ta0015.ABBR_NAME as workhour_abbr,data0070.po_number'#13#10'FROM      ' +
      '   dbo.Data0149 INNER JOIN'#13#10'dbo.Data0724 ON dbo.Data0149.GON_PTR' +
      ' = dbo.Data0724.RKEY INNER JOIN'#13#10'dbo.Data0017 ON dbo.Data0149.IN' +
      'VENTORY_PTR = dbo.Data0017.RKEY INNER JOIN'#13#10'dbo.Data0496 ON dbo.' +
      'Data0017.GROUP_PTR = dbo.Data0496.RKEY INNER JOIN'#13#10'dbo.Data0134 ' +
      'ON dbo.Data0149.D0134_PTR = dbo.Data0134.RKEY INNER JOIN'#13#10'dbo.Da' +
      'ta0019 ON dbo.Data0496.group_ptr = dbo.Data0019.rkey INNER JOIN'#13 +
      #10'dbo.Data0002 ON dbo.Data0134.unit_ptr = dbo.Data0002.RKEY INNER' +
      ' JOIN'#13#10'dbo.Data0133 ON dbo.Data0134.GRN_PTR = dbo.Data0133.RKEY ' +
      'INNER JOIN'#13#10'dbo.Data0023 ON dbo.Data0724.supplier_ptr = dbo.Data' +
      '0023.RKEY INNER JOIN'#13#10'dbo.Data0001 ON dbo.Data0133.currency_ptr ' +
      '= dbo.Data0001.RKEY INNER JOIN'#13#10'dbo.Data0005 ON dbo.Data0724.REC' +
      'D_BY = dbo.Data0005.RKEY INNER JOIN'#13#10'dbo.data0005 d05 ON dbo.dat' +
      'a0724.create_by=d05.rkey inner join'#13#10'dbo.Data0016 ON dbo.Data013' +
      '4.LOCATION_PTR = dbo.Data0016.RKEY INNER JOIN'#13#10'dbo.Data0015 ON d' +
      'bo.Data0724.warehouse_ptr = dbo.Data0015.RKEY left outer join'#13#10'd' +
      'bo.data0070 on dbo.data0133.po_ptr=dbo.data0070.rkey'#13#10'WHERE    (' +
      ' (dbo.Data0149.QUANTITY > 0)  or (dbo.data0149.rtn_quantity>0))'
  end
  inherited pmZD: TPopupMenu
    OnPopup = pmZDPopup
  end
end
