inherited FrmMain_Mod36: TFrmMain_Mod36
  Caption = 'FrmMain_Mod36'
  ClientHeight = 440
  ClientWidth = 751
  ExplicitWidth = 759
  ExplicitHeight = 474
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 751
    Height = 440
    ExplicitWidth = 751
    ExplicitHeight = 440
    inherited pnlDisplayMain: TPanel
      Width = 751
      Height = 440
      ExplicitWidth = 751
      ExplicitHeight = 440
      inherited pnlChildMain: TPanel
        Width = 749
        Height = 438
        ExplicitWidth = 749
        ExplicitHeight = 438
        inherited pnlEhMainDisplay: TPanel
          Width = 747
          Height = 407
          ExplicitWidth = 747
          ExplicitHeight = 407
          inherited ehMain: TDBGridEh
            Width = 745
            Height = 405
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_PART_NUMBER'
                Footers = <>
                Title.Caption = #26448#26009#20195#30721
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
                FieldName = 'INV_DESCRIPTION'
                Footers = <>
                Title.Caption = #26448#26009#35268#26684
                Width = 254
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'UNIT_NAME'
                Footers = <>
                Title.Caption = #21333#20301
                Width = 44
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'QUAN_IN_INSP'
                Footers = <>
                Title.Caption = #24453#26816#25968#37327
                Width = 57
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'QUAN_TO_BE_SHIPPED'
                Footers = <>
                Title.Caption = #36864#36135#25968#37327
                Width = 54
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'QUAN_SCRAPPED'
                Footers = <>
                Title.Caption = #25253#24223#25968#37327
                Width = 59
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'QUAN_ON_HAND'
                Footers = <>
                Title.Caption = #24403#21069#24211#23384
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'reason'
                Footers = <>
                Title.Caption = #35831#36141#21407#22240
                Width = 196
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'BARCODE_ID'
                Footers = <>
                Title.Caption = #22791#27880
                Width = 164
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'WAREHOUSE_CODE'
                Footers = <>
                Title.Caption = #24037#21378#32534#21495
                Width = 65
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'WAREHOUSE_NAME'
                Footers = <>
                Title.Caption = #24037#21378#21517#31216
                Width = 122
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CODE'
                Footers = <>
                Title.Caption = #20379#24212#21830#32534#21495
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'SUPPLIER_NAME'
                Footers = <>
                Title.Caption = #20379#24212#21830#21517#31216
                Width = 251
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CODE16'
                Footers = <>
                Title.Caption = #20179#24211#32534#21495
                Width = 76
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'LOCATION'
                Footers = <>
                Title.Caption = #20179#24211#21517#31216
                Width = 81
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PRICE'
                Footers = <>
                Title.Caption = #19981#21547#31246#20215#26684
                Width = 67
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'tax_price'
                Footers = <>
                Title.Caption = #21547#31246#20215#26684
                Width = 61
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'TAX_2'
                Footers = <>
                Title.Caption = #31246#29575'%'
                Width = 47
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'exch_rate'
                Footers = <>
                Title.Caption = #27719#29575
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ship_DATE'
                Footers = <>
                Title.Caption = #36865#36135#26085#26399
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'EXPIRE_DATE'
                Footers = <>
                Title.Caption = #26377#25928#26399
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'rohs'
                Footers = <>
                Title.Caption = #29615#20445#26631#35782
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
          Width = 747
          ExplicitWidth = 747
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 
      'SELECT     dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, ' +
      'dbo.Data0017.INV_DESCRIPTION, dbo.Data0002.UNIT_NAME, '#13#10'        ' +
      '   dbo.Data0015.WAREHOUSE_CODE, dbo.Data0015.WAREHOUSE_NAME, dbo' +
      '.Data0015.rkey as rkey15, dbo.Data0023.CODE,'#13#10'           dbo.Dat' +
      'a0023.SUPPLIER_NAME, dbo.Data0016.CODE AS CODE16, dbo.Data0016.L' +
      'OCATION, '#13#10'           dbo.Data0022.PRICE, dbo.Data0456.exch_rate' +
      ', dbo.Data0022.QUAN_IN_INSP, dbo.Data0022.QUAN_TO_BE_SHIPPED, db' +
      'o.Data0022.QUAN_SCRAPPED, '#13#10'           dbo.Data0022.LOCATION_PTR' +
      ', dbo.Data0022.TDATE, dbo.Data0022.EXPIRE_DATE, dbo.Data0022.roh' +
      's, dbo.Data0022.INVENTORY_PTR, dbo.Data0022.RKEY, '#13#10'           d' +
      'bo.Data0022.QUAN_ON_HAND, dbo.Data0022.tax_price, dbo.Data0022.T' +
      'AX_2,dbo.Data0071.reason, dbo.Data0022.BARCODE_ID,'#13#10'           D' +
      'ata0456.GRN_NUMBER, Data0456.ship_DATE'#13#10'FROM       dbo.Data0017 ' +
      'INNER JOIN'#13#10'           dbo.Data0022 ON dbo.Data0017.RKEY = dbo.D' +
      'ata0022.INVENTORY_PTR INNER JOIN'#13#10'           dbo.Data0456 ON dbo' +
      '.Data0022.GRN_PTR = dbo.Data0456.RKEY INNER JOIN'#13#10'           dbo' +
      '.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY INNER JOI' +
      'N'#13#10'           dbo.Data0015 ON dbo.Data0456.warehouse_ptr = dbo.D' +
      'ata0015.RKEY INNER JOIN'#13#10'           dbo.Data0016 ON dbo.Data0022' +
      '.LOCATION_PTR = dbo.Data0016.RKEY INNER JOIN'#13#10'           dbo.Dat' +
      'a0002 ON dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0002.RKEY left' +
      ' join'#13#10'           dbo.Data0071 ON dbo.Data0022.SOURCE_PTR = dbo.' +
      'Data0071.RKEY'#13#10'WHERE    1=1'
    ProviderName = 'DataSetProvider1'
    object cdsMainINV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object cdsMainINV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object cdsMainINV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object cdsMainUNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object cdsMainWAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object cdsMainWAREHOUSE_NAME: TStringField
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
    object cdsMainCODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object cdsMainSUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object cdsMainLOCATION: TStringField
      FieldName = 'LOCATION'
    end
    object cdsMainPRICE: TFMTBCDField
      FieldName = 'PRICE'
      Precision = 15
      Size = 6
    end
    object cdsMainexch_rate: TFMTBCDField
      FieldName = 'exch_rate'
      Precision = 12
    end
    object cdsMainQUAN_IN_INSP: TFMTBCDField
      FieldName = 'QUAN_IN_INSP'
      Precision = 18
      Size = 6
    end
    object cdsMainQUAN_TO_BE_SHIPPED: TFMTBCDField
      FieldName = 'QUAN_TO_BE_SHIPPED'
      Precision = 18
      Size = 6
    end
    object cdsMainQUAN_SCRAPPED: TFMTBCDField
      FieldName = 'QUAN_SCRAPPED'
      Precision = 18
      Size = 6
    end
    object cdsMainLOCATION_PTR: TIntegerField
      FieldName = 'LOCATION_PTR'
    end
    object cdsMainTDATE: TDateTimeField
      FieldName = 'TDATE'
    end
    object cdsMainEXPIRE_DATE: TDateTimeField
      FieldName = 'EXPIRE_DATE'
    end
    object cdsMainrohs: TStringField
      FieldName = 'rohs'
      Size = 10
    end
    object cdsMainINVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object cdsMainRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object cdsMainQUAN_ON_HAND: TBCDField
      FieldName = 'QUAN_ON_HAND'
      Precision = 19
    end
    object cdsMaintax_price: TBCDField
      FieldName = 'tax_price'
      Precision = 13
    end
    object cdsMainTAX_2: TBCDField
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object cdsMainreason: TStringField
      FieldName = 'reason'
      Size = 60
    end
    object cdsMainBARCODE_ID: TStringField
      FieldName = 'BARCODE_ID'
      Size = 50
    end
    object cdsMainGRN_NUMBER: TStringField
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object cdsMainship_DATE: TDateTimeField
      FieldName = 'ship_DATE'
    end
    object cdsMainCODE16: TStringField
      FieldName = 'CODE16'
    end
  end
  inherited pmMain: TPopupMenu
    OnPopup = pmMainPopup
    object IQC1: TMenuItem
      Caption = 'IQC'#26816#26597
      OnClick = IQC1Click
    end
  end
  inherited cdsMainWhereInit: TClientDataSet
    Top = 56
  end
end
