inherited frmMain_Mod474Caller: TfrmMain_Mod474Caller
  Caption = 'frmMain_Mod474Caller'
  ClientHeight = 625
  ClientWidth = 767
  ExplicitWidth = 783
  ExplicitHeight = 664
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 767
    Height = 625
    ExplicitWidth = 767
    ExplicitHeight = 625
    inherited pnlDisplayMain: TPanel
      Width = 767
      Height = 625
      ExplicitWidth = 767
      ExplicitHeight = 625
      inherited pnlChildMain: TPanel
        Left = 182
        Width = 584
        Height = 623
        ExplicitLeft = 182
        ExplicitWidth = 584
        ExplicitHeight = 623
        inherited pnlEhMainDisplay: TPanel
          Width = 582
          Height = 592
          ExplicitWidth = 582
          ExplicitHeight = 592
          inherited ehMain: TDBGridEh
            Width = 580
            Height = 590
          end
        end
        inherited pnlTopOperator: TPanel
          Width = 582
          ExplicitWidth = 582
        end
      end
      object tvJump: TTreeView
        Left = 1
        Top = 1
        Width = 181
        Height = 623
        Align = alLeft
        Indent = 19
        TabOrder = 1
        OnChange = tvJumpChange
        Items.NodeData = {
          0301000000260000000000000000000000FFFFFFFFFFFFFFFF00000000000000
          00030000000104EF532875CD645C4F2A0000000000000000000000FFFFFFFFFF
          FFFFFF0000000000000000000000000106FB7CDF7E28753762A17B06742A0000
          000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000106FB
          7CDF7E216A5757A17B0674260000000000000000000000FFFFFFFFFFFFFFFF00
          00000000000000000000000104FB7CDF7EF466B065}
      end
    end
  end
  inherited pmMain: TPopupMenu
    Left = 192
  end
end
