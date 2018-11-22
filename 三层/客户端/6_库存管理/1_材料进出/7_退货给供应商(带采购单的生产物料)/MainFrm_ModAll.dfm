inherited frmMain_Mod40Caller: TfrmMain_Mod40Caller
  Caption = 'frmMain_Mod40Caller'
  ClientHeight = 335
  ClientWidth = 748
  Font.Height = -13
  Font.Name = #23435#20307
  ExplicitWidth = 764
  ExplicitHeight = 374
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 748
    Height = 335
    ExplicitWidth = 748
    ExplicitHeight = 335
    inherited pnlDisplayMain: TPanel
      Width = 748
      Height = 335
      ExplicitWidth = 748
      ExplicitHeight = 335
      inherited pnlChildMain: TPanel
        Left = 153
        Width = 594
        Height = 333
        ExplicitLeft = 153
        ExplicitWidth = 594
        ExplicitHeight = 333
        inherited pnlEhMainDisplay: TPanel
          Width = 592
          Height = 302
          ExplicitWidth = 592
          ExplicitHeight = 302
          inherited ehMain: TDBGridEh
            Width = 590
            Height = 300
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 592
          ExplicitWidth = 592
          inherited lblFilter: TLabel
            Left = 463
            Width = 52
            ExplicitLeft = 463
            ExplicitWidth = 52
          end
        end
      end
      object tvJump: TTreeView
        Left = 1
        Top = 1
        Width = 152
        Height = 333
        Align = alLeft
        Indent = 19
        ReadOnly = True
        TabOrder = 1
        OnChange = tvJumpChange
        Items.NodeData = {
          03010000002A0000000000000000000000FFFFFFFFFFFFFFFF00000000000000
          000300000000060090278DD97E9B4F945E4655340000000000000000000000FF
          FFFFFFFFFFFFFF000000000000000000000000010B265EC7912D8D555384761F
          75A74E697299650090278D340000000000000000000000FFFFFFFFFFFFFFFF00
          0000000000000000000000010BE065C7912D8D555384761F75A74E6972996500
          90278D2C0000000000000000000000FFFFFFFFFFFFFFFF000000000000000000
          00000001075E971F75A74E697299650090278D}
      end
    end
  end
end
