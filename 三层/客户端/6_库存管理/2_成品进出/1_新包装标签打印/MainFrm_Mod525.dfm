inherited frmMainMod_525: TfrmMainMod_525
  Caption = 'frmMainMod_525'
  ClientHeight = 600
  ClientWidth = 878
  ExplicitWidth = 894
  ExplicitHeight = 639
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 878
    Height = 600
    ExplicitWidth = 878
    ExplicitHeight = 600
    inherited pnlDisplayMain: TPanel
      Width = 878
      Height = 600
      ExplicitWidth = 878
      ExplicitHeight = 600
      inherited pnlChildMain: TPanel
        Width = 876
        Height = 598
        ExplicitWidth = 876
        ExplicitHeight = 598
        inherited pnlEhMainDisplay: TPanel
          Width = 874
          Height = 567
          ExplicitWidth = 874
          ExplicitHeight = 567
          inherited ehMain: TDBGridEh
            Width = 240
            Height = 565
            Align = alLeft
            OnDblClick = ehMainDblClick
            Columns = <
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PackID'
                Footers = <>
                Title.Caption = 'ID'
                Width = 30
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'ReportFile'
                Footers = <>
                Title.Caption = #26631#31614#21517
                Width = 120
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'PackType'
                Footers = <>
                KeyList.Strings = (
                  '0'
                  '1')
                PickList.Strings = (
                  #20869#31665
                  #22806#31665)
                Title.Caption = #20869#22806
                Width = 40
              end>
          end
          object pnl1: TPanel
            Left = 241
            Top = 1
            Width = 632
            Height = 565
            Align = alClient
            TabOrder = 1
            object pgcPackPrint: TRzPageControl
              Left = 1
              Top = 30
              Width = 630
              Height = 534
              Hint = ''
              Align = alClient
              ShowCloseButtonOnActiveTab = True
              TabOrder = 0
              OnClose = pgcPackPrintClose
              FixedDimension = 0
            end
            object pnl2: TPanel
              Left = 1
              Top = 1
              Width = 630
              Height = 29
              Align = alTop
              TabOrder = 1
              object lbl1: TLabel
                Left = 10
                Top = 6
                Width = 51
                Height = 16
                Caption = #25171#21360#26426
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = #23435#20307
                Font.Style = [fsBold]
                ParentFont = False
              end
              object cbxPrinter: TRzComboBox
                Left = 66
                Top = 4
                Width = 223
                Height = 21
                Style = csDropDownList
                TabOrder = 0
              end
            end
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 874
          ExplicitWidth = 874
          inherited btnDY: TBitBtn
            Visible = True
            OnClick = btnDYClick
          end
        end
      end
    end
  end
  inherited cdsMain: TClientDataSet
    CommandText = 'SELECT PT.* FROM Pack_PrintType PT'#13#10'Where 1=1 '
    Left = 80
    Top = 176
  end
  inherited pmZD: TPopupMenu
    Left = 232
    Top = 56
  end
  inherited pmMain: TPopupMenu
    object mniDesignTag: TMenuItem
      Caption = #35774#35745#26631#31614
      OnClick = mniDesignTagClick
    end
    object mniPrintHistory: TMenuItem
      Caption = #25171#21360#21382#21490
      OnClick = mniPrintHistoryClick
    end
  end
  inherited cdsMainWhereInit: TClientDataSet
    Left = 232
    Top = 104
  end
end
