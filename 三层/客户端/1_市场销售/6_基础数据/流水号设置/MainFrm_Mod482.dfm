inherited frmMainFrm_Mod482: TfrmMainFrm_Mod482
  Caption = #27969#27700#21495#35774#32622
  ClientHeight = 529
  ClientWidth = 741
  ExplicitWidth = 757
  ExplicitHeight = 567
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 741
    Height = 529
    ExplicitWidth = 332
    ExplicitHeight = 453
    inherited pnlDisplayMain: TPanel
      Width = 741
      Height = 529
      ExplicitWidth = 332
      ExplicitHeight = 453
      inherited pnlChildMain: TPanel
        Width = 739
        Height = 527
        ExplicitWidth = 330
        ExplicitHeight = 451
        inherited pnlEhMainDisplay: TPanel
          Width = 737
          Height = 496
          ExplicitWidth = 328
          ExplicitHeight = 420
          inherited ehMain: TDBGridEh
            Width = 735
            Height = 494
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'layers'
                Footers = <>
                Title.Caption = #23618#25968
                Width = 109
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'sufchar'
                Footers = <>
                Title.Caption = #27969#27700#21495
                Width = 138
              end>
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 737
          ExplicitWidth = 328
          inherited btnExportToExcel: TBitBtn
            Visible = False
          end
          inherited btnQry: TBitBtn
            Visible = False
          end
          inherited btnZD: TBitBtn
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
    CommandText = 'SELECT rkey, layers, sufchar'#13#10'FROM data0081'#13#10'ORDER BY layers'
    Left = 400
  end
  inherited pmMain: TPopupMenu
    Left = 232
    Top = 144
    object N1: TMenuItem
      Caption = #26032#22686
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #32534#36753
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #21024#38500
      OnClick = N3Click
    end
  end
  object cdstemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 632
    Top = 120
  end
end
