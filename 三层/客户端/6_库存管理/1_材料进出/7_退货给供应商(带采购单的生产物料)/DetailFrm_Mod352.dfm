inherited FrmDetail_Mod352: TFrmDetail_Mod352
  Caption = #36864#36135#26126#32454
  ClientHeight = 364
  ClientWidth = 744
  Font.Height = -13
  Font.Name = #23435#20307
  OnClose = FormClose
  ExplicitWidth = 752
  ExplicitHeight = 398
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 744
    Height = 364
    ExplicitWidth = 744
    ExplicitHeight = 364
    inherited pnlDisplayMain: TPanel
      Width = 744
      Height = 364
      ExplicitWidth = 744
      ExplicitHeight = 364
      inherited pnlChildMain: TPanel
        Width = 742
        Height = 362
        ExplicitWidth = 742
        ExplicitHeight = 362
        inherited pnlEhMainDisplay: TPanel
          Width = 740
          Height = 360
          ExplicitWidth = 740
          ExplicitHeight = 360
          inherited ehMain: TDBGridEh
            Width = 738
            Height = 358
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'goods_name'
                Footers = <>
                Width = 155
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'goods_guige'
                Footers = <>
                Width = 200
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'goods_type'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ABBR_NAME'
                Footers = <>
                Width = 98
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'QUANTITY'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'UNIT_NAME'
                Footers = <>
                Width = 74
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'TDATE'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'Expr1'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'shipping_method'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'tran_date'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'v_state'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'EMPLOYEE_NAME'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CODE'
                Footers = <>
                Width = 55
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'REJECT_DESCRIPTION'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'remark'
                Footers = <>
              end>
          end
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    ProviderName = 'DataSetProvider1'
    object cdsMaingoods_name: TStringField
      DisplayLabel = #29289#21697#21517#31216
      FieldName = 'goods_name'
      Size = 60
    end
    object cdsMaingoods_guige: TStringField
      DisplayLabel = #29289#21697#35268#26684
      FieldName = 'goods_guige'
      Size = 200
    end
    object cdsMaingoods_type: TStringField
      DisplayLabel = #29289#21697#31867#21035
      FieldName = 'goods_type'
    end
    object cdsMainABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object cdsMainQUANTITY: TFloatField
      DisplayLabel = #36864#36135#25968#37327
      FieldName = 'QUANTITY'
    end
    object cdsMainUNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object cdsMainTDATE: TDateTimeField
      DisplayLabel = #36864#36135#26085#26399
      FieldName = 'TDATE'
    end
    object cdsMainExpr1: TStringField
      DisplayLabel = #36864#36135#20154
      FieldName = 'Expr1'
      Size = 16
    end
    object cdsMainremark: TWideStringField
      DisplayLabel = #36864#36135#22791#27880
      FieldName = 'remark'
      Size = 50
    end
    object cdsMainshipping_method: TWideStringField
      DisplayLabel = #35013#36816#26041#27861
      FieldName = 'shipping_method'
    end
    object cdsMaintran_date: TDateTimeField
      DisplayLabel = #35013#36816#26102#38388
      FieldName = 'tran_date'
    end
    object cdsMainv_state: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'v_state'
      ReadOnly = True
      Size = 6
    end
    object cdsMainEMPLOYEE_NAME: TStringField
      DisplayLabel = #35013#36816#20154
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object cdsMainCODE: TStringField
      DisplayLabel = #25298#25910#20195#30721
      FieldName = 'CODE'
      Size = 5
    end
    object cdsMainREJECT_DESCRIPTION: TStringField
      DisplayLabel = #25298#25910#21407#22240
      FieldName = 'REJECT_DESCRIPTION'
      Size = 30
    end
  end
end
