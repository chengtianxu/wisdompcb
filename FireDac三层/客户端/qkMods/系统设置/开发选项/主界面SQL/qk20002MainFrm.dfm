inherited frmqk20002main: Tfrmqk20002main
  Caption = 'frmqk20002main'
  ClientHeight = 595
  ClientWidth = 1051
  ExplicitWidth = 1067
  ExplicitHeight = 634
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlbase: TPanel
    Width = 1051
    Height = 595
    ExplicitWidth = 1051
    ExplicitHeight = 595
    inherited pnlbaseforGrid: TPanel
      Width = 1049
      Height = 593
      ExplicitWidth = 1049
      ExplicitHeight = 593
      inherited pnlbaseGrid: TPanel
        Width = 878
        Height = 567
        ExplicitWidth = 878
        ExplicitHeight = 567
        inherited eh1: TDBGridEh
          Width = 876
          Height = 565
          PopupMenu = pmMain
        end
      end
      inherited pnlTop: TPanel
        Width = 1047
        ExplicitWidth = 1047
        inherited lblModID: TLabel
          Left = 990
          ExplicitLeft = 990
        end
        inherited pnlFilter: TPanel
          Width = 497
          ExplicitWidth = 497
          object lbl2: TLabel [2]
            Left = 338
            Top = 0
            Width = 60
            Height = 22
            Align = alLeft
            Caption = '   '#29992#36884#65306
            Layout = tlCenter
            ExplicitHeight = 13
          end
          object cbxUseFor: TComboBox
            Left = 398
            Top = 0
            Width = 83
            Height = 21
            Align = alLeft
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 1
            Text = #20027#30028#38754
            OnChange = cbxUseForChange
            Items.Strings = (
              #20027#30028#38754
              #25361#36873#26694
              #32534#36753)
          end
        end
      end
      inherited pnlWhere: TPanel
        Height = 567
        ExplicitHeight = 567
      end
    end
  end
end
