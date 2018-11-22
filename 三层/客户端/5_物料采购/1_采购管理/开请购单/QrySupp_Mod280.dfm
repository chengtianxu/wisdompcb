inherited frmQrySupp_Mod280: TfrmQrySupp_Mod280
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #30456#20851#20379#24212#21830#26597#35810
  ClientHeight = 360
  ClientWidth = 658
  ExplicitWidth = 664
  ExplicitHeight = 385
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 658
    Height = 360
    ExplicitWidth = 658
    ExplicitHeight = 376
    inherited pnlDisplayMain: TPanel
      Width = 658
      Height = 360
      ExplicitWidth = 658
      ExplicitHeight = 376
      inherited pnlChildMain: TPanel
        Width = 656
        Height = 358
        ExplicitWidth = 656
        ExplicitHeight = 374
        inherited pnlEhMainDisplay: TPanel
          Width = 654
          Height = 321
          Align = alTop
          ExplicitWidth = 654
          ExplicitHeight = 321
          inherited ehMain: TDBGridEh
            Width = 652
            Height = 319
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'abbr_name'
                Footers = <>
                Title.Caption = #20379#24212#21830
                Width = 113
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'supper_statu'
                Footers = <>
                Title.Caption = #20379#24212#21830#29366#24577
                Width = 75
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'SUPPLIER_PART_NO'
                Footers = <>
                Title.Caption = #20379#24212#21830#26448#26009#22411#21495
                Width = 129
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'avl_flag'
                Footers = <>
                Title.Caption = #26159#21542#24050#35748#21487
                Width = 71
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'TDATE'
                Footers = <>
                Title.Caption = #24314#26723#26102#38388
                Width = 132
              end>
          end
        end
        object BtCan: TBitBtn
          Left = 272
          Top = 326
          Width = 70
          Height = 28
          Cancel = True
          Caption = #20851#38381
          ModalResult = 2
          NumGlyphs = 2
          TabOrder = 1
        end
      end
    end
  end
end
