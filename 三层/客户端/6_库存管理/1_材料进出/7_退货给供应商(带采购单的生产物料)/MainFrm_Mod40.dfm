inherited FrmMain_Mod40: TFrmMain_Mod40
  Caption = 'FrmMain_Mod40'
  ClientHeight = 348
  ClientWidth = 780
  Font.Height = -13
  Font.Name = #23435#20307
  ExplicitWidth = 788
  ExplicitHeight = 382
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 780
    Height = 348
    ExplicitWidth = 780
    ExplicitHeight = 348
    inherited pnlDisplayMain: TPanel
      Width = 780
      Height = 348
      ExplicitWidth = 780
      ExplicitHeight = 348
      inherited pnlChildMain: TPanel
        Width = 778
        Height = 346
        ExplicitWidth = 778
        ExplicitHeight = 346
        inherited pnlEhMainDisplay: TPanel
          Width = 776
          Height = 315
          ExplicitWidth = 776
          ExplicitHeight = 315
          inherited ehMain: TDBGridEh
            Width = 774
            Height = 313
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
                Width = 288
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_NAME'
                Footers = <>
                Title.Caption = #26448#26009#21517#31216
                Width = 175
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
                Width = 93
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
                Width = 66
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'quan_to_be_shipped'
                Footers = <>
                Title.Caption = #24453#35013#36816#25968
                Width = 61
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'QUAN_RETURNED'
                Footers = <>
                Title.Caption = #36864#36135#25968#37327
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'UNIT_NAME'
                Footers = <>
                Title.Caption = #21333#20301
                Width = 46
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
                Width = 191
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
                Width = 304
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'po_number'
                Footers = <>
                Title.Caption = #37319#36141#21333#21495
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'GRN_NUMBER'
                Footers = <>
                Title.Caption = #20837#24211#21333#21495
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'confirmation_number'
                Footers = <>
                Title.Caption = #30830#35748#29992#25143
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'po_date'
                Footers = <>
                Title.Caption = #19979#21333#26085#26399
              end>
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 776
          ExplicitWidth = 776
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
      'SELECT d22.QUANTITY, d22.QUAN_ON_HAND, d22.QUAN_TO_BE_SHIPPED, d' +
      '22.QUAN_RETURNED, d22.TDATE, '#13#10'       d22.BARCODE_ID, d23.CODE, ' +
      'd23.SUPPLIER_NAME, d70.PO_NUMBER, d70.CONFIRMATION_NUMBER, '#13#10'   ' +
      '    d70.PO_DATE, d15.WAREHOUSE_CODE, d15.ABBR_NAME, d16.LOCATION' +
      ',d456.GRN_NUMBER,d22.RKEY,  '#13#10'       d22.INVENTORY_PTR, d17.INV_' +
      'PART_NUMBER, d17.INV_PART_DESCRIPTION, d17.INV_NAME, d02.UNIT_NA' +
      'ME '#13#10'FROM   dbo.Data0022 AS d22 INNER JOIN'#13#10'       dbo.Data0017 ' +
      'AS d17 ON d22.INVENTORY_PTR = d17.RKEY INNER JOIN'#13#10'       dbo.Da' +
      'ta0002 AS d02 ON d22.LOCATION_PTR_FROM = d02.RKEY INNER JOIN'#13#10'  ' +
      '     dbo.Data0016 AS d16 ON d22.LOCATION_PTR = d16.RKEY INNER JO' +
      'IN'#13#10'       dbo.Data0456 AS d456 ON d22.GRN_PTR = d456.RKEY INNER' +
      ' JOIN'#13#10'       dbo.Data0070 AS d70 ON d456.PO_PTR = d70.RKEY INNE' +
      'R JOIN'#13#10'       dbo.Data0015 AS d15 ON d456.warehouse_ptr = d15.R' +
      'KEY INNER JOIN'#13#10'       dbo.Data0023 AS d23 ON d456.SUPP_PTR = d2' +
      '3.RKEY'#13#10'where 1=1'#13#10
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
    object cdsMainpo_number: TStringField
      FieldName = 'po_number'
      Size = 15
    end
    object cdsMainconfirmation_number: TStringField
      FieldName = 'confirmation_number'
    end
    object cdsMainpo_date: TDateTimeField
      FieldName = 'po_date'
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
    object cdsMainGRN_NUMBER: TStringField
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object cdsMainINV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object cdsMainUNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
  end
  inherited pmMain: TPopupMenu
    OnPopup = pmMainPopup
    Left = 224
    object N1: TMenuItem
      Caption = #36864#36135#22788#29702
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #36864#36135#26126#32454
      OnClick = N2Click
    end
  end
  inherited cdsMainWhereInit: TClientDataSet
    Left = 304
    Top = 88
  end
end
