inherited Mainfrm_Mod86: TMainfrm_Mod86
  Caption = #24037#20855#36153#29992#31867#21035
  ClientHeight = 427
  ClientWidth = 649
  ExplicitWidth = 665
  ExplicitHeight = 465
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 649
    Height = 427
    ExplicitWidth = 649
    ExplicitHeight = 427
    inherited pnlDisplayMain: TPanel
      Width = 649
      Height = 427
      ExplicitWidth = 649
      ExplicitHeight = 427
      inherited pnlChildMain: TPanel
        Width = 647
        Height = 425
        ExplicitWidth = 647
        ExplicitHeight = 425
        inherited pnlEhMainDisplay: TPanel
          Width = 645
          Height = 394
          ExplicitWidth = 645
          ExplicitHeight = 394
          inherited ehMain: TDBGridEh
            Width = 643
            Height = 392
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CATEGORY'
                Footers = <>
                Title.Caption = #31867#21035#21517#31216
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PTR_TO_GL_ACCT'
                Footers = <>
                Title.Caption = #36134#30446#20195#30721
                Width = 90
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'TAX_FLAG'
                Footers = <>
                Title.Caption = #24449#31246
                Width = 69
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'COMMISSION_FLAG'
                Footers = <>
                Title.Caption = #20323#37329
                Width = 66
              end>
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 645
          ExplicitWidth = 645
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 'SELECT     *FROM     Data0061 '
  end
  inherited pmZD: TPopupMenu
    Left = 224
    Top = 8
  end
  inherited pmMain: TPopupMenu
    object N_Add: TMenuItem
      Caption = #26032#22686
      OnClick = N_AddClick
    end
    object N_Edit: TMenuItem
      Caption = #32534#36753
      OnClick = N_EditClick
    end
    object N_Delete: TMenuItem
      Caption = #21024#38500
      OnClick = N_DeleteClick
    end
  end
  object cdstemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 549
    Top = 144
  end
end
