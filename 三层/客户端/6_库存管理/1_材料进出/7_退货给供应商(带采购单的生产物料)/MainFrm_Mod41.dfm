inherited FrmMain_Mod41: TFrmMain_Mod41
  Caption = 'FrmMain_Mod41'
  ClientHeight = 383
  ClientWidth = 748
  Font.Height = -13
  Font.Name = #23435#20307
  ExplicitWidth = 756
  ExplicitHeight = 417
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 748
    Height = 383
    ExplicitWidth = 748
    ExplicitHeight = 383
    inherited pnlDisplayMain: TPanel
      Width = 748
      Height = 383
      ExplicitWidth = 748
      ExplicitHeight = 383
      inherited pnlChildMain: TPanel
        Width = 746
        Height = 381
        ExplicitWidth = 746
        ExplicitHeight = 381
        inherited pnlEhMainDisplay: TPanel
          Width = 744
          Height = 350
          ExplicitWidth = 744
          ExplicitHeight = 350
          inherited ehMain: TDBGridEh
            Width = 742
            Height = 348
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'inv_part_number'
                Footers = <>
                Title.Caption = #26448#26009#20195#30721
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_part_description'
                Footers = <>
                Title.Caption = #26448#26009#25551#36848
                Width = 259
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_NAME'
                Footers = <>
                Title.Caption = #26448#26009#21517#31216
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'abbr_name'
                Footers = <>
                Title.Caption = #24037#21378#21517#31216
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'location'
                Footers = <>
                Title.Caption = #23384#25918#20179#24211
                Width = 89
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'quantity'
                Footers = <>
                Title.Caption = #25509#25910#25968#37327
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'quan_on_hand'
                Footers = <>
                Title.Caption = #22312#24211#25968#37327
                Width = 64
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'quan_to_be_shipped'
                Footers = <>
                Title.Caption = #24453#35013#36816#25968
                Width = 68
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'QUAN_RETURNED'
                Footers = <>
                Title.Caption = #36864#36135#25968#37327
                Width = 66
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'UNIT_NAME'
                Footers = <>
                Title.Caption = #21333#20301
                Width = 43
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'tdate'
                Footers = <>
                Title.Caption = #20837#24211#26085#26399
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'BARCODE_ID'
                Footers = <>
                Title.Caption = #22791#27880
                Width = 210
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CODE'
                Footers = <>
                Title.Caption = #20379#24212#21830
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'SUPPLIER_NAME'
                Footers = <>
                Title.Caption = #20379#24212#21830#21517#31216
                Width = 311
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'GRN_NUMBER'
                Footers = <>
                Title.Caption = #20837#24211#21333#21495
              end>
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 744
          ExplicitWidth = 744
          inherited lblFilter: TLabel
            Left = 463
            Width = 52
            ExplicitLeft = 463
            ExplicitWidth = 52
          end
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 
      'SELECT   d17.INV_PART_NUMBER, d17.INV_PART_DESCRIPTION, d17.INV_' +
      'NAME, d22.QUANTITY, d22.QUAN_ON_HAND,d22.RKEY, '#13#10'         d22.QU' +
      'AN_TO_BE_SHIPPED, d22.QUAN_RETURNED, d22.TDATE, d22.BARCODE_ID, ' +
      'd23.CODE, d23.SUPPLIER_NAME,'#13#10'         d15.WAREHOUSE_CODE, d15.A' +
      'BBR_NAME, d16.LOCATION,  d22.INVENTORY_PTR, d456.GRN_NUMBER, d02' +
      '.UNIT_NAME'#13#10'FROM     dbo.Data0022 AS d22 INNER JOIN'#13#10#9#9' dbo.Data' +
      '0017 AS d17 ON d22.INVENTORY_PTR = d17.RKEY INNER JOIN'#13#10#9#9' dbo.D' +
      'ata0456 AS d456 ON d22.GRN_PTR = d456.RKEY INNER JOIN'#13#10#9#9' dbo.Da' +
      'ta0002 AS d02 ON d22.LOCATION_PTR_FROM = d02.RKEY INNER JOIN'#13#10#9#9 +
      ' dbo.Data0016 AS d16 ON d22.LOCATION_PTR = d16.RKEY INNER JOIN'#13#10 +
      #9#9' dbo.Data0015 AS d15 ON d456.warehouse_ptr = d15.RKEY INNER JO' +
      'IN'#13#10#9#9' dbo.Data0023 AS d23 ON d456.SUPP_PTR = d23.RKEY'#13#10'WHERE   ' +
      '  (1 = 1)         '
    object cdsMaininv_part_number: TStringField
      FieldName = 'inv_part_number'
      Size = 25
    end
    object cdsMainINV_part_description: TStringField
      FieldName = 'INV_part_description'
      ReadOnly = True
      Size = 100
    end
    object cdsMainquantity: TFloatField
      FieldName = 'quantity'
    end
    object cdsMainquan_on_hand: TBCDField
      FieldName = 'quan_on_hand'
      Precision = 19
    end
    object cdsMainquan_to_be_shipped: TFMTBCDField
      FieldName = 'quan_to_be_shipped'
      Precision = 18
      Size = 6
    end
    object cdsMainQUAN_RETURNED: TFMTBCDField
      FieldName = 'QUAN_RETURNED'
      Precision = 18
      Size = 6
    end
    object cdsMaintdate: TDateTimeField
      FieldName = 'tdate'
    end
    object cdsMainBARCODE_ID: TStringField
      FieldName = 'BARCODE_ID'
      Size = 50
    end
    object cdsMainCODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object cdsMainSUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object cdsMainwarehouse_code: TStringField
      FieldName = 'warehouse_code'
      Size = 5
    end
    object cdsMainabbr_name: TStringField
      FieldName = 'abbr_name'
      Size = 10
    end
    object cdsMainlocation: TStringField
      FieldName = 'location'
    end
    object cdsMainrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object cdsMaininventory_ptr: TIntegerField
      FieldName = 'inventory_ptr'
    end
    object cdsMainINV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object cdsMainGRN_NUMBER: TStringField
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object cdsMainUNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
  end
  inherited pmMain: TPopupMenu
    OnPopup = pmMainPopup
    object N1: TMenuItem
      Caption = #36864#36135#22788#29702
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #36864#36135#26126#32454
      OnClick = N2Click
    end
  end
end
