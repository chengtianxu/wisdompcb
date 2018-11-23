inherited frmqk20004Main: Tfrmqk20004Main
  Caption = 'frmqk20004Main'
  ClientHeight = 705
  ClientWidth = 1086
  ExplicitWidth = 1102
  ExplicitHeight = 744
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlbase: TPanel
    Width = 1086
    Height = 705
    ExplicitWidth = 1086
    ExplicitHeight = 705
    inherited pnlbaseforGrid: TPanel
      Width = 1084
      Height = 703
      ExplicitWidth = 1084
      ExplicitHeight = 703
      inherited pnlbaseGrid: TPanel
        Width = 913
        Height = 677
        ExplicitWidth = 913
        ExplicitHeight = 677
        inherited eh1: TDBGridEh
          Width = 911
          Height = 675
          PopupMenu = pmMain
        end
      end
      inherited pnlTop: TPanel
        Width = 1082
        ExplicitWidth = 1082
        inherited lblModID: TLabel
          Left = 1025
          ExplicitLeft = 1025
        end
        inherited pnlFilter: TPanel
          Width = 545
          ExplicitWidth = 545
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
        Height = 677
        ExplicitHeight = 677
      end
    end
  end
end
