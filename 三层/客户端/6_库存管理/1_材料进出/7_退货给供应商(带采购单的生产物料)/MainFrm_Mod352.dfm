inherited FrmMain_Mod352: TFrmMain_Mod352
  Caption = 'FrmMain_Mod352'
  ClientHeight = 364
  ClientWidth = 788
  Font.Height = -13
  Font.Name = #23435#20307
  ExplicitWidth = 796
  ExplicitHeight = 398
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 788
    Height = 364
    ExplicitWidth = 788
    ExplicitHeight = 364
    inherited pnlDisplayMain: TPanel
      Width = 788
      Height = 364
      ExplicitWidth = 788
      ExplicitHeight = 364
      inherited pnlChildMain: TPanel
        Width = 786
        Height = 362
        ExplicitWidth = 786
        ExplicitHeight = 362
        inherited pnlEhMainDisplay: TPanel
          Width = 784
          Height = 331
          ExplicitWidth = 784
          ExplicitHeight = 331
          inherited ehMain: TDBGridEh
            Width = 782
            Height = 329
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'goods_name'
                Footers = <>
                Title.Caption = #29289#21697#21517#31216
                Width = 165
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'goods_guige'
                Footers = <>
                Title.Caption = #29289#21697#35268#26684
                Width = 203
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'goods_type'
                Footers = <>
                Title.Caption = #29289#21697#31867#21035
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ABBR_NAME'
                Footers = <>
                Title.Caption = #24037#21378#21517#31216
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'LOCATION'
                Footers = <>
                Title.Caption = #23384#25918#20179#24211
                Width = 107
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'QUAN_RECD'
                Footers = <>
                Title.Caption = #25509#25910#25968#37327
                Width = 60
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'QUAN_ON_HAND'
                Footers = <>
                Title.Caption = #22312#24211#25968#37327
                Width = 58
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'quan_to_ship'
                Footers = <>
                Title.Caption = #24453#35013#36816#25968
                Width = 61
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'quan_returned'
                Footers = <>
                Title.Caption = #24050#36864#36135#25968#37327
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'UNIT_NAME'
                Footers = <>
                Title.Caption = #21333#20301
                Width = 36
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
                FieldName = 'REF_NUMBER'
                Footers = <>
                Title.Caption = #22791#27880
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
                Width = 164
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PO_NUMBER'
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
                FieldName = 'CONFIRMATION_NUMBER'
                Footers = <>
                Title.Caption = #30830#35748#29992#25143
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PO_DATE'
                Footers = <>
                Title.Caption = #19979#21333#26085#26399
              end>
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 784
          ExplicitWidth = 784
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
      'SELECT       dbo.Data0235.goods_name, dbo.Data0235.goods_guige, ' +
      'dbo.Data0235.goods_type, dbo.Data0015.ABBR_NAME,'#13#10'              ' +
      '      dbo.Data0016.LOCATION, dbo.Data0235.QUAN_RECD,dbo.Data0235' +
      '.QUAN_ON_HAND, dbo.Data0235.quan_to_ship, '#13#10'                    ' +
      'dbo.Data0235.quan_returned, dbo.Data0002.UNIT_NAME,dbo.Data0456.' +
      'ship_DATE ,dbo.Data0235.REF_NUMBER,'#13#10'                    dbo.Dat' +
      'a0023.CODE, dbo.Data0023.SUPPLIER_NAME,  dbo.Data0070.PO_NUMBER,' +
      #13#10'                    dbo.Data0070.CONFIRMATION_NUMBER,  dbo.Dat' +
      'a0070.PO_DATE,  dbo.Data0456.GRN_NUMBER, '#13#10'                   db' +
      'o.Data0015.WAREHOUSE_CODE , Data0235.D0072_PTR,dbo.Data0235.RKEY' +
      ',dbo.Data0072.DESCRIPTION2'#13#10'FROM         dbo.Data0456 INNER JOIN' +
      #13#10'                   dbo.Data0235 ON dbo.Data0456.RKEY = dbo.Dat' +
      'a0235.GRN_PTR INNER JOIN'#13#10'                   dbo.Data0070 ON dbo' +
      '.Data0456.PO_PTR = dbo.Data0070.RKEY INNER JOIN'#13#10'               ' +
      '    dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY IN' +
      'NER JOIN'#13#10'                   dbo.Data0002 ON dbo.Data0235.unit_p' +
      'tr = dbo.Data0002.RKEY INNER JOIN'#13#10'                   dbo.Data00' +
      '16 ON dbo.Data0235.location_ptr = dbo.Data0016.RKEY INNER JOIN'#13#10 +
      '                   dbo.Data0015 ON dbo.Data0456.warehouse_ptr = ' +
      'dbo.Data0015.RKEY INNER JOIN'#13#10'                   dbo.Data0072 ON' +
      ' dbo.Data0235.D0072_PTR = dbo.Data0072.RKEY '#13#10'WHERE 1=1'#13#10
    ProviderName = 'DataSetProvider1'
    object cdsMaingoods_name: TStringField
      FieldName = 'goods_name'
      Size = 60
    end
    object cdsMaingoods_guige: TStringField
      FieldName = 'goods_guige'
      Size = 200
    end
    object cdsMaingoods_type: TStringField
      FieldName = 'goods_type'
    end
    object cdsMainABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object cdsMainLOCATION: TStringField
      FieldName = 'LOCATION'
    end
    object cdsMainQUAN_RECD: TBCDField
      FieldName = 'QUAN_RECD'
      Precision = 10
      Size = 3
    end
    object cdsMainQUAN_ON_HAND: TBCDField
      FieldName = 'QUAN_ON_HAND'
      Precision = 10
      Size = 3
    end
    object cdsMainquan_to_ship: TFloatField
      FieldName = 'quan_to_ship'
    end
    object cdsMainquan_returned: TFloatField
      FieldName = 'quan_returned'
    end
    object cdsMainUNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object cdsMainship_DATE: TDateTimeField
      FieldName = 'ship_DATE'
    end
    object cdsMainREF_NUMBER: TStringField
      FieldName = 'REF_NUMBER'
      FixedChar = True
      Size = 15
    end
    object cdsMainCODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object cdsMainSUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object cdsMainPO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object cdsMainCONFIRMATION_NUMBER: TStringField
      FieldName = 'CONFIRMATION_NUMBER'
    end
    object cdsMainPO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object cdsMainGRN_NUMBER: TStringField
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object cdsMainWAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object cdsMainD0072_PTR: TIntegerField
      FieldName = 'D0072_PTR'
    end
    object cdsMainRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object cdsMainDESCRIPTION2: TStringField
      FieldName = 'DESCRIPTION2'
      FixedChar = True
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
