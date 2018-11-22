inherited FrmDetail_Mod40: TFrmDetail_Mod40
  Caption = #36864#36135#26126#32454
  ClientHeight = 354
  ClientWidth = 724
  Font.Height = -13
  Font.Name = #23435#20307
  OnClose = FormClose
  ExplicitWidth = 732
  ExplicitHeight = 388
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 724
    Height = 354
    ExplicitWidth = 724
    ExplicitHeight = 354
    inherited pnlDisplayMain: TPanel
      Width = 724
      Height = 354
      ExplicitWidth = 724
      ExplicitHeight = 354
      inherited pnlChildMain: TPanel
        Width = 722
        Height = 352
        ExplicitWidth = 722
        ExplicitHeight = 352
        inherited pnlEhMainDisplay: TPanel
          Width = 720
          Height = 350
          ExplicitWidth = 720
          ExplicitHeight = 350
          inherited ehMain: TDBGridEh
            Width = 718
            Height = 348
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_PART_NUMBER'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_PART_DESCRIPTION'
                Footers = <>
                Width = 245
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'INV_NAME'
                Footers = <>
                Width = 139
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ABBR_NAME'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'QUAN_REJD'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'UNIT_NAME'
                Footers = <>
                Width = 53
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
                FieldName = 'EMPLOYEE_NAME'
                Footers = <>
                Width = 63
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'SHIPPING_METHOD'
                Footers = <>
                Width = 73
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'TRAN_DATE'
                Footers = <>
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'v_state'
                Footers = <>
                Width = 50
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'Expr1'
                Footers = <>
                Width = 66
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CODE'
                Footers = <>
                Width = 57
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'REJECT_DESCRIPTION'
                Footers = <>
                Width = 145
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'REFERENCE_NUMBER'
                Footers = <>
              end>
          end
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    ProviderName = 'DataSetProvider1'
    object cdsMainINV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#20195#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object cdsMainINV_PART_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#25551#36848
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object cdsMainINV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object cdsMainABBR_NAME: TStringField
      DisplayLabel = #24037#21378#21517#31216
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object cdsMainQUAN_REJD: TFloatField
      DisplayLabel = #36864#36135#25968#37327
      FieldName = 'QUAN_REJD'
    end
    object cdsMainUNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object cdsMainTDATE: TDateTimeField
      DisplayLabel = #36864#36135#26085#26399
      FieldName = 'TDATE'
    end
    object cdsMainEMPLOYEE_NAME: TStringField
      DisplayLabel = #36864#36135#20154
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object cdsMainREFERENCE_NUMBER: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REFERENCE_NUMBER'
      FixedChar = True
    end
    object cdsMainSHIPPING_METHOD: TWideStringField
      DisplayLabel = #35013#36816#26041#27861
      FieldName = 'SHIPPING_METHOD'
    end
    object cdsMainTRAN_DATE: TDateTimeField
      DisplayLabel = #35013#36816#26085#26399
      FieldName = 'TRAN_DATE'
    end
    object cdsMainv_state: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'v_state'
      ReadOnly = True
      Size = 6
    end
    object cdsMainExpr1: TStringField
      DisplayLabel = #35013#36816#20154
      FieldName = 'Expr1'
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
